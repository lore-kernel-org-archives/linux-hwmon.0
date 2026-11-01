Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793573486;
	b=sJA1VFmzCyD9FgNn60SqyrfCxJHXs48K7XWAQ34vkbvVk9UqoeE9UDkYEX7UbpdaE+ej
	 sdRtBjWBbgVcRv6IYma/cgffeerlNooHaweg/oZsbSNR+TqtXP9badoPK/rfPs4oBOEH5
	 AfP3H7xXjI+ooayrp+Is34UdC6+1IdKY0LKOd7tY7tt5IgLCajUcp5hpyA1YsG1LVlMjC
	 BnxBUFmYeRGgoI0Eoty9K5bY9e4yF0QWSnlVsyK/4WX/WNUSuT11LpB1iFaSwNyW2YWWm
	 nI8wIL6myFjn4wdbpY0Pijjpuro9TdnShgDNkUNiAw8JmCkZyge/txJspNL8pAc5FKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573486;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wyHjc0TtSaQumBKmBWN97xff93IH17lD27WK/KV+HrE=;
	b=CTKVPs5qiFuiVPFyvHaq1qMX0N2/RUvwDv34x5ixV8gxB2zarEqAu+YcxoIeHY3mNjZG
	 sv614DzCORE6QgxiIqXZ0SblWCr9vyhpLWe11eICy5q1RmIOodPNitpKtyBuFSLzcy6xL
	 k4WP9HwEi++wSGPaLNN7Q2vxvInshmKYJSs5AAVCI7MaU2CI3N7DmGxg3+Dcub8SNbYGA
	 PN3va2cX3RkFGzdC4bV3qqQKhN98VdV1nzw+jic5rAIu4tDCWIYpLhb5ttafBpkNTeItc
	 7EOOAroK34KeJYmBxpLGvornvEf+gi8TU9p1Rv01REuWTJixk8CR67t8A8fnMZ6iCbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTr+Wsdy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91046606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 22:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTr+Wsdy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04CE1F000C1;
	Sun,  1 Nov 2026 22:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793573486;
	bh=wyHjc0TtSaQumBKmBWN97xff93IH17lD27WK/KV+HrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FTr+WsdybekG2f676UQkSrQT8fySVAJseZXwblb0GayvEX9n9JjjQo2OH+niuD/94
	 s4vPIAgsrfjtbRDoJG8J4ATMXLhdEgAT+IjaJTqEPn2kiv1u1mfpXDEFMlYP2HiNob
	 fPc1XOW62aFFE3RorDKZNTO3ix9WGNvEae4S1AYBgvy0TdZK8JrAlTUq91RTSA3LjA
	 9kbWn9woWBa5wT0wWvjhxhMTgTfLDXiPYnkbpvQbrwZFhKYnJtCLmsbQ71rypV3Y/z
	 FS5p+F9Y9kR38cxfhDr3Jo57SLIsxeC35kLAqR8L7HNl2YwYjXo7uMzWAjHjSeH7bh
	 OeO4Vjyqi0/eg==
Message-ID: <sashiko-outbox-192738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101223125.302001-6-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
 <20261101223125.302001-6-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:51:25 +0000
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
- [High] hwmon: sy7636a: returning -ENODATA when rails are off disables the=
rmal zone
--

commit 72fc8d76dc4f0fe2ee1ec4e02805a6f20803ef65
Author: Pablo Mazzini <pmazzini@gmail.com>

hwmon: sy7636a: read the temperature only while the rails are on

This commit stops enabling the VCOM regulator at probe, registers the hwmon
device under the chip name "sy7636a", and reads the fault flag alongside the
thermistor in a single bulk transfer, returning -ENODATA when power good is
not set.

> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> index f01f368d68e5f..475aff997c2d2 100644
> --- a/drivers/hwmon/sy7636a-hwmon.c
> +++ b/drivers/hwmon/sy7636a-hwmon.c
> @@ -14,7 +14,6 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/regulator/machine.h>
> =20
>  #include <linux/mfd/sy7636a.h>
> =20
> @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hwmo=
n_sensor_types type,
>  			u32 attr, int channel, long *temp)
>  {
>  	struct regmap *regmap =3D dev_get_drvdata(dev);
> -	int ret, reg_val;
> -
> -	ret =3D regmap_read(regmap,
> -			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> +	u8 buf[2];
> +	int ret;
> +
> +	/*
> +	 * Read power good and the thermistor in one transfer: the thermistor is
> +	 * only sampled while the rails are on, and power good comes after the
> +	 * first sample
> +	 */
> +	ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(bu=
f));
>  	if (ret)
>  		return ret;
> =20
> -	*temp =3D (s8)reg_val * 1000;
> +	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> +		return -ENODATA;

[Severity: High]
Will returning -ENODATA in sy7636a_read() when SY7636A_FAULT_FLAG_PG is
cleared cause the thermal core to permanently disable the attached thermal
zone when the rails remain off?

In drivers/hwmon/sy7636a-hwmon.c, sy7636a_info sets HWMON_C_REGISTER_TZ:

static const struct hwmon_channel_info * const sy7636a_info[] =3D {
	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
	NULL
};

In arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts, the epd-thermal zone
binds to &sy7636a with a 30-second polling delay while the vcom regulator o=
nly
specifies regulator-boot-on:

	thermal-zones {
		epd-thermal {
			thermal-sensors =3D <&sy7636a>;
			polling-delay-passive =3D <30000>;
			polling-delay =3D <30000>;

When the thermal zone is polled while the EPD rails are off, the call chain
__thermal_zone_device_update() -> __thermal_zone_get_temp() ->
hwmon_thermal_get_temp() -> sy7636a_read() passes -ENODATA to
thermal_zone_recheck() in drivers/thermal/thermal_core.c:

static void thermal_zone_recheck(struct thermal_zone_device *tz, int error)
{
	if (error =3D=3D -EAGAIN) {
		thermal_zone_device_set_polling(tz, THERMAL_RECHECK_DELAY);
		return;
	}

	if (tz->recheck_delay_jiffies =3D=3D THERMAL_RECHECK_DELAY)
		dev_info(&tz->device, "Temperature check failed (%d)\n", error);

	thermal_zone_device_set_polling(tz, tz->recheck_delay_jiffies);

	tz->recheck_delay_jiffies +=3D max(tz->recheck_delay_jiffies >> 1, 1ULL);
	if (tz->recheck_delay_jiffies > THERMAL_MAX_RECHECK_DELAY) {
		thermal_zone_broken_disable(tz);

Because thermal_zone_recheck() only treats -EAGAIN as a non-fatal retry and
treats -ENODATA as a sensor failure, it logs an error, switches to
exponential backoff polling starting at 250 ms, and after roughly 5.5 minut=
es
with the rails off calls thermal_zone_broken_disable(), which sets the ther=
mal
zone mode to THERMAL_DEVICE_DISABLED so thermal monitoring remains disabled
even after the rails are turned back on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101223125.3020=
01-1-pmazzini@gmail.com?part=3D5
