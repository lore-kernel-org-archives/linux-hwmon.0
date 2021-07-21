Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1B4C636C9
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 15:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E44576120E
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 15:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238276AbhGUOW1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Jul 2021 10:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239449AbhGUOTt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Jul 2021 10:19:49 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7338C061575;
        Wed, 21 Jul 2021 08:00:21 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id p67so3163102oig.2;
        Wed, 21 Jul 2021 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yTeMlK56on+N1AKCtW09hkY78OxnEuhc6VvA4N3SswE=;
        b=NuV5UESBaVxYqNvnAzivNi70I2pwZDfecm4WU9iBjiJaXkPGFThXEVSmru6jQS/p7g
         UdXrAZm4v6zkc9rM0PgXJ52cCa4VGNXMSArWQDiRVvL4KaxCAhWMwIQmWoN7b9xt6i1V
         z7ZKb4qyTJt/rCTq4jAllzl988yprwTea6YbiWKHCjLuc0ISMuJuZT8SjB7y9BTCPsDl
         d8AbrbfVljuodt/w18WjNaNQWF3wC94cdDcIT/2yhhYcBFatytRPBebbPWrs8V7K9yIy
         pOeGC4p38OXD6k9WubkuVS0VdIOeLVg2XpjeUibiFtbuVn3NcZ2rMJ6n/ak/fM4lHL2z
         TvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=yTeMlK56on+N1AKCtW09hkY78OxnEuhc6VvA4N3SswE=;
        b=IpzdPj8zfaOQYi5dOadY2umbLwpprETnlXF2F7+UaMAnoumxzRxWmd28dUE71rxraR
         bc1AkmSCiyrDxTeMa2+vFFIiKJAx7HLFvIi54nRAPx+vSXop7fkVK3jfly/+vWr2+cNZ
         229ov++R6uk7x0upoh5gOOtUYSne5lclApW998mKEXrImvZAIPSvY6KpcXEudp8LOE8b
         KbVK07a13NrBaIsY2fM3JA3v0r1cGSSt9ltvr4+r6EK7hQwAXB88co9eMAv6Kd7+HY5b
         wAZhyFWK7vZX0IIqaKbGXJ7ha/1LwY2HtWRucgSZYeCkffjaG+cXdsGpQdzZLuAS5huR
         F6uQ==
X-Gm-Message-State: AOAM532jWfYEIskuKk6sljDc9I4eYeTRAG6rgFaQYW0QIlxUvfxVJj2u
        XX3C9cg8mqewIbAGZItv7iA=
X-Google-Smtp-Source: ABdhPJwNoIfp/c5dt4n0ucmz2RFGS3nnmNLUNjiuHzt7fCM8ZKuTwkg9K0bcaW7k0blwvmdTveqQdg==
X-Received: by 2002:aca:4406:: with SMTP id r6mr20151282oia.50.1626879621139;
        Wed, 21 Jul 2021 08:00:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a192sm372006ooc.10.2021.07.21.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 08:00:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 21 Jul 2021 08:00:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Message-ID: <20210721150018.GA3446170@roeck-us.net>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
 <20210712172656.GA2142233@robh.at.kernel.org>
 <PH0PR03MB63668564A9A7B8F5D6E5F8D499129@PH0PR03MB6366.namprd03.prod.outlook.com>
 <20210715203937.GA3182741@roeck-us.net>
 <PH0PR03MB636641D09289D1F696A64C9299119@PH0PR03MB6366.namprd03.prod.outlook.com>
 <f6d415a7-e113-1dda-727e-0d645c8114cb@roeck-us.net>
 <PH0PR03MB636618FE5E821669E224960199E19@PH0PR03MB6366.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR03MB636618FE5E821669E224960199E19@PH0PR03MB6366.namprd03.prod.outlook.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 19, 2021 at 07:46:41AM +0000, Sa, Nuno wrote:
> 
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
> > Roeck
> > Sent: Friday, July 16, 2021 5:04 PM
> > To: Sa, Nuno <Nuno.Sa@analog.com>
> > Cc: Rob Herring <robh@kernel.org>; linux-hwmon@vger.kernel.org;
> > devicetree@vger.kernel.org; Jean Delvare <jdelvare@suse.com>
> > Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
> > properties
> > 
> > [External]
> > 
> > On 7/16/21 12:44 AM, Sa, Nuno wrote:
> > [ ... ]
> > >>
> > >> Are you sure you can ever get this stable ? Each fan has its own
> > >> properties
> > >> and tolerances. If you replace a fan in a given system, you might get
> > >> different RPM numbers. The RPM will differ widely from system to
> > >> system
> > >> and from fan to fan. Anything that assumes a specific RPM in
> > >> devicetree
> > >> data seems to be quite vulnerable to failures. I have experienced
> > that
> > >> recently with a different chip which also tries to correlate RPM and
> > >> PWM
> > >> and fails quite miserably.
> > >>
> > >> In my experience, anything other than minimum fan speed is really
> > a
> > >> recipe
> > >> for instability and sporadic false failures. Even setting a minimum
> > fan
> > >> speed
> > >> is tricky because it depends a lot on the fan.
> > >
> > > I see what you mean. So, I had to go through this process when
> > testing
> > > this changes because the fan I'm using is different from the default
> > one
> > > used to develop and stablish the default values in the IP core. The
> > core
> > 
> > Exactly my point.
> > 
> > > provides you with a register which contains the tacho measurements
> > in
> > > clock cycles. You can read that for all the PWM points of interest
> > > (with devmem2 for example) and make your own "calibration". I
> > assume
> > > that people have to go through this process before putting some
> > values
> > > in the devicetree. I'm aware this is not the neatest process but I
> > guess it's
> > > acceptable...
> > >
> > 
> > Do you really expect everyone using a system with this chip to go
> > through
> > this process and update its devicetree configuration, and then repeat it
> > whenever a fan is changed ? Given how dynamic this is, I really wonder
> > if that information should be in devicetree in the first place.
> > 
> 
> My naive assumption was that we would only do this work at evaluation
> time. After that and after we settled with a fan for some system, I expected
> that changing to a different fan is not that likely. From your inputs, I guess
> this is not really the case which makes this process more cumbersome (as it
> also implies recompiling the devicetree for your system).
> 
> However, even if we export these as runtime parameters, services/daemons
> will also have an hard time doing this "calibration" in a dynamic way. The reason
> is because the way the controller works is that it only accepts a new PWM
> request if it is an higher value than whatever the HW has at that moment. Thus,
> going through the calibration points might be very cumbersome. I can see some
> ways of handling this though but not very neat...
> 
> Since this is a FPGA core, we might have some flexibility here. Something that
> came to my mind would be to have a calibration mode in the HW that would
> allow us to freely control the PWM values. In that way we could go freely over
> the calibration points. I guess, for safety reasons, this calibration mode would
> expire after some reasonable time (that give us enough time for doing the whole
> thing). The best place for doing the calibration, I guess it would be directly in the
> driver since we do receive the interrupts about new tacho measurements making
> things easier to sync and handle. However, given the time that takes for a new
> PWM to settle + new tacho measurements, it would not be very acceptable to do this 
> during probe which is definitely also not ideal (we could defer this to a worker/timer).
> 
> I'm not sure if the above makes much sense to you and it also depends on the HW
> guys being on board with this mechanism.
> 

I don't really know what to say or recommend here. Personally I think any
attempt to tie PWM values to RPM are doomed to fail. Here are a couple of
examples:

Take your test system and move the fan to a restricted place (eg close to a
wall). You'll see the fan RPM change, potentially significantly. Put it into
some place with airflow towards or away from the system (eg blow air into
the system from another place, which may happen if the system is installed
in a lab), and again you'll see fan speed changes. Open the chassis, and
the fan speed will change. I have seen fan speeds vary by up to 50% when
changing airflow.

That doesn't even take into account that replacing a fan even with a similar
model (eg after a fan failed) will likely result in potentially significant
rpm changes.

Ultimately, anything that does more than determine if a fan is still running
is potentially unstable.

Having said all that, it is really your call to decide how you want to detect
fan failures. 

Thanks,
Guenter
