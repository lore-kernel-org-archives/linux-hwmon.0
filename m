Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500331327A
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 03:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111036; cv=none; b=oBoHmcqYg/EMKb5Ag8RSvFvSI5K2jZ6tNAIps3Hp3oLAJ1PbtdEhDIV+YmrDZ0CT1OW4zIBtws7XweuF6f1NpZ0fykgREn7hGPM9FHG2q3Q8Lxr8rTSUpxx+rnnGFafqf/HrjgqX/10KyhNMHf59B9X6Qbts4Gle95y3PxwzoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111036; c=relaxed/simple;
	bh=+e++d3U7TVHzCC+SrOHg4pAiz7hufBb6XpeonC50o6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CZ2SrMG4pi8hxXp8rP/0VREjEHFT6G4bJIDaCVhXZ1RTVh1Wux2yJ36ba/fMzdlMdH61R39FAN0gyBBGiIq+QCakuqEvq8KNm1TFvSSxtW3MvGXSwzvPKNJa+3UYjC25bxExOhTYyw4XvNq0Mq9MySYPrPbjQItT4Exd88EdwEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYSWYYs6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYSWYYs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B350E1F000E9;
	Wed, 19 Aug 2026 03:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787111033;
	bh=WfA2g7VTmDLc6mM14fri3LsAqIiYIJfQhP1JUyENkCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eYSWYYs6QN8ZOP1Rajuoqz6MfQYVFDC1K+0lGEoNIL3yTLu3YOQJA4C1FaX9ycA+U
	 1S7VjubvbxeNt0PGUBFnKMjEjlB1BuOPOQhcVP4W2Edlwc+TumzFA0Hc42qrF/0Aab
	 40Yjr1f6odzP8PTzBY86kQnSolpLPR0KDLN79Y1eDpaZ8Agd+2/H2seezm6b8OPadx
	 X/ZBdIUZ7dIiLCTgwQ9kVRffkNAT5cAYpGdHpxvEQMUw99295OASBUZe1JIQZCQ6ol
	 Y8Br9ywZHdwEVTAZVmaoByxHrnDXUoW3CGv6moYZlUtphRBYK0avz7QSHGtXAN53K0
	 U0dDHEGx3Z/aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan) fix use-after-free in alarm work
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fan Wu" <fanwu01@zju.edu.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260819033317.446191-1-fanwu01@zju.edu.cn>
References: <20260819033317.446191-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 03:43:53 +0000
Message-Id: <20260819034353.B350E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared interrupt handler `fan_alarm_irq_handler` unconditional=
ly returns `IRQ_NONE` despite successfully handling the interrupt by schedu=
ling work.
- [High] The driver's devres management of `pm_runtime_disable` is unbalanc=
ed, leading to PM state leaks on unbind without control GPIOs, or corrupted=
 PM state across probe failures.
- [High] Error paths in `set_fan_speed` and `gpio_fan_probe` cause software=
 state to desynchronize from runtime PM state, triggering repeated usage co=
unt underflow warnings.
--

--- Patch [1]: [PATCH] hwmon: (gpio-fan) fix use-after-free in alarm work -=
--
commit 3d50f01d30cc7a7c52ecf0ad47ea90b3b37fc216
Author: Fan Wu <fanwu01@zju.edu.cn>

hwmon: (gpio-fan) fix use-after-free in alarm work

fan_alarm_irq_handler() queues fan_data->alarm_work, but nothing cancels it.
Replace INIT_WORK() with devm_work_autocancel() to safely cancel the work
during devres cleanup.

> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e2817..7f36e5f6f2230 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -84,6 +85,7 @@ static DEVICE_ATTR_RO(fan1_alarm);
>  static int fan_alarm_init(struct gpio_fan_data *fan_data)
>  {
>  	int alarm_irq;
> +	int err;
>  	struct device *dev =3D fan_data->dev;
> =20
>  	/*
> @@ -94,7 +96,11 @@ static int fan_alarm_init(struct gpio_fan_data *fan_da=
ta)
>  	if (alarm_irq <=3D 0)
>  		return 0;
> =20
> -	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
> +	err =3D devm_work_autocancel(dev, &fan_data->alarm_work,
> +				   fan_alarm_notify);
> +	if (err)
> +		return err;

[Severity: High]
This is a pre-existing issue, but does returning an error here expose an
unbalanced PM runtime state?

If fan_alarm_init() fails here, probe aborts and devres cleanup will execute
gpio_fan_stop(). Looking at gpio_fan_stop(), it unconditionally calls
pm_runtime_disable() on fan_data->dev even if pm_runtime_enable() was never
reached in probe.

Since gpio_fan_probe() registers gpio_fan_stop() via devm_add_action_or_res=
et()
before calling pm_runtime_enable(), couldn't this failure cause
pm_runtime_disable() to be called without a prior enable? This would increm=
ent
the disable depth to 2, permanently disabling runtime PM on subsequent defe=
rred
probes.

Additionally, if the device has no control GPIOs, gpio_fan_stop() is never
registered. probe() unconditionally calls pm_runtime_enable(), but on unbind
pm_runtime_disable() is never called, leaking the PM state.

[Severity: High]
This is also a pre-existing issue, but can error paths in set_fan_speed() a=
nd
gpio_fan_probe() cause runtime PM usage count underflows?

In set_fan_speed(), if pm_runtime_put_sync() fails, it returns early:

drivers/hwmon/gpio-fan.c:set_fan_speed() {
    ...
    if (ret < 0 && ret !=3D -ENOSYS)
        return ret;
    ...
}

This skips updating fan_data->speed_index =3D 0. The usage count was decrem=
ented,
but the software state assumes the fan is still active. Could subsequent ca=
lls
to stop the fan redundantly call pm_runtime_put_sync(), causing an underflo=
w?

Similarly, in gpio_fan_probe(), if the fan is initially active (speed_index=
 > 0)
but pm_runtime_resume_and_get(&pdev->dev) fails, probe returns an error wit=
hout
clearing speed_index. During devres unwind, gpio_fan_stop() calls
set_fan_speed(0). Because speed_index > 0, it calls pm_runtime_put_sync() o=
n a
usage count of 0, triggering an underflow warning.

> +
>  	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
>  	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
>  				IRQF_SHARED, "GPIO fan alarm", fan_data);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does fan_alarm_irq_handler()
correctly return its IRQ status?

Looking at fan_alarm_irq_handler() in drivers/hwmon/gpio-fan.c:

drivers/hwmon/gpio-fan.c:fan_alarm_irq_handler() {
    ...
    schedule_work(&fan_data->alarm_work);

    return IRQ_NONE;
}

Since the handler unconditionally returns IRQ_NONE despite successfully
queueing the work, and the interrupt is registered as IRQF_SHARED, could the
kernel's spurious interrupt detector permanently disable the shared interru=
pt
line once the unhandled count exceeds the threshold?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819033317.4461=
91-1-fanwu01@zju.edu.cn?part=3D1
