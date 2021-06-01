Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EB2C4708F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EB3761378
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbhFAINI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:13:08 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:37514 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbhFAINI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 04:13:08 -0400
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id BBD30400076
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 10:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622535086;
        bh=hdzM4iPcsXfEi/rI5gw1+WJ03ef9+oxSHdkGFsZrgKQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=TFxn6gqkVIsrQPlhufDA9ga9AC46VivJv9EnCgmU3QQByJ01nlleRPstDHttyIx6i
         lz7q91HNu1J1UiixSadJhN9FgndV+VYsNDnA8omBy1js2YXhdecBEuqjg3cQpx8hy2
         TiisNZIMvVtPVk4oaPxhp3O5svaB8wLQTCmyJIfGT99safXCU7baeh2YBKfAyDi36e
         eUmz9z9wczugvJjpnboVakYI1HnI+dIBwKWGQSIktkSeGamUsCNWm5/trDE9UwX36o
         U8PCl1ngVlpKEAtlryIFSmD5H3wfPYrguZyrKmzQ4TYtf1kqony1M90KSl/0dycDop
         oZrcn7GVRTD5A==
Received: by mail-pl1-f174.google.com with SMTP id 11so2948478plk.12
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 01:11:26 -0700 (PDT)
X-Gm-Message-State: AOAM533VInghXLhikFVPd0XQnI75bCfmZuk0W3Rr6fb0APtbWTlKRReJ
        17jQ3YnVddnp7lBYOiBdcguOke5nXTpZ1DMEXpg=
X-Google-Smtp-Source: ABdhPJwIy5K353d4Bfm4315vN7B+H9vKm1EDx1fpQUamnrrX2XnbbVCktOlw5Lfz68mOrzABng6CpW8CmKZAtjF/mtw=
X-Received: by 2002:a17:90b:1b4c:: with SMTP id nv12mr23618165pjb.55.1622535085293;
 Tue, 01 Jun 2021 01:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154022.3223012-1-linux@roeck-us.net> <20210526154022.3223012-7-linux@roeck-us.net>
In-Reply-To: <20210526154022.3223012-7-linux@roeck-us.net>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Tue, 1 Jun 2021 10:11:14 +0200
X-Gmail-Original-Message-ID: <CABKa3noe7vW2Sr8UEqWz07tsCADgG_8SUdctV+XpMNOgKRi=kw@mail.gmail.com>
Message-ID: <CABKa3noe7vW2Sr8UEqWz07tsCADgG_8SUdctV+XpMNOgKRi=kw@mail.gmail.com>
Subject: Re: [PATCH 6/7] hwmon: (max31790) Detect and report zero fan speed
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Zero fan speed is reported correctly.

Tested-by: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>

st 26. 5. 2021 v 17:41 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.net> n=
apsal:
>
> If a fan is not running or not connected, of if fan monitoring is disable=
d,
> the fan count register returns a fixed value of 0xffe0. So far this is th=
en
> translated to a RPM value larger than 0. Since this is misleading and doe=
s
> not really make much sense, report a fan RPM of 0 in this situation.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/max31790.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index 8e4fd9b7c889..91fe419b596c 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -40,6 +40,8 @@
>  #define FAN_RPM_MIN                    120
>  #define FAN_RPM_MAX                    7864320
>
> +#define FAN_COUNT_REG_MAX              0xffe0
> +
>  #define RPM_FROM_REG(reg, sr)          (((reg) >> 4) ? \
>                                          ((60 * (sr) * 8192) / ((reg) >> =
4)) : \
>                                          FAN_RPM_MAX)
> @@ -175,7 +177,10 @@ static int max31790_read_fan(struct device *dev, u32=
 attr, int channel,
>                 return 0;
>         case hwmon_fan_input:
>                 sr =3D get_tach_period(data->fan_dynamics[channel % NR_CH=
ANNEL]);
> -               rpm =3D RPM_FROM_REG(data->tach[channel], sr);
> +               if (data->tach[channel] =3D=3D FAN_COUNT_REG_MAX)
> +                       rpm =3D 0;
> +               else
> +                       rpm =3D RPM_FROM_REG(data->tach[channel], sr);
>                 *val =3D rpm;
>                 return 0;
>         case hwmon_fan_target:
> --
> 2.25.1
>
