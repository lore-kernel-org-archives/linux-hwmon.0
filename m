Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52263B71A1
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788103312; cv=none; b=FX8dSgWQKbX79CUG5AVNCeBs33E22zGu6YObilcasvp6EG51Uh0GqkHh9d4x7dld3a7rwTQ9khoNngQwsQwQVF94npkqMmSojxT6ePwkXyhkjgWz8gEElUC/G6elBQIPJJjhbmL+b+zBBvj+Kh6QIcR4gvECCp/uo9qguOndRKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788103312; c=relaxed/simple;
	bh=aAeh8b0fFQU9eVvK+XOjuEwBll+CRUrmkIdAY80p2J8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T7/NcnIcfrKetVS+fwlA1NtaptkjVvWR/Zh/J7qkdHK3Da8rXRI+wg8SJDMdyEuKKJ6MkDotMHXyfyeenuBIZo/taXgYtG67/CAgBKS1WR25iJf92A6OARG4JycIDKXFazAk13qTZJNFzI25cLy4sSeLEyzyNm7qEFjKcpeZzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyXB4qNx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyXB4qNx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F5F1F000E9;
	Sun, 30 Aug 2026 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788103310;
	bh=8H/XGDQFtAtIRGVyH6pJWgw6ICT3CjJDm+cUcFgwoe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyXB4qNxx6m8TR2Py233jiIK2RKTa18XEMtWGAiZYkv8cAcQJ8u08lvyEP3f9nGhg
	 BfuBXnNAmNkaJO0Kiv+ZGqP9r3EtVwkzLJWHgVYaN4iCdaXOF3uN3j+Q8hITvAsyrA
	 PySmH+qPvqGGjGkdRq/tRQYtjxsFa0nmjVrn1v232KOC7BZWzMf4WHYQqLZxKJDzy7
	 YSLnQB+0JMpFsAgxxDYslVKO5Ivt1jvpbrrdgq80u1p7mxN2SAkkgVdl2DttlQpG9W
	 +t36S23+BLUdtiSi56CVCttyXpgATKrC9eZMZ7E0FSHoSn7cG8FnviimqW3NZcSlYL
	 mPQxwWT3HdKRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260830150508.1475105-1-congnt264@gmail.com>
References: <20260828105018.2392383-1-congnt264@gmail.com>
 <20260830150508.1475105-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 15:21:49 +0000
Message-Id: <20260830152150.27F5F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Moving devm_pm_runtime_enable() to the start of probe opens a crit=
ical race window causing a permanent PM usage count leak.

Pre-existing issues:
- [Critical] Missing cancel_work_sync() for alarm_work leads to Use-After-F=
ree.
- [High] Missing synchronize_irq() in runtime suspend callback for shared I=
RQ.
- [High] Probe error paths trigger pm_runtime_put_sync() on an unresumed de=
vice, causing a usage count underflow and preventing the regulator from dis=
abling.
- [High] State mismatch and PM usage counter underflow on pm_runtime_put_sy=
nc() failure.
- [High] Missing lock acquisition in gpio_fan_shutdown() leads to data race=
s and unbalanced runtime PM.
- [High] Alarm IRQ handler unconditionally returns IRQ_NONE, breaking the s=
hared interrupt line.
--

commit 7341755fa2914776aa77e1819998064fadc8592b
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans

This commit addresses a runtime PM imbalance in alarm-only fans where
pm_runtime_disable() was skipped on teardown. It replaces
pm_runtime_enable() with devm_pm_runtime_enable() and moves it earlier
in probe to ensure LIFO teardown runs gpio_fan_stop() before disabling
PM.

Link: https://lore.kernel.org/r/b9792be3-fcd6-468c-9149-7e33640ee167@roeck-=
us.net

> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e2817..988f52d11ce2e 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
[ ... ]
> @@ -553,6 +551,16 @@ static int gpio_fan_probe(struct platform_device *pd=
ev)
>  		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
>  				     "Failed to get fan-supply");
> =20
> +	/*
> +	 * Register before gpio_fan_stop()'s devm action: LIFO teardown must
> +	 * run gpio_fan_stop() (needs PM enabled to disable the regulator)
> +	 * before this disables PM.
> +	 */
> +	pm_runtime_set_suspended(&pdev->dev);
> +	err =3D devm_pm_runtime_enable(&pdev->dev);

[Severity: High]
Does moving this earlier open a race condition that could permanently leak =
a PM
usage count?

If a concurrent sysfs write occurs after hwmon registration exposes sysfs f=
iles
(like pwm1, fan1_target) but before probe finishes, set_fan_speed() will
successfully call pm_runtime_resume_and_get().

This increments the usage count to 1 and sets fan_data->speed_index > 0.

When probe reaches its end, it checks if fan_data->speed_index > 0 and
unconditionally calls pm_runtime_resume_and_get() again.

Will this double-increment the counter, preventing the device from ever ent=
ering
runtime suspend?

Previously, PM was disabled during this window, causing concurrent sysfs ac=
cess
to fail cleanly with -EACCES.

[ ... ]

[Severity: High]
This is a pre-existing issue, but could the devm teardown cause a PM usage
count underflow during probe error paths?

In gpio_fan_probe(), the teardown action is registered before the final PM
reference is acquired:

    err =3D devm_add_action_or_reset(dev, gpio_fan_stop, fan_data);

If probe fails after fan_ctrl_init() sets speed_index > 0, but before
pm_runtime_resume_and_get() is called at the end of probe, the PM usage cou=
nt
is 0.

The devm rollback calls gpio_fan_stop() which calls set_fan_speed(0). This
invokes pm_runtime_put_sync(), decrementing the usage count from 0 to -1.

Because the count underflows, does the PM core (rpm_suspend) abort with an
error and leave the regulator powered on despite the teardown?


[Severity: High]
This is a pre-existing issue, but are we missing a synchronize_irq() in the
runtime suspend callback?

The PM Subsystem Concurrency and Locking guidelines dictate that drivers us=
ing
IRQF_SHARED must call synchronize_irq() before powering down hardware.

In fan_alarm_init(), the alarm interrupt is requested with IRQF_SHARED:

    devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
                     IRQF_SHARED, "GPIO fan alarm", fan_data);

However, in gpio_fan_runtime_suspend(), the hardware regulator is disabled
without first synchronizing the interrupt:

    if (fan_data->supply)
        ret =3D regulator_disable(fan_data->supply);

Could this race with a shared IRQ executing mid-flight when the device ente=
rs
runtime suspend, causing spurious interrupts or data races?


[Severity: Critical]
This is a pre-existing issue, but can the lack of cancel_work_sync() for
alarm_work lead to a Use-After-Free?

In fan_alarm_init(), the work is initialized and the IRQ is requested via
devm_request_irq():

    INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
    return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
                            IRQF_SHARED, "GPIO fan alarm", fan_data);

On driver unbind or probe failure, devm frees the IRQ, but there is no call=
 to
cancel_work_sync() to wait for or cancel already-queued work.

Devm then frees the fan_data structure.

If the asynchronous workqueue eventually executes fan_alarm_notify(), it
dereferences the freed memory:

    sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");

Would a devm_add_action_or_reset() be needed here to cancel the work?


[Severity: High]
This is a pre-existing issue, but does set_fan_speed() cause a state mismat=
ch
and PM counter underflow if pm_runtime_put_sync() fails?

In set_fan_speed():

    ret =3D pm_runtime_put_sync(fan_data->dev);
    if (ret < 0 && ret !=3D -ENOSYS)
        return ret;
    fan_data->speed_index =3D speed_index;

pm_runtime_put_sync() unconditionally drops the PM usage count even on erro=
r.
If it returns an error, the function returns early without updating
fan_data->speed_index to 0.

Because speed_index incorrectly remains > 0, any subsequent attempt to stop
the fan will invoke pm_runtime_put_sync() again.

Could this lead to multiple decrements of the PM usage counter for a single
PM reference?


[Severity: High]
This is a pre-existing issue, but might gpio_fan_shutdown() race due to mis=
sing
lock acquisition?

    static void gpio_fan_shutdown(struct platform_device *pdev)
    {
        struct gpio_fan_data *fan_data =3D platform_get_drvdata(pdev);
        if (fan_data->gpios)
            set_fan_speed(fan_data, 0);
    }

set_fan_speed() explicitly requires fan_data->lock to be held to safely read
and update fan_data->speed_index.

If system shutdown races with a concurrent sysfs write or thermal callback,
both threads might issue set_fan_speed(0) simultaneously.

Could this issue pm_runtime_put_sync() twice and underflow the runtime PM
usage count?


[Severity: High]
This is a pre-existing issue, but does the alarm IRQ handler break the
shared interrupt line by unconditionally returning IRQ_NONE?

    static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
    {
        struct gpio_fan_data *fan_data =3D dev_id;
        schedule_work(&fan_data->alarm_work);
        return IRQ_NONE;
    }

When requested with IRQF_SHARED, returning IRQ_NONE informs the core IRQ
subsystem that the interrupt was unhandled.

After enough unhandled triggers, won't the kernel's spurious interrupt
detection permanently disable the shared interrupt line, causing a denial of
service for any other device sharing this IRQ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830150508.1475=
105-1-congnt264@gmail.com?part=3D1
