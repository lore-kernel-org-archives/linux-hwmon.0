Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E4AC001DE
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 22:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjHBWlA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 18:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjHBWk7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 18:40:59 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D52610E7
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 15:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691016058; x=1722552058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f8YFBTlUshDYzhWoXJmWq5V3aYJIeDhpQpoZmgtlBak=;
  b=AblUtTDl74mQLxSMv3HAv6PfWaPj6y1rByeP9bskAG2HwPBVXIsux+UK
   e90NwHzhCEjy1oOwLltK4xejovt73/nT19Lv+sveD7LcZ4jtwsB2/iBUs
   Xf68oV0fs9yJbjtHKRESfOEXTI8ZqPC6Ms6OcoQoxPc2Nz26JcQSasWgl
   CaMl1GeygS4IX8/RcrmZgXdPeZiuebOU//8DstWppj8kbH+8oXX3Odr79
   YDj6F8BwPjxgT5/kyrnsyy8oJjUbUuhvC6BjhmsaLD2Yce/7DoN8Rr9G9
   dZcrIZkL0PAGxvllKFpnY4VmN3Ml73kI4B/yXeD7f/ep5T36qlpdujGp0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369719189"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="369719189"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 15:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843326383"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="843326383"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.38.55])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 15:40:40 -0700
Date:   Thu, 3 Aug 2023 00:40:37 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Message-ID: <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802135241.458855-2-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

> +struct xe_hwmon_data {
> +	struct device *hwmon_dev;
> +	struct xe_gt *gt;
> +	char name[12];
> +};
> +
> +struct xe_hwmon {
> +	struct xe_hwmon_data ddat;
> +	struct mutex hwmon_lock;
> +};

why do we need two structures here? Can we merge them?

> +static const struct hwmon_channel_info *hwmon_info[] = {
> +	NULL
> +};

just:

  static const struct hwmon_channel_info *hwmon_info[] = { };

would do.

> +static umode_t
> +hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		 u32 attr, int channel)
> +{
> +	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (type) {
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;

OK... we are forced to go through the switch and initialize ret.
Would be nicer to initialize ret to '0'... but it's not
important, feel free to ignore this comment if the compiler
doesn't complain.

> +}

[...]

> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
> +							 ddat,
> +							 &hwmon_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));

I think this is better:

   drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", hwmon_dev);

> +		xe->hwmon = NULL;
> +		return;
> +	}
> +
> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void xe_hwmon_unregister(struct xe_device *xe)
> +{
> +	xe->hwmon = NULL;

I think this is not necessary. Will xe check for hwmon at some
point?

Andi

> +}
