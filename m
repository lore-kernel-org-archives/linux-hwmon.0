Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B6EB64DA
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jun 2023 07:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjFVHDI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jun 2023 03:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjFVHDE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2023 03:03:04 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C447D1BD9
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2023 00:03:02 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-570284c7e61so72938947b3.1
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2023 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687417382; x=1690009382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=647VdAKDpiR62O7WDkRN3aETIMIb4i2xmi3nL3BvZto=;
        b=RVypG5l/+pSwcJe4iq5GSYPU1Tat/StR/KO1GhkSLWWYu+cyIxl+EpaJLQllNj+1op
         xyOrQeX+w8dhn2BsZ2yLWofTlCFxGmPmKJ5Pl6tzFipb1ALOtXvlz7f7P04/WNENqfOL
         hkummsfw+y8fwhg1ADdUUZjiuN4xfjdvJFpyGKpxMnW+S/Uy4RAGIa+RZc680NA4DPf8
         +4tN0EqMKMI5CCUIHg8w51tAmqej3LccIPw+Ss7L6tHDCuIfLLoOC5SFpEDI7l8szWnf
         b0FgC8uDKFg8IX47ebiBAuOsBwplnylgqlYnfyIlgwVX202bV3J5R+pS25cRG+6IpW6E
         //ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687417382; x=1690009382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=647VdAKDpiR62O7WDkRN3aETIMIb4i2xmi3nL3BvZto=;
        b=O7KNi+WVJzb/vbtKcpyOlJQ2rPztmSmVDJ/b07Z4QT079Y0A3rCaYSIVhwULOD+DTR
         lrrb49f4T7gPWg4t2LWQ7EsQTN8eFbgqlIrAeVdwTOOGji3HkD6zxd/fLhwGjvT0WmWW
         tiOw3c4gclDlC4Phk4s2VkGNsVgAt+QdAZdGEQ7H0ZYaR6C/cRsPhiVPRHI7wkG6xsTl
         x+NGkJHSJMfohj9lWNSrWj/D9Ho5dEtUCQlCI07E2quKehMsnWWmlyS4tEBd6HBS7jed
         fG6vRIa6OGrxz0Sqx/vAoO5/Oa422dpgxQTSi7tR8WYqhHxnDgGpRY7vt7LzUxIRaW/s
         GjRQ==
X-Gm-Message-State: AC+VfDyxO/nVXBju3u038iGyaKSNs6Y6sz659wyFwQJGyZKg2WiAqX0O
        RdGXvs1OJnhKpcj37Ehun4q1is0lncrLhjWcJhRj8g==
X-Google-Smtp-Source: ACHHUZ4KGoQu28j4ID5gDP1LVIyD9hPsoIPftVlCHbQKZr+7vKPoUgMzwrC6cjVNBrf24OS1HSUSy3zCaymoMBEqv5M=
X-Received: by 2002:a25:b325:0:b0:bfe:ade3:e59c with SMTP id
 l37-20020a25b325000000b00bfeade3e59cmr4044136ybj.64.1687417381797; Thu, 22
 Jun 2023 00:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230621213115.113266-1-nick.hawkins@hpe.com> <20230621213115.113266-3-nick.hawkins@hpe.com>
In-Reply-To: <20230621213115.113266-3-nick.hawkins@hpe.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Jun 2023 09:02:49 +0200
Message-ID: <CACRpkdaGLBiYhMYcnVaaVi2GYZ+MawB4GWPL=B_N-qQ8+frbdQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] gpio: gxp: Add HPE GXP GPIO PL
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Nick,

thanks for your patch!

This is looking pretty good, I have some minor questions.

On Wed, Jun 21, 2023 at 11:35=E2=80=AFPM <nick.hawkins@hpe.com> wrote:

> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> The GXP SoC supports GPIO on multiple interfaces. The interfaces are
> CPLD and Host. The gpio-gxp-pl driver covers the CPLD which takes
> physical I/O from the board and shares it with GXP via a proprietary
> interface that maps the I/O onto a specific register area of the GXP.
> This driver supports interrupts from the CPLD.
>
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

(...)
> +enum pl_gpio_pn {
> +       IOP_LED1 =3D 0,
> +       IOP_LED2 =3D 1,
> +       IOP_LED3 =3D 2,
> +       IOP_LED4 =3D 3,
(...)

The confusing bit here is that GPIO means
*generic purpose input/output*
and these use cases are hardcoded into the driver and
do not look very generic purpose at all.

But I understand that it is convenient. I would add some
comment saying that if there is a new version with a
different layout of the pins, we need to make this kind
of stuff go away and just use the numbers.

> +static const struct gpio_chip template_chip =3D {
> +       .label                  =3D "gxp_gpio_plreg",
> +       .owner                  =3D THIS_MODULE,
> +       .get                    =3D gxp_gpio_pl_get,
> +       .set                    =3D gxp_gpio_pl_set,
> +       .get_direction =3D gxp_gpio_pl_get_direction,
> +       .direction_input =3D gxp_gpio_pl_direction_input,
> +       .direction_output =3D gxp_gpio_pl_direction_output,
> +       .base =3D -1,
> +};

Neat! Since you so explicitly have assigned a meaning to each
GPIO line, you can go ahead and assign the .names property as
well. Check in the kernel tree for other drivers doing this.

> +       drvdata->chip =3D template_chip;
> +       drvdata->chip.ngpio =3D 80;

If you're always assigning 80 to this you can just put that in the
template as well.

Other than that I think it looks good!

Yours,
Linus Walleij
