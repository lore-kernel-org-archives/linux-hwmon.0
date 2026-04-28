Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B352609E3
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406745; cv=none; b=vABxsl/BuotTuHJRiElM6f2BmtVhk9ldUynzJuOzAtUXIKdjATmdjsaJE+zupPXAnEDVXKN0JGRUksmjUraCEL5TfgEzxbd0Rv6v5cg5lzZxODLAiVt1Khu64yaWIHz49gVy+4DeXyO+uTSLS4TIaR+InafgRXmw9XkHg3nnbc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406745; c=relaxed/simple;
	bh=WmWgoPIV5K1TAmpFuyXAZKZCmwJTBaVDZA3XQm3/HEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rAE7NyBzuBfxkOoHkej/X8AUHUChnKl0bjLAuPFrjvqQuFXxEbrS83Awcli/ReYrwCo3hrGqQFvIdq5r7ghuzhY8tJe8FUxxRzH1+a3uaXZODxvukf2pDwktmC3EfjH3W7Woss8AwtynmDZyT8TmBn7mftvJXqMBezCrS+wGSDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IA39Ur9i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IA39Ur9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A121EC2BCAF;
	Tue, 28 Apr 2026 20:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777406745;
	bh=WmWgoPIV5K1TAmpFuyXAZKZCmwJTBaVDZA3XQm3/HEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IA39Ur9iNfAego86P/FQ1IghgdykRhNTW5/XEIuOL65axTgOBroz8s5ACAJOfiIgy
	 MhwIvZ8x1baCNFobEsv30HZfdPpwRztI+RhUIRiKiuALpaSnpN7tVXrkVw+Rfuqvn7
	 DehOR3V25V8tt4re22B2K30vVWo6Bza1E8OtfBenHma73iJiQnI41I9M/3UwNvtd3L
	 vAUuMUyD2imkG1yYEW7Ekjh+RZx5b6J3B9xzk0nzh4ecH8NpQbL+FAaYWQmIMbYhOo
	 3kktsg0ElsbjJ6aLsg+HRHcI2dIBDJhNmPsjTHM7iw8+NLBrhUj328inYWvDLY/U0o
	 KEnyFg1S+wKGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: Add fan tach driver for StarFive
Reply-To: sashiko@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260428082337.743546-3-changhuang.liang@starfivetech.com>
References: <20260428082337.743546-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Apr 2026 20:05:44 +0000
Message-Id: <20260428200544.A121EC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Sysfs read operations for fault and alarm attributes block for 1 s=
econd during normal operation.
- [High] Interrupt handler is registered before the device clock is enabled=
, risking fatal bus faults.
- [High] Probe returns success (0) on failure paths, bypassing hwmon regist=
ration but leaving resources active.
- [High] Copy-paste error in `hwmon_fan_min_alarm` waits on the wrong compl=
etion structure, guaranteeing a timeout.
- [High] Race condition when enabling interrupts causes missed fault/alarm =
events.
- [High] IRQ handler processes uninitialized completions for unused channel=
s, leading to a kernel panic.
- [High] Unvalidated device tree properties lead to out-of-bounds array acc=
ess.
- [Medium] Hardware read errors are leaked to user space as valid sensor va=
lues.
- [Medium] Integer overflow in RPM conversion calculations yields incorrect=
 readings.
--

commit 48298341a9b8797b12cfca7ded254542d53095fd
Author: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: hwmon: Add fan tach driver for StarFive

This commit adds the fan tach driver for the StarFive JHB100 SoC.

> diff --git a/drivers/hwmon/starfive-fan-tach.c b/drivers/hwmon/starfive-f=
an-tach.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/starfive-fan-tach.c

[ ... ]

> +static int starfive_fan_tach_rpm_to_val(struct starfive_fan_tach_data *p=
riv, u32 rpm)
> +{
> +	u64 tach_val;
> +
> +	rpm *=3D STARFIVE_FAN_DEFAULT_PULSE_PR;

Does this multiplication overflow a 32-bit integer before assignment? Casti=
ng
rpm to u64 before multiplying would prevent truncation.

> +	tach_val =3D rpm / STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME;
> +
> +	return (int)tach_val;
> +}
> +
> +static int starfive_fan_tach_val_to_rpm(struct starfive_fan_tach_data *p=
riv, u32 tach_val)
> +{
> +	u64 rpm;
> +
> +	rpm =3D tach_val * STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME;

Can this code overflow the 32-bit integer when multiplying tach_val by 120?
Since tach_val can be up to 31 bits, casting to u64 beforehand would
ensure correct calculations.

> +
> +	do_div(rpm, STARFIVE_FAN_DEFAULT_PULSE_PR);
> +
> +	return (int)rpm;
> +}

[ ... ]

> +static int starfive_fan_tach_hwmon_read(struct device *dev,
> +					enum hwmon_sensor_types type, u32 attr,
> +					int channel, long *val)
> +{
> +	struct starfive_fan_tach_data *priv =3D dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_fan_fault:
> +		starfive_fan_tach_ch_stall_unmask(priv, channel, true);
> +		/* clear fan_stall first */
> +		priv->fan_stall[channel] =3D 0;
> +		reinit_completion(&priv->comp_stall[channel]);

Is there a race condition here that can cause a missed fault event? Unmaski=
ng
the hardware interrupt before clearing priv->fan_stall[] and calling
reinit_completion() might allow the interrupt to fire instantly.=20

If the ISR sets the flag and completes the completion, the read thread will=
=20
subsequently overwrite the flag and reinitialize the completion, erasing the
event and causing a timeout.

> +		wait_for_completion_timeout(&priv->comp_stall[channel],
> +					    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);

If the fan is operating normally, will this read operation unconditionally =
block
for the entire 1-second timeout duration? Since the fault interrupt will ne=
ver
fire during normal operation, and the hwmon core serializes sysfs accesses
with a device-wide lock, this might cause user-space tools to hang.

> +		*val =3D priv->fan_stall[channel];
> +		starfive_fan_tach_ch_stall_unmask(priv, channel, false);
> +		break;
> +	case hwmon_fan_input:
> +		*val =3D starfive_fan_tach_get_rpm(priv, channel);

Does this code leak hardware read errors to user space as valid sensor valu=
es?
If starfive_fan_tach_get_rpm() returns a negative error code like -ETIMEDOU=
T,
it is directly assigned to *val while returning 0 for success.

> +		break;
> +	case hwmon_fan_min:
> +		*val =3D starfive_fan_tach_get_rpm_threshold(priv, channel);
> +		break;
> +	case hwmon_fan_min_alarm:
> +		starfive_fan_tach_ch_slow_unmask(priv, channel, true);
> +		/* clear fan_slow first */
> +		priv->fan_slow[channel] =3D 0;
> +		reinit_completion(&priv->comp_slow[channel]);
> +		wait_for_completion_timeout(&priv->comp_stall[channel],
> +					    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);

Should this wait on priv->comp_slow[channel] instead? Waiting on comp_stall
after reinitializing comp_slow guarantees a timeout, as a valid slow alarm
interrupt will never wake up the stall completion.

> +		*val =3D priv->fan_slow[channel];
> +		starfive_fan_tach_ch_slow_unmask(priv, channel, false);
> +		break;

[ ... ]

> +static void starfive_fan_tach_present(struct starfive_fan_tach_data *pri=
v, u8 *tach_ch,
> +				      int count)
> +{
> +	u8 ch, index;
> +
> +	for (index =3D 0; index < count; index++) {
> +		ch =3D tach_ch[index];
> +		priv->tach_present[ch] =3D true;

Are we checking for out-of-bounds array access here? Since the arrays
have a fixed size of 16 (STARFIVE_FAN_TACH_CH), a device tree providing
a channel number >=3D 16 will write outside the bounds of tach_present,
comp_stall, and comp_slow.

[ ... ]

> +static irqreturn_t starfive_fan_tach_irq(int irq, void *dev_id)
> +{
> +	struct starfive_fan_tach_data *priv =3D dev_id;
> +	u32 fan_status;
> +	int i;
> +
> +	fan_status =3D readl(priv->regs + STARFIVE_FAN_TACH_STATUS);
> +
> +	for (i =3D 0; i < STARFIVE_FAN_TACH_CH; i++) {
> +		if (fan_status & STARFIVE_FAN_TACH_STALL_INT(i)) {
> +			priv->fan_stall[i] =3D 1;
> +			complete(&priv->comp_stall[i]);

Can this code process uninitialized completions for unused channels? If the
hardware asserts a bit for an unconfigured channel, calling complete() on an
uninitialized waitqueue lock can result in a kernel panic. Verifying
priv->tach_present[i] before processing would prevent this.

> +		}
> +
> +		if (fan_status & STARFIVE_FAN_TACH_SLOW_INT(i)) {
> +			priv->fan_slow[i] =3D 1;
> +			complete(&priv->comp_slow[i]);
> +		}
> +	}

[ ... ]

> +static int starfive_fan_tach_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev, *dev =3D &pdev->dev;
> +	struct starfive_fan_tach_data *priv;
> +	struct reset_control *rst;
> +	struct clk *clk;
> +	int irq;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +
> +	priv->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->regs))
> +		return dev_err_probe(dev, PTR_ERR(priv->regs),
> +				     "Unable to map IO resources\n");
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
> +
> +	ret =3D devm_request_irq(dev, irq, starfive_fan_tach_irq, 0, pdev->name,
> +			       (void *)priv);

Does requesting the IRQ here before the clock is enabled and the reset is
deasserted risk fatal bus faults? If an interrupt is pending or fires
spuriously, starfive_fan_tach_irq() will execute and attempt to read the
peripheral's status register without an enabled clock.

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register interrupt handler\n");
> +
> +	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "Unable to get fan tach's reset\n");
> +
> +	clk =3D devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "Unable to get & enable fan tach's clock\n");
> +
> +	priv->clk_rate =3D clk_get_rate(clk);
> +	if (priv->clk_rate <=3D 0)
> +		return dev_err_probe(dev, priv->clk_rate,
> +				     "Unable to get clock's rate\n");

Is it intentional to return 0 on this error path? Passing 0 to dev_err_prob=
e()
and returning 0 bypasses hwmon registration while leaving the device entire=
ly
non-functional and leaking the enabled clock and active IRQ.

> +
> +	reset_control_deassert(rst);
> +	ret =3D devm_add_action_or_reset(dev, starfive_fan_tach_reset_control_a=
ssert, rst);
> +	if (ret)
> +		return ret;
> +
> +	writel(STARFIVE_FAN_TACH_STALL_INT_MASK | STARFIVE_FAN_TACH_SLOW_INT_MA=
SK,
> +	       priv->regs + STARFIVE_FAN_TACH_STATUS);
> +	writel(priv->clk_rate / STARFIVE_FAN_DEFAULT_MEASURE_RATIO,
> +	       priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);
> +
> +	for_each_child_of_node_scoped(dev->of_node, child) {
> +		ret =3D starfive_fan_tach_create_fan(dev, child, priv);
> +		if (ret < 0) {
> +			dev_warn(dev, "Failed to create fan %d", ret);
> +			return 0;

Could returning 0 here mistakenly signal success during a probe failure? Th=
is
would also skip devm_hwmon_device_register_with_info() and leave resources
active but non-functional.

> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260428082337.7435=
46-1-changhuang.liang@starfivetech.com?part=3D2
