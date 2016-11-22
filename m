Return-path: <tglx@linutronix.de>
Message-Id: <20161122173731.920061058@linutronix.de>
Date: Tue, 22 Nov 2016 17:42:06 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: [patch 6/6] hwmon/coretemp: Simplify package management
References: <20161122173622.771252945@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline;
 filename=hwmon-coretemp--Simplify-package-management.patch
List-ID: <linux-hwmon@vger.kernel.org>

Keeping track of the per package platform devices requires an extra object,
which is held in a linked list.

The maximum number of packages is known at init() time. So the extra object
and linked list management can be replaced by an array of platform device
pointers in which the per package devices pointers can be stored. Lookup
becomes a simple array lookup instead of a list walk.

The mutex protecting the list can be removed as well because the array is
only accessed from cpu hotplug callbacks which are already serialized.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/hwmon/coretemp.c |  120 ++++++++++++++---------------------------------
 1 file changed, 38 insertions(+), 82 deletions(-)

--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -59,7 +59,6 @@ MODULE_PARM_DESC(tjmax, "TjMax value in
 #define TOTAL_ATTRS		(MAX_CORE_ATTRS + 1)
 #define MAX_CORE_DATA		(NUM_REAL_CORES + BASE_SYSFS_ATTR_NO)
 
-#define TO_PHYS_ID(cpu)		(cpu_data(cpu).phys_proc_id)
 #define TO_CORE_ID(cpu)		(cpu_data(cpu).cpu_core_id)
 #define TO_ATTR_NO(cpu)		(TO_CORE_ID(cpu) + BASE_SYSFS_ATTR_NO)
 
@@ -104,20 +103,16 @@ struct temp_data {
 /* Platform Data per Physical CPU */
 struct platform_data {
 	struct device		*hwmon_dev;
-	u16			phys_proc_id;
+	u16			pkg_id;
 	struct cpumask		cpumask;
 	struct temp_data	*core_data[MAX_CORE_DATA];
 	struct device_attribute name_attr;
 };
 
-struct pdev_entry {
-	struct list_head list;
-	struct platform_device *pdev;
-	u16 phys_proc_id;
-};
-
-static LIST_HEAD(pdev_list);
-static DEFINE_MUTEX(pdev_list_mutex);
+/* Keep track of how many package pointers we allocated in init() */
+static int max_packages __read_mostly;
+/* Array of package pointers. Serialized by cpu hotplug lock */
+static struct platform_device **pkg_devices;
 
 static ssize_t show_label(struct device *dev,
 				struct device_attribute *devattr, char *buf)
@@ -127,7 +122,7 @@ static ssize_t show_label(struct device
 	struct temp_data *tdata = pdata->core_data[attr->index];
 
 	if (tdata->is_pkg_data)
-		return sprintf(buf, "Physical id %u\n", pdata->phys_proc_id);
+		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
 
 	return sprintf(buf, "Core %u\n", tdata->cpu_core_id);
 }
@@ -439,18 +434,10 @@ static int chk_ucode_version(unsigned in
 
 static struct platform_device *coretemp_get_pdev(unsigned int cpu)
 {
-	u16 phys_proc_id = TO_PHYS_ID(cpu);
-	struct pdev_entry *p;
-
-	mutex_lock(&pdev_list_mutex);
+	int pkgid = topology_logical_package_id(cpu);
 
-	list_for_each_entry(p, &pdev_list, list)
-		if (p->phys_proc_id == phys_proc_id) {
-			mutex_unlock(&pdev_list_mutex);
-			return p->pdev;
-		}
-
-	mutex_unlock(&pdev_list_mutex);
+	if (pkgid >= 0 && pkgid < max_packages)
+		return pkg_devices[pkgid];
 	return NULL;
 }
 
@@ -561,7 +548,7 @@ static int coretemp_probe(struct platfor
 	if (!pdata)
 		return -ENOMEM;
 
-	pdata->phys_proc_id = pdev->id;
+	pdata->pkg_id = pdev->id;
 	platform_set_drvdata(pdev, pdata);
 
 	pdata->hwmon_dev = devm_hwmon_device_register_with_groups(dev, DRVNAME,
@@ -589,64 +576,26 @@ static struct platform_driver coretemp_d
 	.remove = coretemp_remove,
 };
 
-static int coretemp_device_add(unsigned int cpu)
+static struct platform_device *coretemp_device_add(unsigned int cpu)
 {
-	int err;
+	int err, pkgid = topology_logical_package_id(cpu);
 	struct platform_device *pdev;
-	struct pdev_entry *pdev_entry;
 
-	mutex_lock(&pdev_list_mutex);
+	if (pkgid < 0)
+		return ERR_PTR(-ENOMEM);
 
-	pdev = platform_device_alloc(DRVNAME, TO_PHYS_ID(cpu));
-	if (!pdev) {
-		err = -ENOMEM;
-		pr_err("Device allocation failed\n");
-		goto exit;
-	}
-
-	pdev_entry = kzalloc(sizeof(struct pdev_entry), GFP_KERNEL);
-	if (!pdev_entry) {
-		err = -ENOMEM;
-		goto exit_device_put;
-	}
+	pdev = platform_device_alloc(DRVNAME, pkgid);
+	if (!pdev)
+		return ERR_PTR(-ENOMEM);
 
 	err = platform_device_add(pdev);
 	if (err) {
-		pr_err("Device addition failed (%d)\n", err);
-		goto exit_device_free;
+		platform_device_put(pdev);
+		return ERR_PTR(err);
 	}
 
-	pdev_entry->pdev = pdev;
-	pdev_entry->phys_proc_id = pdev->id;
-
-	list_add_tail(&pdev_entry->list, &pdev_list);
-	mutex_unlock(&pdev_list_mutex);
-
-	return 0;
-
-exit_device_free:
-	kfree(pdev_entry);
-exit_device_put:
-	platform_device_put(pdev);
-exit:
-	mutex_unlock(&pdev_list_mutex);
-	return err;
-}
-
-static void coretemp_device_remove(unsigned int cpu)
-{
-	struct pdev_entry *p, *n;
-	u16 phys_proc_id = TO_PHYS_ID(cpu);
-
-	mutex_lock(&pdev_list_mutex);
-	list_for_each_entry_safe(p, n, &pdev_list, list) {
-		if (p->phys_proc_id != phys_proc_id)
-			continue;
-		platform_device_unregister(p->pdev);
-		list_del(&p->list);
-		kfree(p);
-	}
-	mutex_unlock(&pdev_list_mutex);
+	pkg_devices[pkgid] = pdev;
+	return pdev;
 }
 
 static int coretemp_cpu_online(unsigned int cpu)
@@ -654,7 +603,6 @@ static int coretemp_cpu_online(unsigned
 	struct platform_device *pdev = coretemp_get_pdev(cpu);
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	struct platform_data *pdata;
-	int err;
 
 	/*
 	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
@@ -675,11 +623,10 @@ static int coretemp_cpu_online(unsigned
 		 * online. So, initialize per-pkg data structures and
 		 * then bring this core online.
 		 */
-		err = coretemp_device_add(cpu);
-		if (err)
-			return err;
+		pdev = coretemp_device_add(cpu);
+		if (IS_ERR(pdev))
+			return PTR_ERR(pdev);
 
-		pdev = coretemp_get_pdev(cpu);
 		/*
 		 * Check whether pkgtemp support is available.
 		 * If so, add interfaces for pkgtemp.
@@ -736,15 +683,16 @@ static int coretemp_cpu_offline(unsigned
 	}
 
 	/*
-	 * If all cores in this pkg are offline, remove the device.
-	 * coretemp_device_remove calls unregister_platform_device,
-	 * which in turn calls coretemp_remove. This removes the
-	 * pkgtemp entry and does other clean ups.
+	 * If all cores in this pkg are offline, remove the device. This
+	 * will invoke the platform driver remove function, which cleans up
+	 * the rest.
 	 */
 	if (cpumask_empty(&pd->cpumask)) {
-		coretemp_device_remove(cpu);
+		pkg_devices[topology_logical_package_id(cpu)] = NULL;
+		platform_device_unregister(pdev);
 		return 0;
 	}
+
 	/*
 	 * Check whether this core is the target for the package
 	 * interface. We need to assign it to some other cpu.
@@ -778,6 +726,12 @@ static int __init coretemp_init(void)
 	if (!x86_match_cpu(coretemp_ids))
 		return -ENODEV;
 
+	max_packages = topology_max_packages();
+	pkg_devices = kzalloc(max_packages * sizeof(struct platform_device *),
+			      GFP_KERNEL);
+	if (!pkg_devices)
+		return -ENOMEM;
+
 	err = platform_driver_register(&coretemp_driver);
 	if (err)
 		return err;
@@ -791,6 +745,7 @@ static int __init coretemp_init(void)
 
 outdrv:
 	platform_driver_unregister(&coretemp_driver);
+	kfree(pkg_devices);
 	return err;
 }
 module_init(coretemp_init)
@@ -799,6 +754,7 @@ static void __exit coretemp_exit(void)
 {
 	cpuhp_remove_state(coretemp_hp_online);
 	platform_driver_unregister(&coretemp_driver);
+	kfree(pkg_devices);
 }
 module_exit(coretemp_exit)
 
