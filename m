Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDC3C64EC4
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Mar 2023 16:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCIQpf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Mar 2023 11:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjCIQpQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Mar 2023 11:45:16 -0500
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC616E692
        for <linux-hwmon@vger.kernel.org>; Thu,  9 Mar 2023 08:34:02 -0800 (PST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-176e43eb199so2872545fac.7
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Mar 2023 08:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678379642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEkr4IaQKiN+bzmiIZcnvGMMGRo7jIir1uiKe1VUqZU=;
        b=X5SYnXrMqzjgz7pSQ1n/dLxLkITJDxgyHHYSj/ycchtVrh4S7dT7u/jyFQsfE/Jx+h
         Nkl7p9mvAMmKGB0tyJMD6gj2N55oSzzC1uULgZiKDFHtWDZub+wOlRcVAoMwqIASiRc5
         mpZ1JmR0LYRjSVCYCgyWDT2ULe8NRqAOAKoNq1sA3acwapQt6/pIb6eTCJjouziTPIIH
         E2Z0AivkzUY1yQAABFbslknMES4uL3at0+9Njau2KTx7NgkcxyNrUIR/G+FaSo9ixIBg
         08GWJJ/97aFQ4p60DN4LiR9FAdiiURh5iRlPaULzoCZRpZQVdnP/gS+UrFWWLDq4lLKB
         tdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678379642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEkr4IaQKiN+bzmiIZcnvGMMGRo7jIir1uiKe1VUqZU=;
        b=q+IDCigigGYr4GL26QIpUIqBXhe6an3mCFw8yb43achgEOP7w3idB98VuKZgYVOlmD
         n5bs52Yo05mtrwj+N6JCINWTDgD0DKb84v4SaQ5iTmhvsupJE1vNt/o0MaN1htKSJbcY
         Q/7+dxzw3SkEIVunFbMOKniE1iltHU9rvqY2b8mbLSTSdoxKgYnxne9gFTlKGrQZYw6S
         +iu7LStyCmi3X6yj69kb76TkRSHtVWQwVapKYVMZnM4HNG1mw4Lh/Y3UmQb1PDWxHRwU
         OUgbASOqtlqItafnPkT76v+65h9PRlPsJ/84/j31rdenx+bBCsfNxpGfyRo7JM2Ocvwl
         MqLA==
X-Gm-Message-State: AO0yUKV7S9mJUXyPzlDyXq7/g/SIiHetZuYo9qZrgeUMOrTLfVFXTvZx
        RLKRtG8c5XtPbJWXPqwMTdMoBrUNAXw=
X-Google-Smtp-Source: AK7set+KhEAx3r4Y9MIM+NVdqGP5VOGZRy6Nk+cs5k+7rrb+TRVpcVOW4MMUPsUfZPMGuLum1I/gzQ==
X-Received: by 2002:a05:6870:819d:b0:172:21e9:21c7 with SMTP id k29-20020a056870819d00b0017221e921c7mr13509074oae.40.1678379641913;
        Thu, 09 Mar 2023 08:34:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bf7-20020a0568700a0700b0017243e98ce9sm6969444oac.54.2023.03.09.08.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 08:34:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 9 Mar 2023 08:33:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        riana.tauro@intel.com, anshuman.gupta@intel.com,
        jon.ewins@intel.com,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP setting
Message-ID: <5d99cb43-4372-43e3-ae38-b45fc21896b4@roeck-us.net>
References: <20220812173715.2398586-1-badal.nilawar@intel.com>
 <20220812173715.2398586-4-badal.nilawar@intel.com>
 <b6464c27-ce81-02aa-b032-4dbcab576e44@roeck-us.net>
 <87wn4132v4.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn4132v4.wl-ashutosh.dixit@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Feb 28, 2023 at 01:18:55PM -0800, Dixit, Ashutosh wrote:
> On Fri, 12 Aug 2022 11:06:58 -0700, Guenter Roeck wrote:
> >
> 
> Hi Guenter/linux-hwmon,
> 
> 
> > On 8/12/22 10:37, Badal Nilawar wrote:
> > > From: Dale B Stimson <dale.b.stimson@intel.com>
> > >
> > > Use i915 HWMON to display/modify dGfx power PL1 limit and TDP setting.
> > >
> 
> /snip/
> 
> >
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> >
> > > ---
> > >   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  20 ++
> > >   drivers/gpu/drm/i915/i915_hwmon.c             | 176 +++++++++++++++++-
> > >   drivers/gpu/drm/i915/i915_reg.h               |  16 ++
> > >   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   7 +
> > >   4 files changed, 217 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > index 24c4b7477d51..9a2d10edfce8 100644
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
> 
> We exposed this as 'power1_max' previously. However this is a "power
> limit".
> 
> https://github.com/torvalds/linux/blob/master/Documentation/hwmon/sysfs-interface.rst
> 
> says power1_max is "Maximum power". On the other hand, power1_cap is "If
> power use rises above this limit, the system should take action to reduce
> power use". So it would seem we should have chosen power1_cap for this
> power limit instead of power1_max? So do you think we should change this to
> power1_cap instead? Though even power1_max has an associated alarm so it
> also seems to be a sort of limit.
> 
> Is there any guidance as to how these different power limits should be
> used? Generally speaking is: power1_max <= power1_cap <= power1_crit, or is
> it arbitrary or something else?
> 

Nothing should ever be "arbitrary" but have some reason. Arbitrary is
if you glue all the possible attributes onto a wall and then select the
ones to use by throwing darts at it.

powerX_min, powerX_max and powerX_crit are typically hard limits which
can not actively be influenced without drastic measures such as turning
off some hardware. powerX_cap is supposed to be more flexible; the
assumption is that the hardware or firmware has some means to control power
such that it does not exceed powerX_cap (while maintaining operational
status), for example by modifying operational frequencies.

Nowadays everything may be a bit more flexible; for example, one could
imagine that a modern system could (via software) reduce the operational
frequency of the system if power consumption exceeds powerX_max or
powerX_crit. The distinction would be that with powerX_cap, the hardware
or firmware would in general be in control, while with powerX_max
and powerX_crit the host software would be in control.

> Also, only power1_cap seems to have power1_cap_min and power1_cap_max (in
> case we wanted to use min/max values for the limits), not the others.

powerX_min is supported by the infrastructure. It not being documented
is an oversight.

Guenter

> 
> Separately, we have already used up power1_crit (which is the other limit
> in official hwmon power limits) so we can't use that.
> 
> Thanks.
> --
> Ashutosh
