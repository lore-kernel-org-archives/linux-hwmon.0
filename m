Return-Path: <SRS0=FSWF=R5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23217C43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Mar 2019 18:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAAF12082F
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Mar 2019 18:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvRcPmfp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732157AbfCZSDV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Mar 2019 14:03:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43799 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732066AbfCZSDV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Mar 2019 14:03:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id c8so8416602pfd.10;
        Tue, 26 Mar 2019 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ju1j8U+qrKBjDEWmSDzbh9u22OykSUCloXvaBvGHdOg=;
        b=RvRcPmfp5vpRrP1JrBi4tuTPQ4noYGZVigtD9xDM9Uf30yxgNT/0JQKV/+bfBsQiW4
         PoHwZZgQN01L18JYvBHNFOQqD63RNUUos97y3J8yJzxKJ8zPazPZkixfToY0/P44PhSU
         NjX6WaNeWkaD/V8YV5fqsPuwDWnF7528Fq1yh3Q2vlb9SAeYa3W+aPC3P9TrnZFEGy2n
         StGT2gCvD88CqwGy1110om4Keb87ZZ/CcnshOe333vtmIUbjhvBq7TzenQVGr7d6v4sU
         Qd9F1rZl+uHFSn+I5JmBi8Y+mj8URFw9ZFutZvv1BFpfQeH05ffK98SaVHMtPnVhzf8d
         D+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ju1j8U+qrKBjDEWmSDzbh9u22OykSUCloXvaBvGHdOg=;
        b=MgdsRgYiS5yFzVsaFfpApaWeI6kG++G2DZ9MOQ6k+z5lfo/79euMWOZN2275hjZYd1
         +qGqFyaR/0k4mca+iHMY/Siq5FddUjmOSlXB82Pe4gFpQhZ+ltmNaIRxVZbiP/8sz8Qq
         bOOTAfEM7WIOZrcJMzr2gu6LG/lfeB6QDh50VA60NeeGjV+ha7LuS5bH7FFlfjUTpshQ
         2nFJvyRFZNOQmMZRG2Cosb87nt5Ld8n+rUdbCrKevHg8TJapQm2MCd/uQG6z8xBAZtsd
         upW4KCbDDbRSW5cuWPVlWQoxfjTBFG0CZwPRHJ/dIUUekNjJmCXNArQw032duAOunK9F
         hOCg==
X-Gm-Message-State: APjAAAXJiTISamlaziW8LMg7b380HHW2mWkmhbG2FdeIiRFT1qrnsoD4
        DI5cG9nBGv1qlHpUhNKeV3E=
X-Google-Smtp-Source: APXvYqy7W3QMxCoxkUnhUPIuTKY0O/ESpSqBwAfOrl8h74Kk++DGxk4nH2W2jPZrLq7H7Iw9P141KQ==
X-Received: by 2002:a63:5a4b:: with SMTP id k11mr29759250pgm.119.1553623400843;
        Tue, 26 Mar 2019 11:03:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s16sm17765029pgo.69.2019.03.26.11.03.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Mar 2019 11:03:19 -0700 (PDT)
Date:   Tue, 26 Mar 2019 11:03:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Carlos Menin <carlos.menin@outlook.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] hwmon: adc128d818: Fix value read from Device Tree
Message-ID: <20190326180318.GF9916@roeck-us.net>
References: <FR1P152MB28554B3FC5B4F6303019337993490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
 <20190312152658.GA11644@roeck-us.net>
 <FR1P152MB2855A1DEBC01147732B69EC893490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
 <20190312173704.GA18161@roeck-us.net>
 <RO1P152MB18680981A9B2DF488642C825935F0@RO1P152MB1868.LAMP152.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <RO1P152MB18680981A9B2DF488642C825935F0@RO1P152MB1868.LAMP152.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 26, 2019 at 12:01:57PM +0000, Carlos Menin wrote:
> On Tue, Mar 12, 2019 at 10:37:04AM -0700, Guenter Roeck wrote:
> > On Tue, Mar 12, 2019 at 05:10:48PM +0000, Carlos Menin wrote:
> > > On Tue, Mar 12, 2019 at 08:26:58AM -0700, Guenter Roeck wrote:
> > > > On Tue, Mar 12, 2019 at 01:14:39PM +0000, Carlos Menin wrote:
> > > > > Cells in DT are 32-bits in size. of_property_read_u8() does not work
> > > > > properly as it returns incorrect values in little-endian architectures.
> > > > > Fix it by using of_property_read_u32() instead.
> > > > > 
> > > > Are you saying that pretty much all callers of of_property_read_u8()
> > > > have this problem ? I would not rule that out, but it seems hard to
> > > > believe.
> > > > 
> > > > Guenter
> > > > 
> > > 
> > > Hi Guenter,
> > > 
> > > Yes, unless the DT entry specifies the cell size with '/bits/ 8' prefix.
> > > Not many drivers calls of_property_read_u8() function, almost all of
> > > them have this prefix in their binding examples, this being one of the
> > > exceptions. The fix could be a change in the documentation instead, if
> > > that is preferred.
> > > 
> > 
> > Yes, I would very much prefer that.
> > 
> > Guenter
> > 
> 
> Hi,
> 
> I sent a patch with the modification in the dt binding for this device,
> a couple weeks ago, but since e-mails from this address are rejected by
> vger.kernel.org, I used a differente e-mail address (one that I made
> sure that is accepted), if that is ok.
> 
Yes, it is available at https://patchwork.kernel.org/patch/10851189/

It is waiting for DT maintainer approval.

Guenter

> Best regards,
> Carlos.
> 
> 
> > > Carlos
> > > 
> > > > > Signed-off-by: Carlos Menin <carlos.menin@outlook.com>
> > > > > ---
> > > > >  drivers/hwmon/adc128d818.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> > > > > index ca794bf..b5eb3c0 100644
> > > > > --- a/drivers/hwmon/adc128d818.c
> > > > > +++ b/drivers/hwmon/adc128d818.c
> > > > > @@ -70,7 +70,7 @@ struct adc128_data {
> > > > >  	struct regulator *regulator;
> > > > >  	int vref;		/* Reference voltage in mV */
> > > > >  	struct mutex update_lock;
> > > > > -	u8 mode;		/* Operation mode */
> > > > > +	u32 mode;		/* Operation mode */
> > > > >  	bool valid;		/* true if following fields are valid */
> > > > >  	unsigned long last_updated;	/* In jiffies */
> > > > >  
> > > > > @@ -467,7 +467,7 @@ static int adc128_probe(struct i2c_client *client,
> > > > >  	}
> > > > >  
> > > > >  	/* Operation mode is optional. If unspecified, keep current mode */
> > > > > -	if (of_property_read_u8(dev->of_node, "ti,mode", &data->mode) == 0) {
> > > > > +	if (of_property_read_u32(dev->of_node, "ti,mode", &data->mode) == 0) {
> > > > >  		if (data->mode > 3) {
> > > > >  			dev_err(dev, "invalid operation mode %d\n",
> > > > >  				data->mode);
> > > > > -- 
> > > > > 2.7.4
> > > > > 
