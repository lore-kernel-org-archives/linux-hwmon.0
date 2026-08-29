Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64423393E
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024032; cv=none; b=NmEo+TBWaX91dHvbbVcnAuagCQtVzr52BdLytbcJBsK7uIshsMBYR1rXD9ddG8BJEb9cnoGrkCDEWSjhTLJWLqBfO/qhcpTtfleBpYfKXvE9xTUEA8VFe81NtoRy8e48DpRp22dLRVXMSzYP65yuD3emmI1p9wx9SKD7+yF9+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024032; c=relaxed/simple;
	bh=PwsC0daQtY6aWx9m67a/Kz8sR96RhDecpJb4R8+QfZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NADLPVXzmaE6dSh7y1/LmGmx6cBa8ZSkn8bCEYdW62YaXD9SOtDHwQGIhXI5pTdDgM8lHo6thIfP9yXZ4OXei31I6/jSOyrF7ImxPt+C9JVcTVoxLgosH+Ml4XPxzTjGkbqFDD6d2509EAbxAKgCK/lLsF2gsn+x+OLvyMzIKXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIBryDn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIBryDn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC13C1F000E9;
	Sat, 29 Aug 2026 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788024031;
	bh=d7LTskyLRn0W9JvixeV628ph8q2SbACfAAWJuldaWXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RIBryDn72a8oAQvGnimQa5CUTs8gp/nMduzlHx6J9TAQoIs90DJwidOpe7vGdooCe
	 7w0BfKOLIEvR/hrWOEn2ETZWoScmcrDlWWTSlmBx6xOms9ZhR78FaV7Vg38yYT6PjD
	 9ndN9eFDTIf6Dli+uxqIPOS8g7yR5/cH6Evwlebo+uTdBDIuCWOmUXigtPZoTYewre
	 rt33juLCdK1MqYw0bfM4V5Yw/+S92q4RH/l8AD+GaW+Ic9lBBZnEZXWCQL3lP8YKE2
	 U5/4N+cxq+jdZ32RvdG0kHbfnCgAgg52MnNOgo0iOhRA4OIQXvT9W5XAaottq7h9iE
	 bjyEmyy0P24zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] hwmon: it87: prepare for extended PWM temp maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829170545.33401-3-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829170545.33401-3-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 17:20:30 +0000
Message-Id: <20260829172030.CC13C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] A missing pair of braces in `it87_update_pwm_ctrl` causes a dangli=
ng `else` that unconditionally corrupts the manual PWM duty cycle for legac=
y chips.
- [High] Adding `it87_update_pwm_ctrl` to `set_pwm_enable` clobbers deferre=
d `pwm_temp_map` settings for newer chips.
- [Medium] Replacing `data->num_temp_map` with hardcoded `IT87_PWM_OLD_NUM_=
TEMP` breaks PWM-to-temperature mapping on chips with larger map groupings =
(e.g., IT8603E and IT8622E).
--

commit df4c2373d867162752a6dc57c16ff16987dbedff
Author: benoit.masson <yahoo@perenite.com>

hwmon: it87: prepare for extended PWM temp maps

This commit introduces helper logic for PWM-to-temperature mappings,
preparing the driver for newer register layouts with extended maps
while keeping legacy chips unaffected. It replaces the old hardcoded
3-sensor mappings with dynamic lookup helpers based on chip features.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 1c77f6c97fc36..e077adbb30911 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
[ ... ]
> @@ -786,6 +816,71 @@ static int pwm_from_reg(const struct it87_data *data=
, u8 reg)
[ ... ]
> +static unsigned int pwm_temp_channel(const struct it87_data *data,
> +				     int nr, u8 map)
> +{
> +	if (has_new_tempmap(data)) {
> +		u8 num =3D pwm_num_temp_map(data);
> +
> +		if (map >=3D num)
> +			map =3D 0;
> +		return map;
> +	}
> +
> +	if (map >=3D IT87_PWM_OLD_NUM_TEMP)
> +		map =3D 0;
> +
> +	if (nr >=3D IT87_PWM_OLD_NUM_TEMP)
> +		map +=3D IT87_PWM_OLD_NUM_TEMP;

[Severity: Medium]
Does replacing data->num_temp_map with the hardcoded IT87_PWM_OLD_NUM_TEMP
here break chips with 4 temperature maps?

Chips like IT8603E and IT8622E have num_temp_map =3D=3D 4, but lack the
FEAT_NEW_TEMPMAP flag. This logic unconditionally forces an offset of 3 for
pwm4 on legacy chips, ignoring the fact that they might have 4 maps.

> +
> +	return map;
> +}
> +
> +static int pwm_temp_map_from_channel(const struct it87_data *data, int n=
r,
> +				     unsigned int channel, u8 *map)
> +{
> +	if (has_new_tempmap(data)) {
> +		u8 num =3D pwm_num_temp_map(data);
> +
> +		if (channel >=3D num)
> +			return -EINVAL;
> +		*map =3D channel;
> +		return 0;
> +	}
> +
> +	if (nr >=3D IT87_PWM_OLD_NUM_TEMP) {
> +		if (channel < IT87_PWM_OLD_NUM_TEMP ||
> +		    channel >=3D 2 * IT87_PWM_OLD_NUM_TEMP)
> +			return -EINVAL;
> +		channel -=3D IT87_PWM_OLD_NUM_TEMP;
> +	} else {

[Severity: Medium]
Will this erroneously reject valid sysfs inputs for pwm4 on chips with
a 4-sensor mapping?

Because IT87_PWM_OLD_NUM_TEMP is hardcoded to 3, this restricts valid
sysfs input for pwm4 to channels 3-5. This rejects channels 0-3, which are
completely valid for a chip with a 4-sensor mapping.

> +		if (channel >=3D IT87_PWM_OLD_NUM_TEMP)
> +			return -EINVAL;
> +	}
> +
> +	*map =3D channel;
> +	return 0;
> +}
[ ... ]
> @@ -877,14 +977,22 @@ static void it87_write_value(struct it87_data *data=
, u8 reg, u8 value)
> =20
>  static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
>  {
> -	data->pwm_ctrl[nr] =3D it87_read_value(data, IT87_REG_PWM[nr]);
> +	data->pwm_ctrl[nr] =3D it87_read_value(data, it87_reg_pwm(data, nr));
>  	if (has_newer_autopwm(data)) {
> -		data->pwm_temp_map[nr] =3D data->pwm_ctrl[nr] & 0x03;
> +		data->pwm_temp_map[nr] =3D
> +			pwm_temp_map_get(data, data->pwm_ctrl[nr]);
> +		if (has_new_tempmap(data) &&
> +		    data->pwm_temp_map[nr] >=3D pwm_num_temp_map(data))
> +			data->pwm_temp_map[nr] =3D 0;
>  		data->pwm_duty[nr] =3D it87_read_value(data,
>  						     IT87_REG_PWM_DUTY[nr]);
>  	} else {
>  		if (data->pwm_ctrl[nr] & 0x80)	/* Automatic mode */
> -			data->pwm_temp_map[nr] =3D data->pwm_ctrl[nr] & 0x03;
> +			data->pwm_temp_map[nr] =3D
> +				pwm_temp_map_get(data, data->pwm_ctrl[nr]);
> +		if (has_new_tempmap(data) &&
> +		    data->pwm_temp_map[nr] >=3D pwm_num_temp_map(data))
> +			data->pwm_temp_map[nr] =3D 0;
>  		else				/* Manual mode */
>  			data->pwm_duty[nr] =3D data->pwm_ctrl[nr] & 0x7f;
>  	}

[Severity: High]
Does this dangling else clause unconditionally corrupt the manual PWM duty
cycle for legacy chips?

Because there are no braces around the first "if (data->pwm_ctrl[nr] & 0x80=
)",
the "else /* Manual mode */" binds to the second
"if (has_new_tempmap(data)...)".

For legacy chips, has_new_tempmap(data) is always false, causing the else
block to execute unconditionally and corrupt the pwm_duty cache with the
lowest 7 bits of the temperature mapping register when in automatic mode.

When a user subsequently switches back to manual mode, this corrupted near-=
zero
value is written to the hardware, potentially spinning down the fan and
posing a critical overheating risk.

[ ... ]
> @@ -1617,6 +1725,8 @@ static ssize_t set_pwm_enable(struct device *dev, s=
truct device_attribute *attr,
>  	if (err)
>  		return err;
> =20
> +	it87_update_pwm_ctrl(data, nr);
> +
>  	if (val =3D=3D 0) {
>  		if (nr < 3 && has_fanctl_onoff(data)) {
>  			int tmp;

[Severity: High]
Can this added call to it87_update_pwm_ctrl() clobber deferred user
settings stored in the software cache?

The driver explicitly allows users to configure pwm_temp_map while in manual
mode, deferring the actual hardware write until the fan is switched to
automatic mode. The added unconditional call to it87_update_pwm_ctrl()
refreshes the software cache from hardware registers right before a mode
transition, permanently overwriting and destroying the user's deferred
configuration.

When automatic mode is enabled, the fan will operate on the old temperature
mapping, potentially reacting to the wrong sensor and causing the hardware
to overheat.

[ ... ]
> @@ -3422,7 +3518,10 @@ static void it87_init_device(struct platform_devic=
e *pdev)
>  	 * manual duty cycle.
>  	 */
>  	for (i =3D 0; i < NUM_AUTO_PWM; i++) {
> -		data->pwm_temp_map[i] =3D i;
> +		if (has_new_tempmap(data))
> +			data->pwm_temp_map[i] =3D 0;
> +		else
> +			data->pwm_temp_map[i] =3D i % IT87_PWM_OLD_NUM_TEMP;
>  		data->pwm_duty[i] =3D 0x7f;	/* Full speed */
>  		data->auto_pwm[i][3] =3D 0x7f;	/* Full speed, hard-coded */
>  	}

[Severity: Medium]
Is it intentional that this redefines the default hardware mapping on
boot for chips with 4 temperature maps?

By relying on IT87_PWM_OLD_NUM_TEMP, this breaks the default mapping for
chips like IT8603E and IT8622E which have num_temp_map =3D=3D 4 but lack the
FEAT_NEW_TEMPMAP flag.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829170545.3340=
1-1-jerome.tollet@gmail.com?part=3D2
