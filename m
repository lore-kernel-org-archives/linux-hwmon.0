Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D933438B7;
	Fri, 17 Jul 2026 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784323058; cv=none; b=qYkvS6APhBUAmrXZ0nBBhgfq9xdegNUBLrufh8EGfNRuYaSTdjR6O9puB4vMdHHPcUyPhqdrMbEfDR24w79dbwKy8FM+Kwf7DN9iuUsxJfVSkWvgM3EZw2o84ejaotMGQXaEUEKrn4cnPfRpp1ZBDQhx18DzMV3t4EjUGydd9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784323058; c=relaxed/simple;
	bh=Apk0XKUnwft8E9b5u57uEoG9s6+awfR1wxI+0Kt+jao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oICfJKiltLojthqz6sc66zrdgbzeMZfjVdfkKPys691f30G3bhO570yIep9LQsxHmz45L165sEg5rQS515suZr0+uLX3BjNdrWhXjke/O2PF0HKRLDMvIDkEklOoiID5rdacLPdl9BN/HHnF31fr6GI6DF3ASl3IV4ifpk/raLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzSseL9O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzSseL9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483871F000E9;
	Fri, 17 Jul 2026 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784323056;
	bh=vuQuZ+d1jYQVkow3ISLBbWN37wdEPWdXHn45A8sQF4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MzSseL9OXs0SCnQWfnpdwCmIoZ+WP9UG+ldbHdL2B+b6EJxz2WucXszn9ZmrTNuci
	 a7lwywQoBB164CJDocxsR6x/M9VInhDaniDyWh39L7hmLVu8uApLkY3hEXqXbx6Qds
	 5uAVc6jzKN6NKRQHatoPXHlHkiEjj7IeBlsnnK5L+qUC06Nlj86i0l6PHxF4L0AMFr
	 jpco2tYoCAUEIXC0UYebL6hq0cYN4uCiKseeyPSPUEFSLoljFU2SPlAPt95IsZqmMd
	 G1zPkOOi6ShH12hKkdF1jvMbcLcuvPKRY75ddpr/Orqpm2he1zidEHptpIV8L8RXDu
	 v1crbA77nv1Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] hwmon: (adt7470) Register as a PWM provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-adt7470_thermalzone-v2-5-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-5-a55147958fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 21:17:35 +0000
Message-Id: <20260717211736.483871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Calculating the PWM duty cycle using `DIV_ROUND_CLOSEST_ULL` with =
a 64-bit divisor causes 32-bit truncation and a divide-by-zero kernel panic=
 on 32-bit architectures.
- [High] Early return in PWM apply relies on unsynchronized, zero-initializ=
ed cache values, potentially ignoring the first 0% duty cycle request.
- [Medium] Registering a generic PWM provider directly from a hardware moni=
toring driver violates subsystem layering guidelines.
- [Medium] The driver silently ignores the requested PWM signal polarity, a=
pplying normal polarity even when inverted is requested.

Pre-existing issues:
- [High] The PWM automatic mode mask calculation swaps the masks for PWM ch=
annels 3 and 4, causing writes to one channel to affect the configuration o=
f the other.
--

--- Patch [5]: [PATCH v2 5/6] hwmon: (adt7470) Register as a PWM provider -=
--
commit e11bee28efc81066c4940f5c07591cd6181c6453
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Register as a PWM provider

The patch registers the ADT7470 hardware monitoring driver as a generic PWM
provider, allowing standard Device Tree consumers like "pwm-fan" to use it.
It converts the PWM framework's requested duty cycle to the 0-255 scale
used by the hardware registers. The legacy sysfs interface operates in
parallel and remains unaffected.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index d881609c99aa3..aaae14a421cd8 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

> @@ -864,6 +865,57 @@ static int adt7470_pwm_write(struct device *dev, u32=
 attr, int channel, long val
>  	return err;
>  }
> =20
> +static int adt7470_pwm_apply(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +			     const struct pwm_state *state)
> +{
> +	struct adt7470_data *data =3D pwmchip_get_drvdata(chip);
> +	unsigned int pwm_auto_reg_mask;
> +	int err;
> +	u8 val;
> +
> +	if (pwm->hwpwm % 2)
> +		pwm_auto_reg_mask =3D ADT7470_PWM2_AUTO_MASK;
> +	else
> +		pwm_auto_reg_mask =3D ADT7470_PWM1_AUTO_MASK;

[Severity: High]
This is a pre-existing issue, but does this logic incorrectly swap the masks
for PWM channels 3 and 4?

The logic uses hwpwm % 2 to select between ADT7470_PWM1_AUTO_MASK and
ADT7470_PWM2_AUTO_MASK. For channel 3 (hwpwm =3D 2) and channel 4 (hwpwm =
=3D 3),
does this inadvertently select 0x80 for PWM3 and 0x40 for PWM4?

If the datasheet and macro definitions dictate 0x40 for PWM3 and 0x80 for
PWM4, could writing to one of these channels corrupt the configuration
of the other?

This issue seems to be copied from the preexisting adt7470_pwm_write() sysfs
handler.

> +
> +	if (state->enabled && state->period > 0)

[Severity: Medium]
Does this apply callback silently ignore requested PWM polarities?

If a consumer specifies PWM_POLARITY_INVERSED in the PWM state, the hardware
only supports normal polarity.

Since there is no check to see if state->polarity !=3D PWM_POLARITY_NORMAL,
will this cause the driver to quietly apply normal polarity instead of
rejecting the unsupported request?

> +		val =3D DIV_ROUND_CLOSEST_ULL(state->duty_cycle * 255, state->period);

[Severity: High]
Does this calculation cause a divide-by-zero on 32-bit architectures?

When a consumer requests a PWM period that is a multiple of 2^32 ns,
do_div() implicitly casts the divisor to a 32-bit integer on 32-bit systems,
meaning a value like 1ULL << 32 becomes 0.

Since the truncation happens during the division after the state->period > 0
check, can this lead to a kernel panic?

> +	else
> +		val =3D 0;
> +
> +	mutex_lock(&data->lock);
> +
> +	if (data->pwm[pwm->hwpwm] =3D=3D val &&
> +	    data->pwm_automatic[pwm->hwpwm] =3D=3D 0) {
> +		mutex_unlock(&data->lock);
> +		return 0;
> +	}

[Severity: High]
Can this early return falsely ignore the first 0% duty cycle request?

Because the driver data is allocated with devm_kzalloc(), data->pwm is
zero-initialized.

If a consumer requests a 0% duty cycle (val =3D 0) before the
adt7470_update_thread has completed its first hardware state synchronizatio=
n,
will this condition pass and return early without sending the 0% duty cycle
to the hardware?

[ ... ]

> @@ -1299,6 +1351,21 @@ static int adt7470_probe(struct i2c_client *client)
>  	if (IS_ERR(hwmon_dev))
>  		return PTR_ERR(hwmon_dev);
> =20
> +	if (IS_REACHABLE(CONFIG_PWM)) {
> +		struct pwm_chip *chip;
> +
> +		chip =3D devm_pwmchip_alloc(dev, ADT7470_PWM_COUNT, 0);
> +		if (IS_ERR(chip))
> +			return PTR_ERR(chip);
> +
> +		chip->ops =3D &adt7470_pwm_ops;
> +		pwmchip_set_drvdata(chip, data);
> +
> +		err =3D devm_pwmchip_add(dev, chip);
> +		if (err)
> +			return dev_warn_probe(dev, err, "failed to register PWM chip\n");
> +	}

[Severity: Medium]
Does this violate the hardware monitoring subsystem guidelines?

The guidelines indicate that secondary functionalities, such as PWM or GPIO,
should be implemented as auxiliary devices rather than registering directly
from drivers/hwmon/.

By using devm_pwmchip_alloc() and devm_pwmchip_add() directly in the hwmon
probe function, does this bypass the separation into an auxiliary device and
cross-subsystem review?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_th=
ermalzone-v2-0-a55147958fad@gmail.com?part=3D5
