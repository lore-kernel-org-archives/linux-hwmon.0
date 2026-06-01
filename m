Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB538399C
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Jun 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297572; cv=pass; b=ljexnVd1JeMC0F+UdQApfnhMn8kmQBdmuT1KhclV2koLXQbtpqiqpXlAs6JNK756v9ReuaDIV7033OohibNkbTf9rP/ghBaUCsI+KQYUV0DRcWvVgAz2f/mC7mXUS5zL2VK3yCLuQWOKja9zVtr0SkXuJHN23NtBXFG/GaBI5C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297572; c=relaxed/simple;
	bh=zL43rRNUkROQAXRx+lI+JoRTxX9AjBpJcLNzRh35qx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCpSb3rqA2t+s5XybBiqzhucQuk1luS+cw38x2pFLJ8synbelUCIGUA3OVFuIXaR50rYruMxMS/Jqy89Z6441HkxEf7eVFsjH3ELQiDyIRyh/r+7aBOnW5j01iNnxt+EWe6xphIgueCyq5gFCUrv97kvPfB7nm0fqNPCSG/DhqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGTnmNmW; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGTnmNmW"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304f0039c02so5324881eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Jun 2026 00:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780297569; cv=none;
        d=google.com; s=arc-20240605;
        b=Uva6bhjQKL8ztdQIwMrlHWDuJjTrjygdvBAcz26Sk2F5ZiBq/6vyph1LO2tSGuHAXf
         2HOg+Rm6imh3i6b7DqYOg3nCs0joGym8zq6fhn/w9de6ADb8NUPuwD2efhedOq79bBdX
         aVzQYB8oMEVfCH+HH3DQsnjAcuQ0FL8OvjfYmd6FhhPtI/TNJac9Xnq8HM2zUes8q3XR
         B/x6EE3QsfCydxlj5jzvMWf9bnrgsUwoix93FfoVmbC9IPxdHhScpKdD44D83bF9yIGg
         m91Nty+RGmMi1sPlHIM9W/7vskw9ZhSMuJZk2siiVzCtbvljKPTZBZFvUCbcBsNY8NDn
         mj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6x1wbXvenVeekia93enMRo3NGuqJ+euTvBULiNrpXA=;
        fh=/wLiD456Rg90OsMIJC34JaYIkvJu/JSmPQ/U+F6PMeQ=;
        b=OSwf+yFL9jGwkthbEVFjLCYgir9rQ4lcudhObLc9hEDbja/xwJOzfyR9twWsiyAXl7
         +kJfy07ryGt0dlpf9rtjXTYEFt6dj2VhSfs5kSPekquyLTebPTVPvBgjkCDBjvksPcgd
         kkEpoR5BHx4nYVKIBLPsGhBpnaV0xe+iVK+XJpqEC64vAG9/E+AdFhHFq6FjdYyLUvjD
         RlKMvCGpY7GuwRnCrvlCnG8Hp5UsIAUSMR9TB17qFuIw0hLvV90e+BmOJepbPFExtnu+
         gThoUvUI4gF5SOqPnabe/1Ms6+eqCP08fmCU3cHJl4nbNxbwaGx//cnQwRF7rR88nWQp
         edYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780297569; x=1780902369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6x1wbXvenVeekia93enMRo3NGuqJ+euTvBULiNrpXA=;
        b=aGTnmNmWbnsu0mGB+qitdiaExDNjMsb8AhWrlAw4UNumOnynSTJd2hEDLVxEHT3YJy
         nEKYBJVMF9CKmqb8ZsDE1zwu6n1b2+QAcVwCHtNmIMn1q5dZLgNWOFHO/OqNZngzyYl+
         DYgxcerc96ABaV1nio70X+QUWg/oa+ya+NfoJOLGrtfRwXKSNR5OjXSGjvkQclodAZnC
         ndJSKEv+IAa5/4ArFeziD0PBuFGkqqste+Yj6R1Wcm8iJxizmifSXgPe7LTW5H9ubynQ
         7nOgEOr6xmzt0+IoWUD/GqHKFTvvSNjylJLguf3iCJgb+EstLPNrH8uxIf5GEZDyKPwG
         obBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780297569; x=1780902369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6x1wbXvenVeekia93enMRo3NGuqJ+euTvBULiNrpXA=;
        b=abiR7r6b0yQ8OnTkwkD9VsOGb4XSEuE1LsNkQaAxfrfWpygIZQx6+t05kmbbEcF0dU
         bL7ONO+6fx7+WxqSWIsDWbquZeeDy9N0wki66dg8Mk7OSekrCYnA5qNuKlP5EE5G7bGz
         dev4IeTPzPTDKx3iFt8GRyJ/l7AoQhXAUoV1qtHCE84NxA3brPv/gqhfEKFAGLXyD6xF
         JXcGfte4Ju4p8HLWCyoQfp9329Haz//Z0Rw67tpZMOGHTCEUn7oh8FB9nGEbWVXIu2UT
         8T913o218Svm0qx0Tb2aU5sBQ9lvu8r7QsfHuh9IY4nYPHnHzauEOB2yf1oflXVbTtRr
         AVnw==
X-Forwarded-Encrypted: i=1; AFNElJ8LKF3hMlWGqmFwziQgbihT3M3sIVmxAhsFXpMxK5kEEE5KBAqWBT6O35w4Z8aPg1vPwVssqse1iDL0xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIdH2tu4tdrE4IxVrULvX1A7pltgyjlfADcenP0RIk0FPC7ToL
	UtQL43HU6jmhNMHuwGD0WZ3jPq0qFh+qFiMkEk51rQYGby/k6kjQjsLyKp6J40s+O3cKzLZxNg3
	zQiRqiuS0oNxxEFH8QEqZF9qOO0wxSYA=
X-Gm-Gg: Acq92OE/gd1yrM4AK2ML5v8VdKEUZfK2E5Mep+uC5RkId/sWECCCnp4txuF18E5t6GV
	QOgEfttHqqfVYWzjIOtL2zTI4Z1qvt9D1DSxq5lgMP8NqPi0Kj8bOOicCHt/8txevMRrStTUcoX
	wBC3Ny5dmIUY4Ch1//bmKtRZxiPj1TbtJoEejBm7D6DZDOd7pcpu37xeblXv39K8vsCrb1C42GO
	BNLJy9/DNB0D6MJ7KNvHvy3qB29dUakdkJrpZZ30/9pwPVLPq5CAZv1Ks0U9uGC6HY+VqsbcTMh
	Yc6eltO5YETNVlRHTSc=
X-Received: by 2002:a05:7300:e58b:b0:2f2:5c68:5052 with SMTP id
 5a478bee46e88-304fa508e98mr4749567eec.13.1780297568834; Mon, 01 Jun 2026
 00:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
 <20260529054218.5184-2-Ashish.Yadav@infineon.com> <20260529-partake-myself-baa76ed4e279@spud>
In-Reply-To: <20260529-partake-myself-baa76ed4e279@spud>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Mon, 1 Jun 2026 12:35:57 +0530
X-Gm-Features: AVHnY4KKIhJYyyCvubbTWvCZOWxKwkjn-0kbsOvszc7kwcg7g_uxuWN-ORBhaRQ
Message-ID: <CAJKbuCZ09AFKqJMB+uVLY1+PC1E6rGtw=RGMG7DF4_K85GLeeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720/XDP730
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Thanks for your time & feedback.

I will revert back the file name to infineon,xdp720.yaml.
I hope it will resolve the issues.

With Best Regards
  Ashish Yadav


On Fri, May 29, 2026 at 10:11=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, May 29, 2026 at 11:12:17AM +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720/XDP730
> > eFuse Controllers.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 59 --------------
> >  .../bindings/hwmon/pmbus/infineon,xdp730.yaml | 80 +++++++++++++++++++
>
> This rename just bloats out the diff, no thanks. Please do not do this,
> certainly not without a justification.
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> >  2 files changed, 80 insertions(+), 59 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp720.yaml
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp730.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp=
720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.ya=
ml
> > deleted file mode 100644
> > index 72bc3a5e7139..000000000000
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yam=
l
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > -%YAML 1.2
> > ----
> > -
> > -$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
> > -$schema: http://devicetree.org/meta-schemas/core.yaml#
> > -
> > -title: Infineon XDP720 Digital eFuse Controller
> > -
> > -maintainers:
> > -  - Ashish Yadav <ashish.yadav@infineon.com>
> > -
> > -description: |
> > -  The XDP720 is an eFuse with integrated current sensor and digital
> > -  controller. It provides accurate system telemetry (V, I, P, T) and
> > -  reports analog current at the IMON pin for post-processing.
> > -
> > -  Datasheet:
> > -     https://www.infineon.com/assets/row/public/documents/24/49/infine=
on-xdp720-001-datasheet-en.pdf
> > -
> > -properties:
> > -  compatible:
> > -    enum:
> > -      - infineon,xdp720
> > -
> > -  reg:
> > -    maxItems: 1
> > -
> > -  infineon,rimon-micro-ohms:
> > -    description:
> > -      The value of the RIMON resistor, in micro ohms, required to enab=
le
> > -      the system overcurrent protection.
> > -
> > -  vdd-vin-supply:
> > -    description:
> > -      Supply for the VDD_VIN pin (pin 9), the IC controller power supp=
ly.
> > -      Typically connected to the input bus (VIN) through a 100 ohm / 1=
00 nF
> > -      RC filter.
> > -
> > -required:
> > -  - compatible
> > -  - reg
> > -  - vdd-vin-supply
> > -
> > -additionalProperties: false
> > -
> > -examples:
> > -  - |
> > -    i2c {
> > -        #address-cells =3D <1>;
> > -        #size-cells =3D <0>;
> > -
> > -        hwmon@11 {
> > -            compatible =3D "infineon,xdp720";
> > -            reg =3D <0x11>;
> > -            vdd-vin-supply =3D <&vdd_vin>;
> > -            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm=
 */
> > -        };
> > -    };
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp=
730.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.ya=
ml
> > new file mode 100644
> > index 000000000000..fdbc577bccdd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yam=
l
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon XDP720 / XDP730 Digital eFuse Controllers
> > +
> > +maintainers:
> > +  - Ashish Yadav <ashish.yadav@infineon.com>
> > +
> > +description: |
> > +  The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
> > +  with an integrated current sensor.  They provide accurate system
> > +  telemetry (V, I, P, T) and report analog current at the IMON pin for
> > +  post-processing.
> > +
> > +  Both parts share the same PMBus register map and direct-format
> > +  coefficients; they differ in the GIMON gain step exposed via the
> > +  TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
> > +  (XDP720: pin 9, XDP730: pin 20).
> > +
> > +  Datasheets:
> > +    - XDP720: https://www.infineon.com/assets/row/public/documents/24/=
49/infineon-xdp720-001-datasheet-en.pdf
> > +    - XDP730: https://www.infineon.com/assets/row/public/documents/24/=
49/infineon-xdp730-001-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,xdp720
> > +      - infineon,xdp730
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,rimon-micro-ohms:
> > +    description:
> > +      The value of the RIMON resistor, in micro ohms, required to enab=
le
> > +      the system overcurrent protection.
> > +
> > +  vdd-vin-supply:
> > +    description:
> > +      Supply for the VDD_VIN pin (XDP720 pin 9, XDP730 pin 20), the IC
> > +      controller power supply.  Typically connected to the input bus
> > +      (VIN) through a 100 ohm / 100 nF RC filter.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-vin-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        efuse@11 {
> > +            compatible =3D "infineon,xdp720";
> > +            reg =3D <0x11>;
> > +            vdd-vin-supply =3D <&vdd_vin>;
> > +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm=
 */
> > +        };
> > +    };
> > +
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        efuse@12 {
> > +            compatible =3D "infineon,xdp730";
> > +            reg =3D <0x12>;
> > +            vdd-vin-supply =3D <&vdd_vin>;
> > +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm=
 */
> > +        };
> > +    };
> > --
> > 2.39.5
> >
