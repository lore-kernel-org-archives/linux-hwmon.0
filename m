Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53278 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1045774AbdDWPny (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Apr 2017 11:43:54 -0400
Subject: Re: [PATCH] hwmon: tmp103: use SIMPLE_DEV_PM_OPS helper macro
To: Rahul Bedarkar <rahulbedarkar89@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
References: <1492956651-15321-1-git-send-email-rahulbedarkar89@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Heiko Schocher <hs@denx.de>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6e36d265-294b-d700-3896-9f1a6d656a08@roeck-us.net>
Date: Sun, 23 Apr 2017 08:43:51 -0700
MIME-Version: 1.0
In-Reply-To: <1492956651-15321-1-git-send-email-rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Rahul,

On 04/23/2017 07:10 AM, Rahul Bedarkar wrote:
> Replace ifdefs with SIMPLE_DEV_PM_OPS helper macro.
>
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Thanks a lot for your patch.

While I in general prefer code that avoids #ifdef, I have seen patches
which do the opposite when handling PM code. It appears that it is
unsettled if __maybe_unused or #ifdef should be used in such situations.
Until that is the case, I won't accept patches changing one into another
unless they are from the driver author or Acked by the driver author.

Thanks,
Guenter

> ---
>  drivers/hwmon/tmp103.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
> index d0bb28b..7f85b14 100644
> --- a/drivers/hwmon/tmp103.c
> +++ b/drivers/hwmon/tmp103.c
> @@ -150,8 +150,7 @@ static int tmp103_probe(struct i2c_client *client,
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>
> -#ifdef CONFIG_PM
> -static int tmp103_suspend(struct device *dev)
> +static int __maybe_unused tmp103_suspend(struct device *dev)
>  {
>  	struct regmap *regmap = dev_get_drvdata(dev);
>
> @@ -159,7 +158,7 @@ static int tmp103_suspend(struct device *dev)
>  				  TMP103_CONF_SD_MASK, 0);
>  }
>
> -static int tmp103_resume(struct device *dev)
> +static int __maybe_unused tmp103_resume(struct device *dev)
>  {
>  	struct regmap *regmap = dev_get_drvdata(dev);
>
> @@ -167,15 +166,7 @@ static int tmp103_resume(struct device *dev)
>  				  TMP103_CONF_SD_MASK, TMP103_CONF_SD);
>  }
>
> -static const struct dev_pm_ops tmp103_dev_pm_ops = {
> -	.suspend	= tmp103_suspend,
> -	.resume		= tmp103_resume,
> -};
> -
> -#define TMP103_DEV_PM_OPS (&tmp103_dev_pm_ops)
> -#else
> -#define	TMP103_DEV_PM_OPS NULL
> -#endif /* CONFIG_PM */
> +static SIMPLE_DEV_PM_OPS(tmp103_dev_pm_ops, tmp103_suspend, tmp103_resume);
>
>  static const struct i2c_device_id tmp103_id[] = {
>  	{ "tmp103", 0 },
> @@ -193,7 +184,7 @@ static struct i2c_driver tmp103_driver = {
>  	.driver = {
>  		.name	= "tmp103",
>  		.of_match_table = of_match_ptr(tmp103_of_match),
> -		.pm	= TMP103_DEV_PM_OPS,
> +		.pm	= &tmp103_dev_pm_ops,
>  	},
>  	.probe		= tmp103_probe,
>  	.id_table	= tmp103_id,
>

