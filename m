Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36965 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbdE1Oz4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 May 2017 10:55:56 -0400
Subject: Re: [PATCH v2] hwmon: (aspeed-pwm-tacho) On read failure return
 -ETIMEDOUT
To: Patrick Venture <venture@google.com>
Cc: Joel Stanley <joel@jms.id.au>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
References: <CAO=notwYZ2Zsa7VeuOMxbR6mY+3kkJBDxoJf9T17BhBAJ+TQZA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4ca20009-54e6-b92b-b012-66ab03d80792@roeck-us.net>
Date: Sun, 28 May 2017 07:55:54 -0700
MIME-Version: 1.0
In-Reply-To: <CAO=notwYZ2Zsa7VeuOMxbR6mY+3kkJBDxoJf9T17BhBAJ+TQZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/27/2017 07:10 PM, Patrick Venture wrote:
> When the controller fails to provide an RPM reading within the alloted
> time; the driver returns -ETIMEDOUT and no file contents.
> 
> Signed-off-by: Patrick Venture <venture@google.com <mailto:venture@google.com>>
> ---
>   drivers/hwmon/aspeed-pwm-tacho.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 48403a2115be..12b716b70ead 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -7,6 +7,7 @@
>    */
>   #include <linux/clk.h>
> +#include <linux/errno.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/delay.h>
>   #include <linux/hwmon.h>
> @@ -494,7 +495,7 @@ static u32 aspeed_get_fan_tach_ch_measure_period(struct aspeed_pwm_tacho_data
> return clk / (clk_unit * div_h * div_l * tacho_div * tacho_unit);
>   }
> -static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
> +static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>       u8 fan_tach_ch)
>   {
> u32 raw_data, tach_div, clk_source, sec, val;
> @@ -510,6 +511,9 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
> msleep(sec);
> regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
> +if (!(val & RESULT_STATUS_MASK))
> +return -ETIMEDOUT;
> +
> 
>  > We don't know why the value reported is 0. Maybe it is because no fan is connected. We can not just return -EAGAIN; this might result in a tight loop if the problem is permanent. A retry loop which returns -ETIMEOUT after some reasonable timeout might be more appropriate if the controller just needs more time, and if reading "0" is an indication that the controller is not ready.
> 
> I've run experiments where it returns 0 when the controller timed out reading a fan.  But it does make more sense to use -ETIMEDOUT.
> 
> I'm also adding a check to see if the result status bit was not set -- versus the value being zero -- there is a semantic difference.
> 

That looks good. Can you send it as proper patch ?

Thanks,
Guenter

> raw_data = val & RESULT_VALUE_MASK;
> tach_div = priv->type_fan_tach_clock_division[type];
> tach_div = 0x4 << (tach_div * 2);
> @@ -561,12 +565,14 @@ static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
>   {
> struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> int index = sensor_attr->index;
> -u32 rpm;
> +int rpm;
> struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
> rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
> +if (rpm < 0)
> +return rpm;
> -return sprintf(buf, "%u\n", rpm);
> +return sprintf(buf, "%d\n", rpm);
>   }
>   static umode_t pwm_is_visible(struct kobject *kobj,
> -- 
> 2.13.0.219.gdb65acc882-goog
> 
> 
> 
> 
> On Fri, May 26, 2017 at 10:54 PM, Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 05/26/2017 07:48 AM, Patrick Venture wrote:
> 
>         When the controller fails to provide an RPM reading within the allotted
>         time; the driver returns -EAGAIN instead of 0.
> 
>         Signed-off-by: Patrick Venture <venture@google.com <mailto:venture@google.com> <mailto:venture@google.com <mailto:venture@google.com>>>
>         ---
>            drivers/hwmon/aspeed-pwm-tacho.c | 5 +++--
>            1 file changed, 3 insertions(+), 2 deletions(-)
> 
>         diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
>         index 48403a2115be..ec57be4a4a55 100644
>         --- a/drivers/hwmon/aspeed-pwm-tacho.c
>         +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>         @@ -7,6 +7,7 @@
>             */
>            #include <linux/clk.h>
>         +#include <linux/errno.h>
>            #include <linux/gpio/consumer.h>
>            #include <linux/delay.h>
>            #include <linux/hwmon.h>
>         @@ -516,7 +517,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>         clk_source = priv->clk_freq;
>         if (raw_data == 0)
>         -return 0;
>         +return -EAGAIN;
> 
> 
>     We don't know why the value reported is 0. Maybe it is because no fan is connected.
>     We can not just return -EAGAIN; this might result in a tight loop if the problem is
>     permanent. A retry loop which returns -ETIMEOUT after some reasonable timeout
>     might be more appropriate if the controller just needs more time, and if reading "0"
>     is an indication that the controller is not ready.
> 
>     Note that you can not just return an error without changing the function type to int.
> 
>         return (clk_source * 60) / (2 * raw_data * tach_div);
>            }
>         @@ -566,7 +567,7 @@ static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
>         rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
>         -return sprintf(buf, "%u\n", rpm);
>         +return sprintf(buf, "%d\n", rpm);
> 
> 
>     rpm is u32. This is incorrect. This would also return a negative speed to the user,
>     not an error. To return an error, the variable would have to be an int, and the
>     code would have to be something like
> 
>              int rpm;
>              ...
>              rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
>              if (rpm < 0)
>                      return rpm;
> 
>              return sprintf(...);
> 
>     Guenter
> 
> 
>            }
>            static umode_t pwm_is_visible(struct kobject *kobj,
>         -- 
>         2.13.0.219.gdb65acc882-goog
> 
> 
> 

