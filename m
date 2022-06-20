Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF8AC43334
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 20:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240896AbiFTUrD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 16:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiFTUrC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 16:47:02 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C421A3BB
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655758021; x=1687294021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=loYycCINyba3bNa2TjcTyWnkmMBmQt2N1HChwZN/0+0=;
  b=lJjmw9uOC2liwMt4eNcTdVj2bZecfqDm+RDm3W2n+IlBSfVrQy5xM8gp
   GW/OKtrhkjnbTRNaFNbbnOgdT0hjE4m9fNDD2oXmzXQE9i6pL+QNxOEcB
   XSeb2Zr264brYICw8fqEIg6F/FkoJZYLCfepg9fwSA9RtEKwCcY2CLpo4
   2IpYRqnuNF92xjgzPXTR7rnnXpMuBBATMC4iuBV4/c/btVJBG2cOL75q+
   HAMJMYca0Qe3dBBb1V0DU9gDN3lnDvWtfbNd2VfBXThydSaJ3N4gUsupK
   d1l+4X2HYEs1fdj2UU5ehE2tBPX2SYnRE2U6LH2VbrLXjQUYEonhzCmE+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263004441"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="263004441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:47:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="620226946"
Received: from bnilawar-desk.iind.intel.com ([10.145.162.36])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:46:59 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     anshuman.gupta@intel.com, jon.ewins@intel.com,
        ashutosh.dixit@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 1/4] drm/i915/hwmon: Add HWMON infrastructure patch
Date:   Tue, 21 Jun 2022 02:16:46 +0530
Message-Id: <20220620204649.894703-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620204649.894703-1-badal.nilawar@intel.com>
References: <20220620204649.894703-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Dale B Stimson <dale.b.stimson@intel.com>

As part of the System Managemenent Interface (SMI), HWMON
subsystem can be used to get the raw sensor data.
This patch sets up HWMON infrastructure

v2:
  - Create HWMON infra patch (Ashutosh)
  - Fixed review comments (Jani)
  - Remove "select HWMON" from i915/Kconfig (Jani)

Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/Makefile      |   3 +
 drivers/gpu/drm/i915/i915_driver.c |   7 ++
 drivers/gpu/drm/i915/i915_drv.h    |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c  | 163 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h  |  21 ++++
 5 files changed, 196 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6c17d3d6db24..09f5b5c74daf 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -208,6 +208,9 @@ i915-y += gt/uc/intel_uc.o \
 # graphics system controller (GSC) support
 i915-y += gt/intel_gsc.o
 
+# graphics hardware monitoring (HWMON) support
+i915-$(CONFIG_HWMON) += i915_hwmon.o
+
 # modesetting core code
 i915-y += \
 	display/hsw_ips.o \
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 0e224761d0ed..60c5cee41aa3 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -80,6 +80,7 @@
 #include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_getparam.h"
+#include "i915_hwmon.h"
 #include "i915_ioc32.h"
 #include "i915_ioctl.h"
 #include "i915_irq.h"
@@ -721,6 +722,9 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 
 	intel_gt_driver_register(to_gt(dev_priv));
 
+#ifdef CONFIG_HWMON
+	i915_hwmon_register(dev_priv);
+#endif
 	intel_display_driver_register(dev_priv);
 
 	intel_power_domains_enable(dev_priv);
@@ -747,6 +751,9 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	intel_display_driver_unregister(dev_priv);
 
+#ifdef CONFIG_HWMON
+	i915_hwmon_unregister(dev_priv);
+#endif
 	intel_gt_driver_unregister(to_gt(dev_priv));
 
 	i915_perf_unregister(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c22f29c3faa0..2357a0295f99 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -705,6 +705,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct i915_hwmon *hwmon;
+
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt0;
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
new file mode 100644
index 000000000000..2ef40b0c1e70
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/*
+ * Power-related hwmon entries.
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/types.h>
+
+#include "i915_hwmon.h"
+#include "i915_drv.h"
+#include "intel_mchbar_regs.h"
+
+
+struct i915_hwmon_reg {
+};
+
+struct i915_hwmon_drvdata {
+	struct i915_hwmon *hwmon;
+	struct intel_uncore *uncore;
+	struct device *hwmon_dev;
+	char name[12];
+};
+
+struct i915_hwmon {
+	struct i915_hwmon_drvdata ddat;
+	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
+	struct i915_hwmon_reg rg;
+};
+
+static struct attribute *hwmon_attributes[] = {
+	NULL
+};
+
+static umode_t hwmon_attributes_visible(struct kobject *kobj,
+					struct attribute *attr, int index)
+{
+	return 0;
+}
+
+static const struct attribute_group hwmon_attrgroup = {
+	.attrs = hwmon_attributes,
+	.is_visible = hwmon_attributes_visible,
+};
+
+static const struct attribute_group *hwmon_groups[] = {
+	&hwmon_attrgroup,
+	NULL
+};
+
+
+static const struct hwmon_channel_info *i915_info[] = {
+	NULL
+};
+
+static umode_t
+i915_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		u32 attr, int channel)
+{
+	switch (type) {
+	default:
+		return 0;
+	}
+}
+
+static int
+i915_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	  int channel, long *val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+i915_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	   int channel, long val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops i915_hwmon_ops = {
+	.is_visible = i915_is_visible,
+	.read = i915_read,
+	.write = i915_write,
+};
+
+static const struct hwmon_chip_info i915_chip_info = {
+	.ops = &i915_hwmon_ops,
+	.info = i915_info,
+};
+
+static void
+i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
+{
+
+}
+
+void i915_hwmon_register(struct drm_i915_private *i915)
+{
+	struct device *dev = i915->drm.dev;
+	struct i915_hwmon *hwmon;
+	struct device *hwmon_dev;
+	struct i915_hwmon_drvdata *ddat;
+
+	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return;
+
+	i915->hwmon = hwmon;
+
+	mutex_init(&hwmon->hwmon_lock);
+
+	ddat = &hwmon->ddat;
+
+	ddat->hwmon = hwmon;
+	ddat->uncore = &i915->uncore;
+	snprintf(ddat->name, sizeof(ddat->name), "i915");
+
+	i915_hwmon_get_preregistration_info(i915);
+
+	/*  hwmon_dev points to device hwmon<i> */
+	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
+						    ddat,
+						    &i915_chip_info,
+						    hwmon_groups);
+
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
+	struct i915_hwmon_drvdata *ddat;
+
+	hwmon = fetch_and_zero(&i915->hwmon);
+	if (!hwmon)
+		return;
+
+	ddat = &hwmon->ddat;
+
+	if (ddat->hwmon_dev)
+		hwmon_device_unregister(ddat->hwmon_dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+
+	kfree(hwmon);
+}
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
new file mode 100644
index 000000000000..1e7e2516a981
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __I915_HWMON_H__
+#define __I915_HWMON_H__
+
+#include <linux/types.h>
+#include <linux/mutex.h>
+#include <linux/device.h>
+#include "i915_reg.h"
+
+struct drm_i915_private;
+struct i915_hwmon;
+
+void i915_hwmon_register(struct drm_i915_private *i915);
+void i915_hwmon_unregister(struct drm_i915_private *i915);
+
+#endif /* __I915_HWMON_H__ */
-- 
2.25.1

