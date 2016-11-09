Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60340 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932167AbcKIOvJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Nov 2016 09:51:09 -0500
Subject: Re: [PATCH] hwmon: (scpi) Fix module autoload
To: Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-kernel@vger.kernel.org
References: <1478550704-20825-1-git-send-email-javier@osg.samsung.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <02bcafff-ccd3-57f4-4a70-6a79320bbb23@roeck-us.net>
Date: Wed, 9 Nov 2016 06:51:01 -0800
MIME-Version: 1.0
In-Reply-To: <1478550704-20825-1-git-send-email-javier@osg.samsung.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/07/2016 12:31 PM, Javier Martinez Canillas wrote:
> If the driver is built as a module, autoload won't work because the module
> alias information is not filled. So user-space can't match the registered
> device with the corresponding module.
>
> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
>
> Before this patch:
>
> $ modinfo drivers/hwmon/scpi-hwmon.ko | grep alias
> $
>
> After this patch:
>
> $ modinfo drivers/hwmon/scpi-hwmon.ko | grep alias
> alias:          of:N*T*Carm,scpi-sensorsC*
> alias:          of:N*T*Carm,scpi-sensors
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Applied.

Thanks,
Guenter

> ---
>
>  drivers/hwmon/scpi-hwmon.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
> index 559a3dcd64d8..094f948f99ff 100644
> --- a/drivers/hwmon/scpi-hwmon.c
> +++ b/drivers/hwmon/scpi-hwmon.c
> @@ -251,6 +251,7 @@ static const struct of_device_id scpi_of_match[] = {
>  	{.compatible = "arm,scpi-sensors"},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, scpi_of_match);
>
>  static struct platform_driver scpi_hwmon_platdrv = {
>  	.driver = {
>

