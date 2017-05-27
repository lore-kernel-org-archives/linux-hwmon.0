Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58617 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750724AbdE0Fyy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 May 2017 01:54:54 -0400
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) On read failure return -EAGAIN
To: Patrick Venture <venture@google.com>,
        Joel Stanley <joel@jms.id.au>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
References: <CAO=notz8jvazWfN47GNAEO-crvnbEAwVGPXRumZHxhS-0hPfgg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bdc84318-434a-f40f-0d84-d4e261baea38@roeck-us.net>
Date: Fri, 26 May 2017 22:54:52 -0700
MIME-Version: 1.0
In-Reply-To: <CAO=notz8jvazWfN47GNAEO-crvnbEAwVGPXRumZHxhS-0hPfgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/26/2017 07:48 AM, Patrick Venture wrote:
> When the controller fails to provide an RPM reading within the allotted
> time; the driver returns -EAGAIN instead of 0.
> 
> Signed-off-by: Patrick Venture <venture@google.com <mailto:venture@google.com>>
> ---
>   drivers/hwmon/aspeed-pwm-tacho.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 48403a2115be..ec57be4a4a55 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -7,6 +7,7 @@
>    */
>   #include <linux/clk.h>
> +#include <linux/errno.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/delay.h>
>   #include <linux/hwmon.h>
> @@ -516,7 +517,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
> clk_source = priv->clk_freq;
> if (raw_data == 0)
> -return 0;
> +return -EAGAIN;

We don't know why the value reported is 0. Maybe it is because no fan is connected.
We can not just return -EAGAIN; this might result in a tight loop if the problem is
permanent. A retry loop which returns -ETIMEOUT after some reasonable timeout
might be more appropriate if the controller just needs more time, and if reading "0"
is an indication that the controller is not ready.

Note that you can not just return an error without changing the function type to int.

> return (clk_source * 60) / (2 * raw_data * tach_div);
>   }
> @@ -566,7 +567,7 @@ static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
> rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
> -return sprintf(buf, "%u\n", rpm);
> +return sprintf(buf, "%d\n", rpm);

rpm is u32. This is incorrect. This would also return a negative speed to the user,
not an error. To return an error, the variable would have to be an int, and the
code would have to be something like

	int rpm;
	...
	rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
	if (rpm < 0)
		return rpm;

	return sprintf(...);

Guenter

>   }
>   static umode_t pwm_is_visible(struct kobject *kobj,
> -- 
> 2.13.0.219.gdb65acc882-goog

