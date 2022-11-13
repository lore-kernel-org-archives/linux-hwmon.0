Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5358CC43217
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Nov 2022 15:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbiKMP3q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Nov 2022 10:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbiKMP3q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Nov 2022 10:29:46 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9EDEB8
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Nov 2022 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668353385; x=1699889385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gaY6ta5EwAX1C+0iRcZUXzy/uiDIE6PmdmVf38P7Yr0=;
  b=l7jue+HagZx7oEhlIPSYv2eC0zbVT8HXsKklw7xBwngkKJXmJrToN2Ed
   dLLTrwfRr9SxXtAQJdiOQrvtS2cksxb6PTpjJFZSHCEYavAdo7sdNHqeK
   5ecmyqEUaViqgQVuATd9E6uGarR4KCqJWdmbOM/QHpMlA9qK9XC/KYH0B
   viXYLjXEhvrNiq0GLKNfOPji4dcpIMsXK8Ae15L/Neq19zyHgibFHa7FA
   PrpLUtcJvCKcVEXSs8tth/zAK9+D9P1t136/3DQgnbvJpINNRzufz298a
   2c99/7qbt4l4qrzq/kydjRLp1SoO10qdY8d70SM9g3KAicLR6RTQ27FLE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="398109683"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="398109683"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2022 07:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638148901"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="638148901"
Received: from power-sh.sh.intel.com ([10.239.183.122])
  by orsmga002.jf.intel.com with ESMTP; 13 Nov 2022 07:29:43 -0800
From:   Zhang Rui <rui.zhang@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: [PATCH V2 3/3] hwmon (coretemp): Add support for dynamic ttarget
Date:   Sun, 13 Nov 2022 23:31:45 +0800
Message-Id: <20221113153145.32696-4-rui.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221113153145.32696-1-rui.zhang@intel.com>
References: <20221113153145.32696-1-rui.zhang@intel.com>
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
 drivers/hwmon/coretemp.c | 57 +++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 573ac8c5ed42..e537ab0d0422 100644
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
@@ -303,6 +302,30 @@ static int get_tjmax(struct temp_data *tdata, struct device *dev)
 	return tdata->tjmax;
 }
 
+static int get_ttarget(struct temp_data *tdata, struct device *dev)
+{
+	u32 eax, edx;
+	int tjmax, ttarget_offset, ret;
+
+	/*
+	 * ttarget is valid only if tjmax can be retrieved from
+	 * MSR_IA32_TEMPERATURE_TARGET
+	 */
+	if (tdata->tjmax)
+		return -ENODEV;
+
+	ret = rdmsr_safe_on_cpu(tdata->cpu, MSR_IA32_TEMPERATURE_TARGET, &eax, &edx);
+	if (ret)
+		return ret;
+
+	tjmax = (eax >> 16) & 0xff;
+
+	/* Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET. */
+	ttarget_offset = (eax >> 8) & 0xff;
+
+	return (tjmax - ttarget_offset) * 1000;
+}
+
 /* Keep track of how many zone pointers we allocated in init() */
 static int max_zones __read_mostly;
 /* Array of zone pointers. Serialized by cpu hotplug lock */
@@ -356,8 +379,16 @@ static ssize_t show_ttarget(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct platform_data *pdata = dev_get_drvdata(dev);
+	struct temp_data *tdata = pdata->core_data[attr->index];
+	int ttarget;
 
-	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
+	mutex_lock(&tdata->update_lock);
+	ttarget = get_ttarget(tdata, dev);
+	mutex_unlock(&tdata->update_lock);
+
+	if (ttarget < 0)
+		return ttarget;
+	return sprintf(buf, "%d\n", ttarget);
 }
 
 static ssize_t show_temp(struct device *dev,
@@ -466,7 +497,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 	struct platform_data *pdata = platform_get_drvdata(pdev);
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	u32 eax, edx;
-	int err, index, attr_no, tjmax;
+	int err, index, attr_no;
 
 	/*
 	 * Find attr number for sysfs:
@@ -500,23 +531,17 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 	if (err)
 		goto exit_free;
 
-	/* We can access status register. Get Critical Temperature */
-	tjmax = get_tjmax(tdata, &pdev->dev);
+	/* Make sure tdata->tjmax is a valid indicator for dynamic/static tjmax */
+	get_tjmax(tdata, &pdev->dev);
 
 	/*
-	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
-	 * The target temperature is available on older CPUs but not in this
-	 * register. Atoms don't have the register at all.
+	 * The target temperature is available on older CPUs but not in the
+	 * MSR_IA32_TEMPERATURE_TARGET register. Atoms don't have the register
+	 * at all.
 	 */
-	if (c->x86_model > 0xe && c->x86_model != 0x1c) {
-		err = rdmsr_safe_on_cpu(cpu, MSR_IA32_TEMPERATURE_TARGET,
-					&eax, &edx);
-		if (!err) {
-			tdata->ttarget
-			  = tjmax - ((eax >> 8) & 0xff) * 1000;
+	if (c->x86_model > 0xe && c->x86_model != 0x1c)
+		if (get_ttarget(tdata, &pdev->dev) >= 0)
 			tdata->attr_size++;
-		}
-	}
 
 	pdata->core_data[attr_no] = tdata;
 
-- 
2.25.1

