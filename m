Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBAFC4708F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2009E600CD
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhFAIEZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:04:25 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:35092 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbhFAIEY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 04:04:24 -0400
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id B408F400052
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 10:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622534562;
        bh=HkWatbd3n+xasEyHU9e2tq6SXBkLc/d8aGAltk4ddHQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=e0XlAS5V14oXuW/cJL/R4GWcRBCXpFgL15/G8Edg0PI1xwRQ75f7yRBI9XtQvPAhN
         +i6JR1RyV0dgdaLAisUz7uHxwmURT8aCd3Tf6kjvq1dk8yc5lwpTDuWUnzlsQ+1+zT
         xlVsiAnEK/4t/4tArNTl9xKS9h5Y3CQtuMnx27uCXPFjuB6okU2PekRQPGmtbSQmXG
         LuSAdj3ZXmR5Wd1KPahRTEScDo/dfpaVIkvJTgSsWz4awArcFIr/G7a5BWGnCQp98d
         ixjw+NFhVd7Yremhmg79G9R1M1KrvlWZXAiZfs6tEcqoanRtDHE/VeXc1Fnhda/ii3
         Y7Uz/zyrRTpjA==
Received: by mail-pg1-f180.google.com with SMTP id 133so5050636pgf.2
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 01:02:42 -0700 (PDT)
X-Gm-Message-State: AOAM533mPkTtFPmrqY19sXVuoSlJ2TktFOHSijjUg9NWUTP1/o1uG45v
        E236nZeQdZQvA6ykVcxGS53M0VqwCJos25nR1Do=
X-Google-Smtp-Source: ABdhPJyHQ8GD9uyt0mF1ocIxXyzGrNc9h2Qy3q75dW3/MAy7N2e7Ko00cFJiKHWNbsoCle9Bvofx9U9YoZehd5kF31Y=
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr26221519pgb.110.1622534561377;
 Tue, 01 Jun 2021 01:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154022.3223012-1-linux@roeck-us.net> <20210526154022.3223012-5-linux@roeck-us.net>
In-Reply-To: <20210526154022.3223012-5-linux@roeck-us.net>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Tue, 1 Jun 2021 10:02:30 +0200
X-Gmail-Original-Message-ID: <CABKa3nq-buWK8EYAVGQQTmdrp=ks_gUnG6gu_BgvfxBWbTADKg@mail.gmail.com>
Message-ID: <CABKa3nq-buWK8EYAVGQQTmdrp=ks_gUnG6gu_BgvfxBWbTADKg@mail.gmail.com>
Subject: Re: [PATCH 4/7] hwmon: (max31790) Add support for fanX_enable attributes
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

fanX_enable works fine.

Tested-by: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>

st 26. 5. 2021 v 17:40 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.net> n=
apsal:
>
> Since pwmX_enable is now fixed and only handles pwm support instead
> of also enabling/disabling fan tachometers, we need an explicit means
> to do that.
>
> For fan channels 7..12, display the enable status if the channel
> is configured for fan speed reporting. The displayed status matches
> the value of the companion channel but is read-only.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/hwmon/max31790.rst |  3 ++
>  drivers/hwmon/max31790.c         | 55 ++++++++++++++++++++++++--------
>  2 files changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31=
790.rst
> index 7b097c3b9b90..b43aa32813fd 100644
> --- a/Documentation/hwmon/max31790.rst
> +++ b/Documentation/hwmon/max31790.rst
> @@ -35,6 +35,9 @@ Sysfs entries
>  -------------
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +fan[1-12]_enable   RW  0=3Ddisable fan speed monitoring, 1=3Denable fan =
speed monitoring
> +                       The value is RO for companion channels (7-12). Fo=
r those
> +                       channels, the value matches the value of the prim=
ary channel.
>  fan[1-12]_input    RO  fan tachometer speed in RPM
>  fan[1-12]_fault    RO  fan experienced fault
>  fan[1-6]_target    RW  desired fan speed in RPM
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index 67677c437768..19651feb40fb 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -170,6 +170,9 @@ static int max31790_read_fan(struct device *dev, u32 =
attr, int channel,
>                 return PTR_ERR(data);
>
>         switch (attr) {
> +       case hwmon_fan_enable:
> +               *val =3D !!(data->fan_config[channel % NR_CHANNEL] & MAX3=
1790_FAN_CFG_TACH_INPUT_EN);
> +               return 0;
>         case hwmon_fan_input:
>                 sr =3D get_tach_period(data->fan_dynamics[channel % NR_CH=
ANNEL]);
>                 rpm =3D RPM_FROM_REG(data->tach[channel], sr);
> @@ -195,12 +198,32 @@ static int max31790_write_fan(struct device *dev, u=
32 attr, int channel,
>         struct i2c_client *client =3D data->client;
>         int target_count;
>         int err =3D 0;
> -       u8 bits;
> +       u8 bits, config;
>         int sr;
>
>         mutex_lock(&data->update_lock);
>
>         switch (attr) {
> +       case hwmon_fan_enable:
> +               config =3D data->fan_config[channel];
> +               if (val =3D=3D 0) {
> +                       /* Disabling TACH_INPUT_EN has no effect in RPM_M=
ODE */
> +                       if (!(config & MAX31790_FAN_CFG_RPM_MODE))
> +                               config &=3D ~MAX31790_FAN_CFG_TACH_INPUT_=
EN;
> +               } else if (val =3D=3D 1) {
> +                       config |=3D MAX31790_FAN_CFG_TACH_INPUT_EN;
> +               } else {
> +                       err =3D -EINVAL;
> +                       break;
> +               }
> +               if (config !=3D data->fan_config[channel]) {
> +                       err =3D i2c_smbus_write_byte_data(client,
> +                                                       MAX31790_REG_FAN_=
CONFIG(channel),
> +                                                       config);
> +                       if (!err)
> +                               data->fan_config[channel] =3D config;
> +               }
> +               break;
>         case hwmon_fan_target:
>                 val =3D clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
>                 bits =3D bits_for_tach_period(val);
> @@ -240,6 +263,12 @@ static umode_t max31790_fan_is_visible(const void *_=
data, u32 attr, int channel)
>         u8 fan_config =3D data->fan_config[channel % NR_CHANNEL];
>
>         switch (attr) {
> +       case hwmon_fan_enable:
> +               if (channel < NR_CHANNEL)
> +                       return 0644;
> +               if (fan_config & MAX31790_FAN_CFG_TACH_INPUT)
> +                       return 0444;
> +               return 0;
>         case hwmon_fan_input:
>         case hwmon_fan_fault:
>                 if (channel < NR_CHANNEL ||
> @@ -404,18 +433,18 @@ static umode_t max31790_is_visible(const void *data=
,
>
>  static const struct hwmon_channel_info *max31790_info[] =3D {
>         HWMON_CHANNEL_INFO(fan,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT=
,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT=
,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT=
,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT=
,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT=
,
> -                          HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT=
,
> -                          HWMON_F_INPUT | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_FAULT,
> -                          HWMON_F_INPUT | HWMON_F_FAULT),
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
),
>         HWMON_CHANNEL_INFO(pwm,
>                            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>                            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> --
> 2.25.1
>
