Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A563CE4A3;
	Thu, 23 Jul 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790395; cv=none; b=c2Tfi/qWoh0PBeIsA0hE2xxepT+ml9wWoy+7yC02I7lKUyCZHx3LcrhSIw4i1hcHEHQbymoP/qQ7FXBGEkgy0R6D5GA4s90Q/ZuCQpBzNsSo4ZMOkmjaXlfsZC8pvBIVF7zS4OOLgsjCNVqhz0mSH5Hg28zUw1qt9ceWHJuOXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790395; c=relaxed/simple;
	bh=yXWCbKdW4y8jr59aCQtbKgTC6KkN/5zAPMLC9a8mQew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=snRU9ZkCub1xt5rSC7IDR2vYemUtuhLzKZPGbQ4sr8RexJxIY8yU0Wajt6yQrnFTolNadsJyNAS66HuWom8kLgdhSsv1mPd//WcaRhVSs+J4YOx4jGKEWS4wABj7mwsnbTImzlteRVyxEBCZoF3HL1d6fp+nkXlZPhme0v+ky1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXzbuwyi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXzbuwyi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6FD1F000E9;
	Thu, 23 Jul 2026 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784790393;
	bh=Bitx58NIBLwepXqTVFkGw2TJT/qjF1gDCN1N8/6iIXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JXzbuwyiAVhnFn+f2T4nbWcgGia11UeM0Dk/ipTd6NrwwnMcuLIb2fXRl5daKdKXf
	 UCosDfA64rt8u31d+UxFYEyADd5KrePBK6um7BIQb4+G4QtIHxit2GCeQ3NpS88RX+
	 iZ7qJHP2sKB5dldD7W/mcpPepHORZxADdCoH3I3COYjpK0A8pHYsAwZM9uGbPdw0E3
	 ad+iwkc7JS+n+IdGf64KsjHZ6J6Th94Xb5RlTJ9q1/vWmgkIhXQBPF9kreFt5ibCWO
	 m7qe43i3dzUDkJORnvkPbdtVkf//7ZoaUYNi+nNd0wm5DcKKe4Uj3Unz/dYUKax81Y
	 II0BhStlAfPfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723065036.2683075-3-stefan.popa@analog.com>
References: <20260723065036.2683075-1-stefan.popa@analog.com>
 <20260723065036.2683075-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 07:06:32 +0000
Message-Id: <20260723070633.2C6FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Software state can desynchronize from hardware configuration due=
 to TOCTOU race during concurrent sysfs writes.
- [Low] The i2c_device_id array is missing required named initializers.
--

--- Patch [2]: [PATCH v5 2/2] iio: adc: add MAX40080 current-sense amplifie=
r driver ---
commit 0c56883df0b122ded44daf6d01973fa32a6c55e4
Author: Stefan Popa <stefan.popa@analog.com>

iio: adc: add MAX40080 current-sense amplifier driver
   =20
This commit adds a direct-mode IIO driver for the MAX40080 bidirectional
current-sense amplifier. It exposes current and voltage channels over an
I2C/SMBus interface.

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..cdf626dccb24f
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c

[ ... ]

> +static int max40080_set_range(struct max40080_state *st, unsigned int ra=
nge)
> +{
> +	int ret;
> +
> +	ret =3D max40080_update_bits(st, MAX40080_REG_CFG, MAX40080_RANGE_MSK,
> +				   FIELD_PREP(MAX40080_RANGE_MSK, range));
> +	if (ret)
> +		return ret;
> +
> +	st->range =3D range;
> +
> +	return 0;
> +}

[Severity: Medium]
Since max40080_update_bits() acquires and releases the mutex internally,=20
does this leave the assignment of st->range unprotected against concurrent
sysfs writes?=20

If two threads write to the sysfs attribute at the same time, could the=20
cached software state become permanently desynchronized from the actual=20
hardware configuration, causing future readings to be scaled incorrectly?

[ ... ]

> +static int max40080_set_oversampling_ratio(struct max40080_state *st, in=
t val)
> +{
> +	int ret, filter =3D max40080_oversampling_to_filter(val);
> +
> +	if (filter < 0)
> +		return filter;
> +
> +	ret =3D max40080_update_bits(st, MAX40080_REG_CFG, MAX40080_FILTER_MSK,
> +				   FIELD_PREP(MAX40080_FILTER_MSK, filter));
> +	if (ret)
> +		return ret;
> +
> +	st->oversampling_ratio =3D val;
> +
> +	return 0;
> +}

[Severity: Medium]
Similarly to max40080_set_range(), is the update of st->oversampling_ratio
vulnerable to a race condition since it happens after max40080_update_bits()
has released the lock?

[ ... ]

> +static const struct i2c_device_id max40080_i2c_ids[] =3D {
> +	{ "max40080" },
> +	{ }
> +};

[Severity: Low]
Does this violate the I2C subsystem coding style guidelines which mandate
named initializers for initialized arrays of type struct i2c_device_id?=20

Should this be .name =3D "max40080" to prevent issues if the struct definit=
ion=20
changes in the future?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723065036.2683=
075-1-stefan.popa@analog.com?part=3D2
