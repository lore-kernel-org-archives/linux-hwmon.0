Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D330FC77B70
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Apr 2023 03:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjDJDNy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 9 Apr 2023 23:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjDJDNx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 9 Apr 2023 23:13:53 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6D330D5
        for <linux-hwmon@vger.kernel.org>; Sun,  9 Apr 2023 20:13:46 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id bi39so7756162qkb.13
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Apr 2023 20:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1681096426; x=1683688426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntZMy55/xSRNn21X5fqVWQquJJJq/aQ2W9wX/ILyeb8=;
        b=We/zlPuaa3SYC+/fX5BSFNlnzgUbsr1Gg6ULkayZ/xS/v8Vs0BTm6b5vlt4Zb2C1dH
         17b7yAPL1b2bNrRWXHgMUBx38MpmEOVQ4cZjJrHbMrl0Ubg24ajqElFvhyTVs1M/9BDB
         rctP07xaMeu0kh8CZqa30Q6dfPLSH1B+ylOXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681096426; x=1683688426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntZMy55/xSRNn21X5fqVWQquJJJq/aQ2W9wX/ILyeb8=;
        b=xoEk4ptJK/Mc4pN2OtezpfqanvJM6noZY3sPD9X17DdZI86UKHfxIeCp3h+PVVwsDw
         0d4vMBbZwvXAWt+k+G7wIySbm4ii8NMLoajITMf+l21J/d9YvJ/tUnnPfNLqmi9cMURU
         qwrOr/kWDjtv3OI70nOsIgwkEbWjhWZn2Nmr1lLOQoUyGOKOPzg3RXp4XwBZfszUmP9x
         +eW8zavZuDnu0dh9anRvmz2YQrnFyGXtwDt56NJ8hfGBGfs1C9AQfsQ74PAt87O5dTFn
         fb5KlOCIUUQJxzF5pVsoR1RGk8HRYbUPZ7cUPbywxWjIuslQJl/xhI6wlY/ETiymq0Pa
         8mqA==
X-Gm-Message-State: AAQBX9cltTZg4H7Ev+olO6t/5t3Nh09tv2rhlnMwZ/4hetdU1bYjs8+t
        RyyRAFsQRRngYK2+Lo5gwtJL1sCpUf9kN4wpWBF9GQ==
X-Google-Smtp-Source: AKy350Zjr5nQvJ/lph5fNAEe0swSQUFFph/fm06j5NLpwC5FIRX+xJ+i6lqgl1Rn2EN+OxEd3AaqoyLG3nj7T8ikW0M=
X-Received: by 2002:a05:620a:c46:b0:743:6092:91b4 with SMTP id
 u6-20020a05620a0c4600b00743609291b4mr2936652qki.14.1681096425847; Sun, 09 Apr
 2023 20:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230407150015.79715-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407150015.79715-1-krzysztof.kozlowski@linaro.org>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sun, 9 Apr 2023 20:13:35 -0700
Message-ID: <CAJCx=gmcRAvkBcBdEUk++rLsdiPbhOYcSkQ2Dk2evR4trFS1Vg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: video: constify pointers to hwmon_channel_info
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 7, 2023 at 8:00=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matt Ranostay <matt.ranostay@konsulko.com>

>
> ---
>
> This depends on hwmon core patch:
> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@=
linaro.org/
>
> Therefore I propose this should also go via hwmon tree.
>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> ---
>  drivers/media/i2c/video-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.=
c
> index dddf9827b314..abd472dcd497 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -274,7 +274,7 @@ static const struct hwmon_channel_info amg88xx_temp =
=3D {
>         .config =3D amg88xx_temp_config,
>  };
>
> -static const struct hwmon_channel_info *amg88xx_info[] =3D {
> +static const struct hwmon_channel_info * const amg88xx_info[] =3D {
>         &amg88xx_temp,
>         NULL
>  };
> --
> 2.34.1
>
