Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33329 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751949AbdHOO4X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Aug 2017 10:56:23 -0400
Date: Tue, 15 Aug 2017 07:56:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jean Delvare <jdelvare@suse.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: aspeed: add THERMAL dependency
Message-ID: <20170815145621.GA18049@roeck-us.net>
References: <20170815144856.2059759-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170815144856.2059759-1-arnd@arndb.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 15, 2017 at 04:47:47PM +0200, Arnd Bergmann wrote:
> With CONFIG_THERMAL=m, a built-in aspeed pwm tacho driver causes
> a link error:
> 
> drivers/hwmon/aspeed-pwm-tacho.o: In function `aspeed_pwm_tacho_probe':
> aspeed-pwm-tacho.c:(.text+0x7f0): undefined reference to `thermal_of_cooling_device_register'
> 
> This adds a dependency similar to what other hwmon drivers use,
> ensuring that the aspeed driver cannot be built-in in this
> case but has to be a module. With THERMAL=n, we still allow building it.
> 
> Fixes: 2d7a548a3eff ("drivers: hwmon: Support for ASPEED PWM/Fan tach")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5ef2814345ef..5b9a61f766ac 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -343,6 +343,7 @@ config SENSORS_ASB100
>  
>  config SENSORS_ASPEED
>  	tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
> +	depends on THERMAL || THERMAL=n
>  	select REGMAP
>  	help
>  	  This driver provides support for ASPEED AST2400/AST2500 PWM
> -- 
> 2.9.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
