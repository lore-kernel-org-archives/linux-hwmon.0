Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FF7C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Oct 2022 15:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJMPqF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Oct 2022 11:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJMPqF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Oct 2022 11:46:05 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B6BD2CF9
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665675963; x=1697211963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e0ir/clozvn5nU6hF7dISXNSJos9ZSjKomzNbTLsRDk=;
  b=ir0M50vqRVmfgZP6rh1bydgwWN4MZqtaTpAq7ESl2gQ6eGskJOcp9EJF
   7Lv/YUDVY7r0zVMNxST9XmPra2dua3m+QTq5XtCVj6iZu9RloHjHjab5z
   +01SuK0n2Hxtquj6uTzP/wTA+oq9e9td44GQFpUiokjYoDLtRkNJ8/zNs
   KgzjExzB3e+6h7S55532MPfoVCn39fNZKvslmI9HNc+/F6yd772lu0Mle
   82n7Pg5/nbfpJWqjQmh+D1aFnhv1ut3EQWNFFHnuduvmUTS7Kn22Oiy8d
   skZoCSUDJo1Rzbqxeffehak22gouPoQZUeP3LFFqbRrH1G3F8bapM+8LS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="367130112"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="367130112"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="660381006"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="660381006"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com) ([10.165.21.138])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
From:   Ashutosh Dixit <ashutosh.dixit@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andi Shyti <andi.shyti@intel.com>
Subject: [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Date:   Thu, 13 Oct 2022 08:45:20 -0700
Message-Id: <20221013154526.2105579-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
References: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
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
v6: s/kzalloc/devm_kzalloc/ (Andi)
v7: s/hwmon_device_register_with_info/
      devm_hwmon_device_register_with_info/ (Ashutosh)

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile      |   3 +
 drivers/gpu/drm/i915/i915_driver.c |   5 ++
 drivers/gpu/drm/i915/i915_drv.h    |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c  | 122 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h  |  20 +++++
 5 files changed, 152 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index f8cc1eb52626e..2535593ab379e 100644
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
index 24d3d2d85fd57..ffff49868dc51 100644
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
index 90ed8e6db2fe0..a81372ddd2db7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -349,6 +349,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct i915_hwmon *hwmon;
+
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt0;
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
new file mode 100644
index 0000000000000..231552fda374a
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -0,0 +1,122 @@
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
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
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
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
+							 ddat,
+							 &hwm_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		i915->hwmon = NULL;
+		return;
+	}
+
+	ddat->hwmon_dev = hwmon_dev;
+}
+
+void i915_hwmon_unregister(struct drm_i915_private *i915)
+{
+	fetch_and_zero(&i915->hwmon);
+}
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
new file mode 100644
index 0000000000000..7ca9cf2c34c96
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
2.38.0

