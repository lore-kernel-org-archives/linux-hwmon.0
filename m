Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0F6C7EE23
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Jun 2023 11:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjFALjl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Jun 2023 07:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjFALjk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Jun 2023 07:39:40 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3924F132
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Jun 2023 04:39:39 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ba8afcc82c0so758160276.2
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Jun 2023 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685619578; x=1688211578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtKqDhOhV8jcZhCSJeAVNY1VyfUXM1TIO50JtxkLlV8=;
        b=wPaEH8XFaAQh5F9IVbR25tk3T1wzNl5jkgIhZZ20Ec+I85gyyrdM1EAKOvfqTk2bH3
         dT1lK1AItS7uuYxQ/uZG2wyXsF/QgISfDDTsW/2gh3GZ+4DBBPSPf4hYJPdrBHndyrAy
         KzTRwyvZ0GNCWwStb9suC2CXdvTyrmcJ1e6NjVbBqFHWN3X+RmtEVgoYf2lZmscQDNpO
         RMp3xcatfs2Swbc++cBCimb5MuiksZlykgtws415BNpPNVl/Ih6qjy8eCW4cLGxAEu88
         zr0LSwEoLTDFQGVX95WxbQwAJCOYAgykodH9zJU4piFsQ6sCdwp6BVW6Jh6XVqjcbqsz
         pg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685619578; x=1688211578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtKqDhOhV8jcZhCSJeAVNY1VyfUXM1TIO50JtxkLlV8=;
        b=iLPYQlm1cR98ZRqhzLCr8Ox+hfNGqJGwCtYewgRtxLbKjELYcv4h56monvIQDuT6JF
         k/0IY4+QG+GZGgz+JBBCkRAv0yQro+pYX/7+YI03Sdcgi2tVdMrTYnOB34e/5gjninSr
         iuanX6FGoMYDNtPVng3DUBnv2SwNSdtHGGRcngzOBwMfItDRzSnEI4LfXqDGZQYvSNAq
         sr4mJxnCjXBnccPCNVx8jVFxP9WC1JkVL6w8eIq1VC0d3nJwEicOLcRNqZcTm6jnjsrZ
         wLlwG4xI4nnQmoqCcfANQokz35eiiKK6T1rZnR/UUIci/2wUYd7IQ3pM6hi9buTnTEDf
         wdew==
X-Gm-Message-State: AC+VfDxilTxEM7Gvbrw2nhKLJEKhAGEl5el6lo/UhOzJa4sKiQh4+DPm
        MpAJOppIQnRLQVvOubDL4lrK1bDrANsZcS9dDBxlqg==
X-Google-Smtp-Source: ACHHUZ5nNBJ5v986b2seXJsPt1deE3fykR02s/RUmwswpeEPa/qt4wLZrYFEmPi5m82CTNORJJTUlC3vD1elcd+s3ew=
X-Received: by 2002:a81:7d41:0:b0:561:ed46:2f51 with SMTP id
 y62-20020a817d41000000b00561ed462f51mr9778258ywc.22.1685619578459; Thu, 01
 Jun 2023 04:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230531151918.105223-1-nick.hawkins@hpe.com> <20230531151918.105223-3-nick.hawkins@hpe.com>
In-Reply-To: <20230531151918.105223-3-nick.hawkins@hpe.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Jun 2023 13:39:37 +0200
Message-ID: <CACRpkdaH2eZSCtEdCw+S1eGVrPBdEo83gbSf2wzu3-p0=P+CmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: gxp: Add HPE GXP GPIO
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

On Wed, May 31, 2023 at 5:23=E2=80=AFPM <nick.hawkins@hpe.com> wrote:

> +/* Provide info for fan driver */
> +u8 fan_presence;
> +EXPORT_SYMBOL(fan_presence);
> +
> +u8 fan_fail;
> +EXPORT_SYMBOL(fan_fail);
> +
> +/* Remember last PSU config */
> +u8 psu_presence;

As Bartosz said this doesn't work.

to me it looks like you should define a GPIO-controlled fan in the
device tree, similar to this:

       fan0: gpio-fan {
                compatible =3D "gpio-fan";
                gpios =3D <&gpio1 6 GPIO_ACTIVE_HIGH>;
                gpio-fan,speed-map =3D <0 0>, <10000 1>;
                #cooling-cells =3D <2>;
        };

Then that cooling cell should be used by a thermal driver for the chassis
to keep the temperature reasonable. I bet you have a temperature sensor
as well, meaning they should form a thermal zone controlled by the fan.

Examples of chassis thermal zones in device tree:
arch/arm/boot/dts/gemini-dlink-dir-685.dts
arch/arm/boot/dts/gemini-dlink-dns-313.dts

Yours,
Linus Walleij
