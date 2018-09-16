Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34845 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbeIPGEU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Sep 2018 02:04:20 -0400
Date: Sat, 15 Sep 2018 17:43:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: zhong jiang <zhongjiang@huawei.com>
Cc: kronos.it@gmail.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Use PTR_ERR_OR_ZERO instead of reimplementing its
 function
Message-ID: <20180916004318.GA30797@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 11, 2018 at 08:03:37PM +0800, zhong jiang wrote:
> PTR_ERR_OR_ZERO has implemented the same function. We prefer to use
> inlined function rather than code-opened implementation.
> 
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>

Applied to hwmon-next. For future patches, please also refer to the
affected driver in the Subject line, unless the change is in the
subsystem core code.

Thanks,
Guenter

> ---
>  drivers/hwmon/asus_atk0110.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index a6636fe..a7cf008 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -1210,10 +1210,8 @@ static int atk_register_hwmon(struct atk_data *data)
>  	data->hwmon_dev = hwmon_device_register_with_groups(dev, "atk0110",
>  							    data,
>  							    data->attr_groups);
> -	if (IS_ERR(data->hwmon_dev))
> -		return PTR_ERR(data->hwmon_dev);
>  
> -	return 0;
> +	return PTR_ERR_OR_ZERO(data->hwmon_dev);
>  }
>  
>  static int atk_probe_if(struct atk_data *data)
> -- 
> 1.7.12.4
> 
