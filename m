Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4A7C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 00:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343924AbiBKAkV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Feb 2022 19:40:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346446AbiBKAkU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Feb 2022 19:40:20 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF725F8A
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Feb 2022 16:40:19 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id i62so9607054ioa.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Feb 2022 16:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=lFCvE5g2JTD7Wl81REd7Gq5kC+E/CgUSaN7wy6qbWOE=;
        b=VtYPNobKD09wldiKKvTu91rXQCR0IYONn5V1OzDhc2Cdc3IOtrLo6mBgEZ3sqH3Pfa
         IN32zk1uZODJ1Jz7OyVbpEuHVXgb5hv+WW3p7NOcK6LMcaHhnw5NAWexF1O+I5tuYFVj
         wTtYO5MC8v2Ogp0J+wzT5vCnkG16XHFKJq57XSh2W1WiT5X0FhwmNAUz7xLMdkCJI/vj
         I8Dcr88qlqQkPLTrgDMQJMX4N3mwKi5bKAxTAOf1Z8rBOflBExxdGoTXIhAMLz6Jebzv
         YxCvRShMHjL0tmfzkpChHFXTGv6ykKmpjblS3sTwUu4QMmEgWBGVQv0LUr8Fexfh3w/e
         BnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=lFCvE5g2JTD7Wl81REd7Gq5kC+E/CgUSaN7wy6qbWOE=;
        b=cpPHdwRI+9yKmhG8p9GpNJFg+1ZiG62hEWkCMxyR4blnRJYoyIwsBZlDM4m6GusXi3
         PWcgYWxnLTgeVMC8Ds22McRq9ZiaRw2kRGi1VDoNXzR2LFFIQn8KqLDhMp6tHSOPcuwS
         PmmvbnNxhFwjJxU+5ARr0Jn4BtFdE7WEdV8Vd48KNIWviS9bINmDJNWVr5VYkT8uIzO4
         iFpHWTsb+3MQLsxn70aC2R6Se+WGE1UbgniBABHHQboVOYMoZNhWRR8YCQ+XO+lO6LNL
         gTWrqwWY5qJM09hp+3NTCjtWDGWyDLM2tNj5A+hnB6p4Os047oABl1JJkspm2JdZ7qIx
         7AxA==
X-Gm-Message-State: AOAM532hZyuJ4X9fLZHnJK4Q7Y9wp1iz8fDZtTU5lIRei6FJhKAduuTH
        WnRxAqOT3fdBHmhMBjGjZbbXMXRO5TplnnC4Aeg=
X-Received: by 2002:a5d:9d9e:: with SMTP id ay30mt5247366iob.192.1644540018688;
 Thu, 10 Feb 2022 16:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20220211003641.73111-1-eugene.shalygin@gmail.com>
In-Reply-To: <20220211003641.73111-1-eugene.shalygin@gmail.com>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Fri, 11 Feb 2022 01:40:07 +0100
Message-ID: <CAB95QAS4ow16O6Fb8Q_q5yoZaUzVaBWF59PgmdBCfOsxM0ugpA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) deduce sensor signess from its type
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        Denis Pauk <pauk.denis@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 11 Feb 2022 at 01:36, Eugene Shalygin <eugene.shalygin@gmail.com> wrote:
>
> Reading DSDT code for ASUS X470-based boards (the ones served by the
> asus_wmi_Sensors driver), where ASUS put hardware monitoring functions
> into the WMI code, reveals that fan and current sensors data is
> unsigned. For the current sensor that was confirmed by a user who showed
> high enough current value for overflow.

Denis, you might be interested in fixing temperature sensors in the
asus_wmi_sensors driver too.

>  static inline s32 get_sensor_value(const struct ec_sensor_info *si, u8 *data)
>  {
> -       switch (si->addr.components.size) {
> -       case 1:
> -               return (s8)*data;
> -       case 2:
> -               return (s16)get_unaligned_be16(data);
> -       case 4:
> -               return (s32)get_unaligned_be32(data);
> -       default:
> -               return 0;
> +       if (is_sensor_data_signed(si)) {
> +               switch (si->addr.components.size) {
> +               case 1:
> +                       return (s8)*data;
> +               case 2:
> +                       return (s16)get_unaligned_be16(data);
> +               case 4:
> +                       return (s32)get_unaligned_be32(data);
> +               default:
> +                       return 0;
> +               }
> +       } else {
> +               switch (si->addr.components.size) {
> +               case 1:
> +                       return *data;
> +               case 2:
> +                       return get_unaligned_be16(data);
> +               case 4:
> +                       return get_unaligned_be32(data);
> +               default:
> +                       return 0;
> +               }
>         }
>  }

I would appreciate it if anyone could help me to collapse this
ugliness somehow, without multi-level macros, please.

Thank you,
Eugene
