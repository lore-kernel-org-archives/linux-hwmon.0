Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45F4E5341;
	Mon, 19 Oct 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411111; cv=none; b=XF79x2fPcPokpMQkQ3mS8AcaLKe1znxlg4wzkp6ZHK61nvavUZz0hulMYtowfrSmpMjxEoaMZItt/mccvk+wwbBL4lKmtB8G8OhX0hKWX8aykm4yfGqYOqa5L22PsJG6TZyS30lMcpCDuzDZsAcNnf0MzpKUp58VAmOYkoDLUj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411111; c=relaxed/simple;
	bh=cHIFotOLP+ROw61qDJefg+IYCNKivhosYztbis8JYQU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FXyYPPQXsiAmP/lyOHQOlxEulfLlZb/ldc+CMv1LPrkxO4xqaJ0VdSr7wJU00aCHYjw/T7+zXLbOeSRTBnzBbmMFzTWT9Ry6m0LTvfhug+oKoRDhXtt4fA2zN67W6pSyJL0bW4zBbPvn64aoqbJWKZFIiRqLZ/KIaFP8kkPI21c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwgtAJpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwgtAJpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A051F000C4;
	Mon, 19 Oct 2026 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792411109;
	bh=XXkiyHmxPpKgXcdDYmFrzlcV0nO6TkiWZPL1rL6OSg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DwgtAJpgBj70c/7kErysWDVz07y5wfrShA1yT8y2wryrAmIXaegpc9zwWIm+kLh5Q
	 afNc/Ja+zhmtlnUj6hwTMhKSQZwNePmOR5b7ENedb5jFotEzw9mJWOc3jnAECD+LT1
	 b7J/35xCBD+XTB+4U9jCFMb8cP4W+Oq1GkxsjizdgvsiSy2erWsXnRkOFIm79H8nYR
	 niHdLExe1mReiWsHmdgEnFoBFD96w3M/zyAVzL0XkxSAYBa0hsFPVaLFNy8IYXHZb4
	 w+QJ4yNL1MdMQ2eBFxhb1qSPJqsuZJnvtE54sm8HF7VxnxZ6cOB+2n/0f/2Zw8hh6H
	 XpZYJk5JM9yqA==
Message-ID: <sashiko-outbox-177057@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] peci: controller: Add StarFive JHB100 PECI
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019114502.55307-3-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:58:29 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] peci: starfive: missing reg_stride in starfive_peci_regmap_config
--

commit 2951f13eb5d64c12334f96bb237dfd0078d838b2
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

peci: controller: Add StarFive JHB100 PECI driver

This commit adds a PECI controller driver for the StarFive JHB100 SoC to
support PECI protocol communication for CPU thermal management.

> diff --git a/drivers/peci/controller/peci-starfive.c b/drivers/peci/contr=
oller/peci-starfive.c
> new file mode 100644
> index 0000000000000..9f59721b891df
> --- /dev/null
> +++ b/drivers/peci/controller/peci-starfive.c
> @@ -0,0 +1,367 @@

[ ... ]

> +static const struct regmap_config starfive_peci_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.max_register =3D STARFIVE_PECI_MAX_REG,
> +	.fast_io =3D true,
> +};

[Severity: Medium]
Should starfive_peci_regmap_config also set .reg_stride =3D 4?

When starfive_peci_probe() calls devm_regmap_init_mmio() with
config->reg_stride left at 0, __regmap_init() defaults map->reg_stride to 1:

drivers/base/regmap/regmap.c:__regmap_init() {
	...
	if (config->reg_stride)
		map->reg_stride =3D config->reg_stride;
	else
		map->reg_stride =3D 1;
	...
}

Because .max_register is set to STARFIVE_PECI_MAX_REG (0x100), reading the
regmap debugfs registers file (/sys/kernel/debug/regmap/<dev>/registers) wi=
ll
cause regmap_debugfs_get_dump_start() and regmap_read_debugfs() to iterate
across registers in 1-byte increments and issue unaligned 32-bit readl() MM=
IO
accesses via regmap_mmio_read32le(), which can trigger misaligned MMIO acce=
ss
traps or bus errors on RISC-V and return corrupted dump data.

[ ... ]

> +static int starfive_peci_probe(struct platform_device *pdev)
> +{
> +	struct peci_controller *controller;
> +	struct starfive_peci *priv;
> +	void __iomem *base;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D &pdev->dev;
> +	dev_set_drvdata(&pdev->dev, priv);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> +					     &starfive_peci_regmap_config);

[ ... ]

> --=20
> 2.34.1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019114502.5530=
7-1-changhuang.liang@starfivetech.com?part=3D2
