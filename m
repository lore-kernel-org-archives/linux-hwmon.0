Return-Path: <SRS0=Xc2u=X5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D03ECE58B
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 15:23:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C3812084D
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570202599;
	bh=fpWPXT8ggD/e+pn1BYIuXjDg5w4o0wtetCOExwO2jKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=sqgfN2bvRjnJCK5btJaHUhjqZypBj2NM0jL428Jzgqkgdwjy6OxnyJhSFx9gnSI2e
	 +JMW3TJqgetskmcs3pYkhKXZ0KD54gEiB8bnUQ+e5aIsf6RfwLAVspTzhKsHEH9iTg
	 HtS2qtkesA1q2AVBdnbKlOlAsuNBCjHZvhq7sh5E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389539AbfJDPXS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Oct 2019 11:23:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:57722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389591AbfJDPXR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Oct 2019 11:23:17 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1227B2133F;
        Fri,  4 Oct 2019 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570202596;
        bh=fpWPXT8ggD/e+pn1BYIuXjDg5w4o0wtetCOExwO2jKI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1HC8jaPP2G0MWAWxaAFL2+tq5ciAJ4x5mOg5CSEB8t19cEmbXeVfBzU87NzEzJYzU
         /Z91Kt7mxYJejs3+VaDuSOptlGlIevhRK1zWaCkW9zPUgRvyhZzxjiGmh7mKcoePT9
         drAO1mvoLrPQRMzwDU31x5pbXSxRgdfEwW1SGYRw=
Received: by mail-qt1-f176.google.com with SMTP id 3so9098238qta.1;
        Fri, 04 Oct 2019 08:23:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXSUdn19LnA+gvVYyJGm+dif/8LIaeRGUIF1pyZCbB5VdZYaHdB
        S+/lz17ghZtQt6pvBApR4swTmCuGFozzIjf8gg==
X-Google-Smtp-Source: APXvYqyMEEXcNS7O6u6Diqt8pCgl45a2tKKmM4tc+3EtuFfs+n4HBWeELngFdSwx5uOrLCiy+N5MR6jFrVyyPKoQlLc=
X-Received: by 2002:ac8:6982:: with SMTP id o2mr16440439qtq.143.1570202595162;
 Fri, 04 Oct 2019 08:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190924124945.491326-1-nuno.sa@analog.com> <20190924124945.491326-4-nuno.sa@analog.com>
 <20191002002331.GA17502@bogus> <a85b33d3cd24b4225e4be3a25221f9c56cdcca5c.camel@analog.com>
 <CAL_JsqJPFfUmOOQ-f_ibbTXdzgYxYMf2+7HCq2eBn_MkfRsdbQ@mail.gmail.com> <eec33c7156674770ca2f3033baed76c0e05a8587.camel@analog.com>
In-Reply-To: <eec33c7156674770ca2f3033baed76c0e05a8587.camel@analog.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 4 Oct 2019 10:23:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK6oC1VFb4ni9pn9a=sfxWK9pAmBBgajpZwad5udFkPoA@mail.gmail.com>
Message-ID: <CAL_JsqK6oC1VFb4ni9pn9a=sfxWK9pAmBBgajpZwad5udFkPoA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 4, 2019 at 9:59 AM Sa, Nuno <Nuno.Sa@analog.com> wrote:
>
> Hi Rob,
>
> Just wanted to clarify something which I don't know if is something I'm
> doing wrong or if it is some issue.
>
> On Wed, 2019-10-02 at 14:06 -0500, Rob Herring wrote:
> >
> > On Wed, Oct 2, 2019 at 10:09 AM Sa, Nuno <Nuno.Sa@analog.com> wrote:
> > > On Wed, 2019-10-02 at 09:19 -0500, Rob Herring wrote:
> > > > On Tue, Sep 24, 2019 at 02:49:45PM +0200, Nuno S=C3=A1 wrote:
> > > > > Document the LTC2947 device devicetree bindings.
> > > > >
> > > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > > ---
> > > > >  .../bindings/hwmon/adi,ltc2947.yaml           | 101
> > > > > ++++++++++++++++++
> > > > >  MAINTAINERS                                   |   1 +
> > > > >  2 files changed, 102 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > > > > b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..2ea0187421d4
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
> > > > > @@ -0,0 +1,101 @@
> > > >
> > > > Missing license. Please make new bindings (GPL-2.0-only OR BSD-2-
> > > > Clause)
> > >
> > > ack.
> > >
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > > http://devicetree.org/schemas/bindings/hwmon/adi,ltc2947.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Analog Devices LTC2947 high precision power and energy
> > > > > monitor
> > > > > +
> > > > > +maintainers:
> > > > > +  - Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > > +
> > > > > +description: |
> > > > > +  Analog Devices LTC2947 high precision power and energy
> > > > > monitor
> > > > > over SPI or I2C.
> > > > > +
> > > > > +
> > > > > https://www.analog.com/media/en/technical-documentation/data-shee=
ts/LTC2947.pdf
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - adi,ltc2947
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    description:
> > > > > +      The LTC2947 uses either a trimmed internal oscillator or
> > > > > an
> > > > > external clock
> > > > > +      as the time base for determining the integration period
> > > > > to
> > > > > represent time,
> > > > > +      charge and energy. When an external clock is used, this
> > > > > property must be
> > > > > +      set accordingly.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  adi,accumulator-ctl-pol:
> > > > > +    description:
> > > > > +      This property controls the polarity of current that is
> > > > > accumulated to
> > > > > +      calculate charge and energy so that, they can be only
> > > > > accumulated for
> > > > > +      positive current for example. Since there are two sets
> > > > > of
> > > > > registers for
> > > > > +      the accumulated values, this entry can also have two
> > > > > items
> > > > > which sets
> > > > > +      energy1/charge1 and energy2/charger2 respectively. Check
> > > > > table 12 of the
> > > > > +      datasheet for more information on the supported options.
> > > > > +    allOf:
> > > > > +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +      - enum: [0, 1, 2, 3]
> > > > > +      - minItems: 2
> > > > > +      - maxItems: 2
> > > > > +    default: [0, 0]
> > > >
> > > > This should be:
> > > >
> > > > allOf:
> > > >   - $ref: ...
> > > > items:
> > > >   enum: [0, 1, 2, 3]
> > > >   default: 0
> > > > minItems: 2
> > > > maxItems: 2
>
> When trying the above I get:
>
> "ltc2947@0: adi,accumulator-ctl-pol:0: [0, 1] is not valid under any of
> the given schemas"

Is dtschema up to date with the latest. I think I fixed this case
recently, though with the wonderful json-schema errors it is hard to
tell.

Rob
