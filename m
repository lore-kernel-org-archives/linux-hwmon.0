Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6D5EB64D9
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jun 2023 13:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjF2Ntz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jun 2023 09:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbjF2Nty (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jun 2023 09:49:54 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEF23593
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jun 2023 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688046592; x=1719582592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDuzu+Ee/1OfWwFmJIt/U0/ftCMHy4OMZ43jDu9dXiI=;
  b=FNFdW//pslHR5yVQEa0A6QqaX4mfRZeYUKelVvSwpgn6PbWHpSUIlps8
   58judxo1bPnMamX5FmC7GQ4BFYUQmVmDNDop1eJXkBoFmvmyLSoV0HPna
   HuwdRuMn2dlJS5UNRu12IlrVpKp3lBSEYB9iI//nVc1yoTZay/qFKyd+U
   +570v4i++JRI57MBksXYv9NgYBwhGC5JVD38ynC4cZOyHGbhzkY4h1rDS
   6G93YTkS4RsjdFTpahbuCMCJ0eGJlQ3x55AN74sdDRJ6pVvBlctYEI21b
   qeOncwgwdiNkahEoLNe4yQpOc3HhaIjSXmiRxdATz6C44Ybm6ZeojWVB2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342448604"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="342448604"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 06:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="717382454"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="717382454"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.49.226])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 06:49:47 -0700
Date:   Thu, 29 Jun 2023 15:49:43 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v2 1/6] drm/xe/hwmon: Add HWMON infrastructure
Message-ID: <ZJ2L9+lMBU1L0U3M@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627183043.2024530-2-badal.nilawar@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_debugfs_register(xe);
>  
> +	xe_hwmon_register(xe);

we don't have any information whe hwmon has been created or not.

Please return an error and print a warning if something wrong
happens and we fail to register the hwmon interface.

[...]

> +struct hwm_drvdata {
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	char name[12];
> +};
> +
> +struct xe_hwmon {
> +	struct hwm_drvdata ddat;
> +	struct mutex hwmon_lock;
> +};

What's the reason for having two different structures here?

[...]

> +void xe_hwmon_register(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct hwm_drvdata *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(xe))
> +		return;

this check is useless, we wouldn't be here otherwise.

[...]

> +void xe_hwmon_unregister(struct xe_device *xe)
> +{
> +	xe->hwmon = NULL;

We could also destroy the mutex and unregister the hwmon?

[...]

> +#if IS_REACHABLE(CONFIG_HWMON)
> +void xe_hwmon_register(struct xe_device *xe);
> +void xe_hwmon_unregister(struct xe_device *xe);
> +#else
> +static inline void xe_hwmon_register(struct xe_device *xe) { };
> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +#endif

for readability we can leave some space between the
#if...#else...#endif and the content.

Andi
