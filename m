Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7A3A451F;
	Mon, 13 Jul 2026 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929691; cv=none; b=o7UrksydIxrnYGrR5KeWg8qUQigIEP0Y9n7Hk7LULW+9Dn1J3+CxGK0joxc3vcrPOeeW+qQtJtBIStBMXTes+67qYfaizrH2zi4u5gPMofvqrYMOUzGVnS5N5wfvwfP39MSvNGSKR1zl4mojGaE28kOdGvxy7XNHwOG91izUPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929691; c=relaxed/simple;
	bh=NHwvlMeRCrVBhct+D3qfVvqEebwHNPmgjTzdsM+jelQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JIach0AO1c63McfpqxpNbOjXR9cylvI119BmhV3/G7RiKXIFUq2RuRUS2R9fTZZdvRy03mrkw8OUMlVnOKooxe27zPtNcNNXv2LO0ITN44J26v4oV1rTMrfRF14yMzE6Ifk5hutcJevd/54oT6nwNImhGAI3z6NxWKIerV4v7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX5IEy2M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX5IEy2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A8E1F00A3D;
	Mon, 13 Jul 2026 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783929690;
	bh=82FI4U/Qgp3VJU1T2C9+3q81Tkk7bDT4BWyYRDWe9tE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OX5IEy2MfN72wwmtsF361CjdDfcLl4LX94G1yHg3szzUFErp8RyjzlFgDObBqcOQz
	 budYI3Ygc2gam0Ssonu5behB6gZkuPYIxws0l1CSv+mhWT0TN//QgGeRwhYF6mikQ1
	 9OUjrOP1eSk+MGd8Du9/BR7ndAO275kyiKon1CBvV2HqOQWZ9nLD3No3DrkasBFIXA
	 V8fB3AzTxMWdlCf3VSGEXhdShPLKvmj0DrdMgtFN24NMck2P144TbwALol9rWMYEa4
	 MYK+ZoUVOAdQnaaSRRohq49jcSmq2kFPiCW/tzvnE1qBtG61dHYMVJF49byFSyPaoB
	 NMkDcY7aJeUPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 08:01:29 +0000
Message-Id: <20260713080129.D8A8E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unaligned memory access when extracting the humidity value cau=
ses a kernel panic on strict-alignment architectures.
- [High] Integer overflow in `limit_write()` calculating raw limit values f=
or temperature and humidity, resulting in limits wrapping around to 0.
- [High] Missing `hwmon_lock()` synchronization for extra sysfs attributes =
(`heater_enable_store`, `repeatability_store`).
- [High] Changing the 'repeatability' sysfs attribute fails to update the a=
ctive measurement command, rendering the change ineffective until the updat=
e interval is toggled.
- [High] `heater_enable_store()` returns the I2C transfer length instead of=
 the consumed buffer length, breaking sysfs writes.
--

--- Patch [3]: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support ---
commit 3205e8775fc638eb1ac86ddf6feacc8304401779
Author: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

hwmon: (sht3x) Add devicetree support

Add an of_device_id table to support devicetree based instantiation of the
supported sensors. The match data distinguishes the humidity and temperature
parts (SHT3x) from the temperature-only parts (STS3x). Enum sht3x_chips is
started at 1 to prevent i2c_get_match_data() from falling back to device
id matching on devicetree names.

> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index c2f6b73aa7f34..6d47cfd340f83 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -61,7 +61,7 @@ static const unsigned char sht3x_cmd_read_serial_number=
[]      =3D { 0x37, 0x80 };
>  #define SHT3X_MAX_HUMIDITY     100000
> =20
>  enum sht3x_chips {
> -	sht3x,
> +	sht3x =3D 1,
>  	sts3x,
>  };

[ ... ]

> @@ -939,8 +939,19 @@ static const struct i2c_device_id sht3x_ids[] =3D {
> =20
>  MODULE_DEVICE_TABLE(i2c, sht3x_ids);
> =20
> +static const struct of_device_id sht3x_of_match[] =3D {
> +	{ .compatible =3D "sensirion,sht30", .data =3D (void *)(uintptr_t)sht3x=
 },
> +	{ .compatible =3D "sensirion,sts30", .data =3D (void *)(uintptr_t)sts3x=
 },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, sht3x_of_match);

While reviewing this patch, I noticed a few pre-existing regressions in this
file that might be worth addressing.

[Severity: Critical]
This is a pre-existing issue, but does this unaligned memory access crash
strict-alignment architectures?

drivers/hwmon/sht3x.c:sht3x_update_client() {
    ...
		val =3D be16_to_cpup((__be16 *)buf);
		data->temperature =3D sht3x_extract_temperature(val);
		val =3D be16_to_cpup((__be16 *)(buf + 3));
		data->humidity =3D sht3x_extract_humidity(val);
		data->last_update =3D jiffies;
	}
    ...
}

Since buf is a stack-allocated byte array, buf + 3 is at an unaligned odd
offset. Dereferencing this pointer triggers an alignment fault on strict
alignment architectures like ARMv5 or SPARC.=20

Since these sysfs attributes are world-readable, could an unprivileged local
user repeatedly read them to trigger a denial of service?


[Severity: High]
This isn't a bug introduced by this patch, but does this integer arithmetic
overflow?

drivers/hwmon/sht3x.c:limit_write() {
    ...
	/*
	 * ST =3D (T + 45) / 175 * 2^16
	 * SRH =3D RH / 100 * 2^16
	 * adapted for fixed point arithmetic and packed the same as
	 * in limit_read()
	 */
	raw =3D ((u32)(temperature + 45000) * 24543) >> (16 + 7);
	raw |=3D ((humidity * 42950) >> 16) & 0xfe00;
    ...
}

Writing the maximum allowed temperature or humidity limits, such as 130000
for temp1_max, causes the expression ((u32)(temperature + 45000) * 24543)
to become 175000 * 24543 =3D 4295025000.

This overflows the 32-bit unsigned integer maximum. Does this result in a
calculated raw limit of 0, corresponding to the hardware's minimum bounds,
and incorrectly trigger a spurious hardware alert?


[Severity: High]
This is a pre-existing issue, but do these attributes violate the hwmon core
locking rules?

drivers/hwmon/sht3x.c:heater_enable_store() {
    ...
	mutex_lock(&data->i2c_lock);

	if (status)
		ret =3D i2c_master_send(client, (char *)&sht3x_cmd_heater_on,
				      SHT3X_CMD_LENGTH);
    ...
}

drivers/hwmon/sht3x.c:repeatability_store() {
    ...
	if (val > 2)
		return -EINVAL;

	data->repeatability =3D val;

	return count;
}

Attributes registered via the extra_groups parameter, such as heater_enable
and repeatability, do not have automatic hwmon core serialization.

The hwmon subsystem guidelines explicitly require drivers to implement
locking for extra attributes using hwmon_lock(). Should these functions use
hwmon_lock() to prevent concurrent state modifications?


[Severity: High]
This isn't a bug introduced by this patch, but does repeatability_store()
fail to update the active measurement command?

drivers/hwmon/sht3x.c:repeatability_store() {
    ...
	if (val > 2)
		return -EINVAL;

	data->repeatability =3D val;

	return count;
}

When a user writes to the repeatability attribute, this updates the internal
data->repeatability variable but fails to call sht3x_select_command() or
send the required I2C commands to the device.

Does the driver continue to use the old command and wait time for all
subsequent measurements in single-shot mode, rendering the change
ineffective?


[Severity: High]
This is a pre-existing issue, but does heater_enable_store() break sysfs
writes by returning the I2C transfer length?

drivers/hwmon/sht3x.c:heater_enable_store() {
    ...
	if (status)
		ret =3D i2c_master_send(client, (char *)&sht3x_cmd_heater_on,
				      SHT3X_CMD_LENGTH);
	else
		ret =3D i2c_master_send(client, (char *)&sht3x_cmd_heater_off,
				      SHT3X_CMD_LENGTH);

	mutex_unlock(&data->i2c_lock);

	return ret;
}

This returns the result of i2c_master_send(), which is 2 (the length of the
I2C command) instead of the consumed buffer length expected by sysfs.

If a user writes a string longer than 2 bytes, such as 'echo true', does
the sysfs core assume a partial write and invoke the store function again
with the remaining bytes, resulting in a spurious -EINVAL error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713074559.1219=
6-1-zaixiang.xu.dev@gmail.com?part=3D3
