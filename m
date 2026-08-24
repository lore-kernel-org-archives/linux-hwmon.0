Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE8836197D;
	Mon, 24 Aug 2026 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559063; cv=none; b=mb3juwFQI+30LIAOAA/1kNsdWfS9a7Kad5lW+jijL6lpcU1zTQGHyFw4/8Z0dFDZB5Dw8xKChx69EnCNyzmw51Fc3drguKbjYTy1MYYDcxQRJUPJf3hpv1ozqMtds2/LpgljyKvaHv3Mfz8M8LenjVhDsMlRnXC9v13+p2DxC+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559063; c=relaxed/simple;
	bh=7iUagW+E4oCor69psmCX/+ZphPUN30cVSL/K1fOiOjU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dmgiw/2yvrXF908ISw8I5lXMDp2RRUh/9Kq1oz2bbExYBOPlK3wzw3SmP7zt8OpjU5zfbaihrLdVuXQLlppmyoJyRx+um4hlJbqrfwI/A/AShpfM7vpPPZJmpF19x9VrmEf109twdfxjNojt/hitish+lPJ+33I455j+NhrJmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvHBAnwo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvHBAnwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787559061; x=1819095061;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7iUagW+E4oCor69psmCX/+ZphPUN30cVSL/K1fOiOjU=;
  b=nvHBAnwoAGb7/4/ypuWeYegj0WGEwqpFalvmP1wBXmcWVOyY1SCEAqzQ
   Z2MHOfjmeg+TEMXlWF//iP/yQymjIYUSyfakTC2JS8zYOlL09rN8m0leh
   aXxabTgRMWdNUKRXOqT2GtEEGYKYAY9oJ1HELtYNWJcnuVnQSwCtNd9yg
   UVkktjGQHU0YllnzFHjd8Q3kdWEZrOD7fWmiCUCwx8UDDeoNoPdKD5mXC
   wc3jq6qOOysB412Uv75C2YkhA7pzQhRW/xHa9SgNTp56XXy8cEwWHsL9I
   GtaCV05XbyuTwNGnhQyrqzvueVXJEti2P4y3rEm+yo5pqcT4v9EAjHrbJ
   A==;
X-CSE-ConnectionGUID: Kc9+rSfVRaiThAJg6RuNWA==
X-CSE-MsgGUID: CovJvvNTQcekQvxOkE/N5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91817897"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91817897"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:11:00 -0700
X-CSE-ConnectionGUID: imWmy2dJQbKY7LgGmoL8Rw==
X-CSE-MsgGUID: 4lr1CX9xTiSq7Kw69Wu+5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="272145638"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:10:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 11:10:52 +0300 (EEST)
To: Aditya Dash <mradityadash@gmail.com>
cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method
 curve driver
In-Reply-To: <20260821214728.87773-4-mradityadash@gmail.com>
Message-ID: <b8ca6b4e-a3d1-60bd-fc12-5057bc69856e@linux.intel.com>
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-4-mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Aug 2026, Aditya Dash wrote:

> Legion Go firmware keeps its custom fan curve in a separate Fan Method WMI
> interface. Method 5 returns ten control values and ten temperatures, while
> Method 6 replaces the complete table.
> 
> The GUID also appears on Lenovo systems with a different table layout.
> Limit the driver to Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2,
> Legion Go S 8ARP1, and Legion Go S 8APU1 products. These products use the
> same ten-point layout and Method 6 request.
> 
> The curve applies to the same fan as the existing Other Mode attributes.
> Add a separate WMI driver and attach the ten automatic-point pairs to the
> HWMON device that Other Mode already provides. Match devices from the same
> WMI provider. Other Mode continues to work without Fan Method. Probe does
> not invoke either method.
> 
> Validate both counts, every control value, and the complete temperature
> table before using a Method 5 reply. A point write holds the mutex while
> it reads the current table, changes one control value, and submits the
> complete Method 6 request. The other values remain unchanged.
> 
> The HWMON mapping is not clear. On the tested Legion Go 8APU1, the fan
> responds to values from 0 through 115. This is Lenovo's 0 through 115
> percent range. Lenovo software shows 0 through 100 percent to the user,
> and 115 reaches the RPM observed in Full Speed mode. Firmware accepts
> values through 255, but values above 115 caused no observed RPM increase.
> 
> This RFC exposes the firmware values unchanged. The fixed temperatures are
> read-only.
> 
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
>  .../wmi/devices/lenovo-wmi-other.rst          |   3 +
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/lenovo/Kconfig           |  11 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c       |  97 ++++-
>  7 files changed, 520 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-fan-method.rst b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
> new file mode 100644
> index 000000000000..67c9a92ed992
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +==================================
> +Lenovo Fan Method WMI Driver
> +==================================
> +
> +WMI GUID ``92549549-4BDE-4F06-AC04-CE8BF898DBAA``
> +
> +The Lenovo Fan Method interface provides a ten-point firmware fan table on
> +Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2, Legion Go S 8ARP1, and
> +Legion Go S 8APU1 products.
> +
> +The driver adds ``pwm1_auto_point1_*`` through
> +``pwm1_auto_point10_*`` to the HWMON device that the Lenovo Other Mode driver
> +owns. The temperature attributes are fixed and read-only. They contain points
> +from 10 through 100 degrees Celsius in 10-degree steps.
> +
> +Each ``pwm1_auto_point*_pwm`` attribute is read-write and passes a firmware
> +control value from 0 through 255 without scaling. On the tested Legion Go
> +8APU1, the hardware responds from 0 through 115, corresponding to Lenovo's
> +0 through 115 percent range. Lenovo software shows 0 through 100 percent to
> +the user, and 115 percent reaches the RPM observed in Full Speed mode. The
> +firmware accepts values through 255, but values above 115 caused no observed
> +RPM increase.
> +
> +A control-value read validates both ten-entry tables before returning data. A
> +point write reads the current table, changes one control value, and submits the
> +complete request. It preserves the other nine control values and all returned
> +temperatures.
> +
> +The Fan Method and Other Mode drivers use separate modules and WMI devices.
> +The component framework associates devices that belong to the same WMI
> +provider. Fan Method curve attributes are absent when either interface is not
> +available.
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index c93e9e6f3fd0..34352dbd6fb9 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -60,6 +60,9 @@ Some Legion Go firmware does not advertise fan 1 RPM through Capability
>  Data. In that case, the driver reads Other Mode feature ``0x04030001`` for
>  ``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
>  
> +When the separate Lenovo Fan Method driver binds to the same WMI provider, it
> +adds ten automatic fan-curve points to this HWMON device.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>  
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3820b286f09f..8612c2323540 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14689,6 +14689,7 @@ M:	Mark Pearson <mpearson-lenovo@squebb.ca>
>  M:	Derek J. Clark <derekjohn.clark@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-other.rst
>  F:	drivers/platform/x86/lenovo/*
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index 4443f40ef8aa..e69942ce3093 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -276,3 +276,14 @@ config LENOVO_WMI_TUNING
>  
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called lenovo-wmi-other.
> +
> +config LENOVO_WMI_FAN_METHOD
> +	tristate "Lenovo Fan Method WMI Driver"
> +	depends on DMI
> +	depends on LENOVO_WMI_TUNING
> +	help
> +	  Say Y here to add the firmware fan table on supported Lenovo
> +	  Legion Go products to the Lenovo Other Mode HWMON device.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-fan-method.
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
> index 91a9370f11b3..171a19e01479 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -17,6 +17,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_FAN_METHOD)	+= wmi-fan-method.o
>  
>  # Add 'lenovo' prefix to each module listed in lenovo-target-*
>  define LENOVO_OBJ_TARGET
> diff --git a/drivers/platform/x86/lenovo/wmi-fan-method.c b/drivers/platform/x86/lenovo/wmi-fan-method.c
> new file mode 100644
> index 000000000000..4f29c4134caf
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/wmi-fan-method.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Fan Method WMI interface driver.
> + *
> + * This driver exposes the firmware fan table through HWMON automatic-point
> + * attributes on selected Lenovo Legion Go products.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/wmi.h>
> +
> +#define LENOVO_FAN_METHOD_GUID "92549549-4BDE-4F06-AC04-CE8BF898DBAA"
> +
> +#define LENOVO_FAN_METHOD_GET_CURVE	5
> +#define LENOVO_FAN_METHOD_SET_CURVE	6
> +#define LENOVO_FAN_CURVE_POINTS		10
> +#define LENOVO_FAN_CURVE_REPLY_SIZE	88
> +#define LENOVO_FAN_CURVE_WRITE_SIZE	64
> +
> +#define LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET	0
> +#define LENOVO_FAN_REPLY_SPEED_OFFSET		4
> +#define LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET	44
> +#define LENOVO_FAN_REPLY_TEMP_OFFSET		48
> +
> +#define LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET	2
> +#define LENOVO_FAN_WRITE_SPEED_OFFSET		6
> +#define LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET	26
> +#define LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET	27
> +#define LENOVO_FAN_WRITE_TEMP_OFFSET		31
> +#define LENOVO_FAN_WRITE_TRAILER_OFFSET		51
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET	53
> +
> +#define LENOVO_FAN_WRITE_TEMP_TYPE		1
> +#define LENOVO_FAN_WRITE_TRAILER		0x5a
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE		100
> +
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
> +static const u16 lwmi_fan_temperatures[LENOVO_FAN_CURVE_POINTS] = {
> +	10, 20, 30, 40, 50, 60, 70, 80, 90, 100
> +};
> +
> +struct lwmi_fan_method_curve {
> +	u16 speed[LENOVO_FAN_CURVE_POINTS];
> +	u16 temperature[LENOVO_FAN_CURVE_POINTS];
> +};
> +
> +struct lwmi_fan_method_priv;
> +
> +struct lwmi_fan_method_attr {
> +	struct device_attribute dev_attr;
> +	struct lwmi_fan_method_priv *priv;
> +	u8 index;
> +};
> +
> +struct lwmi_fan_method_priv {
> +	struct wmi_device *wdev;
> +	struct mutex lock; /* Serializes all Fan Method calls. */

Please move the comment a bit right to separate code from comment 
visually (by 1 tab or so is enough as long as there's > 1 whitespace).

> +	struct lwmi_fan_method_attr point_attrs[LENOVO_FAN_CURVE_POINTS * 2];
> +	struct attribute *attrs[LENOVO_FAN_CURVE_POINTS * 2 + 1];
> +	struct attribute_group group;
> +};
> +
> +static int lwmi_fan_method_get_curve(struct lwmi_fan_method_priv *priv,
> +				     struct lwmi_fan_method_curve *curve)
> +{
> +	u8 input[] = { 1, 1 };
> +	struct wmi_buffer in = {
> +		.length = sizeof(input),
> +		.data = input,
> +	};
> +	struct wmi_buffer out = {};
> +	const u8 *buffer;
> +	int ret, i;
> +
> +	ret = wmidev_invoke_method(priv->wdev, 0,
> +				   LENOVO_FAN_METHOD_GET_CURVE, &in, &out,
> +				   LENOVO_FAN_CURVE_REPLY_SIZE);
> +	if (ret)
> +		return ret;
> +
> +	buffer = out.data;

Best practices with this interface: Declare variable on this lines 
(mid-function) and use __free().

> +	if (get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET) !=
> +	    LENOVO_FAN_CURVE_POINTS ||
> +	    get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET) !=

Please read what wmidev_invoke_method()'s function comment says about 
alignment.

> +	    LENOVO_FAN_CURVE_POINTS) {
> +		ret = -ERANGE;
> +		goto out_free;
> +	}
> +
> +	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +		u32 speed = get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_OFFSET +
> +					       i * sizeof(u32));
> +		u32 temperature =
> +			get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_OFFSET +
> +					   i * sizeof(u32));
> +
> +		if (speed > U8_MAX || temperature != lwmi_fan_temperatures[i]) {
> +			ret = -ERANGE;
> +			goto out_free;
> +		}
> +
> +		curve->speed[i] = speed;
> +		curve->temperature[i] = temperature;
> +	}
> +
> +out_free:
> +	kfree(out.data);
> +	return ret;
> +}
> +
> +static int lwmi_fan_method_set_curve(struct lwmi_fan_method_priv *priv,
> +				     const struct lwmi_fan_method_curve *curve)
> +{
> +	u8 buffer[LENOVO_FAN_CURVE_WRITE_SIZE] = { 0xff, 0x01 };
> +	struct wmi_buffer in = {
> +		.length = sizeof(buffer),
> +		.data = buffer,
> +	};
> +	int i;
> +
> +	put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +			   buffer + LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET);
> +	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +		put_unaligned_le16(curve->speed[i],
> +				   buffer + LENOVO_FAN_WRITE_SPEED_OFFSET +
> +				   i * sizeof(u16));
> +
> +	buffer[LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET] = LENOVO_FAN_WRITE_TEMP_TYPE;
> +	put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +			   buffer + LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET);
> +	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +		put_unaligned_le16(curve->temperature[i],
> +				   buffer + LENOVO_FAN_WRITE_TEMP_OFFSET +
> +				   i * sizeof(u16));
> +
> +	buffer[LENOVO_FAN_WRITE_TRAILER_OFFSET] = LENOVO_FAN_WRITE_TRAILER;
> +	put_unaligned_le16(LENOVO_FAN_WRITE_TRAILER_VALUE,
> +			   buffer + LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET);
> +
> +	return wmidev_invoke_procedure(priv->wdev, 0,
> +				       LENOVO_FAN_METHOD_SET_CURVE, &in);
> +}
> +
> +static ssize_t lwmi_fan_method_pwm_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct lwmi_fan_method_attr *point_attr =
> +		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +	struct lwmi_fan_method_priv *priv = point_attr->priv;
> +	struct lwmi_fan_method_curve curve;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret = lwmi_fan_method_get_curve(priv, &curve);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", curve.speed[point_attr->index]);
> +}
> +
> +static ssize_t lwmi_fan_method_pwm_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct lwmi_fan_method_attr *point_attr =
> +		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +	struct lwmi_fan_method_priv *priv = point_attr->priv;
> +	struct lwmi_fan_method_curve curve;
> +	unsigned long pwm;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &pwm);
> +	if (ret)
> +		return ret;
> +	if (pwm > U8_MAX)

Use kstrtou8() ?

> +		return -EINVAL;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret = lwmi_fan_method_get_curve(priv, &curve);
> +	if (ret)
> +		return ret;
> +
> +	curve.speed[point_attr->index] = pwm;
> +	ret = lwmi_fan_method_set_curve(priv, &curve);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t lwmi_fan_method_temp_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct lwmi_fan_method_attr *point_attr =
> +		container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +
> +	return sysfs_emit(buf, "%u\n",
> +			  lwmi_fan_temperatures[point_attr->index] * 1000);

Check if that 1000 can be replaced with something from units.h.

> +}
> +
> +#define LWMI_FAN_METHOD_POINT_NAMES(_point) \
> +	"pwm1_auto_point" #_point "_pwm", \
> +	"pwm1_auto_point" #_point "_temp"
> +
> +static const char * const lwmi_fan_method_attr_names[] = {
> +	LWMI_FAN_METHOD_POINT_NAMES(1),
> +	LWMI_FAN_METHOD_POINT_NAMES(2),
> +	LWMI_FAN_METHOD_POINT_NAMES(3),
> +	LWMI_FAN_METHOD_POINT_NAMES(4),
> +	LWMI_FAN_METHOD_POINT_NAMES(5),
> +	LWMI_FAN_METHOD_POINT_NAMES(6),
> +	LWMI_FAN_METHOD_POINT_NAMES(7),
> +	LWMI_FAN_METHOD_POINT_NAMES(8),
> +	LWMI_FAN_METHOD_POINT_NAMES(9),
> +	LWMI_FAN_METHOD_POINT_NAMES(10),
> +};
> +
> +#undef LWMI_FAN_METHOD_POINT_NAMES
> +
> +static void lwmi_fan_method_attrs_init(struct lwmi_fan_method_priv *priv)
> +{
> +	int i;
> +
> +	for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +		struct lwmi_fan_method_attr *pwm = &priv->point_attrs[i * 2];
> +		struct lwmi_fan_method_attr *temp = &priv->point_attrs[i * 2 + 1];
> +
> +		sysfs_attr_init(&pwm->dev_attr.attr);
> +		pwm->dev_attr.attr.name = lwmi_fan_method_attr_names[i * 2];
> +		pwm->dev_attr.attr.mode = 0644;
> +		pwm->dev_attr.show = lwmi_fan_method_pwm_show;
> +		pwm->dev_attr.store = lwmi_fan_method_pwm_store;
> +		pwm->priv = priv;
> +		pwm->index = i;
> +		priv->attrs[i * 2] = &pwm->dev_attr.attr;
> +
> +		sysfs_attr_init(&temp->dev_attr.attr);
> +		temp->dev_attr.attr.name = lwmi_fan_method_attr_names[i * 2 + 1];
> +		temp->dev_attr.attr.mode = 0444;
> +		temp->dev_attr.show = lwmi_fan_method_temp_show;
> +		temp->index = i;
> +		priv->attrs[i * 2 + 1] = &temp->dev_attr.attr;
> +	}
> +
> +	priv->group.attrs = priv->attrs;
> +}
> +
> +static int lwmi_fan_method_master_bind(struct device *dev)
> +{
> +	struct lwmi_fan_method_priv *priv = dev_get_drvdata(dev);
> +
> +	return component_bind_all(dev, &priv->group);
> +}
> +
> +static void lwmi_fan_method_master_unbind(struct device *dev)
> +{
> +	component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops lwmi_fan_method_master_ops = {
> +	.bind = lwmi_fan_method_master_bind,
> +	.unbind = lwmi_fan_method_master_unbind,
> +};
> +
> +static int lwmi_fan_method_component_compare(struct device *dev, void *data)
> +{
> +	struct device *master = data;
> +
> +	return dev->driver &&
> +		!strcmp(dev->driver->name, "lenovo_wmi_other") &&
> +		dev->parent == master->parent;
> +}
> +
> +static int lwmi_fan_method_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct component_match *master_match = NULL;
> +	struct lwmi_fan_method_priv *priv;
> +
> +	if (!dmi_check_system(lwmi_fan_dmi_table))
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev = wdev;
> +	mutex_init(&priv->lock);

This would need to be paired with mutex_destroy.

BUT instead, use devm_mutex_init() + don't forget error handling, it can 
fail.

> +	lwmi_fan_method_attrs_init(priv);
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	component_match_add(&wdev->dev, &master_match,
> +			    lwmi_fan_method_component_compare, &wdev->dev);
> +	if (IS_ERR(master_match))
> +		return PTR_ERR(master_match);
> +
> +	return component_master_add_with_match(&wdev->dev,
> +					       &lwmi_fan_method_master_ops,
> +					       master_match);
> +}
> +
> +static void lwmi_fan_method_remove(struct wmi_device *wdev)
> +{
> +	component_master_del(&wdev->dev, &lwmi_fan_method_master_ops);
> +}
> +
> +static const struct wmi_device_id lwmi_fan_method_id_table[] = {
> +	{ LENOVO_FAN_METHOD_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_fan_method_driver = {
> +	.driver = {
> +		.name = "lenovo_wmi_fan_method",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = lwmi_fan_method_id_table,
> +	.probe = lwmi_fan_method_probe,
> +	.remove = lwmi_fan_method_remove,
> +	.no_singleton = true,
> +};
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_fan_method_id_table);
> +module_wmi_driver(lwmi_fan_method_driver);
> +
> +MODULE_AUTHOR("Aditya Dash <mradityadash@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Fan Method WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index b4be7739b243..72d3510b17b2 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -192,11 +192,13 @@ struct lwmi_om_priv {
>  	struct device *fw_attr_dev;
>  	struct kset *fw_attr_kset;
>  	struct wmi_device *wdev;
> +	const struct attribute_group *fan_method_group;
>  	int ida_id;
>  
>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>  	bool fullspeed_supported;
>  	bool fan0_input_fallback;
> +	bool fan_method_group_added;
>  
>  	struct {
>  		bool capdata00_collected : 1;
> @@ -542,6 +544,31 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
>  	.info = lwmi_om_hwmon_info,
>  };
>  
> +static int lwmi_om_fan_method_group_add(struct lwmi_om_priv *priv)
> +{
> +	int ret;
> +
> +	if (!priv->hwmon_dev || !priv->fan_method_group ||
> +	    priv->fan_method_group_added)
> +		return 0;
> +
> +	ret = sysfs_create_group(&priv->hwmon_dev->kobj,
> +				 priv->fan_method_group);
> +	if (!ret)
> +		priv->fan_method_group_added = true;
> +
> +	return ret;
> +}
> +
> +static void lwmi_om_fan_method_group_remove(struct lwmi_om_priv *priv)
> +{
> +	if (!priv->hwmon_dev || !priv->fan_method_group_added)
> +		return;
> +
> +	sysfs_remove_group(&priv->hwmon_dev->kobj, priv->fan_method_group);
> +	priv->fan_method_group_added = false;
> +}
> +
>  /**
>   * lwmi_om_hwmon_add() - Register HWMON device if all info is collected
>   * @priv: Driver private data
> @@ -550,9 +577,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
>  	u32 rpm;
>  	long enable;
> -	int i, valid;
> +	int i, ret, valid;
>  
> -	if (WARN_ON(priv->hwmon_dev))
> +	if (priv->hwmon_dev)

If you need changes to hwmon_dev behavior, could you please separate 
things related to that into own patch with a proper justification (you can 
refer to the following change with "an upcoming change" if needed to 
explain why you have to do it).

>  		return;
>  
>  	if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capdata_fan_collected) {
> @@ -592,7 +619,8 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  		}
>  	}
>  
> -	if (valid == 0 && !priv->fullspeed_supported && !priv->fan0_input_fallback) {
> +	if (valid == 0 && !priv->fullspeed_supported &&
> +	    !priv->fan0_input_fallback && !priv->fan_method_group) {
>  		dev_warn(&priv->wdev->dev,
>  			 "fan reporting/tuning is unsupported on this device\n");
>  		return;
> @@ -609,6 +637,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  		return;
>  	}
>  
> +	ret = lwmi_om_fan_method_group_add(priv);
> +	if (ret)
> +		dev_warn(&priv->wdev->dev,
> +			 "failed to register Fan Method attributes: %d\n", ret);
> +
>  	dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
>  }
>  
> @@ -623,6 +656,7 @@ static void lwmi_om_hwmon_remove(struct lwmi_om_priv *priv)
>  	if (!priv->hwmon_dev)
>  		return;
>  
> +	lwmi_om_fan_method_group_remove(priv);
>  	hwmon_device_unregister(priv->hwmon_dev);
>  	priv->hwmon_dev = NULL;
>  }
> @@ -1801,10 +1835,44 @@ static const struct component_master_ops lwmi_om_master_ops = {
>  	.unbind = lwmi_om_master_unbind,
>  };
>  
> +static int lwmi_om_fan_method_component_bind(struct device *component,
> +					     struct device *master, void *data)
> +{
> +	const struct attribute_group *group = data;
> +	struct lwmi_om_priv *priv = dev_get_drvdata(component);
> +	int ret;
> +
> +	if (!group)
> +		return -EINVAL;
> +
> +	priv->fan_method_group = group;
> +	lwmi_om_hwmon_add(priv);
> +	ret = lwmi_om_fan_method_group_add(priv);
> +	if (ret)
> +		priv->fan_method_group = NULL;
> +
> +	return ret;
> +}
> +
> +static void lwmi_om_fan_method_component_unbind(struct device *component,
> +						struct device *master, void *data)
> +{
> +	struct lwmi_om_priv *priv = dev_get_drvdata(component);
> +
> +	lwmi_om_fan_method_group_remove(priv);
> +	priv->fan_method_group = NULL;
> +}
> +
> +static const struct component_ops lwmi_om_fan_method_component_ops = {
> +	.bind = lwmi_om_fan_method_component_bind,
> +	.unbind = lwmi_om_fan_method_component_unbind,
> +};
> +
>  static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
>  {
>  	struct component_match *master_match = NULL;
>  	struct lwmi_om_priv *priv;
> +	int ret;
>  
>  	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -1816,16 +1884,31 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
>  	priv->wdev = wdev;
>  	dev_set_drvdata(&wdev->dev, priv);
>  
> +	ret = component_add(&wdev->dev, &lwmi_om_fan_method_component_ops);
> +	if (ret)
> +		return ret;
> +
>  	lwmi_cd_match_add_all(&wdev->dev, &master_match);
> -	if (IS_ERR(master_match))
> -		return PTR_ERR(master_match);
> +	if (IS_ERR(master_match)) {
> +		ret = PTR_ERR(master_match);
> +		goto err_component;
> +	}
> +
> +	ret = component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
> +					      master_match);
> +	if (ret)
> +		goto err_component;
> +
> +	return 0;
>  
> -	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
> -					       master_match);
> +err_component:
> +	component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
> +	return ret;
>  }
>  
>  static void lwmi_other_remove(struct wmi_device *wdev)
>  {
> +	component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
>  	component_master_del(&wdev->dev, &lwmi_om_master_ops);
>  }
>  
> 

-- 
 i.

