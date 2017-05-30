Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39972 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750821AbdE3WOM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 May 2017 18:14:12 -0400
Date: Tue, 30 May 2017 15:14:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Venture <venture@google.com>
Cc: joel@jms.id.au, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [v3] hwmon: (aspeed-pwm-tacho) On read failure return -ETIMEDOUT
Message-ID: <20170530221410.GA9755@roeck-us.net>
References: <20170530194201.4540-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170530194201.4540-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, May 30, 2017 at 12:42:01PM -0700, Patrick Venture wrote:
> When the controller fails to provide an RPM reading within the alloted
> time; the driver returns -ETIMEDOUT and no file contents.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 48403a2115be..12b716b70ead 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/errno.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>  #include <linux/hwmon.h>
> @@ -494,7 +495,7 @@ static u32 aspeed_get_fan_tach_ch_measure_period(struct aspeed_pwm_tacho_data
>  	return clk / (clk_unit * div_h * div_l * tacho_div * tacho_unit);
>  }
>  
> -static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
> +static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>  				      u8 fan_tach_ch)
>  {
>  	u32 raw_data, tach_div, clk_source, sec, val;
> @@ -510,6 +511,9 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>  	msleep(sec);
>  
>  	regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
> +	if (!(val & RESULT_STATUS_MASK))
> +		return -ETIMEDOUT;
> +
>  	raw_data = val & RESULT_VALUE_MASK;
>  	tach_div = priv->type_fan_tach_clock_division[type];
>  	tach_div = 0x4 << (tach_div * 2);
> @@ -561,12 +565,14 @@ static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
>  {
>  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>  	int index = sensor_attr->index;
> -	u32 rpm;
> +	int rpm;
>  	struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
>  
>  	rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
> +	if (rpm < 0)
> +		return rpm;
>  
> -	return sprintf(buf, "%u\n", rpm);
> +	return sprintf(buf, "%d\n", rpm);
>  }
>  
>  static umode_t pwm_is_visible(struct kobject *kobj,
