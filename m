Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36849 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753195AbcGTN3a (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 20 Jul 2016 09:29:30 -0400
Subject: Re: [PATCH] hwmon: ftsteutates: add watchdog dependency
To: Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.com>
References: <20160720103809.2643157-1-arnd@arndb.de>
Cc: Thilo Cestonaro <thilo@cestona.ro>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <578F7CB5.80803@roeck-us.net>
Date: Wed, 20 Jul 2016 06:29:25 -0700
MIME-Version: 1.0
In-Reply-To: <20160720103809.2643157-1-arnd@arndb.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/20/2016 03:37 AM, Arnd Bergmann wrote:
> The newly added fts "Teutates" hwmon chip contains a watchdog but fails
> to link when the watchdog subsystem is disabled:
>
> drivers/hwmon/built-in.o: In function `fts_remove':
> :(.text+0x161d8): undefined reference to `watchdog_unregister_device'
> drivers/hwmon/built-in.o: In function `fts_probe':
> :(.text+0x16cb4): undefined reference to `watchdog_register_device'
>
> This adds a Kconfig dependency in the same way that the other
> similar drivers have.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: ec9268ba1a96 ("hwmon: Add driver for FTS BMC chip "Teutates"")

Thanks - folded into original patch.

Guenter

> ---
>   drivers/hwmon/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 15479eb15fa2..eaf2f916d48c 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -488,7 +488,8 @@ config SENSORS_FSCHMD
>
>   config SENSORS_FTSTEUTATES
>   	tristate "Fujitsu Technology Solutions sensor chip Teutates"
> -	depends on I2C
> +	depends on I2C && WATCHDOG
> +	select WATCHDOG_CORE
>   	help
>   	  If you say yes here you get support for the Fujitsu Technology
>   	  Solutions (FTS) sensor chip "Teutates" including support for
>

