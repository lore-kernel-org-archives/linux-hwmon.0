Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978541;
	b=4pQhL1SFjRjXw8uOU4Fc6DyRsJbtznkazie7QwQCA9Wh66WUMSs5sHZIbjyn9y6gIZGb
	 237e5ZeTE5vpDpsff5a/R+1jWjfr/W/q0UsYpSMAb1yQ/yVn3ovvtv8sqCnAJVtU6hvWJ
	 FsWSFqGfhkcJ5MByvZQlV3JY3yfUcE9FXUpACKQY8QMlPd3F/hCM0W9yC31i7T48K8iYT
	 8Q2/TdCa2yU8igrQrdxxgTZBL9gRFmnDHlnT4GSE0KmMBrs5EwWkiXxR4oH/rFcvsrasU
	 EJSPyyQClx+xVv0M34uSfbe964J1vmdsJvOV0y3GehjkLw660pNiM5dRtYNjOmE/2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978541;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aR0PVOV/MIjbgzWQ5KBIPD8B6ZM/CAr5Hcf6iZ5aK50=;
	b=rtHBrKlu8MZeqhWKouPiRGhuUqtLY/QBwgiEbA+iNswFSk1bCfMgsB9OaDYA/Q4khMFQ
	 IrQnBuBXEOKCEJSOYxuZdw/qdh4D+ezkFGfRni+PA3QaOIIF3Ov7gKPS9BTECB1k+GHXs
	 DzmViUFoI6/3wPRQkCG+qkDwI/hPn8pR6uf4bw8FAnUFUvTvTytsLqRBHmVrHVF4OUa1q
	 7x4Ds1d64bsKkJ3MzoxK7nq+s7qSQfN+QzH5VwgS1vjbSSIt0ZqXLO3pKkxVWQRaHR9TI
	 4dMCeitTBpr5lH6z1XrIaTy2fZKsBLKqBXo8s3swRYPrL0BTURdelUgcVJt5HxINV5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAUmSsEa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B79606A321;
	Mon, 26 Oct 2026 01:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAUmSsEa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CC01F01825;
	Mon, 26 Oct 2026 01:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792978541;
	bh=aR0PVOV/MIjbgzWQ5KBIPD8B6ZM/CAr5Hcf6iZ5aK50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iAUmSsEat9sdLq307Kp7u7q80TWClPKn2AYvci4uhVZaij4D59jvttDD8yrl321aB
	 mcqIEaIVvSc1cLRIdUesSh9ekqmhfisTpiGVZflCHOzjiIueUIMBEwZq0KOXw42szL
	 ZGma685QGR5/SIw8F+Qp6Chy8yDk7AEpQZPV8fLx/Sv0XymEuZSPvtsKhlLmZTaTOe
	 iGGzqlXgzCaTWHHqmE+Nc4HXddAtqaGrbPyx1iILdcWmTavcJ5y0lo2Sp7DXoRciH3
	 djXmcx1c4NOkq806fhGXmNQcMAhTHq0YdaNt4iE0bjwLtUSM4Oh2Zwy3RCl4tTJ0hd
	 IYWJutK3SiCLw==
Message-ID: <sashiko-outbox-184583@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261026003918.155321-6-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
 <20261026003918.155321-6-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 01:35:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] regulator: sy7636a: registering hwmon device outside drivers/hwm=
on/
--

commit 3011502577fb90233215473b5182522faa4b0058
Author: Pablo Mazzini <pmazzini@gmail.com>

regulator: sy7636a: report the temperature

This commit removes the dedicated sy7636a hardware monitoring driver and
moves temperature reporting into the sy7636a regulator driver, reading the
thermistor register only when the rails are enabled.

> diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy=
7636a-regulator.c
> index 5705599d1b55e..816df7716c0e0 100644
> --- a/drivers/regulator/sy7636a-regulator.c
> +++ b/drivers/regulator/sy7636a-regulator.c

[ ... ]

> @@ -147,6 +148,52 @@ static const struct regulator_desc desc =3D {
>  	.of_match =3D of_match_ptr("vcom"),
>  };
> =20
> +static int sy7636a_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			      u32 attr, int channel, long *temp)
> +{
> +	struct sy7636a_data *data =3D dev_get_drvdata(dev);
> +	unsigned int mode, val;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, SY7636A_REG_OPERATION_MODE_CRL, &mode=
);
> +	if (ret)
> +		return ret;
> +
> +	/* the thermistor is only sampled while the rails are on */
> +	if (!(mode & SY7636A_OPERATION_MODE_CRL_ONOFF))
> +		return -ENODATA;
> +
> +	ret =3D regmap_read(data->regmap, SY7636A_REG_TERMISTOR_READOUT, &val);
> +	if (ret)
> +		return ret;
> +
> +	*temp =3D (s8)val * 1000;
> +
> +	return 0;
> +}

[ ... ]

> @@ -235,6 +282,15 @@ static int sy7636a_regulator_probe(struct platform_d=
evice *pdev)
>  		return PTR_ERR(rdev);
>  	}
> =20
> +	if (IS_REACHABLE(CONFIG_HWMON)) {
> +		struct device *hwmon_dev;
> +
> +		hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, "sy7636=
a", data,
> +								 &sy7636a_hwmon_chip_info, NULL);
> +		if (IS_ERR(hwmon_dev))
> +			dev_notice(&pdev->dev, "failed to register hwmon\n");
> +	}

[Severity: Medium]
Should the hardware monitoring driver remain in drivers/hwmon/ rather than
calling devm_hwmon_device_register_with_info() directly from
sy7636a_regulator_probe() in drivers/regulator/sy7636a-regulator.c?

Hardware monitoring drivers are expected to reside in drivers/hwmon/, and
when a chip's primary functionality is in another subsystem, its hardware
monitoring support should be implemented as an auxiliary or subdevice driver
in drivers/hwmon/ rather than registering a hwmon device directly from
outside drivers/hwmon/.

While the follow-up commit ("regulator: sy7636a: bind to the i2c device
directly") removes the mfd cell table in drivers/mfd/simple-mfd-i2c.c,
sy7636a_hwmon_read() only accesses the shared regmap via regmap_read() and
does not depend on internal regulator driver state. Could the temperature
reading check be kept in drivers/hwmon/sy7636a-hwmon.c (for instance via an
auxiliary device registered by the regulator driver)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026003918.1553=
21-1-pmazzini@gmail.com?part=3D5
