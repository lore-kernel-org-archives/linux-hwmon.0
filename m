Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF8236AB72;
	Tue, 30 Jun 2026 03:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788581; cv=none; b=i7b6i3GKu3PFBrhxSct0Bm58HshzzWJ1F7dleyRhUdMpi6YoC3QLluFeaNCN0htz2GMCV5HFa+anZh4g/4m/iABeLGYln7hXOdhDP3rO+Vz9A+wMJ6PJhl1AZg1nshWH5DKpIfP3nx5tqOFigC4sStbyYZ3vGVJU2oOtQIiNEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788581; c=relaxed/simple;
	bh=yl0fczNmXhP2D+mIl+xPNfWgDIkRtGeutbpvRy5os08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XD6wRPerOSmQK6iGFD8l9z7ISn/X+UZUWZ5lGy8o5vKtGY5MVV80Z1mezFp4yL6N+VcMlMYXovsEDSgX7Wo6jred5tXlBznngA6BtJMT+o08rc2THXyPJ0JGIoarUYxLJmnuw0URMb+uaHC8NJBiV6/qD8kQbu/vCOw/hH9U9lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YluZ3Vq5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YluZ3Vq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B011F000E9;
	Tue, 30 Jun 2026 03:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788579;
	bh=1DzKjD4b1zUV+B0GEkGbnxH4AZ6Uhi/Qxixyq2TYqnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YluZ3Vq5JQvfp+Yu4eaZsxnar8WXPhwm6O350hVxpZObVg4EzWfnolHNnWz4UXWQI
	 Fcsi4qB6GZ4C8aDitt4HbkmMI33S2B4DJGC+cqEJt4Ed50Xowt6sk0CxZtTeFTxhHo
	 ATRnVEBDGf4pBJiT5Kiv8Im0pSglp0R8oT0A2+0/Ev1WWiViut9WNL+B4Rv7U2Z9nO
	 b16iGfpMO9hAZk0q8Uv339zEGJhfGkyxhijCoTv5/JDnNIvnt1W+L0JjCVWAM3Dkv4
	 jTmjGWvNVktI/RZ5lsuEN/ENYQGwpp1NZjU+8QNppdlZdPqHNcIk6mSnTv/Yo67ph0
	 WXQ2tAXK4GQEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-3-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-3-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 03:02:59 +0000
Message-Id: <20260630030259.A4B011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing initialization delay after asserting the enable GPIO cause=
s probe failure if the device was previously powered off.
--

commit a97eed13d5037d1e7850e1b18fc5fc3222705d55
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for enable GPIO

Add support for the GPIO controlled EN pin. The EN pin is asserted high
for device to operate.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index cb2c23672166d..cb3a39d747ede 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
[ ... ]
> @@ -29,8 +30,14 @@ static struct pmbus_driver_info max20830_info =3D {
>  static int max20830_probe(struct i2c_client *client)
>  {
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] =3D {};
> +	struct gpio_desc *enable_gpio;
>  	int ret;
> =20
> +	enable_gpio =3D devm_gpiod_get_optional(&client->dev, "enable", GPIOD_O=
UT_HIGH);
> +	if (IS_ERR(enable_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
> +				     "Failed to get enable GPIO\n");
> +

[Severity: High]
Could this cause a regression where the driver fails to probe due to a miss=
ing
hardware boot-up delay?

When the enable GPIO is configured in the device tree and the device was
previously powered off, asserting it with GPIOD_OUT_HIGH will power up the
device. However, the driver proceeds to call i2c_smbus_read_block_data()
shortly after without any settling time.

If the regulator requires a delay to boot up before it can acknowledge i2c
packets, this immediate read might receive a nack and cause the driver
probe to abort.

>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK=
_DATA) &&
>  	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_B=
LOCK))
>  		return -ENODEV;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D3
