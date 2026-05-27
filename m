Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F5C3655DA;
	Wed, 27 May 2026 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909118; cv=none; b=VmlMcRsKlMqvZ5sKQYRPP8OBwxxxPPG/HbWQLvtfdYWsEwWDIb9vIvxLzudUrSP2cWSfL/JdYUllofF2PSqf6AFFwfxjHVYAWUdxwTAAs2L+nrfUiMQO4bLPu0Zu0Jn9tNNvTv9RiAZZyyVEtsRCdxlk/nIKyAQQr7XWuVCutnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909118; c=relaxed/simple;
	bh=C2KJwgh2oDWlpeuEvaNMx7QgYqsxxx8EDEhfgij/+Yg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IphVr9mjYCWvRUwDXno/osz2jvjfDyhxFxgq9JInn6bvbzNwlx/ayWL5dGeHXOYkYtYeJ4VrKgQ5yy4WeRKmP2AABAzyu0T/gjPl+E0gz5Dyt2/4ZFvD5s6Pbh/qU8MO4BJ6UZ+mzgo4CZmoasrIeK3ehtBolcAVer4T0CeOX0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PD8UdKLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PD8UdKLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB21F000E9;
	Wed, 27 May 2026 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779909117;
	bh=aDihwv5OppegrdNUb8LS7osx87EwyS6+T+kSRAFn5Hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PD8UdKLbP5FkDKEtbUyvdhRLzvBUDehJBbAqToeCRc9MmbFXAwQ1KpiMn/+hUO5Mo
	 hjWzc/TMt0f2aQfJjTo2XC7aFn8dwYQovENL65t9rr/EjbDQWY5MMCAIuIi7HoJrKO
	 RR9xwlEqCeXMnB8Vig19GQgTtaeJlXXZQD35k6C0Nbo6Xr2IxeAulgA+3YpVeBJn0N
	 4ONkaKKN1iSQSwBmRKIY6Ox/yAfmbajwzMbO+qP+k7hNyU4nnp8tk/kackwLVssRBA
	 GMEnWVAdE1aiRFYAdQCK82Kd1sMdlGGTeQiHcetA58XQmmb+sosnSSkxRuajH6tyo4
	 n/6EIl5T6Qosg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: flow: add Sensirion SLF3S
 liquid flow sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527184257.141635-3-wafgo01@gmail.com>
References: <20260527184257.141635-3-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 19:11:56 +0000
Message-Id: <20260527191157.00EB21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The MAINTAINERS entry for the 'SENSIRION SLF3S LIQUID FLOW SENSO=
R DRIVER' broadly claims the entire 'drivers/iio/flow/' directory instead o=
f just its specific driver files.
- [Medium] The `sensirion,medium` property encodes software configuration i=
nstead of hardware description.
- [Medium] The `compatible` schema allows the generic fallback string `sens=
irion,slf3s` to be used by itself.
--

commit 40e1aaa676db52ce37dbf148be41d0cd96f854a7
Author: Wadim Mueller <wafgo01@gmail.com>

dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor

This commit documents the device tree bindings for the Sensirion SLF3S fami=
ly
of digital liquid-flow sensors. It includes the compatible strings, required
properties, and a custom property for selecting the calibration medium. It =
also
adds the corresponding MAINTAINERS entry for the driver.

> diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.y=
aml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> new file mode 100644
> index 0000000000000..f58cf199ac3a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sensirion,slf3s-0600f
> +              - sensirion,slf3s-1300f
> +              - sensirion,slf3s-4000b
> +          - const: sensirion,slf3s
> +      - const: sensirion,slf3s

[Severity: Medium]
Does this schema allow the generic fallback string sensirion,slf3s to be us=
ed
by itself?

Device tree best practices generally mandate that nodes include a hardware
specific compatible string to uniquely identify the device, even when a
generic fallback is present. Allowing the generic string alone could prevent
the OS from identifying exact hardware variations or applying variant-speci=
fic
quirks.

Should the standalone - const: sensirion,slf3s option be removed?

[ ... ]

> +  sensirion,medium:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [ water, ipa ]
> +    default: water
> +    description:
> +      Calibration medium the sensor is configured for at probe time.
> +      SLF3S sensors are factory-calibrated for both water and
> +      isopropyl alcohol (IPA); this property selects which calibration
> +      to activate.  Defaults to water when omitted.

[Severity: Medium]
Does the sensirion,medium property encode software configuration instead of
hardware description?

Since device tree bindings are meant to strictly describe hardware structure
and integration, usage policies like the target fluid medium might be better
suited for user-space control.

Could this calibration setting be exposed via an IIO sysfs attribute instead
of being hardcoded in the device tree?

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6aa3fe2ee1bbf..7eeabe22fcdd5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

[ ... ]

> +SENSIRION SLF3S LIQUID FLOW SENSOR DRIVER
> +M:	Wadim Mueller <wafgo01@gmail.com>
> +R:	Maxwell Doose <m32285159@gmail.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> +F:	drivers/iio/flow/

[Severity: Medium]
Will this broad directory pattern cause get_maintainer.pl to assign
maintainership of all future IIO flow sensors to this driver's authors?

Since F: drivers/iio/flow/ encompasses the entire subsystem-level directory,
it will match any future flow sensors added by other vendors.

Could this be scoped to the specific driver files, such as
F: drivers/iio/flow/slf3s* ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527184257.1416=
35-1-wafgo01@gmail.com?part=3D2
