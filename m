Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60391 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756323AbcKVRpd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2016 12:45:33 -0500
Message-Id: <20161122173731.514672833@linutronix.de>
Date: Tue, 22 Nov 2016 17:42:02 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: [patch 1/6] hwmon/coretemp: Fixup target cpu for package when cpu is
 offlined
References: <20161122173622.771252945@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline;
 filename=hwmon-coretemp--Fixup-target-cpu-for-package-when-cpu-is-offlined.patch
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

When a CPU is offlined nothing checks whether it is the target CPU for the
package temperature sysfs interface.

As a consequence all future readouts of the package temperature return
crap:

# cat temp1_input
90000

which is Tjmax of that package.

Check whether the outgoing CPU is the target for the package and assign it
to some other still online CPU in the package. Protect the change against
the rdmsr_on_cpu() in show_crit_alarm().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/hwmon/coretemp.c |   31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -51,6 +51,7 @@ static int force_tjmax;
 module_param_named(tjmax, force_tjmax, int, 0444);
 MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
 
+#define PKG_SYSFS_ATTR_NO	1	/* Sysfs attribute for package temp */
 #define BASE_SYSFS_ATTR_NO	2	/* Sysfs Base attr no for coretemp */
 #define NUM_REAL_CORES		128	/* Number of Real cores per cpu */
 #define CORETEMP_NAME_LENGTH	19	/* String Length of attrs */
@@ -138,7 +139,9 @@ static ssize_t show_crit_alarm(struct de
 	struct platform_data *pdata = dev_get_drvdata(dev);
 	struct temp_data *tdata = pdata->core_data[attr->index];
 
+	mutex_lock(&tdata->update_lock);
 	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
+	mutex_unlock(&tdata->update_lock);
 
 	return sprintf(buf, "%d\n", (eax >> 5) & 1);
 }
@@ -483,7 +486,7 @@ static int create_core_data(struct platf
 	 * The attr number is always core id + 2
 	 * The Pkgtemp will always show up as temp1_*, if available
 	 */
-	attr_no = pkg_flag ? 1 : TO_ATTR_NO(cpu);
+	attr_no = pkg_flag ? PKG_SYSFS_ATTR_NO : TO_ATTR_NO(cpu);
 
 	if (attr_no > MAX_CORE_DATA - 1)
 		return -ERANGE;
@@ -662,7 +665,7 @@ static void coretemp_device_remove(unsig
 	mutex_unlock(&pdev_list_mutex);
 }
 
-static bool is_any_core_online(struct platform_data *pdata)
+static int get_online_core_in_package(struct platform_data *pdata)
 {
 	int i;
 
@@ -670,10 +673,10 @@ static bool is_any_core_online(struct pl
 	for (i = MAX_CORE_DATA - 1; i >= 0; --i) {
 		if (pdata->core_data[i] &&
 			!pdata->core_data[i]->is_pkg_data) {
-			return true;
+			return pdata->core_data[i]->cpu;
 		}
 	}
-	return false;
+	return nr_cpu_ids;
 }
 
 static void get_core_online(unsigned int cpu)
@@ -720,9 +723,10 @@ static void get_core_online(unsigned int
 
 static void put_core_offline(unsigned int cpu)
 {
-	int i, indx;
-	struct platform_data *pdata;
 	struct platform_device *pdev = coretemp_get_pdev(cpu);
+	struct platform_data *pdata;
+	struct temp_data *tdata;
+	int i, indx, target;
 
 	/* If the physical CPU device does not exist, just return */
 	if (!pdev)
@@ -762,8 +766,21 @@ static void put_core_offline(unsigned in
 	 * which in turn calls coretemp_remove. This removes the
 	 * pkgtemp entry and does other clean ups.
 	 */
-	if (!is_any_core_online(pdata))
+	target = get_online_core_in_package(pdata);
+	if (target >= nr_cpu_ids) {
 		coretemp_device_remove(cpu);
+		return;
+	}
+	/*
+	 * Check whether this core is the target for the package
+	 * interface. We need to assign it to some other cpu.
+	 */
+	tdata = pdata->core_data[PKG_SYSFS_ATTR_NO];
+	if (tdata && tdata->cpu == cpu) {
+		mutex_lock(&tdata->update_lock);
+		tdata->cpu = target;
+		mutex_unlock(&tdata->update_lock);
+	}
 }
 
 static int coretemp_cpu_callback(struct notifier_block *nfb,


