Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE34499BB;
	Tue, 21 Jul 2026 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628007; cv=none; b=ecaoL1saUwMMsmqluPrQzroTDuygMw4rV9xt2TPFpWU0nUUTTll1aar/8NZwmdI8ks2/JDvFeRN73R5MmkGWb+WO4ACYLseVP+SeREqfE+XuNn3fkbvqg0SFoSaTQMUNPJUh3dgY8WZMwo5dpp7XAJMDJg7dxN5mmr16nPYxB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628007; c=relaxed/simple;
	bh=Ts9JsIYINTQC5zCdseT2aWBRudiucjibRUnYvsBJXTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eXB8PggRGSEg0i0/rklmHIQGUhcW1T/c564k2FisjFZZs1Ryvewke7xYXu7YJ0EVLwIMtD31/A2RcG+UQnIvnNIHeyj5ibgCy+6nat7j/dY63Tj5pDNlJCPgYrWt4F57ZUeNzQEolGcdPxhuzaMLDzAwm6KQpaNRI/IqYVp42y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw6A77VQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw6A77VQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94D91F00A3A;
	Tue, 21 Jul 2026 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628006;
	bh=SoA1a9Eu7sBeHdkMzDDnLppAClMd5Y6AAqY5c0MFLhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jw6A77VQhtyD4CPzFOhxi3l++bu6x+vVzcKWmFG+NTpkt7kfdLdiDD73hNb+SUgyA
	 RIF+uiZWH3yrKrS20watxAIA3DtQr7oB/PEBvOkg2jyYWWQZxlCya1Xd2YYrO78YLv
	 hzTxLir2akkMnSIG/b3+hCTKgPbSLfmHEYtUrWxNKq9hmj0zQbljh3OtXEBzqypYzF
	 2DFvILH+7ZcuUw/7/dF9+f8KMYJbsRJ9RAD+eC5AfBAF48Ead6fAB6Q4/o6sR+zYsr
	 epaVL9KKXrT7U8i8nrk+TfUf87KuPa593P7RRHBTBP25La6kB8fbCUlLgeZEhqLpHm
	 WqNq1/FuUhp6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-ctl2301-v2-6-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-6-ef5fb342872a@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:00:05 +0000
Message-Id: <20260721100005.B94D91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PWM duty cycle calculation can overflow and wrap around to 0, comp=
letely turning off the fan when maximum speed is requested.
--

--- Patch [6]: [PATCH v2 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM26=
0 ---
commit 2adeea2e46046fc26168a60ad26929de961f2f43
Author: Troy Mitchell <troy.mitchell@linux.dev>

riscv: dts: spacemit: Add CTF2301 on K3 CoM260

This commit enables I2C6 on the K3 CoM260 module. It sets the I2C6 pin power
source and describes the Sensylink CTF2301 temperature sensor and fan
controller.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boo=
t/dts/spacemit/k3-com260.dtsi
> index a38d7b738258d..95a60fbb411f8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -26,6 +26,25 @@ reg_5v_sys: regulator-5v-sys {
>  	};
>  };
> =20
> +&pinctrl {
> +	i2c6-1-cfg {
> +		i2c6-1-pins {
> +			power-source =3D <3300>;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c6_1_cfg>;
> +	status =3D "okay";
> +
> +	temperature-sensor@4c {
> +		compatible =3D "sensylink,ctf2301";

[Severity: High]
This isn't a bug introduced by this patch, but adding this sensor node
exposes a pre-existing PWM duty cycle calculation overflow in the lm63
driver.

When the fan controller computes the duty cycle in drivers/hwmon/lm63.c:

drivers/hwmon/lm63.c:lm63_pwm_to_reg() {
    ...
    return (val * data->pwm1_freq * 2 + LM63_MAX_PWM / 2) / LM63_MAX_PWM;
}

If the bootloader configures a low PWM frequency (setting the register > 12=
7),
data->pwm1_freq will exceed 127 without bounds checking.

When maximum cooling is requested (val =3D 255), the arithmetic evaluates to
256 or more. Because the function returns a u8, the value implicitly
truncates and wraps around to 0.

Can this completely turn off the fan when maximum cooling is requested?

> +		reg =3D <0x4c>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-ctl2301-v2=
-0-ef5fb342872a@linux.dev?part=3D6
