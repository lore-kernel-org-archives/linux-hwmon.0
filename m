Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56653 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbcLZKrN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Dec 2016 05:47:13 -0500
Subject: Re: [RFC PATCH v2 3/4] hwmon: adc128d818: Trivial code style fixup
To: Alexander Koch <mail@alexanderkoch.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20161223221205.8825-1-mail@alexanderkoch.net>
 <20161223221205.8825-4-mail@alexanderkoch.net>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <trivial@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <650d2371-57da-2494-7628-5a8bc5b756bf@roeck-us.net>
Date: Mon, 26 Dec 2016 02:47:08 -0800
MIME-Version: 1.0
In-Reply-To: <20161223221205.8825-4-mail@alexanderkoch.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/23/2016 02:12 PM, Alexander Koch wrote:
> Replace sysfs symbolic file permissions, e.g. 'S_IRUGO', by octal
> permissions. This fixes checkpatch.pl warnings.
>
> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>

Please do not bother with those warnings and ignore checkpatch.
We are in the process of doing an automated conversion.

Thanks,
Guenter

> ---
>  drivers/hwmon/adc128d818.c | 99 ++++++++++++++++++----------------------------
>  1 file changed, 39 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> index 8667f454ea11..cbb3bc5e5229 100644
> --- a/drivers/hwmon/adc128d818.c
> +++ b/drivers/hwmon/adc128d818.c
> @@ -242,69 +242,48 @@ static ssize_t adc128_show_alarm(struct device *dev,
>  	return sprintf(buf, "%u\n", !!(alarms & mask));
>  }
>
> -static SENSOR_DEVICE_ATTR_2(in0_input, S_IRUGO,
> -			    adc128_show_in, NULL, 0, 0);
> -static SENSOR_DEVICE_ATTR_2(in0_min, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 0, 1);
> -static SENSOR_DEVICE_ATTR_2(in0_max, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 0, 2);
> -
> -static SENSOR_DEVICE_ATTR_2(in1_input, S_IRUGO,
> -			    adc128_show_in, NULL, 1, 0);
> -static SENSOR_DEVICE_ATTR_2(in1_min, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 1, 1);
> -static SENSOR_DEVICE_ATTR_2(in1_max, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 1, 2);
> -
> -static SENSOR_DEVICE_ATTR_2(in2_input, S_IRUGO,
> -			    adc128_show_in, NULL, 2, 0);
> -static SENSOR_DEVICE_ATTR_2(in2_min, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 2, 1);
> -static SENSOR_DEVICE_ATTR_2(in2_max, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 2, 2);
> -
> -static SENSOR_DEVICE_ATTR_2(in3_input, S_IRUGO,
> -			    adc128_show_in, NULL, 3, 0);
> -static SENSOR_DEVICE_ATTR_2(in3_min, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 3, 1);
> -static SENSOR_DEVICE_ATTR_2(in3_max, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 3, 2);
> -
> -static SENSOR_DEVICE_ATTR_2(in4_input, S_IRUGO,
> -			    adc128_show_in, NULL, 4, 0);
> -static SENSOR_DEVICE_ATTR_2(in4_min, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 4, 1);
> -static SENSOR_DEVICE_ATTR_2(in4_max, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 4, 2);
> -
> -static SENSOR_DEVICE_ATTR_2(in5_input, S_IRUGO,
> -			    adc128_show_in, NULL, 5, 0);
> -static SENSOR_DEVICE_ATTR_2(in5_min, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 5, 1);
> -static SENSOR_DEVICE_ATTR_2(in5_max, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 5, 2);
> -
> -static SENSOR_DEVICE_ATTR_2(in6_input, S_IRUGO,
> -			    adc128_show_in, NULL, 6, 0);
> -static SENSOR_DEVICE_ATTR_2(in6_min, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 6, 1);
> -static SENSOR_DEVICE_ATTR_2(in6_max, S_IWUSR | S_IRUGO,
> -			    adc128_show_in, adc128_set_in, 6, 2);
> -
> -static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, adc128_show_temp, NULL, 0);
> -static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
> +static SENSOR_DEVICE_ATTR_2(in0_input, 0444, adc128_show_in, NULL, 0, 0);
> +static SENSOR_DEVICE_ATTR_2(in0_min, 0644, adc128_show_in, adc128_set_in, 0, 1);
> +static SENSOR_DEVICE_ATTR_2(in0_max, 0644, adc128_show_in, adc128_set_in, 0, 2);
> +
> +static SENSOR_DEVICE_ATTR_2(in1_input, 0444, adc128_show_in, NULL, 1, 0);
> +static SENSOR_DEVICE_ATTR_2(in1_min, 0644, adc128_show_in, adc128_set_in, 1, 1);
> +static SENSOR_DEVICE_ATTR_2(in1_max, 0644, adc128_show_in, adc128_set_in, 1, 2);
> +
> +static SENSOR_DEVICE_ATTR_2(in2_input, 0444, adc128_show_in, NULL, 2, 0);
> +static SENSOR_DEVICE_ATTR_2(in2_min, 0644, adc128_show_in, adc128_set_in, 2, 1);
> +static SENSOR_DEVICE_ATTR_2(in2_max, 0644, adc128_show_in, adc128_set_in, 2, 2);
> +
> +static SENSOR_DEVICE_ATTR_2(in3_input, 0444, adc128_show_in, NULL, 3, 0);
> +static SENSOR_DEVICE_ATTR_2(in3_min, 0644, adc128_show_in, adc128_set_in, 3, 1);
> +static SENSOR_DEVICE_ATTR_2(in3_max, 0644, adc128_show_in, adc128_set_in, 3, 2);
> +
> +static SENSOR_DEVICE_ATTR_2(in4_input, 0444, adc128_show_in, NULL, 4, 0);
> +static SENSOR_DEVICE_ATTR_2(in4_min, 0644, adc128_show_in, adc128_set_in, 4, 1);
> +static SENSOR_DEVICE_ATTR_2(in4_max, 0644, adc128_show_in, adc128_set_in, 4, 2);
> +
> +static SENSOR_DEVICE_ATTR_2(in5_input, 0444, adc128_show_in, NULL, 5, 0);
> +static SENSOR_DEVICE_ATTR_2(in5_min, 0644, adc128_show_in, adc128_set_in, 5, 1);
> +static SENSOR_DEVICE_ATTR_2(in5_max, 0644, adc128_show_in, adc128_set_in, 5, 2);
> +
> +static SENSOR_DEVICE_ATTR_2(in6_input, 0444, adc128_show_in, NULL, 6, 0);
> +static SENSOR_DEVICE_ATTR_2(in6_min, 0644, adc128_show_in, adc128_set_in, 6, 1);
> +static SENSOR_DEVICE_ATTR_2(in6_max, 0644, adc128_show_in, adc128_set_in, 6, 2);
> +
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, adc128_show_temp, NULL, 0);
> +static SENSOR_DEVICE_ATTR(temp1_max, 0644,
>  			  adc128_show_temp, adc128_set_temp, 1);
> -static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
> +static SENSOR_DEVICE_ATTR(temp1_max_hyst, 0644,
>  			  adc128_show_temp, adc128_set_temp, 2);
>
> -static SENSOR_DEVICE_ATTR(in0_alarm, S_IRUGO, adc128_show_alarm, NULL, 0);
> -static SENSOR_DEVICE_ATTR(in1_alarm, S_IRUGO, adc128_show_alarm, NULL, 1);
> -static SENSOR_DEVICE_ATTR(in2_alarm, S_IRUGO, adc128_show_alarm, NULL, 2);
> -static SENSOR_DEVICE_ATTR(in3_alarm, S_IRUGO, adc128_show_alarm, NULL, 3);
> -static SENSOR_DEVICE_ATTR(in4_alarm, S_IRUGO, adc128_show_alarm, NULL, 4);
> -static SENSOR_DEVICE_ATTR(in5_alarm, S_IRUGO, adc128_show_alarm, NULL, 5);
> -static SENSOR_DEVICE_ATTR(in6_alarm, S_IRUGO, adc128_show_alarm, NULL, 6);
> -static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, adc128_show_alarm, NULL, 7);
> +static SENSOR_DEVICE_ATTR(in0_alarm, 0444, adc128_show_alarm, NULL, 0);
> +static SENSOR_DEVICE_ATTR(in1_alarm, 0444, adc128_show_alarm, NULL, 1);
> +static SENSOR_DEVICE_ATTR(in2_alarm, 0444, adc128_show_alarm, NULL, 2);
> +static SENSOR_DEVICE_ATTR(in3_alarm, 0444, adc128_show_alarm, NULL, 3);
> +static SENSOR_DEVICE_ATTR(in4_alarm, 0444, adc128_show_alarm, NULL, 4);
> +static SENSOR_DEVICE_ATTR(in5_alarm, 0444, adc128_show_alarm, NULL, 5);
> +static SENSOR_DEVICE_ATTR(in6_alarm, 0444, adc128_show_alarm, NULL, 6);
> +static SENSOR_DEVICE_ATTR(temp1_max_alarm, 0444, adc128_show_alarm, NULL, 7);
>
>  static struct attribute *adc128_attrs[] = {
>  	&sensor_dev_attr_in0_min.dev_attr.attr,
>

