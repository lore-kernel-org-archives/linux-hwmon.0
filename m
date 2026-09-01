Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977843F4C5
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279049; cv=none; b=Nzr79fKHZ6sRs62cgM7vH+kBrj5zmiJVlayAndeFySgWmHYpXGGZA12GvM2daG1W3pXkTWO/nR8/kwUpsAWqQvPsAtAn1+lVP9cltexeWNsgt+0pOGdb83EUCpGzkXsJ+6yAzMmi9oJUJ7QvUvHObwq83IPj8z/XVLP2GSDkDks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279049; c=relaxed/simple;
	bh=3+kg/uzM4BkgOTUBpqvyDD8N1FDGiXq0G/zv2w6wAOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F7+Sx3cJlhZ2ooSxo+uXKs57aPpfEeCXPM4XJj2aOs8AvVAi/H/u/XfSe3gO2GBJwk00bJRwBXQMVbjN2LzEOD2d59JnkBCfyIH4Y/JMQfRAWL3eUFSEvtnq6z6/dCV1SpsjIpmqcUyTOsOAbFAnQIjskLE5SOUpOaAHY+Wgc5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZb5joCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZb5joCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F135A1F000E9;
	Tue,  1 Sep 2026 16:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279048;
	bh=dUiWqEZgoUlpp/4k5ZLKzp4gGT3yYJpkkz99NRORBr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZb5joCWD1AvR6FEW0KcF9ObyrYZr+GM7lSVgokDDPuc4E1cvmHQoS583L+GEMKNq
	 vuohjEJcsmV2tF2OLNc8tqPNPzihYlTFn6KZ/sbigmQVA3TOGZUIw+ffSv1QyU+RUH
	 R5tHwTk3x1B5loPVjhadOArzq/iWVkd6SowWqhfA7OHSxEhhsP8xd7f6WtvLu1QU0k
	 akFMld//ORYu1ZjTCDqygcQQVMYhqX5hn7irKcUSCQHHel3k8PA1q59DoFrXM6vU1p
	 wSMbioVgavZRUXMsTO0I6Ds6Rwx1aCVbHWJH2ZoTlPgg8NGtMrH9QECdAhE0hsogbE
	 MfacB8t43fdDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan) take fan_data->lock in
 gpio_fan_shutdown()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901155404.1532092-1-congnt264@gmail.com>
References: <20260901155404.1532092-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 16:10:47 +0000
Message-Id: <20260901161047.F135A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `pm_runtime_put_sync` fails in `set_fan_speed`, early return wi=
thout updating `fan_data->speed_index` causes hardware/software state desyn=
c and PM runtime usage count underflow on subsequent calls.
- [High] The interrupt handler fan_alarm_irq_handler() unconditionally retu=
rns IRQ_NONE despite successfully handling the interrupt by scheduling work.
- [High] Missing cancellation of asynchronous work `alarm_work` on device u=
nbind, leading to potential Use-After-Free.
- [High] Probe error paths increment the runtime PM `disable_depth` and und=
erflow `usage_count` without a prior enable, permanently breaking runtime P=
M on reprobe.
--

commit 873147f80fe3dd0bae36a6073b5c5cdc81be1416
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()

set_fan_speed() writes the control GPIOs one bit at a time. Every
other caller locks around it; gpio_fan_shutdown() doesn't. If it races
a locked caller, the GPIO writes can interleave and leave the fan at a
speed neither caller asked for.

Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org

> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e2817..10c91bc33b020 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -606,8 +606,11 @@ static void gpio_fan_shutdown(struct platform_device=
 *pdev)
>  {
>  	struct gpio_fan_data *fan_data =3D platform_get_drvdata(pdev);
> =20
> -	if (fan_data->gpios)
> +	if (fan_data->gpios) {
> +		mutex_lock(&fan_data->lock);
>  		set_fan_speed(fan_data, 0);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in
set_fan_speed() itself when it is called here.

If pm_runtime_put_sync() fails inside set_fan_speed(), it returns an error
without updating fan_data->speed_index:

drivers/hwmon/gpio-fan.c:set_fan_speed() {
    ...
	if (fan_data->speed_index > 0 && speed_index =3D=3D 0) {
		int ret;

		ret =3D pm_runtime_put_sync(fan_data->dev);
		if (ret < 0 && ret !=3D -ENOSYS)
			return ret;
	}

	fan_data->speed_index =3D speed_index;
    ...
}

Does this early return leave the driver's state machine desynchronized from
the PM runtime reference count? The next time set_fan_speed() is called to
turn off the fan, could it see speed_index is still > 0 and call
pm_runtime_put_sync() again, decrementing the count a second time and causi=
ng
a usage count underflow?

[Severity: High]
This is a pre-existing issue, but there appears to be another PM runtime
imbalance in the probe error paths involving gpio_fan_stop().

drivers/hwmon/gpio-fan.c:gpio_fan_stop() {
    ...
	set_fan_speed(data, 0);
	...
	pm_runtime_disable(fan_data->dev);
    ...
}

If a standard probe failure like EPROBE_DEFER occurs before
pm_runtime_enable() is called, would gpio_fan_stop() execute
set_fan_speed(..., 0) and underflow the usage count since a prior get was
never executed?=20

Furthermore, would calling pm_runtime_disable() on this error path
incorrectly increment the disable_depth, permanently breaking runtime PM for
the device across reprobes?

> +		mutex_unlock(&fan_data->lock);
> +	}
>  }

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I also noticed a potential
spurious interrupt issue in the alarm handler.

drivers/hwmon/gpio-fan.c:fan_alarm_irq_handler() {
	struct gpio_fan_data *fan_data =3D dev_id;

	schedule_work(&fan_data->alarm_work);

	return IRQ_NONE;
}

Since this unconditionally returns IRQ_NONE despite successfully handling t=
he
interrupt by scheduling work, could this trigger the kernel's spurious
interrupt detector? If the alarm GPIO toggles enough times to reach the
threshold, might the kernel forcefully disable this shared IRQ line, breaki=
ng
this and potentially other devices sharing the line?

[Severity: High]
This is a pre-existing issue, but is there a missing teardown step for the
asynchronous work initialized in fan_alarm_init()?

drivers/hwmon/gpio-fan.c:fan_alarm_init() {
    ...
	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
    ...
}

The asynchronous work is initialized here but never accompanied by a cleanup
or cancellation devm action. If the device is unbound via sysfs immediately
after the interrupt fires, could the devm framework free fan_data while
alarm_work is still pending or running on the background workqueue? Would
this lead to a use-after-free when fan_alarm_notify() dereferences the freed
fan_data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901155404.1532=
092-1-congnt264@gmail.com?part=3D1
