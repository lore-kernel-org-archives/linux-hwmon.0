Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34763 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725759AbeKODQ1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Nov 2018 22:16:27 -0500
Date: Wed, 14 Nov 2018 09:12:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina2xx) Fix current value calculation
Message-ID: <20181114171222.GA25157@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Nov 13, 2018 at 07:48:54PM -0800, Nicolin Chen wrote:
> The current register (04h) has a sign bit at MSB. The comments
> for this calculation also mention that it's a signed register.
> 
> However, the regval is unsigned type so result of calculation
> turns out to be an incorrect value when current is negative.
> 
> This patch simply fixes this by adding a casting to s16.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina2xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index c2252cf452f5..07ee19573b3f 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -274,7 +274,7 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
>  		break;
>  	case INA2XX_CURRENT:
>  		/* signed register, result in mA */
> -		val = regval * data->current_lsb_uA;
> +		val = (s16)regval * data->current_lsb_uA;
>  		val = DIV_ROUND_CLOSEST(val, 1000);
>  		break;
>  	case INA2XX_CALIBRATION:
> -- 
> 2.17.1
> 
