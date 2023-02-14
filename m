Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5E5C64ED9
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Feb 2023 05:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbjBNFdu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Feb 2023 00:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbjBNFds (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Feb 2023 00:33:48 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11662144BF
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Feb 2023 21:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676352828; x=1707888828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UmwGrPjnRhFzP/OBAjzwoYLe01fRGSOwy7yvhaUNJI4=;
  b=nOrwjdpagU5oux7FZ0qjDnsUGapXF/zQJQLWd8gZ/DyMIKhVCKlSHB2/
   6R32ztneil+1zKmOrYe9Vksq3GQKDG9Qb3OBWBWEbg/UyfIEbGjASRj4v
   1OVXJ+0M/I97LPTsHsa20+Dk81WsRdqeORpIXWgcKBdxlELmjRlnXOUn7
   WOWYiHma1Miu3OYKzgOB9kYHTDXSeTuhNhfqqr+NZBJu7r+1S8V6durjs
   4oPPzmoOVE18psepb2dyFGQXlQOeKYoHBStk1+ZYyfgNNSUoDAonnA5aB
   6nZjVc5Ip/6YibU0DwD7I3YwazmlqfDmiPyn7HwZhqBnIwrBKwDZaUq02
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358491798"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358491798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:33:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669047081"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="669047081"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:33:46 -0800
From:   Ashutosh Dixit <ashutosh.dixit@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Riana Tauro <riana.tauro@intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>,
        gwan-gyeong.mun@intel.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/3] drm/i915/hwmon: Enable PL1 limit when writing limit value to HW
Date:   Mon, 13 Feb 2023 21:33:41 -0800
Message-Id: <20230214053342.1952226-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Previous documentation suggested that the PL1 power limit is always enabled
in HW. However we now find this not to be the case on some platforms (such
as ATSM). Therefore enable the PL1 power limit (by setting the enable bit)
when writing the PL1 limit value to HW.

Bspec: 51864

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 85195d61f89c7..7c20a6f47b92e 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -385,10 +385,11 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
+	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
 
 	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
-					    PKG_PWR_LIM_1,
-					    REG_FIELD_PREP(PKG_PWR_LIM_1, nval));
+					    PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1,
+					    nval);
 	return 0;
 }
 
-- 
2.38.0

