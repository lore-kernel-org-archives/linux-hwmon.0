Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27FEEB64D9
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jun 2023 15:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjF2PKD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jun 2023 11:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjF2PKB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jun 2023 11:10:01 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F9C30E6
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jun 2023 08:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688051400; x=1719587400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZiiFt4xToGwklbX1/8YH7t31So4Pr0Iw3mfx2+tZnfM=;
  b=ZD7tkymiy0k0JurI52Mqa7R7YuXrS0C6JPK1PvDNKGjYHZXngRN4h5iU
   vJGranLH7y3N5wlpbyOe0/7CU9bFguKqcVafShZI137jhrbjE+LKF98Ij
   YfICTt4XeFO5wb9xxcLrFdzmjTd6PiRM/IRxGX2AHFO5fKwL7N6hlBHmq
   rA3gGH5RXT6K5NDfjQqNf47G3lFfM/KBsGpUMdN3qu4E/tBgTgoRM5Lgc
   xEZVSiNGDHdHRlGvXC0gb6i+KK1zPj39V31f5KakFtRXEu2amrsUAza9S
   Mms0Khk5V+NngluL9ko/y/y2L0L87Q3pNFR6071+lnjqfcxq+0BZD8Iq4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="392856455"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="392856455"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 08:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841480679"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="841480679"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.49.226])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 08:09:55 -0700
Date:   Thu, 29 Jun 2023 17:09:51 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v2 5/6] drm/xe/hwmon: Expose hwmon energy attribute
Message-ID: <ZJ2ev5QkGFt/b6bq@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-6-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627183043.2024530-6-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

> @@ -614,12 +793,22 @@ void xe_hwmon_register(struct xe_device *xe)
>  
>  	/* primary GT to access device level properties */
>  	ddat->gt = xe->tiles[0].primary_gt;
> +//	ddat->gt = &xe->gt[0];

please clean it up before sending

> +	ddat->gt_n = -1;
>  
>  	ddat->hwmon = hwmon;
>  	snprintf(ddat->name, sizeof(ddat->name), "xe");
>  
>  	init_waitqueue_head(&ddat->waitq);
>  
> +	for_each_gt(gt, xe, id) {
> +		ddat_tile = hwmon->ddat_tile + id;
> +		ddat_tile->hwmon = hwmon;
> +		ddat_tile->gt = gt;
> +		snprintf(ddat_tile->name, sizeof(ddat_tile->name), "xe_tile%u", id);
> +		ddat_tile->gt_n = id;
> +	}
> +
>  	hwm_get_preregistration_info(ddat);
>  
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> @@ -637,6 +826,23 @@ void xe_hwmon_register(struct xe_device *xe)
>  	}
>  
>  	ddat->hwmon_dev = hwmon_dev;
> +
> +	for_each_gt(gt, xe, id) {

you could eventually make a for_each_hwmon_gt()

Andi

> +		ddat_tile = hwmon->ddat_tile + id;
> +		/*
> +		 * Create per-gt directories only if a per-gt attribute is
> +		 * visible. Currently this is only energy
> +		 */
> +		if (!hwm_gt_is_visible(ddat_tile, hwmon_energy, hwmon_energy_input, 0))
> +			continue;
> +
> +		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_tile->name,
> +								 ddat_tile,
> +								 &hwm_gt_chip_info,
> +								 NULL);
> +		if (!IS_ERR(hwmon_dev))
> +			ddat_tile->hwmon_dev = hwmon_dev;
> +	}
