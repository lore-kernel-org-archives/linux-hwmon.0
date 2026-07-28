Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4019355F49;
	Tue, 28 Jul 2026 03:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785210126; cv=none; b=W+UIcgD59fnrU0kMkOTCS7va2B5rc4YFNG8z5VCjbYL1u9Z9wZpmr/RNKVMg8QrzEKswsywOr+qShMQCSZNe7+C0M3etFjv1gEpiFGS3yKcqUVq4RrA3r7Ix+A3JmH48pj9kd6AwnbN33weoRMkfS1wULe8Xv279vtLQkOl2NE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785210126; c=relaxed/simple;
	bh=fX3MGjgVVWzBLijMmQCJHvPmKGuMqinxbe+LvHuznHk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rRM6/zRbItLBAQlot3LPfUTJGS2eKxGvjgmCVXG/1PyvCL9Bd2zRKQHv6sSFbWgSZWjEP9fFVoAQ7pkK2omqqSxDHVZQpeNkChflDJJ0HKdUNcJEoq48D2uRapCAIwsuJscO6QVdOK1SSMuqfLetxvbT5V7OBOGigUoSIh9jxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jduMW2dO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jduMW2dO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3E71F000E9;
	Tue, 28 Jul 2026 03:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785210125;
	bh=iGmut3FAYqNsr7Ai7dfOhdU8O4CUbZivfbkHxXb3MU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jduMW2dOQpcfYE7b2yQcVcVdFyIRKwtlJR8duY71YaHU4CWaZgvdHncfmdM1gRbUo
	 vlNpNKfaYBQ9x3Vw04QLqlw9TH5k1cVLwIXTOtN9VoqCsX7mW/QDpznRL+1Z93B04b
	 4uGUGid34vWDne9p3uiwmxte3n46TO8UOxpJsOEsIIMMkYilkAn6IvO3LG2k1mRIve
	 p6LOYzKo+7LgiJH/cb50OCKOpBeDWuPO9WuCdX2R3JBHCZ0y88ZpCW4DiJTuxoOSIX
	 RFxpwvfuzAR5RUontHCvZPVvXThlNC0jJhBd6gen4t3hvnFDE5aExJf2Y7KSfSf8Ot
	 3nAU8vN4YaAAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:42:04 +0000
Message-Id: <20260728034205.3D3E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing OF match table entries for new devices breaks module aut=
o-loading.
- [Low] The newly added entries in the i2c_device_id array use positional i=
nitializers instead of named initializers, violating I2C subsystem guidelin=
es.
--

--- Patch [4]: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max2=
0830c and max20840c ---
commit 4a124678c88f942f9f2f9403e79e6632f0000f9f
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for max20830c and max20840c
   =20
Add support for MAX20830C and MAX20840 step-down DC-DC switching
regulator with PMBus interface. MAX20830C is a different packaging
for MAX20830, and MAX20840C supports 40A regulation compared to
MAX20830 that is only 30A.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index 7c1e94c43ac4e..029733a377123 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c

[ ... ]

> @@ -121,26 +120,28 @@ static int max20830_probe(struct i2c_client *client)
>  		ret =3D ret - 1;
>  	}
> =20
> -	/*
> -	 * MAX20830 IC_DEVICE_ID sends string data "MAX20830\0".
> -	 * Return value should at least be 9 bytes of data.
> -	 */
> +	/* Verify we read the expected number of bytes */
>  	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
>  		return dev_err_probe(&client->dev, -ENODEV,
> -				     "IC_DEVICE_ID too short: expected at least 9 bytes, got %d\n",
> -				     ret);
> +				     "IC_DEVICE_ID too short: expected %d bytes, got %d\n",
> +				     MAX20830_IC_DEVICE_ID_LENGTH, ret);
> +
> +	/* Null-terminate the string */
> +	buf[ret] =3D '\0';
> =20
> -	/* 9 bytes of data, buf[0]-buf[7] =3D "MAX20830", buf[8] =3D '\0' */
> -	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] =3D '\0';
> -	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
> +	/* Verify the device ID matches what we expect */
> +	if ((strcmp(buf, "MAX20830") && strcmp(buf, "MAX20830C") &&
> +	    strcmp(buf, "MAX20840C")))
>  		return dev_err_probe(&client->dev, -ENODEV,
> -				     "Unsupported device: '%s'\n", buf);
> +				     "Unsupported device: '%*pE'\n", ret, buf);
> =20
>  	return pmbus_do_probe(client, &data->info);
>  }
> =20
>  static const struct i2c_device_id max20830_id[] =3D {
> -	{"max20830"},
> +	{ "max20830" },
> +	{ "max20830c" },
> +	{ "max20840c" },

[Severity: Low]
This isn't a bug, but does the initialization of this array violate the I2C
subsystem rules?

The I2C subsystem guidelines state that initialized arrays of type
struct i2c_device_id must be declared const and use named initializers
instead of positional ones:

	{ .name =3D "max20830" },
	{ .name =3D "max20830c" },
	{ .name =3D "max20840c" },

[Severity: Medium]
Will this driver fail to auto-load via udev for the new devices when
instantiated via Device Tree?

It seems the new compatibles (e.g., "adi,max20830c" and "adi,max20840c")
were not added to max20830_of_match[] lower down in this file:

static const struct of_device_id max20830_of_match[] =3D {
	{ .compatible =3D "adi,max20830" },
	{ }
};

Without updating this array to include the new devices, the kernel won't
emit the correct MODALIAS for the new chips, which breaks module
auto-loading.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max20830_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-dev-max208=
30c-v4-0-cec034298535@analog.com?part=3D4
