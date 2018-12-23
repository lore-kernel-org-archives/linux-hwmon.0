Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from confino.investici.org ([212.103.72.250]:45218 "EHLO
        confino.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbeLWW7s (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Dec 2018 17:59:48 -0500
Subject: Re: [PATCH v3.1] dell-smm-hwmon.c: Additional temperature sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20181222125021.kzwzupc4hj7y4vlc@pali>
 <20181222141835.20173-1-michelesr@autistici.org>
From: Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <e5ed861b-d341-b5ce-fd04-bbc16d6ff1ac@autistici.org>
Date: Sun, 23 Dec 2018 22:59:43 +0000
MIME-Version: 1.0
In-Reply-To: <20181222141835.20173-1-michelesr@autistici.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

I've just realized that is unusual to add a minor version for patches.

I thought that it could make sense to highlight that this is a minor
change, in fact I've just removed the executable bit that was wrongly
added in the previous patches.

Please let me know if it's a problem and want me to change the version
number to v4.

On 12/22/18 2:18 PM, Michele Sorcinelli wrote:
> The code has been extended to support up to 10 temperature sensors.
> 
> Changes from previous patch versions:
> 
> - fix wrong index ranges in i8k_is_visible() if conditions
> - restore i8k_get_temp_type() as probe method for temp sensors because
>    i8k_get_temp() is not reliable (for example it won't work when
>    sensors are turned off)
> - remove wrong executable bit in dell-smm-hwmon.c
> 
> Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
> Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 105 ++++++++++++++++++++++++++++-----
>   1 file changed, 90 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 367a8a617..73a30e3e4 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -82,9 +82,16 @@ static bool disallow_fan_support;
>   #define I8K_HWMON_HAVE_TEMP2	(1 << 1)
>   #define I8K_HWMON_HAVE_TEMP3	(1 << 2)
>   #define I8K_HWMON_HAVE_TEMP4	(1 << 3)
> -#define I8K_HWMON_HAVE_FAN1	(1 << 4)
> -#define I8K_HWMON_HAVE_FAN2	(1 << 5)
> -#define I8K_HWMON_HAVE_FAN3	(1 << 6)
> +#define I8K_HWMON_HAVE_TEMP5	(1 << 4)
> +#define I8K_HWMON_HAVE_TEMP6	(1 << 5)
> +#define I8K_HWMON_HAVE_TEMP7	(1 << 6)
> +#define I8K_HWMON_HAVE_TEMP8	(1 << 7)
> +#define I8K_HWMON_HAVE_TEMP9	(1 << 8)
> +#define I8K_HWMON_HAVE_TEMP10	(1 << 9)
> +
> +#define I8K_HWMON_HAVE_FAN1	(1 << 10)
> +#define I8K_HWMON_HAVE_FAN2	(1 << 11)
> +#define I8K_HWMON_HAVE_FAN3	(1 << 12)
> 
>   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>   MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
> @@ -743,6 +750,25 @@ static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>   static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 3);
>   static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
>   			  3);
> +static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 4);
> +static SENSOR_DEVICE_ATTR(temp5_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
> +			  4);
> +static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 5);
> +static SENSOR_DEVICE_ATTR(temp6_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
> +			  5);
> +static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 6);
> +static SENSOR_DEVICE_ATTR(temp7_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
> +			  6);
> +static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 7);
> +static SENSOR_DEVICE_ATTR(temp8_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
> +			  7);
> +static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 8);
> +static SENSOR_DEVICE_ATTR(temp9_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
> +			  8);
> +static SENSOR_DEVICE_ATTR(temp10_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 9);
> +static SENSOR_DEVICE_ATTR(temp10_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
> +			  9);
> +
>   static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, i8k_hwmon_show_fan, NULL, 0);
>   static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
>   			  0);
> @@ -770,15 +796,27 @@ static struct attribute *i8k_attrs[] = {
>   	&sensor_dev_attr_temp3_label.dev_attr.attr,	/* 5 */
>   	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 6 */
>   	&sensor_dev_attr_temp4_label.dev_attr.attr,	/* 7 */
> -	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 8 */
> -	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 9 */
> -	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 10 */
> -	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
> -	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
> -	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
> -	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
> -	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
> -	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
> +	&sensor_dev_attr_temp5_input.dev_attr.attr,	/* 8 */
> +	&sensor_dev_attr_temp5_label.dev_attr.attr,	/* 9 */
> +	&sensor_dev_attr_temp6_input.dev_attr.attr,	/* 10 */
> +	&sensor_dev_attr_temp6_label.dev_attr.attr,	/* 11 */
> +	&sensor_dev_attr_temp7_input.dev_attr.attr,	/* 12 */
> +	&sensor_dev_attr_temp7_label.dev_attr.attr,	/* 13 */
> +	&sensor_dev_attr_temp8_input.dev_attr.attr,	/* 14 */
> +	&sensor_dev_attr_temp8_label.dev_attr.attr,	/* 15 */
> +	&sensor_dev_attr_temp9_input.dev_attr.attr,	/* 16 */
> +	&sensor_dev_attr_temp9_label.dev_attr.attr,	/* 17 */
> +	&sensor_dev_attr_temp10_input.dev_attr.attr,	/* 18 */
> +	&sensor_dev_attr_temp10_label.dev_attr.attr,	/* 19 */
> +	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 20 */
> +	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 21 */
> +	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 22 */
> +	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 23 */
> +	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 24 */
> +	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 25 */
> +	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 26 */
> +	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 27 */
> +	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 28 */
>   	NULL
>   };
> 
> @@ -802,13 +840,32 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
>   	if (index >= 6 && index <= 7 &&
>   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
>   		return 0;
> -	if (index >= 8 && index <= 10 &&
> +	if (index >= 8 && index <= 9 &&
> +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
> +		return 0;
> +	if (index >= 10 && index <= 11 &&
> +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
> +		return 0;
> +	if (index >= 12 && index <= 13 &&
> +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
> +		return 0;
> +	if (index >= 14 && index <= 15 &&
> +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
> +		return 0;
> +	if (index >= 16 && index <= 17 &&
> +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
> +		return 0;
> +	if (index >= 18 && index <= 19 &&
> +	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
> +		return 0;
> +
> +	if (index >= 20 && index <= 22 &&
>   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
>   		return 0;
> -	if (index >= 11 && index <= 13 &&
> +	if (index >= 23 && index <= 25 &&
>   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
>   		return 0;
> -	if (index >= 14 && index <= 16 &&
> +	if (index >= 26 && index <= 28 &&
>   	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
>   		return 0;
> 
> @@ -841,6 +898,24 @@ static int __init i8k_init_hwmon(void)
>   	err = i8k_get_temp_type(3);
>   	if (err >= 0)
>   		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
> +	err = i8k_get_temp_type(4);
> +	if (err >= 0)
> +		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP5;
> +	err = i8k_get_temp_type(5);
> +	if (err >= 0)
> +		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP6;
> +	err = i8k_get_temp_type(6);
> +	if (err >= 0)
> +		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP7;
> +	err = i8k_get_temp_type(7);
> +	if (err >= 0)
> +		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP8;
> +	err = i8k_get_temp_type(8);
> +	if (err >= 0)
> +		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP9;
> +	err = i8k_get_temp_type(9);
> +	if (err >= 0)
> +		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP10;
> 
>   	/* First fan attributes, if fan status or type is OK */
>   	err = i8k_get_fan_status(0);
> --
> 2.20.1
> 
