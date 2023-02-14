Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96709C64EC7
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Feb 2023 05:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjBNFdu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Feb 2023 00:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbjBNFds (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Feb 2023 00:33:48 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B51144B8
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Feb 2023 21:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676352828; x=1707888828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IJ/xMsE8oYbVrFStu5170dGaUb4//n7xTmCg6/+dk7U=;
  b=GakCq4R4F5PbO75Vw1eq3a00W2uAoXln0uOJPw0Eoy8ltP8W0wKu0yHC
   MdTyY1dKoj502GdvbF7/9J5XmMz9S/M8X2y9yq+XIeY3H0lBu2E3tQEGm
   hXENOEJioo1kbWo5l2EfPJjvO8ASZCD3419CejhHtgzXikkUxGbqYBoxM
   lisfAGO9J+/J6O21+Ytqjus8Swn+tL5uPI3X8l7HMNn9gOEMPQKdzIrFY
   3JJm1Fyhj8GVETrU+Pfs6phA/eBLZP7iNEDn4+BA2vNckPDj1kczgCuZY
   RVhfF43pFknzGM3ExPqdnvpLVwjpaTQ3vgoLGdwDXd640CweRGUehxRzz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358491795"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358491795"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:33:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669047078"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="669047078"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:33:46 -0800
From:   Ashutosh Dixit <ashutosh.dixit@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Riana Tauro <riana.tauro@intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>,
        gwan-gyeong.mun@intel.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/3] drm/i915/hwmon: Replace hwm_field_scale_and_write with hwm_power_max_write
Date:   Mon, 13 Feb 2023 21:33:40 -0800
Message-Id: <20230214053342.1952226-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

hwm_field_scale_and_write has a single caller hwm_power_write and is
specific to hwm_power_write but makes it appear that it is a general
function which can have multiple callers. Replace the function with
hwm_power_max_write which is specific to hwm_power_write and use that in
future patches where the function needs to be extended.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 36 ++++++++++++++-----------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 1225bc432f0d5..85195d61f89c7 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -99,20 +99,6 @@ hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
 	return mul_u64_u32_shr(reg_value, scale_factor, nshift);
 }
 
-static void
-hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
-			  int nshift, unsigned int scale_factor, long lval)
-{
-	u32 nval;
-
-	/* Computation in 64-bits to avoid overflow. Round to nearest. */
-	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
-
-	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
-					    PKG_PWR_LIM_1,
-					    REG_FIELD_PREP(PKG_PWR_LIM_1, nval));
-}
-
 /*
  * hwm_energy - Obtain energy value
  *
@@ -391,6 +377,21 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
 	return 0;
 }
 
+static int
+hwm_power_max_write(struct hwm_drvdata *ddat, long val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	u32 nval;
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
+
+	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
+					    PKG_PWR_LIM_1,
+					    REG_FIELD_PREP(PKG_PWR_LIM_1, nval));
+	return 0;
+}
+
 static int
 hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 {
@@ -425,16 +426,11 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 static int
 hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 {
-	struct i915_hwmon *hwmon = ddat->hwmon;
 	u32 uval;
 
 	switch (attr) {
 	case hwmon_power_max:
-		hwm_field_scale_and_write(ddat,
-					  hwmon->rg.pkg_rapl_limit,
-					  hwmon->scl_shift_power,
-					  SF_POWER, val);
-		return 0;
+		return hwm_power_max_write(ddat, val);
 	case hwmon_power_crit:
 		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
 		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
-- 
2.38.0

