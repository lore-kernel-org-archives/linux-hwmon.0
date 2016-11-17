Return-path: <bigeasy@linutronix.de>
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: rt@linuxtronix.de,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 04/20] hwmon/coretemp: Convert to hotplug state machine
Date: Thu, 17 Nov 2016 19:35:25 +0100
Message-Id: <20161117183541.8588-5-bigeasy@linutronix.de>
In-Reply-To: <20161117183541.8588-1-bigeasy@linutronix.de>
References: <20161117183541.8588-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Install the callbacks via the state machine. Setup and teardown are handled
by the hotplug core.

Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/hwmon/coretemp.c | 74 +++++++++++++++-----------------------------=
----
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 6a27eb2fed17..390038884f9e 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -676,7 +676,7 @@ static bool is_any_core_online(struct platform_data *pd=
ata)
 	return false;
 }
=20
-static void get_core_online(unsigned int cpu)
+static int coretemp_cpu_online(unsigned int cpu)
 {
 	struct cpuinfo_x86 *c =3D &cpu_data(cpu);
 	struct platform_device *pdev =3D coretemp_get_pdev(cpu);
@@ -688,12 +688,12 @@ static void get_core_online(unsigned int cpu)
 	 * without thermal sensors will be filtered out.
 	 */
 	if (!cpu_has(c, X86_FEATURE_DTHERM))
-		return;
+		return 0;
=20
 	if (!pdev) {
 		/* Check the microcode version of the CPU */
 		if (chk_ucode_version(cpu))
-			return;
+			return 0;
=20
 		/*
 		 * Alright, we have DTS support.
@@ -703,7 +703,7 @@ static void get_core_online(unsigned int cpu)
 		 */
 		err =3D coretemp_device_add(cpu);
 		if (err)
-			return;
+			return 0;
 		/*
 		 * Check whether pkgtemp support is available.
 		 * If so, add interfaces for pkgtemp.
@@ -716,9 +716,10 @@ static void get_core_online(unsigned int cpu)
 	 * So, just add interfaces for this core.
 	 */
 	coretemp_add_core(cpu, 0);
+	return 0;
 }
=20
-static void put_core_offline(unsigned int cpu)
+static int coretemp_cpu_offline(unsigned int cpu)
 {
 	int i, indx;
 	struct platform_data *pdata;
@@ -726,7 +727,7 @@ static void put_core_offline(unsigned int cpu)
=20
 	/* If the physical CPU device does not exist, just return */
 	if (!pdev)
-		return;
+		return 0;
=20
 	pdata =3D platform_get_drvdata(pdev);
=20
@@ -734,7 +735,7 @@ static void put_core_offline(unsigned int cpu)
=20
 	/* The core id is too big, just return */
 	if (indx > MAX_CORE_DATA - 1)
-		return;
+		return 0;
=20
 	if (pdata->core_data[indx] && pdata->core_data[indx]->cpu =3D=3D cpu)
 		coretemp_remove_core(pdata, indx);
@@ -747,7 +748,7 @@ static void put_core_offline(unsigned int cpu)
 	 */
 	for_each_sibling(i, cpu) {
 		if (i !=3D cpu) {
-			get_core_online(i);
+			coretemp_cpu_online(i);
 			/*
 			 * Display temperature sensor data for one HT sibling
 			 * per core only, so abort the loop after one such
@@ -764,38 +765,20 @@ static void put_core_offline(unsigned int cpu)
 	 */
 	if (!is_any_core_online(pdata))
 		coretemp_device_remove(cpu);
+	return 0;
 }
=20
-static int coretemp_cpu_callback(struct notifier_block *nfb,
-				 unsigned long action, void *hcpu)
-{
-	unsigned int cpu =3D (unsigned long) hcpu;
-
-	switch (action) {
-	case CPU_ONLINE:
-	case CPU_DOWN_FAILED:
-		get_core_online(cpu);
-		break;
-	case CPU_DOWN_PREPARE:
-		put_core_offline(cpu);
-		break;
-	}
-	return NOTIFY_OK;
-}
-
-static struct notifier_block coretemp_cpu_notifier __refdata =3D {
-	.notifier_call =3D coretemp_cpu_callback,
-};
-
 static const struct x86_cpu_id __initconst coretemp_ids[] =3D {
 	{ X86_VENDOR_INTEL, X86_FAMILY_ANY, X86_MODEL_ANY, X86_FEATURE_DTHERM },
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, coretemp_ids);
=20
+static enum cpuhp_state coretemp_hp_online;
+
 static int __init coretemp_init(void)
 {
-	int i, err;
+	int err;
=20
 	/*
 	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
@@ -809,44 +792,33 @@ static int __init coretemp_init(void)
 	if (err)
 		goto exit;
=20
-	cpu_notifier_register_begin();
-	for_each_online_cpu(i)
-		get_core_online(i);
+	err =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "hwmon/coretemp:online",
+				coretemp_cpu_online, coretemp_cpu_offline);
+	if (err < 0)
+		goto exit_driver_unreg;
+	coretemp_hp_online =3D err;
=20
 #ifndef CONFIG_HOTPLUG_CPU
 	if (list_empty(&pdev_list)) {
-		cpu_notifier_register_done();
 		err =3D -ENODEV;
-		goto exit_driver_unreg;
+		goto exit_hp_unreg;
 	}
 #endif
-
-	__register_hotcpu_notifier(&coretemp_cpu_notifier);
-	cpu_notifier_register_done();
 	return 0;
=20
 #ifndef CONFIG_HOTPLUG_CPU
+exit_hp_unreg:
+	cpuhp_remove_state(coretemp_hp_online);
+#endif
 exit_driver_unreg:
 	platform_driver_unregister(&coretemp_driver);
-#endif
 exit:
 	return err;
 }
=20
 static void __exit coretemp_exit(void)
 {
-	struct pdev_entry *p, *n;
-
-	cpu_notifier_register_begin();
-	__unregister_hotcpu_notifier(&coretemp_cpu_notifier);
-	mutex_lock(&pdev_list_mutex);
-	list_for_each_entry_safe(p, n, &pdev_list, list) {
-		platform_device_unregister(p->pdev);
-		list_del(&p->list);
-		kfree(p);
-	}
-	mutex_unlock(&pdev_list_mutex);
-	cpu_notifier_register_done();
+	cpuhp_remove_state(coretemp_hp_online);
 	platform_driver_unregister(&coretemp_driver);
 }
=20
--=20
2.10.2
