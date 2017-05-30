Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:35738 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750767AbdE3GUe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 May 2017 02:20:34 -0400
Received: by mail-yw0-f195.google.com with SMTP id p144so5461340ywp.2
        for <linux-hwmon@vger.kernel.org>; Mon, 29 May 2017 23:20:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAO=notzccp+A1HU1Krk0z+0tTecbcHw_bZVhnCm9Z_4b1zCpDA@mail.gmail.com>
References: <CAO=notzccp+A1HU1Krk0z+0tTecbcHw_bZVhnCm9Z_4b1zCpDA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 May 2017 15:50:13 +0930
Message-ID: <CACPK8XeCSjFmN8=a3M_L5EB0Vfr5s1cu1qHOog5c=JbNag-p=A@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (aspeed-pwm-tacho) On read failure return -ETIMEDOUT
To: Patrick Venture <venture@google.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, May 29, 2017 at 1:35 AM, Patrick Venture <venture@google.com> wrote:
> When the controller fails to provide an RPM reading within the alloted
> time; the driver returns -ETIMEDOUT and no file contents.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
> b/drivers/hwmon/aspeed-pwm-tacho.c
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
> @@ -494,7 +495,7 @@ static u32 aspeed_get_fan_tach_ch_measure_period(struct
> aspeed_pwm_tacho_data
>   return clk / (clk_unit * div_h * div_l * tacho_div * tacho_unit);
>  }
>
> -static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
> +static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>        u8 fan_tach_ch)
>  {
>   u32 raw_data, tach_div, clk_source, sec, val;
> @@ -510,6 +511,9 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct
> aspeed_pwm_tacho_data *priv,
>   msleep(sec);
>
>   regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
> + if (!(val & RESULT_STATUS_MASK))

This is an unfortunate named define; I didn't realise it was an aspeed
driver specific thing from a glance.

Other than that your changes look okay to me.

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel


> + return -ETIMEDOUT;
> +
>   raw_data = val & RESULT_VALUE_MASK;
>   tach_div = priv->type_fan_tach_clock_division[type];
>   tach_div = 0x4 << (tach_div * 2);
> @@ -561,12 +565,14 @@ static ssize_t show_rpm(struct device *dev, struct
> device_attribute *attr,
>  {
>   struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>   int index = sensor_attr->index;
> - u32 rpm;
> + int rpm;
>   struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
>
>   rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
> + if (rpm < 0)
> + return rpm;
>
> - return sprintf(buf, "%u\n", rpm);
> + return sprintf(buf, "%d\n", rpm);
>  }
>
>  static umode_t pwm_is_visible(struct kobject *kobj,
>
