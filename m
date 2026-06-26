Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C03CB2D0
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 05:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452857; cv=none; b=jbIe447ZxMEqSvNhl/Frjx52XJEsoPdy8OCOeVAKnUorgxov6s7na4ZrLGjsM/QeyNxYp0UwbgrTmgwE9SBmVN9kjnbQqVh1hqnFOxnyNBaR40FnIKql3eNt/LrSgcKOaI1HAQrK7wlsac/6VHlvQzYypRrCgB9iNEoxJN1bvnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452857; c=relaxed/simple;
	bh=+wx2dDISqwKGKER1lbWax5uhOUAY0wvKR6bE7XPlXN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GvK6WWp9cXmHYeVfTx2yW42izisYoSScFNceTota4fW6PAhn5OC7mcXwIkAjY0Q6cH1dunOlpvCREqXBYREh1p8E9Vh+hR8aIHNsV4KNHCfhPuZZj7aF2/UA/wM0LEw4AM8+6w6UckpZxff+MMgVVE60bFfOTpHwBZKkY7Iqwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkWBv+4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkWBv+4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BA51F00A3A;
	Fri, 26 Jun 2026 05:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782452855;
	bh=Oo/h+3NDFYHZSf+5/7bv/im0tVAjBGLEfjDG3zF+N30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AkWBv+4td1N1/aQG7lSWvrCXCoZHCZMxOmxgg7FhFgTw412KXa2IppIUyx3LVM/gM
	 hAcJQImOWSh0ffhzX852/sg++TGg4QjJPWU+Fun6ujbYHJ+EQYSADQaGVjy6AIMr/r
	 WW99pKJKTdPdM8txa9QtjC1pzF2Wfk/DxBfuNOZliU2mDi1hFycnZT6dG6OxzWUkW6
	 8O4OZIMuTGWmVFjIBs0UdrA4WT3dHg34vj46OeH3zfdsV73wVYsSbtC7zqS3xEzBNd
	 f6ryn2yPF36aZvs3AbEOS212P5aQIAoK0ocxdMsidOE1Sy39+2aZ6eVUysCXb7iHTO
	 H0VhxIJy0RsQQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v5] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Yeo" <alexyeo362@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260626053235.25834-1-alexyeo362@gmail.com>
References: <20260626033411.4C2C61F000E9@smtp.kernel.org>
 <20260626053235.25834-1-alexyeo362@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 05:47:35 +0000
Message-Id: <20260626054735.81BA51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Returning `100` (max_state) for the thermal cooling device's curre=
nt state when in AUTO mode defeats the thermal governor and permanently deg=
rades cooling.
- [Medium] The driver assigns standard Linux error codes to an `acpi_status=
` variable and evaluates them using `ACPI_FAILURE()`.
- [Medium] The `pcc_pwm_fan_hwmon_read` function lacks bounds checking for =
the raw PWM speed returned by the hardware, potentially violating the hwmon=
 ABI.
- [Low] The driver introduces a private mutex (`pwm_fan_lock`) instead of u=
sing the hwmon subsystem's locking mechanism.
- [Low] The global `quirks` variable is assigned in a DMI callback but neve=
r used.
--

commit bc34c0a562a71eb6eb4101fca6fd721a3d653df2
Author: Alex Yeo <alexyeo362@gmail.com>

platform/x86: panasonic-laptop: add fan speed mode for newer models

This commit adds fan speed and mode support for newer Panasonic laptop mode=
ls=20
like the CF-SR4. It utilizes ACPI methods to read and write the fan profile=
=20
and registers the fan with both the hwmon and thermal subsystems.

> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x=
86/panasonic-laptop.c
> index b83113c26f885..a1837106ff6b1 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
[ ... ]
> @@ -238,19 +258,53 @@ static const struct key_entry panasonic_keymap[] =
=3D {
>  };
> =20
>  struct pcc_acpi {
[ ... ]
> +	struct thermal_cooling_device	*pwm_fan_cdev;
> +	struct device			*pwm_fan_hwmon;
> +	struct mutex			pwm_fan_lock;

[Severity: Low]
Does this driver need a private mutex for the hwmon attributes?=20

The hardware monitoring subsystem guidelines dictate using hwmon_lock() and=
=20
hwmon_unlock() for attributes registered outside the core, rather than=20
implementing a driver-specific lock.

>  };
> +
> +/*
> + * Declare quirks and apply matches
> + */
> +static struct quirk_entry *quirks;
> +
> +static struct quirk_entry quirk_cf_sr4 =3D {
> +	.has_ospm_pwm_fan =3D true,
> +};
> +
> +/* DMI matching for quirks copied from asus-nb-wmi.c */
> +static int dmi_matched(const struct dmi_system_id *dmi)
> +{
> +	pr_info("Identified laptop model '%s'\n", dmi->ident);
> +	quirks =3D dmi->driver_data;

[Severity: Low]
Is this global quirks variable necessary?=20

The dmi_matched() callback assigns the matched data here, but the driver=20
appears to ignore this global variable later, instead directly assigning=20
pcc->quirks =3D dmi_id->driver_data during probe.

> +	return 1;
> +}
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
> +	struct pcc_acpi *pcc;
> +	acpi_status status;
> +	int pwm_speed;
> +	int pwm_mode;
> +	int result;
> +
> +	pcc =3D dev_get_drvdata(dev);
> +
> +	if (type !=3D hwmon_pwm)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		mutex_lock(&pcc->pwm_fan_lock);
> +
> +		status =3D pcc_pwm_fan_speed_read(&pwm_speed);
> +		if (ACPI_FAILURE(status)) {
> +			result =3D status;

[Severity: Medium]
Does this safely mix Linux error codes with ACPI status codes?

Helper functions like pcc_pwm_fan_speed_read() return negative standard
Linux error codes (e.g., -EINVAL), but here they are assigned to an
acpi_status variable and evaluated with ACPI_FAILURE().

While ACPI_FAILURE() might evaluate to true for negative values due to two's
complement representation, it violates the ACPICA API contract and can lead
to swallowed or mangled error codes being passed back to userspace.

> +		} else {
> +			*val =3D (pwm_speed * 255) / 100;

[Severity: Medium]
Could this calculation expose an out-of-bounds value to userspace?=20

If the ACPI method returns a value greater than 100 (which can happen for=20
unknown or indeterminate states like 255), this unchecked math will produce=
=20
a value outside the standard 0-255 range mandated by the hwmon ABI for=20
pwm attributes.

> +			result =3D 0;
> +		}
> +
> +		mutex_unlock(&pcc->pwm_fan_lock);
> +		return result;
[ ... ]
> +static int
> +pcc_pwm_fan_thermal_get_current_pwm(struct thermal_cooling_device *cdev,
> +				    unsigned long *state)
> +{
> +	struct pcc_acpi *pcc;
> +	acpi_status status;
> +	int current_pwm;
> +	int pwm_mode;
> +	int result;
> +
> +	pcc =3D cdev->devdata;
> +
> +	mutex_lock(&pcc->pwm_fan_lock);
> +
> +	status =3D pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("%s: failed to get fan pwm mode\n", __func__);
> +		result =3D -ENODATA;
> +		goto out;
> +	}
> +	if (pwm_mode =3D=3D HWMON_PCC_FAN_PWM_AUTO) {
> +		*state =3D 100; /* Return failsafe value on EC mode */

[Severity: High]
Does returning 100 (the maximum state) while in AUTO mode paralyze the
thermal governor?

If the system overheats while the fan is in AUTO mode, the step_wise
governor will read the current state as 100 and assume it is at maximum
cooling capacity, doing nothing to ramp up the fan.

When the temperature drops, it will decrease the state to 99, invoking
set_cur_state(99). This immediately and permanently switches the fan to
MANUAL mode, which has a lower maximum speed limit than AUTO mode, degrading
cooling performance permanently.

> +		result =3D 0;
> +		goto out;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626053235.2583=
4-1-alexyeo362@gmail.com?part=3D1
