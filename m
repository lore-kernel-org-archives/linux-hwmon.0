Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5113C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Nov 2022 12:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiKDMs3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Nov 2022 08:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbiKDMs1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Nov 2022 08:48:27 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEA5DF97;
        Fri,  4 Nov 2022 05:48:26 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-367b8adf788so42555167b3.2;
        Fri, 04 Nov 2022 05:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAEPaRwFypxZOPVMvDRHtSG95hS1NYvI8n0PkQ8emd0=;
        b=ddnsRgJIQDq2Zpk8f2PquKZSyfwjUiOwYWofmdXvxfh6XYo1r9FWRUftcsgNtzOriX
         FLpU7YEqzcnrM2lfahCdSN7Q6TzBN4WVodkn+R+rg1DLIPbZfe9myxWZ5tJD8uDCMYKE
         29Q9i6MOyiqd4qYFsmqayOJVzbYEmazPb+NkpJbXh0Zk5CuBDSPDdmwaSs2ALQrw/kSr
         x7CPxPiiC67JBq1w4M/L1MXc2O8rsboGhPEJm+868lDxeyZ9BOcmtpJzrJE2Il019cS+
         mzaXX79KM5R/n8IogMGkKjYjKCJ80mf11dlPen/ZBWGYb0wHje9McTDmg6JEJy1RvMAa
         ydjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAEPaRwFypxZOPVMvDRHtSG95hS1NYvI8n0PkQ8emd0=;
        b=v7MVVgbwmCDxicrgJLvItKsy0A9jq7pNs8C1pKZ16J2gM7gxDXT9W6xk0tjjNJsptb
         DgPUx1dY5ViJIJ5o7IhJKWlKwn0qjetA5u/1sXmC0BQtQuKxQeB+h8sxbNYstSkZN2Nv
         wbzYshMNtGP3KXbW8AVhWtT9tHd576FX4tLQ6FKy5DKzlhyfJBMT6k14rDZUPLKs7EuA
         NdqnFNSsi7mK4z6NZ1RXuswlmTsClLYar1OCqs0mP1AO/oo2g9lBtQAMjZPvjUvtrdGq
         FlI9taDNEldNDc1s2gm3NjLM6gE3l6fmNGBnigtBdS5oKcYRJiLziJI2gDcnQf5l6a/2
         XYDQ==
X-Gm-Message-State: ACrzQf0zl1QBzt+Wl3Yiwyva49zAHN1CFEVxwc+hYoWOi/lXUScux8oc
        /bCKG9TOJVbn9s4Ct8mysO300sMr8QHQRCPXk1WcDQLPIps=
X-Google-Smtp-Source: AMsMyM7NyqR0Ywas9s0Up7GI0fF8A02EjlDfdy9uOG2w1ZMYcdRQQeK+ZnLvq4wejQ9gZ+yGtNLOjj/y0nbZANUakp4=
X-Received: by 2002:a81:130a:0:b0:360:9739:82be with SMTP id
 10-20020a81130a000000b00360973982bemr34324363ywt.69.1667566105779; Fri, 04
 Nov 2022 05:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221102150440.208228-1-samsagax@gmail.com> <20221102180430.GC2913353@roeck-us.net>
 <CABgtM3jXVTjxEJXmCXG+z_DGaHAkFFVjZBa2bOCbeqFveesWrA@mail.gmail.com>
 <20221102204407.GA2089083@roeck-us.net> <CABgtM3jaV+jy3PYcCi3o1ij1igk4S7dWTF=QM=rN2acaGLQ_JA@mail.gmail.com>
 <20221103011518.GA2109645@roeck-us.net>
In-Reply-To: <20221103011518.GA2109645@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Fri, 4 Nov 2022 09:48:14 -0300
Message-ID: <CABgtM3gQ3RpnxLL8kC_gZH6=ahH69BbMpQNocvtJVcK8VU2dLw@mail.gmail.com>
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

El mi=C3=A9, 2 nov 2022 a la(s) 22:15, Guenter Roeck (linux@roeck-us.net) e=
scribi=C3=B3:
>
> On Wed, Nov 02, 2022 at 06:10:37PM -0300, Joaquin Aramendia wrote:
> > > >
> > > > Oops. Is not really needed but I'll add them.
> > > >
> > > Technically you are correct, but we would have static analyzers screa=
m at
> > > us, and it is against kernel coding style. There is a practical reaso=
n
> > > for that: Missing break statements are often the result of coding err=
ors.
> > >
> > > Guenter
> >
> > Great, thanks for the clarification.
> >
> > As for my last statement, module_platform_driver() usage broke the
> > module, don't know why, but seems like the probe function is not run?
> > If you are ok with it, I'll revert to module_init/module_exit macros.
> >
> Go ahead, just add a comment to the driver. Mabe someone manages
> to sort it out.
>
> Thanks,
> Guenter

Will add that comment, rebase and submit again the patch.
Thanks for your time, Guenter. And sorry If I got on your nerves :)

--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
