Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32843 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbeJCEj7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 Oct 2018 00:39:59 -0400
Date: Tue, 2 Oct 2018 14:54:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jean Delvare <jdelvare@suse.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: ina3221: mark PM functions as __maybe_unused
Message-ID: <20181002215429.GA10027@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 02, 2018 at 11:10:47PM +0200, Arnd Bergmann wrote:
> When CONFIG_PM_SLEEP is disabled, we get a warning about unused
> suspend/resume functions:
> 
> drivers/hwmon/ina3221.c:451:12: error: 'ina3221_resume' defined but not used [-Werror=unused-function]
>  static int ina3221_resume(struct device *dev)
> drivers/hwmon/ina3221.c:428:12: error: 'ina3221_suspend' defined but not used [-Werror=unused-function]
>  static int ina3221_suspend(struct device *dev)
> 
> Picking the correct #ifdef check is hard, so let's remove
> that check and instead mark the functions as __maybe_unused
> to let the compiler silently drop them instead.
> 
> Fixes: 7de1ab9dac8e ("hwmon: (ina3221) Add suspend and resume functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina3221.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 1e38b4c43fbf..8c3352910cc4 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -424,8 +424,7 @@ static int ina3221_probe(struct i2c_client *client,
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM
> -static int ina3221_suspend(struct device *dev)
> +static int __maybe_unused ina3221_suspend(struct device *dev)
>  {
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
>  	int ret;
> @@ -448,7 +447,7 @@ static int ina3221_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int ina3221_resume(struct device *dev)
> +static int __maybe_unused ina3221_resume(struct device *dev)
>  {
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
>  	int ret;
> @@ -474,7 +473,6 @@ static int ina3221_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops ina3221_pm = {
>  	SET_SYSTEM_SLEEP_PM_OPS(ina3221_suspend, ina3221_resume)
> -- 
> 2.18.0
> 
