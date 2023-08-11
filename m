Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C13C001DE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Aug 2023 16:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbjHKQB7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Aug 2023 12:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjHKQB6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Aug 2023 12:01:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BC426A0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 09:01:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2DE5A675AB
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 16:01:57 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp.kernel.org (Postfix) with ESMTPSA id D64B8C433C8;
        Fri, 11 Aug 2023 16:01:54 +0000 (UTC)
Date:   Fri, 11 Aug 2023 12:01:52 -0400
From:   Rodrigo Vivi <rodrigo.vivi@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rodrigo Vivi <rodrigo.vivi@intel.com>,
        "Nilawar, Badal" <badal.nilawar@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Message-ID: <ZNZbY0OAa2GvETUd@rdvivi-mobl4>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
 <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
 <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
 <710b7d67-2882-a077-cbd8-ab42c41aa3ca@intel.com>
 <ZNK0NzoBlGt6chs2@intel.com>
 <a95b0703-b3cd-23ae-7ba7-40aab960320a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a95b0703-b3cd-23ae-7ba7-40aab960320a@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 08, 2023 at 03:07:43PM -0700, Guenter Roeck wrote:
> On 8/8/23 14:31, Rodrigo Vivi wrote:
> > On Fri, Aug 04, 2023 at 08:06:22PM +0530, Nilawar, Badal wrote:
> > > 
> > > 
> > > On 04-08-2023 19:56, Guenter Roeck wrote:
> > > > On 8/4/23 06:19, Nilawar, Badal wrote:
> > > > > 
> > > > > Hi Guenter,
> > > > > On 03-08-2023 04:42, Guenter Roeck wrote:
> > > > > > On 8/2/23 15:40, Andi Shyti wrote:
> > > > > > > Hi Badal,
> > > > > > > 
> > > > > > > [...]
> > > > > > > 
> > > > > > > > +struct xe_hwmon_data {
> > > > > > > > +    struct device *hwmon_dev;
> > > > > > > > +    struct xe_gt *gt;
> > > > > > > > +    char name[12];
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct xe_hwmon {
> > > > > > > > +    struct xe_hwmon_data ddat;
> > > > > > > > +    struct mutex hwmon_lock;
> > > > > > > > +};
> > > > > > > 
> > > > > > > why do we need two structures here? Can we merge them?
> > > > > > > 
> > > > > > 
> > > > > > A later patch adds multiple hwmon devices which makes use of it.
> > > > > > I think that is flawed, and I am not inclined to accept it.
> > > > > Is there any obvious reason that there shouldn't be multiple
> > > > > devices? In i915 we are doing the same.
> > > > > https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3
> > > > > 
> > > > 
> > > > Technically you can do whatever you like as long as the code doesn't reside
> > > > in drivers/hwmon. I won't NACK it, but I won't give it a Reviewed-by:
> > > > either. i915 shouldn't do it, but I didn't realize what they are doing
> > > > at the time. Other drivers doing it wrong is not an argument. You can't
> > > > argue that you may drive faster than the speed limit because others do it
> > > > or because police didn't stop you last time you did either.
> > > > 
> > > > One chip, one hwmon device. Do you have separate parent devices for
> > > > all your hwmon devices ? If yes, you can argue that having multiple hwmon
> > > > devices make sense. If not, you can't.
> > > Thanks for clarification. There is only one parent device. So will try to
> > > accommodate single hwmon device.
> > 
> > Well, it is one PCI device, but under 1 pci device we can have multiple "tiles"
> > that can duplicate many components. Inside each tile we can even have multiple
> > "gt"s.
> > 
> > But back to the tile, each tile has its own metrics. It's own power delivery,
> > own sensors and all. They can even be seen as independent devices from this
> > angle.
> > 
> > I'm afraid that the attempt to put everything as one device, but all the
> > entries duplicated per tile/gt we might end up with a messed api.
> > 
> 
> Your argument does not make sense. I am not asking to duplicate anything.

Okay, I'm sorry, maybe 'duplication' was a bad choice of words from my part.

You had told that having multiple hwmon device for a single chip was not
acceptable.

But I'm trying to explain that we have a hardware architecture where the graphics
is duplicated in 'tiles' inside the same PCI card. Each tile with its
own sensors and monitoring systems. And also an extra sensors monitoring the
entire 'package' that includes the tiles and the SoC.
So 1 hwmon device per gt-tile and package sound the appropriated way to me.

Your lines had convinced Badal to get them all and merge in a single hwmon
device. If we do this, the API will get messed up.

And this is what I meant by 'messed up':
quoting Badal:
"""
With single device energy entries will look like hwmonxx/energy1_input,
energy2_input, energy3_input.
To identify which entry for what need to expose additional entry energyX_lable
which will contain ("package", "gtN")
"""

I am arguing that for this tiled ('sub-device') hw architecture the
initial patch from Badal, that is the same way implemented in i915 is
absolutely the right way to go with the current infrastructure.

One idea that I had the first time that I saw this was if it wouldn't
be acceptable for instance in hwmon an infra with named (numbered?)
sub-directories inside the the hwmon device. But I couldn't not find any
other hwmon usage out there that could justify a big change in the core of
hwmon like that.

Well, but maybe we are indeed missing some other better way of handling
this sub-device case with the current hwmon infrastructure. If so, I'd
like to hear more about the suggestions and get some initial pointers.

Thanks so much for your time and help here,
Rodrigo.

> 
> Guenter
> 
