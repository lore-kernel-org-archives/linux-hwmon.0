Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A12BDC0E;
	Mon, 12 Jan 2026 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230860; cv=none; b=U05hqIqARCBN5tWEFpF5Z37IBEGD6UDc8rmJcUs7yPwm30s1FHj0NInwzQqc3TYy4ai8jyyATDURVrO+hHfDCJ9ALs+1E++ykqe0VKFiN6RDPqpFv6yPr1/5rhDc29gL3Q7ffrcja0CpTqpCBmbyjV+QCRB/XdHrGoLNjA9CWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230860; c=relaxed/simple;
	bh=A+/240UmPAp5wZTKS2iONVXUQaVqnU4Hd+H+aXSCXI4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mkmXExLBNp1XXHQ04hR5GGzBjjx2LKFYTAbnEFFwVLPE0IeFw7uqJBIuIYWe7kmyi8cDE3rxxwJtyDX5oxOA57mBISTsKLSZ8Y1ekpuKbqudj57z8Be9kDRUSMZ/yMHZWWHfpDroK6lkWRObNDk9/CLeMqleE4pGc4MEbqpbfTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SphlLoQj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SphlLoQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768230859; x=1799766859;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A+/240UmPAp5wZTKS2iONVXUQaVqnU4Hd+H+aXSCXI4=;
  b=SphlLoQjWmJCYFp1c2Bkz8rlzwekpmJxx+7E0cdsAjX9y1AujRK/8fFG
   Piormxjd/nqXvMyvSaekbou0oOdOQTmdgx/vDR4MutDH6M06I1TeFb0UQ
   +WYqab3qEsiiI36C6/i1e/NjVY/bL3BoSXU5Xh5q4yOLU1Oneh+DTxAvJ
   guQvSNcDln1kmJSWXn3+TFfopoLrHpf6ToIi02pUWV0lABzFzmkFchzPh
   7WyN11nZWqkCtJyiVZnAZogDZlkc2cXlvgavEc6MUfiBHhYw2C3vYRStR
   bU4gsAGbsBqKBrUCJbb4epiAoTBMEbi6f+ywIw2fa1JOF0NQLxGpixmbw
   g==;
X-CSE-ConnectionGUID: G+Dg9bQWQ9a4S5zn3jFCnw==
X-CSE-MsgGUID: m0/7taZgTJ2YQATU77o6BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73349226"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="73349226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:14:19 -0800
X-CSE-ConnectionGUID: PpVogh2hRA6CGT8LQ4PIQQ==
X-CSE-MsgGUID: M82rBMH1QlyADsGPFrYFGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="203265788"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:14:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Jan 2026 17:14:12 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] platform/x86: hp-wmi: implement fan keep-alive
In-Reply-To: <20251230145053.516196-3-krishna.chomal108@gmail.com>
Message-ID: <6b2be55e-dcfe-74b7-d8ca-b78f49cedb7a@linux.intel.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com> <20251230145053.516196-1-krishna.chomal108@gmail.com> <20251230145053.516196-3-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Dec 2025, Krishna Chomal wrote:

> The firmware on some HP laptops automatically reverts the fan speed
> control to "Auto" mode after a 120 second timeout window.
> 
> To ensure that the user-selected fan profile (Max/Manual) persists,
> implement a keep-alive mechanism that periodically refreshes the fan
> mode trigger before the timeout occurs.
> 
> - Introduce a delayed workqueue to trigger the fan mode refresh every 90
>   seconds, ensuring the system maintains the correct fan mode setting.
> - Integrate the refresh mechanism into hp_wmi_hwmon_enforce_ctx() to
>   start, update or cancel the keep-alive process based on the current
>   fan mode.
> 
> This ensures that the driver stays in sync with the hardware.
> 
> Tested on: HP Omen 16-wf1xxx (board ID 8C78)
> 
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
> Changes in v2:
> - Explicitly specify time unit in KEEP_ALIVE_DELAY macro
> - Handle work rescheduling directly in switch/case
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 46 +++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index ef419575174c..cf9327e1f40e 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -34,6 +34,7 @@
>  #include <linux/limits.h>
>  #include <linux/minmax.h>
>  #include <linux/compiler_attributes.h>
> +#include <linux/workqueue.h>
>  
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI driver");
> @@ -368,6 +369,7 @@ struct hp_wmi_hwmon_priv {
>  	u8 gpu_delta;
>  	u8 mode;
>  	u8 pwm;
> +	struct delayed_work keep_alive_dwork;
>  };
>  
>  struct victus_s_fan_table_header {
> @@ -386,6 +388,12 @@ struct victus_s_fan_table {
>  	struct victus_s_fan_table_entry entries[];
>  } __packed;
>  
> +/*
> + * 90s delay to prevent the firmware from resetting fan mode after fixed
> + * 120s timeout
> + */
> +#define KEEP_ALIVE_DELAY_SECS     90
> +
>  static inline u8 rpm_to_pwm(u8 rpm, struct hp_wmi_hwmon_priv *priv)
>  {
>  	return fixp_linear_interpolate(0, 0, priv->max_rpm, U8_MAX,
> @@ -2093,6 +2101,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  static void __exit hp_wmi_bios_remove(struct platform_device *device)
>  {
>  	int i;
> +	struct hp_wmi_hwmon_priv *ctx;

Can't we just call this priv everywhere as per the normal custom?

>  
>  	for (i = 0; i < rfkill2_count; i++) {
>  		rfkill_unregister(rfkill2[i].rfkill);
> @@ -2111,6 +2120,10 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
>  		rfkill_unregister(wwan_rfkill);
>  		rfkill_destroy(wwan_rfkill);
>  	}
> +
> +	ctx = platform_get_drvdata(device);
> +	if (ctx)
> +		cancel_delayed_work_sync(&ctx->keep_alive_dwork);
>  }
>  
>  static int hp_wmi_resume_handler(struct device *device)
> @@ -2179,12 +2192,20 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  		if (is_victus_s_thermal_profile())
>  			hp_wmi_get_fan_count_userdefine_trigger();
>  		ret = hp_wmi_fan_speed_max_set(1);
> -		return ret;
> +		if (ret < 0)
> +			return ret;
> +		schedule_delayed_work(&priv->keep_alive_dwork,
> +				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> +		return 0;
>  	case PWM_MODE_MANUAL:
>  		if (!is_victus_s_thermal_profile())
>  			return -EOPNOTSUPP;
>  		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
> -		return ret;
> +		if (ret < 0)
> +			return ret;
> +		schedule_delayed_work(&priv->keep_alive_dwork,
> +				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> +		return 0;
>  	case PWM_MODE_AUTO:
>  		if (is_victus_s_thermal_profile()) {
>  			hp_wmi_get_fan_count_userdefine_trigger();
> @@ -2192,7 +2213,10 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  		} else {
>  			ret = hp_wmi_fan_speed_max_set(0);
>  		}
> -		return ret;
> +		if (ret < 0)
> +			return ret;
> +		cancel_delayed_work_sync(&priv->keep_alive_dwork);
> +		return 0;
>  	default:
>  		/* shouldn't happen */
>  		return -EINVAL;
> @@ -2337,6 +2361,20 @@ static const struct hwmon_chip_info chip_info = {
>  	.info = info,
>  };
>  
> +static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
> +{
> +	struct delayed_work *dwork;
> +	struct hp_wmi_hwmon_priv *ctx;
> +
> +	dwork = to_delayed_work(work);
> +	ctx = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
> +	/*
> +	 * Re-apply the current hwmon context settings.
> +	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
> +	 */
> +	hp_wmi_apply_fan_settings(ctx);
> +}
> +
>  static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  {
>  	u8 fan_data[128] = { 0 };
> @@ -2395,6 +2433,8 @@ static int hp_wmi_hwmon_init(void)
>  		return PTR_ERR(hwmon);
>  	}
>  
> +	INIT_DELAYED_WORK(&priv->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
> +	platform_set_drvdata(hp_wmi_platform_dev, priv);
>  	hp_wmi_apply_fan_settings(priv);
>  
>  	return 0;
> 

-- 
 i.

