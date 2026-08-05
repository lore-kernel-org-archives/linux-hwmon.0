Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846FA400964;
	Wed,  5 Aug 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922836; cv=none; b=LTjm2cxk+SpW7C7BHEEw03bPFQbKpxEhuHJ2R/eJUeJjt+92U/GvXOQjuO1pwNkTuOzNxrDcH1FbR8Vk3wNrhT+jls29hs5q6sQcx71uydcXkwEZ8qpT90HZbBVGebfZBDqQWCl6illpLMmiitXOV7m5KLsGqJuYxCQLwBgD4mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922836; c=relaxed/simple;
	bh=O6+Bx6KOhVXMWbsfHv+7ROQbeGIvqHrj6dGp8hhJUnA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aU/au0Qud2P4Wh3twtq26sHUoBQfcXd5eRUVlTr52VDFTmP8Br8JyfFF1mSlFTwrysyYN1uSW8/ZcvTgN01lALxouhQxp87Yd/UhXfKxZHyA5UVvrsGsKVAbyxlxIa4FcJo6h3b1MzZxkokzuQWxjMQEUddFmikWxbV1odnlR24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIIUALs1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIIUALs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F97E1F000E9;
	Wed,  5 Aug 2026 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785922832;
	bh=lUZ2ba8/2yVvVlO7KN6Zd/036UJgd2P+dBikC+yycLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AIIUALs1D79gc1gmwL6nqUGZjpDlIkYmjnUQPuvw3UGMLLweRiqu2n58jBMo8I4jI
	 VDdhG/wU644Fp793YQLh253ik6fjwhIUtK/xV6cQcrMhEI2aw6DIKtoRFeBXahS9GR
	 xZK1rApuZV2W8Z8LEoE196WM9TuPwbjEWsYVfUGfF994BkQQkhucgdIXNvgdaK7Df9
	 x/2lmsiwnBLNXRMMN5wIqTeYmk4xJ+0qApznQSnxPiiS8JBa3p7W23GuL5qJEkQrGd
	 hlVa87BQLEvw4Peom+/AFHIPsOP8znjPhvMtjSH3Tw8ABkXpUOUJ2sUs8nrsRWuthQ
	 15mqGUrZEPMqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:40:31 +0000
Message-Id: <20260805094031.9F97E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing Kconfig dependency causes undefined reference to devm_ther=
mal_of_cooling_device_register.
- [Medium] Missing lock around 16-bit variable read in show_local_temp8.
- [Medium] Handling of I2C write errors in pwm1_freq_store permanently desy=
nchronizes the driver's software state from the hardware state.
--

--- Patch [4]: [PATCH v3 4/6] hwmon: (lm63) Add Sensylink CTF2301 support -=
--
commit 951fc5c354ae91e1c67e85c453464f893528203b
Author: Troy Mitchell <troy.mitchell@linux.dev>

hwmon: (lm63) Add Sensylink CTF2301 support

Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
the LM63-style temperature, tachometer, and PWM register layout,
while using a 12-bit local temperature register and requiring the
ALERT/TACH pin to be configured for tachometer input.

Register an optional thermal cooling device when the device tree
node provides #cooling-cells.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d599..abb1af8664fb3 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1501,10 +1501,10 @@ config SENSORS_LM63
>  	depends on I2C

[Severity: High]
Could this lead to a linker error if the user configures the kernel with
CONFIG_THERMAL=3Dm and CONFIG_SENSORS_LM63=3Dy?

CONFIG_THERMAL_OF is a boolean, so it can be enabled even when the thermal
subsystem is built as a module. If the driver is built-in, the IS_ENABLED
check in lm63_probe evaluates to true, causing the built-in driver to call
devm_thermal_of_cooling_device_register from the modular thermal_sys.

Should there be a dependency like depends on THERMAL || THERMAL=3Dn here to
prevent this configuration?

[ ... ]

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index e2a429e579ac1..3887f02b924d1 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c

[ ... ]

> @@ -512,35 +573,55 @@ static ssize_t pwm1_freq_store(struct device *dev,
> =20
>  	if (slow_clock)
> -		data->config_fan |=3D 0x08;
> +		config_fan |=3D 0x08;
>  	else
> -		data->config_fan &=3D ~0x08;
> -	i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, data->config_fan=
);
> -	i2c_smbus_write_byte_data(client, LM63_REG_PWM_FREQ, pfr);
> +		config_fan &=3D ~0x08;
> +	ret =3D i2c_smbus_write_byte_data(client, LM63_REG_PWM_FREQ, pfr);
> +	if (ret)
> +		goto unlock;
> +	ret =3D i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN,
> +					config_fan);
> +	if (ret)
> +		goto unlock;
> +
> +	data->config_fan =3D config_fan;
> +	data->pwm1_freq =3D pfr;
> +	data->pwm_highres =3D !slow_clock && pfr =3D=3D 8 &&
> +				(config_enhanced & 0x10);
> +unlock:
>  	mutex_unlock(&data->update_lock);

[Severity: Medium]
Is it possible for the hardware state to desynchronize from the software
state if an I2C error occurs here?

If a user writes to the pwm1_freq sysfs attribute and the first I2C write
succeeds, but the second fails, the function aborts early via goto unlock.
Because the internal data structure is only updated at the end of the
function, the early abort leaves the hardware updated while the software
caches remain unmodified.

Would it be safer to update the software state incrementally as the writes
succeed, or revert the hardware state on failure?

[ ... ]

> @@ -555,6 +636,11 @@ static ssize_t show_local_temp8(struct device *dev,
>  {
>  	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
>  	struct lm63_data *data =3D lm63_update_device(dev);
> +
> +	if (data->kind =3D=3D ctf2301)
> +		return sprintf(buf, "%d\n", TEMP12_FROM_REG(attr->index ?
> +				       data->temp1_max : data->temp1_input));
> +

[Severity: Medium]
Does this lockless read introduce a data race?

The 16-bit variables data->temp1_max and data->temp1_input are read here
without holding data->update_lock. However, these values are updated under
the lock in set_temp8 when a user concurrently modifies the temperature
limit via sysfs.

Could this result in a torn read or reading partially updated state, causing
an incorrect temperature limit to be reported to user-space?

>  	return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->temp8[attr->index]));
>  }

[ ... ]

> @@ -1273,11 +1519,26 @@ static int lm63_probe(struct i2c_client *client)
>  	if (data->kind =3D=3D lm96163) {
>  		data->groups[groups++] =3D &lm63_group_temp2_type;
>  		data->groups[groups++] =3D &lm63_group_extra_lut;
> +	} else if (data->kind =3D=3D ctf2301) {
> +		data->groups[groups++] =3D &lm63_group_extra_lut;
>  	}
> =20
>  	hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, client->name,
>  							   data, data->groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	if (IS_ENABLED(CONFIG_THERMAL_OF) &&
> +	    of_property_present(dev->of_node, "#cooling-cells")) {
> +		cdev =3D devm_thermal_of_cooling_device_register(dev, 0,
> +							       client->name,
> +							       data,
> +							       &lm63_cooling_ops);

[Severity: High]
Could calling devm_thermal_of_cooling_device_register without a proper Kcon=
fig
dependency cause undefined references during the build?

As noted above, if CONFIG_THERMAL=3Dm and CONFIG_SENSORS_LM63=3Dy, this pat=
h will
be reached by a built-in driver trying to resolve a symbol exported by a
loadable module.

> +		if (IS_ERR(cdev))
> +			return PTR_ERR(cdev);
> +	}
> +
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ctl2301-v3=
-0-fd4b8ffb5b0d@linux.dev?part=3D4
