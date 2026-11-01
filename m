Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530848;
	b=GQUq+uZTUU8iNuAbry/kJL3rEvyyFtAJ5pfDSbbeBAWBICvwB+9a5zBUDvmeaC4fPkBW
	 jiSPK0VjKzMHuiL5Cjmga0L1Bek7RopqrvMelkuAHByhyR0yX6xHdv1hOtO3VWfq3BK3A
	 vGXbY+XK/CO9kIVG5TrU/XAVLCHBFdfGiRgxzuMPitjQSuok1Ia5YVyIaT6+adGhQ2jZ/
	 P1d6XJQ0ZCA3C8uiBjWQaEuWPeEZBBpwMLdw9gH57Pb3ZKFSlgFR/jUeWDFQNbqJpuV3j
	 G6egcd5GgMsb5+KTMZCx+7T+lM9Qsvbh93alEIfJGwldUipG9XX6TMI/vPJ+JYCkRlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530848;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kW5XFbKMTbFoUxqDLFrPb8lr3xiTGLB1FEmQG5hRHIg=;
	b=UB4KQSrw3sb7cr3HPQWn9dYnpfZ6e21ujG0MqxyzS4tmet3gbCyODgTzVS9V2vWlZJHK
	 W1RnwGHtc/YNrccEt+m0NgbSs0L55W10wPGwLvH67ca973Tbb43d0BiUgkIJSYkrrYCxP
	 1pPbCJOmDNxiDi/dDLTJOgc+cuVZ2q9/AmJGOGofu/gS4GBymN9mfuSTwsikWpg3Q2nVm
	 6zNbF0hlw6C+aYxoEysHdWqL7mw2C9Sqoww+UetmXVmFFcSdoHXS6fU3QzdGdQlaBHNHv
	 YPH+GYSarmR/FkFemXkKSPI6lBATSppb+sJpkQ+5tOAJsf/y04Q/8HXrqvJaYActbhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QnO1KiC6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FA606A325
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QnO1KiC6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346CF1F00919;
	Sun,  1 Nov 2026 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530847;
	bh=kW5XFbKMTbFoUxqDLFrPb8lr3xiTGLB1FEmQG5hRHIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QnO1KiC6eq7+8UXbDvzAs2Dbpa1z3HTGGkAezM/SR0CBn/GnrKrRluGTgnD6cp59v
	 r8b+S7i472kKwj4I8Q5eX6pBu5TouZFfH3HOYVCqLi/OUXlFmv2TYdUl6gl4SAAnzx
	 ULopsh85/oIq2VwSQ6YYglnSI8fOzvsMj2lCzOhkrU2QWGxO/gkNvl47PXNl1dCW9p
	 Om0P1alyZzy++LKGs94Vp/8bWcRCa2dwuTF/FyJ+zpH+jwY35Xm7qSeV10oqFro46v
	 j0NLtG+zwuNZcQ8MJNsyMOjZfancDIWeLr1nw2DFtUj4YRrTMx2VQLCbLgqBL2Nv7T
	 eayTQbF6R2kUQ==
Message-ID: <sashiko-outbox-192371@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] platform/x86: asus-wmi: show the effective duty for
 enabled curves
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartu Alev" <bartualev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101-asus-fan-floors-v4-v1-7-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
 <20261101-asus-fan-floors-v4-v1-7-b8d1c31a99a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 11:00:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] platform/x86: asus-wmi: missing fan_curve_notify() on curve disa=
ble paths
- [Low] platform/x86: asus-wmi: duplicate fan_curve_notify() on curve disab=
le
--

commit d8679565f78ed87d40eb465628808366a670ad22
Author: Bartu Alev <bartualev@gmail.com>

platform/x86: asus-wmi: show the effective duty for enabled curves

This commit changes fan_curve_show() to return the maximum of the stored du=
ty
and the firmware floor duty for pwmY_auto_pointZ_pwm when a custom fan curve
is enabled, and adds sysfs notifications for pwmY_auto_pointZ_pwm on curve
enable, disable, and floor refresh transitions.

> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 74476904cb99c..bae5a528ac5d8 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
[ ... ]
> @@ -3754,7 +3754,7 @@ static int fan_curve_load_floors(struct asus_wmi *a=
sus, u32 fan_dev)
>  	return 0;
>  }
> =20
> -static void fan_curve_notify_floors(struct asus_wmi *asus)
> +static void fan_curve_notify(struct asus_wmi *asus)
>  {
>  	struct device *hwmon =3D asus->fan_curve_hwmon;
>  	bool valid[ARRAY_SIZE(asus->custom_fan_curves)];
> @@ -3778,6 +3778,10 @@ static void fan_curve_notify_floors(struct asus_wm=
i *asus)
>  				 "pwm%d_auto_point%d_floor_pwm",
>  				 fan + 1, point + 1);
>  			sysfs_notify(&hwmon->kobj, NULL, name);
> +			snprintf(name, sizeof(name),
> +				 "pwm%d_auto_point%d_pwm",
> +				 fan + 1, point + 1);
> +			sysfs_notify(&hwmon->kobj, NULL, name);
>  		}
>  	}
>  }
> @@ -3797,7 +3801,7 @@ static void fan_curve_refresh_floors(struct asus_wm=
i *asus)
>  	if (asus->mid_fan_curve_available)
>  		fan_curve_load_floors(asus, ASUS_WMI_DEVID_MID_FAN_CURVE);
> =20
> -	fan_curve_notify_floors(asus);
> +	fan_curve_notify(asus);
>  }
> =20
>  /* Check if the capability exists, populate its defaults and read its fl=
oor table */
> @@ -3855,15 +3859,28 @@ static ssize_t fan_curve_show(struct device *dev,
>  	struct asus_wmi *asus =3D dev_get_drvdata(dev);
>  	struct fan_curve_data *data;
>  	int value, pwm, index;
> +	bool enabled;
> =20
>  	data =3D fan_curve_attr_2_select(asus, attr);
>  	pwm =3D dev_attr->nr & FAN_CURVE_PWM_MASK;
>  	index =3D dev_attr->index;
> =20
> -	if (pwm)
> +	if (pwm) {
> +		enabled =3D data->enabled;
>  		value =3D data->percents[index];
> -	else
> +
> +		/*
> +		 * The EC runs the point at the higher of the curve and the
> +		 * firmware floor, so report the duty it applies.  Only the
> +		 * floor table is protected by fan_curve_lock; enabled and
> +		 * percents are written without it, so this is a snapshot.
> +		 */
> +		guard(mutex)(&asus->fan_curve_lock);
> +		if (enabled && data->floors_valid)
> +			value =3D max(value, (int)data->floors[index]);
> +	} else {
>  		value =3D data->temps[index];
> +	}
> =20
>  	return sysfs_emit(buf, "%d\n", value);
>  }

[Severity: Medium]
Now that fan_curve_show() returns either the floor-clamped duty or the raw
stored duty depending on data->enabled, are sysfs notifications missing on
other paths that clear data->enabled?

Writing to any point via fan_curve_store() disables the curve without calli=
ng
fan_curve_notify():

drivers/platform/x86/asus-wmi.c:fan_curve_store() {
	...
	if (pwm)
		data->percents[index] =3D value;
	else
		data->temps[index] =3D value;

	data->enabled =3D false;

	return count;
}

Toggling the main hwmon fan mode in pwm1_enable_store() also disables all
custom fan curves without calling fan_curve_notify():

drivers/platform/x86/asus-wmi.c:pwm1_enable_store() {
	...
	/* Must set to disabled if mode is toggled */
	if (asus->cpu_fan_curve_available)
		asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled =3D false;
	if (asus->gpu_fan_curve_available)
		asus->custom_fan_curves[FAN_CURVE_DEV_GPU].enabled =3D false;
	if (asus->mid_fan_curve_available)
		asus->custom_fan_curves[FAN_CURVE_DEV_MID].enabled =3D false;

	return count;
}

Similarly, in fan_curve_enable_store(), if data->enabled was true and gets
set to false before an early error return (such as in fan_curve_validate() =
or
the reset branches), fan_curve_notify() at the end of the function is
bypassed.

Should these paths also notify pollers when an enabled curve transitions to
disabled so they do not keep stale floor-clamped values?

> @@ -4059,6 +4076,9 @@ static ssize_t fan_curve_enable_store(struct device=
 *dev,
>  			fan_curve_refresh_floors(asus);
>  		}
>  	}
> +
> +	fan_curve_notify(asus);
> +
>  	return count;
>  }

[Severity: Low]
Does calling fan_curve_notify(asus) unconditionally at the end of
fan_curve_enable_store() emit duplicate notifications whenever a curve is
disabled?

When data->enabled is false, all three branches of the else block already
invoke fan_curve_refresh_floors(asus) (either directly or through
throttle_thermal_policy_write(asus) -> fan_curve_refresh_floors(asus)), whi=
ch
itself calls fan_curve_notify(asus):

drivers/platform/x86/asus-wmi.c:fan_curve_enable_store() {
	...
	if (data->enabled) {
		...
	} else {
		if (asus->throttle_thermal_policy_dev) {
			err =3D throttle_thermal_policy_write(asus);
			if (err)
				return err;
		} else if (asus->fan_type =3D=3D FAN_TYPE_SPEC83) {
			err =3D asus_fan_set_auto(asus);
			if (err)
				return err;
			fan_curve_refresh_floors(asus);
		} else {
			...
			fan_curve_refresh_floors(asus);
		}
	}

	fan_curve_notify(asus);
}

In addition, when enabling a single fan curve, fan_curve_notify(asus) notif=
ies
both pwmY_auto_pointZ_floor_pwm and pwmY_auto_pointZ_pwm across all fans wi=
th
valid floors, even though the floor tables were not reloaded and the other
fans did not change state. Could the enable path notify only the affected
fan's pwm attributes, and avoid the second fan_curve_notify(asus) call on t=
he
disable path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-asus-fan-f=
loors-v4-v1-0-b8d1c31a99a9@gmail.com?part=3D7
