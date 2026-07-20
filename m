Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0F3B0ADF
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530352; cv=none; b=MpfWQ4JhdtYeIp1yR2WNKoJEBm6F+3vrPP+STSgi7HpirQ3dXxbBVP0z6Bxt59t2IFvkz9DFN7OZcL26aROxhnbTk14Xl/BXOma2+ygefDgcbzASWXg0Kp0C6mi+N9GksdOG7jeq+U61ixdI28alC2va6FzHF4nOS8HIXLdW3dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530352; c=relaxed/simple;
	bh=Qz9pklPoYVncOaokXMyIgJkmfJ0T1FKpCzyqCXfWwKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YgaK3/LZ76+fRKum20eBN98w8imf7uqcnfznODYXYAhNBOWBXD+Bdhbcyq/O4bGzpZunYhowJJ9oaDsMDC/nZp6oIg0+kuZetjWRytW6yWDlstNwZ/eDuWSJw7DKQnEELyxrV7LsvTjgPoxPr3UCauQfjXPxVdeQfgsYVsMBuJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odRfoLxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odRfoLxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9CA1F000E9;
	Mon, 20 Jul 2026 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784530351;
	bh=GRGEUGcGRnVno3BYCTrY9JqSI0Fz7bMjDSLQ7DEtk8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=odRfoLxQtFtQBJPNR1U1p3wyQ7TgBPE6gniXdxiZkJdg9H/82ClF1yBvv3eApwxwB
	 ZcC/Y43AewCAMNkFfTfJQrOARkj3If5uvsgivO1fPaxOg0L0lzowvr/j+Ace6qRrnn
	 L3+vFt8oVMqJCysy/s4bxIo1W2YY+Xe6wLzts4DPn5UWCB1tjyD7OwUhUTVNGznbQU
	 4gI0ursELOAIkWO2rls1RJi5SBzZe21U0S49abVEDVlHz5wL5lfREWWS6KpRsEjff/
	 o+v6DmLaUI+W0rTt6T9s+VMqB9WB8UpcPf+7LZrjif8AZD+BU76m4pRnY9jmDhuTEB
	 jzn3uZv8Qt63Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] hwmon: (npcm750-pwm-fan) Remove redundant
 dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720063745.309331-5-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-5-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:52:31 +0000
Message-Id: <20260720065231.6B9CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The local stack array `name` is passed as the `devname` parameter =
to `devm_request_irq()`, resulting in a dangling pointer when the probe fun=
ction returns.
- [High] The driver registers a repeating timer `data->fan_timer` but fails=
 to cancel it when the device is unbound, leading to a use-after-free.
- [High] Missing bounds checking for Device Tree properties `reg` and `fan-=
tach-ch` leads to potential out-of-bounds memory accesses.
- [High] A data race exists when reading `fan_cnt` in sysfs, potentially le=
ading to a division by zero.
- [High] The interrupt handler `npcm7xx_fan_isr` incorrectly assumes Linux =
virtual IRQ numbers are strictly contiguous, leading to out-of-bounds array=
 accesses.
--

--- Patch [4]: [PATCH v2 4/7] hwmon: (npcm750-pwm-fan) Remove redundant dev=
_err() ---
commit ad51633ccf67c748dcb209308176241fe4d2d53b
Author: Pan Chuang <panchuang@vivo.com>

hwmon: (npcm750-pwm-fan) Remove redundant dev_err()
   =20
Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs detailed
error messages on failure. Remove the now-redundant driver-specific
dev_err() call.

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
This is a pre-existing issue, but is it safe to use a local stack array for
the devname parameter?

devm_request_irq() stores the provided devname pointer directly in the
irqaction struct without copying the string.

Because name is a locally scoped stack array in npcm7xx_pwm_fan_probe(),
it is deallocated when the probe function returns. Subsequent reads of
/proc/interrupts could dereference this dangling pointer. Additionally,
since the same array is reused in the loop, all IRQs would share the
exact same dangling pointer.

> -		if (ret) {
> -			dev_err(dev, "register IRQ fan%d failed\n", i);
> +		if (ret)
>  			return ret;
> -		}
>  	}

While reviewing this code, I noticed a few other pre-existing issues in
the driver.

drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_pwm_fan_probe() {
    ...
		timer_setup(&data->fan_timer, npcm7xx_fan_polling, 0);
		add_timer(&data->fan_timer);
    ...
}

drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_pwm_fan_driver {
    static struct platform_driver npcm7xx_pwm_fan_driver =3D {
        .probe		=3D npcm7xx_pwm_fan_probe,
        .driver		=3D { ...
}

[Severity: High]
This isn't a bug introduced by this patch, but could data->fan_timer expire
after the driver is unbound?

The driver registers a repeating timer but fails to cancel it when the devi=
ce
is unbound. The platform driver struct lacks a .remove callback, and no devm
cleanup action is registered to call del_timer_sync(). If the driver is
unbound or the module is unloaded, the devres framework will free data,
leading to a use-after-free when the timer subsequently expires.


drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_en_pwm_fan() {
    ...
	ret =3D of_property_read_u32(child, "reg", &pwm_port);
	if (ret)
		return ret;

	data->pwm_present[pwm_port] =3D true;
    ...
	for (ch =3D 0; ch < fan_cnt; ch++) {
		index =3D fan_ch[ch];
		data->fan_present[index] =3D true;
		data->fan_dev[index].fan_st_flg =3D FAN_INIT;
	}
    ...
}

[Severity: High]
This is a pre-existing issue, but is it possible for a malformed device tree
to trigger an out-of-bounds memory write to data->pwm_present or data->fan_=
dev?

The values pwm_port and index are derived directly from the device tree and
used as indices for the fixed-size arrays data->pwm_present, data->fan_pres=
ent,
and data->fan_dev. If a device tree provides values exceeding the array lim=
its,
the driver will write out of bounds.


drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_read_fan() {
    ...
		if (data->fan_dev[channel].fan_cnt > 0 &&
		    data->fan_dev[channel].fan_pls_per_rev > 0)
			*val =3D ((data->input_clk_freq * 60) /
				(data->fan_dev[channel].fan_cnt *
				 data->fan_dev[channel].fan_pls_per_rev));
    ...
}

drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_check_cmp() {
    ...
		data->fan_dev[fan_id].fan_cnt =3D 0;
    ...
}

[Severity: High]
This is a pre-existing issue, but could concurrent execution lead to a
division by zero panic on data->fan_dev[channel].fan_cnt?

In npcm7xx_read_fan(), the shared variable fan_cnt is evaluated and then us=
ed
as a denominator. If the interrupt handler updates fan_cnt to 0 after the
greater-than-zero check but before the division, this would trigger a kernel
panic.


drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_fan_isr() {
    ...
	module =3D irq - data->fan_irq[0];
	spin_lock_irqsave(&data->fan_lock[module], flags);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this calculation
incorrectly assume that the irq virqs are contiguous?

Linux dynamically allocates virtual IRQ numbers, providing no guarantee that
they are allocated contiguously. If the virqs are sparse or out of order, t=
he
calculated module index could be negative or exceed the bounds of the
fan_lock array, resulting in out-of-bounds memory corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720063745.3093=
31-1-panchuang@vivo.com?part=3D4
