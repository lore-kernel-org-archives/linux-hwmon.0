Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73922C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 21:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 412D32054F
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 21:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXHGunIW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730374AbfDRVdR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 17:33:17 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:32798 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729198AbfDRVdQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 17:33:16 -0400
Received: by mail-it1-f196.google.com with SMTP id v8so8962964itf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 14:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=FV2d9svjh4BugKt2va0A5isM8iVGaEP2DiLQZM7wXaY=;
        b=HXHGunIWcEvInUkfvC3MOYcZedM0QdkY97anyNATLxjY00dN2tkNfzwpl+DQlrIZQg
         MIk7UMlPNfnCCC7Jl+Y6QJ6jRES/CUW5w+WtDsae3Hwsp8WFg4POIkD7s/bBXJK/7pz6
         izHvPCpaxMz9ymX+gMn2ZeAz/0ist3iQ+VN6w07mktNO3GJrJaRvQEcZq6LOCJ78lShU
         N1bfNh8vZCanfta34j+Vf1kYSnFujAbAYm0Oow7/VlvP3tZswojkQsrUmV2ORHWbSSw9
         A9E3qKlmndNlIO5G0il89E+5ZkKyi6ONee8X2jHZmycBFElWojhlgJBIBCPzDTsejF6G
         Sk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=FV2d9svjh4BugKt2va0A5isM8iVGaEP2DiLQZM7wXaY=;
        b=A+qyDuvvjVcADI5jckQbhagjlh7FWxOl1xj9SZz0UW0Q9WnCgek3paoP5zrTF1aFVT
         uZ6nfzdKAvA/B9Li9jDe5YoAVoPNjKoNx5zkYJx66j+8kvHbRxbqXyhBSrMtKPPTu7+W
         fR2L7Vhl9WxoNGQNAu5NRLHnmc+KHlGPXzJYM8i9pkof2v5ZUoByK0QxOkGMmZ224jt3
         DP7d18jYGB7i463rU737PqTB0iiE4GRw2Iju8yJKtLEV0uKrtfEdGZP2ww+bQzOWOnLh
         Rb4ot+z8eYRumGgLn4Ib6UaV2eFga6rBmo2tYMPZeuSLdfIR9QLEbtf8qKDbrcSxUtR5
         9G/A==
X-Gm-Message-State: APjAAAVNlJYTSbDm709aFy67XBlle4rgBJjuZyREUD25wmFMv8rbM8Gw
        eKO7Y5A/nBKab6FVliA7/HmHL2xj2ICUwQ==
X-Google-Smtp-Source: APXvYqwN3N5JAedg534xtkirQ1IayrGyYHZPoK03Voe1MusnB2vF8zdyQj72O9jtQqalNfpvgm8Uzw==
X-Received: by 2002:a02:ccb0:: with SMTP id t16mr6366211jap.137.1555623195901;
        Thu, 18 Apr 2019 14:33:15 -0700 (PDT)
Received: from [10.0.0.19] ([135.0.225.35])
        by smtp.gmail.com with ESMTPSA id n184sm2542737itc.28.2019.04.18.14.33.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 14:33:15 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20190418205008.GA13496@roeck-us.net>
Date:   Thu, 18 Apr 2019 17:33:13 -0400
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <41DB8327-5AE7-4A57-990C-02A94FFEFF50@gmail.com>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
 <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
 <20190418180623.GA18588@roeck-us.net>
 <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
 <20190418201208.GA10459@roeck-us.net>
 <A7D38D52-8643-481D-AE6F-5F61DBE04108@gmail.com>
 <20190418205008.GA13496@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


> On Apr 18, 2019, at 16:50, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
>> normally without any errors, yet the thermal-zone I defined, which is =
there to
>> prevent my system from burning out, would remain incomplete (without =
required
>> cooling device) and yet no errors came out of the kernel.
>>=20
>> I just tested it and that's exactly what's happening! Yikes.
>>=20
> You would still get a warning message. Better than failing to load
> the driver completely. On top of that, this used to work before.
> Plus, you said it only happens in severe situations, ie if the kernel
> is out of memory, and in thact case there would be a traceback.
> Sorry, I don't get your point.

Ok, I see. We're having the same discussion than on the v3 submission =
then.

If I change the dev_err to a dev_warn, but still return 0 on
thermal_of_cooling_device_register failure, you would apply the patch. =
It sounds
like a compromise.

Completely failing the probe call or partially succeed it results in the =
same
behaviour for thermal cooling use cases. But the dev_warn definitely =
becomes
important though.

I will v4 with that if you agree and leave the devm_ thermal register =
for
another day since I agree the series might be delayed too long (or
indefinitely).

Cheers!=
