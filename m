Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227D2E81E1C
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Oct 2023 16:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjJFQyh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 6 Oct 2023 12:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjJFQyh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Oct 2023 12:54:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24D9BF
        for <linux-hwmon@vger.kernel.org>; Fri,  6 Oct 2023 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696611275; x=1728147275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pRLvVvZn5SPm3MkNNE9u6y+IaiIn5My12EDxqQBhSQc=;
  b=b/dfvaM/VNy26JUWs3ofjXD87WPGI3H4QAxm7rOLHxUEeqhRx9cL+MKi
   3S8mGH0gkVIo2cZMsOZNI9ryv8vzsd2bzzRI0Yd3juF0aFluEvH/4J91g
   XtHSihs7PSnkBiv4Cj2bhSd1kLliVkd+X8+65A8EMlntoM/zbcwKYREVf
   BjOlQd9v6lj4AMQpE4YIF2lo6Xlb2C9wbkZgUqDaA0kLzddJO15FPLnNx
   /uxd31hcSMLSYTO+Lwa+Qp/c4A3NsgiKs2w8xV7g3TYg4C5IF5Tbwf+DQ
   QUPjMoZGeUzHL4SCKpBOICvu1c2n4L+XDkl8rnv4yqeJZRIPzeSV1hscP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450276158"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="450276158"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 09:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842894426"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="842894426"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 09:54:32 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        andi.shyti@linux.intel.com, riana.tauro@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH 1/2] drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock
Date:   Fri,  6 Oct 2023 22:32:04 +0530
Message-Id: <20231006170205.4136927-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231006170205.4136927-1-badal.nilawar@intel.com>
References: <20231006170205.4136927-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Take hwmon_lock while accessing hwmon rw attributes. For readonly
attributes its not required to take lock as reads are protected
by sysfs layer and therefore sequential.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 143 +++++++++++++++++-----------------
 1 file changed, 71 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9ac05994a967..391f9a8dd9d7 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -47,7 +47,7 @@ struct xe_hwmon_energy_info {
 struct xe_hwmon {
 	struct device *hwmon_dev;
 	struct xe_gt *gt;
-	struct mutex hwmon_lock; /* rmw operations*/
+	struct mutex hwmon_lock;	/* For rw attributes */
 	int scl_shift_power;
 	int scl_shift_energy;
 	struct xe_hwmon_energy_info ei;	/*  Energy info for energy1_input */
@@ -95,47 +95,45 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
 	return reg.raw;
 }
 
-static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
-				enum xe_hwmon_reg_operation operation, u32 *value,
-				u32 clr, u32 set)
+static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				 enum xe_hwmon_reg_operation operation, u32 *value,
+				 u32 clr, u32 set)
 {
 	struct xe_reg reg;
 
 	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
 
 	if (!reg.raw)
-		return -EOPNOTSUPP;
+		return;
 
 	switch (operation) {
 	case REG_READ:
 		*value = xe_mmio_read32(hwmon->gt, reg);
-		return 0;
+		break;
 	case REG_WRITE:
 		xe_mmio_write32(hwmon->gt, reg, *value);
-		return 0;
+		break;
 	case REG_RMW:
 		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
-		return 0;
+		break;
 	default:
 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
 			 operation);
-		return -EOPNOTSUPP;
+		break;
 	}
 }
 
-static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
-				       enum xe_hwmon_reg hwmon_reg, u64 *value)
+static void xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
+					enum xe_hwmon_reg hwmon_reg, u64 *value)
 {
 	struct xe_reg reg;
 
 	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
 
 	if (!reg.raw)
-		return -EOPNOTSUPP;
+		return;
 
 	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
-
-	return 0;
 }
 
 #define PL1_DISABLE 0
@@ -146,16 +144,18 @@ static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
  * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
  * clamped values when read.
  */
-static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
+static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 {
 	u32 reg_val;
 	u64 reg_val64, min, max;
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
 	/* Check if PL1 limit is disabled */
 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
 		*value = PL1_DISABLE;
-		return 0;
+		goto unlock;
 	}
 
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
@@ -169,14 +169,17 @@ static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 
 	if (min && max)
 		*value = clamp_t(u64, *value, min, max);
-
-	return 0;
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
 }
 
 static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 {
+	int ret = 0;
 	u32 reg_val;
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
 	if (value == PL1_DISABLE) {
 		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
@@ -184,8 +187,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
 				     PKG_PWR_LIM_1_EN, 0);
 
-		if (reg_val & PKG_PWR_LIM_1_EN)
-			return -EOPNOTSUPP;
+		if (reg_val & PKG_PWR_LIM_1_EN) {
+			ret = -EOPNOTSUPP;
+			goto unlock;
+		}
 	}
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
@@ -194,19 +199,18 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 
 	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
 			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
-
-	return 0;
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
 }
 
-static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
+static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
 {
 	u32 reg_val;
 
 	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
-
-	return 0;
 }
 
 /*
@@ -235,10 +239,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 	struct xe_hwmon_energy_info *ei = &hwmon->ei;
 	u32 reg_val;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
-
-	mutex_lock(&hwmon->hwmon_lock);
-
 	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ,
 			     &reg_val, 0, 0);
 
@@ -251,10 +251,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 
 	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
 				  hwmon->scl_shift_energy);
-
-	mutex_unlock(&hwmon->hwmon_lock);
-
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
 }
 
 static const struct hwmon_channel_info *hwmon_info[] = {
@@ -284,6 +280,38 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
+static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u32 scale_factor)
+{
+	int ret;
+	u32 uval;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
+	if (ret)
+		goto unlock;
+
+	*value = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				 scale_factor, POWER_SETUP_I1_SHIFT);
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
+}
+
+static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u32 scale_factor)
+{
+	int ret;
+	u32 uval;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
+	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
+}
+
 static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
 {
 	u32 reg_val;
@@ -317,23 +345,15 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
 static int
 xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 {
-	int ret;
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_power_max_read(hwmon, val);
+		xe_hwmon_power_max_read(hwmon, val);
+		return 0;
 	case hwmon_power_rated_max:
-		return xe_hwmon_power_rated_max_read(hwmon, val);
-	case hwmon_power_crit:
-		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
-		if (ret)
-			return ret;
-		if (!(uval & POWER_SETUP_I1_WATTS))
-			return -ENODEV;
-		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
-				       SF_POWER, POWER_SETUP_I1_SHIFT);
+		xe_hwmon_power_rated_max_read(hwmon, val);
 		return 0;
+	case hwmon_power_crit:
+		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -342,14 +362,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
 {
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, val);
 	case hwmon_power_crit:
-		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
-		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -372,19 +389,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
 static int
 xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 {
-	int ret;
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_curr_crit:
-		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
-		if (ret)
-			return ret;
-		if (uval & POWER_SETUP_I1_WATTS)
-			return -ENODEV;
-		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
-				       SF_CURR, POWER_SETUP_I1_SHIFT);
-		return 0;
+		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -393,12 +400,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 static int
 xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
 {
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_curr_crit:
-		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
-		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -420,8 +424,6 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 {
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
-
 	switch (attr) {
 	case hwmon_in_input:
 		ret = xe_hwmon_get_voltage(hwmon, val);
@@ -430,8 +432,6 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 		ret = -EOPNOTSUPP;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
-
 	return ret;
 }
 
@@ -565,14 +565,13 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	struct xe_hwmon *hwmon = xe->hwmon;
 	long energy;
 	u32 val_sku_unit = 0;
-	int ret;
 
-	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
 	/*
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (!ret) {
+	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
+		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
 	}
-- 
2.25.1

