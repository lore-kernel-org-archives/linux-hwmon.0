Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBE8C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 06:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiFFG4Z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 02:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiFFG4Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 02:56:24 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2000220EB
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jun 2022 23:56:23 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Mon,  6 Jun 2022 08:56:20 +0200 (CEST)
Date:   Mon, 6 Jun 2022 08:56:18 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 4/7] hwmon: (lm90) Add support for 2nd remote channel's
 offset register
Message-ID: <Yp2lEmvD+5JiGejX@t480s.localdomain>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-5-sst@poczta.fm>
 <20220605180310.GA3151289@roeck-us.net>
 <Yp2fCO84VrrSQHbL@t480s.localdomain>
 <5f471f82-83b1-aea4-ea25-e51c0672c8ff@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f471f82-83b1-aea4-ea25-e51c0672c8ff@roeck-us.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1654498582;
        bh=bfQRRY+S6j5ps09OSWSQ5yO6cgGebDFoRVda7QF2vA8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Q1D/6GjRv4NNNcJHO6vN0LQK4KJQs/MEpH2pp2mNq7twQdJthgUVeWz2syjpvtO9N
         uZ2W5XbJKpDqsV89EDKuB2HAKR4sQTZyoOzNTd3cdwua6y1p54J5hx3FUDgmMD7P34
         FkT3r6cIBnCfL48snKstDMhAMhbkoK5fw4ncUH7Y=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On cze 05, 2022 23:50, Guenter Roeck wrote:
> On 6/5/22 23:30, Slawomir Stepien wrote:
> > On cze 05, 2022 11:03, Guenter Roeck wrote:
> > > On Wed, May 25, 2022 at 09:36:54AM +0200, Slawomir Stepien wrote:
> > > > From: Slawomir Stepien <slawomir.stepien@nokia.com>
> > > > 
> > > > The ADT7461 supports offset register for both remote channels it has.
> > > 
> > > ADT7481
> > 
> > Oops. I will fix that in new version.
> > 
> > > > Both registers have the same bit width (resolution).
> > > > 
> > > > In the code, this device has LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags,
> > > > but the support of second remote channel's offset is missing. Add that
> > > > implementation.
> > > > 
> > > > Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> > > > ---
> > > >   drivers/hwmon/lm90.c | 37 ++++++++++++++++++++++++++++++++-----
> > > >   1 file changed, 32 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> > > > index 02b211a4e571..d226f1dea2ba 100644
> > > > --- a/drivers/hwmon/lm90.c
> > > > +++ b/drivers/hwmon/lm90.c
> > > > @@ -153,6 +153,8 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
> > > >   #define LM90_REG_REMOTE_TEMPL		0x10
> > > >   #define LM90_REG_REMOTE_OFFSH		0x11
> > > >   #define LM90_REG_REMOTE_OFFSL		0x12
> > > > +#define LM90_REG_REMOTE2_OFFSH		0x34
> > > > +#define LM90_REG_REMOTE2_OFFSL		0x35
> > > 
> > > I don't think those are needed.
> > 
> > In lm90_temp_write() (unlike in lm90_update_limits()) the remote channel is *not* set. I find
> 
> ... unless lm90_set_temp() is used to write the values. If I recall correctly
> I didn't do that because selecting the remote channel seemed unnecessary.
> 
> > setting it (the remote channel) in lm90_temp_write() a waste of xfers, if we can address the
> > registers directly. But if you prefer to have just one set of register and setting the remote
> > channel bit, then sure I can do it like that.
> > 
> It isn't as if setting the offset happens all the time, so I'd prefer
> to use lm90_set_temp() if that is possible.

Good point! So I will use just one set of the registers.

-- 
Slawomir Stepien
