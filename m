Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60370 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755568AbcKVRov (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2016 12:44:51 -0500
Message-Id: <20161122173731.839189942@linutronix.de>
Date: Tue, 22 Nov 2016 17:42:05 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: [patch 5/6] hwmon/coretemp: Use proper error codes in cpu online
 callback
References: <20161122173622.771252945@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline;
 filename=hwmon-coretemp--Use-proper-error-codes-in-cpu-online-callback.patch
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The cpu online callback returns success unconditionally even when the
device has no support, micro code mismatches or device allocation fails.
Only if CPU_HOTPLUG is disabled, the init function checks whether the
device list is empty and removes the driver.

This does not make sense. If CPU HOTPLUG is enabled then there is no point
to keep the driver around when it failed to initialize on the already
online cpus. The chance that not yet online CPUs will provide a functional
interface later is very close to zero.

Add proper error return codes, so the setup of the cpu hotplug states fails
when the device cannot be initialized and remove all the magic cruft.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/hwmon/coretemp.c |   24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -662,12 +662,12 @@ static int coretemp_cpu_online(unsigned
 	 * without thermal sensors will be filtered out.
 	 */
 	if (!cpu_has(c, X86_FEATURE_DTHERM))
-		return 0;
+		return -ENODEV;
 
 	if (!pdev) {
 		/* Check the microcode version of the CPU */
 		if (chk_ucode_version(cpu))
-			return 0;
+			return -EINVAL;
 
 		/*
 		 * Alright, we have DTS support.
@@ -677,7 +677,7 @@ static int coretemp_cpu_online(unsigned
 		 */
 		err = coretemp_device_add(cpu);
 		if (err)
-			return 0;
+			return err;
 
 		pdev = coretemp_get_pdev(cpu);
 		/*
@@ -782,28 +782,14 @@ static int __init coretemp_init(void)
 	if (err)
 		return err;
 
-	get_online_cpus();
 	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "hwmon/coretemp:online",
 				coretemp_cpu_online, coretemp_cpu_offline);
 	if (err < 0)
-		goto exit_driver_unreg;
+		goto outdrv;
 	coretemp_hp_online = err;
-
-#ifndef CONFIG_HOTPLUG_CPU
-	if (list_empty(&pdev_list)) {
-		err = -ENODEV;
-		goto exit_hp_unreg;
-	}
-#endif
-	put_online_cpus();
 	return 0;
 
-#ifndef CONFIG_HOTPLUG_CPU
-exit_hp_unreg:
-	cpuhp_remove_state(coretemp_hp_online);
-	put_online_cpus();
-#endif
-exit_driver_unreg:
+outdrv:
 	platform_driver_unregister(&coretemp_driver);
 	return err;
 }


