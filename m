Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF811C43334
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 06:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiFFGao (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 02:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiFFGam (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 02:30:42 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E175F8E7
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jun 2022 23:30:39 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Mon,  6 Jun 2022 08:30:35 +0200 (CEST)
Date:   Mon, 6 Jun 2022 08:30:32 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 4/7] hwmon: (lm90) Add support for 2nd remote channel's
 offset register
Message-ID: <Yp2fCO84VrrSQHbL@t480s.localdomain>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-5-sst@poczta.fm>
 <20220605180310.GA3151289@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220605180310.GA3151289@roeck-us.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1654497037;
        bh=toD2b2Tg74PEJJgHkBqWJoLIJLPhELHi9E/qU6o4MqY=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=SWlUdDJFr3LJtFF0Z8zyQPYYNRMb63ZxcxOPI4/frthv86bGTaarhqdd777uoE624
         o0eOeVOGJymmaDVAwF+7sQOCyHIZFLorOrJ/tQ75SqHypkArsNdoflxC71aMOzzbSa
         0m4OBgowHztVNOQmdIesEz8+cPmbBIOUe+oa/9H0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On cze 05, 2022 11:03, Guenter Roeck wrote:
> On Wed, May 25, 2022 at 09:36:54AM +0200, Slawomir Stepien wrote:
> > From: Slawomir Stepien <slawomir.stepien@nokia.com>
> > 
> > The ADT7461 supports offset register for both remote channels it has.
> 
> ADT7481

Oops. I will fix that in new version.

> > Both registers have the same bit width (resolution).
> > 
> > In the code, this device has LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags,
> > but the support of second remote channel's offset is missing. Add that
> > implementation.
> > 
> > Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> > ---
> >  drivers/hwmon/lm90.c | 37 ++++++++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> > index 02b211a4e571..d226f1dea2ba 100644
> > --- a/drivers/hwmon/lm90.c
> > +++ b/drivers/hwmon/lm90.c
> > @@ -153,6 +153,8 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
> >  #define LM90_REG_REMOTE_TEMPL		0x10
> >  #define LM90_REG_REMOTE_OFFSH		0x11
> >  #define LM90_REG_REMOTE_OFFSL		0x12
> > +#define LM90_REG_REMOTE2_OFFSH		0x34
> > +#define LM90_REG_REMOTE2_OFFSL		0x35
> 
> I don't think those are needed.

In lm90_temp_write() (unlike in lm90_update_limits()) the remote channel is *not* set. I find
setting it (the remote channel) in lm90_temp_write() a waste of xfers, if we can address the
registers directly. But if you prefer to have just one set of register and setting the remote
channel bit, then sure I can do it like that.

> >  #define LM90_REG_REMOTE_HIGHH		0x07
> >  #define LM90_REG_REMOTE_HIGHL		0x13
> >  #define LM90_REG_REMOTE_LOWH		0x08
> > @@ -669,6 +671,7 @@ enum lm90_temp_reg_index {
> >  	REMOTE2_TEMP,	/* max6695/96 only */
> >  	REMOTE2_LOW,	/* max6695/96 only */
> >  	REMOTE2_HIGH,	/* max6695/96 only */
> > +	REMOTE2_OFFSET,
> >  
> >  	TEMP_REG_NUM
> >  };
> > @@ -1024,6 +1027,14 @@ static int lm90_update_limits(struct device *dev)
> >  			return val;
> >  		data->temp[REMOTE2_HIGH] = val << 8;
> >  
> > +		if (data->flags & LM90_HAVE_OFFSET) {
> > +			val = lm90_read16(client, LM90_REG_REMOTE2_OFFSH,
> > +					  LM90_REG_REMOTE2_OFFSL, false);
> 
> Why not use LM90_REG_REMOTE_OFFSH and LM90_REG_REMOTE_OFFSL ?
> The remove channel is selected here, after all.

Yes, in this case I can use the regs for remote channel 1. I will fix that in new version.

> > +			if (val < 0)
> > +				return val;
> > +			data->temp[REMOTE2_OFFSET] = val;
> > +		}
> > +
> >  		lm90_select_remote_channel(data, false);
> >  	}
> >  
> > @@ -1294,6 +1305,7 @@ static int lm90_temp_get_resolution(struct lm90_data *data, int index)
> >  			return data->resolution;
> >  		return 8;
> >  	case REMOTE_OFFSET:
> > +	case REMOTE2_OFFSET:
> >  	case REMOTE2_TEMP:
> >  		return data->resolution;
> >  	case LOCAL_TEMP:
> > @@ -1515,8 +1527,13 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
> >  		*val = lm90_get_temphyst(data, lm90_temp_emerg_index[channel], channel);
> >  		break;
> >  	case hwmon_temp_offset:
> > -		*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET],
> > -					  lm90_temp_get_resolution(data, REMOTE_OFFSET));
> > +		/* Both offset registers have the same resolution */
> > +		int res = lm90_temp_get_resolution(data, REMOTE_OFFSET);
> > +
> > +		if (channel == 1)
> > +			*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET], res);
> > +		else
> > +			*val = lm90_temp_from_reg(0, data->temp[REMOTE2_OFFSET], res);
> 
> I would prefer the use of lm90_temp_offset_index[] as implemented for the
> other attributes.

OK, I will try to do it like that in new version.

> >  		break;
> >  	default:
> >  		return -EOPNOTSUPP;
> > @@ -1556,11 +1573,19 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
> >  				    channel, val);
> >  		break;
> >  	case hwmon_temp_offset:
> > +		/* Both offset registers have the same resolution */
> >  		val = lm90_temp_to_reg(0, val,
> >  				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
> > -		data->temp[REMOTE_OFFSET] = val;
> > -		err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> > -				   LM90_REG_REMOTE_OFFSL, val);
> > +
> > +		if (channel == 1) {
> > +			data->temp[REMOTE_OFFSET] = val;
> > +			err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> > +					   LM90_REG_REMOTE_OFFSL, val);
> > +		} else {
> > +			data->temp[REMOTE2_OFFSET] = val;
> > +			err = lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
> > +					   LM90_REG_REMOTE2_OFFSL, val);
> > +		}
> 
> Same as above.

OK!

-- 
Slawomir Stepien
