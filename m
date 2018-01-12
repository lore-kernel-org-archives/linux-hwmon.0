Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:44372 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964773AbeALRTL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Jan 2018 12:19:11 -0500
Date: Fri, 12 Jan 2018 09:19:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jean Delvare <jdelvare@suse.com>,
        Samuel Mendoza-Jonas <sam@mendozajonas.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        "Edward A. James" <eajames@us.ibm.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: pmbus: ibm-cffps depends on LEDS_CLASS
Message-ID: <20180112171909.GA12748@roeck-us.net>
References: <20180112154926.3646202-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112154926.3646202-1-arnd@arndb.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jan 12, 2018 at 04:49:00PM +0100, Arnd Bergmann wrote:
> Building without CONFIG_LEDS_CLASS causes a link failure:
> 
> drivers/hwmon/pmbus/ibm-cffps.o: In function `ibm_cffps_probe':
> ibm-cffps.c:(.text+0x4f4): undefined reference to `devm_of_led_classdev_register'
> 
> This adds the required dependency.
> 
> Fixes: f69316d62c70 ("hwmon: (pmbus) Add IBM Common Form Factor (CFF) power supply driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I wanted to let Edward decide if he wants the new dependency or conditional code
in the driver. Not having heard from him, I'll take your patch instead for now.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 08479006c7f9..6e4298e99222 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -39,6 +39,7 @@ config SENSORS_ADM1275
>  
>  config SENSORS_IBM_CFFPS
>  	tristate "IBM Common Form Factor Power Supply"
> +	depends on LEDS_CLASS
>  	help
>  	  If you say yes here you get hardware monitoring support for the IBM
>  	  Common Form Factor power supply.
> -- 
> 2.9.0
> 
