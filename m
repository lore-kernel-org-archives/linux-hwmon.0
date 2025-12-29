Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7E9312827;
	Mon, 29 Dec 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013705; cv=none; b=JJp39xwUUakJ2fcKsoNsrbqNqC3fD8k/aibCEiAy99lKS/Py9lpNh2P4yVsd55xKatmr8hdqYAS4gW58PiDMMuzwlkPWdYfM9GxXrXnOn3sYn4pI/Mckde2hCfoiSCu84l7/0/IESYFlAjyqy48D7QmFYXma2hgJ5d+Q3chQ+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013705; c=relaxed/simple;
	bh=Ndclzk2Zs5ARyboJODNdyA5o74Pag/7ZF94qSRBvneg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ABNDCUk998ivcDcGpYFkX/Up6SLjoJ155EgTyMGsxZtKMWeOkX3WnSPcFQYW1op/ZTm/zA38unicENxYfxg0NHFLmaeQJ6JIiWc25Go4idlLvIaKgUO9mOJLUMtmXB/LWdI5YSk6dWAGwNGqCFrH83Ex0aooZstDmzMKmH++SgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdLlzAFT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdLlzAFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767013702; x=1798549702;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ndclzk2Zs5ARyboJODNdyA5o74Pag/7ZF94qSRBvneg=;
  b=bdLlzAFTUezDVZ8VGfFRds7XLP9klJFNHHCCYJRMsJWRkrC44nb7Lf6I
   YosSCDfrQbGbQr5njdLltjdT1ARSvVpVDI2Z3RABNu1RpCVwHvDDw+vL9
   55waY0OjDw5JkdSddjRlN06UubWqtdYbasHVBG+NjNBjczuECj7Z50pzl
   XYcyQVvLrgdLbjfdH8ihMHcQyFf18wNkEriL28jjud9fEecBRsAuW7Ll/
   4UThay7JHUr5o7qUkqAkIoynOpPOyY0TeXT5R8VPpRKR/rRSx2qK/lIcX
   1KSjflkQJzyQeasv65l+53IwpG1GDSkF3YdWLovTTxzOI5CFNZB5E3rwJ
   A==;
X-CSE-ConnectionGUID: O641V7NtRyuPnIm/qyEL8A==
X-CSE-MsgGUID: dobRWd9rQO+9iVqqGj+Pfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="86200223"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="86200223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:08:21 -0800
X-CSE-ConnectionGUID: QHOs/SXMQYypx4eeLA7czA==
X-CSE-MsgGUID: mF4v/0cBTLaxai5dVPqE8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200813364"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:08:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 15:08:16 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: add manual fan control for
 Victus S models
In-Reply-To: <20251225142310.204831-2-krishna.chomal108@gmail.com>
Message-ID: <f1b47b8e-d38b-b62e-6102-12edac08d6d7@linux.intel.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com> <20251225142310.204831-2-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Dec 2025, Krishna Chomal wrote:

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
> a per-device private context and enforce "Auto" mode during driver
> initialization to ensure a consistent starting point.
> 
> Tested on: HP Omen 16-wf1xxx (board ID 8C78)
> 
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 243 +++++++++++++++++++++++++------
>  1 file changed, 199 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f4ea1ea05997..9fb956ce809a 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -30,6 +30,7 @@
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
>  #include <linux/dmi.h>
> +#include <linux/fixp-arith.h>
>  
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI driver");
> @@ -190,7 +191,8 @@ enum hp_wmi_gm_commandtype {
>  	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
>  	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
>  	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
> -	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
> +	HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY	= 0x2E,
> +	HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY	= 0x2F,
>  };
>  
>  enum hp_wmi_command {
> @@ -348,6 +350,32 @@ static const char * const tablet_chassis_types[] = {
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
> +#define RPM_TO_PWM(rpm, ctx) fixp_linear_interpolate(0, 0, \
> +						(ctx)->max_rpm, U8_MAX, \

+ limits.h

> +						clamp_val((rpm), \

+ minmax.h

> +						0, (ctx)->max_rpm))
> +#define PWM_TO_RPM(pwm, ctx) fixp_linear_interpolate(0, 0, \
> +						U8_MAX, (ctx)->max_rpm, \
> +						clamp_val((pwm), \
> +						0, U8_MAX))

These look not needing to be macros at all but could be written as static 
functions which makes typing explicit.

> +
>  /* map output size to the corresponding WMI method id */
>  static inline int encode_outsize_for_pvsz(int outsize)
>  {
> @@ -637,41 +665,55 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>  	return enabled;
>  }
>  
> -static int hp_wmi_fan_speed_reset(void)
> +static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *ctx, u8 speed)
>  {
> -	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
> +	u8 fan_speed[2];
>  	int ret;
>  
> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
> -				   &fan_speed, sizeof(fan_speed), 0);
> +	if (!ctx)
> +		return -ENODEV;

Can this be NULL? Is it a bug in the driver/kernel if it is?

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
> +		fan_speed[GPU_FAN] = clamp_val(speed + ctx->gpu_delta, 0, U8_MAX);

So this only works correctly due to C's integer promotion when doing 
arithmetic on them?

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
> +static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *ctx)
>  {
> -	int val = 0, ret;
> +	return hp_wmi_fan_speed_set(ctx, HP_FAN_SPEED_AUTOMATIC);
> +}
>  
> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> -				   &val, zero_if_sup(val), sizeof(val));
> +static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *ctx)
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
> +	ret = hp_wmi_fan_speed_reset(ctx);
> +	return ret;

Return can be done directly on the line with the call.

>  }
>  
>  static int __init hp_wmi_bios_2008_later(void)
> @@ -2108,12 +2150,43 @@ static struct platform_driver hp_wmi_driver __refdata = {
>  	.remove = __exit_p(hp_wmi_bios_remove),
>  };
>  
> +static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)

I don't understand why this function is named as "enforce context". 
Perhaps change function's name to something that better describes what it 
does.

> +{
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	switch (ctx->mode) {
> +	case PWM_MODE_MAX:
> +		if (is_victus_s_thermal_profile())
> +			hp_wmi_get_fan_count_userdefine_trigger();
> +		return hp_wmi_fan_speed_max_set(1);
> +	case PWM_MODE_MANUAL:
> +		if (!is_victus_s_thermal_profile())
> +			return -EOPNOTSUPP;
> +		return hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
> +	case PWM_MODE_AUTO:
> +		if (is_victus_s_thermal_profile()) {
> +			hp_wmi_get_fan_count_userdefine_trigger();
> +			return hp_wmi_fan_speed_max_reset(ctx);
> +		} else {

Unnecessary else.

> +			return hp_wmi_fan_speed_max_set(0);
> +		}
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
> +			return 0; /* Hide PWM input if not Victus S */

The comment add no information beyond what the code already tells us.

>  		return 0644;
>  	case hwmon_fan:
>  		if (is_victus_s_thermal_profile()) {
> @@ -2134,7 +2207,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  			     u32 attr, int channel, long *val)
>  {
> -	int ret;
> +	struct hp_wmi_hwmon_priv *ctx;
> +	int current_rpm, ret;
> +
> +	ctx = dev_get_drvdata(dev);
> +	if (!ctx)
> +		return -ENODEV;
>  
>  	switch (type) {
>  	case hwmon_fan:
> @@ -2147,16 +2225,21 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
> +			ret = hp_wmi_get_fan_speed_victus_s(channel);
> +			if (ret < 0)
> +				return ret;
> +			current_rpm = ret;
> +			*val = RPM_TO_PWM(current_rpm / 100, ctx);
>  			return 0;
> -		case 1:
> -			/* 1 is max fan, which is 0
> -			 * (no fan speed control) for hwmon
> -			 */
> -			*val = 0;
> +		}
> +		switch (ctx->mode) {
> +		case PWM_MODE_MAX:
> +		case PWM_MODE_MANUAL:
> +		case PWM_MODE_AUTO:
> +			*val = ctx->mode;
>  			return 0;
>  		default:
>  			/* shouldn't happen */
> @@ -2170,23 +2253,50 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  			      u32 attr, int channel, long val)
>  {
> +	struct hp_wmi_hwmon_priv *ctx;
> +	int current_rpm, ret;
> +
> +	ctx = dev_get_drvdata(dev);
> +	if (!ctx)

Don't you register it with a non-NULL drvdata always?

> +		return -ENODEV;
> +
>  	switch (type) {
>  	case hwmon_pwm:
> +		if (attr == hwmon_pwm_input) {
> +			if (!is_victus_s_thermal_profile())
> +				return -EOPNOTSUPP;
> +			/* pwm input is invalid when not in manual mode */
> +			if (ctx->mode != PWM_MODE_MANUAL)
> +				return -EINVAL;
> +			/* ensure pwm input is within valid fan speeds */
> +			ctx->pwm = RPM_TO_PWM(clamp_val(PWM_TO_RPM(val, ctx),
> +							ctx->min_rpm,
> +							ctx->max_rpm),
> +						ctx);
> +			return hp_wmi_hwmon_enforce_ctx(ctx);
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
> +			ctx->mode = PWM_MODE_MAX;
> +			return hp_wmi_hwmon_enforce_ctx(ctx);
> +		case PWM_MODE_MANUAL:
> +			if (!is_victus_s_thermal_profile())
> +				return -EOPNOTSUPP;
> +			/*
> +			 * When switching to manual mode, set fan speed to
> +			 * current RPM values to ensure a smooth transition.
> +			 */
> +			ret = hp_wmi_get_fan_speed_victus_s(channel);
> +			if (ret < 0)
> +				return ret;
> +			current_rpm = ret;
> +			ctx->pwm = RPM_TO_PWM(current_rpm / 100, ctx);
> +			ctx->mode = PWM_MODE_MANUAL;
> +			return hp_wmi_hwmon_enforce_ctx(ctx);
> +		case PWM_MODE_AUTO:
> +			ctx->mode = PWM_MODE_AUTO;
> +			return hp_wmi_hwmon_enforce_ctx(ctx);
>  		default:
> -			/* we don't support manual fan speed control */
>  			return -EINVAL;
>  		}
>  	default:
> @@ -2196,7 +2306,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  
>  static const struct hwmon_channel_info * const info[] = {
>  	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> -	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
>  	NULL
>  };
>  
> @@ -2211,12 +2321,55 @@ static const struct hwmon_chip_info chip_info = {
>  	.info = info,
>  };
>  
> +static int hp_wmi_hwmon_setup_ctx(struct hp_wmi_hwmon_priv *ctx)

I suggest you change "ctx" in the name to something more meaningful.

> +{
> +	u8 fan_data[128];
> +	u8 (*fan_table)[3];
> +	u8 rows, min_rpm, max_rpm, gpu_delta;
> +	int ret;
> +
> +	/* Default behaviour on hwmon init is automatic mode */
> +	ctx->mode = PWM_MODE_AUTO;
> +
> +	/* Bypass all non-Victus S devices */
> +	if (!is_victus_s_thermal_profile())
> +		return 0;
> +
> +	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
> +				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));

Does this end up coping from uninitialized fan_data (insize = 4)?

> +	if (ret != 0)

if (ret)

> +		return ret;
> +
> +	rows = fan_data[1];
> +	if (2 + rows * 3 >= sizeof(fan_data))
> +		return -EINVAL;
> +
> +	fan_table = (u8 (*)[3]) & fan_data[2];

Heh, a cast disguished as a bitwise and (due to misleading spacing).

Can you make a real struct out of this so you could access the members 
properly without these literal offsets and casting madness? You might need 
to use DECLARE_FLEX_ARRAY().

> +	min_rpm = fan_table[0][CPU_FAN];
> +	max_rpm = fan_table[rows - 1][CPU_FAN];
> +	gpu_delta = fan_table[0][GPU_FAN] - fan_table[0][CPU_FAN];
> +	ctx->min_rpm = min_rpm;
> +	ctx->max_rpm = max_rpm;
> +	ctx->gpu_delta = gpu_delta;
> +
> +	return 0;
> +}
> +
>  static int hp_wmi_hwmon_init(void)
>  {
>  	struct device *dev = &hp_wmi_platform_dev->dev;
> +	struct hp_wmi_hwmon_priv *ctx;
>  	struct device *hwmon;
> +	int ret;
>  
> -	hwmon = devm_hwmon_device_register_with_info(dev, "hp", &hp_wmi_driver,
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = hp_wmi_hwmon_setup_ctx(ctx);
> +	if (ret != 0)
> +		return ret;
> +	hwmon = devm_hwmon_device_register_with_info(dev, "hp", ctx,
>  						     &chip_info, NULL);
>  
>  	if (IS_ERR(hwmon)) {
> @@ -2224,6 +2377,8 @@ static int hp_wmi_hwmon_init(void)
>  		return PTR_ERR(hwmon);
>  	}
>  
> +	hp_wmi_hwmon_enforce_ctx(ctx);
> +
>  	return 0;
>  }
>  
> 

-- 
 i.

