Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D7315D21;
	Mon, 17 Nov 2025 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375376; cv=none; b=cvAhm+DHxIBQVaYva31sAJblTLXixDZTwol85CEVyOeW+GnIIpr1QSpvXzPOjdNyLIRN6S3NcTTTJNhTw/BFkE0IRmLCWVyxW8mC19KkN2Kb52CMgsZ3Y74HIk8sAitDIXOkp9kM1ROuUoLNf+qBj0dLJ2dE3Wlq8eLExXP9Yf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375376; c=relaxed/simple;
	bh=0vQ2UZEeJ+kQvDkbC5f3hWJiPts21JrH/wL4fbCeaWw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MlKaIJmobuMynxp7E6MVCfF2pgb/C23Qc0GUH+0SMk7fLzbwMDWhmRBuTItljgszb2SgrYzDQ4sowrhJHpkb9G4sJT2vAVhYUwE5geFh+EMtqUXMsWewrmuYv6/eUlqwt8ghdPGKyRPawi3yUq2DyxekotWukJ3zEzwOdr7FiYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6uMSYAA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6uMSYAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763375375; x=1794911375;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0vQ2UZEeJ+kQvDkbC5f3hWJiPts21JrH/wL4fbCeaWw=;
  b=P6uMSYAAHdbMy7Cd0xsb36K95ud3BsKYDgTzFWncxvzZUp1a2EN4qI7v
   noONM5sQWdbt8T9dNcmU+5b01gBJP+/ZzgVtnt3Ii5YfNaR0DOCyZxE8G
   qzyQKEVhuh34PqArfKO5L2Sm6tz6VK2IizWofiCXwVB6o/1N9n0mqVXZZ
   1EoVVBY1MuQm/XOQ73ZMgzbkiEEEQUC+xSZ9ckK4E+eF0DgV9JCzX8qwQ
   +h/eJsALB+KE8psNUOWRF3eiqXTtwoZSHy7pF1kl835kzJSFjxYrgHUjK
   j6q70pQCC0lZB3R39Am4F55ddxvgXqdUO+MYi7BAwErJCD6Bn5xhxQFVp
   A==;
X-CSE-ConnectionGUID: ewTNZCFYSDOqutuClOZ2jw==
X-CSE-MsgGUID: ifs8p+2qRq2cwqlqcRpbIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65252690"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65252690"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 02:29:34 -0800
X-CSE-ConnectionGUID: zAg9PJk5RhWqceKnKYqwlA==
X-CSE-MsgGUID: ndp2gahnQKK7uTm1gCwvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190857125"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 02:29:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 17 Nov 2025 12:29:26 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    =?ISO-8859-15?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>, 
    Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v5 4/6] platform/x86: ayaneo-ec: Add controller power
 and modules attributes
In-Reply-To: <20251113212221.456875-5-lkml@antheas.dev>
Message-ID: <77b944ff-2f84-3326-3901-5942739d3c43@linux.intel.com>
References: <20251113212221.456875-1-lkml@antheas.dev> <20251113212221.456875-5-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Nov 2025, Antheas Kapenekakis wrote:

> The Ayaneo 3 features hot-swappable controller modules. The ejection
> and management is done through HID. However, after ejecting the modules,
> the controller needs to be power cycled via the EC to re-initialize.
> 
> For this, the EC provides a variable that holds whether the left or
> right modules are connected, and a power control register to turn
> the controller on or off. After ejecting the modules, the controller
> should be turned off. Then, after both modules are reinserted,
> the controller may be powered on again to re-initialize.

If wonder if the ejecting could/should be made to turn it off without need 
for an explicit off command?

> This patch introduces two new sysfs attributes:
>  - `controller_modules`: a read-only attribute that indicates whether
>    the left and right modules are connected (none, left, right, both).
>  - `controller_power`: a read-write attribute that allows the user
>    to turn the controller on or off (with '1'/'0').
> 
> Therefore, after ejection is complete, userspace can power off the
> controller, then wait until both modules have been reinserted
> (`controller_modules` will return 'both') to turn on the controller.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/ayaneo-ec.c              | 107 ++++++++++++++++++
>  3 files changed, 127 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> new file mode 100644
> index 000000000000..4cffbf5fc7ca
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> @@ -0,0 +1,19 @@
> +What:		/sys/devices/platform/ayaneo-ec/controller_power
> +Date:		Nov 2025
> +KernelVersion:	6.19
> +Contact:	"Antheas Kapenekakis" <lkml@antheas.dev>
> +Description:
> +		Current controller power state. Allows turning on and off
> +		the controller power (e.g. for power savings). Write 1 to
> +		turn on, 0 to turn off. File is readable and writable.
> +
> +What:		/sys/devices/platform/ayaneo-ec/controller_modules
> +Date:		Nov 2025
> +KernelVersion:	6.19
> +Contact:	"Antheas Kapenekakis"  <lkml@antheas.dev>
> +Description:
> +		Shows which controller modules are currently connected to
> +		the device. Possible values are "left", "right" and "both".
> +		File is read-only. The Windows software for this device
> +		will only set controller power to 1 if both module sides
> +		are connected (i.e. this file returns "both").
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c5bf7207c45f..f8ab009b6224 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4196,6 +4196,7 @@ AYANEO PLATFORM EC DRIVER
>  M:	Antheas Kapenekakis <lkml@antheas.dev>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-platform-ayaneo
>  F:	drivers/platform/x86/ayaneo-ec.c
>  
>  AZ6007 DVB DRIVER
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> index 697bb053a7d6..a0747e7ee43a 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/bits.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
> @@ -16,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
> +#include <linux/sysfs.h>
>  #include <acpi/battery.h>
>  
>  #define AYANEO_PWM_ENABLE_REG	 0x4A
> @@ -32,9 +34,18 @@
>  #define AYANEO_CHARGE_VAL_AUTO		0xaa
>  #define AYANEO_CHARGE_VAL_INHIBIT	0x55
>  
> +#define AYANEO_POWER_REG	0x2d
> +#define AYANEO_POWER_OFF	0xfe
> +#define AYANEO_POWER_ON		0xff
> +#define AYANEO_MODULE_REG	0x2f
> +#define AYANEO_MODULE_LEFT	BIT(0)
> +#define AYANEO_MODULE_RIGHT	BIT(1)
> +#define AYANEO_MODULE_MASK	(AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)
> +
>  struct ayaneo_ec_quirk {
>  	bool has_fan_control;
>  	bool has_charge_control;
> +	bool has_magic_modules;
>  };
>  
>  struct ayaneo_ec_platform_data {
> @@ -46,6 +57,7 @@ struct ayaneo_ec_platform_data {
>  static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
>  	.has_fan_control = true,
>  	.has_charge_control = true,
> +	.has_magic_modules = true,
>  };
>  
>  static const struct dmi_system_id dmi_table[] = {
> @@ -266,6 +278,100 @@ static int ayaneo_remove_battery(struct power_supply *battery,
>  	return 0;
>  }
>  
> +static ssize_t controller_power_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t count)
> +{
> +	bool value;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &value);
> +	if (ret)
> +		return ret;
> +
> +	ret = ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYANEO_POWER_OFF);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t controller_power_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	int ret;
> +	u8 val;
> +
> +	ret = ec_read(AYANEO_POWER_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", val == AYANEO_POWER_ON);
> +}
> +
> +static DEVICE_ATTR_RW(controller_power);
> +
> +static ssize_t controller_modules_show(struct device *dev,
> +				       struct device_attribute *attr, char *buf)
> +{
> +	char *out;
> +	int ret;
> +	u8 val;
> +
> +	ret = ec_read(AYANEO_MODULE_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (~val & AYANEO_MODULE_MASK) {

Thanks for adding the mask.

Now when reading this again, I also suggest changing variable name from 
"val" to e.g. "unconnected_modules" as that would make the reason for 
inversion more obvious.

> +	case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
> +		out = "both";
> +		break;
> +	case AYANEO_MODULE_LEFT:
> +		out = "left";
> +		break;
> +	case AYANEO_MODULE_RIGHT:
> +		out = "right";
> +		break;
> +	default:
> +		out = "none";
> +		break;
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", out);
> +}
> +
> +static DEVICE_ATTR_RO(controller_modules);
> +
> +static struct attribute *aya_mm_attrs[] = {
> +	&dev_attr_controller_power.attr,
> +	&dev_attr_controller_modules.attr,
> +	NULL
> +};
> +
> +static umode_t aya_mm_is_visible(struct kobject *kobj,
> +				 struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> +
> +	if (data->quirks->has_magic_modules)
> +		return attr->mode;
> +	return 0;
> +}
> +
> +static const struct attribute_group aya_mm_attribute_group = {
> +	.is_visible = aya_mm_is_visible,
> +	.attrs = aya_mm_attrs,
> +};
> +
> +static const struct attribute_group *ayaneo_ec_groups[] = {
> +	&aya_mm_attribute_group,
> +	NULL
> +};
> +
>  static int ayaneo_ec_probe(struct platform_device *pdev)
>  {
>  	const struct dmi_system_id *dmi_entry;
> @@ -307,6 +413,7 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
>  static struct platform_driver ayaneo_platform_driver = {
>  	.driver = {
>  		.name = "ayaneo-ec",
> +		.dev_groups = ayaneo_ec_groups,
>  	},
>  	.probe = ayaneo_ec_probe,
>  };
> 

-- 
 i.

