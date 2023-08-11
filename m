Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C50C0015E
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Aug 2023 14:04:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjHKOE5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Aug 2023 10:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbjHKOE4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Aug 2023 10:04:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6E710E4
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 07:04:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69924611E0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 14:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9DBC433C9
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691762694;
        bh=W/hZm/fFVRB9lNf80o1hKKn9jZegslzn0qOeeMP78Fc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=atKC1ZjLfXD9QDwSLk4g5N885atihphfU69yAdQPe48X0twJuCMP2b5DdITa1Lx0g
         edYf18vOm3RdML9ZjyC6cMYapRC48T3uVHGb+SP4RKOQWMdOb2xGiM4KFyQ/YkvcPm
         wxQ5WnHuUBHQkaTuDzjfpMMtadfur7zJQAQda07ZwvTRRoFYG0yEWMQALHZMS2wUtX
         Euv7dVQh7u6ZEJ+NEf0/0kbq62IbiWFZ5wQWHW/CrgTQUtZkSJyt+/PpKeRtGYd4ka
         th5/cVS/lfHYf/wU//V/+hL2/jj3Gtn1BVyOMmCHEm1YOPt/WQ6GL3a2GedUv8tNy3
         B7XSdxPOgD/Bw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso31076981fa.1
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 07:04:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy/PcGWEpe2gW6XiSvY1mxETM8yGIs7KUBAlLZUJRBigy+ZWZdU
        sDy8qZBqEvTzGNuzhi7w85d0FjeP4ZfjUtBPdw==
X-Google-Smtp-Source: AGHT+IHkNCKSPZR2ysNY0kEdBznUUUAMouIQbN8MDHD2tpl4kIlU1Y7QdqlODNN9TSBWJDx5bGqfTASUTuu5RjZjggs=
X-Received: by 2002:a2e:7a19:0:b0:2b9:dfd0:c3d5 with SMTP id
 v25-20020a2e7a19000000b002b9dfd0c3d5mr1678485ljc.46.1691762692877; Fri, 11
 Aug 2023 07:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230811083222.15978-1-lothar.felten@gmail.com>
 <20230811083222.15978-2-lothar.felten@gmail.com> <81ec50bf-236a-3010-95db-a7efac4b3570@roeck-us.net>
In-Reply-To: <81ec50bf-236a-3010-95db-a7efac4b3570@roeck-us.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 11 Aug 2023 08:04:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLge-PT3DgM0m5acOApScA46syHxqAKV_O9NVL-JXgU6g@mail.gmail.com>
Message-ID: <CAL_JsqLge-PT3DgM0m5acOApScA46syHxqAKV_O9NVL-JXgU6g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: hwmon: add adi,ltc4271
To:     Guenter Roeck <linux@roeck-us.net>,
        Lothar Felten <lothar.felten@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Aug 11, 2023 at 7:24=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 8/11/23 01:32, Lothar Felten wrote:
> > Add dt-bindings for Analog Devices LTC4271 PoE PSE.
> >
> > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> > ---
> >   .../bindings/hwmon/adi,ltc4271.example.dts    | 28 ++++++++++
> >   .../bindings/hwmon/adi,ltc4271.yaml           | 51 ++++++++++++++++++=
+
> >   MAINTAINERS                                   |  1 +
> >   3 files changed, 80 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc427=
1.example.dts
> >   create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc427=
1.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4271.exampl=
e.dts b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
> > new file mode 100644
> > index 000000000..829f7c5a9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4271.example.dts
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +/dts-v1/;
> > +/plugin/; // silence any missing phandle references
> > +
> > +/{
> > +     compatible =3D "foo";
> > +model =3D "foo";
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <1>;
> > +
> > +     example-0 {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +
> > +             i2c {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     ltc4271@20 {
> > +                             compatible =3D "adi,ltc4271";
> > +                             reg =3D <0x20>;
> > +                             shunt-resistor-micro-ohms =3D <250000>;
> > +                     };
> > +             };
> > +
> > +     };
> > +};
> > +
>
> Is that something new ? I don't recall seeing similar .example files.

That's the intermediate file with the extracted example.

Please use get_maintainers.pl and send your patches to the
lists/people it gives you.

Rob
