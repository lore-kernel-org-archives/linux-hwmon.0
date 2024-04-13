Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF07173
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Apr 2024 00:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967041; cv=none; b=s+SzPiYqCzKsZHUmPYK5VRcLR1ayz1dUvQm2I3Yo/TtFSPz/mjU6NUSFj3vJFlWDhoa0345F5WLpGazKl+0LOotRXszEjOhUFVIaQd53MW10zfR7PTxNuGmtO/8cTDymFVfWTo30I7vFfFoe4hfNForL3vRxwp5SDTEI7e/lhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967041; c=relaxed/simple;
	bh=/XVR1cyycdWrwpz1/5ODkkkY2iGN03jrtii3lMbNI8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5F1JaQV+cH/5pd0SP0UOWJ9nIc9ZR2udxFSvicaHr3AaeEbqE+A61+Kwu1gb+Yl2urqQtJuB/6kEnVNC4mPEdZsnavgH9IrRHEH5dGNYGXtrtr8hOOoHch5NRPyTNCqXIuWPkLlDtWdpp4eW6bxOENcCRvhSCxwSmQPZiC0L3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cng+ZCd3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cng+ZCd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712967039; x=1744503039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/XVR1cyycdWrwpz1/5ODkkkY2iGN03jrtii3lMbNI8A=;
  b=cng+ZCd30I7eNtpwm7OExyFfaDozwgeJnsK41D/JyTxUPvlRkFkj38OY
   /MDMJqizY05/TJEmVLVi0Eo0LAMZCdvK0HN4PinZfM302CID4VMHljWqT
   xo3Du7plT1GE5VYzimzNxrxIvJ1dIbAQy81YiQZZ9aUxOTm5G6lg1mQgb
   3IeSUo/6Zmi7cFepV+4F1DYLQjGJU/AxxphuxVhb00KjZTQhbAru39hlK
   w0hScB7CkujYKbXWxBohF/XUC2QmUI9/0dgQ3qNNT4Dv4kSDNGIvyQC8i
   ah9CC0SU0An7cm/Dn0OATs3ixbLUzFKjPCk0gebJ+TjaZQGxhW0vJVDQo
   A==;
X-CSE-ConnectionGUID: pxHijtIiRMC1vfdYL+7QNA==
X-CSE-MsgGUID: aiOCABK2QNaQI5MT6gDOiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8308914"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8308914"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 17:10:39 -0700
X-CSE-ConnectionGUID: 43LY9+AYT1G+N8UnCqwScQ==
X-CSE-MsgGUID: FInGVoASQjqBD7J4ByOedg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="21356826"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 17:10:38 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
	Andi Shyti <andi.shyti@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] drm/i915/hwmon: Get rid of devm
Date: Fri, 12 Apr 2024 17:10:31 -0700
Message-ID: <20240413001031.481961-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When both hwmon and hwmon drvdata (on which hwmon depends) are device
managed resources, the expectation, on device unbind, is that hwmon will be
released before the drvdata. However, it appears devres does not do this
consistently, so that we occasionally see drvdata being released before
hwmon itself. This results in a uaf if hwmon sysfs is accessed during
device unbind.

The only way out of this seems to be do get rid of devm_ and release/free
everything explicitly during device unbind.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 46 ++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 8c3f443c8347..5f6022b148d7 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -792,7 +792,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	if (!IS_DGFX(i915))
 		return;
 
-	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return;
 
@@ -818,10 +818,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	hwm_get_preregistration_info(i915);
 
 	/*  hwmon_dev points to device hwmon<i> */
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
-							 ddat,
-							 &hwm_chip_info,
-							 hwm_groups);
+	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
+						    ddat,
+						    &hwm_chip_info,
+						    hwm_groups);
 	if (IS_ERR(hwmon_dev)) {
 		i915->hwmon = NULL;
 		return;
@@ -838,10 +838,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
 			continue;
 
-		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
-								 ddat_gt,
-								 &hwm_gt_chip_info,
-								 NULL);
+		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
+							    ddat_gt,
+							    &hwm_gt_chip_info,
+							    NULL);
 		if (!IS_ERR(hwmon_dev))
 			ddat_gt->hwmon_dev = hwmon_dev;
 	}
@@ -849,5 +849,31 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
-	fetch_and_zero(&i915->hwmon);
+	struct i915_hwmon *hwmon;
+	struct hwm_drvdata *ddat;
+	struct intel_gt *gt;
+	int i;
+
+	hwmon = fetch_and_zero(&i915->hwmon);
+	if (!hwmon)
+		return;
+
+	ddat = &hwmon->ddat;
+
+	for_each_gt(gt, i915, i) {
+		struct hwm_drvdata *ddat_gt;
+
+		ddat_gt = hwmon->ddat_gt + i;
+
+		if (ddat_gt->hwmon_dev) {
+			hwmon_device_unregister(ddat_gt->hwmon_dev);
+			ddat_gt->hwmon_dev = NULL;
+		}
+	}
+
+	if (ddat->hwmon_dev)
+		hwmon_device_unregister(ddat->hwmon_dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+	kfree(hwmon);
 }
-- 
2.41.0

