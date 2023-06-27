Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C3BEB64DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjF0SZ0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjF0SZZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 14:25:25 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A8DB8
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2023 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687890324; x=1719426324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hl129/YqoYIjgSAwAgpPA/WuYYGLMTYEGeeGW0rdG/s=;
  b=Xc+LOWEm5CY/wm0boc4vi0fZcTB1YbNxvvlr+heysQncSW91dYbzEgKw
   ZeWr3NVLOOSzL+zzsD/Mv3xP/XIHrmFfACHNKcKhQ/SDzK7Zuw6nQ45yt
   phkQYfL41QdWlwnxnNe6VCvFfoVtH1oshORDSALHUlFd/dxH59j98NJWj
   LrrFrlAQh45hLY+Eq8ZlpTohUYKna4TYIChwqNTKH5lbrxsC6dHZFg3Nn
   6GmhIcMVP/o9VJbWZ9iVYv9m/aIwoi+cJZX3MiE2R+KS8jq3OrMCYbO0Y
   q7cgoNydKO7+S6YAjkIjzJzaRmALpz4qIzZLUbTHY6Zmuaey98giPRvWu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148960"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="359148960"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767220"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="829767220"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:21 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 5/6] drm/xe/hwmon: Expose hwmon energy attribute
Date:   Wed, 28 Jun 2023 00:00:42 +0530
Message-Id: <20230627183043.2024530-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627183043.2024530-1-badal.nilawar@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose hwmon energy attribute to show device level and gt
level energy usage
This is port from i915 hwmon.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  12 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 208 +++++++++++++++++-
 4 files changed, 224 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 33a793b58157..f76f4c691946 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -52,3 +52,15 @@ Description:	RO. Current Voltage in millivolt.
 
 		Only supported for particular Intel xe graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
+Date:		July 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RO. Energy input of device or tile in microjoules.
+
+		For xe device level hwmon devices (name "xe") this
+		reflects energy input for the entire device. For gt level
+		hwmon devices (name "xe_tileN") this reflects energy input
+		for the gt.
+
+		Only supported for particular Intel xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cc452ec999fc..8819b934a592 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -400,8 +400,10 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
 #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
 #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
+#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
 
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index cb2d49b5c8a9..473a44bd7c56 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -25,6 +25,9 @@
 
 #define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
 #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
+#define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
+
+#define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
 
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 06b4251f26fd..2faf0f43f2d5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -22,6 +22,8 @@ enum hwm_reg_name {
 	pkg_power_sku,
 	pkg_power_sku_unit,
 	gt_perf_status,
+	energy_status_all,
+	energy_status_tile,
 };
 
 enum hwm_reg_operation {
@@ -35,10 +37,17 @@ enum hwm_reg_operation {
  * - power  - microwatts
  * - curr   - milliamperes
  * - voltage  - millivolts
+ * - energy - microjoules
  */
 #define SF_POWER	1000000
 #define SF_CURR		1000
 #define SF_VOLTAGE	1000
+#define SF_ENERGY	1000000
+
+struct hwm_energy_info {
+	u32 reg_val_prev;
+	long accum_energy;		/* Accumulated energy for energy1_input */
+};
 
 struct hwm_drvdata {
 	struct xe_hwmon *hwmon;
@@ -47,12 +56,16 @@ struct hwm_drvdata {
 	char name[12];
 	bool reset_in_progress;
 	wait_queue_head_t waitq;
+	struct hwm_energy_info ei;	/*  Energy info for energy1_input */
+	int gt_n;
 };
 
 struct xe_hwmon {
 	struct hwm_drvdata ddat;
+	struct hwm_drvdata ddat_tile[XE_MAX_TILES_PER_DEVICE];
 	struct mutex hwmon_lock;
 	int scl_shift_power;
+	int scl_shift_energy;
 };
 
 struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
@@ -83,6 +96,18 @@ struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
 			return GT_PERF_STATUS;
 		else
 			return XE_REG(0);
+	case energy_status_all:
+		if (IS_DG2(gt_to_xe(ddat->gt)))
+			return PCU_CR_PACKAGE_ENERGY_STATUS;
+		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
+			return PVC_GT0_PLATFORM_ENERGY_STATUS;
+		else
+			return XE_REG(0);
+	case energy_status_tile:
+		if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
+			return PVC_GT0_PACKAGE_ENERGY_STATUS;
+		else
+			return XE_REG(0);
 	default:
 		break;
 	}
@@ -246,10 +271,69 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
 	return 0;
 }
 
+/*
+ * hwm_energy - Obtain energy value
+ *
+ * The underlying energy hardware register is 32-bits and is subject to
+ * overflow. How long before overflow? For example, with an example
+ * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
+ * a power draw of 1000 watts, the 32-bit counter will overflow in
+ * approximately 4.36 minutes.
+ *
+ * Examples:
+ *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
+ * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
+ *
+ * The function significantly increases overflow duration (from 4.36
+ * minutes) by accumulating the energy register into a 'long' as allowed by
+ * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
+ * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
+ * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
+ * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
+ */
+static void
+hwm_energy(struct hwm_drvdata *ddat, long *energy)
+{
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	struct hwm_energy_info *ei = &ddat->ei;
+	u32 reg_val;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	if (ddat->gt_n >= 0)
+		process_hwmon_reg(ddat, energy_status_tile, reg_read,
+				  &reg_val, 0, 0);
+	else
+		process_hwmon_reg(ddat, energy_status_all, reg_read,
+				  &reg_val, 0, 0);
+
+	if (reg_val >= ei->reg_val_prev)
+		ei->accum_energy += reg_val - ei->reg_val_prev;
+	else
+		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
+
+	ei->reg_val_prev = reg_val;
+
+	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
+				  hwmon->scl_shift_energy);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+}
+
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
+	NULL
+};
+
+static const struct hwmon_channel_info *hwm_gt_info[] = {
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
 	NULL
 };
 
@@ -483,6 +567,36 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
 	return ret;
 }
 
+static umode_t
+hwm_energy_is_visible(struct hwm_drvdata *ddat, u32 attr)
+{
+	u32 reg_val;
+
+	switch (attr) {
+	case hwmon_energy_input:
+		if (ddat->gt_n >= 0)
+			return process_hwmon_reg(ddat, energy_status_tile, reg_read,
+						 &reg_val, 0, 0) ? 0 : 0444;
+		else
+			return process_hwmon_reg(ddat, energy_status_all, reg_read,
+						 &reg_val, 0, 0) ? 0 : 0444;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_energy_input:
+		hwm_energy(ddat, val);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -502,6 +616,9 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_in:
 		ret = hwm_in_is_visible(ddat, attr);
 		break;
+	case hwmon_energy:
+		ret = hwm_energy_is_visible(ddat, attr);
+		break;
 	default:
 		ret = 0;
 	}
@@ -530,6 +647,9 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_in:
 		ret = hwm_in_read(ddat, attr, val);
 		break;
+	case hwmon_energy:
+		ret = hwm_energy_read(ddat, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -577,11 +697,53 @@ static const struct hwmon_chip_info hwm_chip_info = {
 	.info = hwm_info,
 };
 
+static umode_t
+hwm_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		  u32 attr, int channel)
+{
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+
+	switch (type) {
+	case hwmon_energy:
+		return hwm_energy_is_visible(ddat, attr);
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	    int channel, long *val)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_energy:
+		return hwm_energy_read(ddat, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops hwm_gt_ops = {
+	.is_visible = hwm_gt_is_visible,
+	.read = hwm_gt_read,
+};
+
+static const struct hwmon_chip_info hwm_gt_chip_info = {
+	.ops = &hwm_gt_ops,
+	.info = hwm_gt_info,
+};
+
 static void
 hwm_get_preregistration_info(struct hwm_drvdata *ddat)
 {
 	struct xe_hwmon *hwmon = ddat->hwmon;
+	struct xe_device *xe = gt_to_xe(ddat->gt);
+	struct xe_gt *gt;
+	long energy;
 	u32 val_sku_unit = 0;
+	u8 id;
 	int ret;
 
 	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
@@ -589,8 +751,22 @@ hwm_get_preregistration_info(struct hwm_drvdata *ddat)
 	 * The contents of register pkg_power_sku_unit do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (!ret)
+	if (!ret) {
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
+		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+	}
+
+	/*
+	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
+	 * first value of the energy register read
+	 */
+	if (hwm_is_visible(ddat, hwmon_energy, hwmon_energy_input, 0))
+		hwm_energy(ddat, &energy);
+
+	for_each_gt(gt, xe, id)
+		if (hwm_gt_is_visible(&hwmon->ddat_tile[id], hwmon_energy,
+				      hwmon_energy_input, 0))
+			hwm_energy(&hwmon->ddat_tile[id], &energy);
 }
 
 void xe_hwmon_register(struct xe_device *xe)
@@ -599,6 +775,9 @@ void xe_hwmon_register(struct xe_device *xe)
 	struct xe_hwmon *hwmon;
 	struct device *hwmon_dev;
 	struct hwm_drvdata *ddat;
+	struct hwm_drvdata *ddat_tile;
+	struct xe_gt *gt;
+	u8 id;
 
 	/* hwmon is available only for dGfx */
 	if (!IS_DGFX(xe))
@@ -614,12 +793,22 @@ void xe_hwmon_register(struct xe_device *xe)
 
 	/* primary GT to access device level properties */
 	ddat->gt = xe->tiles[0].primary_gt;
+//	ddat->gt = &xe->gt[0];
+	ddat->gt_n = -1;
 
 	ddat->hwmon = hwmon;
 	snprintf(ddat->name, sizeof(ddat->name), "xe");
 
 	init_waitqueue_head(&ddat->waitq);
 
+	for_each_gt(gt, xe, id) {
+		ddat_tile = hwmon->ddat_tile + id;
+		ddat_tile->hwmon = hwmon;
+		ddat_tile->gt = gt;
+		snprintf(ddat_tile->name, sizeof(ddat_tile->name), "xe_tile%u", id);
+		ddat_tile->gt_n = id;
+	}
+
 	hwm_get_preregistration_info(ddat);
 
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
@@ -637,6 +826,23 @@ void xe_hwmon_register(struct xe_device *xe)
 	}
 
 	ddat->hwmon_dev = hwmon_dev;
+
+	for_each_gt(gt, xe, id) {
+		ddat_tile = hwmon->ddat_tile + id;
+		/*
+		 * Create per-gt directories only if a per-gt attribute is
+		 * visible. Currently this is only energy
+		 */
+		if (!hwm_gt_is_visible(ddat_tile, hwmon_energy, hwmon_energy_input, 0))
+			continue;
+
+		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_tile->name,
+								 ddat_tile,
+								 &hwm_gt_chip_info,
+								 NULL);
+		if (!IS_ERR(hwmon_dev))
+			ddat_tile->hwmon_dev = hwmon_dev;
+	}
 }
 
 void xe_hwmon_unregister(struct xe_device *xe)
-- 
2.25.1

