Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D4AC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BC45611CA
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Sep 2021 20:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237759AbhIPUMi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Sep 2021 16:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbhIPUMh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Sep 2021 16:12:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6E6C061756
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:11:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p29so23191296lfa.11
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Sep 2021 13:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zu9vDGjBH/c1GwA4DO06e/FELXSh704ia9MKIbXI+tY=;
        b=QqV/TSyvqEuFfRPRashNipb7Miu6y/Wx05ntrOUCB291k+AIWICHSrTP7t+zvRjdJt
         cDms/iQwDgJW3WXM659EyUCTt5q66hrNYKGb/ft8t0R8WN/S7vTfeI5mEpkDc4lGYtTA
         snTXX+mj4HVUJiSjxCXItu5SvxsVLib9TZZhjkVXNhz/Ce7F6vGdkCExEptDyFAWtsYN
         gZz1sRoziih7R2Okh8ZK6MsjjFCEaAcpa26tBhRKdmwT/JeD8kbFIzp6wmxg0xPXQUxu
         YzKHcW+7yWqzXKBsakqGlQgSWAJGnSX80gRvos2uxOxgtm+s7DHhy2O9zD0WAp9K5CCP
         ClCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zu9vDGjBH/c1GwA4DO06e/FELXSh704ia9MKIbXI+tY=;
        b=Gmi00w73eCT6QGJoFHSfxpTo5OEJZrGq2iaFg/y4fZ5hdfSNH0N9hMRpq0hNPkH6eW
         0M/N9VDP1LL9FJ9eBg7yPJVwzkayYlYrH94zrbT6Pm66TYWMO0Ie1g4wBGS/4OQ0cyce
         QU9XevMs3tkPVNXn8/AXSFuEf762wiHK+NVKWzxF4YKXYKh1/vbf2Iz/E89t/pbfT1go
         gqNkovyXaMECchrh0Zi7btJgX2lsScD1bzJ/IS8ivaWTrA9H+8natoUdJyMV7OHniBzB
         dUavNFyWJrFd+kIwHS27EQwciBf6S5CAek1mPvbiI5ZDpkQX9dOPkBk9NpkIlRsd0ici
         8XlA==
X-Gm-Message-State: AOAM533Uz6uQ6yei+VZ9Pib1Yn3F7+HqM+ogwGp0LbQQbAL7ktKo+OpN
        LgItBTMtLEE+qsji29Xl0+kh46rrIXtKzcZLANB2U/krcjsHKA==
X-Google-Smtp-Source: ABdhPJzbK8PRHhLqc5IVMBPRDMMMgXkc/UjRCEL24yCbtWAuWLaBUpDzRhwlaHm11W0oTfcD+0Z7CqasqhTMYjSiFP8=
X-Received: by 2002:a05:651c:178e:: with SMTP id bn14mr6693269ljb.521.1631823074554;
 Thu, 16 Sep 2021 13:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130337.2025426-1-osk@google.com> <71c17c47-ca9e-e9d2-7b89-cc25b512c06a@roeck-us.net>
 <CABoTLcRZ43EUVzbqWniu64PkB7Yx4RMYKjaBxaSihk+k0Ca-gA@mail.gmail.com>
 <722b27f6-4390-9b5b-f6f2-75ce9e967d12@roeck-us.net> <CABoTLcSdkmuBxd5Yh6z2Oqm1-_Vd4J5Ni1i1qq5s07mWu7Ndew@mail.gmail.com>
 <20210914150859.GB3457579@roeck-us.net> <CABoTLcQfS5-UL92NR9vbc2YrGJv3oQPYCqAm-diNoq-tkHP_hQ@mail.gmail.com>
 <c410eba9-f6cf-4dbf-797f-48afde9c1898@roeck-us.net> <CABoTLcQWXerMWPvWUqjykiNcx9oGoP8aEcuDwcQ36yu-CBc0pA@mail.gmail.com>
 <382858f5-e833-d4b9-f189-449671992ba5@roeck-us.net> <CABoTLcST=74wRbtMA2SdmeHd0WmU7id05ouSfw4PFw2nJt_gLw@mail.gmail.com>
 <9869ed19-b8ab-d9e5-e791-a02eeb2c5eed@roeck-us.net>
In-Reply-To: <9869ed19-b8ab-d9e5-e791-a02eeb2c5eed@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Thu, 16 Sep 2021 16:10:58 -0400
Message-ID: <CABoTLcS6krUnqDU7=1+_wBPoGN==VfmZHDQ4rWVZUv7c3ExNkQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwmon: Add nct7802 bindings
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> I think there was a reason for "sensors", because there can be other
> bindings on the same level. Documentation/devicetree/bindings/hwmon/ltc2978.txt
> lists "regulators", for example.
>
> Where did you find the "sensors" example for ltc2978 ? I don't see it
> in the upstream kernel. Or was that derived from the official "regulators"
> bindings ?

Yes, I just followed the structure from there, renaming "regulators"
as "sensors".


> Yes, let's do that. I'd like us to keep the "sensors" subnode to have a clear
> association and differentiator to other sub-nodes such as "regulators".
> Open is if we can use "temperature-sensor@0" or if it would have to be
> a chip specific "ltd", but I think we can sort that out after suggesting
> an initial set of bindings to Rob.
Makes sense, I'll do that. Now I just need to figure out how to
express that in YAML ...

I'll send a new patch as soon as I figured that out and got it to work.

Thanks for your input!

Oskar.
