Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C7DC001E0
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbjHBNqf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 09:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbjHBNqe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 09:46:34 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE10269A
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690983991; x=1722519991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cVrIsTiMCRnsJYT6RamdzZFUhvFLRuww9/qWagqmj7k=;
  b=EjL7WzCLsdVlFlFE3bk4Ln0CRYHqAnh81D0v/SiAfnrHzQ236HPhIOEj
   7RMUNPv9fdzASlccs6YQasFJS7tZp5fmioeo4rr23vedrOtiEMs61e0dF
   IM8/0xyts7jYFIYTIpd5N+pC5Vza2FDK7dLwGBgOaqDNPOqbKyLZKeZQV
   mSAr36rM18f6bqrQLVP21GJOJc3+P9g1APasJY+/hHWSaffv9Ecm3Gunc
   cTrNA5DmcN1Jnhysp+8mNeRZJeZuTweRYdMWCmngKoLKSAqD+mas20n6v
   lDL4V5vCrEcbuPmLFF9mJyRW0Hyhx3UcpHPYhrVIbZWKk2rwcT+iUMXf1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534934"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="400534934"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873919"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="852873919"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:27 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 2/6] drm/xe/hwmon: Expose power attributes
Date:   Wed,  2 Aug 2023 19:22:37 +0530
Message-Id: <20230802135241.458855-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802135241.458855-1-badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose power_max (pl1) and power_rated_max (tdp) attributes.

v2:
  - Fix review comments (Riana)
v3:
  - Convert enums to uppercase (Matt Brost)
  - Avoid extra reg read in hwmon_is_visible function (Riana)
  - Add XE_MISSING_CASE macro to warn on default case (Andi)
  - Serialize locking (Matt Brost, Andi)
  - Use xe_device_assert_mem_access when applicable (Matt Brost)
  - Add intel-xe@lists.freedesktop.org in Documentation (Matt Brost)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 304 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
 drivers/gpu/drm/xe/xe_macros.h                |   3 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 7 files changed, 375 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
new file mode 100644
index 000000000000..d48d98f903ed
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -0,0 +1,22 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
+Date:		August 2023
+KernelVersion:	6.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically seconds)
+		exceeds this limit. A read value of 0 means that the PL1
+		power limit is disabled, writing 0 disables the
+		limit. Writing values > 0 will enable the power limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
+Date:		August 2023
+KernelVersion:	6.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Card default power limit (default TDP setting).
+
+		Only supported for particular Intel xe graphics platforms.
+
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d654f3311351..eb7210afbd2c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -397,4 +397,8 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
+#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
+#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
new file mode 100644
index 000000000000..cb2d49b5c8a9
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MCHBAR_REGS_H__
+#define _XE_MCHBAR_REGS_H_
+
+#include "regs/xe_reg_defs.h"
+
+/*
+ * MCHBAR mirror.
+ *
+ * This mirrors the MCHBAR MMIO space whose location is determined by
+ * device 0 function 0's pci config register 0x44 or 0x48 and matches it in
+ * every way.
+ */
+
+#define MCHBAR_MIRROR_BASE_SNB			0x140000
+
+#define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
+#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
+#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
+#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
+
+#define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
+#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
+
+#define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
+#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
+#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5e35128a61a8..ce8dac2168f6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -6,9 +6,30 @@
 #include <linux/hwmon.h>
 
 #include <drm/drm_managed.h>
+#include "regs/xe_mchbar_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_hwmon.h"
+#include "xe_mmio.h"
+#include "xe_gt.h"
+
+enum hwmon_reg_name {
+	REG_PKG_RAPL_LIMIT,
+	REG_PKG_POWER_SKU,
+	REG_PKG_POWER_SKU_UNIT,
+};
+
+enum hwmon_reg_operation {
+	REG_READ,
+	REG_WRITE,
+	REG_RMW,
+};
+
+/*
+ * SF_* - scale factors for particular quantities according to hwmon spec.
+ * - power  - microwatts
+ */
+#define SF_POWER	1000000
 
 struct xe_hwmon_data {
 	struct device *hwmon_dev;
@@ -18,13 +39,268 @@ struct xe_hwmon_data {
 
 struct xe_hwmon {
 	struct xe_hwmon_data ddat;
-	struct mutex hwmon_lock;
+	struct mutex hwmon_lock; /* rmw operations*/
+	bool reset_in_progress;
+	wait_queue_head_t waitq;
+	int scl_shift_power;
 };
 
+#define ddat_to_xe_hwmon(ddat)	({ container_of(ddat, struct xe_hwmon, ddat); })
+
+static u32 hwmon_get_reg(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_name)
+{
+	struct xe_device *xe = gt_to_xe(ddat->gt);
+	struct xe_reg reg = XE_REG(0);
+
+	switch (reg_name) {
+	case REG_PKG_RAPL_LIMIT:
+		if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
+		else if (xe->info.platform == XE_PVC)
+			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
+		break;
+	case REG_PKG_POWER_SKU:
+		if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_POWER_SKU;
+		else if (xe->info.platform == XE_PVC)
+			reg = PVC_GT0_PACKAGE_POWER_SKU;
+		break;
+	case REG_PKG_POWER_SKU_UNIT:
+		if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
+		else if (xe->info.platform == XE_PVC)
+			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
+		break;
+	default:
+		XE_MISSING_CASE(reg_name);
+		break;
+	}
+
+	return reg.raw;
+}
+
+static int process_hwmon_reg(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_name,
+			     enum hwmon_reg_operation operation, u32 *value,
+			     u32 clr, u32 set)
+{
+	struct xe_reg reg;
+	int ret = 0;
+
+	reg.raw = hwmon_get_reg(ddat, reg_name);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	switch (operation) {
+	case REG_READ:
+		*value = xe_mmio_read32(ddat->gt, reg);
+		break;
+	case REG_WRITE:
+		xe_mmio_write32(ddat->gt, reg, *value);
+		break;
+	case REG_RMW:
+		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
+		break;
+	default:
+		XE_MISSING_CASE(operation);
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+int process_hwmon_reg_read64(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_name, u64 *value)
+{
+	struct xe_reg reg;
+
+	reg.raw = hwmon_get_reg(ddat, reg_name);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	*value = xe_mmio_read64(ddat->gt, reg);
+
+	return 0;
+}
+
+#define PL1_DISABLE 0
+
+/*
+ * HW allows arbitrary PL1 limits to be set but silently clamps these values to
+ * "typical but not guaranteed" min/max values in rg.PKG_POWER_SKU. Follow the
+ * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
+ * clamped values when read.
+ */
+static int hwmon_power_max_read(struct xe_hwmon_data *ddat, long *value)
+{
+	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
+	u32 reg_val;
+	u64 r, min, max;
+
+	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
+	/* Check if PL1 limit is disabled */
+	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
+		*value = PL1_DISABLE;
+		return 0;
+	}
+
+	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	process_hwmon_reg_read64(ddat, REG_PKG_POWER_SKU, &r);
+	min = REG_FIELD_GET(PKG_MIN_PWR, r);
+	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
+	max = REG_FIELD_GET(PKG_MAX_PWR, r);
+	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
+
+	if (min && max)
+		*value = clamp_t(u64, *value, min, max);
+
+	return 0;
+}
+
+static inline bool check_reset_in_progress(struct xe_hwmon *hwmon)
+{
+	mutex_lock(&hwmon->hwmon_lock);
+	if (!hwmon->reset_in_progress)
+		return true;
+	mutex_unlock(&hwmon->hwmon_lock);
+		return false;
+}
+
+static int hwmon_power_max_write(struct xe_hwmon_data *ddat, long value)
+{
+	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
+	DEFINE_WAIT(wait);
+	int ret = 0;
+	u32 nval;
+
+	/* hwmon->hwmon_lock remain held till rmw operation is over */
+	wait_event(hwmon->waitq, check_reset_in_progress(hwmon));
+
+	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
+	if (value == PL1_DISABLE) {
+		process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
+				  PKG_PWR_LIM_1_EN, 0);
+		process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_READ, &nval,
+				  PKG_PWR_LIM_1_EN, 0);
+
+		if (nval & PKG_PWR_LIM_1_EN)
+			ret = -ENODEV;
+		goto unlock;
+	}
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
+	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
+
+	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
+			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return 0;
+}
+
+static int hwmon_power_rated_max_read(struct xe_hwmon_data *ddat, long *value)
+{
+	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
+	u32 reg_val;
+
+	process_hwmon_reg(ddat, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
+	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	return 0;
+}
+
 static const struct hwmon_channel_info *hwmon_info[] = {
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
 	NULL
 };
 
+static umode_t
+hwmon_power_is_visible(struct xe_hwmon_data *ddat, u32 attr, int chan)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
+	case hwmon_power_rated_max:
+		return hwmon_get_reg(ddat, REG_PKG_POWER_SKU) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwmon_power_read(struct xe_hwmon_data *ddat, u32 attr, int chan, long *val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return hwmon_power_max_read(ddat, val);
+	case hwmon_power_rated_max:
+		return hwmon_power_rated_max_read(ddat, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwmon_power_write(struct xe_hwmon_data *ddat, u32 attr, int chan, long val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return hwmon_power_max_write(ddat, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct xe_hwmon_data *ddat = &hwmon->ddat;
+	u32 r;
+
+	if (!(hwmon && hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT)))
+		return;
+
+	xe_device_assert_mem_access(gt_to_xe(ddat->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	hwmon->reset_in_progress = true;
+
+	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &r,
+			  PKG_PWR_LIM_1_EN, 0);
+	*old = !!(r & PKG_PWR_LIM_1_EN);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
+void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct xe_hwmon_data *ddat = &hwmon->ddat;
+	u32 r;
+
+	if (!(hwmon && hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT)))
+		return;
+
+	xe_device_assert_mem_access(gt_to_xe(ddat->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &r,
+			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
+
+	hwmon->reset_in_progress = false;
+	wake_up_all(&hwmon->waitq);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
 static umode_t
 hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		 u32 attr, int channel)
@@ -35,6 +311,9 @@ hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	xe_device_mem_access_get(gt_to_xe(ddat->gt));
 
 	switch (type) {
+	case hwmon_power:
+		ret = hwmon_power_is_visible(ddat, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -55,6 +334,9 @@ hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	xe_device_mem_access_get(gt_to_xe(ddat->gt));
 
 	switch (type) {
+	case hwmon_power:
+		ret = hwmon_power_read(ddat, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -75,6 +357,9 @@ hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	xe_device_mem_access_get(gt_to_xe(ddat->gt));
 
 	switch (type) {
+	case hwmon_power:
+		ret = hwmon_power_write(ddat, attr, channel, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -99,6 +384,18 @@ static const struct hwmon_chip_info hwmon_chip_info = {
 static void
 hwmon_get_preregistration_info(struct xe_device *xe)
 {
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct xe_hwmon_data *ddat = &hwmon->ddat;
+	u32 val_sku_unit = 0;
+	int ret;
+
+	ret = process_hwmon_reg(ddat, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
+	/*
+	 * The contents of register PKG_POWER_SKU_UNIT do not change,
+	 * so read it once and store the shift values.
+	 */
+	if (!ret)
+		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 }
 
 void xe_hwmon_register(struct xe_device *xe)
@@ -128,13 +425,16 @@ void xe_hwmon_register(struct xe_device *xe)
 
 	hwmon_get_preregistration_info(xe);
 
+	init_waitqueue_head(&hwmon->waitq);
+
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
-	/*  hwmon_dev points to device hwmon<i> */
+	/* hwmon_dev points to device hwmon<i> */
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwmon_chip_info,
 							 NULL);
+
 	if (IS_ERR(hwmon_dev)) {
 		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
 		xe->hwmon = NULL;
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
index a078eeb0a68b..a5dc693569c5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -14,9 +14,13 @@ struct xe_device;
 #if IS_REACHABLE(CONFIG_HWMON)
 void xe_hwmon_register(struct xe_device *xe);
 void xe_hwmon_unregister(struct xe_device *xe);
+void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
+void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
 #else
 static inline void xe_hwmon_register(struct xe_device *xe) { };
 static inline void xe_hwmon_unregister(struct xe_device *xe) { };
+static inline void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old) { };
+static inline void xe_hwmon_power_max_restore(struct xe_device *xe, bool old) { };
 #endif
 
 #endif /* __XE_HWMON_H__ */
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..030296f8f863 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -15,4 +15,7 @@
 			    "Ioctl argument check failed at %s:%d: %s", \
 			    __FILE__, __LINE__, #cond), 1))
 
+#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+			     __stringify(x), (long)(x))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index addd6f2681b9..2e9c915ac707 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -13,6 +13,7 @@
 #include "xe_huc.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
+#include "xe_hwmon.h"
 
 static struct xe_gt *
 uc_to_gt(struct xe_uc *uc)
@@ -127,11 +128,15 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
 int xe_uc_init_hw(struct xe_uc *uc)
 {
 	int ret;
+	bool pl1en;
 
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
 		return 0;
 
+	/* Disable a potentially low PL1 power limit to allow freq to be raised */
+	xe_hwmon_power_max_disable(uc_to_xe(uc), &pl1en);
+
 	ret = xe_uc_sanitize_reset(uc);
 	if (ret)
 		return ret;
@@ -160,6 +165,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
+	xe_hwmon_power_max_restore(uc_to_xe(uc), pl1en);
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
 	ret = xe_huc_auth(&uc->huc);
 	XE_WARN_ON(ret);
-- 
2.25.1

