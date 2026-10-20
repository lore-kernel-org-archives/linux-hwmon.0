Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536454;
	b=W/mtV/T0QW+1S4D3AdrFynko6s0At5JMIVWGD13mPtALpdNe9lTMgCNvLmtFVrBe2iT8
	 e5th4qXptNd0rRMcNE/KwEMn+pPJ5GSxTfc/wmGjqW810cqwTz6FVHA0o4AHe/u1fRljX
	 BQO+LREh3pN4sLKHLh9CIeXVjEBvtOk+afzhQLhfi8296wAQH/WbEQvt4JZNe/3NsUhV8
	 7LijcYHTtZzRkpVncVWXfr1/8NEMQCIPD4AsEBFix2/22/ja2pAwSUO0WcZA5sBXjOO3l
	 3RmpCTxVb+kShJ6ZLimjdQ6seLDAv0i6P+CnFPgiMftYzDuIs9KEqrGIXUsixane/wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536454;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/KhNV4gZdCqmWO+YzcnkwISAaODiEchAsMYCmePLj4c=;
	b=efFYsfm8cTSuRWrxMSUiHun431EjCYSA7TKQmNbdWYEs2Pk2R22ROyncFSQ1dI3/2ghZ
	 vk9YMjMgfyyf1C8nhCyj17TezeuFva/M/OtDemR8fcXNT5AUhIMBA2uw1Gg3qpGmT+CXs
	 Pl3+UjyTJzTfEMgKjEkNU0Oy533hDJjeIbUJp64KxaTnvnjEcN6of/rjb69R801sAijS+
	 2OYCknnZBpJquxh9yuszVAuCUEtZR8WutiyemmUv2BzKgOkxR3k11DF3cCW0QRiM1H8zO
	 G5HZfhZZhNVoF3S7v1w5Da1vVvyN0mj69n0bPUJjBMupL/cdz0ZodvwFK2tKf8VexBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVQnWYni;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20846606A31B;
	Tue, 20 Oct 2026 22:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVQnWYni
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9851F000C9;
	Tue, 20 Oct 2026 22:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792536453;
	bh=/KhNV4gZdCqmWO+YzcnkwISAaODiEchAsMYCmePLj4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVQnWYni6PCKTOrS6va1PTfrE29EqmKTnCa6jTG92rL9dSE/VSO/q1E1y9/D54J0p
	 JGAfyyLfVhMpUIdWzl83FpijZF64k4xwYU982nV/1zgWeLvn8ViOJ4EqieIjmdskiA
	 5jiN8nTn4s5rEExf/eZPJTwjD3/bGVJn2N9GP+5Nxs5f5A2tJ7UDY8SfD9D79Ohyap
	 9Yp0M+4Ef3haNjpLVJSzIZS24wSflynHP4/CotQTvZl6LS5qhxyEgTWb2HMyMhFV/Q
	 1xM9yrg+7jzthpCgL69cZoZv1uIePpjWDY5ARLMjAjAgHsvQCZmoAIETDObAHpaHbW
	 DPaMzQ7mfF/nA==
Message-ID: <sashiko-outbox-179576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-3-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v3-3-51df629e13d7@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 22:47:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: (pmbus_core) truncation and s64 overflow in vout_command =
scaling
--

commit 05161e0e5e17d81565feffc1dff16ea378c5e2e9
Author: Lars Petter Mostad <lars.petter.mostad@appear.net>

hwmon: (pmbus_core) Support relative encoding of vout related commands

This commit adds support for PMBus 1.3 relative encoding of output voltage
limit and margin commands, scaling values relative to VOUT_COMMAND when the
relative bit in VOUT_MODE is set.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 5f69c1420b4e1..ab91438b0c261 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -101,6 +101,9 @@ struct pmbus_data {
> =20
>  	int exponent[PMBUS_PAGES];
>  				/* linear mode: exponent for output voltages */
> +	bool vout_mode_relative[PMBUS_PAGES];
> +				/* VOUT limits relative to VOUT_COMMAND */
> +	int vout_command[PMBUS_PAGES];	/* VOUT_COMMAND in mV, relative mode */
> =20
>  	const struct pmbus_driver_info *info;
> =20

[ ... ]

> @@ -1005,6 +1028,12 @@ static s64 pmbus_reg2data(struct pmbus_data *data,=
 struct pmbus_sensor *sensor)
>  		val =3D pmbus_reg2data_linear(data, sensor);
>  		break;
>  	}
> +
> +	/* In relative mode, val is a permillage of VOUT_COMMAND */
> +	if (pmbus_sensor_is_vout_relative(data, sensor))
> +		val =3D DIV_S64_ROUND_CLOSEST(val * data->vout_command[sensor->page],
> +					    1000);
> +
>  	return val;
>  }
> =20
> @@ -1209,6 +1238,12 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
>  	if (!sensor->convert)
>  		return val;
> =20
> +	if (pmbus_sensor_is_vout_relative(data, sensor)) {
> +		val =3D clamp_val(val, -INT_MAX, INT_MAX);
> +		val =3D DIV_S64_ROUND_CLOSEST(val * 1000,
> +					    data->vout_command[sensor->page]);
> +	}
> +
>  	switch (data->info->format[sensor->class]) {
>  	case direct:
>  		regval =3D pmbus_data2reg_direct(data, sensor, val);
> @@ -2736,6 +2771,21 @@ static int pmbus_init_coefficients(struct i2c_clie=
nt *client,
>  	return 0;
>  }
> =20
> +/* Decode a raw VOUT_COMMAND value to mV */
> +static s64 pmbus_vout_command_mv(struct pmbus_data *data, int page,
> +				 int vout_command_raw)
> +{
> +	struct pmbus_sensor s =3D {
> +		.page =3D page,
> +		.reg =3D PMBUS_VOUT_COMMAND,
> +		.class =3D PSC_VOLTAGE_OUT,
> +		.convert =3D true,
> +		.data =3D vout_command_raw,
> +	};
> +
> +	return pmbus_reg2data(data, &s);
> +}
> +

[ ... ]

> @@ -2979,6 +3033,22 @@ static int pmbus_init_common(struct i2c_client *cl=
ient, struct pmbus_data *data,
>  			return ret;
>  	}
> =20
> +	for (page =3D 0; page < info->pages; page++) {
> +		if (data->vout_mode_relative[page]) {
> +			ret =3D _pmbus_read_word_data(client, page, 0xff,
> +						    PMBUS_VOUT_COMMAND);
> +			if (ret < 0)
> +				return ret;
> +			data->vout_command[page] =3D
> +				pmbus_vout_command_mv(data, page, ret);
> +			if (data->vout_command[page] <=3D 0) {
> +				dev_err(dev, "Invalid VOUT_COMMAND 0x%04x for relative VOUT mode\n",
> +					ret);
> +				return -ENODEV;
> +			}
> +		}
> +	}
> +

[ ... ]

> @@ -3351,7 +3441,8 @@ static int pmbus_regulator_set_voltage(struct regul=
ator_dev *rdev, int min_uv,
>  		.data =3D -1,
>  	};
>  	int val =3D DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
> -	int low, high;
> +	int low, high, ret;
> +	s64 vout_mv =3D 0;
> =20
>  	*selector =3D 0;
> =20
> @@ -3373,7 +3464,21 @@ static int pmbus_regulator_set_voltage(struct regu=
lator_dev *rdev, int min_uv,
> =20
>  	val =3D pmbus_data2reg(data, &s, val);
> =20
> -	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)=
val);
> +	/* Relative limits are scaled by VOUT_COMMAND, which must stay positive=
 */
> +	if (data->vout_mode_relative[s.page]) {
> +		vout_mv =3D pmbus_vout_command_mv(data, s.page, val);
> +		if (vout_mv <=3D 0)
> +			return -EINVAL;
> +	}
> +
> +	ret =3D _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16=
)val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (data->vout_mode_relative[s.page])
> +		data->vout_command[s.page] =3D vout_mv;
> +
> +	return 0;
>  }

[Severity: Medium]
Can storing the s64 result of pmbus_vout_command_mv() into the 32-bit int
data->vout_command[] truncate the voltage and cause division by zero or
signed 64-bit multiplication overflow?

In pmbus_vout_command_mv() -> pmbus_reg2data(), linear mode with a positive
exponent (up to 15) or direct mode with a negative R can produce an s64
value exceeding INT_MAX.

In pmbus_init_common(), assigning that s64 return value to int
data->vout_command[page] truncates the upper 32 bits before checking
if (data->vout_command[page] <=3D 0), allowing values whose lower 32 bits a=
re
positive to pass with a wrapped value.

In pmbus_regulator_set_voltage(), the check:

	vout_mv =3D pmbus_vout_command_mv(data, s.page, val);
	if (vout_mv <=3D 0)
		return -EINVAL;

validates the 64-bit vout_mv before truncating it into int
data->vout_command[s.page]. If the lower 32 bits of vout_mv are zero or
negative, data->vout_command[s.page] becomes zero or negative, which can
trigger a division by zero in pmbus_data2reg() on subsequent writes to
relative VOUT limit registers:

	val =3D DIV_S64_ROUND_CLOSEST(val * 1000,
				    data->vout_command[sensor->page]);

Additionally, in pmbus_reg2data():

	if (pmbus_sensor_is_vout_relative(data, sensor))
		val =3D DIV_S64_ROUND_CLOSEST(val * data->vout_command[sensor->page],
					    1000);

val comes unclamped from pmbus_reg2data_linear() or pmbus_reg2data_direct()
(for instance, in linear mode with exponent >=3D 7), so could multiplying v=
al
by data->vout_command[sensor->page] overflow s64?

Would it make sense to reject vout_mv values above a safe bound (or clamp /
use mul_s64_u64_div_s64) so that data->vout_command[page] cannot truncate
and val * data->vout_command[sensor->page] cannot overflow S64_MAX?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v3-0-51df629e13d7@nexthop.ai?part=3D3
