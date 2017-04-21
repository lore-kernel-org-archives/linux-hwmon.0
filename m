Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33761 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424997AbdDUTas (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2017 15:30:48 -0400
Date: Fri, 21 Apr 2017 12:30:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joe Schaack <jschaack@xes-inc.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, asierra@xes-inc.com
Subject: Re: hwmon: ina209: Handled signed registers
Message-ID: <20170421193045.GA22051@roeck-us.net>
References: <1492517750-20701-1-git-send-email-jschaack@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492517750-20701-1-git-send-email-jschaack@xes-inc.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Apr 18, 2017 at 07:15:50AM -0500, Joe Schaack wrote:
> The shunt voltage and current registers are signed 16-bit values so
> handle them as such.
> 
> Signed-off-by: Joe Schaack <jschaack@xes-inc.com>
> Reviewed-by: Aaron Sierra <asierra@xes-inc.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina209.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
> index 5378fde..9fa975d 100644
> --- a/drivers/hwmon/ina209.c
> +++ b/drivers/hwmon/ina209.c
> @@ -117,7 +117,7 @@ static long ina209_from_reg(const u8 reg, const u16 val)
>  	case INA209_SHUNT_VOLTAGE_POS_WARN:
>  	case INA209_SHUNT_VOLTAGE_NEG_WARN:
>  		/* LSB=10 uV. Convert to mV. */
> -		return DIV_ROUND_CLOSEST(val, 100);
> +		return DIV_ROUND_CLOSEST((s16)val, 100);
>  
>  	case INA209_BUS_VOLTAGE:
>  	case INA209_BUS_VOLTAGE_MAX_PEAK:
> @@ -146,7 +146,7 @@ static long ina209_from_reg(const u8 reg, const u16 val)
>  
>  	case INA209_CURRENT:
>  		/* LSB=1 mA (selected). Is in mA */
> -		return val;
> +		return (s16)val;
>  	}
>  
>  	/* programmer goofed */
