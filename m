Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4A6EB64D9
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjF0SZV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjF0SZU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2023 14:25:20 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C763F107
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2023 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687890318; x=1719426318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eBL7ayCTu/g2wCW7b+7SN1USfallzxLEGb5k/Qx1slg=;
  b=ekGrBvtP8JscfKGcM9ZGA0HpIWcPSZtVVgRZH1IZAB5CF+LAzAw8NLca
   uej+IVBMLpmvL4QLRuJ2vLatJYlM//OyL6egtfkex+bmNE76IxXQhbj8X
   VPGrbMcGdgFAiMn5kl0c0u70b5OVsWHJSv6K6rxU5CQPctp0L6k6PfuE/
   tcNactcNbO2U6dNTNC+wINTAouPOmLylav8sxiqSQv0U4mLyq0CAI7yBN
   YjKwU3ThHwVFEwVAiFxZYv8FY5uYIdvLpherj9/acwXXUd0OnrGHu+qmB
   kj+YUnWmSr8tFv/rof8MEvv3Iu7aSEsn99WuAv1wUygIzdi6eriBm4dZ9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148942"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="359148942"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767202"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="829767202"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:25:15 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 3/6] drm/xe/hwmon: Expose card reactive critical power
Date:   Wed, 28 Jun 2023 00:00:40 +0530
Message-Id: <20230627183043.2024530-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627183043.2024530-1-badal.nilawar@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose the card reactive critical (I1) power. I1 is exposed as
power1_crit in microwatts (typically for client products) or as
curr1_crit in milliamperes (typically for server).
This is port from i915 hwmon.

v2: Move PCODE_MBOX macro to pcode file (Riana)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 106 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
 4 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index ff3465195870..bee1d62bfddb 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel xe graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
+Date:		July 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in microwatts.
+
+		Card reactive critical (I1) power limit in microwatts is exposed
+		for client products. The power controller will throttle the
+		operating frequency if the power averaged over a window exceeds
+		this limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
+Date:		July 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in milliamperes.
+
+		Card reactive critical (I1) power limit in milliamperes is
+		exposed for server products. The power controller will throttle
+		the operating frequency if the power averaged over a window
+		exceeds this limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a4fba29d5d5a..7068120d9200 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -11,6 +11,9 @@
 #include "xe_hwmon.h"
 #include "xe_mmio.h"
 #include "xe_gt.h"
+#include "i915_drv.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 
 enum hwm_reg_name {
 	pkg_rapl_limit,
@@ -27,8 +30,10 @@ enum hwm_reg_operation {
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
  * - power  - microwatts
+ * - curr   - milliamperes
  */
 #define SF_POWER	1000000
+#define SF_CURR		1000
 
 struct hwm_drvdata {
 	struct xe_hwmon *hwmon;
@@ -232,14 +237,35 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
 }
 
 static const struct hwmon_channel_info *hwm_info[] = {
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	NULL
 };
 
+/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
+static int hwm_pcode_read_i1(struct xe_gt *gt, u32 *uval)
+{
+	/* Avoid ILLEGAL_SUBCOMMAND "mailbox access failed" warning in snb_pcode_read */
+	if (IS_DG2(gt_to_xe(gt)))
+		return -ENXIO;
+
+	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
+			     uval, 0);
+}
+
+static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
+{
+	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
+			      uval);
+}
+
 static umode_t
 hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 {
 	u32 reg_val;
+	u32 uval;
 
 	switch (attr) {
 	case hwmon_power_max:
@@ -248,6 +274,9 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 	case hwmon_power_rated_max:
 		return process_hwmon_reg(ddat, pkg_power_sku,
 					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
+	case hwmon_power_crit:
+		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
+			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 	default:
 		return 0;
 	}
@@ -256,11 +285,23 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 static int
 hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 {
+	int ret;
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return hwm_power_max_read(ddat, val);
 	case hwmon_power_rated_max:
 		return hwm_power_rated_max_read(ddat, val);
+	case hwmon_power_crit:
+		ret = hwm_pcode_read_i1(ddat->gt, &uval);
+		if (ret)
+			return ret;
+		if (!(uval & POWER_SETUP_I1_WATTS))
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_POWER, POWER_SETUP_I1_SHIFT);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -269,9 +310,14 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 static int
 hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 {
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return hwm_power_max_write(ddat, val);
+	case hwmon_power_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
+		return hwm_pcode_write_i1(ddat->gt, uval);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -327,6 +373,55 @@ void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
 	xe_device_mem_access_put(gt_to_xe(ddat->gt));
 }
 
+static umode_t
+hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
+			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	int ret;
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		ret = hwm_pcode_read_i1(ddat->gt, &uval);
+		if (ret)
+			return ret;
+		if (uval & POWER_SETUP_I1_WATTS)
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_CURR, POWER_SETUP_I1_SHIFT);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
+		return hwm_pcode_write_i1(ddat->gt, uval);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -340,6 +435,9 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_power:
 		ret = hwm_power_is_visible(ddat, attr, channel);
 		break;
+	case hwmon_curr:
+		ret = hwm_curr_is_visible(ddat, attr);
+		break;
 	default:
 		ret = 0;
 	}
@@ -362,6 +460,9 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_power:
 		ret = hwm_power_read(ddat, attr, channel, val);
 		break;
+	case hwmon_curr:
+		ret = hwm_curr_read(ddat, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -385,6 +486,9 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_power:
 		ret = hwm_power_write(ddat, attr, channel, val);
 		break;
+	case hwmon_curr:
+		ret = hwm_curr_write(ddat, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 3b4aa8c1a3ba..08cb1d047cba 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -22,4 +22,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
 int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
 
+#define PCODE_MBOX(mbcmd, param1, param2)\
+	(FIELD_PREP(PCODE_MB_COMMAND, mbcmd)\
+	| FIELD_PREP(PCODE_MB_PARAM1, param1)\
+	| FIELD_PREP(PCODE_MB_PARAM2, param2))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 837ff7c71280..5935cfe30204 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -35,6 +35,13 @@
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
 
+#define   PCODE_POWER_SETUP			0x7C
+#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
+#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
+#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
+#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
+#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
-- 
2.25.1

