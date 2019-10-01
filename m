Return-Path: <SRS0=nYzv=X2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47944C352AA
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 22:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CF002133F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 22:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEKYPsH/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbfJAWfN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Oct 2019 18:35:13 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35842 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbfJAWfN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Oct 2019 18:35:13 -0400
Received: by mail-pl1-f194.google.com with SMTP id j11so2936937plk.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Oct 2019 15:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hf5aalYiw+TyYqk9WAqUfsl7MEjlDsURnbubq38xav8=;
        b=IEKYPsH/g1T1mY2M+1iBxyVJYOBAnHcKQXR3yp8kRcveITU0LzQNS1+Njg0L5BKU+Z
         fIaFLH5XfDLdeSgBAUShFPDdysuLoBKHCFt6aSd6AslJhHxwKZm82Je+Z9VkDiIh9Dfu
         RbKqe2++1DAkZOJATo2uh0G2s/cYJGRLQl4tBMUcy7hk8EXXqMcYccHl9zXVcxFujkkv
         /3GiiuDjLovzrmcn81qMtnP1tgJjQ+shR87isA8TaklwE5CA58nN9eymmmRQuGv+xq4Y
         5Bu6eNOhLeQTXs0niQQGxfHaC2iuuKz+RqMjl6e53+DUCsbAeX3qWN3Salv0IP9eCpyX
         DiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hf5aalYiw+TyYqk9WAqUfsl7MEjlDsURnbubq38xav8=;
        b=FuzWNUNm/3+0aoR/77kWvljs1qZXiRx1YdA2jaomTpLeYtIiwlMBAyIN7xOk14FTtq
         wSSg1JfBdYYK7XaJmk2U45/mkE/lUo4ZuM2v+iIUObmXX+RMacErbMpq7QReUDbDdsLo
         9NGLWyj5Mpp/A62O+3ZfZMGHBXSD8z9Tie+khNNe+ErqUoZZvyN3qwERyp438oTfkahR
         iHXA2LHEQfEsBu4erCzLuJR/RdpNdAtvKmVpR1PfEJv755V9Rx0K06nHjjjSG2ttvUwc
         RbB0KwVuPYcSkFDrXaaWLup6OJNsyM816cZdape3RdOcpRrVcRGZp3ic57xHzjnyMClL
         /aMg==
X-Gm-Message-State: APjAAAV+vcGJZEKbCV7kcIH8rwKGfTnuckyGAJOEJSwODXYoYas8qHhf
        O3AynUTdSHazm4HLgH+rVlM/AV59
X-Google-Smtp-Source: APXvYqyMg7eLGMSzzADyyxknobYFFy387hLfHiDMwEJ+F4ZWIStn6l9nHIwIyurrmQq2UY9XQtEj8A==
X-Received: by 2002:a17:902:322:: with SMTP id 31mr180356pld.150.1569969312687;
        Tue, 01 Oct 2019 15:35:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b5sm19218580pfp.38.2019.10.01.15.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 15:35:11 -0700 (PDT)
Date:   Tue, 1 Oct 2019 15:35:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Tremblay, Eric" <etremblay@distech-controls.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Message-ID: <20191001223510.GA14513@roeck-us.net>
References: <BL0PR01MB48359694ECBFB5D97A508C10959D0@BL0PR01MB4835.prod.exchangelabs.com>
 <20191001183724.GB23564@roeck-us.net>
 <BL0PR01MB483577C3306C3B16A6CB24B4959D0@BL0PR01MB4835.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR01MB483577C3306C3B16A6CB24B4959D0@BL0PR01MB4835.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 01, 2019 at 09:36:30PM +0000, Tremblay, Eric wrote:
> > On Tue, Oct 01, 2019 at 05:50:32PM +0000, Tremblay, Eric wrote:
> > > hwmon: Add DT bindings for TMP513 driver
> > >
> > > Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> > > ---
> > >  .../devicetree/bindings/hwmon/tmp513.txt      | 33 +++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt
> > > b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> > > new file mode 100644
> > > index 000000000000..0f61793cbf2f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> > > @@ -0,0 +1,33 @@
> > > +TMP513 system monitor sensor
> > > +-------------------------
> > > +
> > > +Require node properties:
> > > +- compatible: one of
> > > +		"ti,tmp512"
> > > +		"ti,tmp513"
> > > +- reg : the I2C address of the device. This is 0x5c, 0x5d, 0x5e, or 0x5f.
> > > +- shunt-resistor-uohm : The shunt resistor value in uOhm.
> > > +
> > > +Optional properties:
> > > +- bus-voltage-range: 32V or 16V, default to 32V.
> > > +- max-expected-current-ma: Maximum expected current value. Default to max possible value.
> > > +- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Default to 8.
> > > +- temp_2_nfactor: nFactor for remote channel 1. Value according to Table 11 in datasheet.
> > > +- temp_3_nfactor: nFactor for remote channel 2. Value according to Table 11 in datasheet.
> > > +- temp_4_nfactor: nFactor for remote channel 3. Value according to Table 11 in datasheet,
> > > +				  TMP513 only.
> > > +- temp_hysteresis: Hystereris for temperature limits.
> > 
> > There is a standard sysfs attribute for hysteresis values, and I assume this is one parameter that users might want to change at
> > runtime. Why not use it ?
> 
> In those sensors, the hysteresis setting is global to all channels. Is it still a standard sysfs attribute in that case ? If yes, should I name it
> temp_crit_hyst to show that is a global parameter ?

That is the case for many chips. The most common solution is to support
the attribute for all channels and make only the first channel writeable.
When doing that, add a note to the documentation indicating that writing
one attribute affects all attributes.

temp_crit_hyst doesn't help because it is non-standard and the "sensors"
command won't see it.

Guenter

> > 
> > > +
> > > +Example:
> > > +	tmp513@5c {
> > > +		  compatible = "ti,tmp513";
> > > +		  reg = <0x5C>;
> > > +		  shunt-resistor-uohm = <330>;
> > > +		  bus-voltage-range = <32>;
> > > +		  pga-gain = <8>;
> > > +		  max-expected-current-ma = <100>;
> > > +		  temp_2_nfactor = <0x01>;
> > > +		  temp_3_nfactor = <0x02>;
> > > +		  temp_4_nfactor = <0x03>;
> > > +		  temp_hysteresis = <5>;
> > > +	};
> > > --
> > > 2.17.1
> > >
