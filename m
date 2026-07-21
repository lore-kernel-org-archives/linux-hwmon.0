Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0960844D6B4;
	Tue, 21 Jul 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628041; cv=none; b=mZmaB1lO/V903GKPMBG8nvbDf6pcDV+1fuwIHFlwnFgb+3qvqZEI9EysbjlbqUzWaoAYJeRJ9t7dBsFONNTmoX0chlEOCnEAjd6Zx3E468jx1PEz1bFscMG6LllyrDDAjYCG0t+pDIWZUrIpMqkdYK6GAJmBpuehvnDgT1r1pIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628041; c=relaxed/simple;
	bh=WGba1x/Q1XYzDJMMpYZHSmt4t0PD8ePLBJvO8rmKm9A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qmsOxoC9Qqkk1Su26x9CWx77ocHExbqUBeBxqrfBLkxSuMnomN9P2Evz5jVcfTjWujPaoMPJsJmVL5rP/Vl8DNDTkEH1bQnb4Kz43CgVcB4Wz49cLoFVpiT9YsuM4YNq8w1j9+dLQSKjVBlwDOXZXhdQn1ndpcladZ2qaKzOaWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRE3U8rb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRE3U8rb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6A41F00A3A;
	Tue, 21 Jul 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628039;
	bh=tBu8sbcdQ12GODqAsjDs3dTGtAHTHFkqhQMLfdE0uRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fRE3U8rbPSp7h+CvSMnfgOZvt5FFirUTpWqMfqfACLbZRFdu3pqruktRUTYSRzeko
	 PiXkrgBKmPqFt1tevJzqMvGKsv9mjXt7Yf1jRTQs0/VQghz3m8WsNnHnngaRPco9bj
	 C3ePcab+gW9BTiaXQT59X8SlongghkQsGdjLgXcBjnd3SxBwz2T9n2YlLNJSZMchmT
	 mxBJRT53+YIWvSlMdxYZ5LaCa4VU8624Z5eWCG2651Kzak4OmC/2PdwZzsQax3Mi1U
	 N5ChBeMp9fFNUxsiBoOYvE9AijHbHs/7sUGOC7b59Qo78cNW55FKohiBmVEE6ru7GD
	 lprIKf6rGItEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-ctl2301-v2-5-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-5-ef5fb342872a@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:00:38 +0000
Message-Id: <20260721100039.0E6A41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `drive-strength` value `18` is invalid according to the Spacemi=
T K3 pinctrl binding schema, causing `dtbs_check` validation failures.
--

--- Patch [5]: [PATCH v2 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl sta=
te ---
commit 7b36908eb32982b060ee59a7f9ad3d2f49fdd88e
Author: Troy Mitchell <troy.mitchell@linux.dev>

riscv: dts: spacemit: Add K3 I2C6 pinctrl state

This commit adds the I2C6 pinctrl state for K3 boards that route to pads 7=
=20
and 8, omitting the board-specific IO voltage selection.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> index 3ee1471f37985..91cd08099e276 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> @@ -78,6 +78,17 @@ gmac1-phy-0-pins {

[ ... ]

> +	/omit-if-no-ref/
> +	i2c6_1_cfg: i2c6-1-cfg {
> +		i2c6-1-pins {
> +			pinmux =3D <K3_PADCONF(7, 6)>,	/* i2c6 scl */
> +				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <18>;

[Severity: Low]
Is this drive-strength value supported by the binding? The value 18 doesn't
appear to be valid according to the SpacemiT K3 pinctrl binding schema
(spacemit,k1-pinctrl.yaml), which triggers a dtbs_check validation failure.

Since the driver's spacemit_get_ds_value() will silently fall back to the=20
next highest valid value (like 21mA or 25mA depending on voltage), could=20
this cause an unexpected mismatch between the requested devicetree state=20
and the actual hardware configuration?

> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-ctl2301-v2=
-0-ef5fb342872a@linux.dev?part=3D5
