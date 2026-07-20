Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5E3AEF3E;
	Mon, 20 Jul 2026 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555182; cv=none; b=W5lI1oQIXKKVS1PTExRbakh07AqY/87ULPIyHy4kn2F72SNG2hJ5HyrEwGS7ScTTVQUF0KIZB0sSJirzPV8np+ZHGTv/KMSM9CUN4oB/hJcZZQLZD/BFmgdYtZ7+Rpr8+bRkTRXDFdM+pY7SAil7vadMxprEMTFuOgHOFWCGAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555182; c=relaxed/simple;
	bh=udFasIY9Rb0UfcbSDubYr+XDtVjyOQA3Foc5ndt7KgM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YRYq/OUM4GmAv67yac2Ne2wuapiGXD9BMyM5HLh6vblvZiPtaZQozQpFdtCVi9dk7U3zUwhc6H6cOhbnlHOTa7RhW6UVV0FclW0KkFo+Q8FU8+uN/2lX8WBE2wdDp2wb3CHhR60XZzCcRfxTlGPaLvl9xVL5kjLm6+mEuCv2Wrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqKlM2Eh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqKlM2Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784555179; x=1816091179;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=udFasIY9Rb0UfcbSDubYr+XDtVjyOQA3Foc5ndt7KgM=;
  b=dqKlM2EhwutM2301Nn94RFi7gqFQvo3Nc9aMUFFdhzcQLRdMZkj69kZy
   iEgiyy9WBvAEVvDz/1tB/KOmycfmC9MJezCnKQ+TZsAwjaL2DWXuorUEk
   Zz0IJ/xHi4CHKBAJFHfXo10yDOIl1CSTD71Y3KwEGpmZ6z+1KueTqgxwt
   h8zVSB9N3vQTLYT8kx7T+NZ/4wlyS+H0dTp92/+CamwOHDJLPyKoU1Tpa
   KoSy4G+8NioyDO2a2c4HD5l6foweUXrgKmAQLR5+Dk1HLEZiTKh7NYpZU
   pYxyBf3rn/QttYXSMgoTcl3Yrnv/0n1RHeOnF4kbODMZrYW14UDprdSP2
   A==;
X-CSE-ConnectionGUID: glLi2ncIS4GCMnmsBWst/g==
X-CSE-MsgGUID: gIvZlAHWRmKuZKsGySzMAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95787529"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="95787529"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 06:46:18 -0700
X-CSE-ConnectionGUID: CmP89ar/TwymSD4TAIrcQA==
X-CSE-MsgGUID: hpGvypPJR2qrqHu7h6OUHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="261024072"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 06:46:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 20 Jul 2026 16:46:11 +0300 (EEST)
To: Alex Yeo <alexyeo362@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
In-Reply-To: <20260718185704.3466-1-alexyeo362@gmail.com>
Message-ID: <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com> <20260718185704.3466-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Jul 2026, Alex Yeo wrote:

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
>  drivers/platform/x86/panasonic-laptop.c | 500 +++++++++++++++++++++++-
>  1 file changed, 486 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index b83113c26f88..2d67188de2a9 100644
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
> @@ -136,6 +139,14 @@
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <acpi/video.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/thermal.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/cleanup.h>
> +#include <linux/minmax.h>

Includes should be added in alphabetical order (per each subdirectory 
block).

>  
>  MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
>  MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
> @@ -164,6 +175,17 @@ MODULE_LICENSE("GPL");
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
> @@ -238,19 +260,50 @@ static const struct key_entry panasonic_keymap[] = {
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
> +
> +	/*
> +	 * This mutex ensures that the hwmon and thermal functions
> +	 * for fan operations do not conflict as the PWM fan is
> +	 * exposed to both.
> +	 */
> +	struct mutex			pwm_fan_lock;
> +};
> +
> +/*
> + * Declare quirks
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
> @@ -415,7 +468,6 @@ static const struct backlight_ops pcc_backlight_ops = {
>  	.update_status	= bl_set_status,
>  };
>  
> -
>  /* returns ACPI_SUCCESS if methods to control optical drive are present */

Unrelated change.

>  
>  static acpi_status check_optd_present(void)
> @@ -507,6 +559,155 @@ static int set_optd_power_state(int new_state)
>  	return result;
>  }
>  
> +/* get OSPM fan mode */
> +
> +static int pcc_pwm_fan_mode_read(int *pwm_mode)
> +{
> +	unsigned long long state;
> +	acpi_status status;
> +
> +	/* BIOS default is zero which seems to be some sort of failsafe mode */
> +	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL,
> +				       &state);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("cannot get fan mode via CEFM\n");
> +		return -EIO;
> +	}
> +
> +	/* use hwmon convention for pwm_mode */
> +	if (state == ACPI_PCC_FAN_PWM_AUTO) {
> +		*pwm_mode = HWMON_PCC_FAN_PWM_AUTO;
> +	} else if (state != 0 && state > 0) {
> +		*pwm_mode = HWMON_PCC_FAN_PWM_MANUAL;
> +	} else {
> +		/* unknown */
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* set OSPM fan mode */
> +
> +static int pcc_pwm_fan_mode_set(int pwm_mode)
> +{
> +	acpi_status status;
> +
> +	union acpi_object param[1];
> +	struct acpi_object_list input;

Don't leave empty lines in between variable declarations. Please use 
reverse-xmas tree order when you can (when no internal dependencies 
between local var don't force your hand).

> +
> +	param[0].type = ACPI_TYPE_INTEGER;
> +	param[0].integer.value = pwm_mode;
> +	input.count = 1; /* takes one arg */

Remove comment.

> +	input.pointer = param;
> +
> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &input,
> +				      NULL);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("cannot set fan mode via SEFM\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/* read PWM fan speed */

This comments adds zero value over what the function name already tells 
us. Please don't add comments that state obvious things.

> +
> +static int pcc_pwm_fan_speed_read(int *pwm_speed)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	int pwm_mode;
> +
> +
> +	/* Get fan status first */
> +	/* If fan is not in manual mode, it will return a bogus value */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("failed to get fan status\n");
> +		return status;
> +	}
> +
> +	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO)
> +		return -ENODATA; /* Indeterminate value */
> +
> +	/* get pwm speed */
> +	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
> +				      NULL, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("failed to get pwm speed\n");
> +		return -EIO;
> +	}
> +
> +	union acpi_object *obj __free(kfree) = buffer.pointer;
> +
> +	/* the structure should have 3 values */

That's what can be easily read from the code. There's no need to comment 
trivialities like this.

> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2) {
> +		pr_err("Invalid _FST package structure (expected 3)\n");
> +		return -EINVAL;
> +	}
> +
> +	/* the second element should be the pwm speed as an int */
> +	if (obj->package.elements[1].type != ACPI_TYPE_INTEGER) {
> +		pr_err("_FST element at index 1 is not an integer\n");
> +		return -EINVAL;
> +	}
> +
> +	/* prevent out-of-bounds */
> +	if (obj->package.elements[1].integer.value > 100) {
> +		pr_err("_FST element at index 1 is an integer out of bounds\n");
> +		return -EINVAL;
> +	}
> +
> +	*pwm_speed = obj->package.elements[1].integer.value;
> +	return 0;
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
> +
> +	/* Get fan status. set to manual if not set */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("failed to get fan status\n");
> +		return status;
> +	}
> +
> +	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> +		status = pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
> +		if (status < 0) {
> +			pr_err("set fan PWM to manual failed\n");
> +			return status;
> +		}
> +	}
> +
> +	/* check if within bounds */
> +	if (set_pwm_speed < 0 || set_pwm_speed > 100) {
> +		pr_err("fan speed level out of bounds\n");
> +		return -EIO;
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
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
>  
>  /* sysfs user interface functions */
>  
> @@ -825,6 +1026,228 @@ static const struct attribute_group pcc_attr_group = {
>  	.is_visible	= pcc_sysfs_is_visible,
>  };
>  
> +/* hwmon */
> +
> +static const struct hwmon_channel_info *const pcc_pwm_fan_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL
> +};
> +
> +static int pcc_pwm_fan_hwmon_speed_read(struct pcc_acpi *pcc, long *val)
> +{
> +	int pwm_speed;
> +	int status;
> +
> +	guard(mutex)(&pcc->pwm_fan_lock);
> +
> +	status = pcc_pwm_fan_speed_read(&pwm_speed);
> +	if (status < 0)
> +		return status;
> +
> +	/* protect against out-of-bounds */
> +	if (pwm_speed < 0 || pwm_speed > 100)
> +		return -EINVAL;
> +
> +	*val = (pwm_speed * 255) / 100;
> +	return 0;
> +}
> +
> +static int pcc_pwm_fan_hwmon_mode_read(struct pcc_acpi *pcc, long *val)
> +{
> +	int pwm_mode;
> +	int status;
> +
> +	guard(mutex)(&pcc->pwm_fan_lock);
> +
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("failed to get fan pwm mode\n");
> +		return status;
> +	}
> +
> +	switch (pwm_mode) {
> +	case HWMON_PCC_FAN_PWM_AUTO:
> +		*val = HWMON_PCC_FAN_PWM_AUTO;
> +		return 0;
> +	case HWMON_PCC_FAN_PWM_MANUAL:
> +		*val = HWMON_PCC_FAN_PWM_MANUAL;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int pcc_pwm_fan_hwmon_read(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int channel, long *val)
> +{
> +	struct pcc_acpi *pcc = dev_get_drvdata(dev);
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
> +	switch (val) {
> +	case HWMON_PCC_FAN_PWM_AUTO:
> +		guard(mutex)(&pcc->pwm_fan_lock);

I'm not sure if clang is happy with how scoping is here so these should 
have {} around each case.

> +		return pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_AUTO);
> +	case HWMON_PCC_FAN_PWM_MANUAL:
> +		guard(mutex)(&pcc->pwm_fan_lock);
> +		return pcc_pwm_fan_mode_set(ACPI_PCC_FAN_PWM_MANUAL);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int pcc_pwm_fan_hwmon_speed_set(struct pcc_acpi *pcc, long val)
> +{
> +	int pwm_speed_vendor_val;
> +	int pwm_mode;
> +	int status;
> +
> +	val = clamp_val(val, 0, 255);
> +	pwm_speed_vendor_val = (val * 100) / 255;
> +
> +	guard(mutex)(&pcc->pwm_fan_lock);
> +
> +	/* check first if manual control is enabled */
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("failed to get fan pwm mode\n");
> +		return status;
> +	}
> +
> +	/* do not allow settings speeds if not manual mode */
> +	if (pwm_mode != HWMON_PCC_FAN_PWM_MANUAL)
> +		return -EOPNOTSUPP;
> +
> +	status = pcc_pwm_fan_speed_set(pwm_speed_vendor_val);
> +	if (status < 0) {
> +		pr_err("failed to set fan pwm\n");
> +		return status;
> +	}
> +	return 0;
> +}
> +
> +static int pcc_pwm_fan_hwmon_write(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, long val)
> +{
> +	struct pcc_acpi *pcc;
> +
> +	pcc = dev_get_drvdata(dev);

And this is where I started to check whether you've ignored my earlier 
feedback. Turns out you sent a new version without addressing the 
feedback I've given you (and IIRC, it's not the first time this has 
happened).

The next time this happens, I'll move this submission and its subsequent 
versions into a very low-priority bin to avoid wasting my time on it. So 
please triple check twice you've addressed every single comment I (or 
other potential reviewer) has given you on _any earlier version_ of the 
patch before even considering sending the next version. There's no hurry 
here, I won't be accepting half-baked patches so you'd just be wasting 
everyone's time by sending it over and over again with things unaddressed.


--
 i.

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
> +	struct pcc_acpi *pcc = cdev->devdata;
> +	int current_pwm;
> +	int pwm_mode;
> +	int status;
> +
> +	guard(mutex)(&pcc->pwm_fan_lock);
> +
> +	status = pcc_pwm_fan_mode_read(&pwm_mode);
> +	if (status < 0) {
> +		pr_err("%s: failed to get fan pwm mode\n", __func__);
> +		return status;
> +	}
> +	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
> +		*state = 100; /* Return failsafe value on EC mode */
> +		return 0;
> +	}
> +
> +	status = pcc_pwm_fan_speed_read(&current_pwm);
> +	if (status < 0)
> +		return status; /* pass error code */
> +
> +	if (current_pwm > 100)
> +		current_pwm = 100;
> +	if (current_pwm < 0)
> +		return -EINVAL;
> +
> +	*state = current_pwm;
> +	return 0;
> +}
> +static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
> +					   unsigned long state)
> +{
> +	struct pcc_acpi *pcc = cdev->devdata;
> +	int status;
> +	int set_pwm;
> +
> +	guard(mutex)(&pcc->pwm_fan_lock);
> +
> +	if (state > 100)
> +		return -EINVAL;
> +
> +	set_pwm = state;
> +	status = pcc_pwm_fan_speed_set(set_pwm);
> +	if (status < 0) {
> +		pr_err("%s: failed to set fan speed pwm\n", __func__);
> +		return status;
> +	}
> +
> +	return 0;
> +}
> +static const struct thermal_cooling_device_ops pcc_pwm_fan_cdev_ops = {
> +	.get_max_state = pcc_pwm_fan_thermal_max_state,
> +	.get_cur_state = pcc_pwm_fan_thermal_get_current_pwm,
> +	.set_cur_state = pcc_pwm_fan_thermal_set_fan_pwm,
> +};
>  
>  /* hotkey input device driver */
>  
> @@ -981,6 +1404,7 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
>  
>  static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  {
> +	const struct dmi_system_id *dmi_id;
>  	struct backlight_properties props;
>  	struct acpi_device *device;
>  	struct pcc_acpi *pcc;
> @@ -1013,6 +1437,9 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	/* Initialize mutex */
> +	mutex_init(&pcc->pwm_fan_lock);
> +
>  	pcc->sinf = kcalloc(num_sifr + 1, sizeof(u32), GFP_KERNEL);
>  	if (!pcc->sinf) {
>  		result = -ENOMEM;
> @@ -1026,6 +1453,15 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
>  	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
>  	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
>  
> +	/*
> +	 * Perform quirk detection
> +	 */
> +	dmi_id = dmi_first_match(pcc_quirks);
> +	if (dmi_id) {
> +		pcc->quirks = dmi_id->driver_data;
> +		pr_debug("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
> +	}
> +
>  	result = acpi_pcc_init_input(pcc);
>  	if (result) {
>  		pr_err("Error installing keyinput handler\n");
> @@ -1097,6 +1533,35 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
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
> +		pr_debug("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);
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
> +		pr_debug("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
> +		pcc->pwm_fan_cdev = thermal_cooling_device_register(
> +			"Panasonic_PWM_Fan", pcc, &pcc_pwm_fan_cdev_ops);
> +		if (IS_ERR(pcc->pwm_fan_cdev)) {
> +			pr_warn("has_ospm_pwm_fan: Failed to register thermal cdev\n");
> +			pcc->pwm_fan_cdev = NULL;
> +		}
> +	}
> +
> +out_no_quirks:
>  	return 0;
>  
>  out_platform:
> @@ -1124,6 +1589,13 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
>  	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
>  	struct pcc_acpi *pcc = acpi_driver_data(device);
>  
> +	if (pcc->pwm_fan_hwmon)
> +		hwmon_device_unregister(pcc->pwm_fan_hwmon);
> +	if (pcc->pwm_fan_cdev)
> +		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
> +
> +	mutex_destroy(&pcc->pwm_fan_lock);
> +
>  	i8042_remove_filter(panasonic_i8042_filter);
>  
>  	if (pcc->platform) {
> 
