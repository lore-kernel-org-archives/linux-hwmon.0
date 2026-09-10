Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5636F900;
	Thu, 10 Sep 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044095; cv=none; b=lg6CBjyppaeGAuCseYrUYwVRrgDSxQmoOvJlHrXMCRCkp3sfRj5G1qclGnaIkGD7hcvNoWN4/FWuTCaRKtovg5lvpn9Hmk3a7WBOrQzaiRHv4dwnTuQLZzxjFXY0hdeMOA4lbV1NV854rs248XEAW1iqHL50x3upnRGvjkwnKN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044095; c=relaxed/simple;
	bh=bxj7pEaOWolPSC0SaktKdrneFgu3v+bCqwAZd6aSJP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RZz77LEUw5Tbj/uaXVw8DQn8BE3eom09Eb1exONCHGUaz1r+Nk8Vb33kXLSwmTF6zc/RSaSDoCm0W96ErTGWJ9GcjfLLj6KvUnmOQMqxxywUjmmv+t3P0jkmXAzk8v+kJNLVthQPtBrnzN+XSLQrQYPcVemX3ZbZx1gjDFZH2t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6oWutnU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6oWutnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1299D1F000FF;
	Thu, 10 Sep 2026 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789044094;
	bh=DmqJlyl/yDAfWA0SB9plsfHlfzS7CY4I+YWxvTqmqR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H6oWutnUtwVooXIdPrwKCIgZKOJcAoU2HLTPYb6eP7voueh7H1Vj1SM+02B/iVeua
	 g0N3mU8zzz6Xcna9Vuqqbnd5kL58cv9Wssvl7qH4oYtxUxg4feP/PbbN//3MR+pYf1
	 YjFAJccWtS0qi2Lw7N7gVYKXnp3DCWx+HSfER6vLhxjDP1MQua36KkAd3zOeKmFvYJ
	 dNhnzSaaCmjv9Mkx7Gh0qs/VEktslWJmpu3h3Cy9m3vYS/3Iy+sv6KiQ4eoU/G9P2c
	 M6ofsTXKiaNEKqHe9v7k17jSheiFdcifAzW1cjAzyaUT8zVAi82vKs+eFgRVRoGX4Q
	 dPfFj+VfOnOLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 12:41:33 +0000
Message-Id: <20260910124134.1299D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding omits standard properties for voltage regulators and=
 PMBus alerts, preventing complete hardware description due to `additionalP=
roperties: false`.
--

commit ad3970039034a68048f73bbed304c8a0650c3bdf
Author: Colin Huang <u8813345@gmail.com>

dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725

This commit adds device tree binding documentation for the Infineon
TDA38740 and TDA38725 PMBus synchronous buck regulators.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38=
740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.=
yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Medium]
Because this is a voltage regulator with a PMBus interface, board device
trees might need to describe physical hardware connections like the SMBALER=
T#
interrupt pin or standard regulator supply nodes.

Will this strict constraint cause dt-schema validation failures if a board
node attempts to add standard properties like interrupts?

Should this schema include standard regulator and interrupt properties in
the definition, or perhaps use unevaluatedProperties with the relevant
$ref inclusions, to allow boards to completely describe their hardware
without validation errors?

> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add-tda387=
40-and-tda38725-v4-0-dbae7fabce09@gmail.com?part=3D1
