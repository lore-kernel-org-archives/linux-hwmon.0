Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB751C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Sep 2021 17:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C5CF6113E
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Sep 2021 17:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhINRMo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Sep 2021 13:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbhINRMm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Sep 2021 13:12:42 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C3CC0613D8
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Sep 2021 10:11:25 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id p15so2262ljn.3
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Sep 2021 10:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZT8P3mQS19BrQefv3EWE24TGiGm5rj3TjmzR3qpVXBE=;
        b=R7/H7gDZMigDeE0/7mL3+Kht1Qq8uEhUZE8eVa7Zr8Sqp0Uiwp5ooulujxnj9DN26r
         iXutHA2s1AR95Ie0uGO7kHklBl2AHrtx54ryEOSTh75NmQZElYFLohJYKbqTIG89cr3S
         JaJUMhWPm4AfWjASiUMMoQ0NizfdQKNT4jYxkvLqSKHDqD+qKYnwntAQIdDoSLQXCb6W
         HZdogmYivHX5NQ5UqfveQ01Mvsr0SQoqlqm5fhrEdfb7kxasv9mQeT8F0dP5E8xQLfya
         ScbmThUzvRoKQSTNd8go1yGe8x+olw73/Xrj2sD/ic+NuiqDgF81lH+MIf/U49Wz/6rL
         66Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZT8P3mQS19BrQefv3EWE24TGiGm5rj3TjmzR3qpVXBE=;
        b=f6e4F2bFgZryeM98NPguNaeQIhV7W3PqwHKK+XknkewSU6R8BD3kasWyX235XTkAUM
         DGwfqkvPL/J8w8ZV1T6ee4dvtVJq4rKHaNe/FrMWjZCbhqkTuKOzokZTFeaw9dHcLqZi
         Knv42RXS3AbpxjH/8WW6InaKI2y2nIVUcW4BXWaYXQJKTH4oFn3xZwxZPK18qkXo/wxY
         cZkQKqnlsUukEygs4/GMdYN9BghX/gLuhzIEaKS6Zl4+wPSqZftxKAVi3VuOhx5gh/1v
         KYW5eFhEqe0uB6GU9v/iTFxGaSpheVoRv628MEY3Eq6owMrPZmFGmRzFB9vo9PW9UnKk
         yY6A==
X-Gm-Message-State: AOAM533/qBhQ0SIe8uRtrO6CzJh3TYn7FJR8al4WRtXW10UijNFfwfZF
        FmiGeOSvlMfO4HFYD1D6frwPJrzauq1wtcvhMii0Xg==
X-Google-Smtp-Source: ABdhPJzbFGFCCGLaoraaVB4YLcpsXIXczCdDgluSLTvBSPzDSrdTaoBGMxoUjtGK6U6TnHPIhPELWTNCwL8e7mqTk/k=
X-Received: by 2002:a05:651c:1209:: with SMTP id i9mr16692284lja.85.1631639483288;
 Tue, 14 Sep 2021 10:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130337.2025426-1-osk@google.com> <71c17c47-ca9e-e9d2-7b89-cc25b512c06a@roeck-us.net>
 <CABoTLcRZ43EUVzbqWniu64PkB7Yx4RMYKjaBxaSihk+k0Ca-gA@mail.gmail.com>
 <722b27f6-4390-9b5b-f6f2-75ce9e967d12@roeck-us.net> <CABoTLcSdkmuBxd5Yh6z2Oqm1-_Vd4J5Ni1i1qq5s07mWu7Ndew@mail.gmail.com>
 <20210914150859.GB3457579@roeck-us.net>
In-Reply-To: <20210914150859.GB3457579@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Tue, 14 Sep 2021 13:11:07 -0400
Message-ID: <CABoTLcQfS5-UL92NR9vbc2YrGJv3oQPYCqAm-diNoq-tkHP_hQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwmon: Add nct7802 bindings
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

> > Following the example from tmp421, this could then be like this:
>
> Something like that, only we'll need something to distinguish
> temperature sensors from other sensor types, eg voltage or current.
> Maybe a "type" property. I'd suggest "sensor-type", but we have
> non-sensor attributes such as fan count and pwm values which should
> be covered as well. But it looks like a good start for a set of
> generic sensor properties.
Would it be acceptable to simply number the sensors and document which
sensor has which number?

Something like this:
0 = LTD
1 = RTD1
2 = RTD2
3 = RTD3
4 = FAN1
5 = FAN2
6 = FAN3

Would we also want to be able to define PWMs? From what I can tell the
driver does not support running individual pins in GPIO mode, right?
So I'm not quite clear what "disabling PWM" would actually mean.

Anyway, if we simply go by "sensor number", that would mean that we'd
have different attributes depending on the sensor number. Would that
be ok?

Also, I'm sorry, I think I just realized that in "voltage mode" we
don't seem to get a temperature reading. I hadn't actually looked
through more of the datasheet except for the single MODE register
before. But I don't think this makes a difference for what I proposed
so far?

> >         /* LTD */
> >         input@0 {
> >             reg = <0x0>;
> >             status = "okay";
>
> Not sure what the default is here ('okay' or 'disabled').
> We'd also need to define what to do if there is no data
> for a given sensor.
I think I'd like to keep previous behavior unmodified. From what I can
tell previous behavior was:
- xTDs enabled by default
- RTD modes unmodified, i.e. defaulting to whatever the HW comes up with

The NCT7802Y can self-program from an EEPROM, so I assume we should
honor the "power-up configuration" obtained from there? I.e. if no
configuration is provided in the device tree, the driver should use
whatever configuration the chip has when the driver is loaded.

> >             label = "voltage mode";
>
> That isn't the idea for "label", as "label" would be expected to
> show up as tempX_label (and a label of "voltage mode" would be odd).
> The label should indicate where the sensor is located on a board,
> such as "inlet" or "outlet".
Yes, absolutely. This was a bad example on my part. In my
understanding "label" is just a string that we pass through.

Oskar.
