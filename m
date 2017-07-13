Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:32786 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752466AbdGMPKv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jul 2017 11:10:51 -0400
Date: Thu, 13 Jul 2017 08:10:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: zbr@ioremap.net, linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [linux,v2,3/3] drivers: w1: add hwmon temp support for w1_therm
Message-ID: <20170713151044.GA21571@roeck-us.net>
References: <20170712214118.4306-4-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170712214118.4306-4-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 12, 2017 at 02:41:18PM -0700, Jaghathiswari Rankappagounder Natarajan wrote:
> This change adds hwmon temp support for w1_therm.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
> ---
> v2
> - make changes to support hwmon_device_register_with_info mentioned by Guenter.
> 
>  drivers/w1/slaves/w1_therm.c | 117 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> --
> 2.13.2.932.g7449e964c-goog
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
> index 88f4cc8c3908..147f9dfa13de 100644
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
> @@ -118,19 +119,61 @@ static struct attribute *w1_ds28ea00_attrs[] = {
>  	&dev_attr_w1_seq.attr,
>  	NULL,
>  };
> +
>  ATTRIBUTE_GROUPS(w1_therm);
>  ATTRIBUTE_GROUPS(w1_ds28ea00);
> 

Do you want the following code all the time, or enclose it in
IS_REACHABLE() ?

> +static umode_t w1_is_visible(const void *_data,
> +			     enum hwmon_sensor_types type,
> +			     u32 attr, int channel);
> +
> +static int w1_read_temp(struct device *dev, u32 attr, int channel,
> +			long *val);
> +
> +static int w1_read(struct device *dev, enum hwmon_sensor_types type,
> +		   u32 attr, int channel, long *val);
> +
> +static int w1_write(struct device *dev, enum hwmon_sensor_types type,
> +		    u32 attr, int channel, long val);
> +

Any chance you can rearrange the code to not require forward declarations ?

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
> +	.write = w1_write,
> +};
> +
> +static const struct hwmon_chip_info w1_chip_info = {
> +	.ops = &w1_hwmon_ops,
> +	.info = w1_info,
> +};
> +
>  static struct w1_family_ops w1_therm_fops = {
>  	.add_slave	= w1_therm_add_slave,
>  	.remove_slave	= w1_therm_remove_slave,
>  	.groups		= w1_therm_groups,
> +	.chip_info	= &w1_chip_info,
>  };
> 
>  static struct w1_family_ops w1_ds28ea00_fops = {
>  	.add_slave	= w1_therm_add_slave,
>  	.remove_slave	= w1_therm_remove_slave,
>  	.groups		= w1_ds28ea00_groups,
> +	.chip_info	= &w1_chip_info,
>  };
> 
>  static struct w1_family w1_therm_family_DS18S20 = {
> @@ -559,6 +602,80 @@ static ssize_t w1_slave_show(struct device *device,
>  	return ret;
>  }
> 
> +static int w1_read_temp(struct device *device, u32 attr, int channel,
> +			long *val)
> +{
> +	struct w1_slave *sl = dev_get_drvdata(device);
> +	u8 *family_data = sl->family_data;
> +	struct therm_info info;
> +	int ret;
> +
> +	if (!sl->family_data)

Why not use family_data here ?

> +		return -ENODEV;
> +
> +	/* prevent the slave from going away in sleep */
> +	atomic_inc(THERM_REFCNT(family_data));

The original code increments the reference count with the bus mutex locked.
Similar, the original code only checks if family_data is NULL after locking
the bus mutex.

Are you sure this change in sequence doesn't cause race conditions ?
If this function can be called with family_data == NULL, what guarantees
that it isn't set to NULL after being checked but before the reference
count is increased (or, in other words, that the atomic_inc() doesn't
increment a reference counter in freed memory) ?

> +
> +	switch (attr) {
> +	case hwmon_temp_input:

indentation below is off.

> +	ret = read_therm(device, sl, &info);
> +	if (ret)
> +		goto dec_refcnt;
> +
> +	if (!info.verdict) {
> +		dev_warn(device, "Read failed CRC check\n");

I personally dislike such noise. Personal preference, of course.

> +		ret = -EIO;
> +		goto dec_refcnt;
> +	}
> +
> +	*val = w1_convert_temp(info.rom, sl->family->fid);
> +	ret = 0;
> +	break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +dec_refcnt:
> +	atomic_dec(THERM_REFCNT(family_data));
> +	return ret;
> +}
> +
> +static umode_t w1_is_visible(const void *_data, enum hwmon_sensor_types type,
> +			     u32 attr, int channel)
> +{
> +	umode_t mode = 0444;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		break;
> +	default:
> +		mode = 0;
> +		break;
> +	}
> +	return mode;

	return attr == hwmon_temp_input ? 0444 : 0;

would be a bit simpler here.

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
> +static int w1_write(struct device *dev, enum hwmon_sensor_types type,
> +		    u32 attr, int channel, long val)

You don't need a write function, since attributes are never writeable.

> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>  #define W1_42_CHAIN	0x99
>  #define W1_42_CHAIN_OFF	0x3C
>  #define W1_42_CHAIN_OFF_INV	0xC3
