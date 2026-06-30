Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B821DE2A5;
	Tue, 30 Jun 2026 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788439; cv=none; b=GQIfMZFrIo+aBU7IYdOSf973konI6kOwk6yHn0+iLs7kIhT0dLi0s2utvp7GQj6pwXKQ6PAt9wvw1wCUBxwqntguibgL4eqVGWobE2c4VO37+bXYqxIhhmyPyecsWWbXpPgllV6y6MEADDROwVVZpE1CZVVYXQ44JGB5FIkbaMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788439; c=relaxed/simple;
	bh=cNs8i2YCAVPGaFE/QqFtsTF8hzs0Jl10yebOArH9V3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g02dJqlfzNLQIz7NILmZQ+CJPX/T6g/X/O8nlQtK4VsbKHbyy74vzEuSDF78GBqpU6hElvCBv3HttLsRe0Ma0blWBDBq3zmLYWECzyMV2HDN4t0BLlZ8HiaVogxPC+sEnpP2tK8kkr1+815xbqOsPmV2zg1l3VIh5lTdxs51AC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSliaZgs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSliaZgs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4F01F000E9;
	Tue, 30 Jun 2026 03:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788438;
	bh=5M6sWUFz9TXoMDU+nEWRUHRAzQ6hWVZLqk48pLe15/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DSliaZgsKWsnJYIGXW5y3Ve5k8UC8zeIQNHMuMIUyw9Hbzpi3Fft8/etN5ySnW3UA
	 cQuuToZxU5QH3Arzclu0eFan2INEQ2TaCTE2yUBhkeFbHHWqAGbjepkQvvDjOI7Xzp
	 9133+bqwIav3jAgmO8ZcR0Hx13HYInPnwc16RS6ohRfW0cCd4cDHAUWkSQnk8fbXh/
	 0ybWIxpc8dUIGA3wBe56S4IOAXh30d8H8rHZHiZIsm90MQPOemLJxgSNOgYyvqkUl3
	 QrVf9aWIbsVnXHFF6iZol9QKOBCbpxuy4Kg5nJmC4KrwaNLLqhlyzV6Mltkh+jlJ5N
	 bp3715HaaprkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 03:00:37 +0000
Message-Id: <20260630030038.0D4F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Applying a voltage scaling multiplier directly to the PMBus word d=
ata for VOUT will result in severe silent truncation by the PMBus core fram=
ework if the scaled mantissa exceeds 16 bits.
- [High] Voltage divider scaling is applied only to PMBUS_READ_VOUT, leavin=
g other VOUT-related PMBus commands and fault limits unscaled and ignoring =
write operations.
--

commit 690eab506d6910945bf8fa7dc51390239ffa2898
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support

Implement support for external voltage divider scaling using the
adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index cb3a39d747ede..a3abd24437e8e 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c

[ ... ]

> @@ -15,6 +16,35 @@
> =20
>  #define MAX20830_IC_DEVICE_ID_LENGTH	9
> =20
> +struct max20830_data {
> +	struct pmbus_driver_info info;
> +	u32 vout_rfb1;
> +	u32 vout_rfb2;
> +};
> +
> +static int max20830_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
> +	const struct max20830_data *data =3D container_of(info, struct max20830=
_data, info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
[Severity: High]
Does this code apply voltage divider scaling only to PMBUS_READ_VOUT, leavi=
ng
other VOUT-related PMBus commands and fault limits unscaled?

If userspace reads limit registers (e.g., in1_max), the switch statement
misses them and returns raw values.

> +		ret =3D pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Apply voltage divider scaling if resistors are non-zero */
> +		if (data->vout_rfb1 && data->vout_rfb2)
> +			ret =3D DIV_ROUND_CLOSEST_ULL((u64)ret * (data->vout_rfb1 +
> +						    data->vout_rfb2), data->vout_rfb2);
[Severity: High]
Can this scaling cause silent truncation?

When userspace reads the output voltage via sysfs, this code multiplies the
raw 16-bit register value by the resistor ratio. The PMBus core reads this
scaled word, but in pmbus_reg2data_linear(), it casts the value to a 16-bit
unsigned integer:

    mantissa =3D (u16)sensor->data;

This will silently truncate any value that exceeds 65535, corrupting the
voltage telemetry.

> +		return ret;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
>  static struct pmbus_driver_info max20830_info =3D {
>  	.pages =3D 1,
>  	.format[PSC_VOLTAGE_IN] =3D linear,
> @@ -25,14 +55,26 @@ static struct pmbus_driver_info max20830_info =3D {
>  		PMBUS_HAVE_TEMP |
>  		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>  		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data =3D max20830_read_word_data,
[Severity: High]
Should this also provide a write_word_data callback?

Without a write_word_data override, any user writes to voltage limits are
passed unscaled to the device. The writes go directly to the PMBus core
without inverse scaling, causing hardware protection limits (over/under
voltage) to be misconfigured.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D4
