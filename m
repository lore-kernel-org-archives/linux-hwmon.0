Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C462D339B41
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035730; cv=none; b=AO9y2csWjZFWlIlwloUCuLW81/QzDqXBA1xAxvx32EyOp9CfDmqNEPOTMF2Y/3GXs9J1SSrOsPzhsSGBfbTfNS+5AyrfpvJbbsiHw6eqrSz4kxAPHItagy+YJnkzPElp5RddsM90zYgjltgFY3M2FlJ+DdFdKPELmbhEkgd2Z00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035730; c=relaxed/simple;
	bh=klksXhQMw3oKg1nfcrWRc9LGSXchoaRtSvOB34/5lhw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gzsy7Lth+MdqeLW4LHJbbi3E2RwoYzhlJKnHzbZzzv2iirrVsgX0/XfWori+JMLFwHiCZt4UIzO+q0ffQybFEjMs/YuxYZe5o4nSPdgH7WWkfNPiCeSR/UCnK/kUIrttYaML4rn+P9uGhIqEM8MWMfRP2qF+I0KTJgUFWe08ZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwAwhvDi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwAwhvDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA0E1F000E9;
	Tue, 14 Jul 2026 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035728;
	bh=UwFlNV3aNNOZPVqHUWl+KR9JXI2Qd4JJelIIMuFeKRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwAwhvDiOvJDPVg0uzsrT/xabpjJdjmVh7CaxLPUNnvXbbHqfF3cQFTzyrRhG38kw
	 lw7Ea3bBtgp+aaT37gHI1eFEAGDT3wSvlj9XE/LWIdpHM3n2iwXV67s1zcadHryNSx
	 Ho2YCrL76JwkajUb9OhwM+1d/ZZtRkwg7Vwr2ou4xe3wZPfPIaLF+pevDxhPeByXPT
	 VUyT/nE489gPfAiEdxO5eFsRqwz7PB0q6jY/WOyEV9kELpumOFRloyIWo6mcSBpGXN
	 eaYCTYVkmJ2pqjucrfiTdlouB5P8sq6IvYxZ8FCPpqfo8rBc4g0NqmRPkYM3UR1Jal
	 MtvgkE+qq3bAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: Remove redundant dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260714130228.449233-2-panchuang@vivo.com>
References: <20260714130228.449233-1-panchuang@vivo.com>
 <20260714130228.449233-2-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:28:47 +0000
Message-Id: <20260714132848.0CA0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ name is formatted into a local stack array and passed to `=
devm_request_irq()`, which stores the pointer without copying, leading to a=
 dangling pointer in the IRQ descriptor.
- [High] The background timer `data->fan_timer` is started during probe but=
 is never deleted on driver unbind, leading to a Use-After-Free when the ti=
mer fires.
- [High] The background workqueues `read_work` and `update_supply_work` are=
 never cancelled in the probe error paths or upon device removal, leading t=
o a Use-After-Free.
- [High] In `npcm7xx_fan_isr`, the `module` index is calculated by subtract=
ing the first IRQ number (`data->fan_irq[0]`) from the fired `irq` number. =
This relies on virtual IRQ numbers being contiguous, which is not guarantee=
d.
--

--- Patch [1]: [PATCH 1/2] hwmon: Remove redundant dev_err()/dev_err_probe(=
) ---
commit a53a0705fb3a6891bc046dff13aad0b80c92ef7d
Author: Pan Chuang <panchuang@vivo.com>

hwmon: Remove redundant dev_err()/dev_err_probe()

The devm_request_irq() and devm_request_threaded_irq() automatically
log detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

[ ... ]

> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-=
fan.c
> index aea0b8659f5f6..df24dec78e770 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -991,10 +991,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_dev=
ice *pdev)
>  		sprintf(name, "NPCM7XX-FAN-MD%d", i);
>  		ret =3D devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr,
>  				       0, name, (void *)data);

[Severity: High]
This is a pre-existing issue, but could passing the local stack array 'name=
' to
devm_request_irq() result in a dangling pointer?

The kernel IRQ core stores the pointer passed as devname without copying it.
Since the name array is allocated on the stack in npcm7xx_pwm_fan_probe(), =
its
memory is reclaimed when the probe function returns.

When /proc/interrupts is read, the kernel loops over IRQ actions and
dereferences action->name. Will this dereference a dangling stack pointer?

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing unbind
operation for data->fan_timer?

Looking at the driver definition, npcm7xx_pwm_fan_driver lacks a .remove
function:

drivers/hwmon/npcm750-pwm-fan.c:
static struct platform_driver npcm7xx_pwm_fan_driver =3D {
    .probe      =3D npcm7xx_pwm_fan_probe,
    ...
};

The background timer data->fan_timer is started during probe:

    timer_setup(&data->fan_timer, npcm7xx_fan_polling, 0);
    add_timer(&data->fan_timer);

When the device is unbound via sysfs, devres frees the data structure, but =
the
polling timer remains active. When the active timer subsequently expires, w=
ill
its callback npcm7xx_fan_polling() dereference the freed data pointer?

[Severity: High]
This is a pre-existing issue, but could the ISR logic in npcm7xx_fan_isr() =
be
performing an out-of-bounds access by assuming IRQ number contiguity?

drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_fan_isr() {
    ...
    module =3D irq - data->fan_irq[0];
    spin_lock_irqsave(&data->fan_lock[module], flag);
    ...
}

Linux virtual IRQ numbers mapped by the IRQ domain are not guaranteed to be
contiguous. If the allocated IRQ numbers are interleaved with other devices,
would module be calculated as an out-of-bounds index, causing the spinlock =
to
be acquired at an arbitrary memory offset?

> -		if (ret) {
> -			dev_err(dev, "register IRQ fan%d failed\n", i);
> +		if (ret)
>  			return ret;
> -		}
>  	}

[ ... ]

> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index 101cebbe68e4d..7bb2105d1ae22 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -981,10 +981,8 @@ static int sht15_probe(struct platform_device *pdev)
>  			       IRQF_TRIGGER_FALLING,
>  			       "sht15 data",
>  			       data);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to get irq for data line\n");
> +	if (ret)
>  		goto err_release_reg;
> -	}

[Severity: High]
This isn't a bug introduced by this patch, but are the background workqueues
read_work and update_supply_work correctly cancelled on device removal?

Looking at sht15_remove():

drivers/hwmon/sht15.c:sht15_remove() {
    ...
    if (!IS_ERR(data->reg)) {
        regulator_unregister_notifier(data->reg, &data->nb);
        regulator_disable(data->reg);
    }
}

The removal path unregisters the device and regulator notifier but fails to
call cancel_work_sync() for update_supply_work and read_work.=20

Since sht15_data is managed by devres, it is freed when the driver unbinds.
If the device is unbound via sysfs while a read is in progress or a supply
voltage update is pending, will the work item execute after the backing mem=
ory
is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714130228.4492=
33-1-panchuang@vivo.com?part=3D1
