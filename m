Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667EF422533;
	Wed,  5 Aug 2026 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936053; cv=none; b=qwsjgJXkKa3o/uxX4Ju2f+wu3qhLA3OzB3inhbRr8YJFfvdRS5qaZ0DNzWsdrfUvorhfwOxz9RwNhpPtWH6OOo8SnRRSPTlf9y00s+g0TrxBGKQbHHjm4uSgrIY4KXUDVFOjSaTkLrsm7BH/+8sJwhYYfCTLrCpcRAXAyCg0N64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936053; c=relaxed/simple;
	bh=rTVAnM/+2fRgipRch28lhueeLcjEZsXD4OI6WxfC/mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VgjW/erSM9GRL9ufHaLW4hUoYEomP6IXYzd2rEGUUHfx/Q3RPrH75981N1Dvp1h0rtmSnW+iv3bS9VEv99vq9qNQxqA2iaWynq6bDAZ1mBeVkQ/tL0fwksY75HeLP2DB9kS5KK2hadxloFbcosB7it0aUq6hAM94Rqh7Wokyv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVVklyNF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVVklyNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009341F000E9;
	Wed,  5 Aug 2026 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785936052;
	bh=IDLGkARzO/DnR2GaRDQMAZSGORBikglzgEMes3LmR8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVVklyNFSyg7gqp0anYcjUO0WG9K7dO0eVISzZkhwiEyx7GzGxbED+5Fj/IOqhebT
	 Ev+B1OH9ATsA09QEx3V2MF3c34GSiBWXIkY4epUf+WEDLlvvYUV/iPoPWW4LkHq+XR
	 5XFscnJMAjNNv7n3hurDvLGrpN4r24yyuUx3vur9RLIDCM/5m62Y5YsAadyvPZLeYK
	 DCh6nFan/ywuhsDLUlIOJVzV5UuZA47Z5BQjJfE7+K55BQDQd4uCeJhpAWdZRdKQnp
	 YX4we/cU1Yd8Ds0O281k/AF1BSWVWlJ0DftNJSE1CSgZoO6If9dPINduaiHDHDtrHV
	 4lVFzWMSSGT+w==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v6 1/4] dt-bindings: hwmon: add adi,adt7470
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-adt7470_thermalzone-v6-1-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-1-5605a5f95467@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:20:51 +0000
Message-Id: <20260805132052.009341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `#pwm-cells` property is defined but omitted from the `requi=
red` list in the device tree binding, violating subsystem guidelines for ha=
rdware with provider capabilities.
--

--- Patch [1]: [hwmon-next PATCH v6 1/4] dt-bindings: hwmon: add adi,adt747=
0 ---
commit fe49a8bb78dd4a0eaf6f5fcfe3003d9e2f0f9049
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

dt-bindings: hwmon: add adi,adt7470

This commit adds the device tree binding documentation for the Analog Devic=
es
ADT7470 multichannel temperature sensor and PWM fan controller. It defines
support for the thermal framework and models fan control lines as PWM
channels.

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
> +  "#pwm-cells":
> +    const: 3
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +    description:
> +      Valid index values are 0 to 9, corresponding to temp1 through temp=
10.
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Medium]
Should "#pwm-cells" be included in this required list?

When a hardware variant has provider capabilities like a PWM output, the
corresponding properties are typically expected to be present in the requir=
ed
list. Without it, incomplete device tree nodes lacking the "#pwm-cells"
property might pass schema validation but fail at runtime when dependent
subsystems attempt to use the device as a PWM provider.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-adt7470_th=
ermalzone-v6-0-5605a5f95467@gmail.com?part=3D1
