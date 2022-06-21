Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD27CC43334
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Jun 2022 17:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbiFURoa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Jun 2022 13:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbiFURo0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Jun 2022 13:44:26 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2671CB2E
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jun 2022 10:44:25 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 23so7602546pgc.8
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jun 2022 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Sac1i2UMguOZYNf/xud4fG4r8aL9I2PZA0GzUUD5kCs=;
        b=YFCLiFg7SU+jN3yuEq9vUFYvT89N2KPsAk+2XSF8Tbb3zIG2o9xITxyNkb2KI4ylW7
         kNJlQ0Q2a4OFKJsTtB/f5z7zg9QHE18p/MZQ9B5NOXgiKOGL9NvAN6h9/nZCvIaaMSov
         ciziJrHkgQTLYdfHuo6+lj5HXqQCcFwwmt2o0wgU/8n0FCLo65AzHPDlcCYfwdVxYJ64
         HwgQgjQyGY4fmkuC3auP3WVmyG8fuOBNkJy0HdIxInJiCakLWFeRg/Te/pNh3ONwtmeH
         aKuau7zOWtp9rz0UPqXhpXB6+2fuuxLySqIyTinDYuuTpz0XQ9WsQ6fUvU6y6+xFwFFG
         m7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Sac1i2UMguOZYNf/xud4fG4r8aL9I2PZA0GzUUD5kCs=;
        b=XEsaOVLULLHBZ1pbG6YMvoRjz8HUvhjxrHLCl9mGXF0y7djzQKXH4AUd8XRDgGjnXn
         +fwTBezyQfqUK3VFf7jWZe9BvREWgvtDJp/CZ7SWWsi8vdnMsp4OXBFt7LnH26cLPvoR
         VSbCWRavkxahmwCDHNXDe6hxlhIeG0CaZgZ7l7LAsj85xwqTGCTJKnMbqCo/LPQ4RWIJ
         RWbnmsEHtcLXUFGZGONvafNTctZ9ZQrm2kgkOYW0CQUivVDUhUChnv++B99ZweRah0ar
         xYAaN90P4GywYmh3P4OzJroVflFX7+azAcJuSGas6IrKWpkSR5t2PuTYGtdXYy4uOa/s
         HJag==
X-Gm-Message-State: AJIora/GveYBdvMCEKKU1YUvhr4I2aTAHRUt5lXP+iW787Mw9vTEzTvl
        8qyP2Ix4iSDVgeko47hSBGZCcSfEo18=
X-Google-Smtp-Source: AGRyM1vZsD3Nbhcq4xVKtu8UgO/7Ov6+sFzqOqwUupET9ZnWqXF2VmyyMWJvNseytLLl90P5cujwdA==
X-Received: by 2002:a05:6a00:1956:b0:51c:3a0:49d2 with SMTP id s22-20020a056a00195600b0051c03a049d2mr31174737pfk.29.1655833464723;
        Tue, 21 Jun 2022 10:44:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w9-20020a62c709000000b0051ba97b788bsm11735957pfg.27.2022.06.21.10.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 10:44:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Jun 2022 10:44:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org, anshuman.gupta@intel.com,
        jon.ewins@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/i915/hwmon: Add HWMON power sensor support
Message-ID: <20220621174421.GA3456551@roeck-us.net>
References: <20220620204649.894703-1-badal.nilawar@intel.com>
 <20220620204649.894703-4-badal.nilawar@intel.com>
 <4277d384-147a-6de4-abe3-3b64b9dae207@roeck-us.net>
 <87bkumv7q2.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkumv7q2.wl-ashutosh.dixit@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 20, 2022 at 11:41:41PM -0700, Dixit, Ashutosh wrote:
> On Mon, 20 Jun 2022 13:58:49 -0700, Guenter Roeck wrote:
> >
> 
> Hi Guenter, Thanks for taking a look.
> 
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > index 24c4b7477d51..945f472dd4a2 100644
> > > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
> > >   Description:	RO. Current Voltage in millivolt.
> > >			Only supported for particular Intel i915 graphics
> > > platforms.
> > > +
> > > +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> > > +Date:		June 2022
> > > +KernelVersion:	5.19
> > > +Contact:	dri-devel@lists.freedesktop.org
> > > +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> > > +
> > > +		The power controller will throttle the operating frequency
> > > +		if the power averaged over a window (typically seconds)
> > > +		exceeds this limit.
> > > +
> > > +		Only supported for particular Intel i915 graphics platforms.
> > > +
> > > +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_default
> >
> > I don't immediately see the reason for not using the standard power1_cap
> > attribute, which is described as
> >
> >		If power use rises above this limit, the
> >                 system should take action to reduce power use.
> >
> > and pretty much matches the description above.
> 
> Sorry I believe you are referring to the description above which is for the
> standard power1_max attribute (as we have used it). The non-standard
> attribute is power1_max_default the description for which is below ("Card
> default power limit (default TDP setting)").
> 

If you use power1_max to limit power consumption if exceeded, power1_cap
might have been more appropriate.

> > > +Date:		June 2022
> > > +KernelVersion:	5.19
> > > +Contact:	dri-devel@lists.freedesktop.org
> > > +Description:	RO. Card default power limit (default TDP setting).
> 
> Actually we do not want to use custom hwmon attributes as far as
> possible and are looking for some guidance on which standard attributes
> which we should use instead.
> 
You could possibly have used power1_rated_max instead of power1_max_default.

> These are the power attributes we are interested in: the two above and
> another one which will come in a future patch:
> 
> 1. PL1 (RW)
> 
>    https://www.hardwaretimes.com/intel-10th-gen-cpu-power-consumption-explained-pl1-pl2-and-tau/
> 
> 2. TDP (RO)
> 
>    https://en.wikipedia.org/wiki/Thermal_design_power
> 
Not sure I understand the difference between 'default TDP' (RO),
'TDP' (RO), and PL1.

> 3. Tau (RW)
> 
>    https://www.hardwaretimes.com/intel-10th-gen-cpu-power-consumption-explained-pl1-pl2-and-tau/
> 
> Would you be able to suggest if there are standard hwmon attributes which
> we would be able to use for these three? We also want to use the read/write
> permissions as shown above.
> 

There are a number of standard power attributes available to set or report
limits (cap, cap_max, cap_min, max, crit, rated_min, rated_max). I would
suggest to pick from that list whatever you think fits best. I don't have
a recommendation for Tau.

Either case, when reporting power, make sure you don't hit any of the
security issues which caused power reporting to be deleted for other CPUs.
Restricting read access to hwmon attributes for non-privileged users is not
acceptable.

Thanks,
Guenter
