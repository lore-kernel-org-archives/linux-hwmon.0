Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95247C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 18:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75736610F8
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 18:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhEMS4N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 14:56:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:45018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231844AbhEMS4M (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 14:56:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C04A6613DF;
        Thu, 13 May 2021 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620932102;
        bh=6M4N5n8xDTG2vNtrsaBAtVu1LNb54Awy5WvpikOlN9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U71xSef0oT2Tvx1n9oxgOtUw7Z12jUeedRG05ZuuanMw67jUDpZ6Uazy3ST/cG2BL
         QtEU+ovgMjFjaUl582Shnvu6X+E5jGbT1U0R+YFodNLseq3SV8yATxSxtJM6HLQGPg
         xGQIMqIZSh8wGKZFEzKj8yIzRhdMEZSU9CrvWLfeKCA4WvaJLFl6zI+kprAyrY2MdN
         /TB90mWLqBWhxhBQ3/c0E613C7LpcZInPeOHpH8YAXLfxy7Npip207Vv9Kb4RAoeMm
         vty4zMB48GDKUhHJuRQh3CIkDNBLD8tdhWpbsdMRjaAVzCUB+7tz4Knm0Vzo2ZZw83
         JPi5Pr05Gneag==
Received: by pali.im (Postfix)
        id 41F24715; Thu, 13 May 2021 20:54:59 +0200 (CEST)
Date:   Thu, 13 May 2021 20:54:59 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (dell-smm-hwmon) Fix index values
Message-ID: <20210513185459.aui7rdcocafv3re4@pali>
References: <20210513154546.12430-1-W_Armin@gmx.de>
 <20210513164838.eacakojhvtb2se2e@pali>
 <e333b7e2-4bb7-1be2-5d26-4b60e6463d7c@roeck-us.net>
 <60d82aa4-3f44-d10d-8db5-3d6a30f25945@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60d82aa4-3f44-d10d-8db5-3d6a30f25945@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 13 May 2021 20:41:06 Armin Wolf wrote:
> On 13.05.21 18:53 Guenter Roeck wrote:
> > On 5/13/21 9:48 AM, Pali Rohár wrote:
> > > On Thursday 13 May 2021 17:45:46 W_Armin@gmx.de wrote:
> > > > From: Armin Wolf <W_Armin@gmx.de>
> > > > 
> > > > When support for up to 10 temp sensors and for disabling automatic BIOS
> > > > fan control was added, noone updated the index values used for
> > > > disallowing fan support and fan type calls.
> > > > Fix those values.
> > > 
> > > Do you mean this change, right?
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1bb46a20e73b0bb3364cff3839c9f716ed327770
> > > 
> > > 
> > > Yes, it looks like that it should have been part of that change.
> > > 
> > > Therefore I suggest to add Fixes tag:
> > > 
> > > Fixes: 1bb46a20e73b ("hwmon: (dell-smm) Support up to 10 temp sensors")
> > > 
> > > Otherwise looks good!
> > > 
> > > Reviewed-by: Pali Rohár <pali@kernel.org>
> > > 
> > > For future development I would suggest to rewrite/drop these magic
> > > numbers as same problem can be easily repeated in future.
> > > 
> > 
> > The best solution would be to rewrite the driver to use
> > hwmon_device_register_with_info(), but that should be done
> > by someone with access to the hardware.
> > 
> > Guenter
> Im currently doing exactly that, since i have an old dell notebook. But
> that might take some time.

Perfect! Thank you for looking at this.

I think that this driver converged into state when it is used by more
non-developer users on LTS -stable kernels as developers which use play
with -rc kernels. So issues or breakages are detected sometimes after
longer time.

Also I think that driver is basically feature-complete so I do not have
reason for investing time in its development.

Currently I have only one Dell laptop and I'm not testing on it kernel
patches as it is used for different daily work and also uses 4.19 LTS
distribution kernel.

But when you send a patch which is larger and needs more testing, I have
no problem to try compile it as module for current distribution kernel
and exchange .ko module at runtime. And test if functionality works as
expected.

> > 
> > > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > > ---
> > > > Tested on a Dell Latitude C600.
> > > > ---
> > > >   drivers/hwmon/dell-smm-hwmon.c | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/hwmon/dell-smm-hwmon.c
> > > > b/drivers/hwmon/dell-smm-hwmon.c
> > > > index 2970892bed82..f2221ca0aa7b 100644
> > > > --- a/drivers/hwmon/dell-smm-hwmon.c
> > > > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > > > @@ -838,10 +838,10 @@ static struct attribute *i8k_attrs[] = {
> > > >   static umode_t i8k_is_visible(struct kobject *kobj, struct
> > > > attribute *attr,
> > > >                     int index)
> > > >   {
> > > > -    if (disallow_fan_support && index >= 8)
> > > > +    if (disallow_fan_support && index >= 20)
> > > >           return 0;
> > > >       if (disallow_fan_type_call &&
> > > > -        (index == 9 || index == 12 || index == 15))
> > > > +        (index == 21 || index == 25 || index == 28))
> > > >           return 0;
> > > >       if (index >= 0 && index <= 1 &&
> > > >           !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
> > > > --
> > > > 2.20.1
> > > > 
> > 
> 
