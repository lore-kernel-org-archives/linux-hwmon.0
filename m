Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E83AC04A6A
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbjHBNqg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 09:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbjHBNqf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 09:46:35 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1688410B
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690983994; x=1722519994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LLdEHZz+vsWcxofmQ9Iuf0r3bGpNq1R56Tmk4GFeD4Q=;
  b=mWqU2vqhu5u+vBKGP6gl94ANZGPsUum7OvksJHk/Qydv5hqYuoxw7vCX
   eZpD2msYpr78JDy12JdZkAfrEKqkz0ObK31ACjoqYGLYaMn4eMj3QHlXH
   rmZ7o6xnjVeLv5JoB3+D7pmR439WCAu/hs7AW2vggjs+fZ5LAAJLGv04d
   hmluiq/koBqdrhgGl8Fk600NW9EdzprVvBNcUticA49MVCwj9cYElKlMT
   qEwr01pkH1BcoYr7oY0bw5jhoeATJ4aeD7pOTXVLVwXa/Sq2ZScy6dggk
   7TIKZ6g6tlCoctLfs5kdLc6mWFK7VvmS3udzrpYA/RL95fSugvwOL8tto
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534951"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="400534951"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873930"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="852873930"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:31 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 3/6] drm/xe/hwmon: Expose card reactive critical power
Date:   Wed,  2 Aug 2023 19:22:38 +0530
Message-Id: <20230802135241.458855-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802135241.458855-1-badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose the card reactive critical (I1) power. I1 is exposed as
power1_crit in microwatts (typically for client products) or as
curr1_crit in milliamperes (typically for server).

v2:
  - Move PCODE_MBOX macro to pcode file (Riana)
v3:
  - %s/hwm_/hwmon_/ (Matt Brost)
  - s/IS_DG2/(gt_to_xe(gt)->info.platform == XE_DG2)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 106 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
 4 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d48d98f903ed..ea60add73743 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel xe graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
+Date:		August 2023
+KernelVersion:	6.4
+Contact:	intel-xe@lists.freedesktop.org
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
+Date:		August 2023
+KernelVersion:	6.4
+Contact:	intel-xe@lists.freedesktop.org
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
index ce8dac2168f6..ceab142f6d42 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -12,6 +12,8 @@
 #include "xe_hwmon.h"
 #include "xe_mmio.h"
 #include "xe_gt.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 
 enum hwmon_reg_name {
 	REG_PKG_RAPL_LIMIT,
@@ -28,8 +30,10 @@ enum hwmon_reg_operation {
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
  * - power  - microwatts
+ * - curr   - milliamperes
  */
 #define SF_POWER	1000000
+#define SF_CURR		1000
 
 struct xe_hwmon_data {
 	struct device *hwmon_dev;
@@ -216,18 +220,43 @@ static int hwmon_power_rated_max_read(struct xe_hwmon_data *ddat, long *value)
 }
 
 static const struct hwmon_channel_info *hwmon_info[] = {
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	NULL
 };
 
+/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
+static int hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
+{
+	/* Avoid Illegal Subcommand error */
+	if (gt_to_xe(gt)->info.platform == XE_DG2)
+		return -ENXIO;
+
+	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
+			     uval, 0);
+}
+
+static int hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
+{
+	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
+			      uval);
+}
+
 static umode_t
 hwmon_power_is_visible(struct xe_hwmon_data *ddat, u32 attr, int chan)
 {
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
 	case hwmon_power_rated_max:
 		return hwmon_get_reg(ddat, REG_PKG_POWER_SKU) ? 0444 : 0;
+	case hwmon_power_crit:
+		return (hwmon_pcode_read_i1(ddat->gt, &uval) ||
+			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 	default:
 		return 0;
 	}
@@ -236,11 +265,23 @@ hwmon_power_is_visible(struct xe_hwmon_data *ddat, u32 attr, int chan)
 static int
 hwmon_power_read(struct xe_hwmon_data *ddat, u32 attr, int chan, long *val)
 {
+	int ret;
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return hwmon_power_max_read(ddat, val);
 	case hwmon_power_rated_max:
 		return hwmon_power_rated_max_read(ddat, val);
+	case hwmon_power_crit:
+		ret = hwmon_pcode_read_i1(ddat->gt, &uval);
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
@@ -249,9 +290,14 @@ hwmon_power_read(struct xe_hwmon_data *ddat, u32 attr, int chan, long *val)
 static int
 hwmon_power_write(struct xe_hwmon_data *ddat, u32 attr, int chan, long val)
 {
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return hwmon_power_max_write(ddat, val);
+	case hwmon_power_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
+		return hwmon_pcode_write_i1(ddat->gt, uval);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -301,6 +347,55 @@ void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
 	mutex_unlock(&hwmon->hwmon_lock);
 }
 
+static umode_t
+hwmon_curr_is_visible(const struct xe_hwmon_data *ddat, u32 attr)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		return (hwmon_pcode_read_i1(ddat->gt, &uval) ||
+			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwmon_curr_read(struct xe_hwmon_data *ddat, u32 attr, long *val)
+{
+	int ret;
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		ret = hwmon_pcode_read_i1(ddat->gt, &uval);
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
+hwmon_curr_write(struct xe_hwmon_data *ddat, u32 attr, long val)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
+		return hwmon_pcode_write_i1(ddat->gt, uval);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		 u32 attr, int channel)
@@ -314,6 +409,9 @@ hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_power:
 		ret = hwmon_power_is_visible(ddat, attr, channel);
 		break;
+	case hwmon_curr:
+		ret = hwmon_curr_is_visible(ddat, attr);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -337,6 +435,9 @@ hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_power:
 		ret = hwmon_power_read(ddat, attr, channel, val);
 		break;
+	case hwmon_curr:
+		ret = hwmon_curr_read(ddat, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -360,6 +461,9 @@ hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_power:
 		ret = hwmon_power_write(ddat, attr, channel, val);
 		break;
+	case hwmon_curr:
+		ret = hwmon_curr_write(ddat, attr, val);
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

