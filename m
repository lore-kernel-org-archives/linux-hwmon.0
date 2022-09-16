Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DCAECAAA1
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Sep 2022 14:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiIPO62 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Sep 2022 10:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiIPO61 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2022 10:58:27 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E398F95C
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663340306; x=1694876306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BA98i3m9Qz6r5gdSz9q0RvWWk46QNC9niCHZL7dFuxI=;
  b=lI9e/BLz+HdgmFzROXJpOfNoAaWHX562vGiccwDJj+snhuxna3khWa3M
   Zmxx5bkzd0zcECz4emIkrdsSgCI18qmIRS8wAflFqzAB0BeK1jJly05oO
   NlAoV2b92NS/hb8laA3Ni9rYwLYfWmA0K1rOteIUfIa5jkMyXM9dw7sNP
   TlrQXNI4t89k4EvR70ggAiS9JnYSEzlDC+rUS7oOVtQAlyhYBVscBXGFJ
   HcGJEQvl65sJzQu1rF5/DEutrvrku/O//1DLOxN7MnZp15Dwr8+cfZCxU
   kBgpWjcSorGsZZC6Ch+9KDGU1alCtBgTPkWrKLKdI3vr4wRfDhM+fE9xx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="385298937"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="385298937"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:58:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="862761576"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:58:24 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/hwmon: Add HWMON current voltage support
Date:   Fri, 16 Sep 2022 20:30:49 +0530
Message-Id: <20220916150054.807590-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916150054.807590-1-badal.nilawar@intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Riana Tauro <riana.tauro@intel.com>

Use i915 HWMON subsystem to display current input voltage.

v2:
  - Updated date and kernel version in feature description
  - Fixed review comments (Ashutosh)
v3: Use macro HWMON_CHANNEL_INFO to define hwmon channel (Guenter)
v4:
  - Fixed review comments (Ashutosh)
  - Use hwm_ prefix for static functions (Ashutosh)
v5:
  - Added unit of voltage as millivolts (Ashutosh)
  - Updated date, kernel version in documentation

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  3 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 53 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
new file mode 100644
index 000000000000..e2974f928e58
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -0,0 +1,7 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		September 2022
+KernelVersion:	6
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
+		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 2275ee47da95..65336514554d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1510,6 +1510,9 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+#define GEN12_RPSTAT1				_MMIO(0x1381b4)
+#define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 103dd543a214..45745afa5c5b 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -11,8 +11,16 @@
 #include "i915_hwmon.h"
 #include "i915_reg.h"
 #include "intel_mchbar_regs.h"
+#include "gt/intel_gt_regs.h"
+
+/*
+ * SF_* - scale factors for particular quantities according to hwmon spec.
+ * - voltage  - millivolts
+ */
+#define SF_VOLTAGE	1000
 
 struct hwm_reg {
+	i915_reg_t gt_perf_status;
 };
 
 struct hwm_drvdata {
@@ -29,14 +37,49 @@ struct i915_hwmon {
 };
 
 static const struct hwmon_channel_info *hwm_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
+static umode_t
+hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		return i915_mmio_reg_valid(ddat->hwmon->rg.gt_perf_status) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
+	u32 reg_value;
+
+	switch (attr) {
+	case hwmon_in_input:
+		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);
+		/* HW register value in units of 2.5 millivolt */
+		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
 {
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+
 	switch (type) {
+	case hwmon_in:
+		return hwm_in_is_visible(ddat, attr);
 	default:
 		return 0;
 	}
@@ -46,7 +89,11 @@ static int
 hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	 int channel, long *val)
 {
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
 	switch (type) {
+	case hwmon_in:
+		return hwm_in_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -76,6 +123,12 @@ static const struct hwmon_chip_info hwm_chip_info = {
 static void
 hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
+	struct i915_hwmon *hwmon = i915->hwmon;
+
+	if (IS_DG1(i915) || IS_DG2(i915))
+		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
+	else
+		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
-- 
2.25.1

