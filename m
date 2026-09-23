Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE624DD17;
	Wed, 23 Sep 2026 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169467; cv=none; b=LUFopCSqpwb5xAKTjVhx1l+fnrKn7hovDM6LXvleSrQ4tGBNGrSz2BwdnNE4ILAAKt6jRo7OzwoN4ZLt4o0l/fwn0aHYReOuyesmlEcWM7WpxU3acI3cK3jj8wrRxusMfqWt1x+dJCMPZg3KljJ231P5CwxCKTk3aiqbPHkOboQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169467; c=relaxed/simple;
	bh=6aaMRdMjjeHzZzdfQplfNiMDs0VffMgfyZRgxYbbLZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X6pKomB/Vh0u8KlC7LlGBwn01Hnvfxh+4+CBkxZ6rbgjxwpMSzB0CTdaCBMn+R1BfuaDSC58MB8RpuWmzAakCtvHCJMi4LfKtx1tISpJTWUq8XPARsfAFecgUHAK7WdPaGHsAThbFvJBGNYp177JY26yzsaxR6s1YVAS5st64So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhGqT9ta; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhGqT9ta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638581F000FF;
	Wed, 23 Sep 2026 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790169465;
	bh=ezxaDYByRjRZtwWkzUIEzEsU5AE7aoFcYGqtAKkTqts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VhGqT9taJpBGI72NINWcw6TnYwyHT44rJkRm5jHtb9ylkylXnWEJI4ayguERAN7uZ
	 ekdSn+UD4HRAPjeQyfCPzhZ9iYicdTlVDLxnIcaUV48gfaahZOZyrdvIcIuVu/VHrc
	 YTx3qIUtw3bzc4q6wPNoICdir2/vixvtE4Ry+Ht4XLpMWYX4uDPuUQlZVPnjUHj9vr
	 YXOjVllE/KBwFvWTHM9AVATMBY1rgz6b4DwKxwk2m6S05pcjPlAo46rmYSIaPthVxv
	 mYXPWWJpJJdHxF2FrLquHOenEM0TNisVeiODOYcpG472sKTDATAizRF3Hmu/fbXRHm
	 ZMI9Hz1L3tDkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: (starfive-pwm-fan) Add PWM fan driver for
 StarFive JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923130624.239499-3-changhuang.liang@starfivetech.com>
References: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
 <20260923130624.239499-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 13:17:44 +0000
Message-Id: <20260923131745.638581F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] hwmon: starfive: fan tachometer register state is lost on system s=
uspend
- [Medium] hwmon: starfive: aborted teardown loop in pwm_disable_all leaks =
hardware state
--

commit ba72917646ababbe1ce560dd96b1e73eb3c6b2f3
Author: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: hwmon: (starfive-pwm-fan) Add PWM fan driver for StarFive JHB100

This commit adds a new PWM fan controller driver for the StarFive JHB100 So=
C.
It allows configuring fan speeds using up to 8 external PWM channels and
provides RPM readings and alarms via a 16-channel hardware tachometer block.

> diff --git a/drivers/hwmon/starfive-pwm-fan.c b/drivers/hwmon/starfive-pw=
m-fan.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/starfive-pwm-fan.c

[ ... ]

> +static int starfive_pwm_fan_pwm_disable_all(struct starfive_pwm_fan_data=
 *priv)
> +{
> +	struct pwm_state state;
> +	int i, ret;
> +
> +	guard(mutex)(&priv->pwm_lock);
> +
> +	for (i =3D 0; i < STARFIVE_FAN_MAX; i++) {
> +		struct starfive_pwm_fan *fan =3D &priv->fans[i];
> +
> +		if (!fan->pwm || !fan->pwm_state.enabled)
> +			continue;
> +
> +		state =3D fan->pwm_state;
> +		state.duty_cycle =3D 0;
> +		state.enabled =3D false;
> +
> +		ret =3D pwm_apply_might_sleep(fan->pwm, &state);
> +		if (ret)
> +			return ret;

[Severity: Medium]
If pwm_apply_might_sleep() fails for a fan channel (for example, due to an
underlying PWM controller communication error), this early return abruptly
breaks the teardown loop.

Could this leave active PWM channels and fans running during driver removal
or system suspend? Because a failure in one PWM channel shouldn't necessari=
ly
prevent the teardown of the remaining independent channels, would it be saf=
er
to log the error and continue disabling the others?

> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int starfive_pwm_fan_resume(struct device *dev)
> +{
> +	struct starfive_pwm_fan_data *priv =3D dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	guard(mutex)(&priv->pwm_lock);
> +
> +	for (i =3D 0; i < STARFIVE_FAN_MAX; i++) {
> +		struct starfive_pwm_fan *fan =3D &priv->fans[i];
> +
> +		if (!fan->pwm)
> +			continue;
> +
> +		ret =3D pwm_apply_might_sleep(fan->pwm, &fan->pwm_state);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
This resume handler restores the external PWM state, but does it miss
restoring the internal tachometer registers (measure time, channel enables,
and sysfs thresholds)?

If the peripheral's power domain is disabled during sleep, the hardware
configuration will reset to power-on defaults. Could this cause fan
monitoring and alarms to silently fail after a system resume? It appears
the driver does not cache the user-configured threshold values written via
sysfs, making it impossible to restore them upon resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923130624.2394=
99-1-changhuang.liang@starfivetech.com?part=3D2
