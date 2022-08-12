Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AC6C28B2B
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Aug 2022 17:36:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239109AbiHLRgQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Aug 2022 13:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239513AbiHLRfx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Aug 2022 13:35:53 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B8F8D3D1
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2022 10:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660325749; x=1691861749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BvwkWW3APDZ5fWTsKBfO8G2B+e1K5eBFEpeau55O7qY=;
  b=O6WkhV8VicplZAlohvORs7vsG6m08oAmqSopwWqA0/7ZdLfzX5yLFGft
   qr8N1K6L9hYTsRUNqPELzFwy5vkddRjEteHGMTs9khkfbLGxs22LpfpQa
   ucohm7HCJMRHHIHTce8Cw6/rRpjqZYoPHJFSXUpoIg/fvllxZW/EyerUW
   i7ajKVC72ZA7j8XgHr3p7/Liuw6XdKJtNxPM8Yv/9HAelX5Do+gAgKKrV
   DzgswkTFNkdA2cHXvHsImDcTKxtgwPbFMuPorKfuCsv5fa6nkT2/UKEyv
   tGbMAkobLM2QfMtr1Qds0HAhEVmf8YJWLr5hz27rEy8dZsLymFyYFzv8V
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="291644079"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="291644079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 10:35:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="665904304"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 10:35:46 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, anshuman.gupta@intel.com,
        jon.ewins@intel.com, linux@roeck-us.net
Subject: [PATCH 7/7] drm/i915/hwmon: Extend power/energy for XEHPSDV
Date:   Fri, 12 Aug 2022 23:07:15 +0530
Message-Id: <20220812173715.2398586-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812173715.2398586-1-badal.nilawar@intel.com>
References: <20220812173715.2398586-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Dale B Stimson <dale.b.stimson@intel.com>

Extend hwmon power/energy for XEHPSDV especially per gt level energy
usage.

v2: Update to latest HWMON spec (Ashutosh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |   7 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   5 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 120 +++++++++++++++++-
 3 files changed, 128 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 34668f6c2dc4..e69bc43d4c9e 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -65,6 +65,11 @@ What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
 Date:		June 2022
 KernelVersion:	5.19
 Contact:	dri-devel@lists.freedesktop.org
-Description:	RO. Energy input of device in microjoules.
+Description:	RO. Energy input of device or gt in microjoules.
+
+		For i915 device level hwmon devices (name "i915") this
+		reflects energy input for the entire device. For gt level
+		hwmon devices (name "i915_gtN") this reflects energy input
+		for the gt.
 
 		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 4604f6dbf8b6..dc3bc07cdd24 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1569,4 +1569,9 @@
 
 #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
 
+#define GT0_PACKAGE_ENERGY_STATUS		_MMIO(0x250004)
+#define GT0_PACKAGE_RAPL_LIMIT			_MMIO(0x250008)
+#define GT0_PACKAGE_POWER_SKU_UNIT		_MMIO(0x250068)
+#define GT0_PLATFORM_ENERGY_STATUS		_MMIO(0x25006c)
+
 #endif /* __INTEL_GT_REGS__ */
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 6760133c7905..4c2e8d3cfe52 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -11,6 +11,7 @@
 #include "i915_hwmon.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pcode.h"
+#include "gt/intel_gt.h"
 #include "gt/intel_gt_regs.h"
 
 /*
@@ -20,7 +21,7 @@
  * - curr   - milliamperes
  * - energy - microjoules
  */
-#define SF_TIME            1000
+#define SF_TIME		1000
 #define SF_POWER	1000000
 #define SF_CURR		1000
 #define SF_ENERGY	1000000
@@ -36,6 +37,7 @@ struct hwm_reg {
 	i915_reg_t pkg_power_sku;
 	i915_reg_t pkg_rapl_limit;
 	i915_reg_t energy_status_all;
+	i915_reg_t energy_status_tile;
 };
 
 struct hwm_energy_info {
@@ -49,10 +51,12 @@ struct hwm_drvdata {
 	struct device *hwmon_dev;
 	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
 	char name[12];
+	int gt_n;
 };
 
 struct i915_hwmon {
 	struct hwm_drvdata ddat;
+	struct hwm_drvdata ddat_gt[I915_MAX_GT];
 	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
 	struct hwm_reg rg;
 	u32 power_max_initial_value;
@@ -148,7 +152,10 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	i915_reg_t rgaddr;
 	u32 reg_val;
 
-	rgaddr = hwmon->rg.energy_status_all;
+	if (ddat->gt_n >= 0)
+		rgaddr = hwmon->rg.energy_status_tile;
+	else
+		rgaddr = hwmon->rg.energy_status_all;
 
 	if (!i915_mmio_reg_valid(rgaddr))
 		return -EOPNOTSUPP;
@@ -310,6 +317,11 @@ static const struct hwmon_channel_info *hwm_info[] = {
 	NULL
 };
 
+static const struct hwmon_channel_info *hwm_gt_info[] = {
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
+	NULL
+};
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int hwm_pcode_read_i1(struct drm_i915_private *i915, u32 *uval)
 {
@@ -442,7 +454,10 @@ hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
 
 	switch (attr) {
 	case hwmon_energy_input:
-		rgaddr = hwmon->rg.energy_status_all;
+		if (ddat->gt_n >= 0)
+			rgaddr = hwmon->rg.energy_status_tile;
+		else
+			rgaddr = hwmon->rg.energy_status_all;
 		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
 	default:
 		return 0;
@@ -577,6 +592,44 @@ static const struct hwmon_chip_info hwm_chip_info = {
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
 hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
@@ -585,7 +638,9 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 	struct hwm_drvdata *ddat = &hwmon->ddat;
 	intel_wakeref_t wakeref;
 	u32 val_sku_unit;
+	struct intel_gt *gt;
 	long energy;
+	int i;
 
 	if (IS_DG1(i915) || IS_DG2(i915)) {
 		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
@@ -593,12 +648,21 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
 		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
 		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
+		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
+	} else if (IS_XEHPSDV(i915)) {
+		hwmon->rg.pkg_power_sku_unit = GT0_PACKAGE_POWER_SKU_UNIT;
+		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
+		hwmon->rg.pkg_rapl_limit = GT0_PACKAGE_RAPL_LIMIT;
+		hwmon->rg.energy_status_all = GT0_PLATFORM_ENERGY_STATUS;
+		hwmon->rg.energy_status_tile = GT0_PACKAGE_ENERGY_STATUS;
+		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 	} else {
 		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
 		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
 		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
+		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
 	}
 
 	with_intel_runtime_pm(uncore->rpm, wakeref) {
@@ -628,6 +692,10 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 	 */
 	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
 		hwm_energy(ddat, &energy);
+	if (i915_mmio_reg_valid(hwmon->rg.energy_status_tile)) {
+		for_each_gt(gt, i915, i)
+			hwm_energy(&hwmon->ddat_gt[i], &energy);
+	}
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
@@ -636,6 +704,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	struct i915_hwmon *hwmon;
 	struct device *hwmon_dev;
 	struct hwm_drvdata *ddat;
+	struct hwm_drvdata *ddat_gt;
+	struct intel_gt *gt;
+	const char *ddname;
+	int i;
 
 	/* hwmon is available only for dGfx */
 	if (!IS_DGFX(i915))
@@ -652,6 +724,16 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	ddat->hwmon = hwmon;
 	ddat->uncore = &i915->uncore;
 	snprintf(ddat->name, sizeof(ddat->name), "i915");
+	ddat->gt_n = -1;
+
+	for_each_gt(gt, i915, i) {
+		ddat_gt = hwmon->ddat_gt + i;
+
+		ddat_gt->hwmon = hwmon;
+		ddat_gt->uncore = gt->uncore;
+		snprintf(ddat_gt->name, sizeof(ddat_gt->name), "i915_gt%u", i);
+		ddat_gt->gt_n = i;
+	}
 
 	hwm_get_preregistration_info(i915);
 
@@ -668,18 +750,50 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	}
 
 	ddat->hwmon_dev = hwmon_dev;
+
+	for_each_gt(gt, i915, i) {
+		ddat_gt = hwmon->ddat_gt + i;
+		/*
+		 * Create per-gt directories only if a per-gt attribute is
+		 * visible. Currently this is only energy
+		 */
+		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
+			continue;
+
+		ddname = ddat_gt->name;
+		hwmon_dev = hwmon_device_register_with_info(dev, ddname,
+							    ddat_gt,
+							    &hwm_gt_chip_info,
+							    NULL);
+		if (!IS_ERR(hwmon_dev))
+			ddat_gt->hwmon_dev = hwmon_dev;
+	}
 }
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
 	struct i915_hwmon *hwmon;
 	struct hwm_drvdata *ddat;
+	struct intel_gt *gt;
+	int i;
 
 	hwmon = fetch_and_zero(&i915->hwmon);
 	if (!hwmon)
 		return;
 
 	ddat = &hwmon->ddat;
+
+	for_each_gt(gt, i915, i) {
+		struct hwm_drvdata *ddat_gt;
+
+		ddat_gt = hwmon->ddat_gt + i;
+
+		if (ddat_gt->hwmon_dev) {
+			hwmon_device_unregister(ddat_gt->hwmon_dev);
+			ddat_gt->hwmon_dev = NULL;
+		}
+	}
+
 	if (ddat->hwmon_dev)
 		hwmon_device_unregister(ddat->hwmon_dev);
 
-- 
2.25.1

