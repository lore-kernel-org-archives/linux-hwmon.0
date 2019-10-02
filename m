Return-Path: <SRS0=dESa=X3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A7BC4360C
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 19:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEC03218DE
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570043176;
	bh=8sMo4FJfboakcK868/Hiy+nKIlOxxVLfCFn8JuRQTxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xeIUJskFU4YFBRgq+2iKOdEkDlvZW4p7F6VOUTvnRwDuJ6fXphnzLUmm/YjqvIQN4
	 xtgKVjIDV9j47BJi2geg90XNU5yLSEM5A5CN4TO09Wmq3vDF/sigECE3z3O0hyE5zI
	 GKw5vUHVBEUFE+l136rV5j/LHiy3LXeQtNiU016M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbfJBTGP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Oct 2019 15:06:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:34750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728979AbfJBTGP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Oct 2019 15:06:15 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B83B9222C0;
        Wed,  2 Oct 2019 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570043173;
        bh=8sMo4FJfboakcK868/Hiy+nKIlOxxVLfCFn8JuRQTxA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=liDCze7O2YwLXEO94UIjRrUz826pXyDkWV3SVv4RO9EsY+bu3qzZ0LRWRQE8D1egP
         f5VhggSpntyDP1ySr1PoDxz2Mq+tFpKK78y6FcctvY7B1FVkE2EsvxQtZbCWjI9zLa
         Uz7NkLmY5Mj2MvFzE0yYLL0dAPGt1a9x/UGo14Kw=
Received: by mail-qt1-f181.google.com with SMTP id c3so59222qtv.10;
        Wed, 02 Oct 2019 12:06:13 -0700 (PDT)
X-Gm-Message-State: APjAAAWLntryWmPGGnCpTWsKb+JsKiGEUzKfY1CJtmGPoji+7LGUa1VT
        gmEmQl1SI1hXR22zTx6723UBehApL2ZMcVEqKg==
X-Google-Smtp-Source: APXvYqyP/AkJgtrsX9gl2TGkwS1JLKrJIncGvW+nvBz1GMCbZV4b9uH9RP7xJaCQd5dNgn31KtV92hGdTzUoKoefvnA=
X-Received: by 2002:a05:6214:30c:: with SMTP id i12mr4557087qvu.135.1570043172759;
 Wed, 02 Oct 2019 12:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190924124945.491326-1-nuno.sa@analog.com> <20190924124945.491326-4-nuno.sa@analog.com>
 <20191002002331.GA17502@bogus> <a85b33d3cd24b4225e4be3a25221f9c56cdcca5c.camel@analog.com>
In-Reply-To: <a85b33d3cd24b4225e4be3a25221f9c56cdcca5c.camel@analog.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 2 Oct 2019 14:06:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJPFfUmOOQ-f_ibbTXdzgYxYMf2+7HCq2eBn_MkfRsdbQ@mail.gmail.com>
Message-ID: <CAL_JsqJPFfUmOOQ-f_ibbTXdzgYxYMf2+7HCq2eBn_MkfRsdbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 2, 2019 at 10:09 AM Sa, Nuno <Nuno.Sa@analog.com> wrote:
>
> On Wed, 2019-10-02 at 09:19 -0500, Rob Herring wrote:
> >
> > On Tue, Sep 24, 2019 at 02:49:45PM +0200, Nuno S=C3=A1 wrote:
> > > Document the LTC2947 device devicetree bindings.
> > >
> > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > ---
> > >  .../bindings/hwmon/adi,ltc2947.yaml           | 101
> > > ++++++++++++++++++
> > >  MAINTAINERS                                   |   1 +
> > >  2 files changed, 102 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > > b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > > new file mode 100644
> > > index 000000000000..2ea0187421d4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > > @@ -0,0 +1,101 @@
> >
> > Missing license. Please make new bindings (GPL-2.0-only OR BSD-2-
> > Clause)
>
> ack.
>
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/bindings/hwmon/adi,ltc2947.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Analog Devices LTC2947 high precision power and energy
> > > monitor
> > > +
> > > +maintainers:
> > > +  - Nuno S=C3=A1 <nuno.sa@analog.com>
> > > +
> > > +description: |
> > > +  Analog Devices LTC2947 high precision power and energy monitor
> > > over SPI or I2C.
> > > +
> > > +
> > > https://www.analog.com/media/en/technical-documentation/data-sheets/L=
TC2947.pdf
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - adi,ltc2947
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description:
> > > +      The LTC2947 uses either a trimmed internal oscillator or an
> > > external clock
> > > +      as the time base for determining the integration period to
> > > represent time,
> > > +      charge and energy. When an external clock is used, this
> > > property must be
> > > +      set accordingly.
> > > +    maxItems: 1
> > > +
> > > +  adi,accumulator-ctl-pol:
> > > +    description:
> > > +      This property controls the polarity of current that is
> > > accumulated to
> > > +      calculate charge and energy so that, they can be only
> > > accumulated for
> > > +      positive current for example. Since there are two sets of
> > > registers for
> > > +      the accumulated values, this entry can also have two items
> > > which sets
> > > +      energy1/charge1 and energy2/charger2 respectively. Check
> > > table 12 of the
> > > +      datasheet for more information on the supported options.
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +      - enum: [0, 1, 2, 3]
> > > +      - minItems: 2
> > > +      - maxItems: 2
> > > +    default: [0, 0]
> >
> > This should be:
> >
> > allOf:
> >   - $ref: ...
> > items:
> >   enum: [0, 1, 2, 3]
> >   default: 0
> > minItems: 2
> > maxItems: 2
>
> I was expecting this already. When upstreaming another device, I
> realized some errors with `make dt_binding_check` when evaluating the
> example. Just for my understanding, is this also incorrect?

The allOf structure like this also works. You'll get better error
messages if schemas are not under an allOf.

> allOf:
>   - $ref: /schemas/types.yaml#/definitions/uint32-array
>   - minItems: 2
>     maxItems: 2
>     items:
>       enum: [0, 1, 2, 3]
>     default: 0

However, 'default' needs to be indented under 'items'.

>
> I used a similar pattern in another device that is also waiting for
> review :).
> > > +
> > > +  adi,accumulation-deadband-microamp:
> > > +    description:
> > > +      This property controls the Accumulation Dead band which
> > > allows to set the
> > > +      level of current below which no accumulation takes place.
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > +      - maximum: 255
> >
> > maximum should be at same indent as allOf. Or default should be at
> > the
> > same level as maximum (under a single '-' list entry).
>
> So it should be?
>
> allOf:
>   - $ref: /schemas/types.yaml#/definitions/uint32
>   - maximum: 255
>     default: 0

Yes.
