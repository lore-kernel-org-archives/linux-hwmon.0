Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44482 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752935AbdGHP5e (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Jul 2017 11:57:34 -0400
Date: Sat, 8 Jul 2017 08:57:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: hwmon: adt7475: constify attribute_group structures.
Message-ID: <20170708155731.GA13516@roeck-us.net>
References: <6f75a80453097e5f05f26782b42ab48f0da8e502.1499232764.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f75a80453097e5f05f26782b42ab48f0da8e502.1499232764.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 05, 2017 at 11:04:04AM +0530, Arvind Yadav wrote:
> attribute_groups are not supposed to change at runtime. All functions
> working with attribute_groups provided by <linux/sysfs.h> work with const
> attribute_group. So mark the non-const structs as const.
> 
> File size before:
>    text	   data	    bss	    dec	    hex	filename
>   10055	   7032	      0	  17087	   42bf	drivers/hwmon/adt7475.o
> 
> File size After adding 'const':
>    text	   data	    bss	    dec	    hex	filename
>   10567	   6520	      0	  17087	   42bf	drivers/hwmon/adt7475.o
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/adt7475.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index c803e3c..973f17a 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -1205,14 +1205,14 @@ static SENSOR_DEVICE_ATTR_2(pwm3_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
>  	NULL
>  };
>  
> -static struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
> -static struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
> -static struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
> -static struct attribute_group in0_attr_group = { .attrs = in0_attrs };
> -static struct attribute_group in3_attr_group = { .attrs = in3_attrs };
> -static struct attribute_group in4_attr_group = { .attrs = in4_attrs };
> -static struct attribute_group in5_attr_group = { .attrs = in5_attrs };
> -static struct attribute_group vid_attr_group = { .attrs = vid_attrs };
> +static const struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
> +static const struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
> +static const struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
> +static const struct attribute_group in0_attr_group = { .attrs = in0_attrs };
> +static const struct attribute_group in3_attr_group = { .attrs = in3_attrs };
> +static const struct attribute_group in4_attr_group = { .attrs = in4_attrs };
> +static const struct attribute_group in5_attr_group = { .attrs = in5_attrs };
> +static const struct attribute_group vid_attr_group = { .attrs = vid_attrs };
>  
>  static int adt7475_detect(struct i2c_client *client,
>  			  struct i2c_board_info *info)
