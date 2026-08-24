Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444613FBEA5;
	Mon, 24 Aug 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587087; cv=none; b=nbfeKS+N8OwDmorHXaR+xQBhiX6Dx3O2EvRfGcH1EvZYYB32XKL81ASaUBG7pHqLPZTcmdsJhisbl6RLAxVWgyC4kG1yukRj43IvkMekmpUNF/hPEsNoxc+ZlBSbtkKXiBwrJSoPSs9sE1q21NRLBoBJsVMljvO+Hd4T24tBuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587087; c=relaxed/simple;
	bh=Nz9lbWp+Ecc1Cx+JYEuuWNtIwuJ6oA3kHHvaPL4BkVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q5bqdLc0TJkTJOBlESijKq1G+ocvY2RF4vgOO+C6a2Gd+xwaD8hwxJ9PasSkt7vOJYhi5hkyAOJ0DtL7YfLT5f/XUHD5YqpKZMWAgYlgHP/Zhrovj5exVFdofJpMYfn8XshVw/cIjHHgCYkSAE79R/+f3oegVi+Eye6js6oGTLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7SVQQDw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7SVQQDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2F11F000E9;
	Mon, 24 Aug 2026 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787587079;
	bh=Fm5WqJaG0FDTe6cFnCfZen0nBPFTH0cOY1JOmWS8i9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i7SVQQDwBL3LEMesJJylb6qtPTtNPHAKEfTEl72rceWGT8MKWCKTUcf9TNxPTAWOM
	 z1tHceR51QRcRThSQxYaoaDn9LDlCnNDOs2E4ph1iLBL/rmH8wOWEyVngAt2/yMFEZ
	 3WJPsTOjWb1//rrwDz0OCerPdM8HbkXaz3kYVrfp6u1xXOizbvWO7SYFa5UR9voTzM
	 9lRUzwfD3NyrPSkqEXVstHq76as13qNu3QgqjuAkRmeBcdCElctsQu8qhNPmPvLkFe
	 uSG4zU4APJUBoUoFeWwTmbBPxZUiJtiWNTmkmHckaSZciaCDwVYR6ELD+8LYk3SkMO
	 ZeeK0E+afJUBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: ti,tmp401: add vcc-supply and
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260824-for-upstream-dt-tmp401-vcc-tsc-v1-1-ecb5ef7898bd@free.fr>
References: <20260824-for-upstream-dt-tmp401-vcc-tsc-v1-1-ecb5ef7898bd@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 15:57:58 +0000
Message-Id: <20260824155758.CD2F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message contains a major factual error: it justifies =
adding the `vcc-supply` property by claiming it is fetched by `lm90_probe()=
` in `drivers/hwmon/lm90.c`, but the `ti,tmp401` and `ti,tmp411` devices ar=
e actually backed by `drivers/hwmon/tmp401.c`, which completely lacks regul=
ator support.
--

--- Patch [1]: [PATCH] dt-bindings: hwmon: ti,tmp401: add vcc-supply and #t=
hermal-sensor-cells ---
commit bb8183d96c519f5d3050a2f78596d89eca815884
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: hwmon: ti,tmp401: add vcc-supply and #thermal-sensor-cells

This commit updates the ti,tmp401 device tree binding to include the
vcc-supply and #thermal-sensor-cells properties. It aims to fix
dtbs_check warnings for boards that describe these features.

> vcc-supply is fetched in lm90_probe():
>
>   drivers/hwmon/lm90.c:2777
>         err =3D devm_regulator_get_enable(dev, "vcc");
>
> so a board with the sensor behind a switched rail has no other way to
> describe it, and omitting it means the chip is probed with its supply
> possibly off.

[Severity: Medium]
Is this justification accurate for the ti,tmp401 binding?

The ti,tmp401 and ti,tmp411 devices appear to be backed by the driver
in drivers/hwmon/tmp401.c, rather than lm90.c.

Looking at tmp401_probe(), it currently lacks regulator support and does
not call devm_regulator_get_enable(). Does this mean boards using the
tmp401 sensor with a switched rail will still fail to power up the chip
since the driver ignores the property?

> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Doc=
umentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> index 0e8ddf0ad7890..69f77aec01a33 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
[ ... ]
> @@ -50,6 +50,11 @@ properties:
>      minimum: 0
>      maximum: 15
> =20
> +  vcc-supply: true

[Severity: Medium]
While adding this property correctly describes the hardware and silences the
dtbs_check warnings, should the drivers/hwmon/tmp401.c driver also be
updated in a companion patch so it actually parses and enables this supply?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-for-upstre=
am-dt-tmp401-vcc-tsc-v1-1-ecb5ef7898bd@free.fr?part=3D1
