Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58279EB64D9
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jun 2023 14:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjF2OkR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jun 2023 10:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbjF2OkK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jun 2023 10:40:10 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC40BC
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jun 2023 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688049609; x=1719585609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+6e4TPP25yZ9diKxZwARg0PGmdK5h0zQDfDb8R5WbtM=;
  b=V09qXxghzsH3A95CoL02kKPDyciwDvltj4J8SMPiCrtik7HU/3n/9KHX
   25KFvZJzICJ1LCBhzPv43lAd46twcX8H5Eir89CXlaAe00BaQ5PcxBNeB
   MB2rPq/PrjEOltDX4laq733ScJCn37m0bk7xbMGOk46oOIZj9n52NS62C
   CLgpNqBxY+Pe6dkuUAK4ZAwSlfJMRCt59z9n/XcVMTi7AitSbs+rNw6xS
   ZghMYYPNdDg14rD+5sP1nNMZEbIGSXtYq+StNolzlT0ViPWMBKOH5c0YO
   zcqf7VXgR7vnqexj10RGRrfltk9jNdQ0RWZPXx4awuR3PPhMTpJppHKFM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="359608610"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="359608610"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 07:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="694658873"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="694658873"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.49.226])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 07:40:04 -0700
Date:   Thu, 29 Jun 2023 16:40:00 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v2 3/6] drm/xe/hwmon: Expose card reactive critical power
Message-ID: <ZJ2XwFlgq4DUTrZr@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-4-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627183043.2024530-4-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> This is port from i915 hwmon.

Should this, then be a more generic framework for more gpu
drivers? Now we are having some code duplication.

[...]

>  hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>  {
>  	u32 reg_val;
> +	u32 uval;
>  
>  	switch (attr) {
>  	case hwmon_power_max:
> @@ -248,6 +274,9 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>  	case hwmon_power_rated_max:
>  		return process_hwmon_reg(ddat, pkg_power_sku,
>  					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
> +	case hwmon_power_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;

I like better the form below, with

	err = hwm_pcode_read...()
	if (!err)
		return 0;
	
	return !(uval & ....

>  	default:
>  		return 0;

[...]

> +static umode_t
> +hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;

this is a pattern that is repeated quite often, should this be a
separate function, maybe?

Andi

[...]
