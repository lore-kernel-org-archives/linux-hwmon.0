Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A97AC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Nov 2022 21:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiKBVLI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Nov 2022 17:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbiKBVK7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Nov 2022 17:10:59 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D169EF02F;
        Wed,  2 Nov 2022 14:10:48 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id g127so56262ybg.8;
        Wed, 02 Nov 2022 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IsQrKvlx5RmsTdyPlKzOHSe5sxivJyI6dSSpPonXbs=;
        b=eAZNH0VuPqFB+DdD49qI63/W68dFONMMtoveljjhWAmSQrjIhfepE9J53j+gt6Ot5n
         YbLD+7D298RBmuQkMeC2XXrRtpaTo0VfVbyQ6USPoeFWQcmEX/pR3J6sLL9XpHulxRJf
         lovp/SOfZus5+pN91S1a7yE6R1lPPV4sDD1HJAhyFVQkUQDAL02tlh25NamPPef6RS51
         q8FJzUvkapN8oNyJqvtsJ6C+spPMwrJYT8af635PwqsETrd0xV49PtZEM9USdftuRfos
         nJ2es2S6ivGtdho8nU1jdpIBYNdUdWmLDV/FO4TcIZprf4FXQDVeSfFFwm/albZMgYCe
         YpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IsQrKvlx5RmsTdyPlKzOHSe5sxivJyI6dSSpPonXbs=;
        b=fPKajivchPcMpZ1mwBE9uGwvBm+Zo21bnRniIO9pxGd8Wl/LDBI/rSW4F8cC5pqX5T
         ViE712xcvMxjqJrC2m0Yf+/GYz+ERiEPFujeRjdmfmIpiXAVaDmzejRFt0S7xy5d4azH
         5e5kO5AvwR07SqVQQLOhBOzS1kgf88p5cWDkeBIH2oBBSj5g55qKVEOD1Hs5IsnzyYnh
         f76kmmG70vouvoDPD/4Sws4C++5WsbvH66PEojie+T6EGb2OnOGRPDKTPiBDf9WjPzST
         CAk5lYBOknYuNrdJeOy8emCrjLcGVE2X+YPQDBPNETDQZ1Yc+oIig+omo//GWKi9UEex
         X04g==
X-Gm-Message-State: ACrzQf3SimhXCbn9EHV9KjFczrCJhkBuvzNTIcm2nxnt+SNshpiqLH6Z
        JHn7uGQ9ACdh8Re9xzTWxYW6MlrPK6kfk2Lrcyc=
X-Google-Smtp-Source: AMsMyM72D9TsYnqiDqHjwUQa/HfQHxbOWxv5eO5ee81LcyBC+tIvOFbs0sMe8a+oZ0liG0EaVdl+6fkt7hRTUGsw39A=
X-Received: by 2002:a25:5505:0:b0:6cc:68a9:df05 with SMTP id
 j5-20020a255505000000b006cc68a9df05mr22478868ybb.332.1667423448074; Wed, 02
 Nov 2022 14:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221102150440.208228-1-samsagax@gmail.com> <20221102180430.GC2913353@roeck-us.net>
 <CABgtM3jXVTjxEJXmCXG+z_DGaHAkFFVjZBa2bOCbeqFveesWrA@mail.gmail.com> <20221102204407.GA2089083@roeck-us.net>
In-Reply-To: <20221102204407.GA2089083@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Wed, 2 Nov 2022 18:10:37 -0300
Message-ID: <CABgtM3jaV+jy3PYcCi3o1ij1igk4S7dWTF=QM=rN2acaGLQ_JA@mail.gmail.com>
Subject: Re: [PATCH v4] Add OneXPlayer mini AMD sensors driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> >
> > Oops. Is not really needed but I'll add them.
> >
> Technically you are correct, but we would have static analyzers scream at
> us, and it is against kernel coding style. There is a practical reason
> for that: Missing break statements are often the result of coding errors.
>
> Guenter

Great, thanks for the clarification.

As for my last statement, module_platform_driver() usage broke the
module, don't know why, but seems like the probe function is not run?
If you are ok with it, I'll revert to module_init/module_exit macros.

--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
