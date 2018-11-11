Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34023 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbeKLCXE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Nov 2018 21:23:04 -0500
Date: Sun, 11 Nov 2018 08:34:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: rpi: Fix initial notify
Message-ID: <20181111163402.GA17038@roeck-us.net>
References: <1541937671-26385-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1541937671-26385-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Nov 11, 2018 at 01:01:11PM +0100, Stefan Wahren wrote:
> In case an under-voltage happens before probing the driver wont
> write the critical warning into the kernel log. So don't init
> of last_throttled during probe and fix this issue.
> 
> Fixes: 74d1e007915f ("hwmon: Add support for RPi voltage sensor")
> Reported-by: "Noralf Trønnes" <noralf@tronnes.org>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/raspberrypi-hwmon.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
> index be5ba46..0d04572 100644
> --- a/drivers/hwmon/raspberrypi-hwmon.c
> +++ b/drivers/hwmon/raspberrypi-hwmon.c
> @@ -115,7 +115,6 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct rpi_hwmon_data *data;
> -	int ret;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -124,11 +123,6 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
>  	/* Parent driver assure that firmware is correct */
>  	data->fw = dev_get_drvdata(dev->parent);
>  
> -	/* Init throttled */
> -	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_THROTTLED,
> -				    &data->last_throttled,
> -				    sizeof(data->last_throttled));
> -
>  	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
>  							       data,
>  							       &rpi_chip_info,
> -- 
> 2.7.4
> 
