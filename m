Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D893237475B
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262349; cv=none; b=mESz+RPMkl1baHjewcyxRTcUyS1cg0oPb2TeQQMBHNxLt4kNi/LHaaq+akrYk39evZSASZwo037DPEkTzM8zuMCRuM2P5TEvOczd+2z/oLi/Q3WNtbdQ2ZLsTax0MZObDUZNg4W9FwvFceW/gvRrmFdV3egJeKc5EbiF6s4pHXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262349; c=relaxed/simple;
	bh=xLUfBREA/y7pl2ViLGXUAXXxzOLvnw1tuSYYyawsfbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WMGMMvA6LcLICNn1hPJojRi44mJyLkB1vcp9VGDy8CIUds4qvvQ+8q95VA/IEvEQVXF0xgP9hHVGL0ofi/fJqTOfC98RR0fAkSnx8yM9mA8i9l+ToDqB+q59/PJ9Y07ehRmKH4bFHGCFCrz3p3raBUZ2Ho5LdUFMkTW1VFYVmgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK5GfeVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK5GfeVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3694B1F000E9;
	Tue,  1 Sep 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788262347;
	bh=52v9AIuPvdacBDQB+gltTODl5etyhCGdKbv9nC1acx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lK5GfeVr0dwbR90pFPZxiaCadhUSLwS9BHaYGQVY2lc3Z91zKl4OewHc00YYFfSSC
	 AGxhD9PFtLbXxVWlJxWRzvV4mSTFuK8pfoD+9UXaXo6frQRzS/MCB5EcwtV/nGBgAk
	 +rQI+g71OXYVESSxbSzNfONtI11YM9u8KW4NqI8bAvgMFEzm7JGoQZOfxy5l1DP//w
	 c1HWVJYGaxyLsRKwceNVwlDq74BDB/oj+qrkWUucquwmuTAQvV+QeCoocbLnMIPRXc
	 zqYRpijc6iDukXyWklxnqCsnPULva2xKh67J4hYTTk1vmN/3ryQF9X2vBSzWonGZ6K
	 3PMRSTtetkhlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901111903.660681-1-congnt264@gmail.com>
References: <20260901111903.660681-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 11:32:26 +0000
Message-Id: <20260901113227.3694B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Unbalanced pm_runtime_disable() on probe error paths permanently d=
isables runtime PM.

Pre-existing issues:
- [High] Failing to resume the device at the end of probe causes a usage co=
unt underflow during devm cleanup.
- [High] A race condition between probe and sysfs writes can cause a double=
-increment of the runtime PM usage count, permanently blocking runtime susp=
end.
- [High] Missing synchronize_irq() in runtime suspend callback for shared I=
RQ.
- [High] Missing cancel_work_sync() for alarm_work leads to a Use-After-Fre=
e on driver unbind or probe failure.
- [High] Unconditional IRQ_NONE return in a shared interrupt handler.
--

commit c1b61438a4a40096fe54d7b86037b9d5eebc1cae
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans

pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
that calls pm_runtime_disable() is only registered when control GPIOs
are present. Alarm-only fans never get it, so unbind warns about the
missing disable.

Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org

> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e2817..8b28f0d58c638 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
[ ... ]
> @@ -553,6 +556,17 @@ static int gpio_fan_probe(struct platform_device *pd=
ev)
>  		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
>  				     "Failed to get fan-supply");
> =20
> +	/*
> +	 * Reserve this devm slot before gpio_fan_stop()'s so LIFO teardown
> +	 * runs gpio_fan_stop() (needs PM enabled to disable the regulator)
> +	 * first. pm_runtime_enable() itself still happens at its original
> +	 * position below, so this doesn't change when PM actually becomes
> +	 * enabled -- only where its eventual disable is queued.
> +	 */
> +	err =3D devm_add_action_or_reset(dev, gpio_fan_pm_runtime_disable, dev);
> +	if (err)
> +		return err;

[Severity: High]
Does unconditionally registering devm_add_action_or_reset() early in the
probe path cause an unbalanced pm_runtime_disable() on probe error paths?

If probe fails at any intermediate point (e.g., in fan_ctrl_init(),
hwmon_device_register_with_groups(), or fan_alarm_init()), devm teardown wi=
ll
execute gpio_fan_pm_runtime_disable(). Since pm_runtime_enable() hasn't been
reached yet, this incorrectly increments dev->power.disable_depth. On a
subsequent probe attempt, pm_runtime_enable() will only decrement it to 1,
leaving runtime PM permanently disabled.

[Severity: High]
This isn't a bug introduced by this patch, but does failing to resume the d=
evice
at the end of probe cause a usage count underflow during devm cleanup?

fan_ctrl_init() initializes fan_data->speed_index based on the hardware sta=
te.
If the fan is active, speed_index > 0. gpio_fan_stop() is then queued as a =
devm
action. If probe subsequently fails before the final pm_runtime_resume_and_=
get()
succeeds, the devm cleanup runs gpio_fan_stop(), which calls set_fan_speed(=
):

drivers/hwmon/gpio-fan.c:set_fan_speed() {
	...
	if (fan_data->speed_index > 0 && speed_index =3D=3D 0) {
		int ret;

		ret =3D pm_runtime_put_sync(fan_data->dev);
		if (ret < 0 && ret !=3D -ENOSYS)
			return ret;
	}
	...
}

Because speed_index > 0, set_fan_speed() drops a PM reference that was never
actually acquired, pushing the usage count below zero.

[Severity: High]
This is a pre-existing issue, but does a race condition between probe and
sysfs writes cause a double-increment of the runtime PM usage count?

Sysfs attributes are exposed early by devm_hwmon_device_register_with_group=
s().
Userspace can write to pwm1 right after probe calls pm_runtime_enable(). The
sysfs handler acquires a PM reference and sets speed_index > 0.

The probe thread then checks the state:

drivers/hwmon/gpio-fan.c:gpio_fan_probe() {
	...
	/* If current GPIO state is active, mark RPM as active as well */
	if (fan_data->speed_index > 0) {
		int ret;

		ret =3D pm_runtime_resume_and_get(&pdev->dev);
		if (ret)
			return ret;
	}
	...
}

Since this check doesn't hold fan_data->lock, probe sees the new value and =
takes
a second PM reference. When userspace later stops the fan, only one referen=
ce
is dropped, permanently blocking runtime suspend.

[Severity: High]
This is a pre-existing issue, but is synchronize_irq() missing in the runti=
me
suspend callback for a shared IRQ?

The driver requests a shared interrupt for the alarm GPIO:

drivers/hwmon/gpio-fan.c:fan_alarm_init() {
	...
	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
				IRQF_SHARED, "GPIO fan alarm", fan_data);
}

The PM subsystem guide mandates that drivers using IRQF_SHARED MUST call
synchronize_irq() in their runtime suspend callback before powering down
hardware.

Since this is missing, the IRQ handler could execute mid-flight while the
regulator is being disabled in gpio_fan_runtime_suspend():

drivers/hwmon/gpio-fan.c:gpio_fan_runtime_suspend() {
	...
	if (fan_data->supply)
		ret =3D regulator_disable(fan_data->supply);
	...
}

[Severity: High]
This is a pre-existing issue, but does missing cancel_work_sync() for alarm=
_work
lead to a use-after-free on driver unbind or probe failure?

The driver initializes fan_data->alarm_work and requests an interrupt to
schedule it:

drivers/hwmon/gpio-fan.c:fan_alarm_init() {
	...
	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
	...
	return devm_request_irq(dev, alarm_irq, ...);
}

It fails to register a cleanup action to call cancel_work_sync(). During dr=
iver
unbind or probe failure, devm_request_irq is unwound, which synchronizes wi=
th
running handlers but does not cancel pending work. fan_data is then freed by
devm. If an interrupt fired right before cleanup, the work executes
asynchronously and dereferences the freed fan_data pointer.

[Severity: High]
This is a pre-existing issue, but does the shared interrupt handler return =
an
unconditional IRQ_NONE?

drivers/hwmon/gpio-fan.c:fan_alarm_irq_handler() {
	...
	schedule_work(&fan_data->alarm_work);

	return IRQ_NONE;
}

The driver requests an IRQF_SHARED interrupt. In its handler, it processes =
the
event but unconditionally returns IRQ_NONE. When the kernel sees IRQ_NONE f=
rom
all handlers on a shared line, it registers an unhandled interrupt. After e=
nough
unhandled interrupts, the kernel disables the IRQ line permanently, breakin=
g all
devices sharing it.

> +
>  	/* Configure control GPIOs if available. */
>  	if (fan_data->gpios && fan_data->num_gpios > 0) {
>  		if (!fan_data->speed || fan_data->num_speed <=3D 1)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901111903.6606=
81-1-congnt264@gmail.com?part=3D1
