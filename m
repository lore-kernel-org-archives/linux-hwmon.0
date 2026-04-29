Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA6E24A069
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469099; cv=none; b=SIgSPgx/W6vtvbDlRx0xVBQXuLVv+ao4fLoFU4mu2ii69Grm/N+3KyfGJP6stDNGiJO0T24vEq0tUmd5HMFDQPoOORXQBknCBP4oF2RGDbNPsLg6zZLOUE7povifUAa1LAZpxh/laRGnqkgnwIgZr0Y1GOOjZ9t9hVhhfOh/WJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469099; c=relaxed/simple;
	bh=aN01tjmalzpffml4Wi3sozwLyDOCSbxebD07h5YS9kc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iRaJMmLXo9qRWTYtH0znwt0f1/XRb+n76UUZdmNFW9rqo9XmhrVnJFxwh8fZMe1evqLff47RXfhet91C9kKjIwjuC2IxBemKuZvQoWICcbXfvwa3CuITow0toav7d08qg6coXtWMUrbUVqMBhTZ78j2ugJXTYxbnHjca+2ngrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi3JFxjK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi3JFxjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920C8C2BCB8;
	Wed, 29 Apr 2026 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777469098;
	bh=aN01tjmalzpffml4Wi3sozwLyDOCSbxebD07h5YS9kc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Bi3JFxjKhcmWU7Ws7ItQfy/6rFTr7cAtUsewXryjUfqd5bZD/UGwnxw7HeOQbGeuE
	 2XT2XqBlNkPrR6MHLXJXw+EsHIAlyz5WPakT+XvedYPmVj8TH9xfgO53YpPWILQema
	 7ebZtyQfU0cNjVVpKzS8sXdbSjPUJVC+3RTBT4EWY6HJl7sj5/0m9r+HMAl7JCD1Hl
	 0/Fqn0l40+H6mHnlKvJ7VpyViosMYU+GdSmYqIKD19azyPiNVcv2gxhjF86n41we9W
	 akkI0jOJ1+DbZAsEvZ64EOwlX9jdwWxTIRXFz2gEP3XUw9+3WjPlyei4KI7j8VkFud
	 RNoMcgt3zMtOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: temperature: add support
 for EMC1812
Reply-To: sashiko@lists.linux.dev
To: "Marius Cristea" <marius.cristea@microchip.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-hw_mon-emc1812-v10-1-a8ca1d779502@microchip.com>
References: <20260429-hw_mon-emc1812-v10-1-a8ca1d779502@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 13:24:57 +0000
Message-Id: <20260429132458.920C8C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The restriction for channel 4 on the `microchip,emc1814` compatible=
 uses `properties: channel@4: false`, which violates the dt-schema meta-sch=
ema and will cause `dt_binding_check` to fail.
- [Low] The device tree example uses an undefined phandle label `<&vdd>`, w=
hich will cause `dt_binding_check` to fail with a `dtc` compilation error.
--

commit 6d9c42d650361ba383a1097abf05acff51bac85d
Author: Marius Cristea <marius.cristea@microchip.com>

dt-bindings: hwmon: temperature: add support for EMC1812

This commit adds the devicetree schema for the Microchip EMC1812/13/14/15/33
Multichannel Low-Voltage Remote Diode Sensor Family. It specifies the prope=
rties
for each hardware variant, including differences in channel count and featu=
res
like anti-parallel diodes.

> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> new file mode 100644
> index 000000000000..1a273621db82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
[ ... ]
> +  # EMC1814: 1 Internal, 3 External Channels, Supports APD,
> +  # parasitic-res-on-channel1-2: on both channel 1 & 2
> +  # parasitic-res-on-channel3-4: for channel 3
> +  - if:
> +      properties:
> +        compatible:
> +          const: microchip,emc1814
> +    then:
> +      properties:
> +        channel@4: false

Should this restriction be placed under patternProperties instead of
properties?

In dt-schema, keys under properties must not contain the @ symbol used for
device tree unit addresses. Using channel@4: false under properties will re=
sult
in a meta-schema validation regression during make dt_binding_check.

To properly forbid the node, it could be written under patternProperties,
such as "^channel@4$": false.

[ ... ]
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        temperature-sensor@4c {
> +            compatible =3D "microchip,emc1813";
> +            reg =3D <0x4c>;
> +
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            microchip,parasitic-res-on-channel1-2;
> +
> +            vdd-supply =3D <&vdd>;

Does this example need a node defining the vdd label?

The assignment uses the phandle <&vdd>, but the label is not defined anywhe=
re in
the example block. When make dt_binding_check extracts and compiles the
generated DTS, this will result in a dtc compilation regression because the
phandle cannot be resolved.

Adding a dummy regulator node with the vdd: label would fix this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-hw_mon-emc=
1812-v10-0-a8ca1d779502@microchip.com?part=3D1
