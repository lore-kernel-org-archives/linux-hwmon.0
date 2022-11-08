Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4B8C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Nov 2022 07:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbiKHHsp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Nov 2022 02:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbiKHHso (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Nov 2022 02:48:44 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287D813D2E
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Nov 2022 23:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667893724; x=1699429724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zVBcmm98NjukADnIfTD1x1JQliaGxLCGBcl2oLJB3Hk=;
  b=dZ4Qh+tXqqqsopTfduvnEDOHAbgH4d5iGS2WDnYDS2BHo6yAeClN4V6F
   u6TxO3FRk1OZ8IhNcNAnYaG3+x6uZzdssAKnaz68Lme3cV07HEpEyTFhh
   pkfKSsLjcIDJMd5/Swdp9skuiqgdIc85Jta0J3dnxeZIjrq3Y/Xqm2rC0
   36nHMxmeRWBLLosuR3+gfhzkNPiAqgVxfuajslyIv4ZCqWqBPaQglTTvh
   VENSFoS+AmZ0007JLAJk1oaOVstGeK18AV5aclQ/FIPEtylvoEC18xe8p
   li2rRSqI8ybSkLApmbRf2LFycerHzWH0wszHn24FkjToJqBMAd1p2RfDs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290351698"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="290351698"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 23:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705204816"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="705204816"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2022 23:48:42 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH 3/3] hwmon (coretemp): Add support for dynamic ttarget
Date:   Tue,  8 Nov 2022 15:50:51 +0800
Message-Id: <20221108075051.5139-4-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221108075051.5139-1-rui.zhang@intel.com>
References: <20221108075051.5139-1-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Tjmax value retrieved from MSR_IA32_TEMPERATURE_TARGET can be changed at
runtime when the Intel SST-PP (Intel Speed Select Technology -
Performance Profile) level is changed. As a result, the ttarget value
also becomes dyamic.

Improve the code to always get updated ttarget value.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/hwmon/coretemp.c | 69 ++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 5292f7844860..d6084600862f 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -69,7 +69,6 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
  */
 struct temp_data {
 	int temp;
-	int ttarget;
 	int tjmax;
 	unsigned long last_updated;
 	unsigned int cpu;
@@ -96,6 +95,7 @@ struct platform_data {
 };
 
 static int get_tjmax(struct temp_data *tdata, struct device *dev);
+static int get_ttarget(struct temp_data *tdata, struct device *dev);
 
 /* Keep track of how many zone pointers we allocated in init() */
 static int max_zones __read_mostly;
@@ -150,8 +150,17 @@ static ssize_t show_ttarget(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct platform_data *pdata = dev_get_drvdata(dev);
+	struct temp_data *tdata = pdata->core_data[attr->index];
+	int ttarget;
+
+	mutex_lock(&tdata->update_lock);
+	ttarget = get_ttarget(tdata, dev);
+	mutex_unlock(&tdata->update_lock);
 
-	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
+	if (ttarget >= 0)
+		return sprintf(buf, "%d\n", ttarget);
+	else
+		return ttarget;
 }
 
 static ssize_t show_temp(struct device *dev,
@@ -393,6 +402,38 @@ static int get_tjmax(struct temp_data *tdata, struct device *dev)
 	return tdata->tjmax;
 }
 
+static int get_ttarget(struct temp_data *tdata, struct device *dev)
+{
+	u32 eax, edx;
+	struct cpuinfo_x86 *c = &cpu_data(tdata->cpu);
+	int tj_max, ttarget_offset, ret;
+
+	/*
+	 * ttarget is valid only if tjmax can be retrieved from
+	 * MSR_IA32_TEMPERATURE_TARGET
+	 */
+	if (tdata->tjmax)
+		return -ENODEV;
+
+	if (c->x86_model <= 0xe || c->x86_model == 0x1c)
+		return -ENODEV;
+
+	/*
+	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
+	 * The target temperature is available on older CPUs but not in this
+	 * register. Atoms don't have the register at all.
+	 */
+	ret = rdmsr_safe_on_cpu(tdata->cpu, MSR_IA32_TEMPERATURE_TARGET,
+					&eax, &edx);
+	if (ret)
+		return ret;
+
+	tj_max = (eax >> 16) & 0xff;
+	ttarget_offset = (eax >> 8) & 0xff;
+
+	return (tj_max - ttarget_offset) * 1000;
+}
+
 static int create_core_attrs(struct temp_data *tdata, struct device *dev,
 			     int attr_no)
 {
@@ -468,9 +509,8 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 {
 	struct temp_data *tdata;
 	struct platform_data *pdata = platform_get_drvdata(pdev);
-	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	u32 eax, edx;
-	int err, index, attr_no, tjmax;
+	int err, index, attr_no;
 
 	/*
 	 * Find attr number for sysfs:
@@ -504,23 +544,10 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 	if (err)
 		goto exit_free;
 
-	/* We can access status register. Get Critical Temperature */
-	tjmax = get_tjmax(tdata, &pdev->dev);
-
-	/*
-	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
-	 * The target temperature is available on older CPUs but not in this
-	 * register. Atoms don't have the register at all.
-	 */
-	if (c->x86_model > 0xe && c->x86_model != 0x1c) {
-		err = rdmsr_safe_on_cpu(cpu, MSR_IA32_TEMPERATURE_TARGET,
-					&eax, &edx);
-		if (!err) {
-			tdata->ttarget
-			  = tjmax - ((eax >> 8) & 0xff) * 1000;
-			tdata->attr_size++;
-		}
-	}
+	/* Make sure tdata->tjmax is a valid indicator for dynamic/static tjmax */
+	get_tjmax(tdata, &pdev->dev);
+	if (get_ttarget(tdata, &pdev->dev) >= 0)
+		tdata->attr_size++;
 
 	pdata->core_data[attr_no] = tdata;
 
-- 
2.25.1

