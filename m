Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817C2C4708F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DAFE60234
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhFAIDR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:03:17 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:34918 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbhFAIDP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 04:03:15 -0400
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 8C824400070
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 10:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622534492;
        bh=7BSYSf+ecpqqRD/itw5VjrkMAmHOcqdmu/WwPbzl4uw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=AWfdq/uIQjdPXJrvFObmgPvepbd/QjE0Ww6NnZm+Q7SciZb9mk6s/I7PglYvJr2X+
         T01BZFf92GCp37ynpqa+8phsIWkc/jRxVf28oLTha69Js5pB3o+0v0isqPbJInBfWd
         GgVasd/bYRy6xlhUBq4A++Q3KfgnYII17ODPMdPV2nMrUVSvIeLleZD85+RJ0ZXh+7
         AaaZeVWSPQpvw/fNazM8mzn1fuPkhG5fw4Y4QwmWhUYUvCClIFKozuT7eqe8rOotbc
         oQO6WbbtB26vwSF6AOfth4yIMC1lST6RlpU1EoSx6fB8CH/4m+BUyd+gvn98Y1paxO
         D5cz4QFiYcekA==
Received: by mail-pg1-f182.google.com with SMTP id t9so6340122pgn.4
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 01:01:32 -0700 (PDT)
X-Gm-Message-State: AOAM532vzJpTAqFfwSnYOETjPL3sRthsnX2ALj7kXxy7Sm+8LgKdAPzC
        4WrZA3hvvRy8WhSx1r90w8iU1OBpqi0XZvj3jKE=
X-Google-Smtp-Source: ABdhPJzu26zL6mzJEBm81+xpp9Da2xAl7Ss3GLiIJC6fKmFDlkwD80pHIKsOcjrISduC+7eZn6vtLE9QA5Gh5xT/z1I=
X-Received: by 2002:aa7:9f95:0:b029:2dc:99b9:8e66 with SMTP id
 z21-20020aa79f950000b02902dc99b98e66mr21290811pfr.30.1622534491196; Tue, 01
 Jun 2021 01:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154022.3223012-1-linux@roeck-us.net> <20210526154022.3223012-4-linux@roeck-us.net>
In-Reply-To: <20210526154022.3223012-4-linux@roeck-us.net>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Tue, 1 Jun 2021 10:01:20 +0200
X-Gmail-Original-Message-ID: <CABKa3nqZ0Z-Dce-W9RciyCGHgRaR_cVRPitP6=RV_P8BUbJgnA@mail.gmail.com>
Message-ID: <CABKa3nqZ0Z-Dce-W9RciyCGHgRaR_cVRPitP6=RV_P8BUbJgnA@mail.gmail.com>
Subject: Re: [PATCH 3/7] hwmon: (max31790) Fix pwmX_enable attributes
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

pwmX_enable 0 and 1 work fine, but it seems like RPM mode is currently
still unusable. I am testing with Sunon PF36281BX-000U-S99. Setting
almost any kind of RPM, from low (about 2500) and high (maximum is
23000), the RPM never stabilizes. I think this is mainly because the
driver currently doesn't work with the "window" and "pwm rate of
change" registers.

Tested-by: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>

st 26. 5. 2021 v 17:40 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.net> n=
apsal:
>
> pwmX_enable supports three possible values:
>
> 0: Fan control disabled. Duty cycle is fixed to 0%
> 1: Fan control enabled, pwm mode. Duty cycle is determined by
>    values written into Target Duty Cycle registers.
> 2: Fan control enabled, rpm mode
>    Duty cycle is adjusted such that fan speed matches
>    the values in Target Count registers
>
> The current code does not do this; instead, it mixes pwm control
> configuration with fan speed monitoring configuration. Worse, it
> reports that pwm control would be disabled (pwmX_enable=3D=3D0) when
> it is in fact enabled in pwm mode. Part of the problem may be that
> the chip sets the "TACH input enable" bit on its own whenever the
> mode bit is set to RPM mode, but that doesn't mean that "TACH input
> enable" accurately reflects the pwm mode.
>
> Fix it up and only handle pwm control with the pwmX_enable attributes.
> In the documentation, clarify that disabling pwm control (pwmX_enable=3D0=
)
> sets the pwm duty cycle to 0%. In the code, explain why TACH_INPUT_EN
> is set together with RPM_MODE.
>
> While at it, only update the configuration register if the configuration
> has changed, and only update the cached configuration if updating the
> chip configuration was successful.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/hwmon/max31790.rst |  2 +-
>  drivers/hwmon/max31790.c         | 41 ++++++++++++++++++++------------
>  2 files changed, 27 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31=
790.rst
> index 54ff0f49e28f..7b097c3b9b90 100644
> --- a/Documentation/hwmon/max31790.rst
> +++ b/Documentation/hwmon/max31790.rst
> @@ -38,7 +38,7 @@ Sysfs entries
>  fan[1-12]_input    RO  fan tachometer speed in RPM
>  fan[1-12]_fault    RO  fan experienced fault
>  fan[1-6]_target    RW  desired fan speed in RPM
> -pwm[1-6]_enable    RW  regulator mode, 0=3Ddisabled, 1=3Dmanual mode, 2=
=3Drpm mode
> +pwm[1-6]_enable    RW  regulator mode, 0=3Ddisabled (duty cycle=3D0%), 1=
=3Dmanual mode, 2=3Drpm mode
>  pwm[1-6]           RW  read: current pwm duty cycle,
>                         write: target pwm duty cycle (0-255)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index 693497e09ac0..67677c437768 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -27,6 +27,7 @@
>
>  /* Fan Config register bits */
>  #define MAX31790_FAN_CFG_RPM_MODE      0x80
> +#define MAX31790_FAN_CFG_CTRL_MON      0x10
>  #define MAX31790_FAN_CFG_TACH_INPUT_EN 0x08
>  #define MAX31790_FAN_CFG_TACH_INPUT    0x01
>
> @@ -271,12 +272,12 @@ static int max31790_read_pwm(struct device *dev, u3=
2 attr, int channel,
>                 *val =3D data->pwm[channel] >> 8;
>                 return 0;
>         case hwmon_pwm_enable:
> -               if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
> +               if (fan_config & MAX31790_FAN_CFG_CTRL_MON)
> +                       *val =3D 0;
> +               else if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
>                         *val =3D 2;
> -               else if (fan_config & MAX31790_FAN_CFG_TACH_INPUT_EN)
> -                       *val =3D 1;
>                 else
> -                       *val =3D 0;
> +                       *val =3D 1;
>                 return 0;
>         default:
>                 return -EOPNOTSUPP;
> @@ -307,23 +308,33 @@ static int max31790_write_pwm(struct device *dev, u=
32 attr, int channel,
>         case hwmon_pwm_enable:
>                 fan_config =3D data->fan_config[channel];
>                 if (val =3D=3D 0) {
> -                       fan_config &=3D ~(MAX31790_FAN_CFG_TACH_INPUT_EN =
|
> -                                       MAX31790_FAN_CFG_RPM_MODE);
> +                       fan_config |=3D MAX31790_FAN_CFG_CTRL_MON;
> +                       /*
> +                        * Disable RPM mode; otherwise disabling fan spee=
d
> +                        * monitoring is not possible.
> +                        */
> +                       fan_config &=3D ~MAX31790_FAN_CFG_RPM_MODE;
>                 } else if (val =3D=3D 1) {
> -                       fan_config =3D (fan_config |
> -                                     MAX31790_FAN_CFG_TACH_INPUT_EN) &
> -                                    ~MAX31790_FAN_CFG_RPM_MODE;
> +                       fan_config &=3D ~(MAX31790_FAN_CFG_CTRL_MON | MAX=
31790_FAN_CFG_RPM_MODE);
>                 } else if (val =3D=3D 2) {
> -                       fan_config |=3D MAX31790_FAN_CFG_TACH_INPUT_EN |
> -                                     MAX31790_FAN_CFG_RPM_MODE;
> +                       fan_config &=3D ~MAX31790_FAN_CFG_CTRL_MON;
> +                       /*
> +                        * The chip sets MAX31790_FAN_CFG_TACH_INPUT_EN o=
n its
> +                        * own if MAX31790_FAN_CFG_RPM_MODE is set.
> +                        * Do it here as well to reflect the actual regis=
ter
> +                        * value in the cache.
> +                        */
> +                       fan_config |=3D (MAX31790_FAN_CFG_RPM_MODE | MAX3=
1790_FAN_CFG_TACH_INPUT_EN);
>                 } else {
>                         err =3D -EINVAL;
>                         break;
>                 }
> -               data->fan_config[channel] =3D fan_config;
> -               err =3D i2c_smbus_write_byte_data(client,
> -                                       MAX31790_REG_FAN_CONFIG(channel),
> -                                       fan_config);
> +               if (fan_config !=3D data->fan_config[channel]) {
> +                       err =3D i2c_smbus_write_byte_data(client, MAX3179=
0_REG_FAN_CONFIG(channel),
> +                                                       fan_config);
> +                       if (!err)
> +                               data->fan_config[channel] =3D fan_config;
> +               }
>                 break;
>         default:
>                 err =3D -EOPNOTSUPP;
> --
> 2.25.1
>
