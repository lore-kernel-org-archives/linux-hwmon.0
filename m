Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF2A1D432F;
	Tue,  5 Nov 2024 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730809174; cv=none; b=jsSNbKeejLlTejC9f7d/TW9gTx73gEJhPtTD3nft+a15HsJe3hBXzkiYKlzPwcbX4/QWmR5TsIHzZaRolzfujD2SGhVOKguSScOs91z7s44iVOTSXDa9G8RLJD90Tv6+CMeB/trjxs23wmi3G5ge7WF1X+/SW0hMtZnFY/9kBy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730809174; c=relaxed/simple;
	bh=h1aJVB7kfHKHA1YbmjR9Z7DNmt6WC/Sb761iSgpkmes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYubwxMLROB+PT4d5ILrIyVzgUgW7rLP6vS73CjzVTX3rK3Fn/0ogaLlJmQ58Is50JPpAZl3R8ITeLMj2Cgg0lYCuSchFryZKDg3jxOgcOz5pLSHZodw6b3zupLuGAORF55+UMasERwLk00YgtILULiJJ0DwRioePFEu1mmjt6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsP5FKWE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsP5FKWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72063C4CECF;
	Tue,  5 Nov 2024 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730809173;
	bh=h1aJVB7kfHKHA1YbmjR9Z7DNmt6WC/Sb761iSgpkmes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RsP5FKWEj+1el3l4IO/Mlh59SCivOXxdtDdow7Qya6uqbJDTaIYr72WuCFscgN9O2
	 GZqgQNgoNsJOzmzcnwpYk3BLJW1ocsjL9ghjZU8vKNBVX+qzNW5PTBOANn+JZUAtnc
	 xcbGRIIgaEQ6554sT/fqM0fcdaRuZiZs5l4DNTOVSVjO9TtUZZvxoxv/mmoPS5Kfp2
	 jbMLAWb8jSUK4gz2lQ0h3C4FApgnXUMNdFbTzVBi3Mgu36SIn4tU6sRYPJ/A25S+Dn
	 Q6lGTd+6TWZ+GTlFNV3i3aLAhZTtJlBVULzQKsACY06gSBZdY+EjV790Ww7J2aoXPl
	 Ibbm0EKv6pEUw==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e290222fdd0so4756065276.2;
        Tue, 05 Nov 2024 04:19:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9kX4tlzO0vjQViMNSePOnsI/cQBXIc0QZGAPYBrgB7J2ct9+BPsxoof1455sgH7RPImzI7eHF79Gu@vger.kernel.org, AJvYcCURw4SOxiAWldC+kEPPS6wW5cH647IFSZe0KpQw1UNBQQX5ASyQEq4x+8DV8NYbMfMEIaQ2LrfJ35ul@vger.kernel.org, AJvYcCXzwcwIgY0XJpxpVAb/n7kxUkakrfm+Z9WTv9+JtKAKzT+sFyOdLJGwKlTRSNvlZwtghijwibt2AvlKWRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWMrBxKN73XrJ8enJmob0IJeKuTpbdpt0NPdFuzHtCJcw8nWs
	sH7ZWM+GIuEAqLZFQaHS0oYXJQGpDfaszlmuiwHesZKfg1MYehY9EFjbA4sHatamwfA/MDePzLd
	73H51GcIBxVrVNFEfPcke6ZIhaQ==
X-Google-Smtp-Source: AGHT+IGPGLC/cFCX6a2oh4sGRWazmbURqTDroOc3OiioS+x/p/dswRaHUBTrPMv7WMxNYiKoyRuVELZ5PyRR+H+ZzsM=
X-Received: by 2002:a05:6902:188c:b0:e30:e1f3:2a9c with SMTP id
 3f1490d57ef6-e30e1f32bd7mr20240797276.0.1730809172628; Tue, 05 Nov 2024
 04:19:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <1dff1f63a2e122788e2c17f192472705491aa5b8.1730326916.git.grantpeltier93@gmail.com>
 <CAL_JsqJqhxcMu2yeqvJvUOJ_g3uDv3t1JwaMxAfZQGXFj3rAvw@mail.gmail.com> <0f855c81-ce0e-41e8-ae08-5f653d3ca8b0@roeck-us.net>
In-Reply-To: <0f855c81-ce0e-41e8-ae08-5f653d3ca8b0@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Nov 2024 06:19:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK=kgoKvusMMqdtx7b4z2aveE5O9Q=UHXCgook5UBS4bA@mail.gmail.com>
Message-ID: <CAL_JsqK=kgoKvusMMqdtx7b4z2aveE5O9Q=UHXCgook5UBS4bA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
To: Guenter Roeck <linux@roeck-us.net>
Cc: Grant Peltier <grantpeltier93@gmail.com>, geert+renesas@glider.be, 
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com, 
	brandon.howell.jg@renesas.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 7:20=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/4/24 07:08, Rob Herring wrote:
> > On Wed, Oct 30, 2024 at 5:41=E2=80=AFPM Grant Peltier <grantpeltier93@g=
mail.com> wrote:
> >>
> >> Add devicetree bindings to support declaring optional voltage dividers=
 to
> >> the rail outputs of supported digital multiphase regulators. Some
> >> applications require Vout to exceed the voltage range that the Vsense =
pin
> >> can detect. This binding definition allows users to define the
> >> characteristics of a voltage divider placed between Vout and the Vsens=
e
> >> pin for any rail powered by the device.
> >>
> >> These bindings copy the vout-voltage-divider property defined in the
> >> maxim,max20730 bindings schema since it is the best fit for the use ca=
se
> >> of scaling hwmon PMBus telemetry. The generic voltage-divider property
> >> used by many iio drivers was determined to be a poor fit because that
> >> schema is tied directly to iio for the purpose of scaling io-channel
> >> voltages and the isl68137 driver is not an iio driver.
> >>
> >> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> >> ---
> >>   .../hwmon/pmbus/renesas,isl68137.yaml         | 147 ++++++++++++++++=
++
> >>   1 file changed, 147 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ren=
esas,isl68137.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl=
68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137=
.yaml
> >> new file mode 100644
> >> index 000000000000..ed659c2baadf
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/renesas,isl68137.y=
aml
> >> @@ -0,0 +1,147 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +
> >> +$id: http://devicetree.org/schemas/hwmon/pmbus/renesas,isl68137.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Renesas Digital Multiphase Voltage Regulators with PMBus
> >> +
> >> +maintainers:
> >> +  - Grant Peltier <grant.peltier.jg@renesas.com>
> >> +
> >> +description: |
> >> +  Renesas digital multiphase voltage regulators with PMBus.
> >> +  https://www.renesas.com/en/products/power-management/multiphase-pow=
er/multiphase-dcdc-switching-controllers
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >
> > Somehow "isl68137" is missing from your list. "make
> > dt_compatible_check" reports it as not documented.
> >
>
> Turns out it is also documented as "isil,isl68137" in trivial-devices.yam=
l
> (together with isil,isl69260). Both are referenced in .dts files. How sho=
uld
> that be handled ?

Move those compatibles here. And this file should be renamed to
isil,isl68137.yaml or some other actual compatible value.

Rob
