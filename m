Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3AACD4846
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Sep 2023 17:25:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjIVRZI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Sep 2023 13:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjIVRZH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 13:25:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE778F1
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Sep 2023 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695403501; x=1726939501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/SroJ1aFo6ArEMp71YqeEGAaEDS7S5qASa1V5RBkrho=;
  b=kVJxedF/NEUcicKd9EpWx4OR94aH6KBVC3GGM52ta5PxsuRLuHVWtnjM
   jFTIIqQjXEOMqon+QdlfnajptFUN0xIoabWzLyJaJ4Rt/hJSds0zYDQLU
   x3U+1SdAKBtP1o1DVOLkjxYd7DwlOAm2I/GMUGXKpqr+l7TYLOeUQLoMQ
   n8fenLknLfVJEZZYAMzqs+iH/J5CUYbJQmV3TsPYdoetOG1ob4EBjD9pU
   lTfXAUhcfBdhPuZGWBE6EaXCxTLzNKZUJP8L2IqF6APcRIqi/p2uHRrwv
   bc1iT5nPDLBc2UdcKQfkFl+YlBxD/Yll+lPv4/zNCEOLhM1NKTEECJIAb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361140147"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="361140147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 10:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="871317483"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="871317483"
Received: from velangov-mobl.gar.corp.intel.com (HELO intel.com) ([10.214.174.70])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 10:24:52 -0700
Date:   Fri, 22 Sep 2023 19:24:46 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: Re: [PATCH v5 2/6] drm/xe/hwmon: Expose power attributes
Message-ID: <ZQ3N3vvbkh9xPX40@ashyti-mobl2.lan>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921102519.3355538-3-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
> +{
> +	u32 reg_val;
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +
> +		if (reg_val & PKG_PWR_LIM_1_EN)
> +			return -ENODEV;

so, here you are trying to disable PL1 and check then if it's
disabled. Shall we try at least twice before returning error?

And why ENODEV? It might be that we failed to write on the
register but it doesn't mean that the device is wrong.

> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> +
> +	return 0;
> +}

[...]

> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +								"xe",
> +								hwmon,
> +								&hwmon_chip_info,
> +								NULL);

here the allignment is a bit fancy... in this cases I wouldn't
mind going up to 100 characters or not align under the bracket.

I would write it like this

	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
					"xe", hwmon, &hwmon_chip_info, NULL);

but, of course, it's a matter of taste. Up to you.

Andi
