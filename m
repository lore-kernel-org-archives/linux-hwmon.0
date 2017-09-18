Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36630 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753118AbdIROv2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2017 10:51:28 -0400
Date: Mon, 18 Sep 2017 07:51:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin King <colin.king@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (sht15): remove redundant check on status and
 send of status value
Message-ID: <20170918145126.GD11868@roeck-us.net>
References: <20170918144548.32354-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170918144548.32354-1-colin.king@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 18, 2017 at 03:45:48PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A previous commit removed bit or'ing into to the integer status
> so now status is now always zero. This means that the non-zero check on
> status and the sht15_send_status call will never occur; it is deadcode.
> Clean this up by removing the dead code.
> 
> Detected by: CoverityScan CID#1456835 ("Logically dead code")
> 
> Fixes: aa7ab80c578c ("hwmon: (sht15) Root out platform data")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/sht15.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index 0e3e5f83f5cf..25d28343ba93 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -925,7 +925,6 @@ static int sht15_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  	struct sht15_data *data;
> -	u8 status = 0;
>  
>  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -1002,13 +1001,6 @@ static int sht15_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_release_reg;
>  
> -	/* write status with platform data options */
> -	if (status) {
> -		ret = sht15_send_status(data, status);
> -		if (ret)
> -			goto err_release_reg;
> -	}
> -
>  	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
>  	if (ret) {
>  		dev_err(&pdev->dev, "sysfs create failed\n");
> -- 
> 2.14.1
> 
