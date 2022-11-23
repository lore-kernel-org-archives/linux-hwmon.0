Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417D1C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Nov 2022 21:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbiKWVPO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Nov 2022 16:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiKWVPN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2022 16:15:13 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAA099EA2;
        Wed, 23 Nov 2022 13:15:12 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3a4c2c83300so90680237b3.13;
        Wed, 23 Nov 2022 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNzSaNWKzCvqjSV6/7MnFEiI66UOQhTq7qtIvSZpSdE=;
        b=ab5irNWeBEPBvhWEE7KLuv+OcU1j+C+N2SJprxcjGxB3ebOKx/WiNfZt8yI1Yb9h3U
         NxSUGn18InN2yOVwXD3Eo7T8W0rbTF9lsizlrEllo0yicxMc0XwiTKHio4Ym2K65cA2i
         u4Cd63lSW6qMNiMHcqQJmopD3Uj4nBb8mD+E/cwCjYdoQfmd2ZMKIbsL6ndk8GywVNaa
         1XZiUO38jh1ZaOJoV87gW4yCuSm3bHTQbiS1HB3CjLLSE5t5zjepK/Z2KYYUxNNm87zH
         VCcf4KxPyDVyh+FieOL8vdkZiyzt1wJQ83MuA/SIDqWVDLRGDC0QRkv7DRI05/JTwwEs
         Pyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNzSaNWKzCvqjSV6/7MnFEiI66UOQhTq7qtIvSZpSdE=;
        b=vMgs5KmKxIaPv5VmrvktY6VqOCHzJO3o3tokF95i2HZv4DRGTDE781UiRiSxN8X2+l
         Hi7QEVm+t1+ch+GJlGP9GHPQhD7mSkkl2mr7Itfs/RVBcU+m/rQ2rCV+tFNJXggmf1aj
         VrUn/2jPOzphGFMe448UjyoaMp+ZlDmY1X/aZvJx0BHNRdvYS7tup9CagOjyqOqPtLNH
         zw46Fn0rxJj1yrihOriXSKHxNmoxuU3eWOuwruyU58iBq2znnpaDLz0Y7RyREvyCODE9
         sVL1a7Un5g0TcEqFL7QeLcK9mElTAIlvj9T8mXknftC2fHmA25bwa82ltTZAjoLEQRhi
         92YA==
X-Gm-Message-State: ANoB5pkN/jO0bBQeFsAxztkEyh6iCbcerJUVAaSCX47ZG6TtvqPkwyp6
        KFf9n9sSndcQKe5tKhj13RsDKekr+XVGqYyFklTnjzhcWSg=
X-Google-Smtp-Source: AA0mqf78BLoJM0EN7+QQxprIQfWSzgWV2siKH6tQWKerUmhg1mHTB/Dz+fbaFy4ay9ZvHqMvBHjEbDGPL/WxSWtEMm8=
X-Received: by 2002:a05:690c:38d:b0:3b3:bcb7:7423 with SMTP id
 bh13-20020a05690c038d00b003b3bcb77423mr1426714ywb.341.1669238112139; Wed, 23
 Nov 2022 13:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20221119162347.36698-1-samsagax@gmail.com> <20221120134650.GA1787156@roeck-us.net>
 <CABgtM3g+g9PSXaTxaywJLQ18Y7pZybeDDrvycN-KzCczZ_0UPg@mail.gmail.com> <20221123162220.GA3019010@roeck-us.net>
In-Reply-To: <20221123162220.GA3019010@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Wed, 23 Nov 2022 18:15:01 -0300
Message-ID: <CABgtM3j-V-z1o+-q3AjZRDH99Uo1NWmtJ2KaNp8=S6uhOm+PrQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (oxp-sensors) Add AOK ZOE and Mini PRO
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     w_armin@gmx.de, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

El mi=C3=A9, 23 nov 2022 a la(s) 13:22, Guenter Roeck (linux@roeck-us.net) =
escribi=C3=B3:
>
> On Sun, Nov 20, 2022 at 10:01:09PM -0300, Joaquin Aramendia wrote:
> > El dom, 20 nov 2022 a la(s) 10:46, Guenter Roeck (linux@roeck-us.net) e=
scribi=C3=B3:
> > >
> > > On Sat, Nov 19, 2022 at 01:23:48PM -0300, Joaqu=C3=ADn Ignacio Aramen=
d=C3=ADa wrote:
> > > > Add support for the AOK ZOE A1 and OXP Mini PRO handheld devices.
> > > > DMI strings are added to this driver since the same EC layout is us=
ed and
> > > > has similar specs as the OXP mini AMD.
> > > >
> > > > The added devices are:
> > > > - OneXPlayer mini PRO (AMD 6800U)
> > > > - AOK ZOE A1 (AMD 5800U)
> > > >
> > > > Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.=
com>
> > >
> > > Applied to hwmon-next.
> > >
> > > Thanks,
> > > Guenter
> >
> > Oh, great! Thanks Guenter. I just realized I made a typo in the commit
> > message. Would you mind if I correct it and resend a v2 of the patch?
>
> I don't mind, but I don't see the typo. What is it ?
>

The AOK ZOE A1 has a 6800U APU. Also there is an unhelpful info
message I should get rid of in init function. Will be sending v2
shortly.

> Guenter
>
> > --
> > Joaqu=C3=ADn I. Aramend=C3=ADa



--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
