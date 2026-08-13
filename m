Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5AD43D4E0;
	Thu, 13 Aug 2026 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658124; cv=none; b=Tn7ej7bnZ+QmP8TG6G90DI8XHv9JqCVNnrfXN2G5VjTPKqlaHLE/qhWcXsoH8RkPQNcSN7dhNKhi4Kzg+z6gY6zbvUFMJXIpyekspPbEs7yDUU8G21CBoTv+5z4wupKK74NkLTt7pv7Qgbvxv7i+0Ks/dTPteorpR78I7Id+7pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658124; c=relaxed/simple;
	bh=TtFs51I5I7rIb6XKWy6/962FHgxltW+z2FlM/2/OCno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R8DvYgF4PfkcwC+w1ZPGeO9QYCXmXeLsMtGpRw2nkkLQkdvSRjOmRdhFMSg9ZL6wNPp2qYtDt79FT6DS/qItnueHG5r6UzBurArU5dchoQ+yG0LSwkrL4soFAf8X1hk7vSb5e3WViWwB87jSEfF06U+qnpxlFS5oGpSoXZQsiYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIwXas/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIwXas/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81C71F000E9;
	Thu, 13 Aug 2026 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786658123;
	bh=k1VoxBDolacLupToiSemv+XxDYo3RcqTpbXRm9oiC9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OIwXas/YZxq0ZOd04x5a0fH64iNcfmyLnX7RmGnEVJ4y/P009JhuG9hH60uQZc5RM
	 AXEbdxTTFeIpdyWy/ns4RHNx58aPjM0GGs22j8mvGDmiZk4EA/+L/dQSIRsoy/+PZP
	 snbb3D145gufndQsNfext57/0sPxiggD55vB4Fq3/f83jXPD2Oqxxak5+lZ8CYuiRc
	 N6oSM8ga8fhpVFLutwxkh9yqMFmXGFeUa5on/Ne9GW78rt+eeeyFeKw3TMx9OX6m63
	 lmTvcOLK6hqBk4e+hXyFLxvrg+7IRw06aGlzDE8xjaOYTGFiWZr2HmUzjpzKwrph3+
	 dUe8Hj0J1lS8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260316140514.1406588-6-o.rempel@pengutronix.de>
References: <20260316140514.1406588-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:55:22 +0000
Message-Id: <20260813215522.C81C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Output emulation and open-drain semantics are broken for Programma=
ble (SP) pins due to logic flaws in `mc33978_set()` and `mc33978_set_multip=
le()`.
- [High] `mc33978_set_multiple()` can return an uninitialized variable and =
silently masks regmap error codes.
- [Medium] Missing `mpc->lock` acquisition in `mc33978_pinconf_get()` and `=
mc33978_pinconf_set()` breaks hardware sequence atomicity.
- [Medium] Silent omission of SPI read failures in `mc33978_get()` leads to=
 incorrect physical state interpretation.
- [Medium] Unconditional invocation of optional parent irq_chip callbacks `=
irq_bus_lock` and `irq_bus_sync_unlock`.
--

--- Patch [5]: [PATCH v5 5/7] pinctrl: add NXP MC33978/MC34978 pinctrl driv=
er ---
commit 98645888889b3328cc6079ef5439da9e7d2a7837
Author: David Jander <david@protonic.nl>

pinctrl: add NXP MC33978/MC34978 pinctrl driver

Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple
Switch Detection Interface (MSDI) devices.

> diff --git a/drivers/pinctrl/pinctrl-mc33978.c b/drivers/pinctrl/pinctrl-=
mc33978.c
> new file mode 100644
> index 0000000000000..31065d6333173
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-mc33978.c

[ ... ]

> +static int mc33978_pinconf_get(struct pinctrl_dev *pctldev, unsigned int=
 pin,
> +			       unsigned long *config)
> +{
> +	struct mc33978_pinctrl *mpc =3D pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param =3D pinconf_to_config_param(*config);
> +	unsigned int data, status;
> +	int ret;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		ret =3D mc33978_get_pull(mpc, pin, &data);

[Severity: Medium]
The mpc->lock is documented as protecting atomic reads and multi-register
hardware sequences. Does the lack of this lock in mc33978_pinconf_get() and
mc33978_pinconf_set() expose the hardware state reads and updates to race
conditions with concurrent GPIO operations?

[ ... ]

> +static int mc33978_get(struct gpio_chip *chip, unsigned int offset)
> +{

[ ... ]

> +	/* Determine current topology for SP pins */
> +	if (mc33978_is_sp(offset)) {
> +		int config_reg;
> +
> +		ret =3D mc33978_read(mpc, MC33978_REG_CONFIG, &config_reg);
> +		if (ret =3D=3D 0) {
> +			/* CONFIG: 0 =3D Switch-to-Ground (PU), 1 =3D Switch-to-Battery (PD) =
*/
> +			if (config_reg & MC33978_PINMASK(offset))
> +				is_switch_to_ground =3D false;
> +		}
> +	}

[Severity: Medium]
If the SPI read in mc33978_read() fails, the code ignores the error code in
ret and proceeds with is_switch_to_ground remaining true.=20

Should the error code in ret be propagated back to the caller instead of
falling back to a default topology guess that might misinterpret the physic=
al
state?

[ ... ]

> +static int mc33978_set(struct gpio_chip *chip, unsigned int offset, int =
value)
> +{
> +	struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +	int pull;
> +	int ret;
> +
> +	/*
> +	 * We emulate open-drain/-source outputs by routing or isolating the
> +	 * active wetting current sources.
> +	 * To drive the line, we apply the current source.
> +	 * To turn the line OFF (achieve High-Impedance), we MUST use the
> +	 * hardware TRI_SP / TRI_SG tri-state registers to physically isolate
> +	 * it.
> +	 */
> +	if (mc33978_is_sp(offset)) {
> +		pull =3D value ? MC33978_PU : MC33978_PD;
> +		value =3D 1;
> +	} else {
> +		pull =3D MC33978_PU;
> +	}

[Severity: High]
For SP pins, value is unconditionally forced to 1. Will this prevent the=20
turn OFF branch (value =3D=3D 0) below from ever being executed for these p=
ins?

> +
> +	guard(mutex)(&mpc->lock);
> +
> +	/*
> +	 * Break-before-make sequencing to prevent hardware glitches (spikes).
> +	 * Since SPI transfers take time, writing the pull and tri-state
> +	 * registers in the wrong order causes a brief moment where current
> +	 * flows to the pin before it is masked, causing a visible LED flash.
> +	 */
> +	if (value) {
> +		/*
> +		 * Turn ON: Configure the underlying current source (pull) first,
> +		 * then route it to the pin by disabling tri-state.
> +		 */
> +		ret =3D mc33978_set_pull(mpc, offset, pull);

[ ... ]

> +static int mc33978_set_multiple(struct gpio_chip *chip,
> +				unsigned long *mask, unsigned long *bits)
> +{
> +	unsigned int sgmask =3D (*mask & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
> +	unsigned int sgbits =3D (*bits & MC33978_SG_MASK) >> MC33978_SG_SHIFT;
> +	unsigned int spmask =3D (*mask & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
> +	unsigned int spbits =3D (*bits & MC33978_SP_MASK) >> MC33978_SP_SHIFT;
> +	struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +	int ret;
> +
> +	guard(mutex)(&mpc->lock);
> +	if (spmask)
> +		ret =3D mc33978_update_bits(mpc, MC33978_REG_TRI_SP, spmask,
> +					  ~spbits);

[Severity: High]
Does this direct update to MC33978_REG_TRI_SP contradict the expected state
setup in mc33978_set(), since the required pull direction is not being
configured here?

Also, if both spmask and sgmask evaluate to zero, will this function return
an uninitialized ret?

If both spmask and sgmask are non-zero, will the second call to
mc33978_update_bits() silently overwrite an error code returned by the first
call?

> +	if (sgmask)
> +		ret =3D mc33978_update_bits(mpc, MC33978_REG_TRI_SG, sgmask,
> +					  ~sgbits);
> +
> +	return ret;
> +}

[ ... ]

> +static void mc33978_gpio_irq_bus_lock(struct irq_data *data)
> +{
> +	struct irq_data *parent =3D data->parent_data;
> +
> +	parent->chip->irq_bus_lock(parent);
> +}

[Severity: Medium]
Since irq_bus_lock is an optional callback in struct irq_chip, is it possib=
le
for parent->chip->irq_bus_lock to be NULL here?

Could this cause a NULL pointer dereference panic if the parent domain does
not implement it?

> +
> +static void mc33978_gpio_irq_bus_sync_unlock(struct irq_data *data)
> +{
> +	struct irq_data *parent =3D data->parent_data;
> +
> +	parent->chip->irq_bus_sync_unlock(parent);
> +}

[Severity: Medium]
Similarly, could parent->chip->irq_bus_sync_unlock be NULL and lead to a=20
NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260316140514.1406=
588-1-o.rempel@pengutronix.de?part=3D5
