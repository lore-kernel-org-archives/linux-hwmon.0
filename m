Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FD221C9EA
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 02:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056925; cv=none; b=ZaETXC+xqfDA9UAD9vJjbW+VpDIPlwGpCdxqPCgMEZQjep+5KctNSC/R0Emd21qHfXlxTsbkpgc2qs2aRDC4/lc2FYF/iRUMkYvYFtnwkNdho/ufQQAwK+nZAZxaKWOhQikNnytYwG01X7rbMB6WfGmx8JiyV3588nxCXZHrr3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056925; c=relaxed/simple;
	bh=WRH2e+Sd5Da7gg1OJRJg+7WCHDUR8IL1/o0fCmw1DVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PSH8wThmo1+exgYuTM5+yg/shRlpHSyDF4nxhVvrci3R1Fpc6bd0aeqP1uY6zYsyCM2tVSyBVp7ZamxnN0SswhiGnUeRxcbeojQhai6Ptq9KPHXRsdryr/z2uQFKDwFQ9KdcF8WsbQLaVVzItljl4wyLNidEvN5DUcI5FobkvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WB5per81; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WB5per81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547B31F00893;
	Wed, 10 Jun 2026 02:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781056924;
	bh=l36yFklyC8eWryLblPDAw4NehPH+Bw/n0arzI+acmWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WB5per817l76CVaOYNG4FoJFdPWOZrWxczHYTOS3yV5LIyLeq0NJib4OxMWezXRyu
	 ZLOp0k+rkdbR/VHPwbQliIbrOELaAbyZvlU2I+Qwn70ZfFM8lVDW/y6PiQMBC55i2c
	 DHs47GPoXPWlbxUO/Uothl1CUfJmKBIfAFVaRY8pz6ZcJsAO4VicJbWDdx7ZCXmnzU
	 Fw7lpQN/gVYJAsX0qZjTSBPyiHjwMXcpcPReDIkVliPNNWLNHskkCSx3aca6B+6tpx
	 xHujctVoxjbKZ5XznWl/9UeEr7N+CPcCkPG55nVzoUd4Q+Qm5DJV+SirNokQteePEQ
	 RO7z5WHwtQiIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] hwmon: (gpd-fan): Initialize EC before
 registering hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pei Xiao" <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <4be3734b135c8013157979ab5e80c7ee51243ddd.1781055639.git.xiaopei01@kylinos.cn>
References: <4be3734b135c8013157979ab5e80c7ee51243ddd.1781055639.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 02:02:03 +0000
Message-Id: <20260610020204.547B31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Reading the PWM value causes an arithmetic underflow and returns a=
 negative error code when the hardware value is 0.
- [High] The driver permanently claims standard globally multiplexed Super =
I/O ports using `devm_request_region()`, breaking x86 concurrency and causi=
ng a Denial of Service for other drivers.
- [High] Missing suspend/resume power management callbacks to re-initialize=
 the EC state after system sleep.
--

commit 5f38d453c010b9c77f2e24db2a05033fcf65d138
Author: Pei Xiao <xiaopei01@kylinos.cn>

hwmon: (gpd-fan): Initialize EC before registering hwmon device

The commit moves the gpd_init_ec() call to happen before registering
the hwmon device. This prevents a window where sysfs reads could
return invalid values if the EC is not yet initialized.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 7284babd4f5c9..745b3fb9e3a49 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
> =20
>  	dev_set_drvdata(dev, data);
> =20
> +	gpd_init_ec(data);

[Severity: High]
This isn't a bug introduced by this patch, but since we are initializing the
EC here due to buggy firmware losing its state, does the EC also lose its
state across system sleep transitions?

Looking at gpd_fan_driver, the platform driver is missing power management
callbacks (pm_ops) for suspend and resume. When the system returns from
S3 suspend-to-RAM, will the EC return to an uninitialized state and silently
break thermal fan control since there is no resume hook to re-invoke
gpd_init_ec()?

Also, this is a pre-existing issue, but does using devm_request_region() in
gpd_fan_probe() permanently claim the globally multiplexed Super I/O ports
(0x2E-0x2F or 0x4E-0x4F)?

These ports are heavily shared across the motherboard. Standard practice is=
 to
lock them dynamically for a single transaction using request_muxed_region()=
. By
locking them permanently via devm_request_region(), does this prevent other
drivers from claiming the multiplexer and cause them to fail probing?

Additionally, when interacting with these ports in gpd_ecram_read() and
gpd_ecram_write(), the multi-step outb/inb sequences are executed without a=
ny
locking. Could this race dangerously with other subsystems or ACPI?

>  	hwdev =3D devm_hwmon_device_register_with_info(dev,
>  						     DRIVER_NAME,
>  						     data,
>  						     &gpd_fan_chip_info,
>  						     NULL);
>  	if (IS_ERR(hwdev))
>  		return dev_err_probe(dev, PTR_ERR(hwdev),
>  				     "Failed to register hwmon device\n");
> -
> -	gpd_init_ec(data);
> -
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but could the calculation in gpd_wm2_read_pwm=
()
underflow and propagate a negative error code to userspace?

drivers/hwmon/gpd-fan.c:gpd_wm2_read_pwm() {
	...
	u8 var;

	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);

	// Match gpd_generic_write_pwm(u8) below
	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
}

If the hardware returns a PWM value of 0, (var - 1) promotes to a signed in=
teger
and evaluates to -1. Multiplying by 255 and dividing propagates this negati=
ve
result, causing the function to return a negative value, which is then repo=
rted
to userspace as a negative error code (e.g., -EPERM) instead of gracefully
reporting a valid 0 PWM state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781055639.gi=
t.xiaopei01@kylinos.cn?part=3D2
