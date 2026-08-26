Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F542373BE6;
	Wed, 26 Aug 2026 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779240; cv=none; b=pWPbMGGoyu4ZSfuEhLQFOXP20qVBAeAeHMVGPFQKl8j8wpfpCgYsJnIM2IYi2OUtmCnASJ05oke+eWGVMav6ua2iuMN9JQfDEucxfTC6IuLhAAyoaqCn6Gocj18JJxyhD7B+J7L5oHnIspmr0jdXEVHfWkXeHjuDLttTlEIzdgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779240; c=relaxed/simple;
	bh=m6nWbVfcM524XJ12bTWfUpN9Gy7qAf9dBIh0E9hZO2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R9ibC+HzeLFw7eZX8jOOwB/S4voRjmgOeEmvQutCWR112M8IOiICZIP6QuujIldEO6fMMf/7XFerLP5T3yQ0lDef9feifdMoKTSh94IdrOsOdxcSn1OZXjgRIeb9HM380Rs06cLR6EDhXekkq1rPVXw2/7p3t3ZidsV2hxxyDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMs7xP1Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMs7xP1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8151E1F000E9;
	Wed, 26 Aug 2026 21:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787779238;
	bh=cxWXhplIFcNz2SxfiCbCqovzVaOJLrwvdcTXT/Fx7pY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KMs7xP1QhtA/rFUO3ZH7zyF7VGP1TTQAuxVaqb6VFRHcBh4xtgzuoo8j3aTEiLntf
	 kScMhDzW8sS1cqXe3hWFVGtx1u4QILt99JHrv+aiSvHGqWYXD5CCBWAfVPahQ3EuP+
	 /3J16hu5Z4HQFHC4k30nGHmQJZ7NRv2qLfJr7vdMa3UgZZmCUxToiQzFgH5EgQh33e
	 XMCQeWAXgTKKW8e9BzaQRTsZi25XkGZt4YMQUp6v0baDEpYVq8Ehvn/J4ZA+shYMxB
	 3OqnF8EiKvZZOmjKSS/YMW5BzF6qgXJ240p6XEiy1L5lKFPGiaQZl3OhBhzEdPR3ge
	 +RBhktnvJGvpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 21:20:38 +0000
Message-Id: <20260826212038.8151E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `#thermal-sensor-cells` property is defined with an `enum` i=
nstead of a `const` constraint, violating DT binding rules.
- [Medium] The `ti,tmp103` compatible string is added to a schema that glob=
ally allows the `interrupts` property, despite the TMP103 hardware lacking =
an interrupt pin.
--

commit 8ed50c8d65316077824330117ca798258a318903
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: hwmon: tmp102: move ti,tmp103 out of trivial-devices.yaml

Move the ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml.
Both devices are single temperature sensors. This commit also updates the
"#thermal-sensor-cells" property to accept values 0 and 1.

> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Doc=
umentation/devicetree/bindings/hwmon/ti,tmp102.yaml
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      enum:
>        - ti,tmp102
> +      - ti,tmp103
> =20
>    interrupts:
>      maxItems: 1

[Severity: Medium]
Does adding ti,tmp103 here without additional constraints allow device trees
to incorrectly define an interrupts property for the TMP103?

The TMP103 hardware lacks an interrupt pin. Because the interrupts property
is globally permitted in this schema, the schema validation might silently
pass invalid configurations that declare interrupts for ti,tmp103 nodes.

Should there be an allOf: if: conditional block to explicitly restrict the
interrupts property only to compatibles that actually support it?

[ ... ]

> @@ -25,7 +26,7 @@ properties:
>        A descriptive name for this channel, like "ambient" or "psu".
> =20
>    "#thermal-sensor-cells":
> -    const: 1
> +    enum: [0, 1]

[Severity: Medium]
Does changing this constraint to an enum bypass the device tree binding
rules?

Subsystem guidelines indicate that cell-count properties need a strict const
constraint matching the hardware. If the schema allows both 0 and 1 cells
for all hardware configurations, it might fail to catch incorrect cell count
assignments in device tree nodes during build-time validation.

Would it be better to enforce const: 0 or const: 1 for specific hardware
variants using conditional blocks based on the compatible string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826211422.3299=
728-1-Frank.Li@oss.nxp.com?part=3D1
