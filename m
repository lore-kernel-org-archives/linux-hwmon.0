Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB0733BBD7;
	Wed,  7 Oct 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384653; cv=none; b=Q1P+h+8LeT1IgHeO/fYmWXUsTPATRzUBDT1RD7Pmz9g4DQjKN0d3CZvqj0jjcgbQq4ZR21ltSyqms8eKm/CVYDGhlO9H96cogRgPoYPGOiLYmEHuNgxhV9+TshZkidsflrw6zEfgs7HNdfEw77vSMEtGOIv/B59GxWf6dnqxzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384653; c=relaxed/simple;
	bh=IyGixNq4pkbV7FVHFrqTXfZCwyKqGWpJ5v4qy+ZObYE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PEh/StSx1EXNchVz/b7IOg2M55an0WicW1yXHi1QWE63Vomln+7rUXVKLpGQVcFwUcAh6LAgjd88hRUbZoNUOP96IY5kT3ZD9mYpThEtaNnhJj1Wk5FwX4jHizM0GSuEGSE9xPWFK3BYURuE3peY88u3EMGFvm0zdckBLDh2SLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jm/KAhQh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jm/KAhQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F06F1F000FF;
	Wed,  7 Oct 2026 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384647;
	bh=RwJt+vTXsiPBDr6XojRL1I54qayk4Vc9DxcrdvNVW9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jm/KAhQhS61CLr52jqqv3F7knKZffFxJzsHmZhvtm+ar6DuL+6J8LALDTNf+4wG5s
	 TxVrT2LXuv8428sT4H+b5ITy1SRSSZ8VlRTdAiVTBSkHWoznbMN+sjqnzIqpkaUqq1
	 GkKgTfu6onV1EA2SkQUPiYtIKD3YUYKbB5aNywDmKnwbOJNJ2tvlKAOP061dtvK8nm
	 INaf8XKNIL9DS2n+P6ISjLxREULxYABkeYhgAyqjJC4yn5FfBglIGg7cbbY/xQRWCm
	 7hcQudOCklfViIpggv+ysfEG7osQVmJePEiBVJkv9otVCq53oHjLn/sqEBChPOEiLk
	 ynQHQCGf3WmbQ==
Message-ID: <sashiko-outbox-163121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261007-pac1711-v4-2-6ef34d7a7947@microchip.com>
References: <20261007-pac1711-v4-0-6ef34d7a7947@microchip.com>
 <20261007-pac1711-v4-2-6ef34d7a7947@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 14:50:47 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: missing `contains:` in `compatible` property matching=
 causes conflicting constraints
--

commit fc07b1cc31cfe375fd7611b7a1adec3398c98d59
Author: Ariana Lazar <ariana.lazar@microchip.com>

dt-bindings: iio: adc: add support for PAC1711

This commit introduces device tree schema for the Microchip PAC1711, PAC172=
1,
PAC1811, and PAC1821 single-channel power monitors. It outlines the required
and optional properties, including accumulation sources and voltage ranges.

> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,pac1711.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,pac1711.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,pac1711.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,pac1[78]11$"

[Severity: High]
In device tree bindings, the compatible property is evaluated as an array
of strings. Since the JSON Schema pattern keyword is restricted to string
instances, applying it directly to an array instance causes it to be ignored
and unconditionally evaluate to true.

Will this cause the condition to evaluate to true for all device tree
instances? Should this use the contains keyword instead, such as
properties: compatible: contains: { pattern: "^microchip,pac1[78]11$" } ?

> +    then:
> +      properties:
> +        microchip,vbus-input-range-microvolt:
[ ... ]
> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,pac1[78]21$"

[Severity: High]
Because both this conditional block and the previous one apply pattern
directly to the compatible property instead of using contains, both conditi=
ons
will simultaneously evaluate to true.

Does this result in mutually exclusive constraints being applied to
microchip,vbus-input-range-microvolt simultaneously? If the schema demands
the array simultaneously match both the 42V and 9V constraints, won't this
cause dt_binding_check validation to fail even for valid device trees like
the provided example?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-pac1711-v4=
-0-6ef34d7a7947@microchip.com?part=3D2
