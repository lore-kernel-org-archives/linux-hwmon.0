Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35472 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753232AbeAQWvk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Jan 2018 17:51:40 -0500
Date: Wed, 17 Jan 2018 14:51:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Luis de Bethencourt <luisbg@kernel.org>
Cc: linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm75) Fix trailing semicolon
Message-ID: <20180117225137.GA25052@roeck-us.net>
References: <20180117182448.16204-1-luisbg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180117182448.16204-1-luisbg@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jan 17, 2018 at 06:24:48PM +0000, Luis de Bethencourt wrote:
> The trailing semicolon is an empty statement that does no operation.
> Removing it since it doesn't do anything.
> 
> Signed-off-by: Luis de Bethencourt <luisbg@kernel.org>

Applied.

Thanks,
Guenter

> ---
> 
> Hi,
> 
> After fixing the same thing in drivers/staging/rtl8723bs/, Joe Perches
> suggested I fix it treewide [0].
> 
> Best regards 
> Luis
> 
> 
> [0] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115410.html
> [1] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115390.html
> 
>  drivers/hwmon/lm75.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 005ffb5ffa92..49f4b33a5685 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -100,7 +100,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>  		switch (attr) {
>  		case hwmon_chip_update_interval:
>  			*val = data->sample_time;
> -			break;;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> -- 
> 2.15.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
