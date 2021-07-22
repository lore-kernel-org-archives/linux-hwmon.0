Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AEEC6377D
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 09:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D38E5610D2
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 09:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhGVIyX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jul 2021 04:54:23 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42237 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230232AbhGVIyX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jul 2021 04:54:23 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 934A25816EA;
        Thu, 22 Jul 2021 05:34:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 22 Jul 2021 05:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=8
        y0zRQbruxumYDBEGoO0So5HhtW4nXa/vBkFW73KMCs=; b=NS3kdV8NH28cZH6TL
        qcMWJWI/pvX6CQRqFEeFyrQ171Nmqz56GZxC9iG6rSFNXsL++BjJl5kWcqVyVKAr
        z/4c7w2ah84USoTeTHQJg47D2GdpSztZwtXE/XcJWcUKbxwb1KWrYYOje+IxlEo1
        IPgSHMlXpZDWRWeYytLpLoEq4dsmJkpPvOriJvCI9BT8yYPaLZ//a2SoxHojxH5o
        XseBFsaELm6qTPoYjW0evokPaBIEjJhKSBVu/TgzL8LnzdnFPF98m8vWKz27jAe/
        2Wzv165j/1ppVQOIGGSKTgMnF8XyCJxsvj7ePvMKTLVWwa1EMdVYd4ubQLbWKvrC
        u6YhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=8y0zRQbruxumYDBEGoO0So5HhtW4nXa/vBkFW73KM
        Cs=; b=CypnoWG+pHCaku9z9mgZSO9LrvyY7WmJ/wu5QZ1YH12iKJ8itFb1BXMzb
        VYxWmwYYW2OoQzDNMrlvZ5bZiLVk3LwnOILWH8o8rejr3Iz2DLasa7gYs6vi9qqF
        MvZSAZKHWlsTy2QmDYzgbmGJKSHhJusBG9ydUyD5OobHtEkrcwpU6gPLBdWJIfS1
        5PEb3JT/mIvYGZmaKXrPbdNYJjm9AllgK/0sQi0+jm6Q1P1mnc/FJcoWJgC5ulCK
        mvFmDmajNaG+xNupebmnRIyTyZdnzAXlIRABXZGfTT9gRwAxSTOI4N+BZgdeZYd3
        Vp0Umg1xCQLrTSD2tvOXG73wdsapw==
X-ME-Sender: <xms:wDv5YAZdwATZe3t1ZV2eTPN29c65GT1d5Jap8umRKifzmb6fiPJjtg>
    <xme:wDv5YLYb-RZPvr_nbfUU96Wvn3rpkSeqhLI2k-xYI8eKYKfxHA05yaNOuLjWyRIgb
    z0OfdjKPY1cPAHB5lE>
X-ME-Received: <xmr:wDv5YK-oHu7vYXX2JK66ds30VXLLJi9A4VZk3WPN1KUZduTTWyzKz1-48Gz1VxoT1GlmEf91mP9gI4pQIX7IuASh1jnBRO3_HMEr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeigdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfekheefieeitddtudegteeftdekudelieefffeljeegfeffvdegiedvtedt
    tdejnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
    gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wDv5YKp40nbiv7wUtJdtFR5IarqkTZAt-q0nh2yeLJaS-EMJ0MUi2Q>
    <xmx:wDv5YLrgAZVfEeTIL9Ttg7wVYDvJe-Kn7MTozUjORhMw0NK-3oOr0w>
    <xmx:wDv5YIRnEhoUzD4NSFLEX0ae6ZzLCBjGNqKQOU-j4wEg1c9A1e_hNQ>
    <xmx:wTv5YIgV6v1CSLlTAS6hprpMPXCV2Oe7h01zs6dzYZ3sLoJwKXBKQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 05:34:56 -0400 (EDT)
Date:   Thu, 22 Jul 2021 11:34:53 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 14/54] dt-bindings: hwmon: Add IIO HWMON binding
Message-ID: <20210722093453.2jltinepdphrajed@gilmour>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-15-maxime@cerno.tech>
 <20210722102027.000035a5@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722102027.000035a5@Huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Jonathan,

On Thu, Jul 22, 2021 at 10:20:27AM +0100, Jonathan Cameron wrote:
> On Wed, 21 Jul 2021 16:03:44 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > Even though we had the iio-hwmon driver for some time and a number of
> > boards using it already, we never had a binding for it. Let's add it
> > based on what the driver expects and the boards are providing.
> >=20
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Jean Delvare <jdelvare@suse.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: linux-hwmon@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../devicetree/bindings/hwmon/iio-hwmon.yaml  | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/iio-hwmon.y=
aml
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml b/D=
ocumentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> > new file mode 100644
> > index 000000000000..49dd40f663a6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> > @@ -0,0 +1,37 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/hwmon/iio-hwmon.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: ADC-attached Hardware Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Jonathan Cameron <jic23@kernel.org>
>=20
> I'd like to share the blame for this one.  Binding was originally added
> by Guenter.
>=20
> https://lore.kernel.org/linux-iio/1359668588-13678-4-git-send-email-linux=
@roeck-us.net/
> https://lore.kernel.org/linux-iio/1359668588-13678-11-git-send-email-linu=
x@roeck-us.net/
> :)
>=20
> As bindings go this one has always been controversial because
> it's mapping between linux subsystems rather than really describing
> hardware.  We've had various discussions over the years on how to do
> this differently, but perhaps just documenting the current state is the
> way to go.  That doesn't stop us moving to something better in the
> future.

There's DT using it already, so I guess it's a bit too late to have that
discussion indeed :)

> > +
> > +description: >
> > +  Bindings for hardware monitoring devices connected to ADC controllers
> > +  supporting the Industrial I/O bindings.
> > +
> > +properties:
> > +  compatible:
> > +    const: iio-hwmon
> > +
> > +  io-channels:
> > +    minItems: 1
> > +    maxItems: 1024
>=20
> Why 1024?

Ought to be enough for anyone :)

We have to set a maximum and I couldn't find any actual maximum
documented, if you prefer another value let me know

Maxime
