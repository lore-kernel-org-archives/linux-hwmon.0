Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652B3C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 21:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiJCVYi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 17:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiJCVVv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 17:21:51 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E2219C33
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664831595; x=1696367595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DO9ZPukMxmaIp+zy0RVVlJM+XNRpgeW7cFsGPXbz5IY=;
  b=D6wONw9OcTQJDHUvRYy1nEGT3j+YxySRduvFtSrhyRW1NZ8efyOSyip7
   u/yV4jWOU+7ewDdlBvqIDaIkTHFyiB6KTg/9kY82n98Dyzvq2nBr5yW8C
   WXke1y3dHvLSyflormq8+5U7KHBpqJg8lucgIHlzAWKNZJ1oUptGDKK4P
   JnZ3k/qFB8TTP+I31v1N3J3YlQBOUkxKZf0AT+LsxIDLZCTYpTz1/kv7v
   5ub9I88rTItP0ZJ7rrjFOy/70cFzssda+bFYiFbtBD8N7eCPhGAfs/msP
   QiOMaXAI7v1jGfjkzRJzQAl/xDRPnmorBhsybWSUztSnh/tc96+GZ2Duw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="289980347"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="289980347"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 14:13:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="692240868"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="692240868"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com) ([10.213.7.91])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 14:13:13 -0700
Date:   Mon, 3 Oct 2022 23:13:10 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        linux-hwmon@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/hwmon: Show device level energy
 usage
Message-ID: <YztQZoHViyw2Cqch@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-5-badal.nilawar@intel.com>
 <YzcezNGdRJnyXS3N@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzcezNGdRJnyXS3N@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

[...]

> > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > index 16e697b1db3d..7525db243d74 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > @@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
> >  Description:	RO. Card default power limit (default TDP setting).
> >  
> >  		Only supported for particular Intel i915 graphics platforms.
> > +
> > +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> > +Date:		February 2023
> > +KernelVersion:	6.2
> > +Contact:	dri-devel@lists.freedesktop.org
> 
> I'm sorry for being late on the review here, and I know that others
> already looked at the date and other details here in this doc.
> So I'm curious why we have decided for the dri-devel mailing list
> and not for the intel-gfx since intel-gfx is the only one we have
> listed for i915 dir in the MAINTAINERS file:
> L:      intel-gfx@lists.freedesktop.org

same question here.

> > +Description:	RO. Energy input of device in microjoules.
> > +
> > +		Only supported for particular Intel i915 graphics platforms.

[...]

> > +/*
> > + * hwm_energy - Obtain energy value
> > + *
> > + * The underlying energy hardware register is 32-bits and is subject to
> > + * overflow. How long before overflow? For example, with an example
> > + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> > + * a power draw of 1000 watts, the 32-bit counter will overflow in
> > + * approximately 4.36 minutes.
> > + *
> > + * Examples:
> > + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> > + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> > + *
> > + * The function significantly increases overflow duration (from 4.36
> > + * minutes) by accumulating the energy register into a 'long' as allowed by
> > + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> > + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> > + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> > + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> > + */
> > +static int
> > +hwm_energy(struct hwm_drvdata *ddat, long *energy)

This function can just be void.

Andi

> > +{

[...]
