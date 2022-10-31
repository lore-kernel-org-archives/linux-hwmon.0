Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA3DECAAA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 14:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiJaOuJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 10:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiJaOuI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 10:50:08 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4E810FE5;
        Mon, 31 Oct 2022 07:50:07 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id i127so13916076ybc.11;
        Mon, 31 Oct 2022 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLBxKnt2hZjq4hXfnpGIBk32nFNiC1bZx8lYRgix0Ao=;
        b=il1wfUvTPm8Exbjub3X6USsiHHO+7lOX/NZkZPu/roEmkHkrFIBYrGQ/a+x2S6gutx
         RzEWMjh7MQhT/R/gWkn7N7l92PEdD+6kyK013TAX725w0V2MZXTqm91BCqMOe2X0jTI4
         sLgqa5m2BV5NS9IT4gjtllwHuqyav/jo2wdXTc0Pv4ziD5CctPedzjcoJxYZ0irlpobt
         Aeim2AnGkVsHb1DSMinHPevP10jMsGaOYdc3RtlhSNERRqAddzZuu6lJVZNWlKvE5nLb
         LFgM2KuFmEb420WDH0eWWhg9RsEmHDv1Q5t6zVqSQwB0XgBVTGdODdDhkq5D78SBT7c9
         yLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLBxKnt2hZjq4hXfnpGIBk32nFNiC1bZx8lYRgix0Ao=;
        b=hTZ1Awg8IutkHijSFztcZVwO0vsJ75y+cGpEL4DNbKBMuoTdB/lE7shgRYYHHmO+jA
         YvetV1KDHaqpUrMx0c9FtvofhoTgYcvw/GzA1015xAXYtkNr7N1PERtaP9fYY692kqBC
         lfQFB7Y0iLGPNewaD5CGUoWeprtztL9WmGd4xwbB8BPxgg6rOjl8k8MpHEUv/S4CWjAS
         SMrZux0u0GTc8RAN24dpEWLyNjnuqpEpmXC3uye/rN2HESx9wzg2wfHMjuSoXyW3BGDz
         wzr0C3TiqNDvFt2rHUJqL5+ocEzTkl8Ud9OM/ziTYnERzJDP4ecn7P5ouWdzcYS9MS8x
         QpcQ==
X-Gm-Message-State: ACrzQf17ui+9fhDQ0C9xb7tEmjdef0FWOcIvx8ml+LsvbrKSyEAzfuov
        ed+wd7TkO25Jv8t8+EVx8k3LMG5CWc8eqFIA7z0=
X-Google-Smtp-Source: AMsMyM47WJSTzUFSrpR78YxQd8ATbdrqZe/eCRNigDbd+IbgjnRioID1Ks6NsSZAFXkkfAkB8d4ZlzzNEMB11xz1dIQ=
X-Received: by 2002:a05:6902:1367:b0:6cb:bca3:e3bb with SMTP id
 bt7-20020a056902136700b006cbbca3e3bbmr13756190ybb.196.1667227806882; Mon, 31
 Oct 2022 07:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <c6c16bc6-d86b-84ca-e49a-0788f9c80006@roeck-us.net>
 <20221030203248.15485-1-samsagax@gmail.com> <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
In-Reply-To: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Mon, 31 Oct 2022 11:49:55 -0300
Message-ID: <CABgtM3g611wKz6wzOmGP=q0hFqydfMe+bu8W+qbN5Kde1MdnoA@mail.gmail.com>
Subject: Re: [PATCH v2] Add OneXPlayer mini AMD sensors driver
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

El dom, 30 oct 2022 a la(s) 21:03, Barnab=C3=A1s P=C5=91cze
(pobrn@protonmail.com) escribi=C3=B3:
>
> Hi
>
>
> 2022. okt=C3=B3ber 30., vas=C3=A1rnap 21:32 keltez=C3=A9ssel, Joaqu=C3=AD=
n Ignacio Aramend=C3=ADa =C3=ADrta:
>
> > Sensors driver for OXP Handhelds from One-Netbook that expose fan readi=
ng
> > and control via hwmon sysfs.
> >
> > As far as I could gather all OXP boards have the same DMI strings and
> > they are told appart by the boot cpu vendor (Intel/AMD).
> > Currently only AMD boards are supported.
> >
> > Fan control is provided via pwm interface in the range [0-255]. AMD
> > boards have [0-100] as range in the EC, the written value is scaled to
> > accommodate for that.
> >
> > Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> > ---
> > Rewritten the driver according to feedback, checkpatch passes, removed
> > unnecessary complexity and moved the driver to hwmon
> > ---
> >  drivers/hwmon/Kconfig       |  13 +-
> >  drivers/hwmon/Makefile      |   1 +
> >  drivers/hwmon/oxp-sensors.c | 278 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 291 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/hwmon/oxp-sensors.c
> >
> > [...]
> > diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> > new file mode 100644
> > index 000000000000..128fdf4c46e2
> > --- /dev/null
> > +++ b/drivers/hwmon/oxp-sensors.c
> > @@ -0,0 +1,278 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Platform driver for OXP Handhelds that expose fan reading and contr=
ol
> > + * via hwmon sysfs.
> > + *
> > + * All boards have the same DMI strings and they are told appart by th=
e
> > + * boot cpu vendor (Intel/AMD). Currently only AMD boards are supporte=
d
> > + * but the code is made to be simple to add other handheld boards in t=
he
> > + * future.
> > + * Fan control is provided via pwm interface in the range [0-255]. AMD
> > + * boards use [0-100] as range in the EC, the written value is scaled =
to
> > + * accommodate for that.
> > + *
> > + * PWM control is disabled by default, can be enabled via module param=
eter.
>
> As far as I can see this is not true anymore.

True. Will remove that. Also I found a typo on my registers that needs
to be fixed
>
> Also, have you checked if there is maybe a WMI interface for this?

There is not as far as I can tell. Even on Windows the fan control app
uses EC registers directly.

--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
