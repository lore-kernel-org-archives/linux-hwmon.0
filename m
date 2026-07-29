Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E3334F46F
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342518; cv=none; b=UFekGVurObkjPfGkyTYT++qTerRpCDrhqvj1lsDpxoP5RKkUOF3Y6xCuv6TgRArmwRzhGdpJGD32UGmT7BaFmcB9raHN+cKIkHisc57oFENxHXZFT+LltYytga8eigD0gN/ovrL+/XZC+kUDWT0T2Y1OzPoSBONaJXA//sh45vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342518; c=relaxed/simple;
	bh=23XMI5K5LIq57ctGCZI16Bz6vT7E5rMZqNMr1bjfpGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qWoUnnNOOrX0CyMDe4daz2z56SHOov0jLrAswihHTwUKy72BTXJKe7NDz+dsVnF5J4DfMc27mxt0yNUaJZ9eL71Wf9rBhL8H5kphIc8tW0hTXt5FyYmwgdF7c8orVdQRsr6jvssq3lCnSyklkCc0HmMpWgQHA3f7aVBMzMRUg1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kf/tmPLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kf/tmPLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BDF1F00A3A;
	Wed, 29 Jul 2026 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785342516;
	bh=jyEauN0zzGOhh87VPJ20mxLLxTYf6a9j4asrUoLfj54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kf/tmPLBKctvryD2HtBedJR2viuG7xVeGidjXFP3FMmv+j8Sq9zZTmfxuUSkcNU3w
	 fHhkBQEQ5OD7XNjzNAq24Q6O7egvOKxZQ8JN4ndbKis6SBJCoQjN98FVfch3+zLp9Z
	 UJbwJ2wESytoctSzi4ZiE8xKBdm7Ee1DtIwlsNPSThZ+Qt/MqxH3WrblN5DeXXFBD+
	 QemJXxkFBHejnDrfD0dY+T1w3ETwwzldMJEMvVw/nq8GrDnJ9zgrHTZTpq/hsW2X/x
	 wB+lfyQinp7r0cqMhsweMQidbuuOhPtwNmSMNQMgp4aI278wACKVx39LSf3JaQhhLs
	 /KENfWEKnYHCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] hwmon: (ina2xx) Return 0 on inactive alarm/limit
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-4-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-4-349f7b2f1df8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 16:28:36 +0000
Message-Id: <20260729162836.89BDF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Writing `0` to an inactive alert limit attribute unintentionally d=
isables the currently active alert limit of a completely different type.
- [High] In `ina2xx_get_value`, calculating `INA2XX_POWER` can overflow a 3=
2-bit signed `int` for small shunt resistor values, resulting in negative p=
ower readings.
- [High] In `ina226_alert_to_reg`, `INA2XX_SHUNT_VOLTAGE` limits can overfl=
ow a 32-bit signed `long`, causing large limits to be incorrectly clamped t=
o 0 on 32-bit systems.
- [High] In `ina226_alert_to_reg`, `INA2XX_POWER` limits always evaluate to=
 0 on 32-bit systems because `UINT_MAX` is cast to a negative `long` in the=
 clamping macro.
- [Medium] The `shunt_resistor_show` function accesses shared driver state =
locklessly, violating HWMON subsystem locking guidelines.
--

--- Patch [4]: [PATCH 4/4] hwmon: (ina2xx) Return 0 on inactive alarm/limit=
 reads ---
commit 4e821bd1003ecc2b04b0b58f9702178e2bd3a2eb
Author: Jared Kangas <jkangas@redhat.com>

hwmon: (ina2xx) Return 0 on inactive alarm/limit reads

Guard alarm/limit reads with a check that returns zero if the active
alarm is for a different type to avoid unintentionally clearing alarms.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 8ba0dce1f9e31..5521490deba98 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -479,6 +479,12 @@ static int ina226_alert_limit_read(struct ina2xx_dat=
a *data, enum ina2xx_alert_t
>  	u32 mask;
>  	int ret;
> =20
> +	/* Avoid nonzero reads from inactive alerts caused by shared limit regi=
ster */
> +	if (data->active_alert !=3D alert) {
> +		*val =3D 0;
> +		return 0;
> +	}
> +

[Severity: High]
This isn't a bug introduced by this patch, but since we are fixing the
read path for inactive alerts here, what happens on the write path?

If a user or monitoring daemon reads an inactive alert attribute (which
now correctly returns 0) and subsequently writes 0 back to it, will
ina226_alert_limit_write() unconditionally wipe the active alert?

Looking at ina226_alert_limit_write():

	ret =3D regmap_update_bits(regmap, INA226_MASK_ENABLE,
				 INA226_ALERT_CONFIG_MASK, 0);
	...
	data->active_alert =3D val ? alert : INA2XX_ALERT_NONE;

Does this inadvertently destroy the configuration of the currently active
alert of a different type without checking if the disable operation applies
to it?

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential overflow when
calculating power values.

In ina2xx_get_value() for INA2XX_POWER:

	case INA2XX_POWER:
		val =3D regval * data->power_lsb_uW;
		break;

If a user configures a small shunt resistor (e.g., 1 mOhm), power_lsb_uW
becomes large. When the hardware measures high power, regval can also be
quite large.=20

Since val is a 32-bit signed integer, could this multiplication overflow
on 32-bit architectures and result in incorrect negative power readings
being reported to userspace?

[Severity: High]
This is a pre-existing issue, but could we run into an overflow on 32-bit
architectures when setting shunt voltage limits?

In ina226_alert_to_reg():

	case INA2XX_SHUNT_VOLTAGE:
		val =3D clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
		val *=3D data->config->shunt_div;

On a 32-bit system, long is 32 bits. If a user inputs a large limit, and
it passes the first clamp, the multiplication by shunt_div could exceed
the maximum value of a signed 32-bit integer.

Does this overflow the signed long, wrapping to a negative value that
then gets incorrectly clamped to 0 by the final clamp_val()?

[Severity: High]
This is a pre-existing issue, but setting power limits on 32-bit systems
seems to always evaluate to 0.

In ina226_alert_to_reg():

	case INA2XX_POWER:
		val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);

The clamp_val macro casts bounds to typeof(val) which is a signed long.=20

On 32-bit systems, does UINT_MAX - data->power_lsb_uW evaluate to a
large positive unsigned value that becomes negative when cast to a
signed long?

If the upper bound is negative, does this force clamp_val to rewrite all
positive user inputs to negative values, guaranteeing the function always
returns 0?

[Severity: Medium]
This is a pre-existing issue, but there appears to be a locking violation
when reading the shunt resistor.

The hwmon subsystem guidelines require drivers to use hwmon_lock() for
attributes registered outside the core info parameter.=20

Looking at shunt_resistor_show():

static ssize_t shunt_resistor_show(struct device *dev,
				   struct device_attribute *da, char *buf)
{
	struct ina2xx_data *data =3D dev_get_drvdata(dev);

	return sysfs_emit(buf, "%li\n", data->rshunt);
}

Since shunt_resistor_store() modifies data->rshunt, does this show
function need to acquire the hwmon_lock to prevent unprotected concurrent
accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-upstream-i=
na2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=3D4
