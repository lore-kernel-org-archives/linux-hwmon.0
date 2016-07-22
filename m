Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35949 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713AbcGVWgw (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 22 Jul 2016 18:36:52 -0400
Date: Fri, 22 Jul 2016 15:36:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: adt7411: add external thermal diode support
Message-ID: <20160722223645.GB1116@roeck-us.net>
References: <1469203855-18094-1-git-send-email-michael@walle.cc>
 <1469203855-18094-2-git-send-email-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469203855-18094-2-git-send-email-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jul 22, 2016 at 06:10:55PM +0200, Michael Walle wrote:
> If the EXT_TDM bit is set and ain[12]_input will be switch to a temp2_input
> attribute.

ain -> in

"will be switch" is odd.

"If the EXT_TDM bit is set, the chip supports a second temperature sensor
instead of two voltage sensors", maybe ?

> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/hwmon/adt7411.c | 51 +++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
> index 410405b..5351bf3 100644
> --- a/drivers/hwmon/adt7411.c
> +++ b/drivers/hwmon/adt7411.c
> @@ -7,8 +7,7 @@
>   *  it under the terms of the GNU General Public License version 2 as
>   *  published by the Free Software Foundation.
>   *
> - *  TODO: SPI, support for external temperature sensor
> - *	  use power-down mode for suspend?, interrupt handling?
> + *  TODO: SPI, use power-down mode for suspend?, interrupt handling?
>   */
>  
>  #include <linux/kernel.h>
> @@ -31,6 +30,7 @@
>  #define ADT7411_REG_CFG1			0x18
>  #define ADT7411_CFG1_START_MONITOR		(1 << 0)
>  #define ADT7411_CFG1_RESERVED_BIT1		(1 << 1)
> +#define ADT7411_CFG1_EXT_TDM			(1 << 2)
>  #define ADT7411_CFG1_RESERVED_BIT3		(1 << 3)
>  
>  #define ADT7411_REG_CFG2			0x19
> @@ -57,6 +57,7 @@ struct adt7411_data {
>  	unsigned long next_update;
>  	int vref_cached;
>  	struct i2c_client *client;
> +	bool use_ext_temp;
>  };
>  
>  /*
> @@ -127,11 +128,20 @@ static ssize_t adt7411_show_vdd(struct device *dev,
>  static ssize_t adt7411_show_temp(struct device *dev,
>  			struct device_attribute *attr, char *buf)
>  {
> +	int nr = to_sensor_dev_attr(attr)->index;
>  	struct adt7411_data *data = dev_get_drvdata(dev);
>  	struct i2c_client *client = data->client;
> -	int val = adt7411_read_10_bit(client, ADT7411_REG_INT_TEMP_VDD_LSB,
> -			ADT7411_REG_INT_TEMP_MSB, 0);
> -
> +	int val;
> +	struct {
> +		u8 low;
> +		u8 high;
> +	} reg[2] = {
> +		{ ADT7411_REG_INT_TEMP_VDD_LSB, ADT7411_REG_INT_TEMP_MSB },
> +		{ ADT7411_REG_EXT_TEMP_AIN14_LSB,
> +		  ADT7411_REG_EXT_TEMP_AIN1_MSB },
> +	};
> +
> +	val = adt7411_read_10_bit(client, reg[nr].low, reg[nr].high, 0);
>  	if (val < 0)
>  		return val;
>  
> @@ -218,11 +228,13 @@ static ssize_t adt7411_set_bit(struct device *dev,
>  	return ret < 0 ? ret : count;
>  }
>  
> +
>  #define ADT7411_BIT_ATTR(__name, __reg, __bit) \
>  	SENSOR_DEVICE_ATTR_2(__name, S_IRUGO | S_IWUSR, adt7411_show_bit, \
>  	adt7411_set_bit, __bit, __reg)
>  
> -static DEVICE_ATTR(temp1_input, S_IRUGO, adt7411_show_temp, NULL);
> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, adt7411_show_temp, NULL, 0);
> +static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, adt7411_show_temp, NULL, 1);
>  static DEVICE_ATTR(in0_input, S_IRUGO, adt7411_show_vdd, NULL);
>  static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, adt7411_show_input, NULL, 0);
>  static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, adt7411_show_input, NULL, 1);
> @@ -237,7 +249,8 @@ static ADT7411_BIT_ATTR(fast_sampling, ADT7411_REG_CFG3, ADT7411_CFG3_ADC_CLK_22
>  static ADT7411_BIT_ATTR(adc_ref_vdd, ADT7411_REG_CFG3, ADT7411_CFG3_REF_VDD);
>  
>  static struct attribute *adt7411_attrs[] = {
> -	&dev_attr_temp1_input.attr,
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp2_input.dev_attr.attr,
>  	&dev_attr_in0_input.attr,
>  	&sensor_dev_attr_in1_input.dev_attr.attr,
>  	&sensor_dev_attr_in2_input.dev_attr.attr,
> @@ -253,7 +266,27 @@ static struct attribute *adt7411_attrs[] = {
>  	NULL
>  };
>  
> -ATTRIBUTE_GROUPS(adt7411);
> +static umode_t adt7411_attrs_visible(struct kobject *kobj,
> +				     struct attribute *attr, int index)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct adt7411_data *data = dev_get_drvdata(dev);
> +	bool visible = true;
> +
> +	if (attr == &sensor_dev_attr_temp2_input.dev_attr.attr)
> +		visible = data->use_ext_temp;
> +	else if (attr == &sensor_dev_attr_in1_input.dev_attr.attr ||
> +		 attr == &sensor_dev_attr_in2_input.dev_attr.attr)
> +		visible = !data->use_ext_temp;
> +
> +	return (visible) ? attr->mode : 0;

Unnecessary ( ).

> +}
> +
> +static const struct attribute_group adt7411_group = {
> +	.attrs = adt7411_attrs,
> +	.is_visible = adt7411_attrs_visible,
> +};
> +__ATTRIBUTE_GROUPS(adt7411);
>  
>  static int adt7411_detect(struct i2c_client *client,
>  			  struct i2c_board_info *info)
> @@ -311,6 +344,8 @@ static int adt7411_init_device(struct adt7411_data *data)
>  	if (ret < 0)
>  		goto exit_unlock;
>  
> +	data->use_ext_temp = ret & ADT7411_CFG1_EXT_TDM;
> +
>  	/*
>  	 * We must only write zero to bit 1 and only one to bit 3 according to
>  	 * the datasheet.
> -- 
> 2.1.4
> 
