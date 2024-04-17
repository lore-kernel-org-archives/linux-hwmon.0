Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236613DDDC
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Apr 2024 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713365821; cv=none; b=oQlmX2hfk3/TwS3wd3ethDXfqr4JMQF2nF6WSFhCRTYntlSdan02cBv7L76zEolEe0GEmWjjJrl6klI2OxS08KZo+hrXPx2QmiJ371mJeH0tVW5zvx9P9O2/2LvZVmrMG7k8/17o6s1S+CLMJyaHGjCS0h6qJMxpUFHIbe3uRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713365821; c=relaxed/simple;
	bh=8BRT7hTgisDDTL7pOfQtyyDPYIkpSERJOh3aEbL+wdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s32MYEbOaqClawpu00MUGGYrWV1MoQlinZZlMJubEoRFPiRHtEqPGaZVSIOkUbBkhNX3Ti2nBGYut+/uLyj8WjbGZ8srlSjWsR/qrz3aO+p2xyhCwkAQU5V0g4ZMqbql4/5XUlBJG/IlpXD68dNZkRd97yrf0CU4Q6cjq/OjjQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDb74s9h; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDb74s9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713365819; x=1744901819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8BRT7hTgisDDTL7pOfQtyyDPYIkpSERJOh3aEbL+wdo=;
  b=HDb74s9hh6UJ1v6e2A1j8pdtVPzcon6Pkfcy7QY6Jofq4XqfVxW1fXGc
   ItTnGNWHhrDrBLAVxiQv4UxLuzdoCOOq5s4q+YGatrIKK8k47RWN/OUIZ
   4zaSDdoJM/s8xUMyuIjmzXZ7i/a64FoumHuLAfawff0Iji5f3Hb9EgAty
   dfKepNMKjY3QApBt5cqrOwpBeWxmgN9rkQm+cX8fw8qTavpU1gAEOxU4g
   lgt02bQjRvLsTbn2w79YLIvFt0WvBy91esi9bitBoA5YvvmBbRDwR1xx8
   66DE3Ydl80DvLeKygM2080rYclBhfm1WJvbwAPQdAZgRfnnqax+IOFSdj
   g==;
X-CSE-ConnectionGUID: RjRDDqG5SxCWG66avF54bQ==
X-CSE-MsgGUID: /5gx+FzTQ7CLANWwxdoU9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20010179"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="20010179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 07:56:55 -0700
X-CSE-ConnectionGUID: JZSHScUcRe6tgbaRGDc7ZA==
X-CSE-MsgGUID: RlQMDcGcRGGGr5E5wPSQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="53863120"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 07:56:51 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
	Andi Shyti <andi.shyti@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Get rid of devm
Date: Wed, 17 Apr 2024 07:56:46 -0700
Message-ID: <20240417145646.793223-1-ashutosh.dixit@intel.com>
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
v4: Eliminate potential static analyzer warning (Rodrigo)
    Eliminate fetch_and_zero (Jani)
v5: Restore previous logic for ddat_gt->hwmon_dev error return (Andi)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 46 +++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index b758fd110c20..c0662a022f59 100644
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
 
@@ -839,16 +837,36 @@ void i915_hwmon_register(struct drm_i915_private *i915)
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
+	return;
+err:
+	i915_hwmon_unregister(i915);
 }
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
-	fetch_and_zero(&i915->hwmon);
+	struct i915_hwmon *hwmon = i915->hwmon;
+	struct intel_gt *gt;
+	int i;
+
+	if (!hwmon)
+		return;
+
+	for_each_gt(gt, i915, i)
+		if (hwmon->ddat_gt[i].hwmon_dev)
+			hwmon_device_unregister(hwmon->ddat_gt[i].hwmon_dev);
+
+	if (hwmon->ddat.hwmon_dev)
+		hwmon_device_unregister(hwmon->ddat.hwmon_dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+
+	kfree(i915->hwmon);
+	i915->hwmon = NULL;
 }
-- 
2.41.0

