Return-Path: <SRS0=Ii2j=IG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851E6C433E6
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Mar 2021 09:39:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58845651DE
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Mar 2021 09:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhCHJjB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Mar 2021 04:39:01 -0500
Received: from office2.cesnet.cz ([195.113.144.244]:40694 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhCHJij (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Mar 2021 04:38:39 -0500
X-Greylist: delayed 404 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Mar 2021 04:38:38 EST
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 133D2400064;
        Mon,  8 Mar 2021 10:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1615195911;
        bh=yltdKOZ/6VYVTrMu44KMTldpTThy2mksJYEuQNhbrVk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=fouG54RXXM/ARxEvvtmzap+LFggmmxf/tvkx71BohNyFDgbJ3joPSuubExBpZw8wz
         HNGnOHvFjcg9E/aFfxh1Z3dm7zQzygHGci8QJNx+XpW7JdiRqdJuqP9wVEtYdEUyGA
         ejoXHFOAqrFOUG+1VBlXJt4WqyIdgDdelvEisAmFRn0yN5u4b07xrMXoGp/fEJY0p9
         rzzaW8u4M1Ti5I915o0AEmElCSd6nr+J+EsKMDcTJikEv1cHT8UUZE338Ty6E8K2aN
         rI4tnorjw/d52HgwltkzzNy0cuLmCytYCbpz15U39XTVthrKeTjLxYkCPWNFsV96Rs
         KAsMzgJsIxP6Q==
Received: by mail-lj1-f178.google.com with SMTP id c19so6874419ljn.12;
        Mon, 08 Mar 2021 01:31:51 -0800 (PST)
X-Gm-Message-State: AOAM530j+pxEt3slcgafC1zRFYE6tuTF1agkirG5awbJRo59kcmy6eoI
        7LWIwPj7Psd6qLCGzN7HlYQ2rbnymt9btCKFB6M=
X-Google-Smtp-Source: ABdhPJzm1zXbic7UlfG8H1lozfmgdCs8/TEcgGlVrSorjf8r9LemwnQu0ogoHYfZHB2pbpwvJfkNORjjVf+uGo1WIf0=
X-Received: by 2002:a2e:5716:: with SMTP id l22mr7268056ljb.244.1615195910561;
 Mon, 08 Mar 2021 01:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20210304105830.507176-1-kubernat@cesnet.cz> <20210304105830.507176-3-kubernat@cesnet.cz>
 <ad1c3054-e9a2-4299-aeed-94e36d6d3d12@cesnet.cz>
In-Reply-To: <ad1c3054-e9a2-4299-aeed-94e36d6d3d12@cesnet.cz>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Mon, 8 Mar 2021 10:31:39 +0100
X-Gmail-Original-Message-ID: <CABKa3noLPxg8DFoHBG7nz5h12Bo0qTU7sWbJBzsgtvK69aB0uw@mail.gmail.com>
Message-ID: <CABKa3noLPxg8DFoHBG7nz5h12Bo0qTU7sWbJBzsgtvK69aB0uw@mail.gmail.com>
Subject: Re: [PATCH 3/7] hwmon: (max31790) Allow setting pulses
To:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks, I will include fixes in v2 of the patches.

By the way, I'd like to mention that Jan is my colleague.

V=C3=A1clav

p=C3=A1 5. 3. 2021 v 13:08 odes=C3=ADlatel Jan Kundr=C3=A1t <jan.kundrat@ce=
snet.cz> napsal:
>
> > @@ -285,6 +295,9 @@ static int max31790_write_fan(struct device
> > *dev, u32 attr, int channel,
> >                                  MAX31790_REG_FAN_CONFIG(channel),
> >                                  data->fan_config[channel]);
> >               break;
> > +     case hwmon_fan_pulses:
> > +             data->pulses[channel] =3D val;
> > +             break;
>
> This needs input validation, otherwise it's possible to write 0 in there
> and you get a division-by-zero in the kernel context:
>
> [102109.999968] Division by zero in kernel.
> [102110.003917] CPU: 1 PID: 27590 Comm: cat Not tainted 5.9.3-cla-cfb #42
> [102110.010462] Hardware name: Marvell Armada 380/385 (Device Tree)
> [102110.016497] [<c010f16c>] (unwind_backtrace) from [<c010ae40>]
> (show_stack+0x10/0x14)
> [102110.024355] [<c010ae40>] (show_stack) from [<c083ba30>]
> (dump_stack+0x94/0xa8)
> [102110.031689] [<c083ba30>] (dump_stack) from [<c083a3fc>]
> (Ldiv0+0x8/0x2c)
> [102110.038499] [<c083a3fc>] (Ldiv0) from [<c064c1ac>]
> (max31790_read+0x174/0x204)
> [102110.045836] [<c064c1ac>] (max31790_read) from [<c0646fdc>]
> (hwmon_attr_show+0x44/0x138)
> ...
>
> A similar error can also happen when setting the fan speed to 0 RPM.
> That's, however, not an error caused by this patch series AFAIK. I *think=
*
> that RPM_TO_REG should be changed to check if `rpm` is 0, and if so, set
> the register directly to the maximal value of 0x7ff (in another patch).
>
> With kind regards,
> Jan
