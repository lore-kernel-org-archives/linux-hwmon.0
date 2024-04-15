Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A062E852
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2024 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713220584; cv=none; b=B8hp9WqI+G7jdt37NjVa+A3yokEyfh7o3UAlXxp0Acr+wFdJMNDwUigGO9ntO3hiSItHoVPqrTOLGLfsvrIjBJW8of1+urwZW7lC1DbDE9iiM/6X4PBs43S1A7CiSE0W7XZG2NExdPP7G6c91fcLVSbAOrO3CQXq/OAN7UMyal0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713220584; c=relaxed/simple;
	bh=pXM450w4y4/VSmpbLRU2qE1xiXozByNPrf9W2EkVLB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RNxhJ1MQvFmxa7VPmh1kCcPSQMneF8opoAIXxiIsRRFiILSDm6iDUVhJjOr+PyBpnIWbML39Phl7T/LX+9coBEZHkF4XRvCenYKjcqeccBwcQafCdHlA0l/YdjQ43Cnb00/Ilufl1QGkXqSeXIiqGbEz/R712lBNbAk3UDvnh7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eps+PEno; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eps+PEno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713220582; x=1744756582;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pXM450w4y4/VSmpbLRU2qE1xiXozByNPrf9W2EkVLB4=;
  b=Eps+PEnoweGSQuE74n0gCuSQuFk1u/npDl/6QKFlS0M73aywQWyf7yN/
   t9/vcNalm/WBkyFsXCfn3yvj57qjzQYZO1amtY7KE5bexPlnAxylBqnVR
   mg9vcOF2A7IReGkla1u1I+TI5TUpBsuviel3dmVISF7f66pQgE/hZzZhi
   4Y4ep9LZ+Z5HcXtgWtxidbt6LAXmPUnSJvIPoHA9t0P/D4G/R7d2SHZUF
   H64P6dABF2YCwtP74S2Nax6CGwyHRA8uOV5IQMAM2ntZbt+fti8c1eD3n
   UYL1lsZM1ufpRAliF2CsfON+UBrsBsK7QoXOAphziMO4aDv4NY/Jkwvh0
   g==;
X-CSE-ConnectionGUID: bHhCfeQJSemROiP/ZbZkhg==
X-CSE-MsgGUID: E3LtKCFJRk2c8riv+I0Ffw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12411658"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="12411658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 15:36:21 -0700
X-CSE-ConnectionGUID: sjD3qJVQRimikNUrsT0/2w==
X-CSE-MsgGUID: 1umggOIAR2qk1z8GKz5cKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22138454"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 15:36:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
	Andi Shyti <andi.shyti@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/hwmon: Get rid of devm
Date: Mon, 15 Apr 2024 15:36:12 -0700
Message-ID: <20240415223612.738535-1-ashutosh.dixit@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 41 +++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 8c3f443c8347..46c24b1ee6df 100644
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
@@ -849,5 +849,26 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 
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

