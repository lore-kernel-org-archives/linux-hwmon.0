Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB309C38BFA
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71B9021744
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL8h8lJm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgBXWYS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 17:24:18 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38537 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgBXWYS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 17:24:18 -0500
Received: by mail-pg1-f193.google.com with SMTP id d6so5853256pgn.5
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 14:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pKSMFoRviSnVhGcVQ44LjrSBK1sLK4s39hZORu1KrHQ=;
        b=UL8h8lJm2EkevBDmKCe/+6bGbdG1y74ZEsnCMgeFOtVNB2yyqFLJX95pP27YyWvwed
         ecPoYigwhxIhsgT3bORZ8hn3LyacQugyyWy4LI8cXz+HXRjkO0va9P4swq+rnscjtVmq
         9KlmRczO7uer5tUs1zt5YngxPzg0GEm366j8OzPJT2nASLp9pnu8uOPz6Ef2DKdPoPAy
         +gd2F/guuBXaqkmhn+kPEqXuj5hPaoqbMTZzigB4k1/p2dl76jtVQYp2DIkQvtVILMhx
         DmHUOKcrug9gyWYiAe5m85KUXC1JFtZF3WiPG/Eu1WWPD5y2qhtJ0KiDgwuEL/gNy+QD
         WWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=pKSMFoRviSnVhGcVQ44LjrSBK1sLK4s39hZORu1KrHQ=;
        b=Ab4rR65hxqPld+AiR89l3UgKmGxSze+RX5yV8n8G6psO5OohpvKxjPl4EMIxGHX77D
         3aRjgCOmSzf/xKway/WZlgk71R/KfEzmXILst2RG8EhdByOaqX97vjy3Nn8JTlTECsk1
         UOVaGOk5I2plfRrLmdh2L8PguLSHejXeO0WF4cY/w7qBl1Ia6GN1km052ed4qEq38XOI
         nzWWSSXDHAsPsf3rctd7ZZvuBah5+4J1xoI3//b4D29Cr56ed4xWWXYB09I7WfxUSSLR
         606QuYxoivTZvUMlu3POOdxOD4cdksF7SBh7vDhmng5ddJFu663ZsB31Ur3qWp3qh5B4
         9gzg==
X-Gm-Message-State: APjAAAWHSdHzv2bLmLHiv+15cdS/s7Apx8vvd4egJXdhSf2MFG6MBbvY
        /v/NecwJeaxPOeUg2nwRLPr1l1FJ
X-Google-Smtp-Source: APXvYqxpCS6ofjmLR7M1NybwJ1acS5XAXJDa+DQx28kSGtvwhZtgVGkWcpfuqin1QDuExyUSeB2Mig==
X-Received: by 2002:a62:1a09:: with SMTP id a9mr53738105pfa.64.1582583056889;
        Mon, 24 Feb 2020 14:24:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u13sm460019pjn.29.2020.02.24.14.24.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:24:16 -0800 (PST)
Date:   Mon, 24 Feb 2020 14:24:15 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
Message-ID: <20200224222415.GA7282@roeck-us.net>
References: <20200224131316.28238-1-vadimp@mellanox.com>
 <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
 <DB6PR0501MB23584EB4453A14BC1EE29C13A2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB23584EB4453A14BC1EE29C13A2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Feb 24, 2020 at 10:13:18PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Monday, February 24, 2020 4:51 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: linux-hwmon@vger.kernel.org
> > Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
> > historical registers for TPS53688
> > 
> > On 2/24/20 5:13 AM, Vadim Pasternak wrote:
> > > TPS53688 supports historical registers. Patch allows exposing the next
> > > attributes for the historical registers in 'sysfs':
> > > - curr{x}_reset_history;
> > > - in{x}_reset_history;
> > > - power{x}_reset_history;
> > > - temp{x}_reset_history;
> > > - curr{x}_highest;
> > > - in{x}_highest;
> > > - power{x}_input_highest;
> > > - temp{x}_highest;
> > > - curr{x}_lowest;
> > > - in{x}_lowest;
> > > - power{x}_input_lowest;
> > > - temp{x}_lowest.
> > >
> > > This patch is required patch:
> > > "hwmon: (pmbus/core) Add callback for register to data conversion".
> > >
> > > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > > ---
> > >   drivers/hwmon/pmbus/tps53679.c | 244
> > ++++++++++++++++++++++++++++++++++++++++-
> > >   1 file changed, 243 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwmon/pmbus/tps53679.c
> > > b/drivers/hwmon/pmbus/tps53679.c index 157c99ffb52b..ae5ce144e5fe
> > > 100644
> > > --- a/drivers/hwmon/pmbus/tps53679.c
> > > +++ b/drivers/hwmon/pmbus/tps53679.c
> > > @@ -34,6 +34,227 @@ enum chips {
> > >
> > >   #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases, per page
> > */
> > >
> > > +/* Registers for highest and lowest historical values records */
> > > +#define TPS53688_VOUT_PEAK		0xd1
> > > +#define TPS53688_IOUT_PEAK		0xd2
> > > +#define TPS53688_TEMP_PEAK		0xd3
> > > +#define TPS53688_VIN_PEAK		0xd5
> > > +#define TPS53688_IIN_PEAK		0xd6
> > > +#define TPS53688_PIN_PEAK		0xd7
> > > +#define TPS53688_POUT_PEAK		0xd8
> > > +#define TPS53688_HISTORY_REG_BUF_LEN	5
> > > +#define TPS53688_HISTORY_REG_MIN_OFFSET	3
> > > +#define TPS53688_HISTORY_REG_MAX_OFFSET	1
> > > +
> > > +const static u8 tps53688_reset_logging[] = { 0x04, 0x00, 0x01, 0x00,
> > > +0x00 }; const static u8 tps53688_resume_logging[] = { 0x04, 0x20,
> > > +0x00, 0x00, 0x00 };
> > > +
> > Passing the length as 1st field seems wrong.
> > 
> > > +static int tps53688_reg2data(u16 reg, int data, long *val) {
> > > +	s16 exponent;
> > > +	s32 mantissa;
> > > +
> > > +	if (data == 0)
> > > +		return data;
> > > +
> > > +	switch (reg) {
> > > +	case PMBUS_VIRT_READ_VOUT_MIN:
> > > +	case PMBUS_VIRT_READ_VOUT_MAX:
> > > +		/* Convert to LINEAR11. */
> > > +		exponent = ((s16)data) >> 11;
> > > +		mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
> > > +		*val = mantissa * 1000L;
> > > +		if (exponent >= 0)
> > > +			*val <<= exponent;
> > > +		else
> > > +			*val >>= -exponent;
> > > +		return 0;
> > > +	default:
> > > +		return -ENODATA;
> > > +	}
> > > +}
> > > +
> > As with the xpde driver, I would suggest to implement the conversion in the
> > read_word_data function.
> > 
> > > +static int
> > > +tps53688_get_history(struct i2c_client *client, int reg, int page, int unused,
> > > +		     int offset)
> > 
> > What is the point of passing "unused" to this function ?
> > 
> > > +{
> > > +	u8 buf[TPS53688_HISTORY_REG_BUF_LEN];
> > > +	int ret;
> > > +
> > > +	ret = pmbus_set_page(client, page, 0);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_read_i2c_block_data(client, reg,
> > > +					    TPS53688_HISTORY_REG_BUF_LEN,
> > > +					    buf);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +	else if (ret != TPS53688_HISTORY_REG_BUF_LEN)
> > > +		return -EIO;
> > 
> > I am a bit confused here. Are you sure this returns (and is supposed to return)
> > 5 bytes of data, not 4, and that the data offsets are 1 and 3, not 0 and 2 ?
> > i2c_smbus_read_i2c_block_data() returns the length, and only copies the data
> > into the buffer, not the length field.
> > 
> > > +
> > > +	return *(u16 *)(buf + offset);
> > 
> > This implies host byte order. I don't think it will work on big endian systems.
> > Besides, it won't work on systems which can not directly read from odd
> > addresses (if the odd offsets are indeed correct).
> > 
> > > +}
> > > +
> > > +static int
> > > +tps53688_reset_history(struct i2c_client *client, int reg) {
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_write_i2c_block_data(client, reg,
> > > +					     TPS53688_HISTORY_REG_BUF_LEN,
> > > +					     tps53688_reset_logging);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_i2c_block_data(client, reg,
> > > +					     TPS53688_HISTORY_REG_BUF_LEN,
> > > +					     tps53688_resume_logging);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > Are you sure that a single write of 00 00 01 00 wouldn't do it ?
> > Is it indeed necessary to resume logging after resetting it ?
> > 
> 
> Yes.
> I used initially '0x00, 0x01, 0x00' and it didn't work for me.
> Then I managed to have a call with TI and after some debug they said
> I should resume after reset, so I added '0x02 0x00, 0x00, 0x00'.
> 
> Datasheet says:
> Issue a write transaction with the following values to control peak logging functions.
> Logging is not automatically started or stopped by TPS536xx.
> 0000 0001h Pause minimum value logging
> 0000 0002h Pause maximum value logging
> 0000 0004h Pause minimum and maximum value logging
> 0000 0008h Resume minimum value logging (if paused)
> 0000 0010h Resume maximum value logging (if paused)
> 0000 0020h Resume minimum and maximum value logging (if paused)
> 0000 0040h Reset the minimum value logging
> 0000 0080h Reset the maximum value logging
> 0000 0100h Reset both minimum and maximum value logging
> Other Invalid/Unsupported data.
> 
> So it's not active by default and should be resumed for starting logging.
> 
> Because of that I also added tps53688_reset_history_all() in probe, because
> otherwise after boot these registers have some abnormal values.
> But anyway I'll drop this routine following your comment below.
> Also considering that driver can be re-probed and in this case history after
> the first reset/resume could be important.
> 
Thanks for the explanation.

That means though that you'll need to call something like
tps53688_start_logging_all() in the probe function, or am I missing
something ? Otherwise the user would have to explicitly reset the
history to start logging it, which would not be desirable either.

Thanks,
Guenter
