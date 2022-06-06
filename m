Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA51CCA473
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 06:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiFFGcj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 02:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbiFFGch (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 02:32:37 -0400
Received: from smtpo62.interia.pl (smtpo62.interia.pl [217.74.67.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3F7ABF74
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jun 2022 23:32:35 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Mon,  6 Jun 2022 08:32:32 +0200 (CEST)
Date:   Mon, 6 Jun 2022 08:32:29 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 7/7] hwmon: (lm90) Read the channel's temperature offset
 from device-tree
Message-ID: <Yp2fffZCISn7eRO/@t480s.localdomain>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-8-sst@poczta.fm>
 <20220605181005.GA3151885@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220605181005.GA3151885@roeck-us.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1654497153;
        bh=ENYjvH/sQD8lPef50hQnGTASBZn0wikvW6vpz832ZGk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=DgVwLdnx/NcfRorWglJRx2VdZwsdVpp1X07IY5dIceOw6joXBTRSRr9WHhTGW0dfo
         H0qbJTJydmYf5a52YaRMgKAuXT5o8p4NJ4JB3IVd3iSF93cqmfjMzeXAqsxlmiMnKd
         F1poAAK+kARX7JcmRRcrck3H60jI+REuRQIv9jUY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On cze 05, 2022 11:10, Guenter Roeck wrote:
> On Wed, May 25, 2022 at 09:36:57AM +0200, Slawomir Stepien wrote:
> > From: Slawomir Stepien <slawomir.stepien@nokia.com>
> > 
> > Try to read the channel's temperature offset from device-tree. Having
> > offset in device-tree node is not mandatory. The offset can only be set
> > for remote channels.
> > 
> > Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> > ---
> >  drivers/hwmon/lm90.c | 48 ++++++++++++++++++++++++++++++++------------
> >  1 file changed, 35 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> > index 3837c4ab5833..12e8e874f1b9 100644
> > --- a/drivers/hwmon/lm90.c
> > +++ b/drivers/hwmon/lm90.c
> > @@ -1440,6 +1440,24 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
> >  	return lm90_write_reg(data->client, LM90_REG_TCRIT_HYST, data->temp_hyst);
> >  }
> >  
> > +static int lm90_set_temp_offset(struct lm90_data *data, int channel, long val)
> > +{
> > +	/* Both offset registers have the same resolution */
> > +	int res = lm90_temp_get_resolution(data, REMOTE_OFFSET);
> > +
> > +	val = lm90_temp_to_reg(0, val, res);
> > +
> > +	if (channel == 1) {
> > +		data->temp[REMOTE_OFFSET] = val;
> > +		return lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> > +				    LM90_REG_REMOTE_OFFSL, val);
> > +	}
> > +
> > +	data->temp[REMOTE2_OFFSET] = val;
> > +	return lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
> > +			    LM90_REG_REMOTE2_OFFSL, val);
> > +}
> > +
> >  static const u8 lm90_temp_index[MAX_CHANNELS] = {
> >  	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
> >  };
> > @@ -1577,19 +1595,7 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
> >  				    channel, val);
> >  		break;
> >  	case hwmon_temp_offset:
> > -		/* Both offset registers have the same resolution */
> > -		val = lm90_temp_to_reg(0, val,
> > -				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
> > -
> > -		if (channel == 1) {
> > -			data->temp[REMOTE_OFFSET] = val;
> > -			err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> > -					   LM90_REG_REMOTE_OFFSL, val);
> > -		} else {
> > -			data->temp[REMOTE2_OFFSET] = val;
> > -			err = lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
> > -					   LM90_REG_REMOTE2_OFFSL, val);
> > -		}
> > +		err = lm90_set_temp_offset(data, channel, val);
> 
> Any chance to come up with more unified handling of both channels ?

I will give it a try.

-- 
Slawomir Stepien
