Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1B376A08
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 21:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780090725; cv=none; b=cu3CJf5k+J9QnSbVV6Qw2P7rnm90VFQSzjmzyPdV5vrSS4c5SA2Ej6eOhQL4IzRuaYO9cs3kZjoi/PvgBDaj2lt7ehnUIXvTWo3tAzD/7lM77uVVbHggTeVtvfp/uq3c0Ci23J/mmxnOldcPu9v4C2HjZ0PPDze0vf0RDR+kivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780090725; c=relaxed/simple;
	bh=/w3U0ocZ/wpijPpvgFLT3+fF3tWXWAkGMblHI42wEe4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O958YqlzWVJbvFXSsLxVc298bdAnEmCtRfRT/Q2FHcRsnpJO7IBHnBldxWLbPnSzw10aUsLhUnQTZCt9r8Yc2EQGqf14Dvfgi9xp4zJGA8cUsYhTyaRl56Drgj6IYHGp/3J9rM8O/2dWECvkrgkFsXQriZbYL/5WGILqmRgAaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfHYvk2k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfHYvk2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354A51F00893;
	Fri, 29 May 2026 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780090723;
	bh=ruleNPmS7idnwXATl0Il44jBcxOf1VJPRNRcdB/UNWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KfHYvk2kLalZkKk4Igvq8i58JMOWlnU+DUa0M5Ch4W6GGhHeIASiwmOsPSkADH6WM
	 zKpgpaNzKovhwzLC3ZLkp0feWGKHaSlrjqNZtkzH9EiOZyWB9901SBtz6GC1Ipk1sP
	 MUuSguSNgS6woTYKpNhGV+OY19Ma6+GwqI4X5/odePTeqTZ3yc6nkhx0MR1RKVdrGh
	 rAFjk/9uLZb5MTsFq1ocmz5dq7NVMCSRJ2PjFeSzNv79pw5lJebseZS3X7dPbY6z/f
	 7ItmVwV/h1aUftRcnWB5rMn8RbCsYkntm+arQDNe/nGUKljaks+j6Wzmyn9CLjsHlr
	 bgDfA/VHxmMxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 21:38:41 +0000
Message-Id: <20260529213842.354A51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Aggressiveness check incorrectly handles the disabled state (0 K),=
 permanently locking unconfigured sensors and allowing fans to be disabled.
- [Medium] Integer truncation on 32-bit architectures bypasses input bounds=
 validation.
--

commit 84e7ddf64f7f5ac65172c3a7ccc4e158bbb73094
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (cros_ec) Allow modification of fan curves

This commit exposes the EC fan curves through the standard hwmon sysfs
ABI, allowing both reading and writing. It includes logic to ensure
the curves can only be made more aggressive than their current state.

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 731143f8c6b2a..fb73a00ebeebd 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c

[ ... ]

> @@ -417,14 +435,60 @@ static ssize_t temp_auto_point_temp_show(struct dev=
ice *dev, struct device_attri
>  	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(te=
mp));
>  }
> =20
> +static ssize_t temp_auto_point_temp_store(struct device *dev, struct dev=
ice_attribute *attr,
> +					  const char *buf, size_t size)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
> +	struct cros_ec_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +	struct ec_thermal_config config;
> +	u32 *temp_field;
> +	s64 temp;
> +	int ret;
> +
> +	ret =3D kstrtos64(buf, 10, &temp);
> +	if (ret)
> +		return ret;
> +
> +	temp =3D cros_ec_hwmon_millicelsius_to_kelvin(temp);

[Severity: Medium]
Does this silently truncate values on 32-bit platforms?

The cros_ec_hwmon_millicelsius_to_kelvin() function takes a long parameter:

static long cros_ec_hwmon_millicelsius_to_kelvin(long t)

Since temp is parsed as an s64, passing an extremely large out-of-bounds
value on a 32-bit architecture might truncate to a small valid value.
Could this bypass the aggressiveness and overflow checks below, allowing
invalid internal values to be applied?

> +
> +	if (overflows_type(temp, config.temp_fan_off))
> +		return -ERANGE;
> +
> +	guard(hwmon_lock)(dev);
> +
> +	ret =3D cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &=
config);
> +	if (ret)
> +		return ret;
> +
> +	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
> +		temp_field =3D &config.temp_fan_off;
> +	else /* temp_fan_max */
> +		temp_field =3D &config.temp_fan_max;
> +
> +	/* Only allow values which are more aggressive than the current ones */
> +	if (temp > *temp_field)
> +		return -EINVAL;

[Severity: High]
How does this handle the disabled state where the current threshold is 0 K?

If a sensor is currently uninitialized or disabled where *temp_field is 0,
any valid positive temperature input evaluates to true here, rejecting the
configuration. This seems to make it impossible to configure uninitialized
fan curves.

Conversely, if a user inputs -273150 mC representing 0 K, the check evaluat=
es
to false. This bypasses the check and sets the threshold to 0, which disabl=
es
the fan. Would this allow the fans to be made less aggressive, contradicting
the documented policy?

> +
> +	*temp_field =3D temp;
> +
> +	if (config.temp_fan_off > config.temp_fan_max)
> +		return -EINVAL;
> +
> +	ret =3D cros_ec_hwmon_set_thermal_config(priv->cros_ec, sattr->index, &=
config);
> +	if (ret)
> +		return ret;
> +
> +	return size;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-cros_ec-hw=
mon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=3D5
