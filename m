Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8CCECAAA1
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Sep 2022 14:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiIPO6Z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Sep 2022 10:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiIPO6Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2022 10:58:25 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5533F8E0FC
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Sep 2022 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663340304; x=1694876304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gbNaTHppXVL1JgnRvE2evuwlKMybmRSmCUFjqD+dCkA=;
  b=QO4oMqzHQLrEqk9p68muocxGFoSsCPDzNPitfMYVy7ARkMPbyZWEUq24
   NxBFvJOEOF0AGlbuIkp4JuYeo2TzPscoJ4A41ElKnS/K2pcH9LyS03Ekt
   S7AER/eX5sl27dHYAkN2B/+W3K7AWplAQB0PldoDFlwcDf9418dMditJ/
   Bt2lvdlNy9XMbC+Qnz0Mac/+i8gS5DYNiOky6r9vOP3NEnXibDD//s7zS
   jtgqUHlXBeWwP/RSkYji8dQW92P/p/MIgjIw+VyDRq8mRvtYbcZorFJk5
   E/q/+m6s6SUueBEG0D257HHdjnSqYmvmBlJ7b6qyVZ7FfmQ2QPsXV1XgU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="385298925"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="385298925"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:58:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="862761556"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:58:21 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Date:   Fri, 16 Sep 2022 20:30:48 +0530
Message-Id: <20220916150054.807590-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916150054.807590-1-badal.nilawar@intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Dale B Stimson <dale.b.stimson@intel.com>

The i915 HWMON module will be used to expose voltage, power and energy
values for dGfx. Here we set up i915 hwmon infrastructure including i915
hwmon registration, basic data structures and functions.

v2:
  - Create HWMON infra patch (Ashutosh)
  - Fixed review comments (Jani)
  - Remove "select HWMON" from i915/Kconfig (Jani)
v3: Use hwm_ prefix for static functions (Ashutosh)
v4: s/#ifdef CONFIG_HWMON/#if IS_REACHABLE(CONFIG_HWMON)/ since the former
    doesn't work if hwmon is compiled as a module (Guenter)
v5: Fixed review comments (Jani)

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/Makefile      |   3 +
 drivers/gpu/drm/i915/i915_driver.c |   5 ++
 drivers/gpu/drm/i915/i915_drv.h    |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c  | 136 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h  |  20 +++++
 5 files changed, 166 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a26edcdadc21..66a6023e61a6 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -209,6 +209,9 @@ i915-y += gt/uc/intel_uc.o \
 # graphics system controller (GSC) support
 i915-y += gt/intel_gsc.o
 
+# graphics hardware monitoring (HWMON) support
+i915-$(CONFIG_HWMON) += i915_hwmon.o
+
 # modesetting core code
 i915-y += \
 	display/hsw_ips.o \
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c459eb362c47..75655adb7bd3 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -81,6 +81,7 @@
 #include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_getparam.h"
+#include "i915_hwmon.h"
 #include "i915_ioc32.h"
 #include "i915_ioctl.h"
 #include "i915_irq.h"
@@ -763,6 +764,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
+	i915_hwmon_register(dev_priv);
+
 	intel_display_driver_register(dev_priv);
 
 	intel_power_domains_enable(dev_priv);
@@ -795,6 +798,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_unregister(gt);
 
+	i915_hwmon_unregister(dev_priv);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 9f9372931fd2..01a2caf42635 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -353,6 +353,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct i915_hwmon *hwmon;
+
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt0;
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
new file mode 100644
index 000000000000..103dd543a214
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/types.h>
+
+#include "i915_drv.h"
+#include "i915_hwmon.h"
+#include "i915_reg.h"
+#include "intel_mchbar_regs.h"
+
+struct hwm_reg {
+};
+
+struct hwm_drvdata {
+	struct i915_hwmon *hwmon;
+	struct intel_uncore *uncore;
+	struct device *hwmon_dev;
+	char name[12];
+};
+
+struct i915_hwmon {
+	struct hwm_drvdata ddat;
+	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
+	struct hwm_reg rg;
+};
+
+static const struct hwmon_channel_info *hwm_info[] = {
+	NULL
+};
+
+static umode_t
+hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+	       u32 attr, int channel)
+{
+	switch (type) {
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	 int channel, long *val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	  int channel, long val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops hwm_ops = {
+	.is_visible = hwm_is_visible,
+	.read = hwm_read,
+	.write = hwm_write,
+};
+
+static const struct hwmon_chip_info hwm_chip_info = {
+	.ops = &hwm_ops,
+	.info = hwm_info,
+};
+
+static void
+hwm_get_preregistration_info(struct drm_i915_private *i915)
+{
+}
+
+void i915_hwmon_register(struct drm_i915_private *i915)
+{
+	struct device *dev = i915->drm.dev;
+	struct i915_hwmon *hwmon;
+	struct device *hwmon_dev;
+	struct hwm_drvdata *ddat;
+
+	/* hwmon is available only for dGfx */
+	if (!IS_DGFX(i915))
+		return;
+
+	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return;
+
+	i915->hwmon = hwmon;
+	mutex_init(&hwmon->hwmon_lock);
+	ddat = &hwmon->ddat;
+
+	ddat->hwmon = hwmon;
+	ddat->uncore = &i915->uncore;
+	snprintf(ddat->name, sizeof(ddat->name), "i915");
+
+	hwm_get_preregistration_info(i915);
+
+	/*  hwmon_dev points to device hwmon<i> */
+	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
+						    ddat,
+						    &hwm_chip_info,
+						    NULL);
+	if (IS_ERR(hwmon_dev)) {
+		mutex_destroy(&hwmon->hwmon_lock);
+		i915->hwmon = NULL;
+		kfree(hwmon);
+		return;
+	}
+
+	ddat->hwmon_dev = hwmon_dev;
+}
+
+void i915_hwmon_unregister(struct drm_i915_private *i915)
+{
+	struct i915_hwmon *hwmon;
+	struct hwm_drvdata *ddat;
+
+	hwmon = fetch_and_zero(&i915->hwmon);
+	if (!hwmon)
+		return;
+
+	ddat = &hwmon->ddat;
+	if (ddat->hwmon_dev)
+		hwmon_device_unregister(ddat->hwmon_dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+	kfree(hwmon);
+}
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
new file mode 100644
index 000000000000..7ca9cf2c34c9
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __I915_HWMON_H__
+#define __I915_HWMON_H__
+
+struct drm_i915_private;
+
+#if IS_REACHABLE(CONFIG_HWMON)
+void i915_hwmon_register(struct drm_i915_private *i915);
+void i915_hwmon_unregister(struct drm_i915_private *i915);
+#else
+static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
+static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
+#endif
+
+#endif /* __I915_HWMON_H__ */
-- 
2.25.1

