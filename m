Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40155 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbeLUOnK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Dec 2018 09:43:10 -0500
Subject: Re: [PATCH] hwmon: lm80: fix a missing check of return value
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20181221061304.59684-1-kjlu@umn.edu>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <21e64781-808b-be83-9d28-ec7daeedf197@roeck-us.net>
Date: Fri, 21 Dec 2018 06:43:07 -0800
MIME-Version: 1.0
In-Reply-To: <20181221061304.59684-1-kjlu@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/20/18 10:13 PM, Kangjie Lu wrote:
> If lm80_read_value() fails, it returns a negative number instead of the
> correct read data. Therefore, we should avoid using the data if it
> fails.
> 
> The fix checks if lm80_read_value() fails, and if so, returns with the
> error number.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
>   drivers/hwmon/lm80.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
> index 08e3945a6fbf..fca6363cd77f 100644
> --- a/drivers/hwmon/lm80.c
> +++ b/drivers/hwmon/lm80.c
> @@ -360,9 +360,11 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
>   	struct i2c_client *client = data->client;
>   	unsigned long min, val;
>   	u8 reg;
> -	int err = kstrtoul(buf, 10, &val);
> -	if (err < 0)
> -		return err;
> +	int ret;
> +

In the other patch you are using 'rv'. Please use consistent variable names.

Also, please use "hwmon: (lm80) <description>" as subject, and use different subjects
for both patches so we can distinguish them without looking into each patch itself.

This applies to the other patch as well.

Thanks,
Guenter

> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret < 0)
> +		return ret;
>   
>   	/* Save fan_min */
>   	mutex_lock(&data->update_lock);
> @@ -390,8 +392,11 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
>   		return -EINVAL;
>   	}
>   
> -	reg = (lm80_read_value(client, LM80_REG_FANDIV) &
> -	       ~(3 << (2 * (nr + 1)))) | (data->fan_div[nr] << (2 * (nr + 1)));
> +	ret = lm80_read_value(client, LM80_REG_FANDIV);
> +	if (ret < 0)
> +		return ret;
> +	reg = (ret & ~(3 << (2 * (nr + 1))))
> +	      | (data->fan_div[nr] << (2 * (nr + 1)));
>   	lm80_write_value(client, LM80_REG_FANDIV, reg);
>   
>   	/* Restore fan_min */
> 
