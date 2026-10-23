Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747657;
	b=Q2Yx01vYXKViuWSmnQdQtgedizqYhj9OxkK/vIzXkTNQrM9uR08rwsbTiIg0uzRL/LIk
	 uWEwJSPCtFfoGO9s9fBRA5w0bQO7loRvjDED9ZnxEqarIXg5zK/fwyM2F79uy3A31wljc
	 Pj62VJaH/hkPDuCNtQFOCpIO2LjCoImIuiD+QSh2/IB0cCIf/Vhvb3c5LF+pxndOHdQfJ
	 cL2GsjL8OWzBKPxDbQXuMnufU1KmY0882fvVpwAKrpjUGYqne78dX4wFtEIGKlRL2tJ3z
	 +wqQfsy6X/tasnHx1sI3mIdtBlbL9REcppeyLTeuLZEwTbdI9VyYo6D5lGA223EVq+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747657;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jL71KIEgbMUMKehO1vN18vZ/bKjnUVvoHzDIKuen4qQ=;
	b=O3/Cyf8fm76rJEv0lnHA2cWYitc6ZRxsoE+VD09AvJSNmesh3xrYK1FfFQ1VdmG8Qn/O
	 jVDnkEWtqS5lNcwbBqOtnemFPRIfdvoDC1WJy/zCO7zifzFTWGGLZJL4YaUOFvAIaqt1a
	 r+Qe6wJzqTccutIKzGrzq502FghEwBRPM0+u4sSs426r2kcX0inU9hfdx8JkJGFp/R9CF
	 BAwe6D5yNcZmcFEn5+S3fxZhpyjAlcviFU7l2He6DNuCki49OC2JH7HRgfoZHHYpIo/QD
	 0CqScp+lic5ewEbVwLBQUWeuQEEw+0p/tIdw0CEpyuGU5IQTbsHlhn5Axy3J+F2RZ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPGgBVR4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D6606A31A;
	Fri, 23 Oct 2026 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPGgBVR4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7FE1F01825;
	Fri, 23 Oct 2026 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747657;
	bh=jL71KIEgbMUMKehO1vN18vZ/bKjnUVvoHzDIKuen4qQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LPGgBVR4Xz7bCJOcXAIq0Is6uD3f+cPfk/Zf2fGEogDK/D4oC7gFB04/ZYqwWOo5o
	 nWw1f6P+E3n6ViRY/VOhG3lIXGNDtxprxKVka4I1Y6bGg4qTjJFZRH2ITcPhxA9DsE
	 J9GMRlKqYlCQk0KufgJxFzLkbik2J+qE/bjBQZQZ5EkENHW4DqQFPIFNeLBWoc/O71
	 5V6xb4N1Jahh7MDUJsk3bHtjX8GwM6Ck2Uv+c3MP1ktO/V4brz4RpfixvsvjogJN7c
	 6higRovt6qLZLIoKAMEOLAlx12e7YQTj2n0J7VloiEXN5LBJLFVQyqv5AxDM1nIyJI
	 4NMa2GLHeb4PQ==
Message-ID: <sashiko-outbox-182591@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (lm75) add MAX31875 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:27:36 +0000
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
- [Medium] hwmon: (lm75) wrong shutdown bit used for max31875 in probe and =
PM callbacks
--

commit 35ce43dc6fc53387d6a1aa3a7019a45b202c43af
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

hwmon: (lm75) add MAX31875 support

This commit adds support for the Analog Devices / Maxim MAX31875 I2C
temperature sensor to the lm75 hwmon driver, configuring its 16-bit
configuration register, resolution, conversion rate, and alarm bit.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 2d2d752aeac9d..349648fd08e15 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
[ ... ]
> @@ -222,6 +223,16 @@ static const struct lm75_params device_params[] =3D {
>  		.default_resolution =3D 16,
>  		.default_sample_time =3D MSEC_PER_SEC / 20,
>  	},
> +	[max31875] =3D {
> +		.config_reg_16bits =3D true,
> +		.set_mask =3D 2 << 13,	/* 10-bit resolution */
> +		.clr_mask =3D 3 << 13 | 3 << 9,	/* resolution, 4 s conversion rate */
> +		.default_resolution =3D 10,
> +		.default_sample_time =3D 4000,
> +		.num_sample_times =3D 4,
> +		.sample_times =3D (unsigned int []){ 125, 250, 1000, 4000 },
> +		.alarm =3D true,
> +	},

[Severity: Medium]
Does the driver manipulate the wrong shutdown bit for max31875 during
probe and system suspend/resume?

For devices with config_reg_16bits set to true, lm75_i2c_reg_read() and
lm75_i2c_reg_write() use i2c_smbus_read_word_data() and
i2c_smbus_write_word_data(), placing the first I2C byte (datasheet D15:D8)
into bits 7:0 of the register value and the second I2C byte (datasheet
D7:D0) into bits 15:8.

Under this layout, MAX31875 places One-Shot (D8) at BIT(0) and Shutdown
(D0) at BIT(8), whereas LM75_SHUTDOWN is defined as 0x01 (BIT(0)).

In drivers/hwmon/lm75.c, lm75_generic_probe() calls lm75_write_config():

static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
				    u16 clr_mask)
{
	return regmap_update_bits(data->regmap, LM75_REG_CONF,
				  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);
}

And the power management callbacks in drivers/hwmon/lm75.c also use
LM75_SHUTDOWN:

static int lm75_suspend(struct device *dev)
{
	struct lm75_data *data =3D dev_get_drvdata(dev);

	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, LM75=
_SHUTDOWN);
}

static int lm75_resume(struct device *dev)
{
	struct lm75_data *data =3D dev_get_drvdata(dev);

	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, 0);
}

Because device_params[max31875].clr_mask does not include BIT(8) and
lm75_write_config(), lm75_suspend(), and lm75_resume() operate on
LM75_SHUTDOWN (BIT(0)), won't system suspend and resume toggle the
One-Shot bit instead of placing the chip into shutdown mode, and won't
lm75_generic_probe() fail to clear the shutdown bit if the sensor was
already in shutdown mode prior to probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023091550.1494=
-1-johnerasmusmari.geronimo@analog.com?part=3D3
