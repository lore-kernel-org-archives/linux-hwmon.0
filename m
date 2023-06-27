Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B2CEB64DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjF0SZU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjF0SZT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 14:25:19 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001281700
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2023 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687890315; x=1719426315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iGaoiHW+bqQguLOHzFUTYMXWHF6Z1Dctou4LG8fcu14=;
  b=fjP4++3E1UuMpViCvy6pBXo47zNw/8yoyntRqIfeRcC2HJVUOmp3F9wd
   kEX9xokyFYYzbV/OKYPvY/6/nlJm9ERpYljuyfGYpp4FO5vefWphscTpi
   759O04ygWdB4Qaxf5xBRvIwOpXbz8LTojVotQi4kyZcXIkUSgnvD69f/v
   UpS1BFf6vBKJPYCor13lz45sM6LUPFYfiUS4/IOQIoQjwvU44eW1ro7BI
   qG1kfJqupsX236qELU0pgahZv0BQxKhzd+kHLcelIkAntHzT+JAbMKA7S
   UFrtZKZMzWawdHnqhYsanYUHcCllM8kaklO7SxOlOVBz82AuW8GGfO3g7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148929"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="359148929"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767185"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="829767185"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:12 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 2/6] drm/xe/hwmon: Expose power attributes
Date:   Wed, 28 Jun 2023 00:00:39 +0530
Message-Id: <20230627183043.2024530-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627183043.2024530-1-badal.nilawar@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose power_max (pl1) and power_rated_max (tdp) attributes.
This is port from i915 hwmon.

v2:
  - Move rpm calls (xe_device_mem_access_get/put) to hwmon functions from
    process_hwmon_reg to avoid multiple rpm entry exits during consecutive
    reg accesses
  - Fix review comments (Riana)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 372 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 6 files changed, 435 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
new file mode 100644
index 000000000000..ff3465195870
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -0,0 +1,22 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
+Date:		July 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
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
+Date:		July 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
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
index 8f653fdf4ad5..a4fba29d5d5a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -5,53 +5,394 @@
 
 #include <linux/hwmon.h>
 
+#include "regs/xe_mchbar_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_hwmon.h"
+#include "xe_mmio.h"
+#include "xe_gt.h"
+
+enum hwm_reg_name {
+	pkg_rapl_limit,
+	pkg_power_sku,
+	pkg_power_sku_unit,
+};
+
+enum hwm_reg_operation {
+	reg_read,
+	reg_write,
+	reg_rmw,
+};
+
+/*
+ * SF_* - scale factors for particular quantities according to hwmon spec.
+ * - power  - microwatts
+ */
+#define SF_POWER	1000000
 
 struct hwm_drvdata {
 	struct xe_hwmon *hwmon;
 	struct device *hwmon_dev;
+	struct xe_gt *gt;
 	char name[12];
+	bool reset_in_progress;
+	wait_queue_head_t waitq;
 };
 
 struct xe_hwmon {
 	struct hwm_drvdata ddat;
 	struct mutex hwmon_lock;
+	int scl_shift_power;
 };
 
+struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
+{
+	struct xe_device *xe = gt_to_xe(ddat->gt);
+
+	switch (reg_name) {
+	case pkg_rapl_limit:
+		if (xe->info.platform == XE_DG2)
+			return PCU_CR_PACKAGE_RAPL_LIMIT;
+		else if (xe->info.platform == XE_PVC)
+			return PVC_GT0_PACKAGE_RAPL_LIMIT;
+		break;
+	case pkg_power_sku:
+		if (xe->info.platform == XE_DG2)
+			return PCU_CR_PACKAGE_POWER_SKU;
+		else if (xe->info.platform == XE_PVC)
+			return PVC_GT0_PACKAGE_POWER_SKU;
+		break;
+	case pkg_power_sku_unit:
+		if (xe->info.platform == XE_DG2)
+			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
+		else if (xe->info.platform == XE_PVC)
+			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
+		break;
+	default:
+		break;
+	}
+
+	return XE_REG(0);
+}
+
+int process_hwmon_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name,
+		      enum hwm_reg_operation operation, u32 *value,
+		      u32 clr, u32 set)
+{
+	struct xe_reg reg;
+	int ret = 0;
+
+	reg = hwm_get_reg(ddat, reg_name);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	switch (operation) {
+	case reg_read:
+		*value = xe_mmio_read32(ddat->gt, reg);
+		break;
+	case reg_write:
+		xe_mmio_write32(ddat->gt, reg, *value);
+		break;
+	case reg_rmw:
+		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+int process_hwmon_reg_read64(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name, u64 *value)
+{
+	struct xe_reg reg;
+
+	reg = hwm_get_reg(ddat, reg_name);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	*value = xe_mmio_read64(ddat->gt, reg);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return 0;
+}
+
+#define PL1_DISABLE 0
+
+/*
+ * HW allows arbitrary PL1 limits to be set but silently clamps these values to
+ * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
+ * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
+ * clamped values when read.
+ */
+static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)
+{
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 reg_val;
+	u64 r, min, max;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
+	/* Check if PL1 limit is disabled */
+	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
+		*value = PL1_DISABLE;
+		xe_device_mem_access_put(gt_to_xe(ddat->gt));
+		return 0;
+	}
+
+	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
+	min = REG_FIELD_GET(PKG_MIN_PWR, r);
+	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
+	max = REG_FIELD_GET(PKG_MAX_PWR, r);
+	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
+
+	if (min && max)
+		*value = clamp_t(u64, *value, min, max);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+	return 0;
+}
+
+static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
+{
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	DEFINE_WAIT(wait);
+	int ret = 0;
+	u32 nval;
+
+	/* Block waiting for GuC reset to complete when needed */
+	for (;;) {
+		mutex_lock(&hwmon->hwmon_lock);
+
+		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
+
+		if (!hwmon->ddat.reset_in_progress)
+			break;
+
+		if (signal_pending(current)) {
+			ret = -EINTR;
+			break;
+		}
+
+		mutex_unlock(&hwmon->hwmon_lock);
+
+		schedule();
+	}
+	finish_wait(&ddat->waitq, &wait);
+	if (ret)
+		goto unlock;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
+	if (value == PL1_DISABLE) {
+		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
+				  PKG_PWR_LIM_1_EN, 0);
+		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
+				  PKG_PWR_LIM_1_EN, 0);
+
+		if (nval & PKG_PWR_LIM_1_EN)
+			ret = -ENODEV;
+		goto exit;
+	}
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
+	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
+			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
+exit:
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return 0;
+}
+
+static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
+{
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 reg_val;
+
+	process_hwmon_reg(ddat, pkg_power_sku, reg_read, &reg_val, 0, 0);
+	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	return 0;
+}
+
 static const struct hwmon_channel_info *hwm_info[] = {
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
 	NULL
 };
 
+static umode_t
+hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
+{
+	u32 reg_val;
+
+	switch (attr) {
+	case hwmon_power_max:
+		return process_hwmon_reg(ddat, pkg_rapl_limit,
+					 reg_read, &reg_val, 0, 0) ? 0 : 0664;
+	case hwmon_power_rated_max:
+		return process_hwmon_reg(ddat, pkg_power_sku,
+					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return hwm_power_max_read(ddat, val);
+	case hwmon_power_rated_max:
+		return hwm_power_rated_max_read(ddat, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return hwm_power_max_write(ddat, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct hwm_drvdata *ddat = &hwmon->ddat;
+	u32 r;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
+					reg_read, &r, 0, 0))
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	hwmon->ddat.reset_in_progress = true;
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
+			  PKG_PWR_LIM_1_EN, 0);
+	*old = !!(r & PKG_PWR_LIM_1_EN);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+}
+
+void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct hwm_drvdata *ddat = &hwmon->ddat;
+	u32 r;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
+					reg_read, &r, 0, 0))
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
+			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
+
+	hwmon->ddat.reset_in_progress = false;
+	wake_up_all(&hwmon->ddat.waitq);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
 {
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
 	switch (type) {
+	case hwmon_power:
+		ret = hwm_power_is_visible(ddat, attr, channel);
+		break;
 	default:
-		return 0;
+		ret = 0;
 	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
 }
 
 static int
 hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	 int channel, long *val)
 {
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
 	switch (type) {
+	case hwmon_power:
+		ret = hwm_power_read(ddat, attr, channel, val);
+		break;
 	default:
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		break;
 	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
 }
 
 static int
 hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	  int channel, long val)
 {
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
 	switch (type) {
+	case hwmon_power:
+		ret = hwm_power_write(ddat, attr, channel, val);
+		break;
 	default:
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		break;
 	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
 }
 
 static const struct hwmon_ops hwm_ops = {
@@ -66,8 +407,19 @@ static const struct hwmon_chip_info hwm_chip_info = {
 };
 
 static void
-hwm_get_preregistration_info(struct xe_device *xe)
+hwm_get_preregistration_info(struct hwm_drvdata *ddat)
 {
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 val_sku_unit = 0;
+	int ret;
+
+	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
+	/*
+	 * The contents of register pkg_power_sku_unit do not change,
+	 * so read it once and store the shift values.
+	 */
+	if (!ret)
+		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 }
 
 void xe_hwmon_register(struct xe_device *xe)
@@ -89,18 +441,24 @@ void xe_hwmon_register(struct xe_device *xe)
 	mutex_init(&hwmon->hwmon_lock);
 	ddat = &hwmon->ddat;
 
+	/* primary GT to access device level properties */
+	ddat->gt = xe->tiles[0].primary_gt;
+
 	ddat->hwmon = hwmon;
 	snprintf(ddat->name, sizeof(ddat->name), "xe");
 
-	hwm_get_preregistration_info(xe);
+	init_waitqueue_head(&ddat->waitq);
 
-	drm_dbg(&xe->drm, "Register HWMON interface\n");
+	hwm_get_preregistration_info(ddat);
 
-	/*  hwmon_dev points to device hwmon<i> */
+	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
+
+	/* hwmon_dev points to device hwmon<i> */
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwm_chip_info,
 							 NULL);
+
 	if (IS_ERR(hwmon_dev)) {
 		drm_warn(&xe->drm, "Fail to register xe hwmon\n");
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
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..9df5a3a85dc3 100644
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

