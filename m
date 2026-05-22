Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281A383984
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483572; cv=none; b=LXJgwB1b9LD8zOYUv98jL3XhqvQp0Z9IPMMkZrWcTLenszNuFlYa7+PC5fQS7EQ3WVSQrUQqhvnsKvVCKyT3gRk208qv9PwSKpaEUSIQtYFRWQFk7Gaz4XV+xiRSH/OSbgc2YwDhUPiJc842EyWA9psTjrYfdgQfpqZOcYpH2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483572; c=relaxed/simple;
	bh=HvEDumBrgwgBRl3miXDonWvjoHOrSmoh/WjApWDGAxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6UEnhsTWvCcBo+b8LwBfirg0eBP4ngwd1LICYvi2vvGkyv4HaIyIqo3P3uLadJ57J8ul9E0rUDoiB9SxeFXKS8FN3P1LiyLl2SAtEImd5uv9FTNkvqhYgQc/fNaZFBdXKf91FbvKApIY6IM6HUFlpFw6d1iC0JBgA4mCYhEp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/2v6WyL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/2v6WyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2EF1F000E9;
	Fri, 22 May 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779483570;
	bh=AgKZF3287xqFR6SdLDyj+Oo3kLHFuI4OAMVzfHL4uW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/2v6WyLbjpWxeIQ/Ie5VsP3hsaNAJcDBYsjc9mr5JAGMFxya3zuKFl19Cfq80Go6
	 rHGEVtK2yIjMR+9mp/qtriM6Sw+iFDWpfHlzzhuKgsc0QLkSln4QD24LdHupEKbO80
	 6IeLdnrwv7T7dO+pzNmNY2ndigB2arv3jXNVN0ozuaCmmqFkv/L4J/ZF4QwwbyO0cc
	 /ISmdW86RitLD3r7DWdJvGrjqO7dmULGnponKEfIEPoCN5i1A4/sIbWvZjwwv8BuYt
	 zeDMFoSwrubrrRLe/ivl2OBl0UC8KjX+Mo2/fUarfaV8kVTj1jWqyzmzUz1CKAMvd+
	 OzXdFlkKTTFZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (lm63) expose PWM frequency and LUT
 hysteresis as writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Henrik Bruhn" <kernel@jhbruhn.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260522202250.3184791-1-kernel@jhbruhn.de>
References: <20260522202250.3184791-1-kernel@jhbruhn.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 20:59:29 +0000
Message-Id: <20260522205930.3E2EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Error handling in `pwm1_freq_store` leaves the software cache and =
hardware out of sync.
- [Medium] Time-of-Check to Time-of-Use (TOCTOU) race condition in `pwm1_fr=
eq_store` allows writes to read-only hardware registers.
- [Medium] `pwm1_auto_point_temp_hyst_store` writes to the LUT Hysteresis r=
egister without verifying if the LUT is unlocked.
- [Medium] Unprotected reads in `pwm1_freq_show` lead to inconsistent state=
 calculation.
--

commit 14b83e16319e09218194853a200383c1b94b855a
Author: Jan-Henrik Bruhn <kernel@jhbruhn.de>

hwmon: (lm63) expose PWM frequency and LUT hysteresis as writable

This commit adds sysfs attributes to allow configuring the PWM frequency=20
and LUT hysteresis in the lm63 driver. It exposes pwm1_freq for PWM base=20
frequency and a single chip-wide pwm1_auto_point_temp_hyst for hysteresis.

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 30500b4d22212..b95e866ed1ee4 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
[ ... ]
> @@ -455,6 +458,83 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  	return count;
>  }
> =20
> +static ssize_t pwm1_freq_show(struct device *dev,
> +			      struct device_attribute *dummy, char *buf)
> +{
> +	struct lm63_data *data =3D lm63_update_device(dev);
> +	unsigned int base =3D (data->config_fan & 0x08) ?
> +			    LM63_PWM_BASE_SLOW_HZ : LM63_PWM_BASE_FAST_HZ;
> +
> +	return sprintf(buf, "%u\n", base / data->pwm1_freq);
> +}

[Severity: Medium]
Does lm63_update_device() release the update_lock before returning?

If so, is there a race condition here? If another thread modifying these
variables in pwm1_freq_store() runs concurrently, could this code read the
new config_fan clock base but the old pwm1_freq divider, resulting in an
incorrect frequency calculation?

> +
> +/*
> + * Pick the closest CONFIG_FAN.SCS + PFR for the requested frequency.
> + * PWM_FREQ writes need the LUT unlocked, same as set_pwm1(). LUT PWM
> + * bytes are register-relative; rewrite them after a frequency change
> + * if duty cycles must be preserved.
> + */
> +static ssize_t pwm1_freq_store(struct device *dev,
> +			       struct device_attribute *dummy,
> +			       const char *buf, size_t count)
> +{
> +	struct lm63_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	unsigned long val, pfr_fast, pfr_slow, err_fast, err_slow, pfr;
> +	bool slow_clock;
> +	int ret;
> +
> +	if (!(data->config_fan & 0x20)) /* register is read-only */
> +		return -EPERM;

[Severity: Medium]
Can a concurrent update to manual mode lead to a desynchronized cache?

Since this check for manual mode is outside the data->update_lock critical
section, could another thread concurrently disable manual mode before the l=
ock
is acquired below?

If that happens, the hardware would ignore the write to LM63_REG_PWM_FREQ,
but the driver unconditionally updates data->pwm1_freq, potentially leaving=
 the
software cache permanently desynchronized from the hardware.

> +
> +	ret =3D kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
[ ... ]
> +	mutex_lock(&data->update_lock);
> +	ret =3D i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_FAN);
> +	if (ret < 0) {
> +		mutex_unlock(&data->update_lock);
> +		return ret;
> +	}
> +	data->config_fan =3D ret;
> +	if (slow_clock)
> +		data->config_fan |=3D 0x08;
> +	else
> +		data->config_fan &=3D ~0x08;
> +	i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, data->config_fan=
);
> +	i2c_smbus_write_byte_data(client, LM63_REG_PWM_FREQ, pfr);
> +	data->pwm1_freq =3D pfr;
> +
> +	if (data->kind =3D=3D lm96163) {
> +		ret =3D i2c_smbus_read_byte_data(client, LM96163_REG_CONFIG_ENHANCED);
> +		if (ret < 0) {
> +			mutex_unlock(&data->update_lock);
> +			return ret;
> +		}

[Severity: High]
If this read fails, the function aborts and returns an error code without
updating data->pwm_highres.

However, data->config_fan and data->pwm1_freq have already been updated in
the cache and written to hardware. Does returning an error here leave the
hardware state out of sync with what userspace expects, while keeping the
driver's PWM scaling formula permanently desynchronized from the hardware's
actual operating mode?

> +		data->pwm_highres =3D !slow_clock && pfr =3D=3D 8 && (ret & 0x10);
> +	}
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
[ ... ]
> @@ -629,6 +709,42 @@ static ssize_t show_lut_temp_hyst(struct device *dev,
>  	return sprintf(buf, "%d\n", temp);
>  }
> =20
> +/*
> + * The LM63 has a single hysteresis register shared by all LUT entries.
> + * Expose it as a chip-wide hysteresis amount in millidegrees; the
> + * per-point pwm1_auto_pointN_temp_hyst attributes remain read-only and
> + * show the resulting absolute trip-down temperature for each entry.
> + */
> +static ssize_t pwm1_auto_point_temp_hyst_show(struct device *dev,
> +					      struct device_attribute *dummy,
> +					      char *buf)
> +{
> +	struct lm63_data *data =3D lm63_update_device(dev);
> +
> +	return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->lut_temp_hyst));
> +}
> +
> +static ssize_t pwm1_auto_point_temp_hyst_store(struct device *dev,
> +					       struct device_attribute *dummy,
> +					       const char *buf, size_t count)
> +{
> +	struct lm63_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	unsigned long val;
> +	int err;
> +
> +	err =3D kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&data->update_lock);
> +	data->lut_temp_hyst =3D HYST_TO_REG(val);
> +	i2c_smbus_write_byte_data(client, LM63_REG_LUT_TEMP_HYST,
> +				  data->lut_temp_hyst);

[Severity: Medium]
Should this function check if the device is in manual mode before writing?

If a user attempts to write to this attribute while the device is in
automatic mode, it looks like the hardware will silently ignore the write
because the LUT is locked, but the driver updates data->lut_temp_hyst.
Does this cause the sysfs interface to reflect a false state?

> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522202250.3184=
791-1-kernel@jhbruhn.de?part=3D1
