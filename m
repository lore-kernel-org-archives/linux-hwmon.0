Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCDC3A0E8D;
	Mon, 24 Aug 2026 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557780; cv=none; b=MPiTA5TE5o2TKYsdTxB2RSwCJXGzdQ2e/er2+3yfL/pCBjPkIhGTQ+lHhmbvb2cw1VQpf12q4WwMojcqx1iCE/7CzrorGCqJ40mdPN9Kocv/B5hzKSVfhp0ukAMgqVSDYpt17hYyalhN7CImAYVlPHbREg8jyf/2BR3vLWvJEoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557780; c=relaxed/simple;
	bh=HHUDbfH9df6rAY4gNqTR39nMITUNNTEssdFjodRm7p8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pE0Qm1AgCp3PpIkcXNSyUr861lvx/CeuQf/vNBqUPT4sGNb2zBmk5BntYeBYwYLMB4fxJxzYjAwQg+gnRX5Mb0LMz0T9lriW9WF7BKzU1UMO+LpmC5LHZpfAS2hcrPp19WMOwer0dIWPSpPhlwutvCwH6TW31IyE2YS1g5qzf/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCC+zUZo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCC+zUZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557779; x=1819093779;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HHUDbfH9df6rAY4gNqTR39nMITUNNTEssdFjodRm7p8=;
  b=lCC+zUZo8/K0xrM8ZvYKu11WK2mjCcDHEhn+aZetFIb/Jn0HjcRxu35G
   kFSyTwvNCpB6RdkIsKcOD6f7J51yGa77kKF4fI7a2JbtNuGGwJL7dSlVl
   4giULt5SrH1qKhWjGFIkIP6UZ2QWGrsRy4rd3qGVDiCfevFnoCWSKxKff
   LDn9pNgowleMCrNNr0oL2GRlHZzeVd2uZlRGFThDFbMuP+KhTTQl6w9/6
   fbBTQ5A5VDlUK+9+EzDoRHqh07lRPvWw0giBvAE5qbk1PDpjePf2GVUDk
   WUgfgSqc10mGEcFdcGyc7Hn8kBTNuqw0tDHX9A9ModOzGOf6EyEUHQlWI
   A==;
X-CSE-ConnectionGUID: b/0YmN8KT6CU76a+PzFpWw==
X-CSE-MsgGUID: t517vRbqSXuANsbUNHqyug==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91677038"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91677038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:49:38 -0700
X-CSE-ConnectionGUID: F1a6+XrvSEiUzD09n6kxkg==
X-CSE-MsgGUID: ee9lJRKhQLuY4PrPlQ910g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270391783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:49:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 10:49:30 +0300 (EEST)
To: Aditya Dash <mradityadash@gmail.com>
cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] platform/x86: lenovo-wmi-other: Add Legion Go
 fan RPM fallback
In-Reply-To: <20260821214728.87773-3-mradityadash@gmail.com>
Message-ID: <d3089164-08bb-cc6e-a3ce-e248bc8632a6@linux.intel.com>
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-3-mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Aug 2026, Aditya Dash wrote:

> Some Legion Go firmware does not mark fan 1 RPM as readable in Capability
> Data, although Other Mode feature 0x04030001 returns the current RPM. As a
> result, lenovo-wmi-other hides fan1_input.
> 
> When the normal VALID and GET flags are missing on a supported product,
> try one read from the Other Mode feature. Expose fan1_input as read-only
> if the read succeeds and does not return 0xffffffff. Treat a later
> 0xffffffff reply as an unavailable reading.
> 
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-other.rst |  4 ++++
>  drivers/platform/x86/lenovo/wmi-other.c        | 14 +++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 75f2deaaef16..c93e9e6f3fd0 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -56,6 +56,10 @@ On supported Legion Go models, Other Mode feature ``0x04020000`` controls
>  Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. Value 0
>  enables Full Speed, and value 2 returns fan control to firmware.
>  
> +Some Legion Go firmware does not advertise fan 1 RPM through Capability
> +Data. In that case, the driver reads Other Mode feature ``0x04030001`` for
> +``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>  
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index c180933e1d18..b4be7739b243 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -98,6 +98,7 @@ enum lwmi_feature_id_psu {
>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
>  
>  #define LWMI_FAN_DIV 100
> +#define LWMI_FAN_RPM_NORMAL_SUPPORT (LWMI_SUPP_VALID | LWMI_SUPP_GET)
>  
>  #define LWMI_CHARGE_BEHAVIOR_DISCHARGE	0x00
>  #define LWMI_CHARGE_BEHAVIOR_AUTO	0x01
> @@ -195,6 +196,7 @@ struct lwmi_om_priv {
>  
>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>  	bool fullspeed_supported;
> +	bool fan0_input_fallback;
>  
>  	struct {
>  		bool capdata00_collected : 1;
> @@ -343,6 +345,8 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
>  		return 0644;
>  
>  	if (type == hwmon_fan) {
> +		if (channel == 0 && priv->fan0_input_fallback && attr == hwmon_fan_input)
> +			return 0444;
>  		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
>  			return 0;
>  
> @@ -419,6 +423,8 @@ static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  			err = lwmi_om_fan_get_set(priv, channel, &retval, false);
>  			if (err)
>  				return err;
> +			if (channel == 0 && priv->fan0_input_fallback && retval == U32_MAX)
> +				return -EIO;
>  
>  			*val = retval;
>  			return 0;
> @@ -542,6 +548,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
>   */
>  static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
> +	u32 rpm;
>  	long enable;
>  	int i, valid;
>  
> @@ -563,6 +570,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  
>  	priv->fullspeed_supported =
>  		lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
> +	priv->fan0_input_fallback =
> +		lwmi_fan_supported() &&
> +		(priv->fan_info[0].supported & LWMI_FAN_RPM_NORMAL_SUPPORT) !=
> +		LWMI_FAN_RPM_NORMAL_SUPPORT &&
> +		!lwmi_om_fan_get_set(priv, 0, &rpm, false) && rpm != U32_MAX;

Please don't use U32_MAX directly but add a define so its meaning is 
properly labeled.

>  
>  	valid = 0;
>  	for (i = 0; i < LWMI_FAN_NR; i++) {
> @@ -580,7 +592,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  		}
>  	}
>  
> -	if (valid == 0 && !priv->fullspeed_supported) {
> +	if (valid == 0 && !priv->fullspeed_supported && !priv->fan0_input_fallback) {
>  		dev_warn(&priv->wdev->dev,
>  			 "fan reporting/tuning is unsupported on this device\n");
>  		return;
> 

-- 
 i.

