Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49403 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754811AbcIMO27 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Sep 2016 10:28:59 -0400
Subject: Re: [PATCH] hwmon: (lm95245) Select REGMAP_I2C
To: Axel Lin <axel.lin@ingics.com>
References: <1473751319-5027-1-git-send-email-axel.lin@ingics.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <31cd488e-2c4a-d63f-8cdb-c3dc78577504@roeck-us.net>
Date: Tue, 13 Sep 2016 07:28:52 -0700
MIME-Version: 1.0
In-Reply-To: <1473751319-5027-1-git-send-email-axel.lin@ingics.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/13/2016 12:21 AM, Axel Lin wrote:
> This driver now uses regmap APIs, so it needs to select REGMAP_I2C.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Applied to -next.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 6c82ee2..45cef3d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1118,6 +1118,7 @@ config SENSORS_LM95241
>  config SENSORS_LM95245
>  	tristate "National Semiconductor LM95245 and compatibles"
>  	depends on I2C
> +	select REGMAP_I2C
>  	help
>  	  If you say yes here you get support for LM95235 and LM95245
>  	  temperature sensor chips.
>

