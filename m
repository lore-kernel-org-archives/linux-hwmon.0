Return-path: <tglx@linutronix.de>
Message-Id: <20161122173731.596136623@linutronix.de>
Date: Tue, 22 Nov 2016 17:42:02 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: [patch 2/6] hwmon/coretemp: Simplify sibling management
References: <20161122173622.771252945@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline;
 filename=hwmon-coretemp--Simplify-sibling-management.patch
List-ID: <linux-hwmon@vger.kernel.org>

The coretemp driver provides a sysfs interface per physical core. If
hyperthreading is enabled and one of the siblings goes offline the sysfs
interface is removed and then immeditately created again for the
sibling. The only difference of them is the target cpu for the
rdmsr_on_cpu() in the sysfs show functions.

It's way simpler to keep a cpumask of cpus which are active in a package
and only remove the interface when the last sibling goes offline. Otherwise
just move the target cpu for the sysfs show functions to the still online
sibling.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/hwmon/coretemp.c |   95 ++++++++++++++++++-----------------------------
 1 file changed, 38 insertions(+), 57 deletions(-)

--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -103,9 +103,10 @@ struct temp_data {
 
 /* Platform Data per Physical CPU */
 struct platform_data {
-	struct device *hwmon_dev;
-	u16 phys_proc_id;
-	struct temp_data *core_data[MAX_CORE_DATA];
+	struct device		*hwmon_dev;
+	u16			phys_proc_id;
+	struct cpumask		cpumask;
+	struct temp_data	*core_data[MAX_CORE_DATA];
 	struct device_attribute name_attr;
 };
 
@@ -491,16 +492,6 @@ static int create_core_data(struct platf
 	if (attr_no > MAX_CORE_DATA - 1)
 		return -ERANGE;
 
-	/*
-	 * Provide a single set of attributes for all HT siblings of a core
-	 * to avoid duplicate sensors (the processor ID and core ID of all
-	 * HT siblings of a core are the same).
-	 * Skip if a HT sibling of this core is already registered.
-	 * This is not an error.
-	 */
-	if (pdata->core_data[attr_no] != NULL)
-		return 0;
-
 	tdata = init_temp_data(cpu, pkg_flag);
 	if (!tdata)
 		return -ENOMEM;
@@ -665,24 +656,11 @@ static void coretemp_device_remove(unsig
 	mutex_unlock(&pdev_list_mutex);
 }
 
-static int get_online_core_in_package(struct platform_data *pdata)
-{
-	int i;
-
-	/* Find online cores, except pkgtemp data */
-	for (i = MAX_CORE_DATA - 1; i >= 0; --i) {
-		if (pdata->core_data[i] &&
-			!pdata->core_data[i]->is_pkg_data) {
-			return pdata->core_data[i]->cpu;
-		}
-	}
-	return nr_cpu_ids;
-}
-
 static void get_core_online(unsigned int cpu)
 {
-	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	struct platform_device *pdev = coretemp_get_pdev(cpu);
+	struct cpuinfo_x86 *c = &cpu_data(cpu);
+	struct platform_data *pdata;
 	int err;
 
 	/*
@@ -707,6 +685,8 @@ static void get_core_online(unsigned int
 		err = coretemp_device_add(cpu);
 		if (err)
 			return;
+
+		pdev = coretemp_get_pdev(cpu);
 		/*
 		 * Check whether pkgtemp support is available.
 		 * If so, add interfaces for pkgtemp.
@@ -714,60 +694,60 @@ static void get_core_online(unsigned int
 		if (cpu_has(c, X86_FEATURE_PTS))
 			coretemp_add_core(cpu, 1);
 	}
+
+	pdata = platform_get_drvdata(pdev);
 	/*
-	 * Physical CPU device already exists.
-	 * So, just add interfaces for this core.
+	 * Check whether a thread sibling is already online. If not add the
+	 * interface for this CPU core.
 	 */
-	coretemp_add_core(cpu, 0);
+	if (!cpumask_intersects(&pdata->cpumask, topology_sibling_cpumask(cpu)))
+		coretemp_add_core(cpu, 0);
+
+	cpumask_set_cpu(cpu, &pdata->cpumask);
 }
 
 static void put_core_offline(unsigned int cpu)
 {
 	struct platform_device *pdev = coretemp_get_pdev(cpu);
-	struct platform_data *pdata;
+	struct platform_data *pd;
 	struct temp_data *tdata;
-	int i, indx, target;
+	int indx, target;
 
 	/* If the physical CPU device does not exist, just return */
 	if (!pdev)
 		return;
 
-	pdata = platform_get_drvdata(pdev);
-
-	indx = TO_ATTR_NO(cpu);
-
 	/* The core id is too big, just return */
+	indx = TO_ATTR_NO(cpu);
 	if (indx > MAX_CORE_DATA - 1)
 		return;
 
-	if (pdata->core_data[indx] && pdata->core_data[indx]->cpu == cpu)
-		coretemp_remove_core(pdata, indx);
+	pd = platform_get_drvdata(pdev);
+	tdata = pd->core_data[indx];
+
+	cpumask_clear_cpu(cpu, &pd->cpumask);
 
 	/*
-	 * If a HT sibling of a core is taken offline, but another HT sibling
-	 * of the same core is still online, register the alternate sibling.
-	 * This ensures that exactly one set of attributes is provided as long
-	 * as at least one HT sibling of a core is online.
-	 */
-	for_each_sibling(i, cpu) {
-		if (i != cpu) {
-			get_core_online(i);
-			/*
-			 * Display temperature sensor data for one HT sibling
-			 * per core only, so abort the loop after one such
-			 * sibling has been found.
-			 */
-			break;
-		}
+	 * If this is the last thread sibling, remove the CPU core
+	 * interface, If there is still a sibling online, transfer the
+	 * target cpu of that core interface to it.
+	 */
+	target = cpumask_any_and(&pd->cpumask, topology_sibling_cpumask(cpu));
+	if (target >= nr_cpu_ids) {
+		coretemp_remove_core(pd, indx);
+	} else if (tdata && tdata->cpu == cpu) {
+		mutex_lock(&tdata->update_lock);
+		tdata->cpu = target;
+		mutex_unlock(&tdata->update_lock);
 	}
+
 	/*
 	 * If all cores in this pkg are offline, remove the device.
 	 * coretemp_device_remove calls unregister_platform_device,
 	 * which in turn calls coretemp_remove. This removes the
 	 * pkgtemp entry and does other clean ups.
 	 */
-	target = get_online_core_in_package(pdata);
-	if (target >= nr_cpu_ids) {
+	if (cpumask_empty(&pd->cpumask)) {
 		coretemp_device_remove(cpu);
 		return;
 	}
@@ -775,8 +755,9 @@ static void put_core_offline(unsigned in
 	 * Check whether this core is the target for the package
 	 * interface. We need to assign it to some other cpu.
 	 */
-	tdata = pdata->core_data[PKG_SYSFS_ATTR_NO];
+	tdata = pd->core_data[PKG_SYSFS_ATTR_NO];
 	if (tdata && tdata->cpu == cpu) {
+		target = cpumask_first(&pd->cpumask);
 		mutex_lock(&tdata->update_lock);
 		tdata->cpu = target;
 		mutex_unlock(&tdata->update_lock);
