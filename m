Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1DCC4332F
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Nov 2022 15:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbiKMP3p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Nov 2022 10:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbiKMP3o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Nov 2022 10:29:44 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0207AEB8
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Nov 2022 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668353383; x=1699889383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MfiRl4ExQ2i2MsocsObnUSm8c0Ul5jTUz/TMmIiBQ88=;
  b=QVZ9iVuLjouTi8x3qx23p4nor8yul7gvLc2UBE4PONkPncVm/65RDxRt
   CLPCLw20x+CS4RkIigVBJlOvzvyOfcOEdpTuWzfWYod+GIYQHV9Xi+4oh
   Z3yXTJEqvShrj7upFgrwU0xal/e7ZVrKRxfJR1G/QV7DpbWusMeSauTDv
   K0RamVFUJPaIUfHLRiwccNdl7oyV/5LzwPWYMfGioVYNJupvF/X+loJ9m
   tXwo4iAN8s0zhAzwWy81ayaZQCkaiT1+kNISo3GTZT/a47BdSKPNtVoHG
   c/rltiurZVvTNhhv9z2v4aYE5WXiJ+9cSo+jdiBklZc37cJ4y4kzmLs30
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="398109680"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="398109680"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2022 07:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638148888"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="638148888"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by orsmga002.jf.intel.com with ESMTP; 13 Nov 2022 07:29:41 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH V2 2/3] hwmon (coretemp): Add support for dynamic tjmax
Date:   Sun, 13 Nov 2022 23:31:44 +0800
Message-Id: <20221113153145.32696-3-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221113153145.32696-1-rui.zhang@intel.com>
References: <20221113153145.32696-1-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tjmax value retrieved from MSR_IA32_TEMPERATURE_TARGET can be changed at
runtime when the Intel SST-PP (Intel Speed Select Technology -
Performance Profile) level is changed.

Improve the code to always use updated tjmax when it can be retrieved
from MSR_IA32_TEMPERATURE_TARGET.

When tjmax can not be retrieved from MSR_IA32_TEMPERATURE_TARGET, still
follow the previous logic and always use a static tjmax value.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/hwmon/coretemp.c | 46 +++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 50b640bfa504..573ac8c5ed42 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -55,6 +55,8 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
 
 /*
  * Per-Core Temperature Data
+ * @tjmax: The static tjmax value when tjmax cannot be retrieved from
+ *		IA32_TEMPERATURE_TARGET MSR.
  * @last_updated: The time when the current temperature value was updated
  *		earlier (in jiffies).
  * @cpu_core_id: The CPU Core from which temperature values should be read
@@ -256,20 +258,25 @@ static bool cpu_has_tjmax(struct cpuinfo_x86 *c)
 	       model != 0x36;
 }
 
-static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
+static int get_tjmax(struct temp_data *tdata, struct device *dev)
 {
+	struct cpuinfo_x86 *c = &cpu_data(tdata->cpu);
 	int err;
 	u32 eax, edx;
 	u32 val;
 
+	/* use static tjmax once it is set */
+	if (tdata->tjmax)
+		return tdata->tjmax;
+
 	/*
 	 * A new feature of current Intel(R) processors, the
 	 * IA32_TEMPERATURE_TARGET contains the TjMax value
 	 */
-	err = rdmsr_safe_on_cpu(id, MSR_IA32_TEMPERATURE_TARGET, &eax, &edx);
+	err = rdmsr_safe_on_cpu(tdata->cpu, MSR_IA32_TEMPERATURE_TARGET, &eax, &edx);
 	if (err) {
 		if (cpu_has_tjmax(c))
-			dev_warn(dev, "Unable to read TjMax from CPU %u\n", id);
+			dev_warn(dev, "Unable to read TjMax from CPU %u\n", tdata->cpu);
 	} else {
 		val = (eax >> 16) & 0xff;
 		/*
@@ -285,14 +292,15 @@ static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
 	if (force_tjmax) {
 		dev_notice(dev, "TjMax forced to %d degrees C by user\n",
 			   force_tjmax);
-		return force_tjmax * 1000;
+		tdata->tjmax = force_tjmax * 1000;
+	} else {
+		/*
+		 * An assumption is made for early CPUs and unreadable MSR.
+		 * NOTE: the calculated value may not be correct.
+		 */
+		tdata->tjmax = adjust_tjmax(c, tdata->cpu, dev);
 	}
-
-	/*
-	 * An assumption is made for early CPUs and unreadable MSR.
-	 * NOTE: the calculated value may not be correct.
-	 */
-	return adjust_tjmax(c, id, dev);
+	return tdata->tjmax;
 }
 
 /* Keep track of how many zone pointers we allocated in init() */
@@ -333,8 +341,14 @@ static ssize_t show_tjmax(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct platform_data *pdata = dev_get_drvdata(dev);
+	struct temp_data *tdata = pdata->core_data[attr->index];
+	int tjmax;
+
+	mutex_lock(&tdata->update_lock);
+	tjmax = get_tjmax(tdata, dev);
+	mutex_unlock(&tdata->update_lock);
 
-	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->tjmax);
+	return sprintf(buf, "%d\n", tjmax);
 }
 
 static ssize_t show_ttarget(struct device *dev,
@@ -353,9 +367,11 @@ static ssize_t show_temp(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct platform_data *pdata = dev_get_drvdata(dev);
 	struct temp_data *tdata = pdata->core_data[attr->index];
+	int tjmax;
 
 	mutex_lock(&tdata->update_lock);
 
+	tjmax = get_tjmax(tdata, dev);
 	/* Check whether the time interval has elapsed */
 	if (time_after(jiffies, tdata->last_updated + HZ)) {
 		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
@@ -365,7 +381,7 @@ static ssize_t show_temp(struct device *dev,
 		 * Return it instead of reporting an error which doesn't
 		 * really help at all.
 		 */
-		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
+		tdata->temp = tjmax - ((eax >> 16) & 0x7f) * 1000;
 		tdata->last_updated = jiffies;
 	}
 
@@ -450,7 +466,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 	struct platform_data *pdata = platform_get_drvdata(pdev);
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	u32 eax, edx;
-	int err, index, attr_no;
+	int err, index, attr_no, tjmax;
 
 	/*
 	 * Find attr number for sysfs:
@@ -485,7 +501,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 		goto exit_free;
 
 	/* We can access status register. Get Critical Temperature */
-	tdata->tjmax = get_tjmax(c, cpu, &pdev->dev);
+	tjmax = get_tjmax(tdata, &pdev->dev);
 
 	/*
 	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
@@ -497,7 +513,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 					&eax, &edx);
 		if (!err) {
 			tdata->ttarget
-			  = tdata->tjmax - ((eax >> 8) & 0xff) * 1000;
+			  = tjmax - ((eax >> 8) & 0xff) * 1000;
 			tdata->attr_size++;
 		}
 	}
-- 
2.25.1

