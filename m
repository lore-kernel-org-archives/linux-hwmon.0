Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B77470
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Apr 2024 05:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713331011; cv=none; b=WylNEHmk/KSo8liDstFwXZt1EHCz5jRwz2UcaivJll8wsgl2LZw5M3MROt81BOY2Cm2Tfg2WS/NlWpY9M7LqRtdwBFizC+Cc8iu/Z4Iuyt25Dy8fxVSeXfT5vi9X+UDactwVzzSmBEQKrrNyQFk6l6QWkd9Yd9gYMgr3ObafMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713331011; c=relaxed/simple;
	bh=jtOytK7oWiptXH7Uo5vykc9AUFCufqIq7p1qkcmyN6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hvu7XEysnOnB/0h9pHn3YTl3YzfZ3cOd770c/1w4s/8GDZAumt4it0jvs5rfB24Jq32hS7lfXjYCqLK+Af6xKJTwOGxuipKTkYfvjvtm3oInIIaEHG/iCD5XdyUo3WEHT+kd8avX6wwwaPheY3nKCFn2qz3sYH41a5tb1hHD2ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkIpdDS7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkIpdDS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713331008; x=1744867008;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jtOytK7oWiptXH7Uo5vykc9AUFCufqIq7p1qkcmyN6c=;
  b=KkIpdDS7KpzAc7GyxFgy7EJUVKFUXNKNB9SW8otL1bvwravKBmjC2Vbi
   NTh4MElnMJTZYcvZ6IaepcfWBpiEIBY9+R9JR6e6Fuqa2ZrHn/FRzEUYJ
   GZncrmUDV17ZYjY0TZk4/lhQ+Hp3bn7pl1a4vZkQ34lZkgzuP/ZWj1s3v
   +OB0jWKlu4YBAdHYqdgw9TNV+9DNoMcvj8w4gdCLMFulDy9PmLzJ6RY80
   FQ1p3GAJ9H8CwJgNboY4uMUNFreh6q2dg0NDETo/U4hK3870xHffEqtwS
   nhyiMsMLvIqjeExZNYsBFWr49J8X+CssJ1mWLf3Y0bsEHCAcwfe/ztPXU
   w==;
X-CSE-ConnectionGUID: Rb24KWmbSG+cQ4StNv0gCA==
X-CSE-MsgGUID: nfmuuYIESSuKuBw+bFabhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31286422"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="31286422"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 22:16:48 -0700
X-CSE-ConnectionGUID: T8V37fKZRQaWYVN0MzdbKw==
X-CSE-MsgGUID: 5h5+VWK+TjOfEYLKoAh/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22570339"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 22:16:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
	Andi Shyti <andi.shyti@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/i915/hwmon: Get rid of devm
Date: Tue, 16 Apr 2024 22:16:42 -0700
Message-ID: <20240417051642.788740-1-ashutosh.dixit@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 52 +++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index b758fd110c20..1551a40a675e 100644
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
 
@@ -839,16 +837,38 @@ void i915_hwmon_register(struct drm_i915_private *i915)
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

