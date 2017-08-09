Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60238 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752265AbdHICAE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Aug 2017 22:00:04 -0400
Date: Tue, 8 Aug 2017 19:00:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: linux-hwmon@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        jk@ozlabs.org, cbostic@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [RFC,3/3] drivers/hwmon/pmbus: Add sensor status to pmbus
 attributes
Message-ID: <20170809020002.GA19465@roeck-us.net>
References: <1502162748-16372-4-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502162748-16372-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 07, 2017 at 10:25:48PM -0500, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Extend the pmbus core to provide status registers for attributes.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

NACK, sorry. As mentioned separately, please consider adding debugfs
support instead.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 51 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 3b53fa7..00ce145 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -86,6 +86,14 @@ struct pmbus_label {
>  #define to_pmbus_label(_attr) \
>  	container_of(_attr, struct pmbus_label, attribute)
>  
> +struct pmbus_status {
> +	char name[PMBUS_NAME_SIZE];	/* sysfs status name */
> +	struct device_attribute attribute;
> +	int reg;
> +};
> +#define to_pmbus_status(_attr) \
> +	container_of(_attr, struct pmbus_status, attribute)
> +
>  struct pmbus_data {
>  	struct device *dev;
>  	struct device *hwmon_dev;
> @@ -851,6 +859,16 @@ static ssize_t pmbus_show_label(struct device *dev,
>  	return snprintf(buf, PAGE_SIZE, "%s\n", label->label);
>  }
>  
> +static ssize_t pmbus_show_status(struct device *dev,
> +				 struct device_attribute *da, char *buf)
> +{
> +	struct pmbus_status *status = to_pmbus_status(da);
> +	struct pmbus_data *data = pmbus_update_device(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%02x\n",
> +			pmbus_get_status(data, status->reg) & 0xFF);
> +}
> +
>  static int pmbus_add_attribute(struct pmbus_data *data, struct attribute *attr)
>  {
>  	if (data->num_attributes >= data->max_attributes - 1) {
> @@ -983,6 +1001,25 @@ static int pmbus_add_label(struct pmbus_data *data,
>  	return pmbus_add_attribute(data, &a->attr);
>  }
>  
> +static int pmbus_add_status(struct pmbus_data *data, const char *name, int seq,
> +			    int reg)
> +{
> +	struct pmbus_status *status;
> +	struct device_attribute *a;
> +
> +	status = devm_kzalloc(data->dev, sizeof(*status), GFP_KERNEL);
> +	if (!status)
> +		return -ENOMEM;
> +
> +	a = &status->attribute;
> +
> +	snprintf(status->name, sizeof(status->name), "%s%d_status", name, seq);
> +	status->reg = reg;
> +
> +	pmbus_dev_attr_init(a, status->name, S_IRUGO, pmbus_show_status, NULL);
> +	return pmbus_add_attribute(data, &a->attr);
> +}
> +
>  /*
>   * Search for attributes. Allocate sensors, booleans, and labels as needed.
>   */
> @@ -1105,6 +1142,16 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  				return ret;
>  		}
>  	}
> +	if (attr->sbase > 0 && attr->sbase < PB_STATUS_VMON_BASE) {
> +		/* Add "status" attribute for physical status registers to dump
> +		 * the contents. This is pretty useful for hardware diagnostic
> +		 * purposes, as an alarm or fault bit doesn't necessarily
> +		 * provide all the info available.
> +		 */
> +		ret = pmbus_add_status(data, name, index, attr->sbase + page);
> +		if (ret)
> +			return ret;
> +	}
>  	return 0;
>  }
>  
> @@ -1693,6 +1740,10 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>  					PB_FAN_FAN1_FAULT >> (f & 1));
>  				if (ret)
>  					return ret;
> +				ret = pmbus_add_status(data, "fan", index,
> +						       base);
> +				if (ret)
> +					return ret;
>  			}
>  			index++;
>  		}
