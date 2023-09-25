Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898D3CE7A94
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 11:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjIYL5I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 07:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjIYL5H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 07:57:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9F79B
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695643021; x=1727179021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iKmcxrBTKRQniQjUYkXRgNdZm/YyFEElXABxPdax5tg=;
  b=NXjf5zGufix5vrv7770aPJlEywboj3rqhoHDlmLipPdV6MciwPLl2ylH
   svOoAZZ2GuIUNo4dni3dXAOFBgR+ZvJ4ErnD2WN3v1P5+q7O05ddUem7S
   hvW8BgEpD6+JRK/VMxfGa2v22P6L7DSZUlQumY/EyVaWDxw56svIP3WpS
   6thfV7z+6JI88NVBB6DQ0I5IdvGbYyLNLcGcgUOKo9zvn8q0RW4XrUyDy
   AJJk7KLFGoSkPILoagKSrqH6Ryy9FCSnn4Q4HXTxW3GJdJxVd8nRsitIn
   nKN9PevBORpPK1YxKJoFigpFJkIG4AWe96jPkP4u6VXdXP0vhtHN8rDGu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385061181"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="385061181"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891655869"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="891655869"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com) ([10.213.34.118])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:55:52 -0700
Date:   Mon, 25 Sep 2023 13:56:47 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: Re: [PATCH v6 5/5] drm/xe/hwmon: Expose power1_max_interval
Message-ID: <ZRF1f2OsC1pr5hFd@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-6-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925081842.3566834-6-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

> +static ssize_t
> +xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	u32 x, y, rxy, x_w = 2; /* 2 bits */
> +	u64 tau4, r, max_win;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12
> +	 * The hwmon->scl_shift_time default of 0xa results in a max tau of 256 seconds
> +	 */
> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in xe_hwmon_power1_max_interval_show()
> +	 */
> +	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 = ((1 << x_w) | x) << y;
> +	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> +	/* Convert to 1.x * power(2,y) */
> +	if (!val) {
> +		/* Avoid ilog2(0) */
> +		y = 0;
> +		x = 0;
> +	} else {
> +		y = ilog2(val);
> +		/* x = (val - (1 << y)) >> (y - 2); */

this is some spurious development comment, can you please remove
it?

> +		x = (val - (1ul << y)) << x_w >> y;
> +	}
> +
> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
> +			     PKG_PWR_LIM_1_TIME, rxy);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);

why are we locking here?

Andi

> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return count;
> +}
