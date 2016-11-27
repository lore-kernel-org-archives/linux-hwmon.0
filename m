Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43992 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753800AbcK0MVu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2016 07:21:50 -0500
Subject: Re: [PATCH 2/3] hwmon: tmp108: Use devm variants of registration
 interfaces.
To: John Muir <john@jmuir.com>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <1480223737-82080-3-git-send-email-john@jmuir.com>
Cc: John Muir <muirj@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <db19e338-2e36-f387-f57f-74899622e4cf@roeck-us.net>
Date: Sun, 27 Nov 2016 04:21:48 -0800
MIME-Version: 1.0
In-Reply-To: <1480223737-82080-3-git-send-email-john@jmuir.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/26/2016 09:15 PM, John Muir wrote:
> From: John Muir <muirj@google.com>
>
> Use the devm hwmon and thermal zone registration functions to
> clean up the code and remove the need for an i2c_driver.remove
> callback.
>
> Signed-off-by: John Muir <john@jmuir.com>
> ---
>  drivers/hwmon/tmp108.c | 28 ++++++++--------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index da64517..b13d652 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -83,8 +83,6 @@
>
>  struct tmp108 {
>  	struct regmap *regmap;
> -	struct device *hwmon_dev;
> -	struct thermal_zone_device *tz;
>  	u16 config;
>  	unsigned long ready_time;
>  };
> @@ -245,6 +243,7 @@ static int tmp108_probe(struct i2c_client *client,
>  {
>  	struct device *dev = &client->dev;
>  	struct device *hwmon_dev;
> +	struct thermal_zone_device *tz;
>  	struct tmp108 *tmp108;
>  	unsigned int regval;
>  	int err;
> @@ -353,18 +352,18 @@ static int tmp108_probe(struct i2c_client *client,
>  	if (err)
>  		return err;
>
> -	hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
> -						      tmp108, tmp108_groups);
> +	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
> +							   tmp108,
> +							   tmp108_groups);
>  	if (IS_ERR(hwmon_dev)) {
>  		dev_dbg(dev, "unable to register hwmon device\n");
>  		return PTR_ERR(hwmon_dev);
>  	}
>
> -	tmp108->hwmon_dev = hwmon_dev;
> -	tmp108->tz = thermal_zone_of_sensor_register(hwmon_dev, 0, hwmon_dev,
> -						     &tmp108_of_thermal_ops);
> -	if (IS_ERR(tmp108->tz))
> -		return PTR_ERR(tmp108->tz);
> +	tz = devm_thermal_zone_of_sensor_register(hwmon_dev, 0, hwmon_dev,
> +						  &tmp108_of_thermal_ops);
> +	if (IS_ERR(tz))
> +		return PTR_ERR(tz);
>
>  	dev_info(dev, "%s, alert: active %s, hyst: %uC, conv: %ucHz\n",
>  		 (tmp108->config & TMP108_CONF_TM) != 0 ?
> @@ -374,16 +373,6 @@ static int tmp108_probe(struct i2c_client *client,
>  	return 0;
>  }
>
> -static int tmp108_remove(struct i2c_client *client)
> -{
> -	struct tmp108 *tmp108 = i2c_get_clientdata(client);
> -
With this, i2c_set_clientdata() in the probe function is no longer needed.

> -	thermal_zone_of_sensor_unregister(tmp108->hwmon_dev, tmp108->tz);
> -	hwmon_device_unregister(tmp108->hwmon_dev);
> -
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int tmp108_suspend(struct device *dev)
>  {
> @@ -418,7 +407,6 @@ static struct i2c_driver tmp108_driver = {
>  	.driver.name	= DRIVER_NAME,
>  	.driver.pm	= &tmp108_dev_pm_ops,
>  	.probe		= tmp108_probe,
> -	.remove		= tmp108_remove,
>  	.id_table	= tmp108_id,
>  };
>
>

