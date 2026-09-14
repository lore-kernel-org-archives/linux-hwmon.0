Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FF416870
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377196; cv=pass; b=Az6LWO7hzlZ3uEwi5+mFZsEs7XNYH0Pf8m9yQz/86wl0/La4N2hRU3Ovg0S+Z4RHU2iSNiLic/p/QGHJUNOYqakaegvcE7836ffArzacxKQjDkc8gCoD1rlh7qzlaMRLcuBoRgG6kFzR3FmSGjQvBnxBl6iBNYrHshKKHE9VbAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377196; c=relaxed/simple;
	bh=D0ETO3SqBIk5IEsQo2JSdEPccv7vE73Bpl//dCwOus0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pq6ivnNNTUjY/JFZwv0SehBpnn/fFX96KXb4WLlUnD4qS3xTaKCFePuLoooNctwQ0UF0tkRWxcVVlZ+8dfi0W4VuSl3f0cpPSM2RVofnsJKzB/7Vcj9Yy2kT+VJO0diAo6SlcTSPIc0eaus6u0SFOkKFcGJIysR5CB+K5CHe8Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a44EaHOY; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a44EaHOY"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so658535e0c.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 02:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377192; cv=none;
        d=google.com; s=arc-20260327;
        b=idVLk1/BrgHGVAiAj0HBZsTY2LVUJf+uuraiVHDXYlgksiIparSrB2RyA7gPSpSPx+
         k4c+dy6uVCQnEKuMuPObOz4aCObj75oGrYQhwOP7xBicMsj+pwMXmMezultZaVz/+fKo
         oade2swkT6hBaea50IRYYX4bVMA9AvpHeXzvfdf7KoKSrUEKiDarCV+P1/GkZUCH2WJw
         8wCWsetVW4vSuavx28bafuleXkRl0bqJEiXb9+apR8MDqKUwKS7XYctZbDkB2Inrf15J
         AjewiUDZtfrpWn667I8F4/k6dvBxdVbaD2tXg1c6CEiE+G2XNJiUlgLC8WgKek/kX6EV
         jfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=90wLJtIH8D6NqZbM7cbSxaSLh9rpnBcykDOp7L+Vb/Q=;
        fh=Ttf2KqJYlEOOADsYbBYanBYnDJ+DlnLDY2PFunCwk38=;
        b=Bx5q7dFV1X0kHZo+awZFJIv4a5TTfWKWUYAhzOX26w2LWOdwisiavtXFtOFwgO8LXw
         K+7DrG71Ezbf2NCif00wM88iW14ouWH/FYfeqv5r3HWz4+bjAR7HO/PJPSXOFPm80SOQ
         EnxcM4ArV31mt01QOjRSssLn7vTFyXXW2CoNHHwntCIwS1Pq7PbVM8opXd2VXv1R2PNM
         98JYR3QGorFkRFzNpwQix9qyPFotHju/r347YqwBxp2HNnfjxG0MbP+4W/eBTfeb+f6Y
         HR7sQLgxtTGTgEQPvCbZ8PqagNw5FaSJ3nc3O/E8qdEUXpwnkSE/9Gy48GQUYzLpJEVx
         jWmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377192; x=1789981992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=90wLJtIH8D6NqZbM7cbSxaSLh9rpnBcykDOp7L+Vb/Q=;
        b=a44EaHOY/yGS3KEXREdXtZRfn2Dg+B1TQVd7Hny41FZm7bZkKhrtyk888LGM1vjTho
         a7z0Ehv7nP9dIDWe8FBqNwH97/v1iRudLK97unaU1qMkcyI4xuRS5T3rSQYDmjThhC46
         IhRDEdR7pJU7KKtv6NLqyuMcXPF8tNB41PeyAXBB7wJ1MGTnvLusEIx1C/LTzuxkMzrt
         ZHQQWyIOsd4ZzvaqOFnlhmyeEcGoZD3GnlsM0TLPs5xeZWN2bva8+QrrC2AA5jQyjCIt
         plCYnMt+huQGmy7gFf0n6eOHit/bo268NM1z1DraDMPn06HxSMRAqxyS2+ozgss5hz35
         bNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377192; x=1789981992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90wLJtIH8D6NqZbM7cbSxaSLh9rpnBcykDOp7L+Vb/Q=;
        b=iOYJ01w/bE4wBe061oZu9ZP9hONlXPBWKwRd13iNCnAupbpNbg77Ya5KZs2nSvqrV7
         qBEJNAgWQciIhzwAQSKJ2yHFJZiLsJPD5Dn4xB/dy3lT7BEBC8X7QaSjRACGmyKxrPUk
         ynYFHbglqwEv7ngJVp9PLn4PZg9oMb1bWrDH74E6ge0UMZtOsg68X69p1v+nWuTods+V
         nbmp5XlrGIcAgjceqsGLVd6C7YaAK69K1nXEvZZbDu5bL7BxwoXUS3WmFeVz6QaWwS6z
         YNfTGiDMEQGV0E/pxso+T/GAgjhJzpP7fvTxteDPDiDvzLUYPD2aEO98XXVcW9JN4kOH
         Pfqw==
X-Forwarded-Encrypted: i=1; AKwUvBwCz8oGA7s2rnWsKvGV71EXI60C8ErlFcsQeR9V0Vg7irVrDLg3npDfH1Iem9khHAa0n/X5HYNOaNQpvw==@vger.kernel.org
X-Gm-Message-State: AFuF++l/ypVCigQE/YEEC5eOXywSj6NQ8lc342CQMtX2WxxcjJbVjoko
	aUnLDKO6Nv4HI/IjIEpHHGytv08efpqS3XRhTQo/3XvBi1PCbdWHKGtHR91kRdcleLF4/5uxuOT
	kbc9kkX5YVwSr7VQplCmtHb9fZv+4W38=
X-Gm-Gg: AYBFou28D6eI9n7hlOl4eGpg+Eghuahiycx3RxYptQNSgOw20Z5qNxHGVHZ+vAtH0KX
	m3ezoI0OlwXjQaMIViln9ToQdYJkexrSaW/G339qYVuP6jZP1ivBukd9UBCDFUpZ4ZzCQoV69Rq
	PkorlQoDG4jOajCMmAzAwsEuvtWMhBscUH+h6IdgaocFQ5XtcKV1FmkMA0agEEUi6AI4Kro0lHk
	dKypF4BUdctFsuImmx3+iJ0WjEfcNFWCmcWfPDcigierEwlaJxT6ZviTKMJx5gQ3XV+pbA0Qvwg
	NlLahHGh6Ooz10zIyfajfy23XXnZgd7lPl/56SGtgZEMYmzi2LXr5FkpX4jYMDvG+NpI
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id
 ada2fe7eead31-79bff9f793bmr208309137.0.1789377191635; Mon, 14 Sep 2026
 02:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com> <aqKTZCPto32Ur-CI@squawk>
In-Reply-To: <aqKTZCPto32Ur-CI@squawk>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 17:12:59 +0800
X-Gm-Features: AcwNN1V3y04gKXhBe5aO1nN-tlGDTBMqVkzX7yFfo0GoWFMUVZQ3mu1iCsjMyMw
Message-ID: <CAPBH0A-voEks+jygGaBErgFwqNMuk6QnO9PPiYzrRLKVua0mGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Sep 10, 2026 at 02:18:55PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 87 ++++++++++++++=
++++++++
> >  1 file changed, 87 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..28e6ff9d9d9c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> > +
> > +maintainers:
> > +  - Colin Huang <u8813345@gmail.com>
> > +
> > +description: |
> > +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchrono=
us
> > +  buck regulator with a PMBus interface designed for industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/row/public/documents/24/49/infineon-tda3874=
0-tda38725-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: infineon,tda38740
> > +      - const: infineon,tda38725
> > +    description: |
> > +      The Infineon TDA38740 and TDA38725 share the same PMBus programm=
ing
> > +      model. Use infineon,tda38740 as the preferred compatible string;
> > +      infineon,tda38725 is kept as a compatibility alias.
>
> This is not how this should be done. Instead, tda38725 should list
> tda38740 as a fallback compatible. Take a look at the example schema for
> how this can be done.
> Otherwise, this looks okay to me.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Hi Conor,
Thanks for review and explanation.
I misunderstood the intended use of fallback compatible.
My v4 proposal was not correct approach.
```v4 used:
 compatible:
   enum:
     - infineon,tda38725
     - infineon,tda38740
```

I plan to change it and examples to:
```
  compatible:
    oneOf:
      - const: infineon,tda38740
      - items:
          - const: infineon,tda38725
          - const: infineon,tda38740

examples:
  - |
    i2c {
        #address-cells =3D <1>;
        #size-cells =3D <0>;

        regulator@40 {
            compatible =3D "infineon,tda38725",
                         "infineon,tda38740";
            reg =3D <0x40>;
        };
    };

```
Is this what you had in mind?

BR,
Colin Huang

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,vout-scale-micro:
> > +    description: |
> > +      Scaling factor applied to READ_VOUT telemetry.
> > +
> > +      TDA38740/25 pin strap parts are available in two flavors of
> > +      VOUT_SCALE_LOOP: 1:1 and 1:2.
> > +
> > +      For the 1:1 VOUT_SCALE_LOOP version, output voltage sense pins a=
re
> > +      directly connected to the output, and no resistor divider is use=
d.
> > +
> > +      For the 1:2 version, a resistor divider is typically used (for e=
xample,
> > +      499 ohms for both top and bottom resistors).
> > +
> > +      In some designs, users intentionally modify the feedback divider=
 ratio
> > +      to obtain an output voltage different from the internally config=
ured
> > +      VBOOT or VOUT value.
> > +
> > +      In such cases, the device telemetry (READ_VOUT) continues to rep=
ort
> > +      the internally programmed voltage and does not reflect the actua=
l
> > +      externally adjusted output voltage.
> > +
> > +      This property provides a multiplier to scale the reported teleme=
try
> > +      value so that the monitoring system reflects the actual output v=
oltage.
> > +
> > +      The value shall be expressed in micro units where 1,000,000 repr=
esents
> > +      a scaling factor of 1.0.
> > +
> > +      Example:
> > +        If actual Vout =3D 0.75V and READ_VOUT reports 0.7V:
> > +        scaling factor =3D 0.75 / 0.7 =3D 1.071
> > +        value =3D 1071000
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 1000000
> > +    minimum: 100000
> > +    maximum: 2000000
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        sensor@40 {
> > +            compatible =3D "infineon,tda38740";
> > +            reg =3D <0x40>;
> > +            infineon,vout-scale-micro =3D <1071000>;
> > +        };
> > +    };
> > +
> >
> > --
> > 2.34.1
> >
