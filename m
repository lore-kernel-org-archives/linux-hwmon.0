Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49120 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752581AbdHJOzA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 10:55:00 -0400
Date: Thu, 10 Aug 2017 07:54:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH 2/4] drivers/hwmon/pmbus: ibmps: Add non-hwmon attributes
Message-ID: <20170810145458.GB4945@roeck-us.net>
References: <1501708633-2964-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501708633-2964-3-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501708633-2964-3-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 02, 2017 at 04:17:11PM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Add sysfs entries to dump out PS registers and clear faults.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/pmbus/ibmps.c | 78 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.c
> index 1928dd9..f55d2bf 100644
> --- a/drivers/hwmon/pmbus/ibmps.c
> +++ b/drivers/hwmon/pmbus/ibmps.c
> @@ -9,8 +9,10 @@
>  
>  #include <linux/device.h>
>  #include <linux/i2c.h>
> +#include <linux/hwmon-sysfs.h>
>  #include <linux/jiffies.h>
>  #include <linux/module.h>
> +#include <linux/sysfs.h>
>  
>  #include "pmbus.h"
>  
> @@ -122,14 +124,90 @@ static int ibmps_read_word_data(struct i2c_client *client, int page, int reg)
>  	.read_word_data = ibmps_read_word_data,
>  };
>  
> +static ssize_t ibmps_clear_faults(struct device *dev,
> +				  struct device_attribute *dev_attr,
> +				  const char *buf, size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	pmbus_clear_faults(client);
> +
> +	return count;
> +}
> +static DEVICE_ATTR(clear_faults, 0200, NULL, ibmps_clear_faults);
> +
This is unacceptable as a driver specific attribute. It does
nothing driver specific. I'll have to look into it, but isn't there
a standard attribute we could use for that ?

> +static ssize_t ibmps_show_status_word(struct device *dev,
> +				      struct device_attribute *dev_attr,
> +				      char *buf)
> +{
> +	int rc;
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	rc = pmbus_read_word_data(client, 0, PMBUS_STATUS_WORD);
> +	if (rc < 0)
> +		return rc;
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%04x\n", rc);
> +}
> +static DEVICE_ATTR(status_word, 0444, ibmps_show_status_word, NULL);
> +
> +static ssize_t ibmps_show_status_byte(struct device *dev,
> +				      struct device_attribute *dev_attr,
> +				      char *buf)
> +{
> +	int rc;
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(dev_attr);
> +
> +	rc = pmbus_read_byte_data(client, 0, PMBUS_STATUS_VOUT + sattr->index);
> +	if (rc < 0)
> +		return rc;
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%02x\n", rc);
> +}

As mentioned separately, those are unacceptable.

> +
> +static SENSOR_DEVICE_ATTR(status_vout, 0444, ibmps_show_status_byte, NULL, 0);
> +static SENSOR_DEVICE_ATTR(status_iout, 0444, ibmps_show_status_byte, NULL, 1);
> +static SENSOR_DEVICE_ATTR(status_input, 0444, ibmps_show_status_byte, NULL, 2);
> +static SENSOR_DEVICE_ATTR(status_temp, 0444, ibmps_show_status_byte, NULL, 3);
> +static SENSOR_DEVICE_ATTR(status_cml, 0444, ibmps_show_status_byte, NULL, 4);
> +static SENSOR_DEVICE_ATTR(status_other, 0444, ibmps_show_status_byte, NULL, 5);
> +static SENSOR_DEVICE_ATTR(status_mfr, 0444, ibmps_show_status_byte, NULL, 6);
> +static SENSOR_DEVICE_ATTR(status_fan, 0444, ibmps_show_status_byte, NULL, 7);
> +
> +static struct attribute *ibmps_attributes[] = {
> +	&dev_attr_clear_faults.attr,
> +	&dev_attr_status_word.attr,
> +	&sensor_dev_attr_status_vout.dev_attr.attr,
> +	&sensor_dev_attr_status_iout.dev_attr.attr,
> +	&sensor_dev_attr_status_input.dev_attr.attr,
> +	&sensor_dev_attr_status_temp.dev_attr.attr,
> +	&sensor_dev_attr_status_cml.dev_attr.attr,
> +	&sensor_dev_attr_status_other.dev_attr.attr,
> +	&sensor_dev_attr_status_mfr.dev_attr.attr,
> +	&sensor_dev_attr_status_fan.dev_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group ibmps_attribute_group = {
> +	.attrs = ibmps_attributes,
> +};
> +
>  static int ibmps_probe(struct i2c_client *client,
>  		       const struct i2c_device_id *id)
>  {
> +	int rc = sysfs_create_group(&client->dev.kobj,
> +				    &ibmps_attribute_group);

This is just wrong. It attaches the attributes to the i2c driver, not to the
hwmon driver. If we do need driver specific attributes, we would have to enhance
the pmbus core to accept a sysfs group or list of sysfs groups as additional
parameter to pmbus_do_probe (or to the info data structure).

Guenter
> +	if (rc)
> +		return rc;
> +
>  	return pmbus_do_probe(client, id, &ibmps_info);
>  }
>  
>  static int ibmps_remove(struct i2c_client *client)
>  {
> +	sysfs_remove_group(&client->dev.kobj, &ibmps_attribute_group);
> +
>  	return pmbus_do_remove(client);
>  }
>  
> -- 
> 1.8.3.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
