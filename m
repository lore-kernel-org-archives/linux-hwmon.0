Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590C5E71096
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 17:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjIURGE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjIURFR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 13:05:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C484A1B1
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695315867; x=1726851867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C27yF6zXmG5UAEq8dfG+FxqX0xnzgpP+JJbdA3VXY14=;
  b=cM/1ixtQcaboUuSE9o8GG3S8XeCK+4QkpepkdYF9g/JCwFUIZDjgr9A6
   xWIAoyJe7UUeec1Sn8b6X08VoQornwOVpSXrJbgadhLefSxpSj+OEkF5s
   xrbXg8v8vmP8Kot5v5/BqEC/9dSC4VCCy7/LdIJNASdDRpeq0Eo2Y/sC2
   xDA9w9CtQZ5et0iy6ui8wRsLyFxJNaLWwxE7KWPNXsmKpj58YEBZhWFN9
   zI7TwGmU639QmGKSUjNXmqJJESummhXZrNIOOaHbIFV6nMN1PvOsCW8Tz
   Q7lk45pWNArkS/HytWy5md6c2E3bvlR2Px8T3gqTDusZBdHEoKEUv5gGk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466788370"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466788370"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740573700"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="740573700"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:17 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH v5 4/6] drm/xe/hwmon: Expose input voltage attribute
Date:   Thu, 21 Sep 2023 15:55:17 +0530
Message-Id: <20230921102519.3355538-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921102519.3355538-1-badal.nilawar@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use Xe HWMON subsystem to display the input voltage.

v2:
  - Rename hwm_get_vltg to hwm_get_voltage (Riana)
  - Use scale factor SF_VOLTAGE (Riana)
v3:
  - %s/gt_perf_status/REG_GT_PERF_STATUS/
  - Remove platform check from hwmon_get_voltage()
v4:
  - Fix review comments (Andi)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  6 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 58 +++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 37263b09b6e4..7f9407c20864 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -44,5 +44,11 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 		the operating frequency if the power averaged over a window
 		exceeds this limit.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		September 2023
+KernelVersion:	6.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
 		Only supported for particular Intel xe graphics platforms.
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 679cdba9f383..102663cbc320 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -374,6 +374,9 @@
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
 
+#define GT_PERF_STATUS				XE_REG(0x1381b4)
+#define   VOLTAGE_MASK				REG_GENMASK(10, 0)
+
 #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
 
 #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ef0893bf1268..431995045faa 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -3,7 +3,9 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
+#include <linux/types.h>
 
 #include <drm/drm_managed.h>
 #include "regs/xe_gt_regs.h"
@@ -19,6 +21,7 @@ enum xe_hwmon_reg {
 	REG_PKG_RAPL_LIMIT,
 	REG_PKG_POWER_SKU,
 	REG_PKG_POWER_SKU_UNIT,
+	REG_GT_PERF_STATUS,
 };
 
 enum xe_hwmon_reg_operation {
@@ -32,6 +35,7 @@ enum xe_hwmon_reg_operation {
  */
 #define SF_POWER	1000000		/* microwatts */
 #define SF_CURR		1000		/* milliamperes */
+#define SF_VOLTAGE	1000		/* millivolts */
 
 struct xe_hwmon {
 	struct device *hwmon_dev;
@@ -64,6 +68,10 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
 		else if (xe->info.platform == XE_PVC)
 			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		break;
+	case REG_GT_PERF_STATUS:
+		if (xe->info.platform == XE_DG2)
+			reg = GT_PERF_STATUS;
+		break;
 	default:
 		XE_MISSING_CASE(hwmon_reg);
 		break;
@@ -187,6 +195,7 @@ static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
 static const struct hwmon_channel_info *hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
@@ -209,6 +218,18 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
+static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
+{
+	u32 reg_val;
+
+	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
+			     REG_READ, &reg_val, 0, 0);
+	/* HW register value in units of 2.5 millivolt */
+	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
+
+	return 0;
+}
+
 static umode_t
 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
 {
@@ -317,6 +338,37 @@ xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
 	}
 }
 
+static umode_t
+xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
+{
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = xe_hwmon_get_voltage(hwmon, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return ret;
+}
+
 static umode_t
 xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		    u32 attr, int channel)
@@ -333,6 +385,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = xe_hwmon_curr_is_visible(hwmon, attr);
 		break;
+	case hwmon_in:
+		ret = xe_hwmon_in_is_visible(hwmon, attr);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -359,6 +414,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_curr:
 		ret = xe_hwmon_curr_read(hwmon, attr, val);
 		break;
+	case hwmon_in:
+		ret = xe_hwmon_in_read(hwmon, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-- 
2.25.1

