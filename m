Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94632DF142;
	Mon, 12 Jan 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230795; cv=none; b=dnLY3qtfSNTAhp0PbBdCIJJydt1WvrWa2Oae8v8Q8eDv96097RD7M+6I1EQd4ac3he2yPpbR3DVDgD24ann8qriamxwbxEVVC4uMCJ+ii52AyUyCQH/bxJJNEECYq9b6im9vReDIG6e2mA5IsOb3T3YO5ozyoLg4gARP4zTp5y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230795; c=relaxed/simple;
	bh=646j+c/9Zjw9AjN95Op3P2zBNR1DffBty3AqfdN/3oI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IYCSDtqyb5QzELizwm26XmH7qyiSVTbtWuXZKLinOLFITgc6Ouw/hbftIMlj8fT7ZQCa64bsUIuNw7Tn2zxzA1Af9YEf+mBeYj2yQ6frDfFGdOtc4PROzY0u+szA2+5z/XdGspj5H/yDiZf9vjjmG2qT0kHJYIYucRdQ6p6KwNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WO20sDnB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WO20sDnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768230793; x=1799766793;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=646j+c/9Zjw9AjN95Op3P2zBNR1DffBty3AqfdN/3oI=;
  b=WO20sDnBOjbofy5R7MnNrUpI3zKDd6T3fcnsIsgp61RBnQkTMYohr6b9
   dwWQgIpYIssvBGFmP96Fuz8YJ7ZjJE/4YSalNNDYg7zipKetSp6tTTynC
   Qv/gxRW42T6g1V3uvlykePwuyT5cOid9jq0YRsROa8w1av9T+lTgHQwB/
   S/Ozk8vz1xNOXQHuERWozj+ubbG5uo3n7jvAGS/PvTagI7AeiGVBaJUfk
   y3cw00MopyIvSLA8/IjStXbONMz//oVmN47uEkO6I4uNu6A3AjkRDITw7
   KistbO2JFyMSckf1LmkCHj8A/LPsKkRgOlzBAABlk0ENgDXBoxq3wd9pW
   w==;
X-CSE-ConnectionGUID: cKFUTWl0TvSxJ4jaCyphew==
X-CSE-MsgGUID: ahuWRWnmS0e+EdVCNKox/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69560422"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69560422"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:13:12 -0800
X-CSE-ConnectionGUID: eNHiggXFSLiTMSjxJEgU3A==
X-CSE-MsgGUID: gfVkVG1CSPebSbLYQTFx8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="235347410"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:13:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Jan 2026 17:13:05 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: hp-wmi: add manual fan control for
 Victus S models
In-Reply-To: <20251230145053.516196-2-krishna.chomal108@gmail.com>
Message-ID: <ce48f7b8-7d88-266f-ca8d-6af3b01815db@linux.intel.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com> <20251230145053.516196-1-krishna.chomal108@gmail.com> <20251230145053.516196-2-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Dec 2025, Krishna Chomal wrote:

> Add manual fan speed control and PWM reporting for HP Victus S-series
> laptops.
> 
> While HPWMI_FAN_SPEED_SET_QUERY was previously added to reset max fan
> mode, it is actually capable of individual fan control. This patch
> implements hp_wmi_fan_speed_set() to allow manual control and hides
> PWM inputs for non-Victus devices as the query is Victus specific.
> 
> The existing hp_wmi_fan_speed_max_get() query is unreliable on Victus S
> firmware, often incorrectly reporting "Auto" mode even when "Max" is
> active. To resolve this synchronization issue, move state tracking to
> a per-device private context and apply "Auto" mode during driver
> initialization to ensure a consistent starting point.
> 
> Refactor hp_wmi_apply_fan_settings() to use an intermediate ret
> variable. This prepares the switch block for keep-alive logic being
> added in a later patch, avoiding the need for duplicated mode check.
> 
> Tested on: HP Omen 16-wf1xxx (board ID 8C78)
> 
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
> Changes in v2:
> - Added limits.h and minmax.h headers
> - Re-written pwm-to-rpm (and vice-versa) conversion from macros to
>   static inline functions
> - Removed redundant NULL checking of drvdata
> - Made integer promotion explicit by casting intermediate result to
>   unsigned int when calculating the GPU fan speed
> - Renamed "enforce_ctx" to "apply_fan_settings" for clarity
> - Removed unnecessary comments
> - Renamed "ctx" to "priv" as it is more consistent for drvdata
> - Added new struct victus_s_fan_table to avoid complex type casting
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 263 +++++++++++++++++++++++++------
>  1 file changed, 218 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f4ea1ea05997..ef419575174c 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -30,6 +30,10 @@
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
>  #include <linux/dmi.h>
> +#include <linux/fixp-arith.h>
> +#include <linux/limits.h>
> +#include <linux/minmax.h>
> +#include <linux/compiler_attributes.h>
>  
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI driver");
> @@ -190,7 +194,8 @@ enum hp_wmi_gm_commandtype {
>  	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
>  	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
>  	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
> -	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
> +	HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY	= 0x2E,
> +	HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY	= 0x2F,
>  };
>  
>  enum hp_wmi_command {
> @@ -348,6 +353,51 @@ static const char * const tablet_chassis_types[] = {
>  
>  #define DEVICE_MODE_TABLET	0x06
>  
> +#define CPU_FAN 0
> +#define GPU_FAN 1
> +
> +enum pwm_modes {
> +	PWM_MODE_MAX		= 0,
> +	PWM_MODE_MANUAL		= 1,
> +	PWM_MODE_AUTO		= 2,
> +};
> +
> +struct hp_wmi_hwmon_priv {
> +	u8 min_rpm;
> +	u8 max_rpm;
> +	u8 gpu_delta;
> +	u8 mode;
> +	u8 pwm;
> +};
> +
> +struct victus_s_fan_table_header {
> +	u8 unknown;
> +	u8 num_entries;
> +} __packed;

Please add #include for __packed.

> +struct victus_s_fan_table_entry {
> +	u8 cpu_rpm;
> +	u8 gpu_rpm;
> +	u8 unknown;
> +} __packed;
> +
> +struct victus_s_fan_table {
> +	struct victus_s_fan_table_header header;
> +	struct victus_s_fan_table_entry entries[];
> +} __packed;
> +
> +static inline u8 rpm_to_pwm(u8 rpm, struct hp_wmi_hwmon_priv *priv)
> +{
> +	return fixp_linear_interpolate(0, 0, priv->max_rpm, U8_MAX,
> +					clamp_val(rpm, 0, priv->max_rpm));

Please align the correctly.

> +}
> +
> +static inline u8 pwm_to_rpm(u8 pwm, struct hp_wmi_hwmon_priv *priv)
> +{
> +	return fixp_linear_interpolate(0, 0, U8_MAX, priv->max_rpm,
> +					clamp_val(pwm, 0, U8_MAX));
> +}
> +
>  /* map output size to the corresponding WMI method id */
>  static inline int encode_outsize_for_pvsz(int outsize)
>  {
> @@ -637,41 +687,53 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>  	return enabled;
>  }
>  
> -static int hp_wmi_fan_speed_reset(void)
> +static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
>  {
> -	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
> +	u8 fan_speed[2];
>  	int ret;
>  
> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
> -				   &fan_speed, sizeof(fan_speed), 0);
> -
> -	return ret;
> -}
> +	fan_speed[CPU_FAN] = speed;
> +	fan_speed[GPU_FAN] = speed;
>  
> -static int hp_wmi_fan_speed_max_reset(void)
> -{
> -	int ret;
> +	/*
> +	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
> +	 * this delta value from the fan table during hwmon init.
> +	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
> +	 * automatic mode.
> +	 */
> +	if (speed != HP_FAN_SPEED_AUTOMATIC)
> +		fan_speed[GPU_FAN] = clamp_val((unsigned int)speed +
> +						(unsigned int)priv->gpu_delta,
> +						0, U8_MAX);

Add braces is it's multiline if.

If you use unsigned int, clamp to 0 makes no sense as those values have 
already underflowed.

You also have an alignment problem here, but this seems a cleaner way 
which doesn't have underflow issues:

	if (...) {
		int new_speed = speed + priv->gpu_delta;

		fan_speed[GPU_FAN] = clamp_val(new_speed, 0, U8_MAX);
	}

>  
> +	ret = hp_wmi_get_fan_count_userdefine_trigger();
> +	if (ret < 0)
> +		return ret;
> +	/* Max fans need to be explicitly disabled */
>  	ret = hp_wmi_fan_speed_max_set(0);
> -	if (ret)
> +	if (ret < 0)
>  		return ret;
> +	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY, HPWMI_GM,
> +				   &fan_speed, sizeof(fan_speed), 0);
>  
> -	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
> -	ret = hp_wmi_fan_speed_reset();
>  	return ret;
>  }
>  
> -static int hp_wmi_fan_speed_max_get(void)
> +static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
>  {
> -	int val = 0, ret;
> +	return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
> +}
>  
> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> -				   &val, zero_if_sup(val), sizeof(val));
> +static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
> +{
> +	int ret;
>  
> +	ret = hp_wmi_fan_speed_max_set(0);
>  	if (ret)
> -		return ret < 0 ? ret : -EINVAL;
> +		return ret;
>  
> -	return val;
> +	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
> +	return hp_wmi_fan_speed_reset(priv);
>  }
>  
>  static int __init hp_wmi_bios_2008_later(void)
> @@ -2108,12 +2170,45 @@ static struct platform_driver hp_wmi_driver __refdata = {
>  	.remove = __exit_p(hp_wmi_bios_remove),
>  };
>  
> +static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
> +{
> +	int ret;
> +
> +	switch (priv->mode) {
> +	case PWM_MODE_MAX:
> +		if (is_victus_s_thermal_profile())
> +			hp_wmi_get_fan_count_userdefine_trigger();
> +		ret = hp_wmi_fan_speed_max_set(1);
> +		return ret;
> +	case PWM_MODE_MANUAL:
> +		if (!is_victus_s_thermal_profile())
> +			return -EOPNOTSUPP;
> +		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
> +		return ret;
> +	case PWM_MODE_AUTO:
> +		if (is_victus_s_thermal_profile()) {
> +			hp_wmi_get_fan_count_userdefine_trigger();
> +			ret = hp_wmi_fan_speed_max_reset(priv);
> +		} else {
> +			ret = hp_wmi_fan_speed_max_set(0);
> +		}
> +		return ret;
> +	default:
> +		/* shouldn't happen */
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  				       enum hwmon_sensor_types type,
>  				       u32 attr, int channel)
>  {
>  	switch (type) {
>  	case hwmon_pwm:
> +		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
> +			return 0;
>  		return 0644;
>  	case hwmon_fan:
>  		if (is_victus_s_thermal_profile()) {
> @@ -2134,8 +2229,10 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  			     u32 attr, int channel, long *val)
>  {
> -	int ret;
> +	struct hp_wmi_hwmon_priv *priv;
> +	int current_rpm, ret;
>  
> +	priv = dev_get_drvdata(dev);
>  	switch (type) {
>  	case hwmon_fan:
>  		if (is_victus_s_thermal_profile())
> @@ -2147,16 +2244,21 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  		*val = ret;
>  		return 0;
>  	case hwmon_pwm:
> -		switch (hp_wmi_fan_speed_max_get()) {
> -		case 0:
> -			/* 0 is automatic fan, which is 2 for hwmon */
> -			*val = 2;
> +		if (attr == hwmon_pwm_input) {
> +			if (!is_victus_s_thermal_profile())
> +				return -EOPNOTSUPP;

Add an empty line here.

> +			ret = hp_wmi_get_fan_speed_victus_s(channel);
> +			if (ret < 0)
> +				return ret;
> +			current_rpm = ret;

I'm not sure if using ret here makes things better or not, I'd prefer just 
assigning directly to current_rpm without ret as intermediate var.

> +			*val = rpm_to_pwm(current_rpm / 100, priv);
>  			return 0;
> -		case 1:
> -			/* 1 is max fan, which is 0
> -			 * (no fan speed control) for hwmon
> -			 */
> -			*val = 0;
> +		}
> +		switch (priv->mode) {
> +		case PWM_MODE_MAX:
> +		case PWM_MODE_MANUAL:
> +		case PWM_MODE_AUTO:
> +			*val = priv->mode;
>  			return 0;
>  		default:
>  			/* shouldn't happen */
> @@ -2170,23 +2272,47 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  			      u32 attr, int channel, long val)
>  {
> +	struct hp_wmi_hwmon_priv *priv;
> +	int current_rpm, ret;
> +
> +	priv = dev_get_drvdata(dev);
>  	switch (type) {
>  	case hwmon_pwm:
> +		if (attr == hwmon_pwm_input) {
> +			if (!is_victus_s_thermal_profile())
> +				return -EOPNOTSUPP;
> +			/* pwm input is invalid when not in manual mode */

PWM (capitalize textual/comment "pwm"s correctly please).

> +			if (priv->mode != PWM_MODE_MANUAL)
> +				return -EINVAL;

ADd empty line here.

> +			/* ensure pwm input is within valid fan speeds */

PWM

> +			priv->pwm = rpm_to_pwm(clamp_val(pwm_to_rpm(val, priv),
> +							priv->min_rpm,
> +							priv->max_rpm),

These look misaligned.

I suggest you split this to multiple lines though, it will likely be 
easier to read that way.

> +						priv);
> +			return hp_wmi_apply_fan_settings(priv);
> +		}
>  		switch (val) {
> -		case 0:
> -			if (is_victus_s_thermal_profile())
> -				hp_wmi_get_fan_count_userdefine_trigger();
> -			/* 0 is no fan speed control (max), which is 1 for us */
> -			return hp_wmi_fan_speed_max_set(1);
> -		case 2:
> -			/* 2 is automatic speed control, which is 0 for us */
> -			if (is_victus_s_thermal_profile()) {
> -				hp_wmi_get_fan_count_userdefine_trigger();
> -				return hp_wmi_fan_speed_max_reset();
> -			} else
> -				return hp_wmi_fan_speed_max_set(0);
> +		case PWM_MODE_MAX:
> +			priv->mode = PWM_MODE_MAX;
> +			return hp_wmi_apply_fan_settings(priv);
> +		case PWM_MODE_MANUAL:
> +			if (!is_victus_s_thermal_profile())
> +				return -EOPNOTSUPP;
> +			/*
> +			 * When switching to manual mode, set fan speed to
> +			 * current RPM values to ensure a smooth transition.
> +			 */
> +			ret = hp_wmi_get_fan_speed_victus_s(channel);

Assign directly to current_rpm ?

> +			if (ret < 0)
> +				return ret;
> +			current_rpm = ret;
> +			priv->pwm = rpm_to_pwm(current_rpm / 100, priv);
> +			priv->mode = PWM_MODE_MANUAL;
> +			return hp_wmi_apply_fan_settings(priv);
> +		case PWM_MODE_AUTO:
> +			priv->mode = PWM_MODE_AUTO;
> +			return hp_wmi_apply_fan_settings(priv);
>  		default:
> -			/* we don't support manual fan speed control */
>  			return -EINVAL;
>  		}
>  	default:
> @@ -2196,7 +2322,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  
>  static const struct hwmon_channel_info * const info[] = {
>  	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> -	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
>  	NULL
>  };
>  
> @@ -2211,12 +2337,57 @@ static const struct hwmon_chip_info chip_info = {
>  	.info = info,
>  };
>  
> +static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> +{
> +	u8 fan_data[128] = { 0 };
> +	struct victus_s_fan_table *fan_table;
> +	u8 min_rpm, max_rpm, gpu_delta;
> +	int ret;
> +
> +	/* Default behaviour on hwmon init is automatic mode */
> +	priv->mode = PWM_MODE_AUTO;
> +
> +	/* Bypass all non-Victus S devices */
> +	if (!is_victus_s_thermal_profile())
> +		return 0;
> +
> +	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
> +				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
> +	if (ret)
> +		return ret;
> +
> +	fan_table = (struct victus_s_fan_table *)fan_data;
> +	if (fan_table->header.num_entries == 0 ||
> +		sizeof(struct victus_s_fan_table_header) +
> +		sizeof(struct victus_s_fan_table_entry) * fan_table->header.num_entries >
> +		sizeof(fan_data))

Badly misaligned.

Splitting at > is somewhat misleading so I'd prefer to avoid it (you can 
use up to 100 chars per line if needed).

> +		return -EINVAL;
> +
> +	min_rpm = fan_table->entries[0].cpu_rpm;
> +	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
> +	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
> +	priv->min_rpm = min_rpm;
> +	priv->max_rpm = max_rpm;
> +	priv->gpu_delta = gpu_delta;
> +
> +	return 0;
> +}
> +
>  static int hp_wmi_hwmon_init(void)
>  {
>  	struct device *dev = &hp_wmi_platform_dev->dev;
> +	struct hp_wmi_hwmon_priv *priv;
>  	struct device *hwmon;
> +	int ret;
>  
> -	hwmon = devm_hwmon_device_register_with_info(dev, "hp", &hp_wmi_driver,
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = hp_wmi_setup_fan_settings(priv);
> +	if (ret)
> +		return ret;
> +	hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
>  						     &chip_info, NULL);
>  
>  	if (IS_ERR(hwmon)) {
> @@ -2224,6 +2395,8 @@ static int hp_wmi_hwmon_init(void)
>  		return PTR_ERR(hwmon);
>  	}
>  
> +	hp_wmi_apply_fan_settings(priv);
> +
>  	return 0;
>  }
>  
> 

-- 
 i.

