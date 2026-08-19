Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93763FE352;
	Wed, 19 Aug 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787155128; cv=none; b=l3FkfzRuoGiGNgLBcr1gOj8q0YMBXjJdDLtLpOYnhZUXgEnfBeT3Sk/fCsGUWkSO55hnKknCxGTCsapiC8GLxPPGCfJJrOaeEMxG8VK6ooO0QDmB+Qos+y2Bmr1jQh/MNWNwgP8iJFHK4tHLNCjYGjJdCytY+3bFWWtamd1lAwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787155128; c=relaxed/simple;
	bh=MOPy4YOWIFmvvKDhQWXpI3x/L3JzaQYynAajg4UyhlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r/czCtg1snIlKPcxyqGJhceHviKzMMfFp5/qrlZpKMI0GkQxDQSs1IPOhL34t0+qsH0OqEpYuxD7enB4+PYEFGY4JbS6/UoaGdsxqF1fCybk0KLC2NO7DTVHvAIfyjKH56bKGJAJvqe5+sSqi/sSe6uvSfnSWLWjIKMem5wCk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP/SzzcG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP/SzzcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FCC1F000E9;
	Wed, 19 Aug 2026 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787155126;
	bh=00VrfVpxIfAkhMMgbwvFS//t/kfM28jmwkj4sOODKO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WP/SzzcGNWLxcu5T3lO24lYQbDeG/vKj4lKUEMcoFToAxBz6y9SpSkOG0CJYm4iMm
	 mlm1JrGBBOzdpts9re8+ZS/xaNyEeNxETG4nvPoGG71FwxODkDOCYCQbCuiu0RXI3f
	 wOOephtdfOFepw7JWS6q/WNr3V+Hadx+9bWJBnxpZZU0gcY2UO7Huv0h8SSLUcu6Rd
	 G4VUG28wuNsALvS8asjXZCgFLjB1gGgjwWPYGyTLvYKiWj4jo+4pplyHZnekHwMejw
	 N3ZXAmemiqU+Q1fkeSPKXyHwdAPFAkAEtwYsBHBYhdmQU6mHYYVyOq4Gx28mss0hRp
	 +/B5kQFlTT75g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver
 for StarFive JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260819091601.41077-3-changhuang.liang@starfivetech.com>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 15:58:46 +0000
Message-Id: <20260819155846.A3FCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Alarm attributes violate the hwmon ABI (sticky semantics) and ho=
ld a global mutex across a 200ms sleep, forcing strict serialization and ma=
ssive latency.
--

--- Patch [2]: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach drive=
r for StarFive JHB100 ---
commit f832cfa14cd6c4c786efa0a34afc865eca6dcf71
Author: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100

This commit adds a fan tachometer driver for the StarFive JHB100 SoC. It
supports up to 16 independent fan tachometer inputs and reports fan speed,
stall, and low-speed alarms through the hwmon sysfs interface.

> diff --git a/drivers/hwmon/starfive-fan-tach.c b/drivers/hwmon/starfive-f=
an-tach.c
> new file mode 100644
> index 0000000000000..1e6399db424dc
> --- /dev/null
> +++ b/drivers/hwmon/starfive-fan-tach.c

[ ... ]

> +static int starfive_fan_tach_hwmon_read(struct device *dev,
> +					enum hwmon_sensor_types type, u32 attr,
> +					int channel, long *val)
> +{
> +	struct starfive_fan_tach_data *priv =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	switch (attr) {
> +	case hwmon_fan_fault:
> +		scoped_guard(mutex, &priv->lock) {
> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> +				writel(STARFIVE_FAN_TACH_STALL_INT(channel),
> +				       priv->regs + STARFIVE_FAN_TACH_STATUS);
> +				/* clear fan_stall first */
> +				priv->fan_stall[channel] =3D 0;
> +				reinit_completion(&priv->comp_stall[channel]);
> +				priv->armed_stall |=3D BIT(channel);
> +			}
> +
> +			starfive_fan_tach_ch_stall_unmask(priv, channel, true);
> +
> +			/* Waiting for hardware to measure */
> +			wait_for_completion_timeout(&priv->comp_stall[channel],
> +						    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);

[Severity: Medium]
Does reading the fault attribute violate the hwmon ABI by blocking to poll =
the
hardware instead of returning instantaneous sticky status?

Also, because wait_for_completion_timeout() is called inside
scoped_guard(mutex, &priv->lock), doesn't this hold the global mutex across=
 a
200ms sleep?

If a user tool (like sensors) sequentially reads the alarms for all 16 chan=
nels,
could this stall the reader for over 6 seconds and block all other concurre=
nt
reads/writes to this device?

[ ... ]

> +	case hwmon_fan_min_alarm:
> +		scoped_guard(mutex, &priv->lock) {
> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> +				writel(STARFIVE_FAN_TACH_SLOW_INT(channel),
> +				       priv->regs + STARFIVE_FAN_TACH_STATUS);
> +				/* clear fan_slow first */
> +				priv->fan_slow[channel] =3D 0;
> +				reinit_completion(&priv->comp_slow[channel]);
> +				priv->armed_slow |=3D BIT(channel);
> +			}
> +
> +			starfive_fan_tach_ch_slow_unmask(priv, channel, true);
> +
> +			/* Waiting for hardware to measure */
> +			wait_for_completion_timeout(&priv->comp_slow[channel],
> +						    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);

[Severity: Medium]
Similar to the fault attribute above, does reading the min_alarm attribute
violate the hwmon ABI by blocking instead of returning a sticky status?

Does holding the global mutex during this sleep similarly risk blocking
concurrent device accesses and causing long stalls when reading multiple
channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819091601.4107=
7-1-changhuang.liang@starfivetech.com?part=3D2
