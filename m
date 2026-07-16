Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFC03AEB35;
	Thu, 16 Jul 2026 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237563; cv=none; b=PPH9MUmhbeZQEHcPcb20RicpTn2QG9HvRehxjM1NZiSsi1IrMBRphGOfqkBb9/+pSaA6WJ7YhqEQbAJawISzpDQtQTyYHr54DfgMpR5pKquKptvGN1EW2402SrWqEHImXZmdNKl1gG0AtGzsBHNlZDtpclJPN6jThjw7U3o9l+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237563; c=relaxed/simple;
	bh=JCosZwYgzES+Fuca8Ha9aUTnaVQyzqDyI8zlNOOB7IE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h1NEjQuJXcX8iYIUfrqr0Lj+6hEBAHcM8odoW/ueWDZbW2KJFa8Hv52u5Jdq/A14xckt5J/T7/a/4KbmG4ZmZJIlS10b6EoTcKGE/hUQH3K51S/lx8O8BTCB9nfhJx8/LWNkCSSmuyCEKZKWCVYpwPBtkkn/76Z6JFrfXJfe96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW84mRlb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW84mRlb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140721F000E9;
	Thu, 16 Jul 2026 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237562;
	bh=yzAavPG907W54iMqN3Sxrdt4dCcNZTwztYWLze2/wKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PW84mRlbk5U9dPU0L3eftxpmQRf36US1cdF0+VzTc2ePoBo373qJYiKK+ugnk47fP
	 LtX1/yfemWcbAlofIWYk71AWvdUCX3gnMk4qJrwjQJxLyN2NRoCUiGYkE/nu+XKUdU
	 /mlwo9npduokfWPdJbB+1N9RgzXoZOUcYpflwSo5RTyt/g43/tUIWJij/TvBYLkO0m
	 iT+woD/xCE0VdaqiABjePLnDV0a79BJCeVZME6UPjSXfAA96ZUghO/9gEhtlhhLCbE
	 CPihhA1QG8d6cXvshgHP2fkZqP6aPrpw1p13vwZ9EyPUmQgXNgOIZxj4GPSq58IL0I
	 Bw5bd82fAI7Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:32:41 +0000
Message-Id: <20260716213242.140721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-binding for the multi-channel ADT7470 PWM fan controller =
omits the mandatory `#pwm-cells` property for a PWM output provider and inc=
orrectly models the channels as a single cooling device.
--

--- Patch [1]: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470 =
---
commit 5b60ee676010a73eb2ebad187c402e61ddc230ad
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

dt-bindings: hwmon: add binding for adi,adt7470

This commit adds the YAML device tree binding documentation for the Analog
Devices ADT7470 temperature monitor and PWM fan controller. It includes
support for the thermal framework by defining cooling and thermal sensor
properties.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: adi,adt7470
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#cooling-cells":
> +    const: 2
> +    description: |
> +      Cooling device exposing the 4 PWM channels.

[Severity: Medium]
Does defining #cooling-cells directly on the parent node force all 4 PWM
channels to be ganged together into a single cooling device? A 2-cell cooli=
ng
specifier lacks a cell for the channel index, which might permanently preve=
nt
the thermal framework from addressing the individual fans independently. Wo=
uld
it be more appropriate to model this using explicit fan sub-nodes or PWM
consumers?

> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +    description: |
> +      Number of cells required to uniquely identify the temperature sens=
ors.
> +      Valid index values are 0 to 9, corresponding to temp1 through temp=
10.
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Medium]
Is the #pwm-cells property missing from this required list? Since the ADT74=
70
acts as a multi-channel PWM provider, subsystem guidelines suggest that PWM
output providers need to include #pwm-cells in both the properties and the
required list. Omitting this allows incomplete device trees to pass schema
validation.

> +
> +additionalProperties: false
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-adt7470_th=
ermalzone-v1-0-cc55ef35edde@gmail.com?part=3D1
