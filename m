Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:44684 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751827AbcF0Ouz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 27 Jun 2016 10:50:55 -0400
Subject: Re: [PATCH] hwmon: (ina3221) Fix negative limits
To: Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <1466822827-31231-1-git-send-email-linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.de>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <57713D16.6000701@ti.com>
Date: Mon, 27 Jun 2016 09:49:58 -0500
MIME-Version: 1.0
In-Reply-To: <1466822827-31231-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/24/2016 09:47 PM, Guenter Roeck wrote:
> The result of an integer divide by an unsigned is undefined.
> This causes unexpected results when writing negative values
> into the limit registers.
> 
> Maintain the shunt_resistors variables as signed integer to avoid
> the problem. Also, for simplicity and ease of use, clamp shunt
> resistor value on writes instead of rejecting bad values.
> 
> Cc: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Acked-by: Andrew F. Davis <afd@ti.com>

>  drivers/hwmon/ina3221.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index d055b6a2266b..e6b49500c52a 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -95,7 +95,7 @@ static const unsigned int register_channel[] = {
>  struct ina3221_data {
>  	struct regmap *regmap;
>  	struct regmap_field *fields[F_MAX_FIELDS];
> -	unsigned int shunt_resistors[INA3221_NUM_CHANNELS];
> +	int shunt_resistors[INA3221_NUM_CHANNELS];
>  };
>  
>  static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
> @@ -155,7 +155,7 @@ static ssize_t ina3221_show_current(struct device *dev,
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
>  	unsigned int reg = sd_attr->index;
>  	unsigned int channel = register_channel[reg];
> -	unsigned int resistance_uo = ina->shunt_resistors[channel];
> +	int resistance_uo = ina->shunt_resistors[channel];
>  	int val, current_ma, voltage_nv, ret;
>  
>  	ret = ina3221_read_value(ina, reg, &val);
> @@ -176,7 +176,7 @@ static ssize_t ina3221_set_current(struct device *dev,
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
>  	unsigned int reg = sd_attr->index;
>  	unsigned int channel = register_channel[reg];
> -	unsigned int resistance_uo = ina->shunt_resistors[channel];
> +	int resistance_uo = ina->shunt_resistors[channel];
>  	int val, current_ma, voltage_uv, ret;
>  
>  	ret = kstrtoint(buf, 0, &current_ma);
> @@ -223,15 +223,14 @@ static ssize_t ina3221_set_shunt(struct device *dev,
>  	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
>  	unsigned int channel = sd_attr->index;
> -	unsigned int val;
> +	int val;
>  	int ret;
>  
> -	ret = kstrtouint(buf, 0, &val);
> +	ret = kstrtoint(buf, 0, &val);
>  	if (ret)
>  		return ret;
>  
> -	if (val == 0)
> -		return -EINVAL;
> +	val = clamp_val(val, 1, INT_MAX);
>  
>  	ina->shunt_resistors[channel] = val;
>  
> 
