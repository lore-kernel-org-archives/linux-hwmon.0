Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2583B39446B;
	Mon, 20 Jul 2026 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518198; cv=none; b=mcF+7vk1IT40kVr3EOFb5rI64/6fHpl4tsMCy4Ka/K5sMM3wrIi/XvPE9PJIJ/XlfNtHz9dyOX2iG6No7EOmzFFnfbr+/1u0NB6UO0TgNVDPHkPxMzwDETum63ZSww7RtJHOsPqqhCyx2XbcEWvQO5wBGSx0FltTyEQ2wm3DPFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518198; c=relaxed/simple;
	bh=oFidktxrpl15Ellqs8AORyBqV7Ox4jhO2SjVEMBk9cM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h0PnsJrGciysf9zI0T1bx1SjK5Cn4RuUUr1jeESLdv3ZPwDL4hj4zDiCxJFQPvO12azUx1AuxAYVZwPRvcgRFk/nt+usSWj76bquQ0BqT/RLrbkAw3ig5LQFcBJPep++knxtaHrT5vmZA4lndxdTHA0k4is4xxBIHKmqKRl2mKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ck1SUy40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ck1SUy40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB041F000E9;
	Mon, 20 Jul 2026 03:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518196;
	bh=l69ItRx1+IV/PqCXjWSMetsdxIalnIdGCSwNO9fuY8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ck1SUy40+75Fg7MaTfE2PnFcY3saLacvX6ZH0FyskGWrSZS1g9wyyc/AWWa7+c5kx
	 90d45n8aVpisNSd/MYKx1xaso3SXRgbryviZ5udp9ffwEjpJFdVjYA5kYrVdkeVgLB
	 1Tmkr05/L/mZoqVRSoVFY7U8/g4B4jst3VuVBMilaH6cLewoaqIcmgsUzQXHGpeoFR
	 NXCP9h4X6nEO2e1ue9Opm+RSzqlu75PGb6EzSb8xzAhQO+glXy1Fq985sDxxH6m23L
	 SVRC9Er/oUxv/nX0ROEWglvCAphWyJR1azJY9rzGG1exACuU9ef0NsrFeuzkfZfJTz
	 JJJunM/AUAbgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-dev-max20830c-v3-4-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-4-9d06d27d6da3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:29:55 +0000
Message-Id: <20260720032956.5FB041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing compatible strings for MAX20830C and MAX20840C in the of_m=
atch_table.
- [Medium] I2C block read path truncates the device ID for 9-character name=
s, leading to potential false positive matches.
- [Low] struct i2c_device_id array uses positional instead of named initial=
izers.
--

--- Patch [4]: [PATCH v3 4/4] hwmon: (pmbus/max20830): add support for max2=
0830c and max20840c ---
commit dca1bbdb54e3f769bf22d26e97ead67754787a95
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for max20830c and max20840c
   =20
Add support for MAX20830C and MAX20840 step-down DC-DC switching
regulator with PMBus interface. MAX20830C is a different packaging
for MAX20830, and MAX20840C supports 40A regulation compared to
MAX20830 that is only 30A.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index 7a5e67bd33c0a..73fe59685cf15 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -98,13 +98,12 @@ static int max20830_probe(struct i2c_client *client)

[ ... ]

>  	} else {
> -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
> +		/* Reads 1 length byte + data bytes */
>  		ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
>  						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
>  						    buf);

[Severity: Medium]
Since MAX20830C and MAX20840C have 9-character names, does this hardcoded
MAX20830_IC_DEVICE_ID_LENGTH + 1 truncate the newly added device IDs?

In max20830_probe(), if the I2C controller lacks SMBUS_READ_BLOCK_DATA supp=
ort,
the fallback i2c_smbus_read_i2c_block_data() call uses
MAX20830_IC_DEVICE_ID_LENGTH. Because this length was initially sized for t=
he
8-character "MAX20830" identifier, could it under-read the new longer device
IDs and cause false positive matches in the I2C fallback path?

[ ... ]

> @@ -120,26 +119,28 @@ static int max20830_probe(struct i2c_client *client)

[ ... ]

>  static const struct i2c_device_id max20830_id[] =3D {
> -	{"max20830"},
> +	{ "max20830" },
> +	{ "max20830c" },
> +	{ "max20840c" },

[Severity: High]
Are the compatible strings for max20830c and max20840c missing from the
max20830_of_match[] table?

Without adding them alongside the newly added i2c_device_id entries, could
this break module autoloading on systems using Device Tree when the OS atte=
mpts
to autoload the driver via the udev modalias?

[Severity: Low]
This isn't a bug, but do these entries violate the I2C subsystem coding sty=
le
by using positional initializers?

The I2C client guidelines require initialized arrays of type
struct i2c_device_id to use named initializers (e.g., { .name =3D "max20830=
c" }).

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max20830_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-dev-max208=
30c-v3-0-9d06d27d6da3@analog.com?part=3D4
