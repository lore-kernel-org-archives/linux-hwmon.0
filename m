Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50562 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751171AbcLSAYl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Dec 2016 19:24:41 -0500
Subject: Re: [Patch] hwmon (sht15) enabled device tree
To: Peter Fox <foxpeter@kabelbw.de>, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com
References: <f71c5c8b-5d2e-eae6-f8ec-748fa9fc74d0@kabelbw.de>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <26d22d7e-625d-b8ec-9647-e5b21464a87a@roeck-us.net>
Date: Sun, 18 Dec 2016 16:24:38 -0800
MIME-Version: 1.0
In-Reply-To: <f71c5c8b-5d2e-eae6-f8ec-748fa9fc74d0@kabelbw.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/18/2016 03:05 PM, Peter Fox wrote:
> From: Peter Fox <FoxPeter@kabelbw.de>
>
>
> Attached is a patch which allows the sht15 module to read its configuration from
>
> a device tree in addition to any platform data
>
>
Why so many empty lines ?

Please drop _all_ whitespace changes, ie every change not directly related
to the subject and description.

Devicetree properties will need to be documented in a separate patch and
will have to be approved by a devicetree maintainer.

More comments inline.

> Signed-off-by: Peter Fox <FoxPeter@kabelbw.de>
>
> ---
>
>
> --- linux/drivers/hwmon/sht15.c.orig    2016-12-18 23:23:43.431045129 +0100
> +++ linux/drivers/hwmon/sht15.c    2016-12-18 23:40:27.924278262 +0100
> @@ -1,6 +1,8 @@
>  /*
>   * sht15.c - support for the SHT15 Temperature and Humidity Sensor
>   *
> + * Device tree ready (c) 2016 Peter Fox
> + *
>   * Portions Copyright (c) 2010-2012 Savoir-faire Linux Inc.
>   *          Jerome Oufella <jerome.oufella@savoirfairelinux.com>
>   *          Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> @@ -26,6 +28,9 @@
>  #include <linux/mutex.h>
>  #include <linux/platform_data/sht15.h>
>  #include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_gpio.h>

Why is this include needed ?

>  #include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
> @@ -758,8 +763,7 @@ static ssize_t sht15_show_temp(struct de
>   * Returns number of bytes written into buffer, negative errno on error.
>   */
>  static ssize_t sht15_show_humidity(struct device *dev,
> -                   struct device_attribute *attr,
> -                   char *buf)
> +                   struct device_attribute *attr, char *buf)
>  {
>      int ret;
>      struct sht15_data *data = dev_get_drvdata(dev);
> @@ -770,17 +774,15 @@ static ssize_t sht15_show_humidity(struc
>  }
>
>  static ssize_t show_name(struct device *dev,
> -             struct device_attribute *attr,
> -             char *buf)
> +    struct device_attribute *attr, char *buf)
>  {
>      struct platform_device *pdev = to_platform_device(dev);
>      return sprintf(buf, "%s\n", pdev->name);
>  }
>
> -static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
> -              sht15_show_temp, NULL, 0);
> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, sht15_show_temp, NULL, 0);
>  static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO,
> -              sht15_show_humidity, NULL, 0);
> +    sht15_show_humidity, NULL, 0);
>  static SENSOR_DEVICE_ATTR(temp1_fault, S_IRUGO, sht15_show_status, NULL,
>                SHT15_STATUS_LOW_BATTERY);
>  static SENSOR_DEVICE_ATTR(humidity1_fault, S_IRUGO, sht15_show_status, NULL,
> @@ -821,8 +823,7 @@ static void sht15_bh_read_data(struct wo
>      u8 dev_checksum = 0;
>      u8 checksum_vals[3];
>      struct sht15_data *data
> -        = container_of(work_s, struct sht15_data,
> -                   read_work);
> +        = container_of(work_s, struct sht15_data, read_work);
>
>      /* Firstly, verify the line is low */
>      if (gpio_get_value(data->pdata->gpio_data)) {
> @@ -884,8 +885,7 @@ wakeup:
>  static void sht15_update_voltage(struct work_struct *work_s)
>  {
>      struct sht15_data *data
> -        = container_of(work_s, struct sht15_data,
> -                   update_supply_work);
> +        = container_of(work_s, struct sht15_data, update_supply_work);
>      data->supply_uv = regulator_get_voltage(data->reg);
>  }
>
> @@ -911,6 +911,50 @@ static int sht15_invalidate_voltage(stru
>      return NOTIFY_OK;
>  }
>
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id sht15_of_match[] = {
> +    { .compatible = "sht10" },
> +    { .compatible = "sht11" },
> +    { .compatible = "sht15" },
> +    { .compatible = "sht71" },
> +    { .compatible = "sht75" },
> +    { },
> +};
> +MODULE_DEVICE_TABLE(of, sht15_of_match);
> +
> +static struct sht15_platform_data *sht15_parse_dt(struct device *dev)
> +{
> +    const struct of_device_id *of_id = of_match_device(sht15_of_match, dev);

This is quite unnecessary; you don't do anything with it. The framework will
already do a match.

> +    struct device_node *np = dev->of_node;
> +    struct sht15_platform_data *pdata;
> +
> +    if (!of_id || !np)
> +        return NULL;
> +
> +    pdata = kzalloc(sizeof(struct sht15_platform_data), GFP_KERNEL);
> +    if (!pdata)
> +        return ERR_PTR(-ENOMEM);
> +
> +    of_property_read_u32(np, "data", &pdata->gpio_data);
> +    of_property_read_u32(np, "clock", &pdata->gpio_sck);
> +    of_property_read_u32(np, "supply_mv", &pdata->supply_mv);
> +    pdata->checksum =    of_property_read_bool(np, "checksum");
> +    pdata->no_otp_reload =    of_property_read_bool(np, "no_otp_reload");
> +    pdata->low_resolution =    of_property_read_bool(np, "low_resolution");

I don't think those property names are acceptable. Property names usually don't have
underscores.

> +
> +    return pdata;
> +}
> +
> +#else
> +
> +static inline struct sht15_platform_data *sht15_parse_dt(struct device *dev)
> +{
> +    return NULL;
> +}
> +
> +#endif
> +
>  static int sht15_probe(struct platform_device *pdev)
>  {
>      int ret;
> @@ -928,11 +972,18 @@ static int sht15_probe(struct platform_d
>      data->dev = &pdev->dev;
>      init_waitqueue_head(&data->wait_queue);
>
> -    if (dev_get_platdata(&pdev->dev) == NULL) {
> -        dev_err(&pdev->dev, "no platform data supplied\n");
> -        return -EINVAL;
> -    }
>      data->pdata = dev_get_platdata(&pdev->dev);
> +    if (!data->pdata) {
> +        data->pdata = sht15_parse_dt(&pdev->dev);
> +        if (IS_ERR(data->pdata))
> +            return PTR_ERR(data->pdata);

This is overly complex and misleading. Returning NULL if there is no devicetree
entry but -ENOMEM on memory failure is inconsistent.

> +
> +        if (!data->pdata) {
> +            dev_err(&pdev->dev, "no platform data supplied\n");
> +            return -EINVAL;
> +        }
> +    }
> +
>      data->supply_uv = data->pdata->supply_mv * 1000;
>      if (data->pdata->checksum)
>          data->checksumming = true;
> @@ -967,8 +1018,7 @@ static int sht15_probe(struct platform_d
>          data->nb.notifier_call = &sht15_invalidate_voltage;
>          ret = regulator_register_notifier(data->reg, &data->nb);
>          if (ret) {
> -            dev_err(&pdev->dev,
> -                "regulator notifier request failed\n");
> +            dev_err(&pdev->dev, "regulator notifier request failed\n");
>              regulator_disable(data->reg);
>              return ret;
>          }
> @@ -1062,6 +1112,7 @@ static int sht15_remove(struct platform_
>      return 0;
>  }
>
> +
>  static const struct platform_device_id sht15_device_ids[] = {
>      { "sht10", sht10 },
>      { "sht11", sht11 },
> @@ -1072,15 +1123,20 @@ static const struct platform_device_id s
>  };
>  MODULE_DEVICE_TABLE(platform, sht15_device_ids);
>
> +
>  static struct platform_driver sht15_driver = {
> -    .driver = {
> -        .name = "sht15",
> -    },
>      .probe = sht15_probe,
>      .remove = sht15_remove,
>      .id_table = sht15_device_ids,
> +    .driver = {
> +        .name = "sht15",
> +        .of_match_table = of_match_ptr(sht15_of_match),
> +    },
>  };
>  module_platform_driver(sht15_driver);
>
> -MODULE_LICENSE("GPL");
> +
> +MODULE_ALIAS("platform:sht15");

Unrelated.

> +MODULE_AUTHOR("Wouter Horre, Jonathan Cameron, Jerome Oufella, Vivien Didelot, Peter Fox");

Please drop that.

>  MODULE_DESCRIPTION("Sensirion SHT15 temperature and humidity sensor driver");
> +MODULE_LICENSE("GPL");
>
>
>

