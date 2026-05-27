Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB04389473
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910806; cv=none; b=SYXzYkhRx5j0d38/TnrNhDzgrLvu3f1lFwwFx7WAH1eC/g+Vy3JPz+muVIN57Sx1UB4vz89citfhKhrPYNUzVBSoYJubLqzPtqRgdPIu9IghZ5VzNKsU3hE1Eq0m22x2xbWXh0ctLj2EsGUPBbYJRO88FQ/kbzRBqX+RXOXpGwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910806; c=relaxed/simple;
	bh=0VGvNgVa0/sCZLYfssfZIMLX3krCq+UYyQLChMx4H+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f/ODOXobU0DPAGCt3yk/c4XAoOPwamIWQPingDw3nwBW+O6cvCrGdAJs8mactXRUva1WCQUvgkPBYc2El85/opQGen/tii43jWVI1JjodWgtF1uPQhgU/udV5vGvVPvsGBAaXweKSaNTTXDs3xRDWiT3MkNjmPjbTpce61rFznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQnJugRT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQnJugRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631171F000E9;
	Wed, 27 May 2026 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779910800;
	bh=GL33VrjT4S8eH9XBxGvhFWho3pGkSrLHspASczwfE+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AQnJugRT+9FpwakxIL1nNmO0sSkzetmhLYNsz6vLpg6ZLNk5YQXmK44YObn9Oq5JJ
	 6xXttXSKKlwQ6i/AoxyOOT4XgOQWAfpvTPsSZOd6pGeVsOWqCG4evF8OcMMNKsq3bj
	 yV4dZ67mKIPagmUZTd5rDIfLJKdIJ2dkH0l+1ljayMzTJ6nV4p0gKUAmND49fGoCkp
	 L79ZxcI0ttbGny0Ufdtf9072WsTmDp/2yZQEsd0cKVusJGAPmfoMu6Ym2boG8Z55V4
	 /qwJRVTM8/Azz06njSyx0190jVvMSaZaXZ5ITBUUEax8H5cdqmTVMof2sLh5oyxZIN
	 JVVvYli/i6HJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] iio: flow: add Sensirion SLF3S liquid flow
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260527184257.141635-4-wafgo01@gmail.com>
References: <20260527184257.141635-4-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 19:39:59 +0000
Message-Id: <20260527194000.631171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Severe precision loss in the volumetric flow scale factor due to I=
IO formatting limitations.
- [High] Stack-allocated and .rodata buffers are passed to I2C transfer fun=
ctions, which is unsafe for DMA.
- [Medium] Missing power-on delay after enabling the VDD regulator before i=
nitiating I2C communication.
--

commit 929caccfae7a9335ed97004b15c2acb13710c7bc
Author: Wadim Mueller <wafgo01@gmail.com>

iio: flow: add Sensirion SLF3S liquid flow sensor driver

Add a driver for the Sensirion SLF3S family of digital liquid-flow
sensors (SLF3S-0600F, SLF3S-1300F and SLF3S-4000B) communicating over I2C.

> diff --git a/drivers/iio/flow/slf3s.c b/drivers/iio/flow/slf3s.c
> new file mode 100644
> index 0000000000000..f971a2dc2c0a4
> --- /dev/null
> +++ b/drivers/iio/flow/slf3s.c

[ ... ]

> +static int slf3s_send_cmd(struct i2c_client *client, const u8 cmd[static=
 2])
> +{
> +	int ret =3D i2c_master_send(client, cmd, 2);

[Severity: High]
Does passing cmd directly to i2c_master_send() risk a kernel panic?

Since the callers (like slf3s_detect_variant) pass .rodata arrays here
(e.g., slf3s_cmd_prep_pid), if the underlying I2C adapter utilizes DMA,
dma_map_single() will be called on these read-only buffers.=20

Using heap-allocated memory (e.g., a buffer embedded in the state struct,
aligned to IIO_DMA_MINALIGN, and protected by a lock) for I2C transfers=20
avoids this.

> +
> +	if (ret =3D=3D 2)
> +		return 0;
> +	return ret < 0 ? ret : -EIO;
> +}

[ ... ]

> +static int slf3s_detect_variant(struct slf3s_data *sf)
> +{
> +	struct i2c_client *client =3D sf->client;
> +	u8 buf[SLF3S_PRODUCT_ID_LEN];
> +	int ret;
> +
> +	ret =3D slf3s_send_cmd(client, slf3s_cmd_prep_pid);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D slf3s_send_cmd(client, slf3s_cmd_read_pid);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D i2c_master_recv(client, buf, sizeof(buf));

[Severity: High]
Can using a stack-allocated buffer for I2C transfers cause issues on systems
using DMA?=20

On architectures with CONFIG_VMAP_STACK enabled, mapping a stack address for
DMA is illegal and can trigger a kernel panic. This also applies to the loc=
al
buffer used in slf3s_read_sample().

[ ... ]

> +static int slf3s_read_raw(struct iio_dev *indio_dev,
> +			  struct iio_chan_spec const *chan, int *val,
> +			  int *val2, long mask)
> +{
> +	struct slf3s_data *sf =3D iio_priv(indio_dev);
> +	int flow, temp, ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->type =3D=3D IIO_VOLUMEFLOW) {
> +			*val =3D sf->variant->scale_num;
> +			*val2 =3D sf->variant->scale_den;
> +			return IIO_VAL_FRACTIONAL;

[Severity: High]
Does using IIO_VAL_FRACTIONAL here lead to severe precision loss for the
volumetric flow scale factor?

The IIO core computes the fractional scale string by evaluating
div_s64(vals[0] * 1000000000LL, vals[1]). For SLF3S-0600F, this evaluates
to 1000000000 / 600000000 =3D 1, resulting in a sysfs string of 0.000000001
(1.0e-9).

The true mathematical scale is ~1.666666667e-9. Truncating it to 1.0e-9
introduces a ~40% precision loss, which could severely degrade the measurem=
ent
accuracy when userspace calculates the actual flow.

> +		}
> +		*val =3D SLF3S_TEMP_SCALE_MILLIC;
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

> +static int slf3s_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct iio_dev *indio_dev;

[ ... ]

> +	ret =3D devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable vdd supply\n");
> +
> +	ret =3D slf3s_detect_variant(sf);

[Severity: Medium]
Could the lack of a power-on delay cause the initial I2C communication to
fail?

The driver enables the 'vdd' regulator and immediately issues an I2C command
via slf3s_detect_variant(). While the regulator core ensures the voltage has
reached the required level, it does not account for the sensor IC's internal
boot or reset time.

If the regulator physically toggles power, the sensor might require several
milliseconds to initialize before it can ACK I2C transactions. Could this
cause the sensor to NACK the initial command, leading to an -EIO probe
failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527184257.1416=
35-1-wafgo01@gmail.com?part=3D3
