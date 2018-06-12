Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:37298 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934164AbeFLNS6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Jun 2018 09:18:58 -0400
Subject: Re: [PATCH] hwmon: (w83792d) add error handling for i2c_new_dummy
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1528774289-38443-1-git-send-email-jiazhouyang09@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8cdd8a0b-00e9-7e47-d0e2-bb43bab8fcce@roeck-us.net>
Date: Tue, 12 Jun 2018 06:18:55 -0700
MIME-Version: 1.0
In-Reply-To: <1528774289-38443-1-git-send-email-jiazhouyang09@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/11/2018 08:31 PM, Zhouyang Jia wrote:
> When i2c_new_dummy fails, the lack of error-handling code may
> cause unexpected results.
> 

What are those unexpected results ? The i2c devicees are not really used;
the only reason to allocate them was for address reservation purposes.
This is why the result was ignored, since it does not really matter
for driver operation. I don't see the point of making that fatal.

NACK, sorry.

Guenter

> This patch adds error-handling code after calling i2c_new_dummy.
> 
> Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
> ---
>   drivers/hwmon/w83792d.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
> index 76aa39e..2c168c5 100644
> --- a/drivers/hwmon/w83792d.c
> +++ b/drivers/hwmon/w83792d.c
> @@ -961,8 +961,15 @@ w83792d_detect_subclients(struct i2c_client *new_client)
>   	}
>   
>   	val = w83792d_read_value(new_client, W83792D_REG_I2C_SUBADDR);
> -	if (!(val & 0x08))
> +	if (!(val & 0x08)) {
>   		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
> +		if (data->lm75[0] == NULL) {
> +			dev_err(&new_client->dev,
> +				"Failed to allocate I2C device\n");
> +			err = -ENODEV;
> +			goto ERROR_SC_1;
> +		}
> +	}
>   	if (!(val & 0x80)) {
>   		if ((data->lm75[0] != NULL) &&
>   			((val & 0x7) == ((val >> 4) & 0x7))) {
> @@ -974,6 +981,12 @@ w83792d_detect_subclients(struct i2c_client *new_client)
>   		}
>   		data->lm75[1] = i2c_new_dummy(adapter,
>   					      0x48 + ((val >> 4) & 0x7));
> +		if (data->lm75[1] == NULL) {
> +			dev_err(&new_client->dev,
> +				"Failed to allocate I2C device\n");
> +			err = -ENODEV;
> +			goto ERROR_SC_1;
> +		}
>   	}
>   
>   	return 0;
> 

