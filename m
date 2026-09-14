Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873BF3F327D;
	Mon, 14 Sep 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374559; cv=none; b=ftPek8yC/kvKP6nrivc+OZBwVnMYRxGhoP1aJ2ws7F3DOwWT05rcnNEAzyNN9Ox9XRDx/vOJHqeeGfbVTtu5d7qv3YFW+EJ1f/nurKPgZHsrRexh6aKvGGa7EQayO7lE73bCF7slmvI8Y9Ld3gK2c6iELAZMnUxMDB4NvZ8FaaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374559; c=relaxed/simple;
	bh=qAdWJmBdD100Ff0MlavxSowwmhDDWjRQwy9HgIZ24iU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UXsX9zc86awCC+hQRdxKD+gBTHdLeJhRziP19bBQuWpk8HFu0b8TSWhrH3xfGk7p64zHguQ4LG5jM2mCRlfnp0fVqJam/gvjcn+nvjMg1cWhQx4QIu/WKohKsxWWpMqjEFWRZZA1I69KcfeD3BY6qgzZE+pQ+P+GGLUONphDVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AR0jRUwa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR0jRUwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DA21F000FF;
	Mon, 14 Sep 2026 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374557;
	bh=Ll3JpCBZj3VS5SDY7YWLa2gSMJp9HFfTvNnrgKqj5xE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AR0jRUwaqM4asi348+vyHp5Uo7q2QIAQ2q0NnMP66CB5y5MjGFYih0VRKIsaQRiZn
	 KoA3OOXRj6+KiW7YkPVBm6FQ7/fXtxl6i+pjwnoCy+/wdMtaD+IxxPnUd3dACP5776
	 2deFYEY/ijamwHXg27qnIFkcBHDqjtEY2K+Ofe1StlENMTf3fyxs4Cm7TCgIEhRisO
	 pR1hKbk9nR6mOiePoQSNeBWWI6dmRDGjk3gdGttl+jXwMy/hCGGw9Rfk7WZ9bc5WEj
	 RAC1KFSLAkV7paYEg+erNsCCdQxTpAYKUe5fAa2RN76Uoy6GIINX4MJl08/s+nKMRB
	 no0TFE4XNmwWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-ctl2301-v5-6-522def70acb4@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-6-522def70acb4@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:29:16 +0000
Message-Id: <20260914082916.E8DA21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree compatible string 'sensylink,ctf2301' is not docume=
nted in any device tree binding schema.
--

commit 77a2bf7d68544cb03c47870ccfe7a3ad4b0a68f4
Author: Troy Mitchell <troy.mitchell@linux.dev>

riscv: dts: spacemit: Add CTF2301 on K3 CoM260

This commit enables I2C6 on the K3 CoM260 module and adds a node to describe
the Sensylink CTF2301 temperature sensor and fan controller. It also sets
the I2C6 pin power source to a board-specific IO rail voltage.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boo=
t/dts/spacemit/k3-com260.dtsi
> index 37627963a6492..92dea86397798 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
[ ... ]
> +&i2c6 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c6_1_cfg>;
> +	status =3D "okay";
> +
> +	temperature-sensor@4c {
> +		compatible =3D "sensylink,ctf2301";

[Severity: Low]
Does this compatible string introduce validation warnings?

When building the device tree with schema validation enabled, the
"sensylink,ctf2301" compatible string under the temperature-sensor@4c node
will trigger dtbs_check warnings because it is not documented in any device
tree binding schema.

While the "sensylink" vendor prefix is present in the vendor-prefixes.yaml
file, the device-specific compatible string "sensylink,ctf2301" appears to
be missing from the binding schemas (e.g., hwmon/national,lm63.yaml).

> +		reg =3D <0x4c>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ctl2301-v5=
-0-b44b81cd2c3c@linux.dev?part=3D6
