Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1193B47E3;
	Tue, 29 Sep 2026 23:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723686; cv=none; b=GxhwZCmofBzTewqpV0BloltZGX+vyyP8vZM91zJvAFbl7SQtwVjTRFsRQbrX2Xet4BZ4bARckLvhMmR6hBGkQ50YNwrrVPdEU9ME2VcotvFQ0wpD+CK4XOHfMnPmtbifHtKQuB6TVfp83L6cI4pib8Fb++zSVZIgn5pfw6ywrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723686; c=relaxed/simple;
	bh=8LthqSel7JRmm5IkXrA1vWD5v6LyhZJbIEcjMba2I4w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yag/pTDib+4m7Rq3f3JmqugiBGVcvRpZi9hwH3iDlBQrCPWj6awlervLvp21QTFtQUQxR/NGBKUGKPOhZ03DT/4kgXOanGv5Z8QMg8hEUNKsN++Cz5oA6rxEY2SxGxkzK1JFlUl9Ezqv4e3UaxnICs+eQj9W/Cg0gZCqMh+yAjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hn7Do3M/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hn7Do3M/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1C91F000FF;
	Tue, 29 Sep 2026 23:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790723685;
	bh=hbTomVIXYjJ0n0N91lWxJ+disRhwak7aGrRsNiSkUQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hn7Do3M/nifQWl1zlCbZkDwoYLRWs+6sc/8ch2+MvpMqRNQnITZG650itAxXjGTOD
	 aCyJbqNct0zwZwE3qyqotodPijCoqfWCouQ2sG9Hf3tAMAWBFH2w49MP4ThWiwbQ9A
	 E+jv/f6YI99ylVMkK1lSIVEAfoa7k9BoMmn3G/1X0G4MHDs846PPgCyEjsSPJ1CG2v
	 nU2GhPdEb20BiEKd8C3OqkDl1U1DTrBUaUnfgaAXYOhxwETtInmMnOkxt5GI+cDc0V
	 xtUChTvcGOyH+RIWOfrLjs05ipgmiIZHk+TID48rnQlHnnC2D0CswiwK5m7mnjpDLS
	 i/UbIARdz2pmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389004/TPS389006/TPS389008
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luna Hart" <lhart.opensource@witekio.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:14:44 +0000
Message-Id: <20260929231444.BB1C91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: undefined behavior in GENMASK() due to unchecked i2c_get_=
match_data()
--

commit 5632ba367123600a6ee38c612901f594c35ee0df
Author: Luna Hart <lhart.opensource@witekio.com>

hwmon: (tps38900x) Add driver for TI TPS389004/TPS389006/TPS389008

This commit adds support for the TI TPS389004/TPS389006/TPS389008 I2C
voltage supervisors and monitors. It allows enabling ADC monitoring and
reading back the measured voltage in millivolts via sysfs.

> diff --git a/drivers/hwmon/tps38900x.c b/drivers/hwmon/tps38900x.c
> index 0000000000000..659d61b1cb55c 100644
> --- /dev/null
> +++ b/drivers/hwmon/tps38900x.c
[ ... ]
> +static int tps38900x_parse_dt_channels(struct device *dev,
> +				       struct tps38900x_data *priv)
> +{
[ ... ]
> +	// When no channels are explicitly described in the DT, expose all of t=
hem.
> +	if (!priv->channel_present)
> +		priv->channel_present =3D GENMASK(priv->num_channels - 1, 0);

[Severity: Medium]
Could this result in undefined behavior in tps38900x_parse_dt_channels()
in drivers/hwmon/tps38900x.c? If the driver is bound via sysfs
driver_override using an I2C device name not present in the driver's ID
table, num_channels would be 0. This evaluates to GENMASK(-1, 0), which
performs a bitwise shift by BITS_PER_LONG bits.

> +
> +	return 0;
> +}
> +
> +static int tps38900x_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct tps38900x_data *priv;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -ENODEV;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->num_channels =3D (uintptr_t)i2c_get_match_data(client);

[Severity: Medium]
Does this code in tps38900x_probe() in drivers/hwmon/tps38900x.c allow 0 to
be stored as the number of channels? If i2c_get_match_data() returns NULL
when a user binds the driver via sysfs driver_override, num_channels becomes
0 without being checked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-lhart-dev-=
tps38900x-v1-0-7045c5894152@witekio.com?part=3D2
