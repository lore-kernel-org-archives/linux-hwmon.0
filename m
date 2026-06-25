Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB63A7F6D
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389074; cv=none; b=TSk/72JBgcJ3uS8SnBo2XZ6uZ31d2uUv6ydgyj0ONRUZVJKmR2+sEzrdnL3gmk5jaPMxRN1GjVFUOcAssD67arStuS+pkDz5XiKPSm0VF+x+yZOcw5ISeh6VANjFfAPBGR+cugjwa38JdqqlUb7vocx6DwRL/xyUc39Onbu2RJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389074; c=relaxed/simple;
	bh=3KKaogSChmqXczghRhaMKMnObqBD0LCyBLky3WIbdGA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N7monf5EZNS4es/yMDwKTZncn4h5uDmAWpCBpHivhLX4raJJJfOkwK4xDl5HlH2qqLZBOxHiLdAHag+pSxlxFW/fXTgJP3h6hWxdRF8wNqiH6+NnJ7+d5brnLCLkLTvsu3kA19qnbV8Fjewf6tE3RmuXq8xLYIzAB57wBwm3PmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUHOUWWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUHOUWWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3D21F000E9;
	Thu, 25 Jun 2026 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389072;
	bh=8LUWw13dqACwxcqkPUrd3LuyTlMzMvsQnxfv/PioodA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KUHOUWWUgtBAfVOckei0xs0VHQtMmCjrH+07x4zxVAHZ3gMLLjgV3w8EbIYBvFiXJ
	 k/fquCbJ+QMRAe0DsFRwqvodBNI1wmn76+NhV9BjYilN7kQJ0AvrjMEY+rUu9hdNuy
	 /09IpUuVYefB4gYy85jQfR8b7M8IqE7B64+xaVd9mJkxjsaTZYTq6dQ6P+51dcU+SJ
	 slM6yHFw69kMzzfznrqjQsvcKH7Msn7mT5evQIyRbhkN/IhzuSsdhk5qaa9Z+EHccS
	 BlrXpnbUKh94z4eUxm6uj+exVKTe9kOKdFHWyWQ1emYfStBFIUmrWlYO9fSwQ9pJ+/
	 ydHTzP2oP1M5A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Yeo" <alexyeo362@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260625115034.773908-1-alexyeo362@gmail.com>
References: <b687f9d8-a996-2f04-d803-e267cf140b57@linux.intel.com>
 <20260625115034.773908-1-alexyeo362@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 12:04:32 +0000
Message-Id: <20260625120432.BB3D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Unconditional NULL pointer dereference on hardware without DMI qui=
rks.
- [High] Resource leak and potential Use-After-Free due to direct return on=
 probe error.
- [High] Race condition between hwmon sysfs and thermal cooling device oper=
ations.
- [Medium] Violation of hwmon ABI for 'pwm_enable' attribute.
- [Low] Compilation error due to missing 'quirks' field in 'struct pcc_acpi=
'.
- [Low] Always-false boundary check due to unsigned comparison.
- [Low] Idiomatically incorrect header inclusion for errno.
--

commit 62f80e95f10c4cb2e0e4a1e3a89a9f92dd8d3a2e
Author: Alex Yeo <alexyeo362@gmail.com>
Subject: platform/x86: panasonic-laptop: add fan speed mode for newer models

Summary: This patch adds fan speed mode support for newer Panasonic laptop
models, registering hwmon and thermal cooling devices. It relies on DMI qui=
rks
to enable this feature and evaluates ACPI methods for retrieving and setting
the fan speeds.

> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x=
86/panasonic-laptop.c
> index b83113c26f885..7774620b27635 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -136,6 +139,12 @@
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <acpi/video.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/thermal.h>
> +#include <linux/dmi.h>
> +#include <asm-generic/errno.h>

[Severity: Low]
Should this include <linux/errno.h> instead? It is usually preferred for
device drivers to use the generic linux header rather than the
architecture-specific one to ensure cross-architecture compatibility.

[ ... ]

>  struct pcc_acpi {
> -	acpi_handle		handle;
> -	unsigned long		num_sifr;
[ ... ]
> -	struct platform_device	*platform;
> +	acpi_handle			handle;
[ ... ]
> +	struct platform_device		*platform;
> +	struct thermal_cooling_device	*pwm_fan_cdev;
> +};

[Severity: Low]
Does struct pcc_acpi miss the definition for the 'quirks' field? Later in
the patch, the probe function assigns to pcc->quirks, which will cause a
compilation error since it is not defined in this struct.

[ ... ]

> +static int pcc_pwm_fan_speed_set(int set_pwm_speed)
> +{
> +	struct acpi_object_list input;
> +	union acpi_object param[1];
> +	acpi_status status;
> +	int pwm_mode;
> +	int result;
> +
> +	/* Get fan status. set to manual if not set */
> +	status =3D pcc_pwm_fan_mode_read(&pwm_mode);
[ ... ]
> +	if (pwm_mode =3D=3D HWMON_PCC_FAN_PWM_AUTO) {
> +		status =3D pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);
[ ... ]
> +	status =3D acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FSL",
> +				      &input, NULL);

[Severity: High]
Could this sequence race with other operations? This multi-step process
of reading the mode, changing it, and setting the speed isn't protected
by a lock. Since the thermal subsystem might poll this while userspace
writes to hwmon sysfs concurrently, could this interleave and corrupt the
hardware state?

[ ... ]

> +static int pcc_pwm_fan_hwmon_read(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int channel, long *val)
> +{
[ ... ]
> +	case hwmon_pwm_enable:
> +		status =3D pcc_pwm_fan_mode_read(&pwm_mode);
[ ... ]
> +		if (pwm_mode =3D=3D HWMON_PCC_FAN_PWM_AUTO) {
> +			*val =3D HWMON_PCC_FAN_PWM_AUTO;
> +		} else if (pwm_mode =3D=3D HWMON_PCC_FAN_PWM_MANUAL) {

[Severity: Medium]
Is this returning the correct hwmon ABI value for automatic mode?
HWMON_PCC_FAN_PWM_AUTO is defined as 0, but the standard hwmon ABI expects
2 for automatic mode (and 1 for manual). This might confuse standard
userspace tools like fancontrol. This same ABI mismatch appears in
pcc_pwm_fan_hwmon_write() as well.

[ ... ]

> +static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device=
 *cdev,
> +					   unsigned long state)
> +{
> +	acpi_status status;
> +	int set_pwm;
> +
> +	if (state > 100 || state < 0)
> +		return -EINVAL;

[Severity: Low]
Can 'state < 0' ever evaluate to true here? Since 'state' is an unsigned
long, it cannot be negative, making this check mathematically impossible.

[ ... ]

> @@ -981,8 +1377,10 @@ static int acpi_pcc_hotkey_resume(struct device *de=
v)
> =20
>  static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  {
[ ... ]
> +	/*
> +	 * Perform quirk detection
> +	 */
> +	dmi_id =3D dmi_first_match(pcc_quirks);
> +	if (dmi_id) {
> +		pcc->quirks =3D dmi_id->driver_data;
> +		pr_info("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
> +	} else {
> +		pcc->quirks =3D NULL;
> +	}

[ ... ]

> +	/* has_ospm_pwm_fan - add hwmon and thermal if present */
> +	if (pcc->quirks->has_ospm_pwm_fan) {

[Severity: High]
Will this dereference a NULL pointer on unsupported models? If the DMI
match fails, pcc->quirks is explicitly set to NULL above. Checking
pcc->quirks->has_ospm_pwm_fan right after will cause a kernel panic
during the device probe on those unquirked devices.

> +		pr_info("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident=
);
> +		hwmon_dev =3D devm_hwmon_device_register_with_info(
> +			&pdev->dev, "panasonic_pwm_fan", NULL,
> +			&pcc_pwm_fan_hwmon_chip_info, NULL);
> +		if (IS_ERR(hwmon_dev)) {
> +			pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
> +			return PTR_ERR(hwmon_dev);
> +		}

[Severity: High]
Does this direct return bypass the error cleanup sequence? Standard failure
paths in this function use 'goto out_notify_handler;' (and other labels) to
clean up resources. Returning directly leaks memory and leaves the ACPI
notify handler and input devices registered. If the module is later
unloaded, could this trigger a use-after-free when ACPI events fire?

> +
> +		pr_info("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ide=
nt);
> +		pcc->pwm_fan_cdev =3D thermal_cooling_device_register(
> +			"Panasonic_PWM_Fan", NULL, &pcc_pwm_fan_cdev_ops);

[Severity: High]
Does registering the thermal cooling device directly bypass the hwmon core
serialization? The subsystem guidelines indicate that thermal and sysfs
operations are serialized by the hwmon core if attributes are registered
via the 'info' parameter. Registering this manually out-of-band seems to
leave the thermal polling operations unprotected, exposing the race
condition in pcc_pwm_fan_speed_set() mentioned earlier.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625115034.7739=
08-1-alexyeo362@gmail.com?part=3D1
