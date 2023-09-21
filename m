Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DF6C04AAB
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 17:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjIURFU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjIURFF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 13:05:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949F7CF7
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695315804; x=1726851804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NRHRP74hthLp9UAAOinRfehyp0IFpGkllpWfOYLwmEo=;
  b=AfJaCwZ/rjN2KyxYzfmrEe53twRSZldzS79kJmNgd/x+BxSGDG79xX/U
   5D+NqYPLa3HMWLZgRkekb+3E5peEyM5WmGx5QP/EPYSB4/4IR6fn0aawJ
   XVjyhV2nobglB4PPKx+izY7XZyV90y6t7zfL2/5ZIDWIkrrHfVM0pHWM+
   fIkN88vWUwJKsjcDSc5/vIbVPs1mwcizyeK23+u3JRSW5Cbma0GxtB2Wf
   O/3EHGZWpZubyWjjff2s9aQBYSDLtebPnFUbQlUvdlydkdiXyKhEVqD2/
   0NWPXUU5QxVndOHX1P9i1jcXHu4N4QHoOALUTAowu42FcGIsii/j3eBfQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466788347"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466788347"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740573647"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="740573647"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 03:18:09 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH v5 2/6] drm/xe/hwmon: Expose power attributes
Date:   Thu, 21 Sep 2023 15:55:15 +0530
Message-Id: <20230921102519.3355538-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921102519.3355538-1-badal.nilawar@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose Card reactive sustained (pl1) power limit as power_max and
card default power limit (tdp) as power_rated_max.

v2:
  - Fix review comments (Riana)
v3:
  - Use drmm_mutex_init (Matt Brost)
  - Print error value (Matt Brost)
  - Convert enums to uppercase (Matt Brost)
  - Avoid extra reg read in hwmon_is_visible function (Riana)
  - Use xe_device_assert_mem_access when applicable (Matt Brost)
  - Add intel-xe@lists.freedesktop.org in Documentation (Matt Brost)
v4:
  - Use prefix xe_hwmon prefix for all functions (Matt Brost/Andi)
  - %s/hwmon_reg/xe_hwmon_reg (Andi)
  - Fix review comments (Guenter/Andi)
v5:
  - Fix review comments (Riana)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  33 ++
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 358 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
 8 files changed, 445 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
new file mode 100644
index 000000000000..da0197a29fe4
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -0,0 +1,22 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
+Date:		September 2023
+KernelVersion:	6.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically seconds)
+		exceeds this limit. A read value of 0 means that the PL1
+		power limit is disabled, writing 0 disables the
+		limit. Writing values > 0 and <= TDP will enable the power limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
+Date:		September 2023
+KernelVersion:	6.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Card default power limit (default TDP setting).
+
+		Only supported for particular Intel xe graphics platforms.
+
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 86c8bd4c05a3..ca77aff60d48 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -117,6 +117,9 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+# graphics hardware monitoring (HWMON) support
+xe-$(CONFIG_HWMON) += xe_hwmon.o
+
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e13fbbdf6929..679cdba9f383 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -410,4 +410,8 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
+#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
+#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
new file mode 100644
index 000000000000..27f1d42baf6d
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MCHBAR_REGS_H_
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
+#define   PKG_TDP				GENMASK_ULL(14, 0)
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
+#endif /* _XE_MCHBAR_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6bcb6c3482e..2acdc22a6027 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
+#include "xe_hwmon.h"
 
 #ifdef CONFIG_LOCKDEP
 struct lockdep_map xe_device_mem_access_lockdep_map = {
@@ -337,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_pmu_register(&xe->pmu);
 
+	xe_hwmon_register(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a82f28c6a3a0..d1e319f305ef 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -365,6 +365,8 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	struct xe_hwmon *hwmon;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
new file mode 100644
index 000000000000..7f4599d98541
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/hwmon.h>
+
+#include <drm/drm_managed.h>
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_mchbar_regs.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_hwmon.h"
+#include "xe_mmio.h"
+
+enum xe_hwmon_reg {
+	REG_PKG_RAPL_LIMIT,
+	REG_PKG_POWER_SKU,
+	REG_PKG_POWER_SKU_UNIT,
+};
+
+enum xe_hwmon_reg_operation {
+	REG_READ,
+	REG_WRITE,
+	REG_RMW,
+};
+
+/*
+ * SF_* - scale factors for particular quantities according to hwmon spec.
+ */
+#define SF_POWER	1000000		/* microwatts */
+
+struct xe_hwmon {
+	struct device *hwmon_dev;
+	struct xe_gt *gt;
+	struct mutex hwmon_lock; /* rmw operations*/
+	int scl_shift_power;
+};
+
+static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
+{
+	struct xe_device *xe = gt_to_xe(hwmon->gt);
+	struct xe_reg reg = XE_REG(0);
+
+	switch (hwmon_reg) {
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
+		XE_MISSING_CASE(hwmon_reg);
+		break;
+	}
+
+	return reg.raw;
+}
+
+static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				enum xe_hwmon_reg_operation operation, u32 *value,
+				u32 clr, u32 set)
+{
+	struct xe_reg reg;
+
+	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	switch (operation) {
+	case REG_READ:
+		*value = xe_mmio_read32(hwmon->gt, reg);
+		return 0;
+	case REG_WRITE:
+		xe_mmio_write32(hwmon->gt, reg, *value);
+		return 0;
+	case REG_RMW:
+		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
+		return 0;
+	default:
+		XE_MISSING_CASE(operation);
+		return -EOPNOTSUPP;
+	}
+}
+
+int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
+{
+	struct xe_reg reg;
+
+	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
+
+	if (!reg.raw)
+		return -EOPNOTSUPP;
+
+	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
+
+	return 0;
+}
+
+#define PL1_DISABLE 0
+
+/*
+ * HW allows arbitrary PL1 limits to be set but silently clamps these values to
+ * "typical but not guaranteed" min/max values in REG_PKG_POWER_SKU. Follow the
+ * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
+ * clamped values when read.
+ */
+static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
+{
+	u32 reg_val;
+	u64 reg_val64, min, max;
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
+	/* Check if PL1 limit is disabled */
+	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
+		*value = PL1_DISABLE;
+		return 0;
+	}
+
+	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &reg_val64);
+	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
+	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
+	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
+	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
+
+	if (min && max)
+		*value = clamp_t(u64, *value, min, max);
+
+	return 0;
+}
+
+static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
+{
+	u32 reg_val;
+
+	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
+	if (value == PL1_DISABLE) {
+		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
+				     PKG_PWR_LIM_1_EN, 0);
+		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
+				     PKG_PWR_LIM_1_EN, 0);
+
+		if (reg_val & PKG_PWR_LIM_1_EN)
+			return -ENODEV;
+	}
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
+	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
+			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
+
+	return 0;
+}
+
+static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
+{
+	u32 reg_val;
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
+	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
+	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *hwmon_info[] = {
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
+	NULL
+};
+
+static umode_t
+xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
+	case hwmon_power_rated_max:
+		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return xe_hwmon_power_max_read(hwmon, val);
+	case hwmon_power_rated_max:
+		return xe_hwmon_power_rated_max_read(hwmon, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
+{
+	switch (attr) {
+	case hwmon_power_max:
+		return xe_hwmon_power_max_write(hwmon, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t
+xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		    u32 attr, int channel)
+{
+	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	switch (type) {
+	case hwmon_power:
+		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
+		break;
+	default:
+		ret = 0;
+		break;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return ret;
+}
+
+static int
+xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	      int channel, long *val)
+{
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	switch (type) {
+	case hwmon_power:
+		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return ret;
+}
+
+static int
+xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	       int channel, long val)
+{
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	switch (type) {
+	case hwmon_power:
+		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return ret;
+}
+
+static const struct hwmon_ops hwmon_ops = {
+	.is_visible = xe_hwmon_is_visible,
+	.read = xe_hwmon_read,
+	.write = xe_hwmon_write,
+};
+
+static const struct hwmon_chip_info hwmon_chip_info = {
+	.ops = &hwmon_ops,
+	.info = hwmon_info,
+};
+
+static void
+xe_hwmon_get_preregistration_info(struct xe_device *xe)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	u32 val_sku_unit = 0;
+	int ret;
+
+	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
+	/*
+	 * The contents of register PKG_POWER_SKU_UNIT do not change,
+	 * so read it once and store the shift values.
+	 */
+	if (!ret)
+		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
+}
+
+void xe_hwmon_register(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	struct xe_hwmon *hwmon;
+
+	/* hwmon is available only for dGfx */
+	if (!IS_DGFX(xe))
+		return;
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return;
+
+	xe->hwmon = hwmon;
+
+	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
+
+	/* primary GT to access device level properties */
+	hwmon->gt = xe->tiles[0].primary_gt;
+
+	xe_hwmon_get_preregistration_info(xe);
+
+	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
+
+	/*  hwmon_dev points to device hwmon<i> */
+	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
+								"xe",
+								hwmon,
+								&hwmon_chip_info,
+								NULL);
+	if (IS_ERR(hwmon->hwmon_dev)) {
+		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
+		xe->hwmon = NULL;
+		return;
+	}
+}
+
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
new file mode 100644
index 000000000000..1ec45cf1d19b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_HWMON_H_
+#define _XE_HWMON_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+#if IS_REACHABLE(CONFIG_HWMON)
+void xe_hwmon_register(struct xe_device *xe);
+#else
+static inline void xe_hwmon_register(struct xe_device *xe) { };
+#endif
+
+#endif /* _XE_HWMON_H_ */
-- 
2.25.1

