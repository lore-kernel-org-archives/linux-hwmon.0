Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A0A3A1A35;
	Mon, 24 Aug 2026 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557631; cv=none; b=T9Mj6ELwdCKzSCzYJL3OcC7OMntK14I8hvXO0+nsucYjcEuLDtbtw0FL72levNBq2x/qbWbGVY02950JqY18dfa/NFLUtvft3iLUIwjyETepq8v+OhoR5uuddT2N1ub05w7+S5MRQ3sB04z/7WhgWHPSu1XHRhHjq7Yev7deEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557631; c=relaxed/simple;
	bh=zAnEUKVB34mMup/RU9EYVC8wcKmIE7yWVP+ZgqdZ34k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M0wn8UAzUosJwF6Y3I3L7k8pIEcIW+T0o1195BqLmJe7cw6V6Vue5sUWw/0JsYkm4lwjSCYi7fjudUV/wFzK0z3Q+tzDIipo77kdhsXL7swdAT6IaaUQ8G6nDpdm3ONDkFHjs6cK4h9QvrM6vM/98njS9zOghG42rV7Y/YFR5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F04JbzlG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F04JbzlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557630; x=1819093630;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zAnEUKVB34mMup/RU9EYVC8wcKmIE7yWVP+ZgqdZ34k=;
  b=F04JbzlGRv9vjyOOI5rfs8I0x6ezQfNUZBTKNO7nae0130qmJDbY10We
   IQYi96SI1VTuCyPHxST9KukEX37fzWewQE4jd9EQYhVpg4VNK47lkVL4g
   1pBy2e5smY43hjW/SeSwWnyx8ZmUFa/lmODcyhjHpS6/5V2gN7w/uxxoo
   t6w9ZyLXAGExJ4mv5PM50xgyCum0bYvjnnkfdl6KuPr6UUTFRD3BAapbm
   01iG7cehNxEu/1t65H7ob4vNF8nbbMhEzAT5OVHXQV57fd33hKzdZe7al
   2RWvKgWJ4rNEstcTO8LoLPWjwVCngi3qMRcyDh/zVso1FltpLV9xdXJgT
   w==;
X-CSE-ConnectionGUID: 0dCAqp1BR76FrFMbSTpFbA==
X-CSE-MsgGUID: OUSQmRV/T0u63cwQaVEliA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="105536202"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="105536202"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:47:08 -0700
X-CSE-ConnectionGUID: P2Mte9LhQQKN8KP3SJbmSQ==
X-CSE-MsgGUID: 7n+VuqRwQgyDgrE+ljDm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="265156799"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:47:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 10:46:59 +0300 (EEST)
To: Aditya Dash <mradityadash@gmail.com>
cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] platform/x86: lenovo-wmi-other: Add Legion Go
 Full Speed control
In-Reply-To: <20260821214728.87773-2-mradityadash@gmail.com>
Message-ID: <a3c62239-6c58-0da2-110a-91002a6866e8@linux.intel.com>
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-2-mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Aug 2026, Aditya Dash wrote:

> Selected Legion Go firmware exposes Full Speed as Other Mode feature
> 0x04020000. Capability Data does not describe this feature, so
> lenovo-wmi-other currently ignores it.
> 
> Probe the feature during HWMON setup on those products. If the read
> succeeds and returns a Boolean value, expose it as pwm1_enable. Value 0
> selects Full Speed, and value 2 returns fan control to firmware automatic
> mode. Reject all other values.
> 
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |   7 ++
>  drivers/platform/x86/lenovo/wmi-other.c       | 108 +++++++++++++++++-
>  2 files changed, 114 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 011054d64eac..75f2deaaef16 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -49,6 +49,13 @@ The following HWMON attributes are implemented:
>  Due to the internal RPM divisor, the current/target RPMs are rounded down to
>  its nearest multiple. The divisor itself is not necessary to be a power of two.
>  
> +Legion Go fan controls
> +----------------------
> +
> +On supported Legion Go models, Other Mode feature ``0x04020000`` controls
> +Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. Value 0
> +enables Full Speed, and value 2 returns fan control to firmware.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>  
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index fbb32bf404f2..c180933e1d18 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -32,6 +32,7 @@
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/hwmon.h>
> @@ -83,6 +84,7 @@ enum lwmi_feature_id_psu {
>  	LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR =	0x02,
>  };
>  
> +#define LWMI_FEATURE_ID_FAN_FULLSPEED 0x02
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>  
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> @@ -102,6 +104,10 @@ enum lwmi_feature_id_psu {
>  #define LWMI_CHARGE_TYPE_STANDARD	0x00
>  #define LWMI_CHARGE_TYPE_LONGLIFE	0x01
>  
> +#define LWMI_ATTR_ID_FAN_FULLSPEED					\
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_FULLSPEED, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> @@ -115,6 +121,50 @@ enum lwmi_feature_id_psu {
>  
>  static DEFINE_IDA(lwmi_om_ida);
>  
> +static const struct dmi_system_id lwmi_fan_dmi_table[] = {
> +	{
> +		.ident = "Lenovo Legion Go 8APU1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo Legion Go S 8APU1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo Legion Go S 8ARP1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo Legion Go 8ASP2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo Legion Go 8AHP2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
> +		},
> +	},
> +	{}
> +};
> +
> +static bool lwmi_fan_supported(void)
> +{
> +	return dmi_check_system(lwmi_fan_dmi_table);
> +}
> +
>  enum attribute_property {
>  	DEFAULT_VAL,
>  	MAX_VAL,
> @@ -144,6 +194,7 @@ struct lwmi_om_priv {
>  	int ida_id;
>  
>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> +	bool fullspeed_supported;
>  
>  	struct {
>  		bool capdata00_collected : 1;
> @@ -237,6 +288,38 @@ static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val,
>  	return (retval == 0 || retval == 1) ? 0 : -EIO;
>  }
>  
> +static int lwmi_om_fullspeed_get(struct lwmi_om_priv *priv, long *enable)
> +{
> +	struct wmi_method_args_32 args = {
> +		.arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
> +	};
> +	u32 value;
> +	int ret;
> +
> +	ret = lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_GET,
> +				    (u8 *)&args, sizeof(args), &value);
> +	if (ret)
> +		return ret;
> +
> +	if (value > 1)
> +		return -ERANGE;
> +
> +	*enable = value ? 0 : 2;

Label these literals with defines?

--
 i.

> +	return 0;
> +}
> +
> +static int lwmi_om_fullspeed_set(struct lwmi_om_priv *priv, bool fullspeed)
> +{
> +	struct wmi_method_args_32 args = {
> +		.arg0 = LWMI_ATTR_ID_FAN_FULLSPEED,
> +		.arg1 = fullspeed,
> +	};
> +
> +	/* The WMI method has no return value. */
> +	return lwmi_dev_evaluate_int(priv->wdev, 0, LWMI_FEATURE_VALUE_SET,
> +				     (u8 *)&args, sizeof(args), NULL);
> +}
> +
>  /**
>   * lwmi_om_hwmon_is_visible() - Determine visibility of HWMON attributes
>   * @drvdata: Driver private data
> @@ -255,6 +338,10 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
>  	struct lwmi_om_priv *priv = (struct lwmi_om_priv *)drvdata;
>  	bool visible = false;
>  
> +	if (type == hwmon_pwm && priv->fullspeed_supported && channel == 0 &&
> +	    attr == hwmon_pwm_enable)
> +		return 0644;
> +
>  	if (type == hwmon_fan) {
>  		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
>  			return 0;
> @@ -311,6 +398,9 @@ static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  	u32 retval = 0;
>  	int err;
>  
> +	if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0)
> +		return lwmi_om_fullspeed_get(priv, val);
> +
>  	if (type == hwmon_fan) {
>  		switch (attr) {
>  		/*
> @@ -366,6 +456,17 @@ static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  	u32 raw, min_rpm, max_rpm;
>  	int err;
>  
> +	if (type == hwmon_pwm && attr == hwmon_pwm_enable && channel == 0) {
> +		switch (val) {
> +		case 0:
> +			return lwmi_om_fullspeed_set(priv, true);
> +		case 2:
> +			return lwmi_om_fullspeed_set(priv, false);
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
>  	if (type == hwmon_fan) {
>  		switch (attr) {
>  		case hwmon_fan_target:
> @@ -420,6 +521,7 @@ static const struct hwmon_channel_info * const lwmi_om_hwmon_info[] = {
>  			   HWMON_F_MIN | HWMON_F_MAX,
>  			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
>  			   HWMON_F_MIN | HWMON_F_MAX),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
>  	NULL
>  };
>  
> @@ -440,6 +542,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
>   */
>  static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
> +	long enable;
>  	int i, valid;
>  
>  	if (WARN_ON(priv->hwmon_dev))
> @@ -458,6 +561,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  	if (relax_fan_constraint)
>  		dev_warn(&priv->wdev->dev, "fan RPM constraint relaxed. Use with caution\n");
>  
> +	priv->fullspeed_supported =
> +		lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
> +
>  	valid = 0;
>  	for (i = 0; i < LWMI_FAN_NR; i++) {
>  		if (!(priv->fan_info[i].supported & LWMI_SUPP_VALID))
> @@ -474,7 +580,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  		}
>  	}
>  
> -	if (valid == 0) {
> +	if (valid == 0 && !priv->fullspeed_supported) {
>  		dev_warn(&priv->wdev->dev,
>  			 "fan reporting/tuning is unsupported on this device\n");
>  		return;
> 
