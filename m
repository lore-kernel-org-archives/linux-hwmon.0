Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B210ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 12:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiIUMon (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 08:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiIUMom (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 08:44:42 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0559D63BC
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663764281; x=1695300281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KDQfceECUxtTPfl3QcG6NVqjgCRsknHtfgrpkFpRc7Q=;
  b=FBh3y2DpRzUDPlgJyW6xZ3Rn6qnGNcctPWQPgbK6Cn743bkVFVJlo6dg
   BuNHGjZ6xqdRatGCM/q74XRDOgQFy1iZ+JD1AFDxVpAJBmo12neMGrTAn
   qzfPtCj+npzB/B5345+C9EynqwTC01XSKNbxaqm+kx6mH/pUolTEtteXX
   cAVUTjuZG9o75z+BvCCOSW2FVoCw5gM22l3bZ/7saedCsbOAodyBD6w+3
   oi1f7iUj/OChkV69n9DtHjXER7bkqVk3GdISEZE1GG2ySX4JfnsL4z4WO
   ybwc4vVEthlrAzBiu99IbZPd1ggndzpdITAz9vNWZFctFSn5oyvDsWNC/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="283038895"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="283038895"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 05:44:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="864405711"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.180.68])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 05:44:38 -0700
Date:   Wed, 21 Sep 2022 14:44:35 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Message-ID: <YysHM8Ot1escBzEy@ashyti-mobl2.lan>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220916150054.807590-2-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

> +struct hwm_reg {
> +};
> +
> +struct hwm_drvdata {
> +	struct i915_hwmon *hwmon;
> +	struct intel_uncore *uncore;
> +	struct device *hwmon_dev;
> +	char name[12];
> +};
> +
> +struct i915_hwmon {
> +	struct hwm_drvdata ddat;
> +	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
> +	struct hwm_reg rg;
> +};
> +
> +static const struct hwmon_channel_info *hwm_info[] = {
> +	NULL
> +};
> +
> +static umode_t
> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +	       u32 attr, int channel)
> +{
> +	switch (type) {
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	 int channel, long *val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	  int channel, long val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops hwm_ops = {
> +	.is_visible = hwm_is_visible,
> +	.read = hwm_read,
> +	.write = hwm_write,
> +};
> +
> +static const struct hwmon_chip_info hwm_chip_info = {
> +	.ops = &hwm_ops,
> +	.info = hwm_info,
> +};

what's the point for splitting so much? Can't you just send the
hwmon driver all at once? With this patch you are not actually
doing anything useful. In my opinion this should be squashed with
the next ones.

> +static void
> +hwm_get_preregistration_info(struct drm_i915_private *i915)
> +{
> +}
> +
> +void i915_hwmon_register(struct drm_i915_private *i915)
> +{
> +	struct device *dev = i915->drm.dev;
> +	struct i915_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct hwm_drvdata *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);

why don't we use devm_kzalloc?

> +	if (!hwmon)
> +		return;
> +
> +	i915->hwmon = hwmon;
> +	mutex_init(&hwmon->hwmon_lock);
> +	ddat = &hwmon->ddat;
> +
> +	ddat->hwmon = hwmon;
> +	ddat->uncore = &i915->uncore;
> +	snprintf(ddat->name, sizeof(ddat->name), "i915");
> +
> +	hwm_get_preregistration_info(i915);
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
> +						    ddat,
> +						    &hwm_chip_info,
> +						    NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		mutex_destroy(&hwmon->hwmon_lock);

there is not such a big need to destroy the mutex. Destroying
mutexes is more useful when you actually are creating/destroying
and there is some debug need. I don't think that's the case.

With the devm_kzalloc this would be just a return.

Andi

> +		i915->hwmon = NULL;
> +		kfree(hwmon);
> +		return;
> +	}
> +
> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void i915_hwmon_unregister(struct drm_i915_private *i915)
> +{
> +	struct i915_hwmon *hwmon;
> +	struct hwm_drvdata *ddat;
> +
> +	hwmon = fetch_and_zero(&i915->hwmon);
> +	if (!hwmon)
> +		return;
> +
> +	ddat = &hwmon->ddat;
> +	if (ddat->hwmon_dev)
> +		hwmon_device_unregister(ddat->hwmon_dev);
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +	kfree(hwmon);
> +}
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> new file mode 100644
> index 000000000000..7ca9cf2c34c9
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_HWMON_H__
> +#define __I915_HWMON_H__
> +
> +struct drm_i915_private;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void i915_hwmon_register(struct drm_i915_private *i915);
> +void i915_hwmon_unregister(struct drm_i915_private *i915);
> +#else
> +static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
> +static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
> +#endif
> +
> +#endif /* __I915_HWMON_H__ */
> -- 
> 2.25.1
