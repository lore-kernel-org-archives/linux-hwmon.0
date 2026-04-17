Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6712B94
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416361; cv=none; b=DUEzG1herHwtUQAcq3zMwO+03DWIt2bL+HnAwTwpcGJxM1d+aO279kQ1KrnGi+UxLel+02+ZfkrRHdf2ovHsLybwGe7LZtmJukg1+N0XgxDngUqOmiCwLmziF1muhcoSjbX/a7SZlWfWGpJU4Iq/ZGF6YRgvqBcza6JqIvmC6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416361; c=relaxed/simple;
	bh=vM/o/kN4CdazQRZJ5agPgPSiMnAVBiQMUkA/nh5ZVdk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=noO3lC+kP+L2GDlfldttOwSc2pS5t0NtGmRwYBGkePnQDrnvoIlFzW1OqqCGRhqd8VxP0DB2f/4kqr4jC/29Wg/zFKVami2yhQM1LubtjdKFLG2FWxQl8ZIbycIeEXToEw+5mrlxzizU9Aa/ufT2xeByTCKx2PY0e1J8PZPWyqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5HjXR8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5HjXR8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7B9C2BCB4;
	Fri, 17 Apr 2026 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776416361;
	bh=vM/o/kN4CdazQRZJ5agPgPSiMnAVBiQMUkA/nh5ZVdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=S5HjXR8kt71R3HM3hMcOHCVTy4H7sKxLISu/OMWSnpaYp1F7kzX/LUl6aU0+zUVQb
	 cUtEQUa36nXzqJ6w9sNN/0clD3sBlq2INNsvs88U4nseYIloAZOAVUToFn15thVWqq
	 sweukMsgit/SOXEJvNYvc3BM/mfHArDSxDe+oEaGNGaIyT/sP/d7Aq6LEDdBPvSbQ8
	 kgSv9lPCltxg/ageHsDdEpCSQ8D3yZcE3mHiRR+kcKrWT5ap9Np4hoP+DDaEZY6+rz
	 +iGvcpZ+a74ZKcCWyUas3bc9xd8FjPYYvmRsocsKRpd2FO8KSTSAWLipR65yMhabbF
	 q8qKwuDFquhFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20830) add driver for max20830
Reply-To: sashiko@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260417-dev_max20830-v3-2-0cb8d56067aa@analog.com>
References: <20260417-dev_max20830-v3-2-0cb8d56067aa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2026 08:59:20 +0000
Message-Id: <20260417085921.5D7B9C2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [High] Unconditional requirement of I2C block read breaks support for sta=
ndard SMBus controllers.
- [High] Incorrect parsing of SMBus block read ByteCount leads to probe fai=
lure or short-read acceptance.
- [Low] Pointer sign mismatch warning in strncmp().
--

commit e81b5e8d851a24ad6bc004153df89f39f490846a
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830) add driver for max20830
   =20
Adds support for the MAX20830 step-down DC-DC switching regulator with
PMBus interface. It allows monitoring of input/output voltage, output
current and temperature through the PMBus serial interface.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> new file mode 100644
> index 0000000000000..b1c6985067d7c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20830.c

[ ... ]

> +static int max20830_probe(struct i2c_client *client)
> +{
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] =3D {};
> +	u8 len;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> +		return -ENODEV;

Does unconditionally requiring I2C_FUNC_SMBUS_READ_I2C_BLOCK break
compatibility with standard PC/server SMBus controllers (like Intel i801 or
AMD piix4)?

These controllers support I2C_FUNC_SMBUS_READ_BLOCK_DATA but may not support
arbitrary I2C block reads. Since PMBus is an SMBus-based protocol, should
the code prefer standard i2c_smbus_read_block_data() and only fall back to
I2C block reads if native SMBus block read functionality is missing?

> +
> +	/*
> +	 * Use i2c_smbus_read_i2c_block_data() instead of
> +	 * i2c_smbus_read_block_data() to support I2C controllers
> +	 * which do not support SMBus block reads.
> +	 */
> +	ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> +					    I2C_SMBUS_BLOCK_MAX, buf);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read IC_DEVICE_ID\n");
> +
> +	/* First byte is the block length (including itself). */
> +	len =3D buf[0];
> +	if (len !=3D 9 || ret < len)

Is this byte count check and length calculation correct? The SMBus
specification states that the ByteCount specifies the number of data bytes
and does not include itself.

If a spec-compliant device returns a ByteCount of 8 for the 8-character
string MAX20830, won't the len !=3D 9 check incorrectly abort with -ENODEV?

Additionally, does ret < len correctly validate the read size? If ret is 9
(1 length byte + 8 data bytes), the check ret < len (9 < 9) evaluates to
false, passing the check. However, a ByteCount of 9 means 9 data bytes were
intended (10 total bytes).

Should this validation check be ret < len + 1 instead to avoid silently
overwriting a missing 9th data byte?

> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "IC_DEVICE_ID length mismatch: reported %u, read %d\n",
> +				     len, ret);
> +
> +	/* Data is at buf[1..8], so null terminator goes at buf[9]. */
> +	buf[len] =3D '\0';
> +	if (strncmp(buf + 1, "MAX20830", 8))

This isn't a bug, but buf is defined as a u8 array and strncmp() expects a
const char pointer. Does this trigger a -Wpointer-sign compiler warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260417-dev_max208=
30-v3-0-0cb8d56067aa@analog.com?part=3D2
