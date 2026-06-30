Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AC3783AC;
	Tue, 30 Jun 2026 02:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788091; cv=none; b=eF3MjJ0wb9BWIGAQUk4oZBfSZebYyOp4auUEgi27eSrsSaJ25mUAR1j1uR5nSaM5F6xFVqpaXgFQ+Ki30frrXJLJ0xuKUvUQMckf6w8Kh2dAJVDTuLJINePzZ3ui7OLztXmploRS2Su/AZecrEPtz4nuARBPxux04Z1cYtxIxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788091; c=relaxed/simple;
	bh=51pqVZ4vBKTLJi5n+VOhthhPSCq4fPeqR/fCxrtuM/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WpYYXaP9niJ9EErgQrRcFaNZHoHPLMIDfTmGmlB/rt7nGUk/fcapg1onGg/2vL26i/aANkRDytkUlOb7BQIVj4VlAfSwx1ttLE090hQMGdcyIfAAM/0YQC7jViJgeHlpaqyUrfrI5f13mr8aqNImgAH8r6HBPfG7DrErqdme5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHmaDCtT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHmaDCtT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2236B1F000E9;
	Tue, 30 Jun 2026 02:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788090;
	bh=GHDAFiS0PFCgDI4Nw7mJOMaFtu/cJce9HDs1nhFMDrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHmaDCtTZFtMCjYouFX3GTnVkZnJ098qbU3bMqvIT23wKse2qCk5HYs1ll4Qqjkey
	 vgpf78riI/Gb5XJFeqY76pvjGr/Q3pN1Kz6PvDG9rCZEAzFTBzjGt5OOk5xigfvRP3
	 mTE7Jdl1r2z+VjW2Z2m8e0y5bokaKUabLSQz8D5twsMUabXhth0ss1KLIRcTVsTFho
	 6/lgQBGbC8cCzyQzODa1pByW7Cweayto3tfFTEIAI01iU96N+ziZcYmwzpcSFBArCd
	 8yYZzt5PIwbqGQrj5rY8E3J43e/ao0EHnJ8sOu+Cnnjfnp2qmTkZdMdcFIiHTiPP+8
	 b6cBlybwc88pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:54:49 +0000
Message-Id: <20260630025450.2236B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing NULL check for the return value of i2c_get_match_data() le=
ads to a potential NULL pointer dereference.
--

commit 44325aff0c44d84d978feed33af57c60c31e89f3
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for max20830c and max20840c

This commit adds support for the MAX20830C and MAX20840C step-down DC-DC
switching regulators with PMBus interfaces. It updates the driver to handle
multiple device types by introducing chip-specific information structures
and matching data.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index a3abd24437e8e..252c77beb243c 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
[ ... ]
> @@ -60,11 +83,14 @@ static struct pmbus_driver_info max20830_info =3D {
> =20
>  static int max20830_probe(struct i2c_client *client)
>  {
> +	const struct max20830_chip_info *chip;
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] =3D {};
>  	struct max20830_data *data;
>  	struct gpio_desc *enable_gpio;
>  	int ret;
> =20
> +	chip =3D i2c_get_match_data(client);
> +

[Severity: High]
Can this result in a NULL pointer dereference if i2c_get_match_data() retur=
ns
NULL?

If an I2C device is instantiated via sysfs using driver_override with a
device name that doesn't exist in the driver's ID tables, table matching is
bypassed and i2c_get_match_data() will return NULL.

>  	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
[ ... ]
>  	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_=
DATA)) {
> -		/* Reads 9 Data bytes from MAX20830 */
>  		ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
>  		if (ret < 0)
>  			return dev_err_probe(&client->dev, ret,
>  					     "Failed to read IC_DEVICE_ID\n");
>  	} else {
> -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
> +		/* Reads 1 length byte + data bytes */
>  		ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> -						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
> -						    buf);
> +						    chip->id_length + 1, buf);

The chip pointer is then dereferenced here when reading chip->id_length wit=
hout
first checking if it is valid. Should there be a validation check on chip a=
fter
it is obtained from i2c_get_match_data()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D6
