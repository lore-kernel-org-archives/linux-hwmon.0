Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:44643 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932914AbeFLNVf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Jun 2018 09:21:35 -0400
Subject: Re: [PATCH] hwmon: (w83791d) add error handling for i2c_new_dummy
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1528774504-38755-1-git-send-email-jiazhouyang09@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <902c09d8-57a3-442c-2e87-489be5727769@roeck-us.net>
Date: Tue, 12 Jun 2018 06:21:33 -0700
MIME-Version: 1.0
In-Reply-To: <1528774504-38755-1-git-send-email-jiazhouyang09@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/11/2018 08:35 PM, Zhouyang Jia wrote:
> When i2c_new_dummy fails, the lack of error-handling code may
> cause unexpected results.
> 
> This patch adds error-handling code after calling i2c_new_dummy.
> 
> Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>

As before, NACK, sorry.

Guenter

> ---
>   drivers/hwmon/w83791d.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
> index 28fa3bd..a183432 100644
> --- a/drivers/hwmon/w83791d.c
> +++ b/drivers/hwmon/w83791d.c
> @@ -1295,8 +1295,15 @@ static int w83791d_detect_subclients(struct i2c_client *client)
>   	}
>   
>   	val = w83791d_read(client, W83791D_REG_I2C_SUBADDR);
> -	if (!(val & 0x08))
> +	if (!(val & 0x08)) {
>   		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
> +		if (data->lm75[0] == NULL) {
> +			dev_err(&client->dev,
> +				"Failed to allocate I2C device\n");
> +			err = -ENODEV;
> +			goto error_sc_1;
> +		}
> +	}
>   	if (!(val & 0x80)) {
>   		if ((data->lm75[0] != NULL) &&
>   				((val & 0x7) == ((val >> 4) & 0x7))) {
> @@ -1309,6 +1316,12 @@ static int w83791d_detect_subclients(struct i2c_client *client)
>   		}
>   		data->lm75[1] = i2c_new_dummy(adapter,
>   					      0x48 + ((val >> 4) & 0x7));
> +		if (data->lm75[1] == NULL) {
> +			dev_err(&client->dev,
> +				"Failed to allocate I2C device\n");
> +			err = -ENODEV;
> +			goto error_sc_1;
> +		}
>   	}
>   
>   	return 0;
> 

