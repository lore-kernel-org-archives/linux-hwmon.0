Return-Path: <SRS0=gDtV=RP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602E8C43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Mar 2019 16:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C4612083D
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Mar 2019 16:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n13trBOn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfCLQcx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Mar 2019 12:32:53 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32849 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfCLQcx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Mar 2019 12:32:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id h11so2248546pgl.0;
        Tue, 12 Mar 2019 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XNVh/jy36or2BU+j8ktUjHmrbyBoK53BQeRA0BtwYeY=;
        b=n13trBOnCHMqNWQ4G4dsFsmeNzZy8/gVBi/URX5EyNbyMxIEqwrFavBcKW55a4Medi
         o8zotxQqSFsr1pS6Rm/lK3dMI7AnbhoHY3Vx1TNbZJI/PSvTHMuYmShPWFYk6nV/lsgE
         eMMk2SRrwxRtPLjdJEZH6e6HadVzinAT+/Njzmx1wb59nSWTzZSCoJ+tFzZR7xlZ+R6/
         Rr5ng8m8EY285twZKS/5tK1Ut8kh/6i//lehaSJsCvyUZ6SGYTnFRPbyacgOWDcIXHtS
         cUEh4rvnO04SE8tQEpRYP63k7H+Q3AxI00Kc2l63bxsmyLYjbUpOdLtushhPX/yK01qv
         0lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XNVh/jy36or2BU+j8ktUjHmrbyBoK53BQeRA0BtwYeY=;
        b=NQKUW0rKFIUWK2C2w691/UkDJX/JB0U/rILK2SZR5B93e56oIc9l629XW7W+rtgRmX
         2CLGhGl/PCck29NQN6aeCPTtsNbYPZ1+tshAh5uYdKCIG3SBYa86X6vd05VjUQjyaMuO
         OQGfI9smB2uszE8Bn7LHrd3RkieNjmb/7Z/VA1oQNO0fXPJ+sfrPTxxB8Ke8uhbC4zDW
         hhApXBOAmnvZEHHahlwyiKyHlJNwD8qmbKydoaPUhVgFIu+yyPyuWMH8PvtcnrIw03kX
         N+gAWpau5s2qQ/L6J47GXqsWM4mn3cI7Ro2ycnN3sICQaq5v3oNKac9c3+Koscm06FNL
         x+0Q==
X-Gm-Message-State: APjAAAVdVw4E3r+RFzB8Qf2dxRCpbDamK7ptkXtKqyCt2G0Y6og5V3dQ
        gm6yfX96UgC3LIn6pF2tGIY=
X-Google-Smtp-Source: APXvYqxCCJtrRv1sxHsqSkPQxg75QNZe/oIqap/PBNuz3zLkLDuwquMyxsG1Uziiev34kKxTVcU3cQ==
X-Received: by 2002:a63:ff0f:: with SMTP id k15mr8183591pgi.301.1552408372750;
        Tue, 12 Mar 2019 09:32:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i13sm11032220pgq.17.2019.03.12.09.32.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2019 09:32:50 -0700 (PDT)
Date:   Tue, 12 Mar 2019 09:32:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Carlos Menin <carlos.menin@outlook.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] hwmon: adc128d818: Fix value read from Device Tree
Message-ID: <20190312163248.GA14603@roeck-us.net>
References: <FR1P152MB28554B3FC5B4F6303019337993490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
 <20190312152658.GA11644@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190312152658.GA11644@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Copying DT maintainer and mailing list.

On Tue, Mar 12, 2019 at 08:26:58AM -0700, Guenter Roeck wrote:
> On Tue, Mar 12, 2019 at 01:14:39PM +0000, Carlos Menin wrote:
> > Cells in DT are 32-bits in size. of_property_read_u8() does not work
> > properly as it returns incorrect values in little-endian architectures.
> > Fix it by using of_property_read_u32() instead.
> > 
> Are you saying that pretty much all callers of of_property_read_u8()
> have this problem ? I would not rule that out, but it seems hard to
> believe.
> 
> Guenter
> 
> > Signed-off-by: Carlos Menin <carlos.menin@outlook.com>
> > ---
> >  drivers/hwmon/adc128d818.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> > index ca794bf..b5eb3c0 100644
> > --- a/drivers/hwmon/adc128d818.c
> > +++ b/drivers/hwmon/adc128d818.c
> > @@ -70,7 +70,7 @@ struct adc128_data {
> >  	struct regulator *regulator;
> >  	int vref;		/* Reference voltage in mV */
> >  	struct mutex update_lock;
> > -	u8 mode;		/* Operation mode */
> > +	u32 mode;		/* Operation mode */
> >  	bool valid;		/* true if following fields are valid */
> >  	unsigned long last_updated;	/* In jiffies */
> >  
> > @@ -467,7 +467,7 @@ static int adc128_probe(struct i2c_client *client,
> >  	}
> >  
> >  	/* Operation mode is optional. If unspecified, keep current mode */
> > -	if (of_property_read_u8(dev->of_node, "ti,mode", &data->mode) == 0) {
> > +	if (of_property_read_u32(dev->of_node, "ti,mode", &data->mode) == 0) {
> >  		if (data->mode > 3) {
> >  			dev_err(dev, "invalid operation mode %d\n",
> >  				data->mode);
> > -- 
> > 2.7.4
> > 
