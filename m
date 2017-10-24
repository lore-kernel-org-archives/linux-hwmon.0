Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:55406 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933092AbdJXNdp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2017 09:33:45 -0400
Subject: Re: [PATCH] hwmon: (max6621) Inverted if condition in max6621_read()
To: Dan Carpenter <dan.carpenter@oracle.com>,
        Jean Delvare <jdelvare@suse.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20171024094742.qpltjxlvzr25muje@mwanda>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d81a49d2-ddb5-917e-2ca3-b38e32a0ffe3@roeck-us.net>
Date: Tue, 24 Oct 2017 06:33:43 -0700
MIME-Version: 1.0
In-Reply-To: <20171024094742.qpltjxlvzr25muje@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/24/2017 02:47 AM, Dan Carpenter wrote:
> We intended to test for failure here but accidentally tested for
> success.  It means that we don't set "*val" to true and it means that
> if i2c_smbus_write_byte() does fail then we return success.
> 
> Fixes: e7895864b0d7 ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to hwmon-next.

Thanks,
Guenter

> 
> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> index 22079ec29660..35555f0eefb9 100644
> --- a/drivers/hwmon/max6621.c
> +++ b/drivers/hwmon/max6621.c
> @@ -296,7 +296,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   			if (regval) {
>   				ret = i2c_smbus_write_byte(data->client,
>   						MAX6621_CLEAR_ALERT_REG);
> -				if (!ret)
> +				if (ret)
>   					return ret;
>   			}
>   
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

