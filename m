Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1402B2D60A
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 03:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713239711; cv=none; b=liAGao6FtUXa4RNMo9n3b6yDUtlnEWBJtgnMJJ/EWR496VTysph3C1YJbULqmZi1tPgP1BXsUrho6HMTzYgKt/B+C5ghYuV5RS7f1M+6p2S5ufkd6jsskKyPrn2+MlS2bgIt12fTeQCIrk7aeEISHydRWwD/MWRv/vYmXom/tyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713239711; c=relaxed/simple;
	bh=mn0gisJNrsD7GRbKuZiSaG2WypB8+MdvqgCCZc6EMbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tVeRil0BVvwiagx7l6CfG4etnKMZiGUK4S+D6/zMo/4fyVkqg1Z/Q97b4yukKtMmwG8l2Zmna9MZ7stbmtB126d8uSC3DEesxl74b+sq08x4qn02BMwSUlxU3c37aKnvSU6mVBDzWjAUNSp64Ogpag/LF6JLBcmfAIZEGAwVLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyaIOlT4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyaIOlT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713239710; x=1744775710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mn0gisJNrsD7GRbKuZiSaG2WypB8+MdvqgCCZc6EMbs=;
  b=XyaIOlT45Vw4R4j0LpUISe+0RA2rNhnhduydpLcH7BcCxAUU7siZszw+
   5gjZahK08ZlZ90cF0rG+KrBAPnhm5slwvmSOFrkisocYG+XKc5s70ArJn
   36umlxHK+M6JJpf+Qxy7adPCom+dVJVVkyIuhstPVc0eCY03si8ihk6ol
   EgnHSrr98x66YvzAfWz9n/xDAP71r4Idn1bh214fGTr4z/Im8amLkrMrt
   xoQMGPdpjwkzDDhVk8R/+4iWisA6iSa8R81Wqf5hC05Ata0kdX7C5SrdS
   akRQpM/7hwjniNygPXAm2TWtatZ9o+lWqhB6w6bDqnEFOZAKqCK6opHxv
   A==;
X-CSE-ConnectionGUID: NMIDoisaSmeKsF9ntOL5NQ==
X-CSE-MsgGUID: hHmLRPC/SLGH7ACNRnKSIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19260321"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="19260321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 20:55:08 -0700
X-CSE-ConnectionGUID: tMW3Qk2KRWmjrlIyQCAXjw==
X-CSE-MsgGUID: 4CMleALOTWyOBrpC+HkLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26917438"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 20:55:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
	Andi Shyti <andi.shyti@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Get rid of devm
Date: Mon, 15 Apr 2024 20:55:01 -0700
Message-ID: <20240416035501.755728-1-ashutosh.dixit@intel.com>
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
released before drvdata. However, in i915 there are two separate code
paths, which both release either drvdata or hwmon and either can be
released before the other. These code paths (for device unbind) are as
follows (see also the bug referenced below):

Call Trace:
release_nodes+0x11/0x70
devres_release_group+0xb2/0x110
component_unbind_all+0x8d/0xa0
component_del+0xa5/0x140
intel_pxp_tee_component_fini+0x29/0x40 [i915]
intel_pxp_fini+0x33/0x80 [i915]
i915_driver_remove+0x4c/0x120 [i915]
i915_pci_remove+0x19/0x30 [i915]
pci_device_remove+0x32/0xa0
device_release_driver_internal+0x19c/0x200
unbind_store+0x9c/0xb0

and

Call Trace:
release_nodes+0x11/0x70
devres_release_all+0x8a/0xc0
device_unbind_cleanup+0x9/0x70
device_release_driver_internal+0x1c1/0x200
unbind_store+0x9c/0xb0

This means that in i915, if use devm, we cannot gurantee that hwmon will
always be released before drvdata. Which means that we have a uaf if hwmon
sysfs is accessed when drvdata has been released but hwmon hasn't.

The only way out of this seems to be do get rid of devm_ and release/free
everything explicitly during device unbind.

v2: Change commit message and other minor code changes
v3: Cleanup from i915_hwmon_register on error (Armin Wolf)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 54 ++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index b758fd110c20..8cebf6f5b101 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -793,7 +793,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	if (!IS_DGFX(i915))
 		return;
 
-	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return;
 
@@ -819,14 +819,12 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	hwm_get_preregistration_info(i915);
 
 	/*  hwmon_dev points to device hwmon<i> */
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
-							 ddat,
-							 &hwm_chip_info,
-							 hwm_groups);
-	if (IS_ERR(hwmon_dev)) {
-		i915->hwmon = NULL;
-		return;
-	}
+	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
+						    ddat,
+						    &hwm_chip_info,
+						    hwm_groups);
+	if (IS_ERR(hwmon_dev))
+		goto err;
 
 	ddat->hwmon_dev = hwmon_dev;
 
@@ -839,16 +837,40 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
 			continue;
 
-		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
-								 ddat_gt,
-								 &hwm_gt_chip_info,
-								 NULL);
-		if (!IS_ERR(hwmon_dev))
-			ddat_gt->hwmon_dev = hwmon_dev;
+		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
+							    ddat_gt,
+							    &hwm_gt_chip_info,
+							    NULL);
+		if (IS_ERR(hwmon_dev))
+			goto err;
+
+		ddat_gt->hwmon_dev = hwmon_dev;
 	}
+	return;
+err:
+	i915_hwmon_unregister(i915);
 }
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
-	fetch_and_zero(&i915->hwmon);
+	struct i915_hwmon *hwmon = fetch_and_zero(&i915->hwmon);
+	struct hwm_drvdata *ddat = &hwmon->ddat;
+	struct intel_gt *gt;
+	int i;
+
+	if (!hwmon)
+		return;
+
+	for_each_gt(gt, i915, i) {
+		struct hwm_drvdata *ddat_gt = hwmon->ddat_gt + i;
+
+		if (ddat_gt->hwmon_dev)
+			hwmon_device_unregister(ddat_gt->hwmon_dev);
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

