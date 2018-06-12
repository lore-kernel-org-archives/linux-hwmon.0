Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:45586 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932914AbeFLNVH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Jun 2018 09:21:07 -0400
Subject: Re: [PATCH] hwmon: (w83793) add error handling for i2c_new_dummy
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: Rudolf Marek <r.marek@assembler.cz>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1528774379-38587-1-git-send-email-jiazhouyang09@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9e38be5c-29d3-b4ec-bc95-e0d0efd49a5d@roeck-us.net>
Date: Tue, 12 Jun 2018 06:21:05 -0700
MIME-Version: 1.0
In-Reply-To: <1528774379-38587-1-git-send-email-jiazhouyang09@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/11/2018 08:32 PM, Zhouyang Jia wrote:
> When i2c_new_dummy fails, the lack of error-handling code may
> cause unexpected results.
> 

There are no unexpected results.

> This patch adds error-handling code after calling i2c_new_dummy.
> 

Making a non-fatal error fatal doesn't serve a useful purpose.

NACK

Guenter

> Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
> ---
>   drivers/hwmon/w83793.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> index 0af0f62..4aa3a0e 100644
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -1603,8 +1603,15 @@ w83793_detect_subclients(struct i2c_client *client)
>   	}
>   
>   	tmp = w83793_read_value(client, W83793_REG_I2C_SUBADDR);
> -	if (!(tmp & 0x08))
> +	if (!(tmp & 0x08)) {
>   		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (tmp & 0x7));
> +		if (data->lm75[0] == NULL) {
> +			dev_err(&client->dev,
> +				"Failed to allocate I2C device\n");
> +			err = -ENODEV;
> +			goto ERROR_SC_1;
> +		}
> +	}
>   	if (!(tmp & 0x80)) {
>   		if ((data->lm75[0] != NULL)
>   		    && ((tmp & 0x7) == ((tmp >> 4) & 0x7))) {
> @@ -1616,6 +1623,12 @@ w83793_detect_subclients(struct i2c_client *client)
>   		}
>   		data->lm75[1] = i2c_new_dummy(adapter,
>   					      0x48 + ((tmp >> 4) & 0x7));
> +		if (data->lm75[1] == NULL) {
> +			dev_err(&client->dev,
> +				"Failed to allocate I2C device\n");
> +			err = -ENODEV;
> +			goto ERROR_SC_1;
> +		}
>   	}
>   
>   	return 0;
> 

