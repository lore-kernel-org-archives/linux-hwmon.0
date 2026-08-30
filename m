Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A1A3B47C6
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094818; cv=none; b=hd3+rkxKuq1EpyPwrsGTmkeQ0gCN6yOor/trJeWEpF/fKYksPODeyDomdiA7+M8cPYu9x/jAoP2MzOwygKjhEj7PTzgvS7ulfDAwtx0HfOZJ6HQZkBCBeXOjag5n9Ezi+nzMTiOtUmIM2BHHltSzHI3YUZxWdtPPCVM7tIDRsr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094818; c=relaxed/simple;
	bh=y+59RexGM8lBLXBNCyXsXT1RlrZ7adHw1tHV/PClCeY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nChTl+33vRys8b5/HRMio0QUDJkILEPLgjUeNj20MCB5d/LJncNAkfzCwvH87j8dHACO7r38fB8BM/iXm3m+SEJSVU7r80D9G1zoXZ0V25Ncur3o8auW5I6qbG2AxMzSL2/xgNz5FHHmljludGtf/+nM4BCh2rnGSXYuZhn+2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TW1VaXC5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TW1VaXC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE9C1F000E9;
	Sun, 30 Aug 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788094817;
	bh=Qxs/qEBHYivdvibUVMh5KYEgSewdykpleXC8erkh6UA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TW1VaXC5rKZZF4xWdizCfkjQniEJ1qCyv/nqdUH3Zu5z9pYaCLTQ3R126ZVdS0p0r
	 gQNticzjVELub4bl+FkYNVCs3knJDLG7WMPwmiSVWImaz2UJbDFqk57AY4tw93vVYn
	 wHyVGqihPQYbKlLr5uDA4ar6LFLrr9CaTURUgMVYcZsY+RUukaW1KxDz2NEPOdirza
	 aIzYTxs9zmtvMAv1R5Y9X5u20JDlS5doVjlGOtYUTiCifcCnLqKf7hhEXm5vZ8ZdA2
	 E7YZ4RXdvTi3kUmxg6+ouMvNQY9086snD2L8fH64JrsC/S2+V/uQ/vEuh3x7Dxx6hz
	 t6UywpUl6+G1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: aspeed-pwm-tacho: propagate reset deassert
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260830125044.97718-1-pengpeng@iscas.ac.cn>
References: <20260830125044.97718-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 13:00:16 +0000
Message-Id: <20260830130016.EAE9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent writes from sysfs and the thermal subsystem can cause d=
ata races and corrupted hardware state.
- [High] Potential division by zero in `aspeed_get_fan_tach_ch_rpm()` if cl=
ock frequency is low or missing.
- [High] The loop counter in `aspeed_create_fan_tach_channel` is an 8-bit i=
nteger, which can overflow and cause an infinite loop.
- [High] Probe deferral is broken because the driver incorrectly masks `-EP=
ROBE_DEFER` when fetching the clock.
--

commit 23ab079c9c9897273758de82bd4212ec4f964294
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: hwmon: aspeed-pwm-tacho: propagate reset deassert errors

aspeed_pwm_tacho_probe() installs its reset cleanup action and configures t=
he
controller after an unchecked reset deassertion. Stop probing when the reset
controller rejects the transition, before the hwmon device becomes visible.

> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-=
tacho.c
> index 1c5945d4ba377..bfce589c3fb1f 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -934,7 +934,9 @@ static int aspeed_pwm_tacho_probe(struct platform_dev=
ice *pdev)
>  			"missing or invalid reset controller device tree entry");
>  		return PTR_ERR(priv->rst);
>  	}
> -	reset_control_deassert(priv->rst);
> +	ret =3D reset_control_deassert(priv->rst);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D devm_add_action_or_reset(dev, aspeed_pwm_tacho_remove, priv);
>  	if (ret)

[Severity: High]
This is a pre-existing issue, but is probe deferral broken here? Shortly
after this reset deassert, the driver fetches a clock:

	clk =3D devm_clk_get(dev, NULL);
	if (IS_ERR(clk))
		return -ENODEV;

If devm_clk_get() returns -EPROBE_DEFER, returning -ENODEV will permanently
fail the probe instead of allowing it to be retried later.

[Severity: High]
This is a pre-existing issue, but can concurrent writes corrupt hardware st=
ate?
The driver registers with devm_hwmon_device_register_with_groups() without
using hwmon_lock() to serialize operations. A user writing to the PWM sysfs
attribute calls:

pwm_store() {
	...
	priv->pwm_port_fan_ctrl[index] =3D fan_ctrl;
	aspeed_set_pwm_port_fan_ctrl(priv, index, fan_ctrl);
	...
}

While the thermal subsystem can simultaneously update the cooling state:

aspeed_pwm_cz_set_cur_state() {
	...
	cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =3D
					cdev->cooling_levels[cdev->cur_state];
	aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
				     cdev->cooling_levels[cdev->cur_state]);
	...
}

Will interleaving these multi-step non-atomic regmap writes in
aspeed_set_pwm_port_fan_ctrl() cause inconsistent hardware behavior?

[Severity: High]
This is a pre-existing issue, but could this result in a division by zero
panic? When initializing, priv->clk_freq is populated from clk_get_rate(clk=
).
If the rate evaluates to a value smaller than the divisor product, this
division truncates to 0:

aspeed_get_fan_tach_ch_measure_period() {
	...
	return clk / (clk_unit * div_h * div_l * tacho_div * tacho_unit);
}

The result is then used in a subsequent division:

aspeed_get_fan_tach_ch_rpm() {
	...
	msec =3D (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
	...
}

Would a low or misconfigured clock frequency allow an unprivileged local us=
er
reading the fanX_input sysfs file to crash the system?

[Severity: High]
This is a pre-existing issue, but is there a potential infinite loop here?

aspeed_create_fan_tach_channel() {
	...
	u8 val, index;

	for (val =3D 0; val < count; val++) {
	...
}

If a malformed device tree specifies 256 or more elements for count, will
the 8-bit loop counter val overflow and remain less than count, causing
the kernel to hang permanently during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830125044.9771=
8-1-pengpeng@iscas.ac.cn?part=3D1
