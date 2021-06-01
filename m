Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA1FC4708F
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43C1D61378
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 08:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233194AbhFAIKp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:10:45 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:37148 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhFAIKo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 04:10:44 -0400
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id A4E0F400076
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 10:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622534942;
        bh=rQi5jwHCViy9L8DXFMalg8FasJfSHSae5He7UZLVDLI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=dlT3siJhFOMgT58M2VqrJxkl9r1MySaiUir/KgHKle5WggJGyTwmg5vqrRsrcjcrI
         dJ4rMlTr8jHzC5ZQ8t7wODtpZVTdEFivj62rUrqs61GBLKFyy/4lpVCNn1tScXcFPz
         Q0ENNRclxRgotZYJo6OIZyFnW1r4GnX/5PkH/wztiSUHgNdL5HqBJUL43F4+Twf1RB
         Krp+JZ8TYYPHNA3oYlROftqrx038SsCZ2B1YZCq11PkCwjjP0jDgTnMDTmeo6LTUPH
         0xvBKn5rrTa7bo2Dvx1XJxkxVAFZ4gschI4ZcjImDvRab1RycKWPSDCZiKL1bHWpuX
         AFvxUW4GMa0OA==
Received: by mail-pg1-f172.google.com with SMTP id e22so10085674pgv.10
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 01:09:02 -0700 (PDT)
X-Gm-Message-State: AOAM530fMJx+Af6k/P7JOBfjpKq9ZJKrqczkBZNdwGI1hnDx8JPinyC+
        NAq0Tbr6Iul3q91RfpibU6Bq7MKeQp7pL3AWFfQ=
X-Google-Smtp-Source: ABdhPJxxS2hYS8P8ywB4JMpqK+SM1ki8tk3JcRkRH1ccNZ32EeiKuktMM+qs0UWqKf+z7PF4xvj/KOE3+Rpc1hXxv/M=
X-Received: by 2002:aa7:9f95:0:b029:2dc:99b9:8e66 with SMTP id
 z21-20020aa79f950000b02902dc99b98e66mr21321437pfr.30.1622534941303; Tue, 01
 Jun 2021 01:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154022.3223012-1-linux@roeck-us.net> <20210526154022.3223012-6-linux@roeck-us.net>
In-Reply-To: <20210526154022.3223012-6-linux@roeck-us.net>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Tue, 1 Jun 2021 10:08:50 +0200
X-Gmail-Original-Message-ID: <CABKa3npepB4CnEsPqEZffZm+9ALePTUH2hej9AGGYu9h0667MA@mail.gmail.com>
Message-ID: <CABKa3npepB4CnEsPqEZffZm+9ALePTUH2hej9AGGYu9h0667MA@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: (max31790) Clear fan fault after reporting it
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fan fault reading/clearing works fine.

Tested-by: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>

st 26. 5. 2021 v 17:41 odes=C3=ADlatel Guenter Roeck <linux@roeck-us.net> n=
apsal:
>
> Fault bits in MAX31790 are sticky and have to be cleared explicitly.
> A write operation into either the 'Target Duty Cycle' register or the
> 'Target Count' register is necessary to clear a fault.
>
> At the same time, we can never clear cached fault status values before
> reading them because the companion fault status for any given fan is
> cleared as well when clearing a fault.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/max31790.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index 19651feb40fb..8e4fd9b7c889 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -80,7 +80,7 @@ static struct max31790_data *max31790_update_device(str=
uct device *dev)
>                                 MAX31790_REG_FAN_FAULT_STATUS1);
>                 if (rv < 0)
>                         goto abort;
> -               data->fault_status =3D rv & 0x3F;
> +               data->fault_status |=3D rv & 0x3F;
>
>                 rv =3D i2c_smbus_read_byte_data(client,
>                                 MAX31790_REG_FAN_FAULT_STATUS2);
> @@ -184,7 +184,21 @@ static int max31790_read_fan(struct device *dev, u32=
 attr, int channel,
>                 *val =3D rpm;
>                 return 0;
>         case hwmon_fan_fault:
> +               mutex_lock(&data->update_lock);
>                 *val =3D !!(data->fault_status & (1 << channel));
> +               data->fault_status &=3D ~(1 << channel);
> +               /*
> +                * If a fault bit is set, we need to write into one of th=
e fan
> +                * configuration registers to clear it. Note that this al=
so
> +                * clears the fault for the companion channel if enabled.
> +                */
> +               if (*val) {
> +                       int reg =3D MAX31790_REG_TARGET_COUNT(channel % N=
R_CHANNEL);
> +
> +                       i2c_smbus_write_byte_data(data->client, reg,
> +                                                 data->target_count[chan=
nel % NR_CHANNEL] >> 8);
> +               }
> +               mutex_unlock(&data->update_lock);
>                 return 0;
>         default:
>                 return -EOPNOTSUPP;
> --
> 2.25.1
>
