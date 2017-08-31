Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33844 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750911AbdHaELN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Aug 2017 00:11:13 -0400
Date: Wed, 30 Aug 2017 21:11:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: (ucd9000) Add sysfs attribute to clear logged
 faults
Message-ID: <20170831041111.GC26660@roeck-us.net>
References: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
 <20170830185536.71307-3-cbostic@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170830185536.71307-3-cbostic@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 30, 2017 at 01:55:36PM -0500, Christopher Bostic wrote:
> Add ability to clear logged faults via sysfs.
> 
I am not in favor of such chip specific commands, in this case for several
reasons (besides it being a non-standard attribute).

The logged faults are not read or used by the driver in the first place.
Clearing them doesn't add any benefit for the driver.

The command as written only clears non-paged logged faults, but no paged
faults.

While PMBus "lingo" talks of faults, those are really often just status bits,
not "faults" from hwmon perspective.

The content of the various fault bits and bites is highly chip specific.
On top of that, each chip supported by the driver has different fault bits
and bytes.

To read the logged faults you have to access the chip directly, not through
the driver. I don't see the benefit of providing a sysfs attribute to clear
non-paged logged faults, but not doing anything else with it.

If you want to do something special with those faults (or status bits/nytes),
it might be more appropriate to create debugfs entries.

Thanks,
Guenter

> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/hwmon/pmbus/ucd9000.c | 45 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index b74dbec..8bd8cb1 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -27,6 +27,8 @@
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
>  #include <linux/pmbus.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon-sysfs.h>
>  #include "pmbus.h"
>  
>  enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
> @@ -35,6 +37,7 @@
>  #define UCD9000_NUM_PAGES		0xd6
>  #define UCD9000_FAN_CONFIG_INDEX	0xe7
>  #define UCD9000_FAN_CONFIG		0xe8
> +#define UCD9000_LOGGED_FAULTS		0xea
>  #define UCD9000_DEVICE_ID		0xfd
>  
>  #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> @@ -109,6 +112,36 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
>  	return ret;
>  }
>  
> +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
> +			struct device_attribute *attr, const char *buf,
> +			size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	/* No page set required */
> +	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to clear logged faults: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
> +			ucd9000_clear_logged_faults);
> +
> +static struct attribute *ucd9000_attributes[] = {
> +	&dev_attr_clear_logged_faults.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group ucd9000_attr_group = {
> +	.attrs = ucd9000_attributes,
> +};
> +
>  static const struct i2c_device_id ucd9000_id[] = {
>  	{"ucd9000", ucd9000},
>  	{"ucd90120", ucd90120},
> @@ -263,9 +296,19 @@ static int ucd9000_probe(struct i2c_client *client,
>  		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
>  	}
>  
> +	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
> +	if (ret < 0)
> +		return ret;
> +
>  	return pmbus_do_probe(client, mid, info);
>  }
>  
> +static int ucd9000_remove(struct i2c_client *client)
> +{
> +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
> +	return pmbus_do_remove(client);
> +}
> +
>  /* This is the driver that will be inserted */
>  static struct i2c_driver ucd9000_driver = {
>  	.driver = {
> @@ -273,7 +316,7 @@ static int ucd9000_probe(struct i2c_client *client,
>  		.of_match_table = of_match_ptr(ucd9000_of_match),
>  	},
>  	.probe = ucd9000_probe,
> -	.remove = pmbus_do_remove,
> +	.remove = ucd9000_remove,
>  	.id_table = ucd9000_id,
>  };
>  
> -- 
> 1.8.2.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
