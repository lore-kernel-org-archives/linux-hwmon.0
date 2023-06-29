Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B935EB64DC
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jun 2023 14:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbjF2OX4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jun 2023 10:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjF2OXx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jun 2023 10:23:53 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37F93598
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jun 2023 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688048632; x=1719584632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QfOKbtCgt2PXTVdWQen7okU5ZO3SDDuTkXB5IlLaZ/g=;
  b=GmiA52Ig0lFKj0kPOWBrUQQe2vnTvVC7mf84DnW/xznpd/ddvTnZ0Y4S
   ictYBp3FBfOTgOM72d9w52vxzlkpQ9XRmw4X3dPq0tqC/aWoJWrDuIlZw
   C2mMqygHw6A5oYr8AyfkRQydgD4USVfHYevNQ+11Hyou+MsZpBp/xElxp
   TAPAoCuY/WNLcMD7z28YFWrcQqMoOaJDaq5fA8dwmty5TDUXNzClnxCcT
   LagHO3EGYnb+4N5+zO/i7RSb1hvpKqVxxDLPcKYYrxDDHZkJcbM+HJ/Kt
   BK1UydJHmgr5/RA8kkLTOC7vssLuz+wgHyW49xP8pv4H7W3WMTo5YFF6I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="365598075"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="365598075"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 07:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711444920"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="711444920"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.49.226])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 07:09:35 -0700
Date:   Thu, 29 Jun 2023 16:09:31 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Matthew Brost <matthew.brost@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com
Subject: Re: [PATCH v2 2/6] drm/xe/hwmon: Expose power attributes
Message-ID: <ZJ2Qm0UcAidCEArX@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-3-badal.nilawar@intel.com>
 <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Matt and Badal,

[...]

> > +};
> > +
> > +enum hwm_reg_operation {
> > +	reg_read,
> > +	reg_write,
> > +	reg_rmw,
> 
> Upper case?
> 
> > +};
> > +
> 
> s/hwm_reg/xe_hwm_reg

I agree with Matt here... throughout this series of patches the
naming is very confusing, sometimes starting with xe_*, sometimes
with hwm_*, sometimes with hwmon_*... there is no consistency.

Please, Badal, choos a consistent prefix and stick with it for
every function and global definition.

Matt suggested xe_hwmon_*, I'm fine with it.

[...]

> >  struct hwm_drvdata {
> >  	struct xe_hwmon *hwmon;
> >  	struct device *hwmon_dev;
> > +	struct xe_gt *gt;
> >  	char name[12];
> > +	bool reset_in_progress;
> > +	wait_queue_head_t waitq;
> >  };
> >  
> >  struct xe_hwmon {
> >  	struct hwm_drvdata ddat;
> >  	struct mutex hwmon_lock;
> > +	int scl_shift_power;
> >  };
> >
> 
> Same as previous patch, 1 struct seems like a better idea to me.

I made the same comment in the previous patch.

[...]

> > +	switch (reg_name) {
> > +	case pkg_rapl_limit:
> > +		if (xe->info.platform == XE_DG2)
> > +			return PCU_CR_PACKAGE_RAPL_LIMIT;
> > +		else if (xe->info.platform == XE_PVC)
> > +			return PVC_GT0_PACKAGE_RAPL_LIMIT;
> > +		break;
> > +	case pkg_power_sku:
> > +		if (xe->info.platform == XE_DG2)
> > +			return PCU_CR_PACKAGE_POWER_SKU;
> > +		else if (xe->info.platform == XE_PVC)
> > +			return PVC_GT0_PACKAGE_POWER_SKU;
> > +		break;
> > +	case pkg_power_sku_unit:
> > +		if (xe->info.platform == XE_DG2)
> > +			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
> > +		else if (xe->info.platform == XE_PVC)
> > +			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> > +		break;
> > +	default:
> 
> BUG_ON or WARN_ON saying not possible?

MISSING_CASE() is in i915_utils.h, perhaps we can move it to a
more generic place... it would be at handy here.

> > +static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)
> 
> The return value is always 0, why not return value?
> 
> s/hwm_power_max_read/xe_hwmon_power_max_read
> 
> > +{
> > +	struct xe_hwmon *hwmon = ddat->hwmon;
> > +	u32 reg_val;
> > +	u64 r, min, max;
> > +
> > +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> > +
> 
> Same as above, use xe_device_assert_mem_access.
> 
> > +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
> > +	/* Check if PL1 limit is disabled */
> > +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> > +		*value = PL1_DISABLE;
> > +		xe_device_mem_access_put(gt_to_xe(ddat->gt));
> > +		return 0;
> > +	}
> > +
> > +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> > +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> > +
> > +	process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
> > +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> > +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> > +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
> > +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> > +
> > +	if (min && max)
> > +		*value = clamp_t(u64, *value, min, max);
> > +
> > +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> > +	return 0;
> > +}
> > +
> > +static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
> > +{
> > +	struct xe_hwmon *hwmon = ddat->hwmon;
> > +	DEFINE_WAIT(wait);
> > +	int ret = 0;
> > +	u32 nval;
> > +
> > +	/* Block waiting for GuC reset to complete when needed */
> > +	for (;;) {

with a do...while() you shouldn't need a for(;;)... your choice,
not going to beat on that.

> > +		mutex_lock(&hwmon->hwmon_lock);
> > +
> > +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> > +
> > +		if (!hwmon->ddat.reset_in_progress)
> > +			break;
> > +
> > +		if (signal_pending(current)) {
> > +			ret = -EINTR;
> > +			break;

cough! cough! unlock! cough! cough!

> > +		}
> > +
> > +		mutex_unlock(&hwmon->hwmon_lock);
> > +
> > +		schedule();
> > +	}
> > +	finish_wait(&ddat->waitq, &wait);
> > +	if (ret)
> > +		goto unlock;
> 
> Anyway to not open code this? We similar in with
> xe_guc_submit_reset_wait, could we expose a global reset in progress in
> function which we can expose at the gt level?
> 
> > +
> > +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> > +
> 
> This certainly is an outer most thing, e.g. doing this under
> hwmon->hwmon_lock seems dangerous. Again the upper levels of the stack
> should do the xe_device_mem_access_get, which it does. Just pointing out
> doing xe_device_mem_access_get/put under a lock isn't a good idea.
> 
> Also the the loop which acquires hwmon->hwmon_lock is confusing too.
> 
> > +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> > +	if (value == PL1_DISABLE) {
> > +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> > +				  PKG_PWR_LIM_1_EN, 0);
> > +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
> > +				  PKG_PWR_LIM_1_EN, 0);
> > +
> > +		if (nval & PKG_PWR_LIM_1_EN)
> > +			ret = -ENODEV;
> > +		goto exit;

cough! cough! lock! cough! cough!

> > +	}
> > +
> > +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> > +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> > +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
> > +
> > +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> > +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
> > +exit:
> > +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> > +unlock:
> > +	mutex_unlock(&hwmon->hwmon_lock);
> > +

mmhhh???... jokes apart this is so error prone that it will
deadlock as soon as someone will think of editing this file :)

It worried me already at the first part.

Please, as Matt said, have a more linear locking here.

[...]

Andi
