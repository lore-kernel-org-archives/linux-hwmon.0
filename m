Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE3D315D2F;
	Mon, 29 Dec 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014511; cv=none; b=j+SBK36hM7bFJNqIyMyDQ2SC2kI4s9lO9EIqYCd/65R4tuyfErCXva9hHFHSbJwPvILf80Y5pJ+eQhOYlKI+IOHs589e5MafH7KYQSSrcCljTmiPNqoEhmDjCsXqBENNtpO74ElTAfQQD1W/2wjoDGN23QmbbhRAezTcFziQDTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014511; c=relaxed/simple;
	bh=euF2Rn3J/0a39W7BqXwikQXTo0mHhXBQOHWPcRpRw5Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MvbaQ5Nxz3PIsG2lmt9Fqdb4i2DILtS9aUMmTw8Z731mAE4+KsSzfMdaWRgtRvtgX5Yn7B1xtMANlRVi2n1yzqg7dCAAhplKvH7z2e8h6g9AYHnAWsByd+PSPwAucG2rbBUgvA3sWqnbPKlI5OUaV8uts42R3eF2xTuyjmjq768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFvWlrSg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFvWlrSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767014510; x=1798550510;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=euF2Rn3J/0a39W7BqXwikQXTo0mHhXBQOHWPcRpRw5Y=;
  b=WFvWlrSgRRcDrkk5+WwGdgunfKNSsjBzt+7Pc8zIDfxAZZd2LHX9k76j
   n7vKDoMXdOYkzDqJOnJkWb5mysvN5XOzT9C2w3tOUHzx+6D/uRThC6uWs
   zkeiE/+WiPHFRIvuqIIP6Db3baqkJUqZVxJnCS/bq2WUlIYz+z96CE+TV
   tNZ53CJDz3iBgNkGkM+REnkSFeeC7anyGD01IErlo4kJEgPGHxmLRZOdf
   /SqPt84GkIQ0crjEgLoStF3sj/irscv6cJ/slmmgGqDOrre6F94Ln0dp6
   7nLa4H8NuoyGIhTJcU+tNeEbQ4VhI5hg8Ao36YyNcREWv3uFpRF++I4/+
   g==;
X-CSE-ConnectionGUID: BKvslMb2S1S3hXA+HwdUpA==
X-CSE-MsgGUID: u370U8hMQZmO93fiECyv0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68376802"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="68376802"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:21:49 -0800
X-CSE-ConnectionGUID: 9clG72k2ScysaNs1SCUz0Q==
X-CSE-MsgGUID: gSx7fw/JRGmnQ7+oftmZUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200643909"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:21:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 15:21:42 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: implement fan keep-alive
In-Reply-To: <20251225142310.204831-3-krishna.chomal108@gmail.com>
Message-ID: <7072d96f-455a-5249-2553-6e72e6a00577@linux.intel.com>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com> <20251225142310.204831-3-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Dec 2025, Krishna Chomal wrote:

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
>  drivers/platform/x86/hp/hp-wmi.c | 52 +++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 9fb956ce809a..fbe012e7a342 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -31,6 +31,7 @@
>  #include <linux/string.h>
>  #include <linux/dmi.h>
>  #include <linux/fixp-arith.h>
> +#include <linux/workqueue.h>
>  
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI driver");
> @@ -365,8 +366,15 @@ struct hp_wmi_hwmon_priv {
>  	u8 gpu_delta;
>  	u8 mode;
>  	u8 pwm;
> +	struct delayed_work keep_alive_dwork;
>  };
>  
> +/*
> + * 90s delay to prevent the firmware from resetting fan mode after fixed
> + * 120s timeout
> + */
> +#define KEEP_ALIVE_DELAY	90

For any time related define, please include its unit in the name so a 
person reading code can immediately know it.

> +
>  #define RPM_TO_PWM(rpm, ctx) fixp_linear_interpolate(0, 0, \
>  						(ctx)->max_rpm, U8_MAX, \
>  						clamp_val((rpm), \
> @@ -2073,6 +2081,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  static void __exit hp_wmi_bios_remove(struct platform_device *device)
>  {
>  	int i;
> +	struct hp_wmi_hwmon_priv *ctx;
>  
>  	for (i = 0; i < rfkill2_count; i++) {
>  		rfkill_unregister(rfkill2[i].rfkill);
> @@ -2091,6 +2100,10 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
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
> @@ -2152,6 +2165,8 @@ static struct platform_driver hp_wmi_driver __refdata = {
>  
>  static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)
>  {
> +	int ret;
> +
>  	if (!ctx)
>  		return -ENODEV;
>  
> @@ -2159,23 +2174,36 @@ static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)
>  	case PWM_MODE_MAX:
>  		if (is_victus_s_thermal_profile())
>  			hp_wmi_get_fan_count_userdefine_trigger();
> -		return hp_wmi_fan_speed_max_set(1);
> +		ret = hp_wmi_fan_speed_max_set(1);
> +		break;
>  	case PWM_MODE_MANUAL:
>  		if (!is_victus_s_thermal_profile())
>  			return -EOPNOTSUPP;
> -		return hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
> +		ret = hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
> +		break;
>  	case PWM_MODE_AUTO:
>  		if (is_victus_s_thermal_profile()) {
>  			hp_wmi_get_fan_count_userdefine_trigger();
> -			return hp_wmi_fan_speed_max_reset(ctx);
> +			ret = hp_wmi_fan_speed_max_reset(ctx);
>  		} else {
> -			return hp_wmi_fan_speed_max_set(0);
> +			ret = hp_wmi_fan_speed_max_set(0);
>  		}
> +		break;
>  	default:
>  		/* shouldn't happen */
>  		return -EINVAL;
>  	}
>  
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Reschedule keep-alive work based on the new state */
> +	if (ctx->mode == PWM_MODE_MAX || ctx->mode == PWM_MODE_MANUAL)
> +		schedule_delayed_work(&ctx->keep_alive_dwork,
> +				      secs_to_jiffies(KEEP_ALIVE_DELAY));
> +	else
> +		cancel_delayed_work_sync(&ctx->keep_alive_dwork);

This is now duplicating the switch/case, just add these to the existing 
cases.

You may want to introduce ret variable already in PATCH 1/2 and add a note 
there that an upcoming change is going to add keep-alive so the return 
value has to be stored temporarily.

> +
>  	return 0;
>  }
>  
> @@ -2321,6 +2349,20 @@ static const struct hwmon_chip_info chip_info = {
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
> +	 * NOTE: hp_wmi_hwmon_enforce_ctx will handle the re-scheduling.
> +	 */
> +	hp_wmi_hwmon_enforce_ctx(ctx);

(I only now understand why you named this function like this, and I still 
don't think it's a good name for it as you've other callers besides this 
one real "enforcing" case.)

> +}
> +
>  static int hp_wmi_hwmon_setup_ctx(struct hp_wmi_hwmon_priv *ctx)
>  {
>  	u8 fan_data[128];
> @@ -2377,6 +2419,8 @@ static int hp_wmi_hwmon_init(void)
>  		return PTR_ERR(hwmon);
>  	}
>  
> +	INIT_DELAYED_WORK(&ctx->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
> +	platform_set_drvdata(hp_wmi_platform_dev, ctx);
>  	hp_wmi_hwmon_enforce_ctx(ctx);
>  
>  	return 0;
> 

-- 
 i.

