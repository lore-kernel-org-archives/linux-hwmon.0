Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4548CC001B3
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjF0SZX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjF0SZX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 14:25:23 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4309107
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2023 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687890321; x=1719426321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UKesUCX4sQMdsDtR0PDwG1n0SItcF5dWAmgwZJ1QXXk=;
  b=YXg0tHek4AJ9bf3ErOMFABbHzH8Z02P10+ZQArreJV0204XCrDqsRfSb
   H2NRxmY8dOZF7+lWYN4Qb2wriBetOKoS/UmkhYyh+M4080ZwGfc77KSd0
   RJQlHpC3D1xx8jZJbXRi2Dm1lRrdbOCTopFfViQxyUj95zrunYrm7FB1F
   M97+jLf0WnguYrHhi0hxaNsf4QKt4Q3z0RvHVLUSn6pJnU1xa2cRsSbPv
   9jZobkl/mHoQAvZMOY97M+Jt9pOudnb8/Yn/oH587+3vxQmzBZvnW4xzz
   +0m91Y5H68aUwZiwpSlOqHv95Jd1YoRR2Bqd0ihALYDRUF4QOUOPj1yhY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148950"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="359148950"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767214"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="829767214"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:18 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 4/6] drm/xe/hwmon: Expose input voltage attribute
Date:   Wed, 28 Jun 2023 00:00:41 +0530
Message-Id: <20230627183043.2024530-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627183043.2024530-1-badal.nilawar@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use Xe HWMON subsystem to display the input voltage.
This is port from i915 hwmon.

v2:
  - Rename hwm_get_vltg to hwm_get_voltage (Riana)
  - Use scale factor SF_VOLTAGE (Riana)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  6 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 67 +++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index bee1d62bfddb..33a793b58157 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -44,5 +44,11 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 		the operating frequency if the power averaged over a window
 		exceeds this limit.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		July 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
 		Only supported for particular Intel xe graphics platforms.
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index eb7210afbd2c..cc452ec999fc 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -364,6 +364,9 @@
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
 
+#define GT_PERF_STATUS				XE_REG(0x1381b4)
+#define   VOLTAGE_MASK				REG_GENMASK(10, 0)
+
 #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
 
 #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7068120d9200..06b4251f26fd 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -3,7 +3,9 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
+#include <linux/types.h>
 
 #include "regs/xe_mchbar_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -19,6 +21,7 @@ enum hwm_reg_name {
 	pkg_rapl_limit,
 	pkg_power_sku,
 	pkg_power_sku_unit,
+	gt_perf_status,
 };
 
 enum hwm_reg_operation {
@@ -31,9 +34,11 @@ enum hwm_reg_operation {
  * SF_* - scale factors for particular quantities according to hwmon spec.
  * - power  - microwatts
  * - curr   - milliamperes
+ * - voltage  - millivolts
  */
 #define SF_POWER	1000000
 #define SF_CURR		1000
+#define SF_VOLTAGE	1000
 
 struct hwm_drvdata {
 	struct xe_hwmon *hwmon;
@@ -73,6 +78,11 @@ struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
 		else if (xe->info.platform == XE_PVC)
 			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		break;
+	case gt_perf_status:
+		if (IS_DG2(gt_to_xe(ddat->gt)))
+			return GT_PERF_STATUS;
+		else
+			return XE_REG(0);
 	default:
 		break;
 	}
@@ -239,6 +249,7 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
@@ -261,6 +272,22 @@ static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
+static int hwm_get_voltage(struct hwm_drvdata *ddat, long *value)
+{
+	u32 reg_val;
+
+	if (IS_DG2(gt_to_xe(ddat->gt))) {
+		process_hwmon_reg(ddat, gt_perf_status,
+				  reg_read, &reg_val, 0, 0);
+		/* HW register value in units of 2.5 millivolt */
+		*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
+
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
 static umode_t
 hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 {
@@ -422,6 +449,40 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
 	}
 }
 
+static umode_t
+hwm_in_is_visible(struct hwm_drvdata *ddat, u32 attr)
+{
+	u32 reg_val;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return process_hwmon_reg(ddat, gt_perf_status,
+					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = hwm_get_voltage(ddat, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -438,6 +499,9 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = hwm_curr_is_visible(ddat, attr);
 		break;
+	case hwmon_in:
+		ret = hwm_in_is_visible(ddat, attr);
+		break;
 	default:
 		ret = 0;
 	}
@@ -463,6 +527,9 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_curr:
 		ret = hwm_curr_read(ddat, attr, val);
 		break;
+	case hwmon_in:
+		ret = hwm_in_read(ddat, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-- 
2.25.1

