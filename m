Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2799EC4708F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 07:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 015AA61378
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 07:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhFAHxM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 03:53:12 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:33568 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbhFAHxL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 03:53:11 -0400
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id EDEDB400052
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 09:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622533888;
        bh=qhTK0nPDVeegI1lSU6v65jme8qq+KOC0a4n5igrrIgM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=h2Jze8H3pVlYm2R3She2QiofVU+VDgXWHCuEXmnt52BsrQ6dRr8kd/OEXUbIK1sop
         BJW5CEsU92FPeHnVkO5zPGg9wczZVafKb6nsHAxbjpfcYyzV8lV1UIZ08bSqrNB5QZ
         fgT9JP9y6VWIZFL87xnwa7qF1Hqc5CcA75oj8UKy9HgjIKaNLbE1Tw6gH8htBwcuUC
         xr4dEZ5BYpL0410ds9QUQXGjsmdpMX36cYmUWFpufc8+OmKs5KLoSq8quciTOz1t+S
         CCk/NAqCA7TNR+3FZJcdhMtYy9zLDHyqa6UnmI84+YmUMhGNBxewIxNsbxz5oyY5R9
         Vz5SYXETgxW3w==
Received: by mail-pg1-f175.google.com with SMTP id 29so10058425pgu.11
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 00:51:28 -0700 (PDT)
X-Gm-Message-State: AOAM533g2XxLsS9edguJChkuL+8K4MbEHTEykNLGxmjVZhmXxrjIkC6V
        OCV15d3COlhH3JHmzzZMwQEyrldhIbi28YCnnIo=
X-Google-Smtp-Source: ABdhPJxxGpe1C8K9+kzKf2t2YZiWbilZToU2bwtyk6P2kQ3pB6dBIUB59L5BFLkBqaQZS4ph/1FdcnEW9lmc5dEfdPI=
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr26179478pgb.110.1622533887571;
 Tue, 01 Jun 2021 00:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154022.3223012-1-linux@roeck-us.net> <20210526154022.3223012-3-linux@roeck-us.net>
In-Reply-To: <20210526154022.3223012-3-linux@roeck-us.net>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Tue, 1 Jun 2021 09:51:15 +0200
X-Gmail-Original-Message-ID: <CABKa3nrTsmvpg9C5HWAi_bk8Tcj0sc15ZFL3zxEZ-+LSCdw=2g@mail.gmail.com>
Message-ID: <CABKa3nrTsmvpg9C5HWAi_bk8Tcj0sc15ZFL3zxEZ-+LSCdw=2g@mail.gmail.com>
Subject: Re: [PATCH 2/7] hwmon: (max31790) Report correct current pwm duty cycles
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PWM duty reading works.

Tested-by: V=C3=A1clav Kubern=C3=A1t <kubernat@ceesnet.cz>

st 26. 5. 2021 v 17:40 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.net> n=
apsal:
>
> The MAX31790 has two sets of registers for pwm duty cycles, one to reques=
t
> a duty cycle and one to read the actual current duty cycle. Both do not
> have to be the same.
>
> When reporting the pwm duty cycle to the user, the actual pwm duty cycle
> from pwm duty cycle registers needs to be reported. When setting it, the
> pwm target duty cycle needs to be written. Since we don't know the actual
> pwm duty cycle after a target pwm duty cycle has been written, set the
> valid flag to false to indicate that actual pwm duty cycle should be read
> from the chip instead of using cached values.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/hwmon/max31790.rst | 3 ++-
>  drivers/hwmon/max31790.c         | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31=
790.rst
> index f301385d8cef..54ff0f49e28f 100644
> --- a/Documentation/hwmon/max31790.rst
> +++ b/Documentation/hwmon/max31790.rst
> @@ -39,5 +39,6 @@ fan[1-12]_input    RO  fan tachometer speed in RPM
>  fan[1-12]_fault    RO  fan experienced fault
>  fan[1-6]_target    RW  desired fan speed in RPM
>  pwm[1-6]_enable    RW  regulator mode, 0=3Ddisabled, 1=3Dmanual mode, 2=
=3Drpm mode
> -pwm[1-6]           RW  fan target duty cycle (0-255)
> +pwm[1-6]           RW  read: current pwm duty cycle,
> +                       write: target pwm duty cycle (0-255)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index f6d4fc0a2f13..693497e09ac0 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -104,7 +104,7 @@ static struct max31790_data *max31790_update_device(s=
truct device *dev)
>                                 data->tach[NR_CHANNEL + i] =3D rv;
>                         } else {
>                                 rv =3D i2c_smbus_read_word_swapped(client=
,
> -                                               MAX31790_REG_PWMOUT(i));
> +                                               MAX31790_REG_PWM_DUTY_CYC=
LE(i));
>                                 if (rv < 0)
>                                         goto abort;
>                                 data->pwm[i] =3D rv;
> @@ -299,10 +299,10 @@ static int max31790_write_pwm(struct device *dev, u=
32 attr, int channel,
>                         err =3D -EINVAL;
>                         break;
>                 }
> -               data->pwm[channel] =3D val << 8;
> +               data->valid =3D false;
>                 err =3D i2c_smbus_write_word_swapped(client,
>                                                    MAX31790_REG_PWMOUT(ch=
annel),
> -                                                  data->pwm[channel]);
> +                                                  val << 8);
>                 break;
>         case hwmon_pwm_enable:
>                 fan_config =3D data->fan_config[channel];
> --
> 2.25.1
>
