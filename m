Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C65ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Sep 2022 12:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbiIFMDq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Sep 2022 08:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbiIFMDo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 08:03:44 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ADA78231;
        Tue,  6 Sep 2022 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662465823; x=1694001823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4+M54oJEAmpUgzwqHAgtKWrqpFIukcuuWaBTNO+cn0c=;
  b=KbCteuXW16N9QSI15kJ6T9BieiuPN8zltuqJSlMGSZ0etEBb2ocDCtbO
   OgwwQ6GxaTL2qxNaGByoqTIGaMO67arw6c/l8xkfsA2jlTiRhmQQGr0nr
   qzSww8GDPkfisqMqgeh2rfzqYCz6SwLZ6QOY5r2h+0sL6AVSbsSPPprVL
   FRuQR18uwl7XuFp8B2Z2apOBwevHAvyFJ21kkNlzFSogZZlpTbkwAVZYq
   fjZXcrzVHKelImoXV/6gauzvhyb4wV567fMa1YTGiz8NdHVNssT5E9DwV
   IrCOREe5L0UAIdGgQoC0tKQdL0/wPjY0b+LZhLB2Onj4Q6ALG9oNnRgzx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="297887264"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="297887264"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 05:03:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="614072065"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 05:03:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oVXIn-0096P7-15;
        Tue, 06 Sep 2022 15:03:37 +0300
Date:   Tue, 6 Sep 2022 15:03:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Eliav Farber <farbere@amazon.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        p.zabel@pengutronix.de, rtanwar@maxlinear.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, hhhawa@amazon.com, jonnyc@amazon.com
Subject: Re: [PATCH v4 05/21] hwmon: (mr75203) fix voltage equation for
 negative source input
Message-ID: <Yxc3GeFc5gDKrYyP@smile.fi.intel.com>
References: <20220906083356.21067-1-farbere@amazon.com>
 <20220906083356.21067-6-farbere@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906083356.21067-6-farbere@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 06, 2022 at 08:33:40AM +0000, Eliav Farber wrote:
> According to Moortec Embedded Voltage Monitor (MEVM) series 3 data
> sheet, the minimum input signal is -100mv and maximum input signal
> is +1000mv.
> 
> The equation used to convert the digital word to voltage uses mixed
> types (*val signed and n unsigned), and on 64 bit machines also has
> different size, since sizeof(u32) = 4 and sizeof(long) = 8.
> 
> So when measuring a negative input, n will be small enough, such that
> PVT_N_CONST * n < PVT_R_CONST, and the result of
> (PVT_N_CONST * n - PVT_R_CONST) will overflow to a very big positive
> 32 bit number. Then when storing the result in *val it will be the same
> value just in 64 bit (instead of it representing a negative number which
> will what happen when sizeof(long) = 4).
> 
> When -1023 <= (PVT_N_CONST * n - PVT_R_CONST) <= -1
> dividing the number by 1024 should result of in 0, but because ">> 10"
> is used it results in -1 (0xf...fffff).
> 
> This change fixes the sign problem and supports negative values by
> casting n to long and replacing the shift right with div operation.

This is really downside of C...

...

> -		*val = (PVT_N_CONST * n - PVT_R_CONST) >> PVT_CONV_BITS;
> +		*val = (PVT_N_CONST * (long)n - PVT_R_CONST) / (1 << PVT_CONV_BITS);

Wondering if we can use BIT(PVT_CONV_BITS) for two (quite unlikely to happen,
I hope) purposes:

1) Somebody copies such code where PVT_CONV_BITS analogue can be 31,
   which is according to C standard is UB (undefined behaviour).

2) It makes shorter the line and also drops the pattern where some
   dumb robot may propose a patch to basically revert the division
   change.

-- 
With Best Regards,
Andy Shevchenko


