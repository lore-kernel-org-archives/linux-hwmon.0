Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD93C001DF
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 23:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjHBXXb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 19:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbjHBXXa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 19:23:30 -0400
Received: from mgamail.intel.com (unknown [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89289D9
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 16:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691018606; x=1722554606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L4Xtl1VTyCQFWsEoMC8OQoZ8kaISiY2kU+aHiPudcck=;
  b=JkpmCf/i0FCfU4YCeY5XWT3z6I/ZdMfxjo8p6PYHkjQ0VfmPPkbCPoIs
   gPi9OGU+WC9yfrOEf78hUd5mK78JgAlm1oQjYlzh0XIrQn7efBdVJHZ/j
   St6IhgUMgSmVtJrUn3nvyr9PfA1wm5K+g59rxOf1diWz2FST6VeoY8U11
   pC+DX4r/FUGtGnDA7Lmo5PYvh264rA3g7TR4flvgp2UZ9ge6sNBVDsiRX
   5Cm+Kli6REWbdl5DxpgECrTHJyuVf2esKhqH+XBs/n2MfAYnqArbyAO+i
   RD2k8GoenCr0R04Ve5nc0QD0k3+/M6Aa0Br/JugLjHJ+VwmmebWg27KpK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367183138"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="367183138"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="799298747"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="799298747"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.38.55])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:23:23 -0700
Date:   Thu, 3 Aug 2023 01:23:21 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v3 2/6] drm/xe/hwmon: Expose power attributes
Message-ID: <ZMrlafpcCqHY/q5z@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230802135241.458855-3-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

On Wed, Aug 02, 2023 at 07:22:37PM +0530, Badal Nilawar wrote:
> Expose power_max (pl1) and power_rated_max (tdp) attributes.

can you please write a few words more here to explain the
interface being exposed and what these powers are?

> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MCHBAR_REGS_H__
> +#define _XE_MCHBAR_REGS_H_

there is an extra '_' in the ifndef

> +

[...]

>  #include <linux/hwmon.h>
>  
>  #include <drm/drm_managed.h>
> +#include "regs/xe_mchbar_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_hwmon.h"
> +#include "xe_mmio.h"
> +#include "xe_gt.h"

can we keep these in alphabetical order?

> +enum hwmon_reg_name {
> +	REG_PKG_RAPL_LIMIT,
> +	REG_PKG_POWER_SKU,
> +	REG_PKG_POWER_SKU_UNIT,
> +};

Are these names or id's? With name I understand string/

> +enum hwmon_reg_operation {
> +	REG_READ,
> +	REG_WRITE,
> +	REG_RMW,
> +};

I'm not checking on the prefixes here... I let someone more
experienced than me comment if there anything wrong.

> +/*
> + * SF_* - scale factors for particular quantities according to hwmon spec.
> + * - power  - microwatts
> + */

this comment looks a bit off to me, what does
" - power  - microwatts" stand for?

> +#define SF_POWER	1000000
>  
>  struct xe_hwmon_data {
>  	struct device *hwmon_dev;
> @@ -18,13 +39,268 @@ struct xe_hwmon_data {
>  
>  struct xe_hwmon {
>  	struct xe_hwmon_data ddat;
> -	struct mutex hwmon_lock;
> +	struct mutex hwmon_lock; /* rmw operations*/

please put this change in the previous patch.

> +	bool reset_in_progress;
> +	wait_queue_head_t waitq;
> +	int scl_shift_power;
>  };
>  
> +#define ddat_to_xe_hwmon(ddat)	({ container_of(ddat, struct xe_hwmon, ddat); })

Any particular reason for the ({ ... }) ?

> +static int process_hwmon_reg(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_name,
> +			     enum hwmon_reg_operation operation, u32 *value,
> +			     u32 clr, u32 set)
> +{
> +	struct xe_reg reg;
> +	int ret = 0;
> +
> +	reg.raw = hwmon_get_reg(ddat, reg_name);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	switch (operation) {
> +	case REG_READ:
> +		*value = xe_mmio_read32(ddat->gt, reg);
> +		break;
> +	case REG_WRITE:
> +		xe_mmio_write32(ddat->gt, reg, *value);
> +		break;
> +	case REG_RMW:
> +		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
> +		break;
> +	default:
> +		XE_MISSING_CASE(operation);
> +		ret = -EOPNOTSUPP;

you could just return 0 or return -EOPNOTSUPP everywhere and save
"ret" and a return (maybe not needed).

Just a personal preference, feel free to ignro and do as you like
it.

> +		break;
> +	}
> +
> +	return ret;
> +}

[...]

> +static int hwmon_power_max_read(struct xe_hwmon_data *ddat, long *value)
> +{
> +	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
> +	u32 reg_val;
> +	u64 r, min, max;
> +
> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
> +	/* Check if PL1 limit is disabled */
> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> +		*value = PL1_DISABLE;
> +		return 0;
> +	}
> +
> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	process_hwmon_reg_read64(ddat, REG_PKG_POWER_SKU, &r);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*value = clamp_t(u64, *value, min, max);
> +
> +	return 0;

you are returning '0' in any case, can we make this void?

> +}
> +
> +static inline bool check_reset_in_progress(struct xe_hwmon *hwmon)
> +{
> +	mutex_lock(&hwmon->hwmon_lock);
> +	if (!hwmon->reset_in_progress)
> +		return true;
> +	mutex_unlock(&hwmon->hwmon_lock);
> +		return false;

This is a bit scary (apart from the indentation) and without a
strong explanation I can't let this go.

I'm pretty sure that we don't need this... can you explain?

> +}
> +
> +static int hwmon_power_max_write(struct xe_hwmon_data *ddat, long value)
> +{
> +	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
> +	DEFINE_WAIT(wait);
> +	int ret = 0;
> +	u32 nval;
> +
> +	/* hwmon->hwmon_lock remain held till rmw operation is over */
> +	wait_event(hwmon->waitq, check_reset_in_progress(hwmon));
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +		process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_READ, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +
> +		if (nval & PKG_PWR_LIM_1_EN)
> +			ret = -ENODEV;
> +		goto unlock;
> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
> +
> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
> +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);

Where is this lock taken? Are you relying on the fact that this
lock might not be taken? In any case it is not allowed to unlock
a without previously locking.

It's very error prone when you lock in a function and unlock in
another function and in the rare cases when this is done it has
to be written in the function name.

> +	return 0;
> +}
> +
> +static int hwmon_power_rated_max_read(struct xe_hwmon_data *ddat, long *value)
> +{
> +	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
> +	u32 reg_val;
> +
> +	process_hwmon_reg(ddat, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
> +	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	return 0;

Can this function be void?

> +}

[...]

> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct xe_hwmon_data *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	if (!(hwmon && hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT)))
> +		return;
> +
> +	xe_device_assert_mem_access(gt_to_xe(ddat->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	hwmon->reset_in_progress = true;
> +
> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &r,
> +			  PKG_PWR_LIM_1_EN, 0);
> +	*old = !!(r & PKG_PWR_LIM_1_EN);

do we need to place under lock these last to lines?

> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct xe_hwmon_data *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	if (!(hwmon && hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT)))
> +		return;
> +
> +	xe_device_assert_mem_access(gt_to_xe(ddat->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &r,
> +			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> +
> +	hwmon->reset_in_progress = false;
> +	wake_up_all(&hwmon->waitq);

does the wake up need to be under lock?

Now... does it eve happen that "check_reset_in_progress()"
returns false and therefore unlocks the mutex?

> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}

[...]

>  void xe_hwmon_register(struct xe_device *xe)
> @@ -128,13 +425,16 @@ void xe_hwmon_register(struct xe_device *xe)
>  
>  	hwmon_get_preregistration_info(xe);
>  
> +	init_waitqueue_head(&hwmon->waitq);
> +
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>  
> -	/*  hwmon_dev points to device hwmon<i> */
> +	/* hwmon_dev points to device hwmon<i> */

Please this change needs to go in the previous patch.
What is <i>?

>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>  							 ddat,
>  							 &hwmon_chip_info,
>  							 NULL);
> +

This change in the previous patch.

>  	if (IS_ERR(hwmon_dev)) {
>  		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
>  		xe->hwmon = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index a078eeb0a68b..a5dc693569c5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -14,9 +14,13 @@ struct xe_device;
>  #if IS_REACHABLE(CONFIG_HWMON)
>  void xe_hwmon_register(struct xe_device *xe);
>  void xe_hwmon_unregister(struct xe_device *xe);
> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
>  #else
>  static inline void xe_hwmon_register(struct xe_device *xe) { };
>  static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +static inline void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old) { };
> +static inline void xe_hwmon_power_max_restore(struct xe_device *xe, bool old) { };
>  #endif
>  
>  #endif /* __XE_HWMON_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index daf56c846d03..030296f8f863 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -15,4 +15,7 @@
>  			    "Ioctl argument check failed at %s:%d: %s", \
>  			    __FILE__, __LINE__, #cond), 1))
>  
> +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> +			     __stringify(x), (long)(x))
> +

Should this have its own patch?

Andi

>  #endif
