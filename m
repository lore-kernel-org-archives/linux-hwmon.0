Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0656EECAAD4
	for <linux-hwmon@archiver.kernel.org>; Wed, 31 Aug 2022 12:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiHaMI5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 31 Aug 2022 08:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiHaMI4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 08:08:56 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D9DD2E9E;
        Wed, 31 Aug 2022 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661947735; x=1693483735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4hh3TdvWLOW9de6yNRQgeeSpBmX7eKRJxoqCdgzzroE=;
  b=N3ZBePJvnRrN/Pv5iNXD+ppB4TPwUbFAvvYCg+SmdXhHaufRXM63+vVO
   jJvzEHsqmo7cB4k0MWnpeuJslL2yBvKNDKZpCLeJk6oE+hbmzWh9uvmLF
   JSUSICZYhV4uJ9uXpp0U49gRCYLhgf/kgjbKomeCpgvA69NGBeEyz+9Mo
   CkLXbigLJA4jXWXhTf/O/5NaWbPlZPm40B8OkaFLd1vVrL2FXiK2m3aFF
   IjKll/Bg1yBlJyXbo+C86A78rb+AVapI7wqpAkzFVpyspL3R57NLT3942
   7W/pCFNIe2CLpPwyl6MUGTchi2KwxSHPbEKJ2D0wxti5QSbxP7YVixugM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="293007841"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="293007841"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 05:08:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="738085100"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 05:08:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oTMWU-006Meb-2i;
        Wed, 31 Aug 2022 15:08:46 +0300
Date:   Wed, 31 Aug 2022 15:08:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Eliav Farber <farbere@amazon.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        p.zabel@pengutronix.de, rtanwar@maxlinear.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, talel@amazon.com, hhhawa@amazon.com,
        jonnyc@amazon.com, hanochu@amazon.com, ronenk@amazon.com,
        itamark@amazon.com, shellykz@amazon.com, shorer@amazon.com,
        amitlavi@amazon.com, almogbs@amazon.com, dkl@amazon.com,
        rahul.tanwar@linux.intel.com
Subject: Re: [PATCH v3 15/19] hwmon: (mr75203) add support for series 6
 temperature equation
Message-ID: <Yw9PTobSRlkh/0i4@smile.fi.intel.com>
References: <20220830192212.28570-1-farbere@amazon.com>
 <20220830192212.28570-16-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830192212.28570-16-farbere@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 30, 2022 at 07:22:08PM +0000, Eliav Farber wrote:
> The current equation used in code is aligned to series 5:
> T = G + H * (n / cal5 - 0.5) + J * F
> Where:
> G = 60, H = 200, cal5 = 4094, J = -0.1, F = frequency clock in MHz
> 
> Series 6 has a slightly different equation:
> T = G + H * (n / cal5 - 0.5)
> and a different set of coefficients:
> G = 57.4, H = 249.4, cal5 = 4096
> 
> This change supports equation and coefficients for both series.
> (for series 6, J is set to 0).
> 
> The series is determined according to “ts-series” property in device
> tree.
> If absent, series 5 is assumed to be the default.

...

> -#define PVT_H_CONST		200000
> -#define PVT_G_CONST		60000
> -#define PVT_J_CONST		-100
> -#define PVT_CAL5_CONST		4094

You just introduced them patch before. Please, avoid ping-pong style in
the same series.

...

> +	ret = of_property_read_u32(np, "moortec,ts-series", &series);

of_ ?!

Be consistent. Either you use OF everywhere, or device property APIs.

...

> +	if (ret)
> +		series = TEMPERATURE_SENSOR_SERIES_5;
> +
> +	if (series == TEMPERATURE_SENSOR_SERIES_5) {
> +		ts_coeff->h = PVT_SERIES5_H_CONST;
> +		ts_coeff->g = PVT_SERIES5_G_CONST;
> +		ts_coeff->j = PVT_SERIES5_J_CONST;
> +		ts_coeff->cal5 = PVT_SERIES5_CAL5_CONST;
> +	} else if (series == TEMPERATURE_SENSOR_SERIES_6) {
> +		ts_coeff->h = PVT_SERIES6_H_CONST;
> +		ts_coeff->g = PVT_SERIES6_G_CONST;
> +		ts_coeff->j = PVT_SERIES6_J_CONST;
> +		ts_coeff->cal5 = PVT_SERIES6_CAL5_CONST;
> +	} else {
> +		dev_err(dev, "invalid temperature sensor series (%u)\n",
> +			series);
> +		return -EINVAL;
> +	}

switch-case?

-- 
With Best Regards,
Andy Shevchenko


