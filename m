Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50705 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752966AbdGNCsL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jul 2017 22:48:11 -0400
Date: Thu, 13 Jul 2017 19:48:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: zbr@ioremap.net, linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH linux v4 3/3] drivers: w1: add hwmon temp support for
 w1_therm
Message-ID: <20170714024808.GA13796@roeck-us.net>
References: <20170713224107.12789-1-jaghu@google.com>
 <20170713224107.12789-4-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170713224107.12789-4-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jul 13, 2017 at 03:41:07PM -0700, Jaghathiswari Rankappagounder Natarajan wrote:
> This change adds hwmon temp support for w1_therm.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2
> - make changes to support hwmon_device_register_with_info mentioned by Guenter.
> 
> v3
> - used IS_REACHABLE()
> - rearranged the code to not require forward declarations
> - used family_data
> - incremented the reference count with the bus mutex locked
> - corrected indentation
> - removed dev_warn message
> - simplified returning mode
> - removed write function
> 
> v4
> - used W1_CHIP_INFO
> - corrected formatting
> 
>  drivers/w1/slaves/w1_therm.c | 86 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
> index 64e6a8f38410..c99886ac1dbf 100644
> --- a/drivers/w1/slaves/w1_therm.c
> +++ b/drivers/w1/slaves/w1_therm.c
> @@ -29,6 +29,7 @@
>  #include <linux/types.h>
>  #include <linux/slab.h>
>  #include <linux/delay.h>
> +#include <linux/hwmon.h>
> 
>  #include "../w1.h"
>  #include "../w1_int.h"
> @@ -118,19 +119,72 @@ static struct attribute *w1_ds28ea00_attrs[] = {
>  	&dev_attr_w1_seq.attr,
>  	NULL,
>  };
> +
>  ATTRIBUTE_GROUPS(w1_therm);
>  ATTRIBUTE_GROUPS(w1_ds28ea00);
> 
> +#if IS_REACHABLE(CONFIG_HWMON)
> +static int w1_read_temp(struct device *dev, u32 attr, int channel,
> +			long *val);
> +
> +static umode_t w1_is_visible(const void *_data, enum hwmon_sensor_types type,
> +			     u32 attr, int channel)
> +{
> +	return attr == hwmon_temp_input ? 0444 : 0;
> +}
> +
> +static int w1_read(struct device *dev, enum hwmon_sensor_types type,
> +		   u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return w1_read_temp(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const u32 w1_temp_config[] = {
> +	HWMON_T_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info w1_temp = {
> +	.type = hwmon_temp,
> +	.config = w1_temp_config,
> +};
> +
> +static const struct hwmon_channel_info *w1_info[] = {
> +	&w1_temp,
> +	NULL
> +};
> +
> +static const struct hwmon_ops w1_hwmon_ops = {
> +	.is_visible = w1_is_visible,
> +	.read = w1_read,
> +};
> +
> +static const struct hwmon_chip_info w1_chip_info = {
> +	.ops = &w1_hwmon_ops,
> +	.info = w1_info,
> +};
> +#define W1_CHIPINFO	(&w1_chip_info)
> +#else
> +#define W1_CHIPINFO	NULL
> +#endif
> +
>  static struct w1_family_ops w1_therm_fops = {
>  	.add_slave	= w1_therm_add_slave,
>  	.remove_slave	= w1_therm_remove_slave,
>  	.groups		= w1_therm_groups,
> +	.chip_info	= W1_CHIPINFO,
>  };
> 
>  static struct w1_family_ops w1_ds28ea00_fops = {
>  	.add_slave	= w1_therm_add_slave,
>  	.remove_slave	= w1_therm_remove_slave,
>  	.groups		= w1_ds28ea00_groups,
> +	.chip_info	= W1_CHIPINFO,
>  };
> 
>  static struct w1_family w1_therm_family_DS18S20 = {
> @@ -559,6 +613,38 @@ static ssize_t w1_slave_show(struct device *device,
>  	return ret;
>  }
> 
> +#if IS_REACHABLE(CONFIG_HWMON)
> +static int w1_read_temp(struct device *device, u32 attr, int channel,
> +			long *val)
> +{
> +	struct w1_slave *sl = dev_get_drvdata(device);
> +	struct therm_info info;
> +	u8 fid = sl->family->fid;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		ret = read_therm(device, sl, &info);
> +		if (ret)
> +			return ret;
> +
> +		if (!info.verdict) {
> +			ret = -EIO;
> +			return ret;
> +		}
> +
> +		*val = w1_convert_temp(info.rom, fid);
> +		ret = 0;
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +#endif
> +
>  #define W1_42_CHAIN	0x99
>  #define W1_42_CHAIN_OFF	0x3C
>  #define W1_42_CHAIN_OFF_INV	0xC3
> --
> 2.13.2.932.g7449e964c-goog
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
