Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16A36A004;
	Tue, 28 Jul 2026 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255432; cv=none; b=Sssny3MNi8EKofOBmUxJf9ZWTiwwGlI8fa/aAiawKI8Mqz36dSKoAMF9X2hPYpIomipGUmhWCoq8zO3VKt8h/90yNXxaollz/6dSWUSWmU1nIZmsLtpJ72MAaUZnekoBG6T0npigFnwfrFGmxDB2GYtpowx1b5eHayahz/43aCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255432; c=relaxed/simple;
	bh=pUsOrLHHlxtSfebtNHIlgrrJoArBbx0ML4ssLoM50mI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j9OGflkWTPgT3ZqYIrShmgANsrGRXK+yIVJ8JFC4PS/RX5wvPVEGTSlmaFnrHUxr++TkunLMX3CFOBQby5e6hLxTyCZyVph4G+IwXYavz/Df5QkwbOfD1gB7Sl3WOGAXK7D7QnkSuVsbo/vs4N6N31M74493bfCj/Zd6NwUz/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvOmHyhq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvOmHyhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D771F000E9;
	Tue, 28 Jul 2026 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785255429;
	bh=RyHrrkvkaQjuE6NfSyguzvhThnoFi5WYVdiPjVsrTic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvOmHyhqXBj9Xkn6VkKWYQ+wW2tTNANaMYO3bWv2/rTg0KchQXlKbTqf1OWoU95Fq
	 5jkxAAcmA7Nu79hkFfyzns35IJcedWFOAAb1q2fG6Qesv/B5GEU00+6I+UHjm7Kks/
	 mSE7QZqA33vwy27tIPrFn/kUm/3UGZoYaFjJoeB1aYyLbcxiqrfwI1ewl0spZmvqnw
	 KVc44+nBCKmbn8jdwRZ/0ezDLMk+82+5xRYw7RMZ6ti/ozTmWhwBmJKdBNWZ4MpLGO
	 Xh0pR1MMaq69zG0renuXOKNZPmYEahjKlVQtiptKbRTUyzVpey6Yf6LibWbitZZUHy
	 YKiZi2uq+kU1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: hwmon/pmbus: Document MAX20826 and
 similar devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-hwmon-max20826-support-v1-4-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-4-224766e0acd1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:17:08 +0000
Message-Id: <20260728161708.A8D771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing Regulator Subnodes for Dual Rails
- [High] Missing Power Supply Properties
--

--- Patch [4]: [PATCH 4/5] dt-bindings: hwmon/pmbus: Document MAX20826 and =
similar devices ---
commit 2b08f009cb35e4f4f84d9a87d92b4afdc5d9b230
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dt-bindings: hwmon/pmbus: Document MAX20826 and similar devices

This commit introduces device tree bindings for the Analog Devices MAX20826
and similar dual-loop multiphase high-current PMBus voltage regulators. It
defines the schema for the compatible strings, registers, and enable GPIOs.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
> new file mode 100644
> index 0000000000000..6d280f8bf56bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml

[ ... ]

> +  reg:
> +    maxItems: 1
> +
> +  avren-gpios:
> +    description: GPIO pin to enable/disable the output voltage on Rail A.
> +    maxItems: 1
> +
> +  bvren-gpios:
> +    description: GPIO pin to enable/disable the output voltage on Rail B.
> +    maxItems: 1

[Severity: High]
Should this binding use standard regulator child subnodes instead of defini=
ng
custom avren-gpios and bvren-gpios at the parent level?

Because additionalProperties is set to false below, standard regulator
subnodes are rejected. This prevents consumers from defining standard
regulator constraints like regulator-min-microvolt and bypasses the
built-in pmbus core support for parsing standard regulators.

Would it be better to model this with standard regulator child nodes using
enable-gpios?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: High]
Does this binding need to document standard input power supply properties?

Since additionalProperties is false, board device trees are prohibited from
specifying upstream parent supplies (like vin-supply or vcc-supply). This
could prevent the regulator framework from modeling the power tree, which
might break power sequencing if the parent supply needs to be enabled
before this controller operates.

Should standard input supply properties be permitted here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-hwmon-max2=
0826-support-v1-0-224766e0acd1@analog.com?part=3D4
