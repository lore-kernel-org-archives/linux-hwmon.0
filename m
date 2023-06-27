Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D696EB64D9
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjF0SZS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjF0SZQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 14:25:16 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0434E10FE
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2023 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687890312; x=1719426312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jJe9GPfw5zAdkJJDreysth6dJisFzC7AN6XAKfvDtzM=;
  b=QfFqGrOodQNGt9b0fcZaIq3Rg58h8f3X07IR3IpQtPzeMFCInqmQNHW5
   idWVVxJG2K4mzEkFUdALffSMucOCEnq0EYz6my+vC4+jyqh444yOfd+Om
   y3+SMO3jwDRVJvGxFN+FZUBdCfjclo5G53BJX0F/YiESoNDKHOKiDyfst
   ssV5kUhQupXTbkP5tOHBL2225wagr5lvOfmK5q7KyKPTBNZvCVKJs3QWr
   OYgDmfZhkWLiKbX8bYcdoAQnI+Cu0W7kibjJxdpchQZwBcfRE2dp4YEjL
   PRAtbvno+p/+ay/UiPr3lg0pneA46612qoK9XvRrkuAaOn3roo3P4hfVT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148922"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="359148922"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767175"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="829767175"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:10 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 1/6] drm/xe/hwmon: Add HWMON infrastructure
Date:   Wed, 28 Jun 2023 00:00:38 +0530
Message-Id: <20230627183043.2024530-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627183043.2024530-1-badal.nilawar@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The xe HWMON module will be used to expose voltage, power and energy
values for dGfx. Here we set up xe hwmon infrastructure including xe
hwmon registration, basic data structures and functions.
This is port from i915 hwmon.

v2: Fix review comments (Riana)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   3 +
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c        | 116 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h        |  22 +++++
 5 files changed, 148 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4b82cb2773ad..e39d77037622 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -113,6 +113,9 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+# graphics hardware monitoring (HWMON) support
+xe-$(CONFIG_HWMON) += xe_hwmon.o
+
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7985af85a53..0fcd60037d66 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
+#include "xe_hwmon.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	xe_hwmon_register(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
@@ -354,6 +357,8 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_hwmon_unregister(xe);
+
 	xe_device_remove_display(xe);
 
 	xe_display_unlink(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0226d44a6af2..21bff0e610a1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -332,6 +332,8 @@ struct xe_device {
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
+	struct xe_hwmon *hwmon;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
new file mode 100644
index 000000000000..8f653fdf4ad5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/hwmon.h>
+
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_hwmon.h"
+
+struct hwm_drvdata {
+	struct xe_hwmon *hwmon;
+	struct device *hwmon_dev;
+	char name[12];
+};
+
+struct xe_hwmon {
+	struct hwm_drvdata ddat;
+	struct mutex hwmon_lock;
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
+hwm_get_preregistration_info(struct xe_device *xe)
+{
+}
+
+void xe_hwmon_register(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	struct xe_hwmon *hwmon;
+	struct device *hwmon_dev;
+	struct hwm_drvdata *ddat;
+
+	/* hwmon is available only for dGfx */
+	if (!IS_DGFX(xe))
+		return;
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return;
+
+	xe->hwmon = hwmon;
+	mutex_init(&hwmon->hwmon_lock);
+	ddat = &hwmon->ddat;
+
+	ddat->hwmon = hwmon;
+	snprintf(ddat->name, sizeof(ddat->name), "xe");
+
+	hwm_get_preregistration_info(xe);
+
+	drm_dbg(&xe->drm, "Register HWMON interface\n");
+
+	/*  hwmon_dev points to device hwmon<i> */
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
+							 ddat,
+							 &hwm_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		drm_warn(&xe->drm, "Fail to register xe hwmon\n");
+		xe->hwmon = NULL;
+		return;
+	}
+
+	ddat->hwmon_dev = hwmon_dev;
+}
+
+void xe_hwmon_unregister(struct xe_device *xe)
+{
+	xe->hwmon = NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
new file mode 100644
index 000000000000..a078eeb0a68b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_HWMON_H__
+#define __XE_HWMON_H__
+
+#include <linux/types.h>
+
+struct xe_device;
+
+#if IS_REACHABLE(CONFIG_HWMON)
+void xe_hwmon_register(struct xe_device *xe);
+void xe_hwmon_unregister(struct xe_device *xe);
+#else
+static inline void xe_hwmon_register(struct xe_device *xe) { };
+static inline void xe_hwmon_unregister(struct xe_device *xe) { };
+#endif
+
+#endif /* __XE_HWMON_H__ */
-- 
2.25.1

