Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3572931E7
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785018152; cv=none; b=DySUOuYTrRAQP5vZgybkaXpub9uYhRhEElVjbo2/SDbmR1XAv1ChS3Cf3aw2E4oCmF7MWfwEgjpg8ZYcrvmwWjRUyg2Eap8o1otynqLwZhyAmLQ3vk1CNWQIFD+vVU2vfqoT3I9jO5S/Bhuz1FZ+UPTSmxlbANpxmMXpoWidGtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785018152; c=relaxed/simple;
	bh=3WceHkvXPT633YpzNROhwwrdaFLAQ3Nnn+YOAGk0IS4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e3KnXU7Qa1JlHwqfo6YPZOTwEVnBYBQmYxw6iJaoFmsAGmM1b11r+ELvMbpd6HDQ7ANKdp6bGVtpqF4KZpVHSH2Pi/jU6wQKqGwgOn6doDgNFC7jx/h/E6JnjT6kXFJXdR4fg4z3s36OTL78UHaYtpuTZxjcK/HMswdFSfl/LuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjOX8BZc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjOX8BZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA69B1F000E9;
	Sat, 25 Jul 2026 22:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785018150;
	bh=gZWW1Degeox7vpKxHfmUKfE6N6k5RJ99B2RrJ2QOIXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HjOX8BZc8Iwna80XRaKvYxAO5JGOJxaEj0JlXAvNzFzrxFKRZ0oVvkjvv5R0f45f/
	 txM0ytNvE8b39lqixT14uelD80Rx1jryB/N6NxNTKgfZ317AQcX7RhI+Pz2Xnq0/H5
	 L/CiaK/jgdzDsH69447PPM+NQVfCISEAP8GQZ77ormG69tKQFQGwyGAeTcgx0+jg6Y
	 N76PsqiDp4JQO6Ce+GhQ9MMC08v1d/8f+ygjLwjD5AGwK5T/d+jcpFwN7rlBUItHTi
	 3v8slQV7N+WnPCxihgwx8Ggl6av4FoegTKX7DF5TkJctbwqm9jNGN0biX5gCmUm/cz
	 rnQ/qy9CerkVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: sht3x: Fix unaligned accesses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260725220205.1931189-1-linux@roeck-us.net>
References: <20260725220205.1931189-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 22:22:29 +0000
Message-Id: <20260725222229.EA69B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] 32-bit unsigned integer overflow in `limit_write()` when calculati=
ng raw limits for maximum valid inputs.
- [High] Missing `hwmon_lock()`, lockless state mutation, and missing senso=
r command update in `repeatability_store()`.
- [High] I2C protocol violation: driver requests 6 bytes when reading 3-byt=
e limit registers.
- [Medium] Sensor read operations ignore hardware-provided CRC bytes, riski=
ng silent data corruption.
- [Medium] Concurrent device probes trigger an unsynchronized data race on =
the global `sht3x_crc8_table`.
--

--- Patch [1]: [PATCH] hwmon: sht3x: Fix unaligned accesses ---
commit 3b16c04f4d9f2de96142ecc5295ce7b48737c0c2
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: sht3x: Fix unaligned accesses

In sht3x_update_client(), extracting 16-bit values from an unaligned byte
array using be16_to_cpup() triggers alignment faults on architectures like
ARMv5 or SPARC. This patch fixes the problem by replacing the unaligned
pointers with get_unaligned_be16() and put_unaligned_be16().

> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index c2f6b73aa7f34..4d90f89a99297 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c

[ ... ]

> @@ -276,9 +277,9 @@ static struct sht3x_data *sht3x_update_client(struct =
device *dev)
>  		if (ret)
>  			goto out;
> =20
> -		val =3D be16_to_cpup((__be16 *)buf);
> +		val =3D get_unaligned_be16(buf);
>  		data->temperature =3D sht3x_extract_temperature(val);
> -		val =3D be16_to_cpup((__be16 *)(buf + 3));
> +		val =3D get_unaligned_be16(buf + 3);

[Severity: Medium]
This is a pre-existing issue, but does this ignore the hardware-provided CRC
bytes?

The SHT3x sensor returns 6 bytes per measurement (Temperature, CRC, Humidit=
y,
CRC). Using offsets 0 and 3 completely skips the interleaved CRC bytes at
indices 2 and 5 without validation, risking silent data corruption from I2C=
 bus
interference during sht3x_update_client().

>  		data->humidity =3D sht3x_extract_humidity(val);
>  		data->last_update =3D jiffies;
>  	}

[ ... ]

> @@ -336,7 +337,7 @@ static int limits_update(struct sht3x_data *data)
>  		if (ret)
>  			return ret;
> =20
> -		raw =3D be16_to_cpup((__be16 *)buffer);
> +		raw =3D get_unaligned_be16(buffer);
>  		temperature =3D sht3x_extract_temperature((raw & 0x01ff) << 7);

[Severity: High]
This is a pre-existing issue, but does this read 6 bytes for a hardware
command that only returns 3?

In limits_update(), the driver calls sht3x_read_from_command() with
SHT3X_RESPONSE_LENGTH (6 bytes). However, the limit read command (e.g. 0xE1=
1F)
only returns a single 16-bit word and an 8-bit CRC (3 bytes total).

Requesting 6 bytes forces the I2C master to clock 3 extra bytes after the
sensor stops transmitting, which can cause I2C protocol errors or NAK timeo=
uts
and abort the driver probe on strict I2C controllers.

>  		humidity =3D sht3x_extract_humidity(raw & 0xfe00);
>  		data->temperature_limits[index] =3D temperature;
>  		data->humidity_limits[index] =3D humidity;

[ ... ]

> @@ -389,7 +390,7 @@ static size_t limit_write(struct device *dev,
>  	raw =3D ((u32)(temperature + 45000) * 24543) >> (16 + 7);
>  	raw |=3D ((humidity * 42950) >> 16) & 0xfe00;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does this calculation overfl=
ow
for maximum valid inputs?

When userspace writes the valid maximum temperature (130000) or humidity
(100000) to limit_write(), the 32-bit integer arithmetic
((u32)(temperature + 45000) * 24543) equals 4,295,025,000, and
(humidity * 42950) equals 4,295,000,000.

Both exceed U32_MAX, silently wrapping around before the bitwise shifts. Th=
is
results in configuring the sensor to extreme minimums instead of maximums,
breaking thermal management logic.

> -	*((__be16 *)position) =3D cpu_to_be16(raw);
> +	put_unaligned_be16(raw, position);
>  	position +=3D SHT3X_WORD_LEN;
>  	*position =3D crc8(sht3x_crc8_table,

[Severity: High]
This is a pre-existing issue, but does this driver fail to use hwmon_lock()
for sysfs attributes?

The hwmon subsystem guidelines require hwmon_lock() for attributes register=
ed
outside the info structure, but heater_enable_store() uses a private lock:

drivers/hwmon/sht3x.c:heater_enable_store() {
    ...
	mutex_lock(&data->i2c_lock);

	if (status)
		ret =3D i2c_master_send(client, (char *)&sht3x_cmd_heater_on,
    ...
}

Additionally, repeatability_store() fails to take any lock, mutating
data->repeatability locklessly:

drivers/hwmon/sht3x.c:repeatability_store() {
    ...
	if (val > 2)
		return -EINVAL;

	data->repeatability =3D val;

	return count;
}

It also fails to call sht3x_select_command() after updating the value. For
single-shot measurements, sht3x_update_client() relies on data->command, wh=
ich
becomes stale, meaning the repeatability change takes no effect until anoth=
er
attribute is modified.

[Severity: Medium]
This is a pre-existing issue, but does this unconditional population of a
global array cause a data race?

The global sht3x_crc8_table is populated on every probe invocation without
DO_ONCE or lock protection:

drivers/hwmon/sht3x.c:sht3x_probe() {
    ...
	data->client =3D client;
	data->chip_id =3D (uintptr_t)i2c_get_match_data(client);
	crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);

	sht3x_select_command(data);
    ...
}

Concurrent driver probes will write to this shared global array
simultaneously, which could lead to data races.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725220205.1931=
189-1-linux@roeck-us.net?part=3D1
