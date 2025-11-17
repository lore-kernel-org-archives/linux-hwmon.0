Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FFE329E5C;
	Mon, 17 Nov 2025 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374629; cv=none; b=W5WgQeL+lDN7N9b8EBUVp8IEna1THbdkztP/9mOX+twDC1F/I4VUARmLonwdK8OB2HBIyOXPDGas4FcK+3pEbdAmXoyJVagyfhMFbnViBGEpquTFGhsXR4pA+hPKkjd6sxxLiXEGcG24sC82BTjVspGOiOqAHZsi7ekKtKXpWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374629; c=relaxed/simple;
	bh=gBH39t87qFoQP+24Ic1lNQsEfJEUAyWteDWnd2xX9Q0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TGFmLJea0l4jjTJrrtpzC42HET05WE14vDd651O5EW2gOKc8Zar5biVBXbncIFMoO456fRW+HM5lToOrgb2B81Ug80/+fuoVNdG3PjNcLA7b5Ulk/A37ZOZOME8B0CZbVVcfzvEasD6ZgL0yFKdrWzcBsQDQSQq+7PrPn/55mC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvlLlTHP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvlLlTHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763374627; x=1794910627;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gBH39t87qFoQP+24Ic1lNQsEfJEUAyWteDWnd2xX9Q0=;
  b=UvlLlTHPfbT2Pg6V1sPWuKMRFXxgyOjSyBbOE0ikQT2PdYlstKQHTrjj
   TGo8KnEEhr1iBsiXmwkjC0SxvuYVWrBH/6yxDsSzmODW2Cbe2fsIEgPP9
   Nv4UMHvd/6VhYheS6LmIVezcinIp50GUHQRHRnLsvI4uLDYR6Jd2NPmUT
   LDWDUUwEH47lip5S/cbeNIiVxMpSQ4RR34xicXBDlKHiCLUBQ+Nigm92I
   yFSbRWFAPW7DLwolYypH/N3+Pvt7oV8mLsznSbiEQJweRFeXjckXARVpZ
   trKsyg0S67cOnSj0eRFa4sBHj6vjW2SiW0vshju/2lA0evdPFw4EtJM81
   w==;
X-CSE-ConnectionGUID: dg6f7/ZBRaWrrUteiXBasQ==
X-CSE-MsgGUID: 5k3bmtrKQWWDGSZ9WYYp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90847484"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="90847484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 02:17:03 -0800
X-CSE-ConnectionGUID: n/yur2xRQQ6QlXEjKEDfVA==
X-CSE-MsgGUID: sxspl0iqS0K69ZV4ICzC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189713335"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 02:17:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 17 Nov 2025 12:16:56 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    =?ISO-8859-15?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>, 
    Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
    Armin-Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v5 2/6] platform/x86: ayaneo-ec: Add hwmon support
In-Reply-To: <20251113212221.456875-3-lkml@antheas.dev>
Message-ID: <3bc1c368-0045-a8db-c557-b86ebf01ac5d@linux.intel.com>
References: <20251113212221.456875-1-lkml@antheas.dev> <20251113212221.456875-3-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Nov 2025, Antheas Kapenekakis wrote:

> Add hwmon single fan sensor reads and control for Ayaneo devices.
> The register and method of access is the same for all devices.
> 
> Reviewed-by: Armin-Wolf <W_Armin@gmx.de>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/Kconfig     |   2 +
>  drivers/platform/x86/ayaneo-ec.c | 136 +++++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 8ca95536f8d9..e19850bd2609 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -319,6 +319,8 @@ config ASUS_TF103C_DOCK
>  config AYANEO_EC
>  	tristate "Ayaneo EC platform control"
>  	depends on DMI
> +	depends on ACPI_EC
> +	depends on HWMON
>  	help
>  	  Enables support for the platform EC of Ayaneo devices. This
>  	  includes fan control, fan speed, charge limit, magic
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> index 2fe66c8a89f4..108a23458a4f 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -7,14 +7,24 @@
>   * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
> +#define AYANEO_PWM_ENABLE_REG	 0x4A
> +#define AYANEO_PWM_REG		 0x4B
> +#define AYANEO_PWM_MODE_AUTO	 0x00
> +#define AYANEO_PWM_MODE_MANUAL	 0x01
> +
> +#define AYANEO_FAN_REG		 0x76
> +
>  struct ayaneo_ec_quirk {
> +	bool has_fan_control;
>  };
>  
>  struct ayaneo_ec_platform_data {
> @@ -23,6 +33,7 @@ struct ayaneo_ec_platform_data {
>  };
>  
>  static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
> +	.has_fan_control = true,
>  };
>  
>  static const struct dmi_system_id dmi_table[] = {
> @@ -36,10 +47,128 @@ static const struct dmi_system_id dmi_table[] = {
>  	{},
>  };
>  
> +/* Callbacks for hwmon interface */
> +static umode_t ayaneo_ec_hwmon_is_visible(const void *drvdata,
> +					  enum hwmon_sensor_types type, u32 attr,
> +					  int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return 0444;
> +	case hwmon_pwm:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *val)
> +{
> +	u8 tmp;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			ret = ec_read(AYANEO_FAN_REG, &tmp);
> +			if (ret)
> +				return ret;
> +			*val = tmp << 8;
> +			ret = ec_read(AYANEO_FAN_REG + 1, &tmp);
> +			if (ret)
> +				return ret;
> +			*val += tmp;

|= as this is combining two u8?

> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = ec_read(AYANEO_PWM_REG, &tmp);
> +			if (ret)
> +				return ret;
> +			if (tmp > 100)
> +				return -EIO;
> +			*val = (255 * tmp) / 100;
> +			return 0;
> +		case hwmon_pwm_enable:
> +			ret = ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
> +			if (ret)
> +				return ret;
> +			if (tmp == AYANEO_PWM_MODE_MANUAL)
> +				*val = 1;
> +			else if (tmp == AYANEO_PWM_MODE_AUTO)
> +				*val = 2;
> +			else
> +				return -EIO;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_enable:
> +			switch (val) {
> +			case 1:
> +				return ec_write(AYANEO_PWM_ENABLE_REG,
> +						AYANEO_PWM_MODE_MANUAL);
> +			case 2:
> +				return ec_write(AYANEO_PWM_ENABLE_REG,
> +						AYANEO_PWM_MODE_AUTO);
> +			default:
> +				return -EINVAL;
> +			}
> +		case hwmon_pwm_input:
> +			if (val < 0 || val > 255)
> +				return -EINVAL;
> +			return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_ops ayaneo_ec_hwmon_ops = {
> +	.is_visible = ayaneo_ec_hwmon_is_visible,
> +	.read = ayaneo_ec_read,
> +	.write = ayaneo_ec_write,
> +};
> +
> +static const struct hwmon_channel_info *const ayaneo_ec_sensors[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info ayaneo_ec_chip_info = {
> +	.ops = &ayaneo_ec_hwmon_ops,
> +	.info = ayaneo_ec_sensors,
> +};
> +
>  static int ayaneo_ec_probe(struct platform_device *pdev)
>  {
>  	const struct dmi_system_id *dmi_entry;
>  	struct ayaneo_ec_platform_data *data;
> +	struct device *hwdev;
>  
>  	dmi_entry = dmi_first_match(dmi_table);
>  	if (!dmi_entry)
> @@ -53,6 +182,13 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
>  	data->quirks = dmi_entry->driver_data;
>  	platform_set_drvdata(pdev, data);
>  
> +	if (data->quirks->has_fan_control) {
> +		hwdev = devm_hwmon_device_register_with_info(&pdev->dev,
> +			"ayaneo_ec", NULL, &ayaneo_ec_chip_info, NULL);
> +		if (IS_ERR(hwdev))
> +			return PTR_ERR(hwdev);
> +	}
> +
>  	return 0;
>  }
>  
> 

-- 
 i.

