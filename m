Return-Path: <SRS0=gDtV=RP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE3C43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Mar 2019 17:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A07712087C
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Mar 2019 17:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEca3PZ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbfCLRhI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Mar 2019 13:37:08 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39285 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbfCLRhH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Mar 2019 13:37:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id h8so2357420pgp.6;
        Tue, 12 Mar 2019 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F0fI/B/LFRa3KDI8sXxWhH9hlmCeh43gATUC1nWXs5E=;
        b=eEca3PZ/IIjzZfYw4ZzaoqwGa9G4hrF3V4VK7ulFjmYT+I7afqsiUDGFnFI6TG/G5A
         7LWcNVZRmVOC6rfir83q70931qlKycAAhlPw6ot/vF+quS/B1pS1pex4qv4Muhv24Bri
         1fZ9Ad/0QXxKthSsvtiBwKJ8JDBHRLj72hM13Olm59fwftntRM+fwxgAz34YX6+8vQJ+
         6tdyT8+dVb6f3nCFLVoXcpL+hUkQvcKFLdsyib3NCJMtcLLBaHDARgKxVjXtTFiefV4W
         yZ02rXTIgNlwl49EfNNePN9KniaOiO2ajl7E+iIWfOcVyQgAq6ChyAQGu18nVnlUuMQf
         4CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=F0fI/B/LFRa3KDI8sXxWhH9hlmCeh43gATUC1nWXs5E=;
        b=kzKl1qIVCpEM7GJeSzW3BsNr8WKSLZM7stnv5t/IJ1oT2LTPckTwatixF/78wSTOeW
         UN9M2DA36zJbaDS5TEur9YP0arkH7t4K1pC9xPNG2DTkXgSppP3rQL6RoB3UknA05pKX
         XZYyVjtOeCva/XANzeKDcRbzpMhyZc5CWOgGZ1WpFOWuPuqDPI/icrWLsEOtFnoOpmt+
         +cJWoMeQCivuQz1754mTJ2RHNW+Im4UjcNMeX+5kJROrphEIWz7M5G0FgYRePFWiSYQK
         wg9xG3T/uYnlSH6ohMXZu0mHzuR6eoCJzanyzAXo/FU04EDDiEu/YfxqeLhR+x+tzvI6
         ZlhA==
X-Gm-Message-State: APjAAAXchKTcVOoZ6tlNuTavKSs/Dwi5qf5LfXpPsSjrUGT8TS4nEp54
        T6EiOS1pg/pw3YRYPRlN7DM=
X-Google-Smtp-Source: APXvYqyK+g8XgMsyrT0+SSehdSQvSOny0N3hZzb4btE2s/yLJADYbhU5STPJQwqNnpmzsLzTGYeYkg==
X-Received: by 2002:a17:902:a24:: with SMTP id 33mr28309964plo.275.1552412226353;
        Tue, 12 Mar 2019 10:37:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a20sm20813523pfj.5.2019.03.12.10.37.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2019 10:37:05 -0700 (PDT)
Date:   Tue, 12 Mar 2019 10:37:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Carlos Menin <carlos.menin@outlook.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] hwmon: adc128d818: Fix value read from Device Tree
Message-ID: <20190312173704.GA18161@roeck-us.net>
References: <FR1P152MB28554B3FC5B4F6303019337993490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
 <20190312152658.GA11644@roeck-us.net>
 <FR1P152MB2855A1DEBC01147732B69EC893490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FR1P152MB2855A1DEBC01147732B69EC893490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 12, 2019 at 05:10:48PM +0000, Carlos Menin wrote:
> On Tue, Mar 12, 2019 at 08:26:58AM -0700, Guenter Roeck wrote:
> > On Tue, Mar 12, 2019 at 01:14:39PM +0000, Carlos Menin wrote:
> > > Cells in DT are 32-bits in size. of_property_read_u8() does not work
> > > properly as it returns incorrect values in little-endian architectures.
> > > Fix it by using of_property_read_u32() instead.
> > > 
> > Are you saying that pretty much all callers of of_property_read_u8()
> > have this problem ? I would not rule that out, but it seems hard to
> > believe.
> > 
> > Guenter
> > 
> 
> Hi Guenter,
> 
> Yes, unless the DT entry specifies the cell size with '/bits/ 8' prefix.
> Not many drivers calls of_property_read_u8() function, almost all of
> them have this prefix in their binding examples, this being one of the
> exceptions. The fix could be a change in the documentation instead, if
> that is preferred.
> 

Yes, I would very much prefer that.

Guenter

> Carlos
> 
> > > Signed-off-by: Carlos Menin <carlos.menin@outlook.com>
> > > ---
> > >  drivers/hwmon/adc128d818.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> > > index ca794bf..b5eb3c0 100644
> > > --- a/drivers/hwmon/adc128d818.c
> > > +++ b/drivers/hwmon/adc128d818.c
> > > @@ -70,7 +70,7 @@ struct adc128_data {
> > >  	struct regulator *regulator;
> > >  	int vref;		/* Reference voltage in mV */
> > >  	struct mutex update_lock;
> > > -	u8 mode;		/* Operation mode */
> > > +	u32 mode;		/* Operation mode */
> > >  	bool valid;		/* true if following fields are valid */
> > >  	unsigned long last_updated;	/* In jiffies */
> > >  
> > > @@ -467,7 +467,7 @@ static int adc128_probe(struct i2c_client *client,
> > >  	}
> > >  
> > >  	/* Operation mode is optional. If unspecified, keep current mode */
> > > -	if (of_property_read_u8(dev->of_node, "ti,mode", &data->mode) == 0) {
> > > +	if (of_property_read_u32(dev->of_node, "ti,mode", &data->mode) == 0) {
> > >  		if (data->mode > 3) {
> > >  			dev_err(dev, "invalid operation mode %d\n",
> > >  				data->mode);
> > > -- 
> > > 2.7.4
> > > 
