Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570E4C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 12:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236341AbiFFMOp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 08:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236318AbiFFMOj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 08:14:39 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597CB19D62E
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jun 2022 05:14:35 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Mon,  6 Jun 2022 14:14:31 +0200 (CEST)
Date:   Mon, 6 Jun 2022 14:14:30 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 4/7] hwmon: (lm90) Add support for 2nd remote channel's
 offset register
Message-ID: <Yp3vpgR8jbyzWmiq@t480s.localdomain>
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
        s=biztos; t=1654517673;
        bh=mrgbYlk5KS7ieHoSGKHLbA7+5FJ0D1A0yCZ1jF3B6HY=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=ZbwOxX4iON38BNT6oGRXoeSaoRVzEJsph7ooY+r75wJuKS3cCd5Ii1Z0wM9BHtdb3
         s6b7UFPUJs53UTUDE/vGkEzkgXLy9RlwKFlmellRS2u8y08Cg1UiXbFhIgxa+A+R9n
         B8zqthavDyD9aFJrkHaOzXXVr3plyoDkabtCnp4k=
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

I think that modifying lm90_set_temp() to support offsets is a bit messy:

1. The offset on all supported devices is always on two bytes. Unlike the temperature, where
sometimes it is just on one (but if more than one byte, then we set reg_remote_ext). With this also
'regs' in lm90_set_temp() will be back as 2 dimensional array OR additional high and low indexes for
REMOTE_OFFSET and REMOTE2_OFFSET should be added (that will also caused bits glueing on write/read).

2. For offset the calls lm90_temp_from/to_reg should have 0 as flags (1st argument) - that would be
an additional if in lm90_set_temp() OR clear&restore of the flags before&after the call..

Maybe, Guenter you will be happy with something like this (new functions):

static int lm90_get_temp_offset(struct lm90_data *data, int index)
{
	int res = lm90_temp_get_resolution(data, index);

	return lm90_temp_from_reg(0, data->temp[index], res);
}

static int lm90_set_temp_offset(struct lm90_data *data, int index, int channel, long val)
{
	int err;
	static const u8 regs[][2] = {
		[REMOTE_OFFSET] = {LM90_REG_REMOTE_OFFSH, LM90_REG_REMOTE_OFFSL},
		[REMOTE2_OFFSET] = {LM90_REG_REMOTE_OFFSH, LM90_REG_REMOTE_OFFSL},
	};
	u8 regh = regs[index][0];
	u8 regl = regs[index][1];

	val = lm90_temp_to_reg(0, val, lm90_temp_get_resolution(data, index));

	if (channel > 1)
		lm90_select_remote_channel(data, true);

	err = lm90_write16(data->client, regh, regl, val);

	if (channel > 1)
		lm90_select_remote_channel(data, false);

	if (err)
		return err;

	data->temp[index] = val;

	return 0;
}

And new channel->index translator:

static const s8 lm90_temp_offset_index[MAX_CHANNELS] = {
	-1, REMOTE_OFFSET, REMOTE2_OFFSET
};

Having that, we can use that functions in hwmon's read/write attrs but also while paring the
device-tree channel nodes.

Maybe I missed something and using lm90_set_temp() will not be messy?
What do you think?

-- 
Slawomir Stepien
