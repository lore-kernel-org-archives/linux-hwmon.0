Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AFCC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 21:21:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D4B160F38
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 21:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhIUVXJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 17:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhIUVXI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 17:23:08 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A79C061575
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 14:21:39 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b20so3102149lfv.3
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F5/6yk3bA4ZtAQhszFbIeecMs6OvspCWgR3vbaET4+Q=;
        b=lLoRTNIwSbGGWZt6mWms0SyQCt8fR4wHbUp6H3PiG3lZ9P72e44etlAeaSl660sg7/
         LyWLs8/IhHfl2n4Djw6Ok/bomHtm+QRTRQBFyRBVTenWAshQ6T+vVU48J5Y6hIGjFUif
         NKCo8MiEN096dTUxmX0eAl+m98lKioMWCrJeLgPfBmYWv0pR0VxnftJ1lWQ9JYjPYfev
         nCZILIT9zi6lmtTtFTr45ujb+Guup0gN1iLijAVJjsOA7oi6MLc2ihZp6yYl+qPuKI9Q
         XsDpImY4J2JbfOwDu3vC1OBUDn4898VGnRiz9+P6lhaF32VutgGY7lmOSyGf431uZaLk
         auaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F5/6yk3bA4ZtAQhszFbIeecMs6OvspCWgR3vbaET4+Q=;
        b=HKmzuP7MiIyQEdQZmPGqO9XqeuJAxhDwJEYNvReITF2sUAcXMjJjVtZuSGqS3YfOrh
         ttpXELFD9jRnuKmHB8ESFnJDTtIrabqU80Dq17FIXeOh5CotCpZ0uo6UBQx0ASUaADiu
         KO4fLgEQ5SVNV0+bvbTaRI9eYGgi5v2nel7FgO+IX/dgMpvVv05itw7Ne6z1299Nvafx
         8vwI6ywXMWEStngfhYkSGb2SWaG5bkViM9iWNdot8TwxJnRNmI4wJ2rxgvjwnxSm7gQ1
         TlTizvAXwOatMGrpMaDzvT4SQVvjxAXgS+2AanmvbchWmwtiYbXST5InTz5u/55yr2j7
         Nmzg==
X-Gm-Message-State: AOAM533uYGrKMc2vdPnPGgjhsRjnOZg2RkAE4ZU3IRbelGPAqUTiHjKp
        La5LSv1JdVS+Uso6tpsqiovFm0mMjj75mM16G9Hg/A==
X-Google-Smtp-Source: ABdhPJyMdUbIh89MeY7Ny6Ll/yrl+HU+tUEAYTd6yW2P9M1xmauRxkyeoBdFZ1hL199mCvYLNrLhrYM4Q0/i+qUxKiQ=
X-Received: by 2002:a05:651c:1408:: with SMTP id u8mr6243341lje.253.1632259297056;
 Tue, 21 Sep 2021 14:21:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:507a:0:0:0:0 with HTTP; Tue, 21 Sep 2021 14:21:36
 -0700 (PDT)
In-Reply-To: <20210921205247.GA2363535@roeck-us.net>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org> <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com> <20210921205247.GA2363535@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Tue, 21 Sep 2021 17:21:36 -0400
Message-ID: <CABoTLcSt9TnmyC4uQOQU4Y563pF-Nhbt2NfZvK+c0FKwAJEMeQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for tmp421
To:     Guenter Roeck <linux@roeck-us.net>, rob@kernel.org
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 temperature-sensors {
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ltd {
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 statu=
s =3D "disabled";
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
> > > +
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtd1 {
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 statu=
s =3D "okay";
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =
=3D <4> /* thermistor */;
> >
> > 'type' is a bit generic. We don't want the same property name to
> > possibly have multiple definitions.
> >
> How about sensor-type ?

In the datasheet this is called "mode". I called it "type" since it's
tempX_type in sysfs and I wanted to stay in sync with that.

> > If it is how you address an instance of something which seems to be
> > the case here, then 'reg' should be used.
> >

The reason I didn't do that is because you'd effectively have to
duplicate the ID in both the name (e.g. sensor@1) and the reg property
(e.g. reg =3D <1>). But maybe that's just what is is in device tree, I
can live with that.

However, we'd also have to find out whether the "local" sensor ("LTD")
would simply be #4, as it is in sysfs today. I'd also be ok with that
as it would keep sysfs and device tree "in sync" wrt. naming.

Thanks
Oskar.
