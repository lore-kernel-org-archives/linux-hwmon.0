Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:41763 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732604AbeGLB5V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Jul 2018 21:57:21 -0400
Received: by mail-pf0-f193.google.com with SMTP id c21-v6so14947702pfn.8
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Jul 2018 18:50:15 -0700 (PDT)
Subject: Re: [PATCH 3/5] hwmon: adt7475: Change to use adt7475_read macro
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Jean Delvare <jdelvare@suse.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
References: <20180712010450.10586-1-ikegami@allied-telesis.co.jp>
 <20180712010450.10586-4-ikegami@allied-telesis.co.jp>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8109bd46-9065-a5e7-9e52-975563cb0df8@roeck-us.net>
Date: Wed, 11 Jul 2018 18:50:12 -0700
MIME-Version: 1.0
In-Reply-To: <20180712010450.10586-4-ikegami@allied-telesis.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/11/2018 06:04 PM, Tokunori Ikegami wrote:
> It shoudl be same as with other functions to use adt7475_read.
> So change to use it instead of i2c_smbus_read_byte_data.
> 

I don't see a point in this change. Replacing a function name doesn't make
the code easier to read. If anything, you could consider dropping adt7475_read
and calling i2c_smbus_read_byte_data() directly.

Guenter

> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: linux-hwmon@vger.kernel.org
> ---
>   drivers/hwmon/adt7475.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index a40eb62ee6b1..bad250729e99 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -1012,7 +1012,7 @@ static ssize_t pwm_use_point2_pwm_at_crit_store(struct device *dev,
>   		return -EINVAL;
>   
>   	mutex_lock(&data->lock);
> -	data->config4 = i2c_smbus_read_byte_data(client, REG_CONFIG4);
> +	data->config4 = adt7475_read(REG_CONFIG4);
>   	if (val)
>   		data->config4 |= CONFIG4_MAXDUTY;
>   	else
> 

