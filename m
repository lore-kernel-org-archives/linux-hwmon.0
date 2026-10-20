Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486512;
	b=wUXCGnh/EMKa1hSVW5dmJxpRBYIeZWQW1BVBjCVd0ZcHsu2859t4IReM7rte5dO+zi52
	 +Frxtmdzb+h+H7kVSRqD/YDbqmUU2uLco1MK2OcM1F7DSvh3aK6lqgBpdl97juuoIKQlH
	 UilgHUoeHPtWhL6Gc9rfzugso+lodz3J56LewuNF9IUF6Y3B8T++NdjJYkn49KGP3K0UO
	 n6TqgJexirslleHvxf+x4XkBCBsX2fJa4o27Cm06mXYmzxUIaiKafaRvoah5U0jLEeIYi
	 voYf9zqeIKAh7970U/knZhi4gzL1DMRi4J02tKfI1H8z7PmJ8bIUsmMU29eJigOV01Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486512;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rkNyBHccCsNZrFzTEOZcB5gHz93twJ/WDA1ZlfSbYv4=;
	b=OKLtZ8ZPF+w14LvaqBiF7MkiikZQdnkLvfdYtBxCy+GhMCMr4dGvrFKsY08YgF1FxR1J
	 fLRP+srqxS2DFIur9YS6ktO3hia2nGN1mnB5USULd5TLNnw5naDfv4rpCZM7ovtuA/J2W
	 eoeQWe9UVetczMOAoQ68ZAZx4VzyL/8kEBhwio+fFBqmuDg/uJNke4/wW+awj/2YaooL/
	 nf+ac9SH5Xl/eX/NuoWd7JVi4wnsp9RDO9IQLg4w0FgYJRGEyhyN0UEWWfCcWixw2/uvl
	 +XJD5xkOKuogZJ4RI+WwFB+cSd0rPpQtpj+zBiuhNl+n1Ix0gDQOq+dRM8hJnelRm8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbQkQQGr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE4606A321;
	Tue, 20 Oct 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbQkQQGr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66101F000C4;
	Tue, 20 Oct 2026 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486511;
	bh=rkNyBHccCsNZrFzTEOZcB5gHz93twJ/WDA1ZlfSbYv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbQkQQGr6JBAV3RXMd8jgHXXXDx9ivJqzsBOquuN93sSbhIRUQc2TbiR1FKDDLsBT
	 SYCmkq+DNYjF0glaV/9pLrGJXTDnfg9YXuJcSl/4oSCjwGC/wmtZIIDw1S0utqWDbE
	 bsYK3MLfeMd6Y4ecJhRhtznql9pkzv9CSuwuk+/KVjknDvRFXQYvrhxkzL1UUfb6Yb
	 TfDbm5b79FC7u4R8kKEWyfEyrAlTkZOq4BxlP+U1FSgeE7UUkzgyNyN6eqp7eBac7v
	 +5QLX2CFFo181HQdz9kkZpQcFbJNHRcCCOuGpjEvLtnw+ZSWltvQcLvle0TA8Ez82a
	 JkLEFLl4T35Bg==
Message-ID: <sashiko-outbox-178650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:55:10 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_volta=
ge()
- [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in regu=
lator ops
--

commit 8ccb177073557cf9644c419b791da4a5cf494d3e
Author: Lars Petter Mostad <lars.petter.mostad@appear.net>

hwmon: (pmbus_core) Support relative encoding of vout related commands

This patch adds support for PMBus 1.3 relative encoding of output voltage
related commands, scaling limits relative to VOUT_COMMAND in
pmbus_reg2data() and pmbus_data2reg() and updating the cached VOUT_COMMAND
when setting regulator voltage.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 5f69c1420b4e1..47dff264d28bf 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c

[ ... ]

> @@ -803,6 +806,26 @@ static void pmbus_update_sensor_data(struct i2c_clie=
nt *client, struct pmbus_sen
>  						     sensor->phase, sensor->reg);
>  }
> =20
> +static bool pmbus_sensor_is_vout_relative(struct pmbus_data *data,
> +					  struct pmbus_sensor *sensor)
> +{
> +	if (sensor->class !=3D PSC_VOLTAGE_OUT ||
> +	    !data->vout_mode_relative[sensor->page])
> +		return false;
> +
> +	switch (sensor->reg) {
> +	case PMBUS_VOUT_MARGIN_HIGH:
> +	case PMBUS_VOUT_MARGIN_LOW:
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

[Severity: Medium]
Can the PMBUS_VOUT_MARGIN_HIGH and PMBUS_VOUT_MARGIN_LOW cases in
pmbus_sensor_is_vout_relative() ever match, and how does
pmbus_regulator_list_voltage() behave in relative mode?

No hwmon sensor attributes are registered for PMBUS_VOUT_MARGIN_LOW or
PMBUS_VOUT_MARGIN_HIGH. The only callers in drivers/hwmon/pmbus/pmbus_core.c
that read these registers and pass them to pmbus_reg2data() are
pmbus_regulator_get_low_margin() and pmbus_regulator_get_high_margin():

static int pmbus_regulator_get_low_margin(struct i2c_client *client, int pa=
ge)
{
	struct pmbus_data *data =3D i2c_get_clientdata(client);
	struct pmbus_sensor s =3D {
		.page =3D page,
		.class =3D PSC_VOLTAGE_OUT,
		.convert =3D true,
		.data =3D -1,
	};

	if (data->vout_low[page] < 0) {
		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MIN))
			s.data =3D _pmbus_read_word_data(client, page, 0xff,
						       PMBUS_MFR_VOUT_MIN);
		if (s.data < 0) {
			s.data =3D _pmbus_read_word_data(client, page, 0xff,
						       PMBUS_VOUT_MARGIN_LOW);
			if (s.data < 0)
				return s.data;
		}
		data->vout_low[page] =3D pmbus_reg2data(data, &s);
	}

	return data->vout_low[page];
}

Neither pmbus_regulator_get_low_margin() nor
pmbus_regulator_get_high_margin() initializes s.reg (leaving it as 0), so
when they fall back to PMBUS_VOUT_MARGIN_LOW or PMBUS_VOUT_MARGIN_HIGH,
pmbus_reg2data() -> pmbus_sensor_is_vout_relative() returns false and caches
the unscaled permillage value as mV in data->vout_low[page] and
data->vout_high[page].

In addition, while pmbus_regulator_set_voltage() skips checking these margi=
ns
when data->vout_mode_relative[s.page] is true, pmbus_regulator_list_voltage=
()
still calls pmbus_regulator_get_low_margin() and
pmbus_regulator_get_high_margin() unconditionally:

static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
					unsigned int selector)
{
...
	low =3D pmbus_regulator_get_low_margin(client, rdev_get_id(rdev));
	if (low < 0)
		return low;

	high =3D pmbus_regulator_get_high_margin(client, rdev_get_id(rdev));
	if (high < 0)
		return high;

	if (val >=3D low && val <=3D high)
		return val * 1000; /* unit is uV */

	return 0;
}

Even if s.reg were populated when reading the margin registers,
data->vout_low[page] and data->vout_high[page] are cached once and not
updated when pmbus_regulator_set_voltage() changes VOUT_COMMAND. Should
pmbus_regulator_get_low_margin(), pmbus_regulator_get_high_margin(), and
pmbus_regulator_list_voltage() also account for relative mode?

[ ... ]

> @@ -3351,29 +3419,38 @@ static int pmbus_regulator_set_voltage(struct reg=
ulator_dev *rdev, int min_uv,
>  		.data =3D -1,
>  	};
>  	int val =3D DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
> -	int low, high;
> +	int low, high, ret;
> =20
>  	*selector =3D 0;
> =20
>  	guard(pmbus_lock)(client);
> =20
> -	low =3D pmbus_regulator_get_low_margin(client, s.page);
> -	if (low < 0)
> -		return low;
> +	if (!data->vout_mode_relative[s.page]) {
> +		low =3D pmbus_regulator_get_low_margin(client, s.page);
> +		if (low < 0)
> +			return low;
> =20
> -	high =3D pmbus_regulator_get_high_margin(client, s.page);
> -	if (high < 0)
> -		return high;
> +		high =3D pmbus_regulator_get_high_margin(client, s.page);
> +		if (high < 0)
> +			return high;
> =20
> -	/* Make sure we are within margins */
> -	if (low > val)
> -		val =3D low;
> -	if (high < val)
> -		val =3D high;
> +		/* Make sure we are within margins */
> +		if (low > val)
> +			val =3D low;
> +		if (high < val)
> +			val =3D high;
> +	}
> =20
>  	val =3D pmbus_data2reg(data, &s, val);
> =20
> -	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)=
val);
> +	ret =3D _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16=
)val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (data->vout_mode_relative[s.page])
> +		pmbus_init_vout_relative(data, s.page, val);
> +
> +	return 0;
>  }

[Severity: High]
Could updating data->vout_command[s.page] in pmbus_regulator_set_voltage()
lead to a division by zero in pmbus_data2reg()?

At probe time, pmbus_init_common() rejects non-positive values in
data->vout_command[page] after calling pmbus_init_vout_relative(). However,
in pmbus_regulator_set_voltage(), when data->vout_mode_relative[s.page] is
true, margin clamping is skipped and pmbus_init_vout_relative(data, s.page,
val) updates data->vout_command[s.page] without checking whether the decoded
voltage is <=3D 0.

If a consumer requests a small voltage (for example min_uv < 500 uV, or a
value that rounds to 0 in pmbus_data2reg()), data->vout_command[s.page]
becomes 0. A subsequent write to a relative VOUT limit attribute in sysfs
will then call pmbus_set_sensor() -> pmbus_data2reg() and divide by zero:

	if (pmbus_sensor_is_vout_relative(data, sensor)) {
		val =3D clamp_val(val, -INT_MAX, INT_MAX);
		val =3D DIV_S64_ROUND_CLOSEST(val * 1000,
					    data->vout_command[sensor->page]);
	}

Should pmbus_regulator_set_voltage() or pmbus_data2reg() guard against a
non-positive vout_command?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v2-0-3396c3a08251@nexthop.ai?part=3D3
