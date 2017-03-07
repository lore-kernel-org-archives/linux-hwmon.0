Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50341 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754078AbdCHAGm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Mar 2017 19:06:42 -0500
Date: Tue, 7 Mar 2017 14:19:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Hemme <ahemme@cisco.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max31790) Set correct PWM value
Message-ID: <20170307221920.GA14619@roeck-us.net>
References: <1488915509-19547-1-git-send-email-ahemme@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488915509-19547-1-git-send-email-ahemme@cisco.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Mar 07, 2017 at 02:38:29PM -0500, Alex Hemme wrote:
> Traced fans not spinning to incorrect PWM value being written.
> The passed in value was written instead of the calulated value.
> 
> Fixes: 54187ff9d766 ("hwmon: (max31790) Convert to use new hwmon registration API")
> 
> Signed-off-by: Alex Hemme <ahemme@cisco.com>

Applied, and sorry for the trouble.

Thanks,
Guenter

> ---
>  drivers/hwmon/max31790.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index c1b9275..281491c 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -311,7 +311,7 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
>  		data->pwm[channel] = val << 8;
>  		err = i2c_smbus_write_word_swapped(client,
>  						   MAX31790_REG_PWMOUT(channel),
> -						   val);
> +						   data->pwm[channel]);
>  		break;
>  	case hwmon_pwm_enable:
>  		fan_config = data->fan_config[channel];
> --
> 1.8.3.1
> 
