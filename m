Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60384 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755568AbcKVRpA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2016 12:45:00 -0500
Message-Id: <20161122173731.680477115@linutronix.de>
Date: Tue, 22 Nov 2016 17:42:03 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: [patch 3/6] hwmon/coretemp: Avoid redundant lookups
References: <20161122173622.771252945@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline;
 filename=hwmon-coretemp--Avoid-redundant-lookups.patch
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

No point in looking up the same thing over and over.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/hwmon/coretemp.c |   19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -533,21 +533,14 @@ static int create_core_data(struct platf
 	return err;
 }
 
-static void coretemp_add_core(unsigned int cpu, int pkg_flag)
+static void
+coretemp_add_core(struct platform_device *pdev, unsigned int cpu, int pkg_flag)
 {
-	struct platform_device *pdev = coretemp_get_pdev(cpu);
-	int err;
-
-	if (!pdev)
-		return;
-
-	err = create_core_data(pdev, cpu, pkg_flag);
-	if (err)
+	if (create_core_data(pdev, cpu, pkg_flag))
 		dev_err(&pdev->dev, "Adding Core %u failed\n", cpu);
 }
 
-static void coretemp_remove_core(struct platform_data *pdata,
-				 int indx)
+static void coretemp_remove_core(struct platform_data *pdata, int indx)
 {
 	struct temp_data *tdata = pdata->core_data[indx];
 
@@ -692,7 +685,7 @@ static void get_core_online(unsigned int
 		 * If so, add interfaces for pkgtemp.
 		 */
 		if (cpu_has(c, X86_FEATURE_PTS))
-			coretemp_add_core(cpu, 1);
+			coretemp_add_core(pdev, cpu, 1);
 	}
 
 	pdata = platform_get_drvdata(pdev);
@@ -701,7 +694,7 @@ static void get_core_online(unsigned int
 	 * interface for this CPU core.
 	 */
 	if (!cpumask_intersects(&pdata->cpumask, topology_sibling_cpumask(cpu)))
-		coretemp_add_core(cpu, 0);
+		coretemp_add_core(pdev, cpu, 0);
 
 	cpumask_set_cpu(cpu, &pdata->cpumask);
 }


