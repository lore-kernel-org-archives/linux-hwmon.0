Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A11C04A95
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Sep 2022 19:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiIWTy0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Sep 2022 15:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbiIWTyW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 15:54:22 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8E0130BD7
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663962858; x=1695498858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T6ntocwwGqs14xYYkHkr0q+2p+l2XhwnqZSbRB/rALY=;
  b=PhTKugYyWoULvbVe8k0a/vs7ol0O/joCwsSswTLFjDmWfcWAJdmGz6Jc
   E2wG2eT7UISmSVZgSy7hTwyZxuWCa/nNRveoO2dIX0Un0vcBrDsGYsLp5
   aTcQN2Q5z/ovr+hfVgOdVpvJ44iH+bZ1E13PVqJ+kqfSCA87W09E1BCFS
   V999P0TjoT9VznIG5Wl016JsplA7+kkYbi1hhJHn25EKzJHui5aAun+NU
   lNJHxS9uL4LDGIGi1FtzrHicjpGgp0a7R7QYCg+PL1zFlOi4qDd5U1cV2
   CSNnOHNeYvFZx490HJUtioNgaKK021i2b7ymR9wa9Nc/VK4ELZtSj+sXD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300665515"
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; 
   d="scan'208";a="300665515"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 12:54:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; 
   d="scan'208";a="709424399"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 12:54:15 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andi.shyti@intel.com, tvrtko.ursulin@intel.com
Subject: [PATCH 4/7] drm/i915/hwmon: Show device level energy usage
Date:   Sat, 24 Sep 2022 01:26:40 +0530
Message-Id: <20220923195643.2376927-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923195643.2376927-1-badal.nilawar@intel.com>
References: <20220923195643.2376927-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Dale B Stimson <dale.b.stimson@intel.com>

Use i915 HWMON to display device level energy input.

v2: Updated the date and kernel version in feature description
v3:
  - Cleaned up hwm_energy function and removed unused function
    i915_hwmon_energy_status_get (Ashutosh)
v4: KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)

Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |   8 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 107 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_hwmon.h             |   1 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |   2 +
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 16e697b1db3d..7525db243d74 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
 Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel i915 graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
+Date:		February 2023
+KernelVersion:	6.2
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RO. Energy input of device in microjoules.
+
+		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 5d2e68217e8c..60da956fae0e 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -17,21 +17,30 @@
  * SF_* - scale factors for particular quantities according to hwmon spec.
  * - voltage  - millivolts
  * - power  - microwatts
+ * - energy - microjoules
  */
 #define SF_VOLTAGE	1000
 #define SF_POWER	1000000
+#define SF_ENERGY	1000000
 
 struct hwm_reg {
 	i915_reg_t gt_perf_status;
 	i915_reg_t pkg_power_sku_unit;
 	i915_reg_t pkg_power_sku;
 	i915_reg_t pkg_rapl_limit;
+	i915_reg_t energy_status_all;
+};
+
+struct hwm_energy_info {
+	u32 reg_val_prev;
+	long accum_energy;			/* Accumulated energy for energy1_input */
 };
 
 struct hwm_drvdata {
 	struct i915_hwmon *hwmon;
 	struct intel_uncore *uncore;
 	struct device *hwmon_dev;
+	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
 	char name[12];
 };
 
@@ -40,6 +49,7 @@ struct i915_hwmon {
 	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
 	struct hwm_reg rg;
 	int scl_shift_power;
+	int scl_shift_energy;
 };
 
 static void
@@ -98,9 +108,60 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
 					    bits_to_clear, bits_to_set);
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
+static int
+hwm_energy(struct hwm_drvdata *ddat, long *energy)
+{
+	struct intel_uncore *uncore = ddat->uncore;
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	struct hwm_energy_info *ei = &ddat->ei;
+	intel_wakeref_t wakeref;
+	i915_reg_t rgaddr;
+	u32 reg_val;
+
+	rgaddr = hwmon->rg.energy_status_all;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		reg_val = intel_uncore_read(uncore, rgaddr);
+
+	if (reg_val >= ei->reg_val_prev)
+		ei->accum_energy += reg_val - ei->reg_val_prev;
+	else
+		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
+	ei->reg_val_prev = reg_val;
+
+	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
+				  hwmon->scl_shift_energy);
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return 0;
+}
+
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
 	NULL
 };
 
@@ -192,6 +253,32 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 	}
 }
 
+static umode_t
+hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	i915_reg_t rgaddr;
+
+	switch (attr) {
+	case hwmon_energy_input:
+		rgaddr = hwmon->rg.energy_status_all;
+		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
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
+		return hwm_energy(ddat, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -203,6 +290,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		return hwm_in_is_visible(ddat, attr);
 	case hwmon_power:
 		return hwm_power_is_visible(ddat, attr, channel);
+	case hwmon_energy:
+		return hwm_energy_is_visible(ddat, attr);
 	default:
 		return 0;
 	}
@@ -219,6 +308,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return hwm_in_read(ddat, attr, val);
 	case hwmon_power:
 		return hwm_power_read(ddat, attr, channel, val);
+	case hwmon_energy:
+		return hwm_energy_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -254,19 +345,23 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
 	struct i915_hwmon *hwmon = i915->hwmon;
 	struct intel_uncore *uncore = &i915->uncore;
+	struct hwm_drvdata *ddat = &hwmon->ddat;
 	intel_wakeref_t wakeref;
 	u32 val_sku_unit;
+	long energy;
 
 	if (IS_DG1(i915) || IS_DG2(i915)) {
 		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
 		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
 		hwmon->rg.pkg_power_sku = PCU_PACKAGE_POWER_SKU;
 		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
+		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
 	} else {
 		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
 		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
+		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
 	}
 
 	with_intel_runtime_pm(uncore->rpm, wakeref) {
@@ -280,9 +375,17 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		} else {
 			val_sku_unit = 0;
 		}
-
-		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 	}
+
+	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
+	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+
+	/*
+	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
+	 * first value of the energy register read
+	 */
+	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
+		hwm_energy(ddat, &energy);
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
index 7ca9cf2c34c9..4e5b6c149f3a 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.h
+++ b/drivers/gpu/drm/i915/i915_hwmon.h
@@ -17,4 +17,5 @@ static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
 static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
 #endif
 
+int i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy);
 #endif /* __I915_HWMON_H__ */
diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index d7e2e4711792..bd42fb66e297 100644
--- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
@@ -197,7 +197,9 @@
 
 #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
 #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
+#define   PKG_ENERGY_UNIT                      REG_GENMASK(12, 8)
 #define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
+#define PCU_PACKAGE_ENERGY_STATUS              _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x593c)
 
 #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
 #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
-- 
2.25.1

