Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9D23507C
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 03:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444853; cv=none; b=Bh2GL8yl+HbjySyDXwuwlF4/2rq2aGen4aGSgOV9/QU1/OalEvyKPj22RZlWTl9mW9F6TXq77Acsz08QWtI0VsE7ql5n+LAM7zOMF3gRqU4unlBPsn2VlFI3GkyLorJ0mhmrXteWS8l4U47za804767n6sN5NdpKgXMZRYOW4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444853; c=relaxed/simple;
	bh=RMyRX7hYQF3fG9ORU83OnOZatl6VveOFTOMXdpMlFpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eOKkOszpmE6o8o+7VHSoGEXoXalB8KxAV7mEyw8PWxhNkzK2D/nSUNspsD4ITx+ELPiGUwFg4Ray5tAo3peP1RLsWV/8VG1Z8zZoaNftmAZN4i1TirsKsOe/n5pl9j3BIC98/ZbtCdy0Y17szYomYLWPzVzTJjJSeOp8UQcFMgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJF5DAIr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJF5DAIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2C61F000E9;
	Fri, 26 Jun 2026 03:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782444851;
	bh=jWDwhGRR9qishUJI6+sK8R20d6409serPLHv5xt7VSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJF5DAIraY7si2+QZ3jpOAZh8MHYjXN1IooLtQHbRwOIo7u21AWjjUHlFk/VJU1XS
	 NNAT1HljNL+8aKIWZAIY/OmtD1D+0mcznG7bKagN6y2xNVkW5CwbiIvqSGo6m3Blx1
	 uQ18svm1XsJsYjBEZUZ89QQktMtwr4yGchZVscpmV/6cjDZJPA2Uf2rW58fYkJlez3
	 eZjLaAWft/oJsSeduMXJfrn4S9UL+xITzh5o0XY/XvdFLeWY8kAOQNmOhNUIDy53uZ
	 YZJ2UUDzcOjVfmOXrzBvLAemG59e2st1zSfSA6wv0xl4U/mA7mIL1R9FcJzSFx6a5W
	 sI6ZYUvUOTa7w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Yeo" <alexyeo362@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260626032524.22530-1-alexyeo362@gmail.com>
References: <20260625120432.BB3D21F000E9@smtp.kernel.org>
 <20260626032524.22530-1-alexyeo362@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 03:34:10 +0000
Message-Id: <20260626033411.4C2C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The returned hwmon device pointer from `hwmon_device_register_with=
_info` is never assigned to `pcc->pwm_fan_hwmon` on success.
- [Medium] Missing control flow abort after an error in `pcc_pwm_fan_hwmon_=
read` allows the evaluation of an uninitialized stack variable.
- [Medium] Mixing POSIX error codes with `acpi_status` types causes continu=
ous kernel log spam when reading the hwmon PWM attribute in AUTO mode.
- [Medium] Writing 'auto' mode via the hwmon sysfs interface erroneously pa=
sses a hwmon constant to the hardware ACPI function, forcing the hardware i=
nto 'manual' mode instead.
--

commit 0a2b607080f828361b9b1616ec43f15ca1686629
Author: Alex Yeo <alexyeo362@gmail.com>

platform/x86: panasonic-laptop: add fan speed mode for newer models

This patch introduces fan speed mode control for newer Panasonic laptop mod=
els,
specifically the CF-SR4. It adds ACPI-based reading and writing of PWM fan
speeds and modes, exposing them through hwmon and thermal sysfs interfaces.

> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x=
86/panasonic-laptop.c
> index b83113c26f885..ab1e0e549b300 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
[ ... ]
> @@ -507,6 +560,179 @@ static int set_optd_power_state(int new_state)
>  	return result;
>  }
> =20
> +/* get OSPM fan mode */
> +
> +static int pcc_pwm_fan_mode_read(int *pwm_mode)
> +{
[ ... ]
> +/* read PWM fan speed */
> +
> +static int pcc_pwm_fan_speed_read(int *pwm_speed)
> +{
[ ... ]
> +	if (pwm_mode =3D=3D HWMON_PCC_FAN_PWM_AUTO) {
> +		result =3D -ENODATA; /* Indeterminate value */
> +		goto out;
> +	}

This successfully returns the POSIX error -ENODATA when the fan is in autom=
atic
mode. I will reference this below.

[ ... ]
> +/* set PWM fan speed */
> +
> +static int pcc_pwm_fan_speed_set(int set_pwm_speed)
> +{
[ ... ]
> +	if (pwm_mode =3D=3D HWMON_PCC_FAN_PWM_AUTO) {
> +		status =3D pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);

[Severity: Medium]
Are we passing the wrong constant here? HWMON_PCC_FAN_PWM_MANUAL is defined
for the hwmon sysfs interface. Does pcc_pwm_fan_mode_set() expect the hardw=
are
constant ACPI_PCC_FAN_PWM_MANUAL instead?

[ ... ]
> @@ -825,6 +1052,240 @@ static const struct attribute_group pcc_attr_group=
 =3D {
>  	.is_visible	=3D pcc_sysfs_is_visible,
>  };
> =20
> +/* hwmon */
[ ... ]
> +static int pcc_pwm_fan_hwmon_read(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int channel, long *val)
> +{
[ ... ]
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		mutex_lock(&pcc->pwm_fan_lock);
> +
> +		status =3D pcc_pwm_fan_speed_read(&pwm_speed);
> +		if (ACPI_FAILURE(status)) {
> +			pr_err("%s: failed to get fan pwm speed\n", __func__);
> +			result =3D -ENODATA;
> +		} else {

[Severity: Medium]
Will this cause continuous kernel log spam when the fan is in auto mode?

As noted above, pcc_pwm_fan_speed_read() returns the POSIX error -ENODATA w=
hen
in automatic mode. Here, the caller receives this negative integer into an
acpi_status variable.

Since -ENODATA is non-zero, ACPI_FAILURE() evaluates to true, which triggers
the error log. This could flood dmesg if userspace tools periodically read =
the
hwmon attribute while the fan is in auto mode.

[ ... ]
> +	case hwmon_pwm_enable:
> +		mutex_lock(&pcc->pwm_fan_lock);
> +
> +		status =3D pcc_pwm_fan_mode_read(&pwm_mode);
> +		if (ACPI_FAILURE(status)) {
> +			pr_err("%s: failed to get fan pwm mode\n", __func__);
> +			result =3D -ENODATA;
> +		}
> +		if (pwm_mode =3D=3D HWMON_PCC_FAN_PWM_AUTO) {

[Severity: Medium]
If pcc_pwm_fan_mode_read() fails, we log an error and set result =3D -ENODA=
TA,
but execution continues to the next line. Does this mean we might evaluate =
the
uninitialized stack variable pwm_mode? Should there be a break or goto
statement in the error path?

[ ... ]
> +static int pcc_pwm_fan_hwmon_write(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, long val)
> +{
[ ... ]
> +	switch (attr) {
> +	case hwmon_pwm_enable:
> +		if (val =3D=3D HWMON_PCC_FAN_PWM_AUTO) {
> +			mutex_lock(&pcc->pwm_fan_lock);
> +			status =3D pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_AUTO);

[Severity: Medium]
Is the wrong constant being passed to pcc_pwm_fan_mode_set() here?

val =3D=3D HWMON_PCC_FAN_PWM_AUTO matches the hwmon constant (2). However,
passing HWMON_PCC_FAN_PWM_AUTO to pcc_pwm_fan_mode_set() means we are sendi=
ng
2 to the ACPI firmware instead of the expected hardware constant
ACPI_PCC_FAN_PWM_AUTO (0).

Since the firmware treats any value >0 as manual mode, does writing 'auto'
(2) to the sysfs attribute inadvertently force the hardware into manual mod=
e?

[ ... ]
> @@ -1097,6 +1571,39 @@ static int acpi_pcc_hotkey_probe(struct platform_d=
evice *pdev)
>  	}
> =20
>  	i8042_install_filter(panasonic_i8042_filter, NULL);
> +
> +	/* check quirks */
> +	if (pcc->quirks) {
> +		/* has_ospm_pwm_fan - add hwmon and thermal if present */
> +		if (pcc->quirks->has_ospm_pwm_fan) {
> +			mutex_init(&pcc->pwm_fan_lock);
> +
> +			pr_info("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->iden=
t);
> +
> +			hwmon_dev =3D hwmon_device_register_with_info(
> +				&pdev->dev, "panasonic_pwm_fan", pcc,
> +				&pcc_pwm_fan_hwmon_chip_info, NULL);
> +			if (IS_ERR(hwmon_dev)) {
> +				pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
> +				/* not a critical error. just skip if error */
> +				pcc->pwm_fan_hwmon =3D NULL;
> +			}

[Severity: High]
If hwmon_device_register_with_info() succeeds, we never assign hwmon_dev to
pcc->pwm_fan_hwmon.

Because pcc->pwm_fan_hwmon remains NULL, the success path behaves as if the
registration failed when checking for cleanup.

> +
> +			/* proceed with thermal */
> +			pr_info("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->id=
ent);
> +			pcc->pwm_fan_cdev =3D thermal_cooling_device_register(
> +				"Panasonic_PWM_Fan", pcc, &pcc_pwm_fan_cdev_ops);
> +			if (IS_ERR(pcc->pwm_fan_cdev)) {
> +				pr_warn("has_ospm_pwm_fan: Failed to register thermal cdev\n");
> +				pcc->pwm_fan_cdev =3D NULL;
> +			}
> +
> +			/* cleanup: destroy mutex if both hwmon and thermal failed */
> +			if (!pcc->pwm_fan_hwmon && !pcc->pwm_fan_cdev)
> +				mutex_destroy(&pcc->pwm_fan_lock);

Since pcc->pwm_fan_hwmon is still NULL upon successful hwmon registration, =
if
thermal registration fails here, won't we prematurely destroy the mutex whi=
le
the hwmon device is still active and potentially using it?

[ ... ]
> @@ -1124,6 +1631,13 @@ static void acpi_pcc_hotkey_remove(struct platform=
_device *pdev)
>  	struct acpi_device *device =3D ACPI_COMPANION(&pdev->dev);
>  	struct pcc_acpi *pcc =3D acpi_driver_data(device);
> =20
> +	if (pcc->pwm_fan_hwmon)
> +		hwmon_device_unregister(pcc->pwm_fan_hwmon);

Because pcc->pwm_fan_hwmon was never assigned, this unregistration is bypas=
sed
on module unload. This will leak the hwmon device and leave its sysfs attri=
butes
active. Accessing them after the module is unloaded would dereference freed
memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626032524.2253=
0-1-alexyeo362@gmail.com?part=3D1
