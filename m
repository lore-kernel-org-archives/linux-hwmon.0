Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F07EC001DC
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 20:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236236AbjGNUVw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 16:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbjGNUVw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 16:21:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC6030E3
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 13:21:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70FA161DE7
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 20:21:50 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.49])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp.kernel.org (Postfix) with ESMTPSA id 6855DC433C8;
        Fri, 14 Jul 2023 20:21:48 +0000 (UTC)
Date:   Fri, 14 Jul 2023 16:21:46 -0400
From:   Rodrigo Vivi <rodrigo.vivi@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [Intel-xe] [PATCH v2 0/6] Add HWMON support for DGFX
Message-ID: <ZLGuUM2+5OjTCmay@rdvivi-mobl4>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Jul 02, 2023 at 10:01:00AM -0700, Guenter Roeck wrote:
> On 7/2/23 08:57, Dixit, Ashutosh wrote:
> > On Sat, 01 Jul 2023 20:02:51 -0700, Guenter Roeck wrote:
> > > 
> > > On 7/1/23 18:31, Dixit, Ashutosh wrote:
> > > > On Tue, 27 Jun 2023 11:30:37 -0700, Badal Nilawar wrote:
> > > > > 
> > > > 
> > > > Hi Badal,
> > > > 
> > > > > This series adds the hwmon support on xe driver for DGFX
> > > > 
> > > > Needs some discussion but I have a general comment on this series
> > > > first. The implementation here follow what was done for i915. But how
> > > > "hwmon attributes are defined" I think we should look at how this was done
> > > > in other drm drivers, namely amdgpu and radeon. Look here (search for
> > > > "hwmon_attributes"):
> > > > 
> > > > drivers/gpu/drm/amd/pm/amdgpu_pm.c, and
> > > > drivers/gpu/drm/radeon/radeon_pm.c
> > > > 
> > > > Here the hwmon attribute definition is very similar to how general sysfs
> > > > attributes are defined (they will just appear in hwmon directories) and
> > > > does not carry baggage of the hwmon infrastructure (what i915 has). So my
> > > > preference is to shift to this amd/radeon way for xe.
> > > > 
> > > 
> > > You mean your preference is to use a deprecated hardware monitoring
> > > registration function and to explicitly violate the following statement
> > > from Documentation/hwmon/hwmon-kernel-api.rst ?
> > > 
> > >    All other hardware monitoring device registration functions are deprecated
> > >    and must not be used in new drivers.
> > 
> > I missed that, but since we also have this in ddaefa209c4a ("hwmon: Make
> > chip parameter for with_info API mandatory"), yes that is what it would
> > boil down to.
> > 
> 
> The chip parameter covers all standard hwmon sysfs attributes. A hwmon driver
> without standard sysfs attributes is not a hwmon driver. It abuses the hwmon
> subsystem and its API/ABI. If I catch such a driver, I'll NACK it. If I find
> one in the kernel, I will do my best to get it removed.
> 
> > > That is quite interesting. Please elaborate and explain your rationale.
> > 
> > Basically, like those other drm drivers, the chip parameter is of no use to
> > us (or at least we'd be totally fine not using it), hence the desire to
> > skip it.
> > 
> > But we are still required to use what we don't need? Do you care about
> > drivers outside drivers/hwmon?
> > 
> 
> I would suggest to read the hwmon API more closely to understand it. Your claim
> that "the chip parameter is of no use to us" is simply wrong, as should be obvious
> when you read this submission. Actually, if you would convert the other
> drm drivers to use it, it would reduce the size of the hwmon specific code
> in those drivers, typically by 20-40%. Given that, I must admit that I am quite
> baffled by your claim. Maybe you could explain that in more detail.
> 
> Of course, I care about use of the hardware monitoring subsystem
> outside drivers/hwmon. Unlike other maintainers, I let people register drivers
> from outside that directory, but that doesn't mean that I don't care.

Hi Guenter,

First of all sorry for jumping late here. I'm totally with you here and we should
definitely only use the new API. For standard entries that will definitely
reduce the code size.

So, since we are talking about reducing code here, and looking to other DRM
drivers, and thinking about the needs on this new Xe driver, I'm wondering
if you would consider accepting 'frequency' as a standard hwmon attribute.

We would need it to be RW so we could use to put freq requests as well,
and possibly different types/domains and even throttle reasons on top.

So we could then try to unify all the drm drivers in a common drm-hwmon
layer putting an end in all abuses and deprecated users.

But before moving fwd with any proposal I'd like to hear your thoughts on
this 'frequency' block as standard attribute.

Thanks,
Rodrigo.

> 
> FWIW, you are close to convincing me to add a warning message to the kernel
> to tell users of deprecated hwmon APIs that the API is deprecated.
> Alternatively, I may stop permitting new hwmon drivers outside drivers/hwmon.
> 
> Guenter
> 
> > Thanks.
> > --
> > Ashutosh
> 
