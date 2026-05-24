Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F86B31F9A7;
	Sun, 24 May 2026 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779658636; cv=none; b=RIXCTflM40UIylGUB3o5F0mJ05CsmY+5h4A3+o03y8/+l8ucfUJYFkETWqF0zHHLeE9B8DY49byvJ8O6Q85diTVais86R8kP4SjMNhakAA/thvPF9GmASCu60ilLEXCg4BTBiu3VccYAe8AO+hVTOjpw8vlHAde4fdnOzViDxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779658636; c=relaxed/simple;
	bh=j2QPNcxSh4BS75E5BSKw8B084oAtPnSbhFBD9LTiEFA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W/9XSr/cUzTNGO/ydcQgWgKzk89QYbOG/2osiPpxr3LyVK8x5l4qfhx8YzHjSbAmpBqBA0pjfyaU2zA56WH5614nrUsyXQuiWQFBSMQBFnLNdMGeHML2sbcwLQ9vpxCbi+A6g1ClrNCv76qFYMruNNRXZJ/q+Q1pQg/sJyU/Nis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRks5jvp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRks5jvp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4084A1F000E9;
	Sun, 24 May 2026 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779658634;
	bh=UxreL2xCDAvofEAynAn+CGiECFVDKCrcBodPDP6h6uU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRks5jvpv+bonwdybSRGBachdUCi4bpfJkegm6QEbh/wTNaDkVmK7iyNx79zKNFWL
	 AG2rARQ/cqpQzVQJYKC2Tx54L/XVLLEAsqWRGfFisa9Jaz9F7oP5NYtlHW3inkjK0X
	 4FJCTg+tmaooLVlvYcUeqNmzzox2f7TAMRyEzd6kSDwSjOM4Jk7Mk/Yn0pMDc3PpED
	 Y/KxPHM2/WBeqpFrGoRyjCtv1zADTBaJgtzbk/XBqbQYQmMOl46i/F0ptzfi3vHxvc
	 gyFEdiE4QQjXYMKyPrFquiI0f5LK7bLs+OzJ5H/MeOg738eircx29zu7odYP6XD9RE
	 Zz/H9/wejj6yw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 3/4] iio: flow: add Sensirion SLF3x liquid flow
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260524205112.26638-4-wafgo01@gmail.com>
References: <20260524205112.26638-4-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 21:37:13 +0000
Message-Id: <20260524213714.4084A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The fractional scale for the SLF3S-4000B variant evaluates to exac=
tly 0.0 in sysfs due to IIO formatting logic, permanently zeroing out flow =
readings for userspace.
- [Medium] Concurrent initialization of the shared global `slf3x_crc_table`=
 in `probe()` causes a data race.
- [Medium] Continuous measurement mode is not restarted after a system susp=
end/resume cycle.
--

commit 2a3dbf69e1c64c32d26f6f97455487233c63c7c0
Author: Wadim Mueller <wadim.mueller@cmblu.de>

iio: flow: add Sensirion SLF3x liquid flow sensor driver

Add an IIO driver for the Sensirion SLF3S family of digital
liquid-flow sensors. The supported sub-types (SLF3S-0600F,
SLF3S-4000B) share the same register map and command set and are
distinguished only by the flow scale.

> diff --git a/drivers/iio/flow/slf3x.c b/drivers/iio/flow/slf3x.c
> new file mode 100644
> index 0000000000000..e4ee1a04a46d7
> --- /dev/null
> +++ b/drivers/iio/flow/slf3x.c

[ ... ]

> +static const struct slf3x_variant slf3x_variants[] =3D {
> +	{ .sub_type =3D 0x03, .name =3D "slf3s-0600f",
> +	  .scale_num =3D 1, .scale_den =3D 6000000 },
> +	{ .sub_type =3D 0x05, .name =3D "slf3s-4000b",
> +	  .scale_num =3D 1, .scale_den =3D 1666680000 },

[Severity: High]
Will the fractional scale for the SLF3S-4000B variant permanently zero out
flow readings for userspace?

The driver returns IIO_VAL_FRACTIONAL with val =3D 1 and val2 =3D 166668000=
0.
The IIO core formats fractional values for sysfs up to nanounit precision
(9 decimal places) using the calculation (val * 1000000000LL) / val2.

Because the denominator (1,666,680,000) is strictly larger than the 10^9
multiplier, the integer division computes to exactly 0. As a result, the
string emitted to sysfs will be 0.000000000.

Userspace applications rely on this sysfs attribute to convert raw readings
into physical units, meaning any flow rate reading will be multiplied by 0.=
0,
rendering the sensor's flow channel completely non-functional.

> +};

[ ... ]

> +static int slf3x_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct slf3x_data *sf;
> +	int ret;
> +
> +	ret =3D devm_regulator_get_enable_optional(dev, "vdd");
> +	if (ret < 0 && ret !=3D -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to enable vdd\n");
> +
> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*sf));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	sf =3D iio_priv(indio_dev);
> +	sf->client =3D client;
> +	crc8_populate_msb(slf3x_crc_table, SLF3X_CRC8_POLY);

[Severity: Medium]
Can this concurrent initialization of the shared global slf3x_crc_table cau=
se
a data race?

The driver defines a global static array slf3x_crc_table and dynamically
populates it by calling crc8_populate_msb() unconditionally during
slf3x_probe().

If multiple SLF3x sensors are present and probed concurrently on different =
I2C
buses, or if a newly plugged sensor is probed while an already-registered
sensor is handling an active read, multiple threads will concurrently modify
or read the global table without synchronization.

This could result in transient -EIO errors or Kernel Concurrency Sanitizer
warnings.

> +
> +	ret =3D slf3x_read_product_info(sf);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "product info read failed\n");

[ ... ]

> +static struct i2c_driver slf3x_driver =3D {
> +	.driver =3D {
> +		.name =3D "slf3x",
> +		.of_match_table =3D slf3x_of_match,
> +	},
> +	.probe =3D slf3x_probe,
> +	.id_table =3D slf3x_id,
> +};
> +module_i2c_driver(slf3x_driver);

[Severity: Medium]
Will continuous measurement mode fail to restart after a system suspend/res=
ume
cycle?

The driver initiates the sensor's continuous measurement mode (0x36 0x08)
exclusively in probe() and assumes the device stays in this mode indefinite=
ly
to fetch samples on demand in read_raw().

However, the driver does not implement power management suspend and resume
callbacks. If the system suspends and the sensor loses power (e.g., via
regulator cutoff), it will wake up in its default idle state.

Without a resume callback to re-issue the continuous measurement command,
subsequent read operations in read_raw() will return invalid data, silently
breaking the driver after a suspend/resume cycle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524205112.2663=
8-1-wafgo01@gmail.com?part=3D3
