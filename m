Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60394 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756344AbcKVRpf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2016 12:45:35 -0500
Message-Id: <20161122173731.759852746@linutronix.de>
Date: Tue, 22 Nov 2016 17:42:04 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        rt@linuxtronix.de
Subject: [patch 4/6] [PREEMPT-RT] hwmon/coretemp: Convert to hotplug state
 machine
References: <20161122173622.771252945@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline;
 filename=hwmon-coretemp--Convert_to_hotplug_state_machine.patch
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Install the callbacks via the state machine. Setup and teardown are handled
by the hotplug core.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-hwmon@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: rt@linuxtronix.de
Cc: Guenter Roeck <linux@roeck-us.net>
Link: http://lkml.kernel.org/r/20161117183541.8588-5-bigeasy@linutronix.de

---
 drivers/hwmon/coretemp.c |   86 +++++++++++++++--------------------------------
 1 file changed, 29 insertions(+), 57 deletions(-)

--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -649,7 +649,7 @@ static void coretemp_device_remove(unsig
 	mutex_unlock(&pdev_list_mutex);
 }
 
-static void get_core_online(unsigned int cpu)
+static int coretemp_cpu_online(unsigned int cpu)
 {
 	struct platform_device *pdev = coretemp_get_pdev(cpu);
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
@@ -662,12 +662,12 @@ static void get_core_online(unsigned int
 	 * without thermal sensors will be filtered out.
 	 */
 	if (!cpu_has(c, X86_FEATURE_DTHERM))
-		return;
+		return 0;
 
 	if (!pdev) {
 		/* Check the microcode version of the CPU */
 		if (chk_ucode_version(cpu))
-			return;
+			return 0;
 
 		/*
 		 * Alright, we have DTS support.
@@ -677,7 +677,7 @@ static void get_core_online(unsigned int
 		 */
 		err = coretemp_device_add(cpu);
 		if (err)
-			return;
+			return 0;
 
 		pdev = coretemp_get_pdev(cpu);
 		/*
@@ -697,9 +697,10 @@ static void get_core_online(unsigned int
 		coretemp_add_core(pdev, cpu, 0);
 
 	cpumask_set_cpu(cpu, &pdata->cpumask);
+	return 0;
 }
 
-static void put_core_offline(unsigned int cpu)
+static int coretemp_cpu_offline(unsigned int cpu)
 {
 	struct platform_device *pdev = coretemp_get_pdev(cpu);
 	struct platform_data *pd;
@@ -708,12 +709,12 @@ static void put_core_offline(unsigned in
 
 	/* If the physical CPU device does not exist, just return */
 	if (!pdev)
-		return;
+		return 0;
 
 	/* The core id is too big, just return */
 	indx = TO_ATTR_NO(cpu);
 	if (indx > MAX_CORE_DATA - 1)
-		return;
+		return 0;
 
 	pd = platform_get_drvdata(pdev);
 	tdata = pd->core_data[indx];
@@ -742,7 +743,7 @@ static void put_core_offline(unsigned in
 	 */
 	if (cpumask_empty(&pd->cpumask)) {
 		coretemp_device_remove(cpu);
-		return;
+		return 0;
 	}
 	/*
 	 * Check whether this core is the target for the package
@@ -755,38 +756,19 @@ static void put_core_offline(unsigned in
 		tdata->cpu = target;
 		mutex_unlock(&tdata->update_lock);
 	}
+	return 0;
 }
-
-static int coretemp_cpu_callback(struct notifier_block *nfb,
-				 unsigned long action, void *hcpu)
-{
-	unsigned int cpu = (unsigned long) hcpu;
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
-static struct notifier_block coretemp_cpu_notifier __refdata = {
-	.notifier_call = coretemp_cpu_callback,
-};
-
 static const struct x86_cpu_id __initconst coretemp_ids[] = {
 	{ X86_VENDOR_INTEL, X86_FAMILY_ANY, X86_MODEL_ANY, X86_FEATURE_DTHERM },
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, coretemp_ids);
 
+static enum cpuhp_state coretemp_hp_online;
+
 static int __init coretemp_init(void)
 {
-	int i, err;
+	int err;
 
 	/*
 	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
@@ -798,52 +780,42 @@ static int __init coretemp_init(void)
 
 	err = platform_driver_register(&coretemp_driver);
 	if (err)
-		goto exit;
+		return err;
 
-	cpu_notifier_register_begin();
-	for_each_online_cpu(i)
-		get_core_online(i);
+	get_online_cpus();
+	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "hwmon/coretemp:online",
+				coretemp_cpu_online, coretemp_cpu_offline);
+	if (err < 0)
+		goto exit_driver_unreg;
+	coretemp_hp_online = err;
 
 #ifndef CONFIG_HOTPLUG_CPU
 	if (list_empty(&pdev_list)) {
-		cpu_notifier_register_done();
 		err = -ENODEV;
-		goto exit_driver_unreg;
+		goto exit_hp_unreg;
 	}
 #endif
-
-	__register_hotcpu_notifier(&coretemp_cpu_notifier);
-	cpu_notifier_register_done();
+	put_online_cpus();
 	return 0;
 
 #ifndef CONFIG_HOTPLUG_CPU
+exit_hp_unreg:
+	cpuhp_remove_state(coretemp_hp_online);
+	put_online_cpus();
+#endif
 exit_driver_unreg:
 	platform_driver_unregister(&coretemp_driver);
-#endif
-exit:
 	return err;
 }
+module_init(coretemp_init)
 
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
+module_exit(coretemp_exit)
 
 MODULE_AUTHOR("Rudolf Marek <r.marek@assembler.cz>");
 MODULE_DESCRIPTION("Intel Core temperature monitor");
 MODULE_LICENSE("GPL");
-
-module_init(coretemp_init)
-module_exit(coretemp_exit)


