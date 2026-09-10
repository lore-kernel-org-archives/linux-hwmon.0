Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861D23A9620
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 06:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021057; cv=pass; b=c1/dZB5zEgY+cWCmEf6I5gKNgZo3M3xRid1WbZBUgYo0QFHE5rWnzZ0evspTQKk2OwAEtkiyX7um3cfsSRpy9Dv9HV4+KMu42nNLll+tD4V3clwLQmfCEoOdZPMM/Oi6di4gi+0A3dx3rm3EMuCxIngeRfJYYIltW34Okm2Gegk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021057; c=relaxed/simple;
	bh=cPrLSyGwGLPmONlY2FTynuZ/8LkekDLtwBlnPe36bVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLkAtKD1yoQW0BoqYrZQPsnPbbOHUOgm1ysvQ1HXLBjBGUo9effLu+JNEIiATQRXuMkhgHGQbFVRS/RoNHU87efQ7fHEBjz1DuAX2PH4n7cidzlZ1Bn1nR6TZF2atLuTsBkxKUBmw6A69b7VGt1UuCPd33etVQ4k8rT/slf0jNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3IRDFHO; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3IRDFHO"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so1907564241.1
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 23:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021039; cv=none;
        d=google.com; s=arc-20260327;
        b=eWT2edyF0EzPkKaEwXWxqD0RNktdspNQnOKS0wzndJftS/pURj/X38+/rLFn74zFRn
         p1J+aXY31/eBLbri5OvhuG8UW8f10Y5xf3vRKf8UlqtNZKcVdZFRpLjfMIDZz7yCHF77
         e50WJvyMXVZnsW7CJLPugN0ISMroeKJs5qOxrQa6BDHSACfsYxrreIPdc1XQQIYnWWyo
         iYCP/+fIvkMxejnfaEb01Ob79eoMFzI8KZrwMhw3NEFqlvyk7U24QDS5uBbXy3mD68sL
         im0A5A+NpW4UZSuFHRE9fUHXK4d8WPuzhaqaDtJRR2CJdDW6pB9Sqd6rDJLNFBu/s74R
         6pKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        fh=3JJxt7JhI0wmf/hpV4G4y1tvXw9PUzjjlO+S5Zn6pjA=;
        b=SWXV8upnkzF2n6mk0UP5ZjNWUYyB/JNeq8jshv99TxnHi5GvL1T+SgO0RRjha439bY
         KvqEXtn2KdL8VlcfTAlNRW9IniBIQlEVu3o244vg+bbPVTJrqRHvdQqlCbzQmqqfg/zv
         dzsSF69aObBDr0VpstdLzUKsgXd36BLSRJ6nI/4Of+nJPNWzkC8IFbm4ZMdJFW1EOVRL
         sazxgD2ClTrIJUTkROrddeY7693OaNIgLRop9bAKpLVhd7CL2W+RGISyDRnQcN34eHym
         UfIwJHPlVT4FEHKiIWjPi0FsE9h599rGEP52NE2Z1yp6Po5xkVTipUE/1tnEKwu7KgGr
         Kssg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021039; x=1789625839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        b=s3IRDFHORWZQjwdW8fT9py5zLtdIu3NrcUBW8HwlshmHkVbq7hSqqQnn/JXiPd1oRB
         MrjoTiU25YpaKxuU3fFnrY9y7J2Li1XRnfOMF0ZYVgkI0XYO/Wj8f/mzkR+9nhlX3NIR
         +J0AQYTFrnxg2+Mr0eairAHic8ngLO5WMIJ8SoSIq4IQJiGqAyhHlkMmeDOT3ksQHYL1
         mm3O4SkyotrikclbGD1ICnejW1wNu8YfX5TC1v0pM1z79Y6cqMwQaNekO9pRC4UOx4dZ
         OaDm+JCSFl7phKSKvx5WwDTnZM38t1rDSHxrqcXdhggVw75ZLi/1+GmSCGTzjcBqOasa
         Sk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021039; x=1789625839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+gu/5PaYwRoWH6FAJcX79bn4Lfhl+cAwZpfqQzFbKk=;
        b=ij1leXQxK5DpdeymEq7wuc/qvDAZ574zOevFB0U01SjExwUGY3D6fMgK7mmd9i0YME
         UPMfrorpW3af8ITav4taRHbd7QmFIbJIJ2k7TIQ8xtzGNTP7LxaIUdReT3KeuCAi/gs7
         vVy83QgTsrqkQpq0M1ZkV4Hywpy0MJduENjww0I8RP9psbYwGJWqXxxLlD0FNin2WCU2
         o+istZ/3HLOK9eriyJLDgr0Fml3oIZANsZkFk+aEyE38Ao2If47F8hACFFTwpgu1zyyA
         edEXUNht7XWqWWRJZBXQTLhSqJ+qBXqa66wDi1Ybf4fgRj/5bhuw6Aivcm+ih+LXq7do
         bbLA==
X-Forwarded-Encrypted: i=1; AKwUvBzmBqi2Qpu3ZRMkTHV6BKzGREDx78EeXyQdGiJw2R1444kf5YWFx2nflbfAbfscV7G+PWJTp2oTHunfSA==@vger.kernel.org
X-Gm-Message-State: AFuF++l+YN0dXQMuJnj1TZrjx3kurxan+SgZYAJuzjvotuu+tJetvAbV
	mZgjD79iQBD31w3QhskRuR/BIGMYjabNMGSkkq2fR3/dPUNhxpsXB3C+gX5jsdemmUZHeG5Fx4s
	nnB1MuEPSI/kwMIGBN1PvbfdGbLLFurdbvQ==
X-Gm-Gg: AYBFou0e8L5szM7zoxmWuq8+HvPuihOxw+CDpGt2LxI0Kxw37j/dzsuFaNcr9xuU2ZH
	P4DeXt6rbHSji09JDU32gNdi4kg8/ig8J7tn2hqZjmViEKEfZyM7mNScUosxc84sTYTu04LUe+m
	p9AiqG0kWkyXEi86oetstJNsK6YgL2NdRMl4RW4Z6yJ7+Z2IGBCFR+9rzgvTSCXGl7CO6ho4ZcU
	kDfKY4Jtt9BHxWyjEe8jc5j43Y05koWHCK4GadmFDPwFtmUiC9xCALwIL0j0kdAMLhlX3vQTDaX
	qztnXEYZZeLKDbeH7WOauFrxRbSkVWkctHg2CDPYcOEMgU6pJ8cES3B/K9JUKagN+LEkZw==
X-Received: by 2002:a05:6102:fa8:b0:78f:5bab:4761 with SMTP id
 ada2fe7eead31-78f5bab4867mr6319524137.8.1789021039061; Wed, 09 Sep 2026
 23:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
 <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com> <20260907-kangaroo-ascend-d0541fbdc975@spud>
In-Reply-To: <20260907-kangaroo-ascend-d0541fbdc975@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 10 Sep 2026 14:17:05 +0800
X-Gm-Features: AcwNN1WJnyA4tn7yoArv1afcfdYawuxDz1IlQc9gvSLXyiXSPW2rdMiDiRDwIWA
Message-ID: <CAPBH0A9ULmcNV_SGf7GsywpdW_LZubkFY8hCrV7x_oXtv6-7dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 07, 2026 at 02:52:29PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 82 ++++++++++++++=
++++++++
> >  1 file changed, 82 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..c9bf19902d3c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,82 @@
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
> > +    enum:
> > +      - infineon,tda38725
> > +      - infineon,tda38740
>
> If the programming model for these devices doesn't differ, one should
> fall back to the other.
>
Thanks for review.
I will update.

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
> > +    minimum: 100000
> > +    maximum: 2000000
>
> This is not a required property, so you need a default.
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Thanks.
I will add the default.

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
