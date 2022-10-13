Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F00C43217
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Oct 2022 15:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJMPqI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Oct 2022 11:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiJMPqH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Oct 2022 11:46:07 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3958D2CF9
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665675965; x=1697211965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uZUlZt4TJmLVwvpPUBfGVhwOp09+/73grjxEJE5PLa0=;
  b=I3AcoITOx7ZvO//RldiRJguYPd05bu9HVIPBoioUhmD37fqiJbmnmc1X
   oHGN7ZgaWcy/i6x1HoeOfZ/WOF8r3VeMiLgnQljHjMlr0fXQj0ddbdUYj
   KgJjyieZEGLAVu2ChBBTuO8eHcqGW1/X6YLnqhkCbdtYbIyalLSJuYKRv
   tY4BGs64Jdpk9N1ovEvW34m0GVVlpvTZ80DgBKwe0AFtYAZNb7/oiJ0RS
   QWvcsaiEh2lBSrQxRcn6GOp49JmXRNEAvnYIztRkmRXQR8HmVDb4MY2ze
   9/P6N4ylyme20nu6I4sQEpO8oX2iFENm/0/3jaq0oWRMCXm91vD2GAJJf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="367130113"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="367130113"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="660381009"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="660381009"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com) ([10.165.21.138])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
From:   Ashutosh Dixit <ashutosh.dixit@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andi Shyti <andi.shyti@intel.com>
Subject: [PATCH 2/7] drm/i915/hwmon: Add HWMON current voltage support
Date:   Thu, 13 Oct 2022 08:45:21 -0700
Message-Id: <20221013154526.2105579-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
References: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
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
v5: Added unit of voltage as millivolts (Ashutosh)
v6: KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
v7: Change contact to intel-gfx (Rodrigo)
    GEN12_RPSTAT1 is available for all Gen12+ (Andi)
    Added Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
    to MAINTAINERS

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  3 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 53 +++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
new file mode 100644
index 0000000000000..5f4b136f08509
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -0,0 +1,7 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		February 2023
+KernelVersion:	6.2
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
+		Only supported for particular Intel i915 graphics platforms.
diff --git a/MAINTAINERS b/MAINTAINERS
index f07a8bf8744f9..7d57ede980940 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10144,6 +10144,7 @@ Q:	http://patchwork.freedesktop.org/project/intel-gfx/
 B:	https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
 C:	irc://irc.oftc.net/intel-gfx
 T:	git git://anongit.freedesktop.org/drm-intel
+F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 F:	Documentation/gpu/i915.rst
 F:	drivers/gpu/drm/i915/
 F:	include/drm/i915*
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7f79bbf978284..fcf5f9012852f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1519,6 +1519,9 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+#define GEN12_RPSTAT1				_MMIO(0x1381b4)
+#define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 231552fda374a..025399391ddcc 100644
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
@@ -29,14 +37,51 @@ struct i915_hwmon {
 };
 
 static const struct hwmon_channel_info *hwm_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
+static umode_t
+hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	struct drm_i915_private *i915 = ddat->uncore->i915;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return IS_DG1(i915) || IS_DG2(i915) ? 0444 : 0;
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
@@ -46,7 +91,11 @@ static int
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
@@ -76,6 +125,10 @@ static const struct hwmon_chip_info hwm_chip_info = {
 static void
 hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
+	struct i915_hwmon *hwmon = i915->hwmon;
+
+	/* Available for all Gen12+/dGfx */
+	hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
-- 
2.38.0

