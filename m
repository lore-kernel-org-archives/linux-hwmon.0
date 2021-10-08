Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C097C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 19:18:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 580596054E
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 19:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhJHTU0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 15:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231342AbhJHTUW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 8 Oct 2021 15:20:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0504861100;
        Fri,  8 Oct 2021 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633720707;
        bh=IC9kNsRFIBO+K8d9i6+XTu+7i8NQDKUt9EGCz3dsmac=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BpP1jk6pQ92wMYrNJJz//UzDyIl7KDMW06pY0T2+/sdPu5gjz3r73bfN9q2cGyrEQ
         sud2KOsGrgUNoR+N9Oc0h826ZN50zQ5NZ6LS+kD/CVsBx5SuhiIjyW3a97uWncfgZb
         QnZ391AKNF/jjq6BkhcO2ic6Ln9+QmkBu54kb7ENA7k6LNx73/7h4D7gMPH2zflUzo
         rrRNqzd125lCTk9JTFmb6OKgo/WcAjTN52Ku54KyF4PSoAwPjhHVpk/LZovW05yPey
         F55WwmujVXSf3MqWRnT5PZiNORb9kZ5bAXVErrBJjsIMF/OzhdMYM7EyvwyukXf/hd
         DVPpj7BxaNtOA==
Received: by mail-ed1-f44.google.com with SMTP id d9so16172839edh.5;
        Fri, 08 Oct 2021 12:18:26 -0700 (PDT)
X-Gm-Message-State: AOAM5308/AY7MxLU7MtVSBXUGHvyV3tpa4Rtgby4gfxEPdv3zOegaOcj
        eaDW5LDz74BRn3UhB+z52Vohc86DjQxxH5pKMg==
X-Google-Smtp-Source: ABdhPJxqow2M5nj6LodviTLlbfFr4zL57L7+Vcp4BPJ43DFWyfStrDXyuWmCoFsVAuWT7QiI7UzLZynfXN+8NRHIZ5E=
X-Received: by 2002:a05:6402:27d2:: with SMTP id c18mr8725154ede.271.1633720705455;
 Fri, 08 Oct 2021 12:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002142219.GC34532@roeck-us.net> <YVqu92dUgNKlYMlG@localhost.localdomain>
 <20211005141457.GB2395636@roeck-us.net> <YV4NUqf7ey5Yr55P@robh.at.kernel.org>
 <YV6m8MRa4+lKOWTp@localhost.localdomain> <18a5d5c9-2885-68da-256b-7ae1c3b95819@roeck-us.net>
In-Reply-To: <18a5d5c9-2885-68da-256b-7ae1c3b95819@roeck-us.net>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 8 Oct 2021 14:18:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJP2yX1YoJP00+DK1S=p3TXKVhjvproKsJZtDQQ_6L5Fg@mail.gmail.com>
Message-ID: <CAL_JsqJP2yX1YoJP00+DK1S=p3TXKVhjvproKsJZtDQQ_6L5Fg@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 8, 2021 at 9:33 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/7/21 12:51 AM, Krzysztof Adamski wrote:
> > Dnia Wed, Oct 06, 2021 at 03:55:46PM -0500, Rob Herring napisa=C5=82(a)=
:
> >>>
> >>>     input@0 {
> >>>         reg =3D <0>;
> >>>         label =3D "output voltage";
> >>>     };
> >>>
> >>> Anyway, maybe Rob has an idea how to name this properly.
> >>
> >> No, I don't have a sense of the range of h/w...
> >
> > I feel like we are stuck. Rob does not have a sense of the range of the
> > h/w and Guenter does not have a sense of the DeviceTree idioms. How can
> > we solve that?
> >
>
> That is why I am asking questions. It doesn't mean we are stuck.
>
> > Could we, maybe, just focus on this typical, simplified, case I have fo=
r
> > now - a sensor with several channels of known, same type (temperature)?
> > We clearly are unable handle all possible cases here, for now.
> >
> > Does this look sane for that usecase or what would you, Rob, change?
> >
> > sensor@4c {
> >    compatible =3D "ti,tmp422";
> >    reg =3D <0x4c>;
> >    #address-cells =3D <1>;
> >    #size-cells =3D <0>;
> >
> >    input@0 {
> >      reg =3D <0x0>;
> >      ti,n-factor =3D <0x1>;
> >      label =3D "local";
> >    };
> >
> >    input@1 {
> >      reg =3D <0x1>;
> >      ti,n-factor =3D <0x0>;
> >      label =3D "somelabel";
> >    };
> >
> >    input@2 {
> >      reg =3D <0x2>;
> >      status =3D "disabled";
> >    };
> > };
> >
> > There were some doubts whether "input" makes sense here.  I still think
> > it doas as even in HWMON subsystem, we have "hwmon_temp_input" and
> > HWMON_T_INPUT, so a temperature channel _is_ an input.  Of course I can
> > change it to "temperature" or "channel", just tell me which one is
> > accepted.
> >
>
> I'd be fine with "channel" or "sensor". Both would be generic.

'channel' aligns with multi-channel ADC node naming, so that's fine for me.

Rob
