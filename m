Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F67C636CA
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 20:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F0AB613DA
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 20:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237986AbhGOUmg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Jul 2021 16:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237791AbhGOUmf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Jul 2021 16:42:35 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEB0C06175F;
        Thu, 15 Jul 2021 13:39:40 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w127so8185367oig.12;
        Thu, 15 Jul 2021 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6GrzBOhEP/rKQsfiKe/lYqagaaJewUMHIHq98v+iXOE=;
        b=PiEIvel9NDa4E+z3Eq9OqHnpM1XR1c0d/Ok3/7JZbxo5cwk5CWwETi5i/q3dz5XYNu
         ezQI0IQK+ZOLhuFNB8WEzogx+Vv4rcg0f1v95+sYz5eCbQ6GCHyW9E3mtbgSvDmvfJkB
         RyZWxD2PDYvjPpWjHxXwMl4HUYGZOwPGsh9El1EC/5fF3kPA4zw4NaUKgDEGqjYPvdOg
         CY60ORsj9HJ1mDnGmSmnwXSPwMzjh8XKDYL9MasFt3fy4RBtVJZqseoWZC4aD4H+GXIy
         gErg2qLN2a+sRz39bQfHbpo9KYkMeQwDHrNE4+zjrfdKkzd6FGatlQizwgw5BVyvimKy
         /9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=6GrzBOhEP/rKQsfiKe/lYqagaaJewUMHIHq98v+iXOE=;
        b=EGJV+TejFwmEegFpABN3qLOXiuIf/ILPKvuC00YTl+1kGxd+3jPyEKkxhYjCXQgJS+
         oEQjjdaR4aiym9Y3/z51zZeqCA6sJzKPiu55T8f7DhkB+20ioO57vd96KlyiVpSSwJjf
         jUkLnE4rh81aI7agjzb/DnCWeFLK4udVL7D4BSRFmW20Sg3bJiGy0MPYjlM4K/cVQE3c
         GDcuI0urPJDcWuCvjKHu76PRJp9QRfNIzN9ccSESvdF6voOO1WILM8RXn5Z/IKB9LMsB
         DS7gzDaXpFz4ry5lpvhuCNhTqc9sBFX+/82UWVVYSFlAgy3L3wCTxyfhEH4bp9y7UIlJ
         davQ==
X-Gm-Message-State: AOAM532uzjSn5heUARgM9dGVPXAxh3PcI84q8cdg3VjHbTcLO6opzddE
        OxyDdtLebUXJyeVrQhFUWdQ=
X-Google-Smtp-Source: ABdhPJwrtD+RNgHELbFwtsgdIGXxVqASFNruF3W2lCmWjY0yk18KBkzQL4Xqa+fQQRoUbVG958sQaw==
X-Received: by 2002:aca:1101:: with SMTP id 1mr5070311oir.53.1626381579766;
        Thu, 15 Jul 2021 13:39:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m1sm1332322otl.0.2021.07.15.13.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 13:39:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 15 Jul 2021 13:39:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Message-ID: <20210715203937.GA3182741@roeck-us.net>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
 <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 15, 2021 at 10:26:05AM +0000, Sa, Nuno wrote:
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, July 12, 2021 7:27 PM
> > To: Sa, Nuno <Nuno.Sa@analog.com>
> > Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> > Guenter Roeck <linux@roeck-us.net>; Jean Delvare
> > <jdelvare@suse.com>
> > Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
> > properties
> > 
> > [External]
> > 
> > On Thu, Jul 08, 2021 at 02:01:08PM +0200, Nuno Sá wrote:
> > > Add the bindings for the tacho signal evaluation parameters which
> > depend
> > > on the FAN being used.
> > >
> > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > > ---
> > >  .../bindings/hwmon/adi,axi-fan-control.yaml          | 12
> > ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> > control.yaml b/Documentation/devicetree/bindings/hwmon/adi,axi-
> > fan-control.yaml
> > > index 6747b870f297..0481eb34d9f1 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> > control.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-
> > control.yaml
> > > @@ -37,6 +37,18 @@ properties:
> > >      $ref: /schemas/types.yaml#/definitions/uint32
> > >      enum: [1, 2, 4]
> > >
> > > +  adi,tacho-25-us:
> > > +    description: Expected tacho signal when the PWM is at 25%.
> > > +
> > > +  adi,tacho-50-us:
> > > +    description: Expected tacho signal when the PWM is at 50%.
> > > +
> > > +  adi,tacho-75-us:
> > > +    description: Expected tacho signal when the PWM is at 75%.
> > > +
> > > +  adi,tacho-100-us:
> > > +    description: Expected tacho signal when the PWM is at 100%.
> > 
> > This looks like it should be common. But having PWM percents in the
> > property names doesn't scale. This is also a property of the fan, not
> > the fan controller.
> 
> Yes, I see that these parameters are definitely a property of the attached
> fan but the evaluation of these timings are very specific to this controller
> (I think). The way it works is that the HW can fully operate without any
> runtime SW configuration. In this case, it will use the values in these
> registers to evaluate the tacho signal coming from the FAN. And the HW
> really uses the evaluation points like this (0, 25%, 50% and 100%). It has
> some predefined values that work for the FAN that was used to develop
> the IP but naturally the evaluation will fail as soon as other FAN is attached
> (resulting in fan fault interrupts). And yes, writing these parameters is 
> already SW configuration but what I mean with "runtime" is after probe :). 
> 

Are you sure you can ever get this stable ? Each fan has its own properties
and tolerances. If you replace a fan in a given system, you might get
different RPM numbers. The RPM will differ widely from system to system
and from fan to fan. Anything that assumes a specific RPM in devicetree
data seems to be quite vulnerable to failures. I have experienced that
recently with a different chip which also tries to correlate RPM and PWM
and fails quite miserably.

In my experience, anything other than minimum fan speed is really a recipe
for instability and sporadic false failures. Even setting a minimum fan speed
is tricky because it depends a lot on the fan.

> So, I honestly do not know how we could name this better... Maybe a
> 'tacho-eval-points-us' array? The question would be the min/max
> elements? Do you have any suggestion for a more generic property?
> 
I am guessing that the "us" refers to the time between pulses from the
fan. I think this is a bad value to start with - anything fan speed
related should really be expressed in RPM, not in time between pulses.

Overall I don't think this should be handled as generic set of properties.
Whatever we come up with as standard set of pwm or fan related properties
should not be an expected correlation between pwm and rpm. Assuming such
a property is needed here (after all, the controller is what it is),
maybe a set of tuples makes sense, such as

	adi,pwm-rpm-map = <
		25, 250,
		50, 500,
		75, 750,
		100, 1000
	>;

though I think that each of those should also include the tolerance
instead of just assuming that a 25% tolerance (as implemented in patch
2/6) would work for all fans.

Guenter

> > There's only so many ways a fan can be controlled and I'm going to
> > keep
> > telling folks to make a common fan binding. There's some start to it,
> > but it needs some work.
> 
> You mean the pwm-fan.txt? I gave a look to the driver and I don't think
> it fully fits this controller. I'm ok in sending an fan.yaml binding if you
> prefer it but I'm just not sure what we would need there... Maybe
> pulses-per-revolution and the above property
> (whatever the decided name) would be a starting point? 
> 
> - Nuno Sá
