Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45C7C43217
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Nov 2022 07:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbiKHHsn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Nov 2022 02:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbiKHHsn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Nov 2022 02:48:43 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A91B13D2E
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Nov 2022 23:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667893722; x=1699429722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2pB6Mkru8Go35EworUuZsktEHuiMdlj+JvOTGvM+WaE=;
  b=Gv11BoCVQQBPqyFAOAxP+jZ8zaL6AsO2DDGa9EGJAnQ9yTvYWNPcFn4l
   gGo/Jb3Mf1dVDVwSjGyfxUe5eGoE1+sFyOnkpya0qeXVe7RJZfzyhXdoO
   1+6Npx9LauyrrBT3ZojOet9Bfza0rzKCfnn42hAIqsED+Wff4TPjRRyb9
   SGNigqMk1Wz+OoWhfDlUTKpBSOUADG890FUl0JszVC8QmAprJ9gjzVn4i
   3xgwyzZ4/eWaOSnypSSX2IYqHCkRs9fLn3VM94yjs0Am06vijS1a/oZfR
   1Is2K0xyTp6jQsTrCgJvLmrimrEN/a1oW39q6ZZAKUQxK9TP6pfm25Hkl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290351694"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="290351694"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 23:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705204809"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="705204809"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2022 23:48:40 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH 2/3] hwmon (coretemp): Add support for dynamic tjmax
Date:   Tue,  8 Nov 2022 15:50:50 +0800
Message-Id: <20221108075051.5139-3-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221108075051.5139-1-rui.zhang@intel.com>
References: <20221108075051.5139-1-rui.zhang@intel.com>
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
 drivers/hwmon/coretemp.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index ec35ada68455..5292f7844860 100644
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
@@ -93,6 +95,8 @@ struct platform_data {
 	struct device_attribute name_attr;
 };
 
+static int get_tjmax(struct temp_data *tdata, struct device *dev);
+
 /* Keep track of how many zone pointers we allocated in init() */
 static int max_zones __read_mostly;
 /* Array of zone pointers. Serialized by cpu hotplug lock */
@@ -131,8 +135,14 @@ static ssize_t show_tjmax(struct device *dev,
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
@@ -151,9 +161,11 @@ static ssize_t show_temp(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct platform_data *pdata = dev_get_drvdata(dev);
 	struct temp_data *tdata = pdata->core_data[attr->index];
+	int tjmax;
 
 	mutex_lock(&tdata->update_lock);
 
+	tjmax = get_tjmax(tdata, dev);
 	/* Check whether the time interval has elapsed */
 	if (time_after(jiffies, tdata->last_updated + HZ)) {
 		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
@@ -163,7 +175,7 @@ static ssize_t show_temp(struct device *dev,
 		 * Return it instead of reporting an error which doesn't
 		 * really help at all.
 		 */
-		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
+		tdata->temp = tjmax - ((eax >> 16) & 0x7f) * 1000;
 		tdata->last_updated = jiffies;
 	}
 
@@ -334,20 +346,25 @@ static bool cpu_has_tjmax(struct cpuinfo_x86 *c)
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
@@ -363,14 +380,17 @@ static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
 	if (force_tjmax) {
 		dev_notice(dev, "TjMax forced to %d degrees C by user\n",
 			   force_tjmax);
-		return force_tjmax * 1000;
+		tdata->tjmax = force_tjmax * 1000;
+		goto end;
 	}
 
 	/*
 	 * An assumption is made for early CPUs and unreadable MSR.
 	 * NOTE: the calculated value may not be correct.
 	 */
-	return adjust_tjmax(c, id, dev);
+	tdata->tjmax = adjust_tjmax(c, tdata->cpu, dev);
+end:
+	return tdata->tjmax;
 }
 
 static int create_core_attrs(struct temp_data *tdata, struct device *dev,
@@ -450,7 +470,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 	struct platform_data *pdata = platform_get_drvdata(pdev);
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	u32 eax, edx;
-	int err, index, attr_no;
+	int err, index, attr_no, tjmax;
 
 	/*
 	 * Find attr number for sysfs:
@@ -485,7 +505,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 		goto exit_free;
 
 	/* We can access status register. Get Critical Temperature */
-	tdata->tjmax = get_tjmax(c, cpu, &pdev->dev);
+	tjmax = get_tjmax(tdata, &pdev->dev);
 
 	/*
 	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
@@ -497,7 +517,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
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

