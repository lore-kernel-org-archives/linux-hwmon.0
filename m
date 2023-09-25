Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97D9CE7A8C
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 08:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbjIYIMv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 04:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbjIYIMJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 04:12:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6474CFA
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695629519; x=1727165519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TFpdthz2rdFZpFkr270pk7VWR6XbDJR0PaBFVQpgwNA=;
  b=a4r9w4fD8jQKGYHLDYhKvTpd2hIjXKag13GHWADFE7husOm7n1XVPMmB
   fSH+rk9YEMgYyUS91xMSJ6JlfyubI79XRQV30mOzwNb9WbGebJohP/qjs
   94+AZQPSv8WhwAUMYPP35uave2nVTdKtzHMCNKq/I154gH8bHshUqi8HP
   FZcYecr6QzarcSllPJ77QLIy0x4GyCfCxrAJErQr2WswZl8gcz+i9YjoR
   K7qAvyv9j8ElCyNuIKGB33zbP0lu9aRn3XQM449GPc7xqAcnK/+YhdWy2
   BFxARPnCbeZuNW9cY6C0Qwkb/uglyc5bBLJWCMVjeg88wI2DluMWMtQJk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467482509"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="467482509"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 01:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079126962"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="1079126962"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 01:11:33 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH v6 4/5] drm/xe/hwmon: Expose hwmon energy attribute
Date:   Mon, 25 Sep 2023 13:48:41 +0530
Message-Id: <20230925081842.3566834-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925081842.3566834-1-badal.nilawar@intel.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose hwmon energy attribute to show device level energy usage

v2:
  - %s/hwm_/hwmon_/
  - Convert enums to upper case
v3:
  - %s/hwmon_/xe_hwmon
  - Remove gt specific hwmon attributes
v4:
 - %s/REG_PKG_ENERGY_STATUS/REG_ENERGY_STATUS_ALL (Riana)
 - %s/hwmon_energy_info/xe_hwmon_energy_info (Riana)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   7 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 105 +++++++++++++++++-
 4 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 7f9407c20864..1a7a6c23e141 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -52,3 +52,10 @@ Description:	RO. Current Voltage in millivolt.
 
 		Only supported for particular Intel xe graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
+Date:		September 2023
+KernelVersion:	6.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Energy input of device in microjoules.
+
+		Only supported for particular Intel xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 102663cbc320..9e6ce74fdd68 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -413,8 +413,10 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
 #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
 #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
+#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
 
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 27f1d42baf6d..d8ecbe1858d1 100644
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
index 1079145c81c9..1deb5007e1e2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -22,6 +22,7 @@ enum xe_hwmon_reg {
 	REG_PKG_POWER_SKU,
 	REG_PKG_POWER_SKU_UNIT,
 	REG_GT_PERF_STATUS,
+	REG_PKG_ENERGY_STATUS,
 };
 
 enum xe_hwmon_reg_operation {
@@ -36,12 +37,20 @@ enum xe_hwmon_reg_operation {
 #define SF_POWER	1000000		/* microwatts */
 #define SF_CURR		1000		/* milliamperes */
 #define SF_VOLTAGE	1000		/* millivolts */
+#define SF_ENERGY	1000000		/* microjoules */
+
+struct xe_hwmon_energy_info {
+	u32 reg_val_prev;
+	long accum_energy;		/* Accumulated energy for energy1_input */
+};
 
 struct xe_hwmon {
 	struct device *hwmon_dev;
 	struct xe_gt *gt;
 	struct mutex hwmon_lock; /* rmw operations*/
 	int scl_shift_power;
+	int scl_shift_energy;
+	struct xe_hwmon_energy_info ei;	/*  Energy info for energy1_input */
 };
 
 static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
@@ -72,6 +81,12 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
 		if (xe->info.platform == XE_DG2)
 			reg = GT_PERF_STATUS;
 		break;
+	case REG_PKG_ENERGY_STATUS:
+		if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
+		else if (xe->info.platform == XE_PVC)
+			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
+		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
 		break;
@@ -193,10 +208,59 @@ static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
 	return 0;
 }
 
+/*
+ * xe_hwmon_energy_get - Obtain energy value
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
+xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
+{
+	struct xe_hwmon_energy_info *ei = &hwmon->ei;
+	u32 reg_val;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ,
+			     &reg_val, 0, 0);
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
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+}
+
 static const struct hwmon_channel_info *hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
 	NULL
 };
 
@@ -370,6 +434,29 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 	return ret;
 }
 
+static umode_t
+xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr)
+{
+	switch (attr) {
+	case hwmon_energy_input:
+		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_energy_input:
+		xe_hwmon_energy_get(hwmon, val);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		    u32 attr, int channel)
@@ -389,6 +476,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_in:
 		ret = xe_hwmon_in_is_visible(hwmon, attr);
 		break;
+	case hwmon_energy:
+		ret = xe_hwmon_energy_is_visible(hwmon, attr);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -418,6 +508,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_in:
 		ret = xe_hwmon_in_read(hwmon, attr, val);
 		break;
+	case hwmon_energy:
+		ret = xe_hwmon_energy_read(hwmon, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -469,6 +562,7 @@ static void
 xe_hwmon_get_preregistration_info(struct xe_device *xe)
 {
 	struct xe_hwmon *hwmon = xe->hwmon;
+	long energy;
 	u32 val_sku_unit = 0;
 	int ret;
 
@@ -477,8 +571,17 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
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
+	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
+	 * first value of the energy register read
+	 */
+	if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, 0))
+		xe_hwmon_energy_get(hwmon, &energy);
 }
 
 void xe_hwmon_register(struct xe_device *xe)
-- 
2.25.1

