Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7F44B695;
	Wed,  3 Jun 2026 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486828; cv=none; b=trxqs6NkCYZnK6KIwmHPNyYLo+2aBnnQ5qJ9QhqMQAa+yjRsC9DaFEJTT00AVj6wWljN7UXU2Ww8VkpkEfaDcVuion0xb/ODjuOOOpPDA7yFqbI3DzFvMF7xPu3OvaHVw5S0DECMUQecw8YEWAODhDTrrOlkj6wUtjQdDdf97XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486828; c=relaxed/simple;
	bh=CfjNWz8SwtVZJCJ2JiaNHvokfSpedGZd0oFN9G2AFj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V6BThA63SnDBABl0g0eTrE73yrQoaKQIGzMm1vXsb+3yWUDFH3shppnMcagMURTrrhZ7QU7nXOhvVUx/bdo0LIf3/4hyUw9gwOcw4XJNKnKcRyCLq0OeYV4gTDmVPVT7EsTbMTEGyMCoGMLyEjvGa73ndLWJwXl3ooZ9JirPDZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkMKbCIF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkMKbCIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709611F00893;
	Wed,  3 Jun 2026 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780486826;
	bh=DfH9TDeiAg40ZecixiMl6PipqGnTSqO2Fp/540KKfjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HkMKbCIFnbCg0Dsyjw/xVPDRmzbJ+mqcOu0eI2+e0xR/U0RxgLzTj6Luwv1oos0Pr
	 IyJJFAGuiifYXOQWMREpX9zm0utnj4AhUJoYc+/mCZHeDZTk40SP0JWpRaT6BAFXAv
	 tfyODMCxu0KzxX0d6Nc/+VCwd9ZDRtaVcC7DObFGmKiT67WdA7KzKSKjTc73Lv23eI
	 5WXQ+qU3DO6IflzB+vPenmNHmb1aqlZojwPr/Sj/b2xSOpVJr29xD74sB3f7fLEZMC
	 AKeBC89656rbtQGqiSUB0RV2gt+cInRtUt+gwJkGC6TmdVEpqhYDOFev5dhMNPcIQL
	 UYteP0YPqSlMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (adt7462) Add of_match_table to support
 devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain Gantois" <romain.gantois@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-adt7462-bindings-v1-2-301304bcf774@bootlin.com>
References: <20260603-adt7462-bindings-v1-2-301304bcf774@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:40:26 +0000
Message-Id: <20260603114026.709611F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Using `of_match_ptr()` prevents the driver from being matched via A=
CPI PRP0001 when `CONFIG_OF` is disabled.
--

commit c2691e00dcd763957c6a2291880ea9079be2bbda
Author: Kory Maincent <kory.maincent@bootlin.com>

hwmon: (adt7462) Add of_match_table to support devicetree

This commit adds an of_match_table to the adt7462 driver to enable
devicetree probing.

> diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
> index 174dfee47f7a7..ef6e5252dc0a4 100644
> --- a/drivers/hwmon/adt7462.c
> +++ b/drivers/hwmon/adt7462.c
[ ... ]
> @@ -1814,10 +1814,17 @@ static const struct i2c_device_id adt7462_id[] =
=3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, adt7462_id);
> =20
> +static const struct of_device_id __maybe_unused adt7462_of_match[] =3D {
> +	{ .compatible =3D "adi,adt7462" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, adt7462_of_match);
> +
>  static struct i2c_driver adt7462_driver =3D {
>  	.class		=3D I2C_CLASS_HWMON,
>  	.driver =3D {
>  		.name	=3D "adt7462",
> +		.of_match_table =3D of_match_ptr(adt7462_of_match),

[Severity: Low]
Does using of_match_ptr() here prevent the driver from being matched via
ACPI PRP0001 when CONFIG_OF is disabled?

When CONFIG_OF is disabled, of_match_ptr() evaluates to NULL, hiding the
of_match_table from the driver core. This prevents the driver from being
matched using ACPI PRP0001, which relies on OF compatible strings even on
systems without Device Tree.

Would it be better to drop of_match_ptr() and assign the table directly,
along with removing the __maybe_unused attribute from adt7462_of_match?

>  	},
>  	.probe		=3D adt7462_probe,
>  	.id_table	=3D adt7462_id,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-adt7462-bi=
ndings-v1-0-301304bcf774@bootlin.com?part=3D2
