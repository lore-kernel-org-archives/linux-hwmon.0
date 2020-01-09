Return-Path: <SRS0=kMjT=26=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7249C282DD
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jan 2020 23:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ECC62072E
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jan 2020 23:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLY10NKl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgAIXDo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Jan 2020 18:03:44 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42334 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgAIXDo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Jan 2020 18:03:44 -0500
Received: by mail-pf1-f196.google.com with SMTP id 4so127210pfz.9
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2020 15:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X8NtymAaM0nAiy0iEroF/GouieGfpOYQ7QeDHUhCN6Q=;
        b=tLY10NKlfQ4DOJpVizFCwKoM3k2rsCaaKHIV1B31vj0WQXiNeYcVsFLFIr+nuCzhSu
         71AG0bY03D52YaWH0ecRFDa5MiXkJNrYUc+aKleD6P+wMsG1RiwCS9UbjLbl8iWtKdgN
         AkefsahibSti6YkLfsLVVJR/br7R5s/uBINn3xVNKl68UUSyC3pKB7lvMK7ZAWyL8SMR
         hvcHIcQ60hwerOtoEQ+GuUczhTwJvJ0+yBOKy03WQkWFCR3478EzJnC2j4eYlsrfGxvD
         GNLwUZgsC4ZiiPC5iyTWn4S1pbaFsC7ruc5UoohlAZqU/FkX8muOq8rUMLjbaHTxtdXr
         Rp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=X8NtymAaM0nAiy0iEroF/GouieGfpOYQ7QeDHUhCN6Q=;
        b=MtfbjSWDdYI84vKAjqnJg7dkISYMCyriEel83DlwrAUoR/0fmhsAtXN9jHpfjlO7vd
         +iQoYYvvA7hR4uTLPdeInRcrUthbEqAnpw6o9FQ8fYQznm8uvnlbdJo9ormBkGHWuhZ0
         +/QOplFfMqFjWxZpNsJ/78Ye4ln40W6fODjAbxcKt0Ztwh2U9L+XVKJOsR7aTmyGfln+
         CQOSqIOl5Znnk4XdIM2NTIK0mTHmApB3h0+b932uVuthARy9JJ/TjqH8YRM2xqIHDMdn
         byOjEWEfPdKDOV7VRQArkpe2HgUwnoRstnZfS0PQ2YYTYNiJMtxMrhDENxx7Eqvhqhvs
         EiQg==
X-Gm-Message-State: APjAAAVCNapHDDFbMsdw3IyZJbDCQMpGrNeVLPwyI84FXvQoavj1GLBR
        GaADlsNl5J3YJYFu1crcbT4=
X-Google-Smtp-Source: APXvYqxySI46aG3JiLjRcusgYIb4bY+lMhzjLDmgP9NxzZHc4LKCJvaIJsXjU/V2w1uIRmaFMiylcg==
X-Received: by 2002:a63:3750:: with SMTP id g16mr400775pgn.413.1578611022987;
        Thu, 09 Jan 2020 15:03:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 207sm91047pfu.88.2020.01.09.15.03.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 15:03:42 -0800 (PST)
Date:   Thu, 9 Jan 2020 15:03:41 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Logan Shaw <Logan.Shaw@alliedtelesis.co.nz>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: (adt7475) Added attenuator bypass support
Message-ID: <20200109230341.GB5938@roeck-us.net>
References: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
 <20191219033213.30364-3-logan.shaw@alliedtelesis.co.nz>
 <e88b029b-dbb3-e423-5c37-0917d7716b66@roeck-us.net>
 <804d10c6a459b9d7fa02d1e7ba08369c1c95ec87.camel@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <804d10c6a459b9d7fa02d1e7ba08369c1c95ec87.camel@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 27, 2019 at 02:53:16AM +0000, Logan Shaw wrote:
> On Wed, 2019-12-18 at 19:53 -0800, Guenter Roeck wrote:
> > On 12/18/19 7:32 PM, Logan Shaw wrote:
> > > Added a new file documenting the adt7475 devicetree and added the
> > > five
> > > new properties to it.
> > > 
> > > Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>
> > > ---
> > > ---
> > >   .../devicetree/bindings/hwmon/adt7475.txt     | 35
> > > +++++++++++++++++++
> > >   1 file changed, 35 insertions(+)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/hwmon/adt7475.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt
> > > b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> > > new file mode 100644
> > > index 000000000000..388dd718a246
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> > > @@ -0,0 +1,35 @@
> > > +*ADT7475 hwmon sensor.
> > > +
> > > +Required properties:
> > > +- compatible: One of
> > > +	"adi,adt7473"
> > > +	"adi,adt7475"
> > > +	"adi,adt7476"
> > > +	"adi,adt7490"
> > > +
> > > +- reg: I2C address
> > > +
> > > +optional properties:
> > > +
> > > +- bypass-attenuator-all: Configures bypassing all voltage input
> > > attenuators.
> > > +	This is only supported on the ADT7476 and ADT7490, this
> > > property does
> > > +	nothing on other chips.
> > 
> > Both adt7473 and adt7475 do support configuring an attenuator on VCCP
> > 
> 
> That is true, but as the function of register 0x73 bit 5 differs
> between the two set of hardware ({adt7473, adt7475} and {adt7476,
> adt7490}) a solution which allows bypassing VCCP on both gets more
> complicated which I was trying to avoid.
> 
> Is it acceptable to split the function
> load_individual_bypass_attenuators into two, one for each set of
> chips, and call the appropriate function for the chip? That way adding
> "bypass-attenuator-in1" to any of the four adt chips DTS will result in
> the attenuator for VCCP being bypassed (albeit by setting different
> bits depending on the specific bit).
> 
You could have per-chip functions, or per-chip mask data in the local data
structure.

> > > +		property present: Bit set to bypass all voltage input
> > > attenuators.
> > > +		property absent: Registers left unchanged.
> > > +
> > > +- bypass-attenuator-inx: Configures bypassing individual voltage
> > > input
> > > +	attenuators, where x is an integer from the set {0, 1, 3, 4}.
> > > This
> > > +	is only supported on the ADT7476 and ADT7490, this property
> > > does nothing
> > > +	on other chips.
> > > +		property present: Bit set to bypass specific voltage
> > > input attenuator
> > > +			for voltage input x.
> > > +		property absent: Registers left unchanged.
> > > +
> > 
> > This is interesting. It essentially means "retain configuration from
> > ROM
> > Monitor", but leaves no means to _disable_ the bypass.
> > 
> 
> Only a power cycle (after removing the properties from the DTS) will
> set the affected bits back to 0. Removing the properties, but only
> softly restarting the system (no interrupted power supply to the adt
> chip), will not set the bits back to 0.
> 
> I decided against setting the bits to 0 by default (if no property was
> present) as doing so might break compatibility with systems that expect
> the bits to remain unchanged. 
> 
> A compromise would be to change the "bypass-attenuator-inx" property to
> "bypass-attenuator-inx = <y>", where y = 1 bypasses the attenuator and
> y = 0 does not. If the property is not present then the register is
> left unchanged. It would make sense to do the same to the "bypass-
> attenuator-all" property. Would these changes be acceptable?
> 
That goes into devicetree object details. Rob might have an opinion
on that.

> > > +Example:
> > > +
> > > +hwmon@2e {
> > > +	compatible = "adi,adt7475";
> > > +	reg = <0x2e>;
> > > +	bypass-attenuator-all;
> > > +	bypass-attenuator-in1;
> > 
> > What would be the purpose of specifying both all and in1 ?
> 
> There would be no practical purpose, it was to keep the example
> compact. Instead "bypass-attenuator-in1" could be removed and added to 
> second device hwmon@2d. This would show off the syntax for each set of
> properties in a more practical way.
> 
That would make more sense.

> > 
> > > +};
> > > \ No newline at end of file

Note that you might want to fix that.

Guenter
