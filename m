Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D79FC4708F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:30:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 260E161370
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhFAIbo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:31:44 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:41126 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbhFAIbn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 04:31:43 -0400
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 7E66E40006D
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 10:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622536201;
        bh=GrsqJ//90ptv4r6HV0TUhjb0a0rFXLxEflyEExLFR2o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=dVy4Dydhgy4fstLbgH0sxRRavGzcAAbRz8CV3KcABrFE7r4hdlwL7Y7p/+QcuD/ts
         mKi9Lvkf0sYKYmqo6x3mYw/x8WRC2jTjawIOp5JrCCQy/XDNBVRquyQ88vMnlk5A4J
         XUnGO2uJ04brK8kFo5W0hoPm1D38VxmZxdq/zWRg91tA2AwZe4UJEu59zXQpHsljXN
         qjAtRDtJ1deLGuw1yo1dYh1YXOdqzHJ9/ubXXqYumRplitHC0CJ1cBoPXGtSPFeyr/
         IVkbDhs83Mj5ykVIGQTRZ4/cnqH3nqxDYKrpweG27EMPdeybeQbSkerfxSBEsrJYSZ
         62yxF+/W33/PQ==
Received: by mail-pf1-f179.google.com with SMTP id y15so10803423pfn.13
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 01:30:01 -0700 (PDT)
X-Gm-Message-State: AOAM532NS7s6oDw5f5LgfcqLCNtFO8gjYdDWppboL3JH1IyJh7l+GAZT
        UR0KSGlOXhyvaFL4FYqbQmPPnRFAZnDlsITyeJw=
X-Google-Smtp-Source: ABdhPJxvojN40mWk8ijBRK8GEjTtMXrGaQ6JnEzu0C777O8gbJiVtxUqs4mZJk/Yaqcw5TA8grh1UR7X0WzDr0wJL0U=
X-Received: by 2002:aa7:9f95:0:b029:2dc:99b9:8e66 with SMTP id
 z21-20020aa79f950000b02902dc99b98e66mr21395269pfr.30.1622536200183; Tue, 01
 Jun 2021 01:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154022.3223012-1-linux@roeck-us.net>
In-Reply-To: <20210526154022.3223012-1-linux@roeck-us.net>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Tue, 1 Jun 2021 10:29:48 +0200
X-Gmail-Original-Message-ID: <CABKa3noz1=o4KQV6hv7dSsgHQah2wY7=2yvUSC8t+r6riRSRBA@mail.gmail.com>
Message-ID: <CABKa3noz1=o4KQV6hv7dSsgHQah2wY7=2yvUSC8t+r6riRSRBA@mail.gmail.com>
Subject: Re: [PATCH 0/7] hwmon: (max31790) Fixes and improvements
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

I have tested your patches. It seems like the driver is now a lot more
usable, thanks. What seems to be still unusable for me, is RPM mode.
The chip creates an effort to set the RPM, but it almost never
stabilizes. I think the reason is mainly because the driver doesn't
work with registers like "window" and "pwm rate of change". PWM mode
seems to work fine.

I think some of the patches in my patch series on the chip are now
obsolete. However, I do think at least fanX_div should be implemented.
When testing with Sunon PF36281BX-000U-S99 (its max RPM is 23000), the
default divisor is not enough (one bit of change equals to about 500
RPM). The only way to change the divisor right now, is to set the
target RPM or min RPM.

There is also the regmap patch, but I've implemented that one mainly
because it made the driver a bit easier to debug.

V=C3=A1clav

st 26. 5. 2021 v 17:40 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.net> n=
apsal:
>
> The following series provides various fixes and improvements for the
> max31790 driver.
>
> ----------------------------------------------------------------
> Guenter Roeck (7):
>       hwmon: (max31790) Fix fan speed reporting for fan7..12
>       hwmon: (max31790) Report correct current pwm duty cycles
>       hwmon: (max31790) Fix pwmX_enable attributes
>       hwmon: (max31790) Add support for fanX_enable attributes
>       hwmon: (max31790) Clear fan fault after reporting it
>       hwmon: (max31790) Detect and report zero fan speed
>       hwmon: (max31790) Add support for fanX_min attributes
>
>  Documentation/hwmon/max31790.rst |  17 +++-
>  drivers/hwmon/max31790.c         | 171 ++++++++++++++++++++++++++++++---=
------
>  2 files changed, 147 insertions(+), 41 deletions(-)
