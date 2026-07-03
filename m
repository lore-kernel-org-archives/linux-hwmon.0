Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A39282F05;
	Fri,  3 Jul 2026 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080726; cv=none; b=CvBTCWvZInRF8GUvCIT3Nw4+Topaj8qiYtRsOS/HeB4MCcxkcBDrICCIfCnoJy01DhFsb9pWeYaxT9LGI9MmY/gOlpvHPmZx4jf87BeBVJ62Ly+SHyO6h7LQI94ab1cmLWxPHYWkw94/Scp40Ml5C6plq7AWdkfhvmXnIIxiqVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080726; c=relaxed/simple;
	bh=DHDzbYoiO/JFGHpDfViP7dTQuwoOt2/m7O0mgPJWPHo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NmuOvc3kZhuBKZLYAR/LBkJn3JfE2q9YE0ARzZl+bMg1MfuTBgpa6VC/7hntcPIcR+MKACLFSE5xaJ1BpFofpUzvegOqDM5LUN3yqw1D1yQfKIaxZdk+ELNKVHLLxpxmGxDMHkjzqYoViRvp6EmFXQ+dAQZ6OfSjyu32mAuOly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaWhir4v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaWhir4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783080725; x=1814616725;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DHDzbYoiO/JFGHpDfViP7dTQuwoOt2/m7O0mgPJWPHo=;
  b=LaWhir4velYxWjF+/IInSJyXSUzqA1mcfFRoxScMV64gBAfKZpvTjc//
   Qpr/+3qlOljEdH9XfEkUF5H0kPik/3lULYovL3IY0NAj0c9I8KcO22TRB
   V5mRJ0ETvnQsFInEJ4Qd/fA1rg5obJgcFgJjnVFxagw/mVpvgJOSkSuab
   dDW/ffBSwwUE5nnRlqRdJIB2h3hCR05RacxZ3OrGcMYdF55If6+3Rpzk8
   9eGAGVaIDcdGqKM3hp2knzf5z0PjNjarnO65Wo/n+F32a3U/xkhHbNSxV
   PPS3gJVDQu5lu1hzvvw4Da630BbDk/EmdMcjWgthaa5H+6ON9saV3K0G9
   g==;
X-CSE-ConnectionGUID: aFGpXUBOSM66OrYxzuKyTQ==
X-CSE-MsgGUID: Yyc8HD6/SJaI3/BynDRixg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95340812"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95340812"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:12:04 -0700
X-CSE-ConnectionGUID: Myzsly7CSVaX1285RT0mkA==
X-CSE-MsgGUID: oEjMUh/UQHCoNInA8FSDWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257992173"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:12:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 15:11:57 +0300 (EEST)
To: Alex Yeo <alexyeo362@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH v6] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
In-Reply-To: <20260628053356.4236-1-alexyeo362@gmail.com>
Message-ID: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
References: <20260626054735.81BA51F00A3A@smtp.kernel.org> <20260628053356.4236-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 28 Jun 2026, Alex Yeo wrote:

> I have a CF-SR4 and Linux works out of the box. Compared to
> previous models, this one seems to have the fans running at high speed
> by default when the computer starts.
> 
> When Windows 11 is booted up, the high fan speeds persist just until the
> login screen. Once the login screen shows up, the fan spins down.
> 
> I had suspected that this might be the laptop ramping down the fans when
> the OS declares that it is Windows but this does not seem to be the
> case.
> 
> After analyzing the DSDT and SSDT of the computer, I have found the
> following:
> 
> File ssdt10.dsl under \_SB.PC00.LPCB.EC0:
> 
> Name (CEFM, Zero)
> Method (SEFM, 1, Serialized)
> {
>     CEFM = Arg0
>     REFM ()
> }
> 
> Method (REFM, 0, Serialized)
> {
>     If ((\S0IX == 0x03))
>     {
>         Local0 = 0x05
>     }
>     ElseIf ((CEFM == Zero))
>     {
>         Local0 = Zero
>     }
>     Else
>     {
>         Local0 = 0x02
>     }
> 
>     \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, Local0, Zero)
> }
> 
> \_SB.PC00.LPCB.EC0.CEFM would seem be the current value
> for the fan profile. On startup, this is set to 0.
> 
> Based on the code SEFM seems the be the method to set the fan
> profile and REFM is executed right after.
> 
> I don't have access to information as to what the argument officially
> means but based on testing, any number above zero makes the fans spin
> down and behave like the older models where it stops or runs at low
> speed when its cool and ramps up when the processor gets hot.
> 
> The only relevant values for CEFM seem to be just 0 and any number above
> that just gets treated the same. I personally use just 0 and 1.
> 0 seems to be the high fan speed mode and 1 makes it behave like
> Windows.
> 
> Giving 0 as an argument reverts the fan back to the way it was during
> startup where the lowest fan speed is quite high and when load is
> applied, it seems to ramp up to an even higher speed which I think would
> be its 100%.
> 
> A value of 1 seems to have its max speed capped lower than 0.
> 
> For both modes, fan management is still automatic.
> 
> fan_mode only shows up in sysfs only if \_SB.PC00.LPCB.EC0.CEFM and
> \_SB.PC00.LPCB.EC0.SEFM are both present which should mean it should not
> show up on unsupported models. I have tried not hiding it and it just
> outputs a generic error when the value is read.
> 
> I also saw that variables such as eco_mode are kept in memory, however
> for fan_mode I rely on getting and setting the value via ACPI.
> 
> Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
> ---
> New in v6:
>  - Addressed: [Low] The global `quirks` variable is assigned in a DMI
>    callback but never used.
>  - Addressed: [Medium] The `pcc_pwm_fan_hwmon_read` function lacks
>    bounds checking for the raw PWM speed returned by the hardware,
>    potentially violating the hwmon ABI.
>  - Addressed: [Medium] The driver assigns standard Linux error codes to
>    an `acpi_status` variable and evaluates them using `ACPI_FAILURE()`
>    by clarifying return codes as int when not dealing with ACPI return
>    values
>  - Moved hwmon code into separate helper functions as the check logic to
>    ensure safety was complex enough to go past the tab/indentation
>    limit
>  - hwmon: removed behavior where setting of fan PWM while on EC/auto
>    mode will toggle manual mode. This current version will block that
>    action. It only works if pwm1_enable is set. 
>  - separated the if statement on the quirks check since having it nested
>    was using too many indentations.
> 
> For the following, I have clarifications:
>  - [High] Returning `100` (max_state) for the thermal cooling device's
>    current state when in AUTO mode defeats the thermal governor and
>    permanently degrades cooling.
>  - [Low] The driver introduces a private mutex (`pwm_fan_lock`) instead
>    of using the hwmon subsystem's locking mechanism.
> 
> > - [Low] The driver introduces a private mutex (`pwm_fan_lock`) instead of using the hwmon subsystem's locking mechanism.
> 
> For this concern, I have based the mutex pattern from another driver
> (asus-wmi.c and thinkpad_acpi.c). From what I can gather, having
> a mutex that is managed by the driver seems to be the pattern and
> I utilize this since the lock is supposed to prevent resource
> contention between the hwmon and thermal subsystem when the fan
> mode and speed are read and set.
> 
> > - [High] Returning `100` (max_state) for the thermal cooling device's current state when in AUTO mode defeats the thermal governor and permanently degrades cooling.
> 
> This one is a bit confusing to me as cooling is never degraded during
> the entire processes. In fact, the decision to report 100 when the EC
> controls the fan in its failsafe mode ensures cooling is not degraded.
> 
> I will elaborate on how the specifics:
> 
> When the computer is booted up (or rebooted), the BIOS hands control of
> the fan to the EC. The EC by default has an aggressive fan curve where
> the lowest speed the fan could spin is close to around 80% speed. This
> is noticeable as the fan is quite audible.
> 
> When Windows boots up, just before the login screen the fans suddenly
> quiet down and the speed is adjusted automatically by the OS. From the
> ACPI spec, this is referred to as OSPM.
> 
> In the case of Linux, when this driver is loaded, it cannot tell the
> actual fan speed or the current PWM value. This is because the vendor
> chose to not have those values reported via ACPI when queried. The only
> thing that is certain is if the fan is in EC (auto) mode or in manual
> mode. When in EC/auto mode, as the fan is spinning at a high value, it
> relies on the OS to give the signal to control the fan manually and give
> a value between 0-100.
> 
> On the vendor's driver on Windows this can be done, however for the
> Linux driver having the driver mess with any of this commands unprompted
> by the user should not happen. So instead I report 100 when the EC is on
> auto mode as this should prompt userspace tools to set a fan value when
> the temperature is too cold for that high of a fan speed.
> 
> Cooling is not degraded in any way in this process and it relies on a
> tool like thermald to set the fan speed.
> 
> I have also observed that when it gets too hot (~90C), the EC turns
> the fan on automatically.
> 
> > - [Medium] The driver assigns standard Linux error codes to an `acpi_status` variable and evaluates them using `ACPI_FAILURE()`.
> 
> I have reviewed this one and this is something I missed as I had used
> acpi_status in places where it should not have been used at all.
> 
> > +	int status;
> 
> I have rewrote those instances so that an int is used instead.
> 
> > - [Medium] The `pcc_pwm_fan_hwmon_read` function lacks bounds checking for the raw PWM speed returned by the hardware, potentially violating the hwmon ABI.
> 
> > +	/* prevent out-of-bounds */
> > +	if (obj->package.elements[1].integer.value > 100) {
> > +		pr_err("_FST element at index 1 is an integer out of bounds\n");
> > +		result = -EINVAL;
> > +		goto out;
> > +	}
> 
> This has been added. This is an unsigned int so I only check if its
> above 100.
> 
> > - [Low] The global `quirks` variable is assigned in a DMI callback but never used.
> 
> I have rewrote the code so that a callback is not used and as an
> extension the global quirks variable is not used.
> 
> > +	switch (attr) {
> > +	case hwmon_pwm_input:
> > +		return pcc_pwm_fan_hwmon_speed_read(pcc, val);
> > +	case hwmon_pwm_enable:
> > +		return pcc_pwm_fan_hwmon_mode_read(pcc, val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> 
> The hwmon read and write function has been modified to use helper
> functions since the amount of indentations was too much.
> 
> > +	/* skip if no quirks */
> > +	if (!pcc->quirks)
> > +		goto out_no_quirks;
> > +
> > +	/* has_ospm_pwm_fan - add hwmon and thermal if present */
> > +	if (pcc->quirks->has_ospm_pwm_fan) {
> > [...]
> > +out_no_quirks:
> >  	return 0;
> 
> I have also separated these checks for quirks as it was using too
> many indentations.
> 
> > +	/* check first if manual control is enabled */
> > +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> > +	if (status < 0) {
> > +		pr_err("%s: failed to get fan pwm mode\n", __func__);
> > +		result = status;
> > +		goto out_unlock;
> > +	}
> > +
> > +	/* do not allow settings speeds if not manual mode */
> > +	if (pwm_mode != HWMON_PCC_FAN_PWM_MANUAL) {
> > +		result = -EOPNOTSUPP;
> > +		goto out_unlock;
> > +	}
> 
> The hwmon fan now disallows setting of PWM values if the fan is set to
> EC/auto mode.
> 
> $ echo 1 | sudo tee /sys/class/hwmon/hwmon6/pwm1_enable # manual mode
> 
> Has to be done first to allow PWM control.
> 
> 
> I have also tested this and it compiles and works as intended in my
> case.
> 
>  drivers/platform/x86/panasonic-laptop.c | 590 +++++++++++++++++++++++-
>  1 file changed, 576 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index b83113c26f88..2d2acd830fa4 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -119,6 +119,9 @@
>   *		- v0.1  start from toshiba_acpi driver written by John Belmonte
>   */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/printk.h>
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
>  #include <linux/bits.h>
> @@ -136,6 +139,12 @@
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <acpi/video.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/thermal.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
>  
>  MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
>  MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
> @@ -164,6 +173,17 @@ MODULE_LICENSE("GPL");
>  
>  #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
>  
> +/* Define fan PWM modes */
> +#define ACPI_PCC_FAN_PWM_AUTO		0x00
> +#define ACPI_PCC_FAN_PWM_MANUAL		0x01
> +#define HWMON_PCC_FAN_PWM_AUTO		0x02
> +#define HWMON_PCC_FAN_PWM_MANUAL	0x01
> +
> +/* Define quirks for this driver */
> +struct quirk_entry {
> +	bool has_ospm_pwm_fan;
> +};
> +
>  /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
>     ECO_MODEs: 0x03 = off, 0x83 = on
>  */
> @@ -238,19 +258,44 @@ static const struct key_entry panasonic_keymap[] = {
>  };
>  
>  struct pcc_acpi {
> -	acpi_handle		handle;
> -	unsigned long		num_sifr;
> -	int			sticky_key;
> -	int			eco_mode;
> -	int			mute;
> -	int			ac_brightness;
> -	int			dc_brightness;
> -	int			current_brightness;
> -	u32			*sinf;
> -	struct acpi_device	*device;
> -	struct input_dev	*input_dev;
> -	struct backlight_device	*backlight;
> -	struct platform_device	*platform;
> +	acpi_handle			handle;
> +	unsigned long			num_sifr;
> +	int				sticky_key;
> +	int				eco_mode;
> +	int				mute;
> +	int				ac_brightness;
> +	int				dc_brightness;
> +	int				current_brightness;
> +	u32				*sinf;
> +	struct quirk_entry		*quirks;
> +	struct acpi_device		*device;
> +	struct input_dev		*input_dev;
> +	struct backlight_device		*backlight;
> +	struct platform_device		*platform;
> +	struct thermal_cooling_device	*pwm_fan_cdev;
> +	struct device			*pwm_fan_hwmon;
> +	struct mutex			pwm_fan_lock;

Please add a comment to explain what the mutex protects.

> +};
> +
> +/*
> + * Declare quirks and apply matches
> + */
> +
> +static struct quirk_entry quirk_cf_sr4 = {
> +	.has_ospm_pwm_fan = true,
> +};
> +
> +/* DMI matching for quirks copied from asus-nb-wmi.c */
> +static const struct dmi_system_id pcc_quirks[] = {
> +	{
> +		.ident = "Panasonic Connect Co., Ltd. CFSR4-1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
> +		},
> +		.driver_data = &quirk_cf_sr4,
> +	},
> +	{},
>  };
>  
>  /*
> @@ -415,7 +460,6 @@ static const struct backlight_ops pcc_backlight_ops = {
>  	.update_status	= bl_set_status,
>  };
>  
> -

Spurious change.

>  /* returns ACPI_SUCCESS if methods to control optical drive are present */
>  
>  static acpi_status check_optd_present(void)
> @@ -507,6 +551,187 @@ static int set_optd_power_state(int new_state)
>  	return result;
>  }
>  
> +/* get OSPM fan mode */
> +
> +static int pcc_pwm_fan_mode_read(int *pwm_mode)
> +{
> +	unsigned long long state;
> +	acpi_status status;
> +	int result;
> +
> +	/* BIOS default is zero which seems to be some sort of failsafe mode */
> +	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL,
> +				       &state);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("error: cannot get fan mode via CEFM\n");

This is already pr_err so printing also "error:" seems unnecessary.

> +		result = -EIO;
> +		goto out;
> +	}
> +
> +	/* use hwmon convention for pwm_mode */
> +	if (state == ACPI_PCC_FAN_PWM_AUTO) {
> +		*pwm_mode = HWMON_PCC_FAN_PWM_AUTO;
> +	} else if (state != 0 && state > 0) {
> +		*pwm_mode = HWMON_PCC_FAN_PWM_MANUAL;
> +	} else {
> +		/* unknown */
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	result = 0;
> +
> +out:
> +	return result;
> +}
> +
> +/* set OSPM fan mode */
> +
> +static int pcc_pwm_fan_mode_set(int pwm_mode)
> +{
> +	acpi_status status;
> +	int result;
> +
> +	union acpi_object param[1];
> +	struct acpi_object_list input;
> +
> +	param[0].type = ACPI_TYPE_INTEGER;
> +	param[0].integer.value = pwm_mode;
> +	input.count = 1; /* takes one arg */
> +	input.pointer = param;
> +
> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &input,
> +				      NULL);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("error: cannot set fan mode via SEFM\n");

Same here.

> +		result = -EIO;
> +		goto out;
> +	}
> +
> +	result = 0;
> +
> +out:
> +	return result;

Drop the label and result variable, and do returns directly:
		return -EIO;
	}

	return 0;

> +}
> +
> +/* read PWM fan speed */
> +
> +static int pcc_pwm_fan_speed_read(int *pwm_speed)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int pwm_mode;
> +	int result;
> +
> +
> +	/* Get fan status first */
> +	/* If fan is not in manual mode, it will return a bogus value */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("%s: failed to get fan status\n", __func__);

Don't print __func__ in anything meant for normal user consumption, write 
the messages without C "oddities" for normal users.

> +		result = status;
> +		goto out;
> +	}
> +
> +	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> +		result = -ENODATA; /* Indeterminate value */
> +		goto out;
> +	}
> +
> +	/* get pwm speed */
> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
> +				      NULL, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("%s: failed to get pwm speed\n", __func__);
> +		result = -EIO;
> +		goto out;

These should all just return directly.

> +	}
> +
> +	obj = buffer.pointer;

Please use __free() (move variable declaration here mid-function as 
explained in cleanup.h) and remove out label entirely.

> +
> +	/* the structure should have 3 values */
> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2) {
> +		pr_err("Invalid _FST package structure (expected 3)\n");
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* the second element should be the pwm speed as an int */
> +	if (obj->package.elements[1].type != ACPI_TYPE_INTEGER) {
> +		pr_err("_FST element at index 1 is not an integer\n");
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* prevent out-of-bounds */
> +	if (obj->package.elements[1].integer.value > 100) {
> +		pr_err("_FST element at index 1 is an integer out of bounds\n");
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	*pwm_speed = obj->package.elements[1].integer.value;
> +	result = 0;
> +
> +out:
> +	kfree(buffer.pointer);

Replace this with __free()

> +	return result;
> +}
> +
> +/* set PWM fan speed */
> +
> +static int pcc_pwm_fan_speed_set(int set_pwm_speed)
> +{
> +	struct acpi_object_list input;
> +	union acpi_object param[1];
> +	acpi_status fsl_status;
> +	int pwm_mode;
> +	int status;
> +	int result;
> +
> +	/* Get fan status. set to manual if not set */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("%s: failed to get fan status\n", __func__);

As mentioned above no __func__ please.

> +		result = status;
> +		goto out;
> +	}
> +
> +	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> +		status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
> +		if (status < 0) {
> +			pr_err("%s: set fan PWM to manual failed\n", __func__);
> +			result = status;
> +			goto out;
> +		}
> +	}
> +
> +	/* check if within bounds */
> +	if (set_pwm_speed < 0 || set_pwm_speed > 100) {
> +		pr_err("%s: error: fan speed level out of bounds\n", __func__);
> +		result = -EIO;
> +		goto out;
> +	}
> +
> +	param[0].type = ACPI_TYPE_INTEGER;
> +	param[0].integer.value = set_pwm_speed;
> +	input.count = 1; /* takes one arg */
> +	input.pointer = param;
> +
> +	fsl_status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FSL",
> +				      &input, NULL);
> +	if (ACPI_FAILURE(fsl_status)) {
> +		pr_err("Setting of fan speed via ._FSL failed.\n");
> +		result = -EIO;
> +		goto out;
> +	}
> +
> +	result = 0;
> +
> +out:
> +	return result;

Please apply similar return + goto removal transitions as mentioned for 
the other functions.

> +}
>  
>  /* sysfs user interface functions */
>  
> @@ -676,6 +901,7 @@ static ssize_t ac_brightness_show(struct device *dev, struct device_attribute *a
>  	return sysfs_emit(buf, "%u\n", pcc->sinf[SINF_AC_CUR_BRIGHT]);
>  }
>  
> +

Spurious change.

>  static ssize_t ac_brightness_store(struct device *dev, struct device_attribute *attr,
>  				   const char *buf, size_t count)
>  {
> @@ -825,6 +1051,288 @@ static const struct attribute_group pcc_attr_group = {
>  	.is_visible	= pcc_sysfs_is_visible,
>  };
>  
> +/* hwmon */
> +
> +static const struct hwmon_channel_info *const pcc_pwm_fan_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE), NULL

Put NULL on own line for clarity.

> +};
> +
> +static int pcc_pwm_fan_hwmon_speed_read(struct pcc_acpi *pcc, long *val)
> +{
> +	int pwm_speed;
> +	int result;
> +	int status;
> +
> +	mutex_lock(&pcc->pwm_fan_lock);

Please use guard() and remove all gotos.

> +
> +	status = pcc_pwm_fan_speed_read(&pwm_speed);
> +	if (status < 0) {
> +		result = status;
> +		goto out_unlock;
> +	}
> +
> +	/* protect against out-of-bounds */
> +	if (pwm_speed < 0 || pwm_speed > 100) {
> +		result = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	*val = (pwm_speed * 255) / 100;
> +	result = 0;
> +
> +out_unlock:
> +	mutex_unlock(&pcc->pwm_fan_lock);
> +	return result;
> +}
> +
> +static int pcc_pwm_fan_hwmon_mode_read(struct pcc_acpi *pcc, long *val)
> +{
> +	int pwm_mode;
> +	int result;
> +	int status;
> +
> +	mutex_lock(&pcc->pwm_fan_lock);

guard()

> +
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("%s: failed to get fan pwm mode\n", __func__);

You know the drill by now.

> +		result = status;
> +		goto out_unlock;
> +	}
> +	switch (pwm_mode) {
> +	case HWMON_PCC_FAN_PWM_AUTO:
> +		*val = HWMON_PCC_FAN_PWM_AUTO;
> +		result = 0;
> +		break;
> +	case HWMON_PCC_FAN_PWM_MANUAL:
> +		*val = HWMON_PCC_FAN_PWM_MANUAL;
> +		result = 0;
> +		break;
> +	default:
> +		result = -EINVAL;
> +		break;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&pcc->pwm_fan_lock);
> +	return result;
> +}
> +
> +static int pcc_pwm_fan_hwmon_read(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int channel, long *val)
> +{
> +	struct pcc_acpi *pcc;
> +
> +	pcc = dev_get_drvdata(dev);

Put this assignment to the variable declaration line.

> +
> +	if (type != hwmon_pwm)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		return pcc_pwm_fan_hwmon_speed_read(pcc, val);
> +	case hwmon_pwm_enable:
> +		return pcc_pwm_fan_hwmon_mode_read(pcc, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int pcc_pwm_fan_hwmon_mode_set(struct pcc_acpi *pcc, long val)
> +{
> +	int result;
> +
> +	switch (val) {
> +	case HWMON_PCC_FAN_PWM_AUTO:
> +		mutex_lock(&pcc->pwm_fan_lock);
> +		result = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
> +		goto out_unlock;
> +	case HWMON_PCC_FAN_PWM_MANUAL:
> +		mutex_lock(&pcc->pwm_fan_lock);
> +		result = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
> +		goto out_unlock;
> +	default:
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&pcc->pwm_fan_lock);

This too should use guard().

> +out:
> +	return result;
> +}
> +
> +static int pcc_pwm_fan_hwmon_speed_set(struct pcc_acpi *pcc, long val)
> +{
> +	int pwm_speed_vendor_val;
> +	int pwm_mode;
> +	int status;
> +	int result;
> +
> +	val = clamp_val(val, 0, 255);

Add include for clamp_val().

Many earlier comments apply to this function as well and some others 
below as well.

> +	pwm_speed_vendor_val = (val * 100) / 255;
> +
> +	mutex_lock(&pcc->pwm_fan_lock);
> +
> +	/* check first if manual control is enabled */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("%s: failed to get fan pwm mode\n", __func__);
> +		result = status;
> +		goto out_unlock;
> +	}
> +
> +	/* do not allow settings speeds if not manual mode */
> +	if (pwm_mode != HWMON_PCC_FAN_PWM_MANUAL) {
> +		result = -EOPNOTSUPP;
> +		goto out_unlock;
> +	}
> +
> +	status = pcc_pwm_fan_speed_set(pwm_speed_vendor_val);
> +	if (status < 0) {
> +		pr_err("%s: failed to set fan pwm\n", __func__);
> +		result = status;
> +		goto out_unlock;
> +	}
> +	result = 0;
> +
> +out_unlock:
> +	mutex_unlock(&pcc->pwm_fan_lock);
> +	return result;
> +}
> +
> +static int pcc_pwm_fan_hwmon_write(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, long val)
> +{
> +	struct pcc_acpi *pcc;
> +
> +	pcc = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_pwm)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_pwm_enable:
> +		return pcc_pwm_fan_hwmon_mode_set(pcc, val);
> +	case hwmon_pwm_input:
> +		return pcc_pwm_fan_hwmon_speed_set(pcc, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t pcc_pwm_fan_hwmon_is_visible(const void *data,
> +					    enum hwmon_sensor_types type,
> +					    u32 attr, int channel)
> +{
> +	if (type != hwmon_pwm)
> +		return 0;
> +
> +	return 0644;
> +}
> +
> +static const struct hwmon_ops pcc_pwm_fan_hwmon_ops = {
> +	.is_visible = pcc_pwm_fan_hwmon_is_visible,
> +	.read = pcc_pwm_fan_hwmon_read,
> +	.write = pcc_pwm_fan_hwmon_write,
> +};
> +
> +static const struct hwmon_chip_info pcc_pwm_fan_hwmon_chip_info = {
> +	.ops = &pcc_pwm_fan_hwmon_ops,
> +	.info = pcc_pwm_fan_hwmon_info,
> +};
> +
> +/* thermal interface */
> +static int pcc_pwm_fan_thermal_max_state(struct thermal_cooling_device *cdev,
> +					 unsigned long *state)
> +{
> +	*state = 100; /* range of 0-100 as per UEFI spec */
> +	return 0;
> +}
> +static int
> +pcc_pwm_fan_thermal_get_current_pwm(struct thermal_cooling_device *cdev,
> +				    unsigned long *state)
> +{
> +	struct pcc_acpi *pcc;
> +	int current_pwm;
> +	int pwm_mode;
> +	int result;
> +	int status;
> +
> +	pcc = cdev->devdata;
> +
> +	mutex_lock(&pcc->pwm_fan_lock);
> +
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("%s: failed to get fan pwm mode\n", __func__);
> +		result = status;
> +		goto out;
> +	}
> +	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> +		*state = 100; /* Return failsafe value on EC mode */
> +		result = 0;
> +		goto out;
> +	}
> +
> +	status = pcc_pwm_fan_speed_read(&current_pwm);
> +	if (status < 0) {
> +		result = status; /* pass error code */
> +		goto out;
> +	}
> +
> +	if (current_pwm > 100)
> +		current_pwm = 100;
> +	if (current_pwm < 0) {
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	*state = current_pwm;
> +	result = 0;
> +
> +out:
> +	mutex_unlock(&pcc->pwm_fan_lock);
> +	return result;
> +}
> +static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
> +					   unsigned long state)
> +{
> +	struct pcc_acpi *pcc;
> +	int status;
> +	int set_pwm;
> +	int result;
> +
> +	pcc = cdev->devdata;
> +
> +	mutex_lock(&pcc->pwm_fan_lock);
> +
> +	if (state > 100) {
> +		result = -EINVAL;
> +		goto out;
> +	}
> +
> +	set_pwm = state;
> +	status = pcc_pwm_fan_speed_set(set_pwm);
> +	if (status < 0) {
> +		pr_err("%s: failed to set fan speed pwm\n", __func__);
> +		result = status;
> +		goto out;
> +	}
> +
> +	result = 0;
> +
> +out:
> +	mutex_unlock(&pcc->pwm_fan_lock);
> +	return result;
> +}
> +static const struct thermal_cooling_device_ops pcc_pwm_fan_cdev_ops = {
> +	.get_max_state = pcc_pwm_fan_thermal_max_state,
> +	.get_cur_state = pcc_pwm_fan_thermal_get_current_pwm,
> +	.set_cur_state = pcc_pwm_fan_thermal_set_fan_pwm,
> +};
>  
>  /* hotkey input device driver */
>  
> @@ -981,6 +1489,7 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
>  
>  static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  {
> +	const struct dmi_system_id *dmi_id;
>  	struct backlight_properties props;
>  	struct acpi_device *device;
>  	struct pcc_acpi *pcc;
> @@ -1026,6 +1535,17 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
>  	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
>  
> +	/*
> +	 * Perform quirk detection
> +	 */
> +	dmi_id = dmi_first_match(pcc_quirks);
> +	if (dmi_id) {
> +		pcc->quirks = dmi_id->driver_data;
> +		pr_info("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);

IMO, this should be debug level if useful at all.

> +	} else {
> +		pcc->quirks = NULL;

Isn't the default/initialization value NULL anyway so why you need to set 
it here?

> +	}
> +
>  	result = acpi_pcc_init_input(pcc);
>  	if (result) {
>  		pr_err("Error installing keyinput handler\n");
> @@ -1097,6 +1617,41 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  	}
>  
>  	i8042_install_filter(panasonic_i8042_filter, NULL);
> +
> +	/* skip if no quirks */
> +	if (!pcc->quirks)
> +		goto out_no_quirks;
> +
> +	/* has_ospm_pwm_fan - add hwmon and thermal if present */
> +	if (pcc->quirks->has_ospm_pwm_fan) {
> +		mutex_init(&pcc->pwm_fan_lock);

I suggest you always initialize the mutex. Doing it conditionally it made 
your cleanup trickier (and more prone to corner cases if somebody changes 
some of the checks). What's the benefit for doing in conditionally?

> +
> +		pr_info("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);
> +
> +		pcc->pwm_fan_hwmon = hwmon_device_register_with_info(
> +			&pdev->dev, "panasonic_pwm_fan", pcc,
> +			&pcc_pwm_fan_hwmon_chip_info, NULL);
> +		if (IS_ERR(pcc->pwm_fan_hwmon)) {
> +			pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
> +			/* not a critical error. just skip if error */
> +			pcc->pwm_fan_hwmon = NULL;
> +		}
> +
> +		/* proceed with thermal */
> +		pr_info("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
> +		pcc->pwm_fan_cdev = thermal_cooling_device_register(
> +			"Panasonic_PWM_Fan", pcc, &pcc_pwm_fan_cdev_ops);
> +		if (IS_ERR(pcc->pwm_fan_cdev)) {
> +			pr_warn("has_ospm_pwm_fan: Failed to register thermal cdev\n");
> +			pcc->pwm_fan_cdev = NULL;
> +		}
> +
> +		/* cleanup: destroy mutex if both hwmon and thermal failed */
> +		if (!pcc->pwm_fan_hwmon && !pcc->pwm_fan_cdev)
> +			mutex_destroy(&pcc->pwm_fan_lock);
> +	}
> +
> +out_no_quirks:
>  	return 0;
>  
>  out_platform:
> @@ -1124,6 +1679,13 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
>  	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
>  	struct pcc_acpi *pcc = acpi_driver_data(device);
>  
> +	if (pcc->pwm_fan_hwmon)
> +		hwmon_device_unregister(pcc->pwm_fan_hwmon);
> +	if (pcc->pwm_fan_cdev)
> +		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
> +	if (pcc->pwm_fan_hwmon || pcc->pwm_fan_cdev)
> +		mutex_destroy(&pcc->pwm_fan_lock);
> +
>  	i8042_remove_filter(panasonic_i8042_filter);
>  
>  	if (pcc->platform) {
> 

-- 
 i.

