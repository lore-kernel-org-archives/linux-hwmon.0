Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34561C2B9F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 18:53:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13EA4613E5
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 18:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbhE1SzV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 14:55:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:60028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhE1SzV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 14:55:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4293610FC;
        Fri, 28 May 2021 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228026;
        bh=w4h+CKzeBuRob7ROlyJFpZ1e6o8TwnNAWFgWDHu0FI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rLxDll6bigWJdDQ0Kw2GZwuOiTth/MGGK2GXL0f1KfCFU9BDsNJLb2m9g4ZTxirbc
         1gBE2rqr03GB/NRdPM+OlLEOxp0azGy9sRVULc8qnaO5fqzEHHu7L2l9j6zzhy49Lr
         WdB8ZpcQdKnYfp2EMy+6Jxbdd0ffcQ4QxegfhLm0IyesQL3otC3T1ZfGLAugwGzU3O
         EpIKUZ9pBIS21nTm8V9JLK1x3haUL2qCLoan4/lRnZZwskJ0HHu/aNUw6eCDRuu88x
         lkrk/+z19D+F3QPGyOCG1ewiqT1EjIb8u+BkH7aHWlh7zwLhLSwtC3OuTjV6e1XJgV
         9EakolT385XCA==
Received: by pali.im (Postfix)
        id 7DE88B0B; Fri, 28 May 2021 20:53:43 +0200 (CEST)
Date:   Fri, 28 May 2021 20:53:43 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] hwmon: (dell-smm-hwmon) Use platform device
Message-ID: <20210528185343.zxpmxqh7a2qtodhh@pali>
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528173716.10975-2-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 28 May 2021 19:37:11 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Register a platform device for usage with
> devm_hwmon_device_register_with_groups.
> Also the platform device is necessary for
> future changes.

This patch changes output in 'sensors' utility:

Without this patch it prints:
  dell_smm-virtual-0
  Adapter: Virtual device

And with patch it prints:
  dell_smm-isa-0000
  Adapter: ISA adapter

Interesting is that in this patch there is no reference to ISA and
neither to Virtual.

I think it needs to be related to symlinks in /sys/class/hwmon hierarchy
as this patch changes it:

(prior)
$ ll /sys/class/hwmon/hwmon1
lrwxrwxrwx 1 root root 0 máj 28 20:42 /sys/class/hwmon/hwmon1 -> ../../devices/virtual/hwmon/hwmon1/

(after)
$ ll /sys/class/hwmon/hwmon1
lrwxrwxrwx 1 root root 0 máj 28 20:42 /sys/class/hwmon/hwmon1 -> ../../devices/platform/dell_smm_hwmon/hwmon/hwmon1/

But I'm not sure what is correct to print in 'Adapter' section. Both
Virtual and ISA looks like bogus values for which I do not care.

Guenter, I will this part up to you, what you want to have in output.

Other comments are below.

> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 115 ++++++++++++++++++---------------
>  1 file changed, 63 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index f2221ca0aa7b..2038f2a50e11 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -14,7 +14,9 @@
> 
>  #include <linux/cpu.h>
>  #include <linux/delay.h>
> +#include <linux/err.h>
>  #include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
>  #include <linux/proc_fs.h>
> @@ -896,7 +898,7 @@ static const struct attribute_group i8k_group = {
>  };
>  __ATTRIBUTE_GROUPS(i8k);
> 
> -static int __init i8k_init_hwmon(void)
> +static int __init dell_smm_init_hwmon(struct device *dev)
>  {
>  	int err;
> 
> @@ -956,15 +958,9 @@ static int __init i8k_init_hwmon(void)
>  	if (err >= 0)
>  		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN3;
> 
> -	i8k_hwmon_dev = hwmon_device_register_with_groups(NULL, "dell_smm",
> -							  NULL, i8k_groups);
> -	if (IS_ERR(i8k_hwmon_dev)) {
> -		err = PTR_ERR(i8k_hwmon_dev);
> -		i8k_hwmon_dev = NULL;
> -		pr_err("hwmon registration failed (%d)\n", err);
> -		return err;
> -	}
> -	return 0;
> +	i8k_hwmon_dev = devm_hwmon_device_register_with_groups(dev, "dell_smm", NULL, i8k_groups);
> +
> +	return PTR_ERR_OR_ZERO(i8k_hwmon_dev);
>  }
> 
>  struct i8k_config_data {
> @@ -1221,28 +1217,11 @@ static struct dmi_system_id i8k_whitelist_fan_control[] __initdata = {
>  	{ }
>  };
> 
> -/*
> - * Probe for the presence of a supported laptop.
> - */
> -static int __init i8k_probe(void)
> +static int __init dell_smm_probe(struct platform_device *pdev)
>  {
>  	const struct dmi_system_id *id, *fan_control;
>  	int fan, ret;
> 
> -	/*
> -	 * Get DMI information
> -	 */
> -	if (!dmi_check_system(i8k_dmi_table)) {
> -		if (!ignore_dmi && !force)
> -			return -ENODEV;
> -
> -		pr_info("not running on a supported Dell system.\n");
> -		pr_info("vendor=%s, model=%s, version=%s\n",
> -			i8k_get_dmi_data(DMI_SYS_VENDOR),
> -			i8k_get_dmi_data(DMI_PRODUCT_NAME),
> -			i8k_get_dmi_data(DMI_BIOS_VERSION));
> -	}
> -
>  	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
>  		pr_warn("broken Dell BIOS detected, disallow fan support\n");
>  		if (!force)
> @@ -1255,21 +1234,11 @@ static int __init i8k_probe(void)
>  			disallow_fan_type_call = true;
>  	}
> 
> -	strlcpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
> +	strscpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
>  		sizeof(bios_version));
> -	strlcpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
> +	strscpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
>  		sizeof(bios_machineid));

It is intentional to replace strlcpy by strscpy? If yes then I think it
should be part of other change as this replacement is not related nor
not needed by platform device registration.

> 
> -	/*
> -	 * Get SMM Dell signature
> -	 */
> -	if (i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG1) &&
> -	    i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG2)) {
> -		pr_err("unable to get SMM Dell signature\n");
> -		if (!force)
> -			return -ENODEV;
> -	}
> -
>  	/*
>  	 * Set fan multiplier and maximal fan speed from dmi config
>  	 * Values specified in module parameters override values from dmi
> @@ -1277,13 +1246,14 @@ static int __init i8k_probe(void)
>  	id = dmi_first_match(i8k_dmi_table);
>  	if (id && id->driver_data) {
>  		const struct i8k_config_data *conf = id->driver_data;
> +
>  		if (!fan_mult && conf->fan_mult)
>  			fan_mult = conf->fan_mult;
>  		if (!fan_max && conf->fan_max)
>  			fan_max = conf->fan_max;
>  	}
> 
> -	i8k_fan_max = fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
> +	i8k_fan_max = fan_max ? : I8K_FAN_HIGH; /* Must not be 0 */

This is empty change?

Hm... now I see tab with 1 char size is replaced by space. Quite hard to
detect this change as it was not mentioned in commit message and such
tab is visible in most editors in the same way as as space.

>  	i8k_pwm_mult = DIV_ROUND_UP(255, i8k_fan_max);
> 
>  	fan_control = dmi_first_match(i8k_whitelist_fan_control);
> @@ -1313,29 +1283,70 @@ static int __init i8k_probe(void)
>  		i8k_fan_mult = fan_mult;
>  	}
> 
> +	ret = dell_smm_init_hwmon(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	i8k_init_procfs();
> +
>  	return 0;
>  }
> 
> +static int dell_smm_remove(struct platform_device *pdev)
> +{
> +	i8k_exit_procfs();
> +
> +	return 0;
> +}
> +
> +static struct platform_driver dell_smm_driver = {
> +	.driver		= {
> +		.name	= KBUILD_MODNAME,
> +	},
> +	.remove		= dell_smm_remove,
> +};
> +
> +static struct platform_device *dell_smm_device;
> +
> +/*
> + * Probe for the presence of a supported laptop.
> + */
>  static int __init i8k_init(void)
>  {
> -	int err;
> +	/*
> +	 * Get DMI information
> +	 */
> +	if (!dmi_check_system(i8k_dmi_table)) {
> +		if (!ignore_dmi && !force)
> +			return -ENODEV;
> 
> -	/* Are we running on an supported laptop? */
> -	if (i8k_probe())
> -		return -ENODEV;
> +		pr_info("not running on a supported Dell system.\n");
> +		pr_info("vendor=%s, model=%s, version=%s\n",
> +			i8k_get_dmi_data(DMI_SYS_VENDOR),
> +			i8k_get_dmi_data(DMI_PRODUCT_NAME),
> +			i8k_get_dmi_data(DMI_BIOS_VERSION));
> +	}
> 
> -	err = i8k_init_hwmon();
> -	if (err)
> -		return err;
> +	/*
> +	 * Get SMM Dell signature
> +	 */
> +	if (i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG1) &&
> +	    i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG2)) {
> +		pr_err("unable to get SMM Dell signature\n");
> +		if (!force)
> +			return -ENODEV;
> +	}
> 
> -	i8k_init_procfs();
> -	return 0;
> +	dell_smm_device = platform_create_bundle(&dell_smm_driver, dell_smm_probe, NULL, 0, NULL,
> +						 0);
> +
> +	return PTR_ERR_OR_ZERO(dell_smm_device);
>  }
> 
>  static void __exit i8k_exit(void)
>  {
> -	hwmon_device_unregister(i8k_hwmon_dev);
> -	i8k_exit_procfs();
> +	platform_device_unregister(dell_smm_device);
> +	platform_driver_unregister(&dell_smm_driver);
>  }
> 
>  module_init(i8k_init);
> --
> 2.20.1
> 
