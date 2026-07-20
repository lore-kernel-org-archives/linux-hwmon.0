Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10821D3F5
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530074; cv=none; b=u6pfuNboNMc7friQPgj1mO7//s4AEnqaPMI3/cWfERuz5pjpke9E6TwzcyjK86cr4M8VGh6/IUo7COubqrc8VKIqRUO2kW/du2S5xvrzyTcNDveM2zsmth3li++HWv3/zTooEVgJnF191uW05Rs3coPKbFuX385/V8NeBFyFQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530074; c=relaxed/simple;
	bh=TP26xfkOPnvRsJnYRVwEeIuuo81N+YJbt6aHr3cGn10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=awWZBPB6vgwaHA74ytI2Kd0miqn/bWaEMVMNOA8XSaVBokiCH0m9OgMWP/jU9i34pSgNOoUaNaIRpsn44BqolEOCUpY7OgeQS0hLLa+S0kkPBtETtozJ19Y13Qzc4Ch4JZz2xtDeLoK33a54VNG9827GZ+ZRpXq9fVGeyONGY8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIUTETFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIUTETFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BA91F00A3A;
	Mon, 20 Jul 2026 06:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784530073;
	bh=Od2Rv4feA9ID6cdqK02pK1+VQtjH1/hEGk7eOnBRumw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jIUTETFOgBOwv36m9KBmFxVesT2edzw4Uk/fESnzZGKKlMZRoqFLB3JgsHnCV8jFD
	 0+1ol7BXYIZTUbNEqtCZthu06S6Sg0Btm4hcaAy2tBucMlh27BThvmSbCMJ0XNB4KE
	 jLz1YmQAMrUInFmIyix0uDu+6QDGhS67I6cshG070fcSVwnU/lDT2iSQ7WGfO1qCAD
	 EZUxjbz21l7+nx3B6NKB16S5JZxrCpApo7JzLWBoKMH4t7gQ21NmbUN+JoYk2lQnRK
	 PDhmUl7GEWhXohRlU/cQCKEVDBYeuY/+uOzPaZFPrrnBbZay9+o/vTrl3ruk1QV3JJ
	 YmZ7+SErI+S8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] hwmon: (axi-fan-control) Remove redundant
 dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720063745.309331-2-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-2-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:47:53 +0000
Message-Id: <20260720064753.75BA91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Widespread missing 64-bit casts and unsigned logic errors across s=
ysfs and interrupt callbacks lead to arithmetic overflows on 32-bit archite=
ctures, emitting invalid hardware configurations and garbage telemetry data.
- [High] The `fan_fault` state is concurrently accessed by the interrupt ha=
ndler thread and sysfs reads without locking, directly violating the hwmon =
subsystem synchronization guidelines.
- [High] The hardware is left active, out of reset, and with unmasked hardw=
are interrupts upon probe failure or module unload.
--

--- Patch [1]: [PATCH v2 1/7] hwmon: (axi-fan-control) Remove redundant dev=
_err_probe() ---
commit df8b06ee0f4291234f7eb4185e5e9fddf05147c5
Author: Pan Chuang <panchuang@vivo.com>

hwmon: (axi-fan-control) Remove redundant dev_err_probe()

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -508,8 +508,7 @@ static int axi_fan_control_probe(struct platform_devi=
ce *pdev)
>  					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>  					NULL, ctl);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "failed to request an irq\n");
> +		return ret;

[Severity: High]
This is a pre-existing issue, but if devm_request_threaded_irq() fails here,
does the hardware remain active and out of reset?

axi_fan_control_init() writes to ADI_REG_IRQ_MASK to enable interrupts and
ADI_REG_RSTN to bring the hardware out of reset. If the probe fails at this
point, there doesn't seem to be any cleanup to quiesce the hardware.

There also doesn't appear to be a .remove callback to handle module unload.

[Severity: High]
This isn't a bug introduced by this patch, but do these calculations overfl=
ow
on 32-bit architectures?

drivers/hwmon/axi-fan-control.c:axi_fan_control_get_fan_rpm() {
    ...
    return DIV_ROUND_CLOSEST(60 * ctl->clk_rate, ctl->ppr * tach);
    ...
}

For standard clock rates like 100MHz, 60 * ctl->clk_rate would evaluate to
6,000,000,000, which unconditionally overflows a 32-bit unsigned integer.

Similarly, in axi_fan_control_read_temp():

drivers/hwmon/axi-fan-control.c:axi_fan_control_read_temp() {
    ...
    *val =3D ((raw_temp * 501374) >> 16) - 273677;
    ...
}

For 16-bit ADC values, raw_temp * 501374 exceeds 32-bit signed limits.

Additionally, in axi_fan_control_show(), if the calculated value is negativ=
e,
does the subtraction of 280230 underflow into a large positive number since=
 it
is stored in a u32?

[Severity: High]
This is a pre-existing issue, but is there a missing lock around the fan_fa=
ult
state?

drivers/hwmon/axi-fan-control.c:axi_fan_control_read_fan() {
    ...
    *val =3D ctl->fan_fault;
    /* clear it now */
    ctl->fan_fault =3D 0;
    ...
}

If the hardware triggers an ADI_IRQ_SRC_TACH_ERR interrupt right between the
read and the clear, will the interrupt handler's update be lost?

drivers/hwmon/axi-fan-control.c:axi_fan_control_irq_handler() {
    ...
    if (irq_pending & ADI_IRQ_SRC_TACH_ERR)
        ctl->fan_fault =3D 1;
    ...
}

It seems this state is accessed concurrently by the interrupt handler thread
and sysfs reads without locking, which might lead to dropped fault indicato=
rs.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720063745.3093=
31-1-panchuang@vivo.com?part=3D1
