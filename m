Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4FBC001E0
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbjHBNqt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 09:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234126AbjHBNqo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 09:46:44 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B8A269A
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690983999; x=1722519999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wUI/UeVUv5248jkbrzeEPBAcsUiyl9I5LmXuFXWM9i4=;
  b=GR0YuNMebbuXNh0YZqKOW0IJsWz5wVL9GBhXko+zsLh1sBFxS5ZG9gOh
   Vksd8lDEIRkjkZHPTR2F0D6FeFqedbJc205ZyExTD6sfzupteaDbAXJmu
   DrPczP+HPdkBlFHbGkb56FwE51xqNI5L+BnV49tSChHin8cBcwmZ29nIl
   FBjgJCZSjZ8CCikgFaaWfOhajPt/FvBHWAMm0h4UNksPscUdBfkh3CErB
   cj33aEkFW+uHNIptenO0OUPDY/xMTHoNwmkJRoHQshl2fyAQOvxM6nWSE
   5hCkFYnd6ngFgEm/u7AWGkqZ7N6pIUN7OIVi+wkveGPC+0M90ws382TgU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534984"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="400534984"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873955"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="852873955"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:36 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 5/6] drm/xe/hwmon: Expose hwmon energy attribute
Date:   Wed,  2 Aug 2023 19:22:40 +0530
Message-Id: <20230802135241.458855-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802135241.458855-1-badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose hwmon energy attribute to show device level and gt
level energy usage

v2:
  - %s/hwm_/hwmon_/
  - %s/tile_/gt_
  - Convert enums to upper case
  - Print error info for hwmon_gt devices

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  12 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 216 +++++++++++++++++-
 4 files changed, 229 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 167bd9480602..4b2d6e1d0c7f 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -52,3 +52,15 @@ Description:	RO. Current Voltage in millivolt.
 
 		Only supported for particular Intel xe graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
+Date:		August 2023
+KernelVersion:	6.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Energy input of device or gt in microjoules.
+
+		For xe device level hwmon devices (name "xe") this
+		reflects energy input for the entire device. For gt level
+		hwmon devices (name "xe_gtN") this reflects energy input
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
index 3e69cd79c1e2..a337edcebae5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -22,6 +22,8 @@ enum hwmon_reg_name {
 	REG_PKG_POWER_SKU,
 	REG_PKG_POWER_SKU_UNIT,
 	REG_GT_PERF_STATUS,
+	REG_ENERGY_STATUS_ALL,
+	REG_ENERGY_STATUS_GT,
 };
 
 enum hwmon_reg_operation {
@@ -30,31 +32,50 @@ enum hwmon_reg_operation {
 	REG_RMW,
 };
 
+enum xe_hwmon_device_type {
+	HWMON_GT,
+	HWMON_DEVICE,
+};
+
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
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
+struct hwmon_energy_info {
+	u32 reg_val_prev;
+	long accum_energy;		/* Accumulated energy for energy1_input */
+};
 
 struct xe_hwmon_data {
 	struct device *hwmon_dev;
 	struct xe_gt *gt;
 	char name[12];
+	struct hwmon_energy_info ei;	/*  Energy info for energy1_input */
+	enum xe_hwmon_device_type type;
 };
 
 struct xe_hwmon {
 	struct xe_hwmon_data ddat;
+	struct xe_hwmon_data ddat_gt[XE_MAX_TILES_PER_DEVICE];
 	struct mutex hwmon_lock; /* rmw operations*/
 	bool reset_in_progress;
 	wait_queue_head_t waitq;
 	int scl_shift_power;
+	int scl_shift_energy;
 };
 
-#define ddat_to_xe_hwmon(ddat)	({ container_of(ddat, struct xe_hwmon, ddat); })
+#define ddat_to_xe_hwmon(ddat)	\
+	({ ddat->type == HWMON_GT ?	\
+		container_of(ddat, struct xe_hwmon, ddat_gt[ddat->gt->info.id]) :	\
+		container_of(ddat, struct xe_hwmon, ddat); })
 
 static u32 hwmon_get_reg(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_name)
 {
@@ -84,6 +105,16 @@ static u32 hwmon_get_reg(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_nam
 		if (xe->info.platform == XE_DG2)
 			reg = GT_PERF_STATUS;
 		break;
+	case REG_ENERGY_STATUS_ALL:
+		if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
+		else if (xe->info.platform == XE_PVC)
+			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
+		break;
+	case REG_ENERGY_STATUS_GT:
+		if (xe->info.platform == XE_PVC)
+			reg = PVC_GT0_PACKAGE_ENERGY_STATUS;
+		break;
 	default:
 		XE_MISSING_CASE(reg_name);
 		break;
@@ -228,10 +259,69 @@ static int hwmon_power_rated_max_read(struct xe_hwmon_data *ddat, long *value)
 	return 0;
 }
 
+/*
+ * hwmon_energy_get - Obtain energy value
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
+hwmon_energy_get(struct xe_hwmon_data *ddat, long *energy)
+{
+	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
+	struct hwmon_energy_info *ei = &ddat->ei;
+	u32 reg_val;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	if (ddat->type == HWMON_GT)
+		process_hwmon_reg(ddat, REG_ENERGY_STATUS_GT, REG_READ,
+				  &reg_val, 0, 0);
+	else
+		process_hwmon_reg(ddat, REG_ENERGY_STATUS_ALL, REG_READ,
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
 static const struct hwmon_channel_info *hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
+	NULL
+};
+
+static const struct hwmon_channel_info *hwmon_gt_info[] = {
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
 	NULL
 };
 
@@ -449,6 +539,32 @@ hwmon_in_read(struct xe_hwmon_data *ddat, u32 attr, long *val)
 	return ret;
 }
 
+static umode_t
+hwmon_energy_is_visible(struct xe_hwmon_data *ddat, u32 attr)
+{
+	switch (attr) {
+	case hwmon_energy_input:
+		if (ddat->type == HWMON_GT)
+			return hwmon_get_reg(ddat, REG_ENERGY_STATUS_GT) ? 0444 : 0;
+		else
+			return hwmon_get_reg(ddat, REG_ENERGY_STATUS_ALL) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwmon_energy_read(struct xe_hwmon_data *ddat, u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_energy_input:
+		hwmon_energy_get(ddat, val);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		 u32 attr, int channel)
@@ -468,6 +584,9 @@ hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_in:
 		ret = hwmon_in_is_visible(ddat, attr);
 		break;
+	case hwmon_energy:
+		ret = hwmon_energy_is_visible(ddat, attr);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -497,6 +616,9 @@ hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_in:
 		ret = hwmon_in_read(ddat, attr, val);
 		break;
+	case hwmon_energy:
+		ret = hwmon_energy_read(ddat, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -544,12 +666,53 @@ static const struct hwmon_chip_info hwmon_chip_info = {
 	.info = hwmon_info,
 };
 
+static umode_t
+hwmon_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		    u32 attr, int channel)
+{
+	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
+
+	switch (type) {
+	case hwmon_energy:
+		return hwmon_energy_is_visible(ddat, attr);
+	default:
+		return 0;
+	}
+}
+
+static int
+hwmon_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	      int channel, long *val)
+{
+	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_energy:
+		return hwmon_energy_read(ddat, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops hwmon_gt_ops = {
+	.is_visible = hwmon_gt_is_visible,
+	.read = hwmon_gt_read,
+};
+
+static const struct hwmon_chip_info hwmon_gt_chip_info = {
+	.ops = &hwmon_gt_ops,
+	.info = hwmon_gt_info,
+};
+
 static void
 hwmon_get_preregistration_info(struct xe_device *xe)
 {
 	struct xe_hwmon *hwmon = xe->hwmon;
 	struct xe_hwmon_data *ddat = &hwmon->ddat;
+	struct xe_gt *gt;
+	long energy;
 	u32 val_sku_unit = 0;
+	u8 id;
 	int ret;
 
 	ret = process_hwmon_reg(ddat, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
@@ -557,8 +720,22 @@ hwmon_get_preregistration_info(struct xe_device *xe)
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (!ret)
+	if (!ret) {
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
+		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+	}
+
+	/*
+	 * Initialize 'struct hwmon_energy_info', i.e. set fields to the
+	 * first value of the energy register read
+	 */
+	if (hwmon_is_visible(ddat, hwmon_energy, hwmon_energy_input, 0))
+		hwmon_energy_get(ddat, &energy);
+
+	for_each_gt(gt, xe, id)
+		if (hwmon_gt_is_visible(&hwmon->ddat_gt[id], hwmon_energy,
+					hwmon_energy_input, 0))
+			hwmon_energy_get(&hwmon->ddat_gt[id], &energy);
 }
 
 void xe_hwmon_register(struct xe_device *xe)
@@ -567,6 +744,9 @@ void xe_hwmon_register(struct xe_device *xe)
 	struct xe_hwmon *hwmon;
 	struct device *hwmon_dev;
 	struct xe_hwmon_data *ddat;
+	struct xe_hwmon_data *ddat_gt;
+	struct xe_gt *gt;
+	u8 id;
 
 	/* hwmon is available only for dGfx */
 	if (!IS_DGFX(xe))
@@ -583,13 +763,21 @@ void xe_hwmon_register(struct xe_device *xe)
 
 	/* primary GT to access device level properties */
 	ddat->gt = xe->tiles[0].primary_gt;
+	ddat->type = HWMON_DEVICE;
 
 	snprintf(ddat->name, sizeof(ddat->name), "xe");
 
-	hwmon_get_preregistration_info(xe);
-
 	init_waitqueue_head(&hwmon->waitq);
 
+	for_each_gt(gt, xe, id) {
+		ddat_gt = hwmon->ddat_gt + id;
+		ddat_gt->gt = gt;
+		snprintf(ddat_gt->name, sizeof(ddat_gt->name), "xe_gt%u", id);
+		ddat_gt->type = HWMON_GT;
+	}
+
+	hwmon_get_preregistration_info(xe);
+
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
 	/* hwmon_dev points to device hwmon<i> */
@@ -605,6 +793,26 @@ void xe_hwmon_register(struct xe_device *xe)
 	}
 
 	ddat->hwmon_dev = hwmon_dev;
+
+	for_each_gt(gt, xe, id) {
+		ddat_gt = hwmon->ddat_gt + id;
+		/*
+		 * Create per-gt directories only if a per-gt attribute is
+		 * visible. Currently this is only energy
+		 */
+		if (!hwmon_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
+			continue;
+
+		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
+								 ddat_gt,
+								 &hwmon_gt_chip_info,
+								 NULL);
+		if (IS_ERR(hwmon_dev))
+			drm_warn(&xe->drm, "Fail to register xe_gt %d hwmon, Err:%ld\n",
+				 id, PTR_ERR(hwmon_dev));
+		else
+			ddat_gt->hwmon_dev = hwmon_dev;
+	}
 }
 
 void xe_hwmon_unregister(struct xe_device *xe)
-- 
2.25.1

