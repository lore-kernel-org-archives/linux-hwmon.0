Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B92C4708F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8477B6136E
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhFAIVu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbhFAIVt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 04:21:49 -0400
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:1:101::144:244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D730C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 01:20:08 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 73C7B40006B
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 10:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622535605;
        bh=nZk+2agjsTQot5CMQ7mUevvPXFzcBBwsSLZhFnICtVU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=ZMbNczJyxIcEY4B2qzTws/ROdQfZ8LUtmL0ix9dsLUDOErJBEnF7UgyScRwvQGIH/
         1HKLip/3Tm60ZjGtPSEceG77F6tr+2r8BT8g9xDtKGbsD3SSGSO9Tvz1Jwq2xtfgMK
         lv3TzsxlvZFa7+6ezwegK3Uu8h3Rz6ILv8D6nXmnV9M7BaFKPmysMrhejxGPEd426c
         yEa5R7T7sMzMP6LSWvJkGb62VdAxN1ZlHfVv9SFpiS+buanQqhi/c4nh6PbbQLjER/
         C4DsGBJg0o29t1kkmVJKcnMkWLwA8uJfthOYDPAmbERuCO5GVsAvqFVrSsLNpqpLRI
         f6NRKomPi70Zg==
Received: by mail-pj1-f43.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so1429435pja.2
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 01:20:05 -0700 (PDT)
X-Gm-Message-State: AOAM533WyxINNvYnEYY19V1ZsUz71Zkz3bh9JTv4Zv+4nKNmMvx3BbNn
        4Lf0ZrwwPfhuWEYVe3ZK90lKqv+dE8ykosnVQ9g=
X-Google-Smtp-Source: ABdhPJxra4W7MyhD/7nOGbYRS/VKqJfpzjT4owcItuQnzve/PBwJd7nW5di/TW/DvDn4On8qeAbDjMYrGPPCKP8WFk8=
X-Received: by 2002:a17:902:6501:b029:ef:8518:a25a with SMTP id
 b1-20020a1709026501b02900ef8518a25amr24953361plk.64.1622535604069; Tue, 01
 Jun 2021 01:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154022.3223012-1-linux@roeck-us.net> <20210526154022.3223012-8-linux@roeck-us.net>
In-Reply-To: <20210526154022.3223012-8-linux@roeck-us.net>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Tue, 1 Jun 2021 10:19:52 +0200
X-Gmail-Original-Message-ID: <CABKa3npt3VbFXkd=2=_-sF1E8y+C9uKO5FQo+wo383MBPiFcQg@mail.gmail.com>
Message-ID: <CABKa3npt3VbFXkd=2=_-sF1E8y+C9uKO5FQo+wo383MBPiFcQg@mail.gmail.com>
Subject: Re: [PATCH 7/7] hwmon: (max31790) Add support for fanX_min attributes
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

fanX_min works fine.

Tested-by: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>

st 26. 5. 2021 v 17:41 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.net> n=
apsal:
>
> The minimum fan speed is closely correlated to the target fan speed.
> The correlation depends on the pwm mode. It is essential to be able
> to read and to set it to be able to control when a channel will report
> a fan fault.
>
> Since the minimum fan speed also applies to channels 7..12, make it
> visible but read-only for those channels as well.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/hwmon/max31790.rst |  9 ++++
>  drivers/hwmon/max31790.c         | 70 ++++++++++++++++++++++++--------
>  2 files changed, 61 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31=
790.rst
> index b43aa32813fd..9225c2a78b68 100644
> --- a/Documentation/hwmon/max31790.rst
> +++ b/Documentation/hwmon/max31790.rst
> @@ -40,6 +40,15 @@ fan[1-12]_enable   RW  0=3Ddisable fan speed monitorin=
g, 1=3Denable fan speed monito
>                         channels, the value matches the value of the prim=
ary channel.
>  fan[1-12]_input    RO  fan tachometer speed in RPM
>  fan[1-12]_fault    RO  fan experienced fault
> +fan[1-12]_min      RW  minimum fan speed in RPM. Equivalent to target fa=
n speed
> +                       in PWM mode and if PWM support is disabled for a =
channel.
> +                       Equivalent to half the target fan speed in RPM mo=
de.
> +                       The value is RO for companion channels (7-12). Fo=
r those
> +                       channels, the value matches the value of the prim=
ary channel.
> +                       Note: In RPM mode, if the pwm duty cycle is 100%,=
 the
> +                       minimum fan speed is equivalent to the target fan=
 speed,
> +                       and the chip will report a fault condition if the=
 fan
> +                       speed is below the target fan speed.
>  fan[1-6]_target    RW  desired fan speed in RPM
>  pwm[1-6]_enable    RW  regulator mode, 0=3Ddisabled (duty cycle=3D0%), 1=
=3Dmanual mode, 2=3Drpm mode
>  pwm[1-6]           RW  read: current pwm duty cycle,
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index 91fe419b596c..db97ee99515a 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -111,13 +111,11 @@ static struct max31790_data *max31790_update_device=
(struct device *dev)
>                                 if (rv < 0)
>                                         goto abort;
>                                 data->pwm[i] =3D rv;
> -
> -                               rv =3D i2c_smbus_read_word_swapped(client=
,
> -                                               MAX31790_REG_TARGET_COUNT=
(i));
> -                               if (rv < 0)
> -                                       goto abort;
> -                               data->target_count[i] =3D rv;
>                         }
> +                       rv =3D i2c_smbus_read_word_swapped(client, MAX317=
90_REG_TARGET_COUNT(i));
> +                       if (rv < 0)
> +                               goto abort;
> +                       data->target_count[i] =3D rv;
>                 }
>
>                 data->last_updated =3D jiffies;
> @@ -183,6 +181,21 @@ static int max31790_read_fan(struct device *dev, u32=
 attr, int channel,
>                         rpm =3D RPM_FROM_REG(data->tach[channel], sr);
>                 *val =3D rpm;
>                 return 0;
> +       case hwmon_fan_min:
> +               channel %=3D NR_CHANNEL;
> +               sr =3D get_tach_period(data->fan_dynamics[channel]);
> +               if (!(data->fan_config[channel] & MAX31790_FAN_CFG_RPM_MO=
DE) ||
> +                   (data->fan_config[channel] & MAX31790_FAN_CFG_TACH_IN=
PUT)) {
> +                       /* pwm mode: target =3D=3D min */
> +                       rpm =3D RPM_FROM_REG(data->target_count[channel],=
 sr);
> +               } else {
> +                       /* rpm mode: min tach count is twice target count=
 */
> +                       u16 tach =3D min(data->target_count[channel] * 2,=
 FAN_COUNT_REG_MAX);
> +
> +                       rpm =3D RPM_FROM_REG(tach, sr);
> +               }
> +               *val =3D rpm;
> +               return 0;
>         case hwmon_fan_target:
>                 sr =3D get_tach_period(data->fan_dynamics[channel]);
>                 rpm =3D RPM_FROM_REG(data->target_count[channel], sr);
> @@ -243,6 +256,20 @@ static int max31790_write_fan(struct device *dev, u3=
2 attr, int channel,
>                                 data->fan_config[channel] =3D config;
>                 }
>                 break;
> +       case hwmon_fan_min:
> +               /*
> +                * The minimum fan speed is the same as the target fan sp=
eed in
> +                * PWM mode and if a PWM channel is disabled, or it is ha=
lf the
> +                * target fan speed in RPM mode.
> +                */
> +               if (!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_I=
NPUT) &&
> +                   (data->fan_config[channel] & MAX31790_FAN_CFG_RPM_MOD=
E)) {
> +                       /* partial clamp to avoid overflow */
> +                       if (val > FAN_RPM_MAX / 2)
> +                               val =3D FAN_RPM_MAX / 2;
> +                       val *=3D 2;
> +               }
> +               fallthrough;
>         case hwmon_fan_target:
>                 val =3D clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
>                 bits =3D bits_for_tach_period(val);
> @@ -282,6 +309,7 @@ static umode_t max31790_fan_is_visible(const void *_d=
ata, u32 attr, int channel)
>         u8 fan_config =3D data->fan_config[channel % NR_CHANNEL];
>
>         switch (attr) {
> +       case hwmon_fan_min:
>         case hwmon_fan_enable:
>                 if (channel < NR_CHANNEL)
>                         return 0644;
> @@ -452,18 +480,24 @@ static umode_t max31790_is_visible(const void *data=
,
>
>  static const struct hwmon_channel_info *max31790_info[] =3D {
>         HWMON_CHANNEL_INFO(fan,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_TARGE=
T | HWMON_F_FAULT,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
,
> -                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_FAULT=
),
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_TARGET |
> +                               HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_TARGET |
> +                               HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_TARGET |
> +                               HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_TARGET |
> +                               HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_TARGET |
> +                               HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_TARGET |
> +                               HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_FAULT,
> +                          HWMON_F_ENABLE | HWMON_F_INPUT | HWMON_F_MIN |=
 HWMON_F_FAULT),
>         HWMON_CHANNEL_INFO(pwm,
>                            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>                            HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> --
> 2.25.1
>
