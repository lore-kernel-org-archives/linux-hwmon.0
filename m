Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40577 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753804AbdHQRRH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Aug 2017 13:17:07 -0400
Date: Thu, 17 Aug 2017 10:17:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Eckert <fe@dev.tdt.de>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (adcxx) Add device tree support
Message-ID: <20170817171705.GB20072@roeck-us.net>
References: <20170817111705.24419-1-fe@dev.tdt.de>
 <20170817111705.24419-2-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170817111705.24419-2-fe@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 17, 2017 at 01:17:05PM +0200, Florian Eckert wrote:
> Allow the driver to work with device tree support.
> Set reference voltage of ADC with device tree property.
> If not set use default 3300mV.
> 
> - reference-voltage-millivolt
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  drivers/hwmon/adcxx.c | 57 +++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/adcxx.c b/drivers/hwmon/adcxx.c
> index 69e0bb97e597..34e241ea86a0 100644
> --- a/drivers/hwmon/adcxx.c
> +++ b/drivers/hwmon/adcxx.c
> @@ -4,6 +4,7 @@
>   * The adcxx4s is an AD converter family from National Semiconductor (NS).
>   *
>   * Copyright (c) 2008 Marc Pignat <marc.pignat@hevs.ch>
> + * Copyright (c) 2017 Florian Eckert <fe@dev.tdt.de>
>   *
>   * The adcxx4s communicates with a host processor via an SPI/Microwire Bus
>   * interface. This driver supports the whole family of devices with name
> @@ -46,9 +47,15 @@
>  #include <linux/mutex.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/spi/spi.h>
> +#include <linux/of_device.h>
>  
>  #define DRVNAME		"adcxx"
>  
> +#define ADCXX1S  1
> +#define ADCXX2S  2
> +#define ADCXX4S  4
> +#define ADCXX8S  8
> +
>  struct adcxx {
>  	struct device *hwmon_dev;
>  	struct mutex lock;
> @@ -159,21 +166,58 @@ static struct sensor_device_attribute ad_input[] = {
>  	SENSOR_ATTR(in7_input, S_IRUGO, adcxx_read, NULL, 7),
>  };
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id adcxx_of_ids[] = {
> +	{
> +		.compatible = "national,adcxx1s",
> +		.data = (void *) ADCXX1S,
> +	},
> +	{
> +		.compatible = "national,adcxx2s",
> +		.data = (void *) ADCXX2S,
> +	},
> +	{
> +		.compatible = "national,adcxx4s",
> +		.data = (void *) ADCXX4S,
> +	},
> +	{
> +		.compatible = "national,adcxx8s",
> +	.	data = (void *) ADCXX8S,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, adcxx_of_ids);
> +#endif
> +
>  /*----------------------------------------------------------------------*/
>  
>  static int adcxx_probe(struct spi_device *spi)
>  {
> -	int channels = spi_get_device_id(spi)->driver_data;
> +	const struct of_device_id *match;
> +	int channels;
>  	struct adcxx *adc;
>  	int status;
>  	int i;
>  
> +	match = of_match_device(adcxx_of_ids, &spi->dev);
> +	if (match)
> +		channels = (int)(uintptr_t)match->data;
> +	else
> +		channels = spi_get_device_id(spi)->driver_data;
> +
>  	adc = devm_kzalloc(&spi->dev, sizeof(*adc), GFP_KERNEL);
>  	if (!adc)
>  		return -ENOMEM;
>  
>  	/* set a default value for the reference */
> -	adc->reference = 3300;
> +	if (spi->dev.of_node)
> +		of_property_read_u32(spi->dev.of_node,
> +				"reference-voltage-millivolt",
> +				&adc->reference);

		struct regulator *reg;
		...
		reg = devm_regulator_get_optional(dev, "vref");
		if (!IS_ERR(reg)) {
			vref_uv = regulator_get_voltage(reg);
			adc->reference = DIV_ROUND_CLOSEST(vref_uv, 1000);
		}

> +	if (!adc->reference)
> +		adc->reference = 3300;
> +	dev_info(&spi->dev, "Reference voltage set to %dmV\n", adc->reference);
> +
I really dislike such noise. If you think you need it, please make it
dev_dbg().

>  	adc->channels = channels;
>  	mutex_init(&adc->lock);
>  
> @@ -223,10 +267,10 @@ static int adcxx_remove(struct spi_device *spi)
>  }
>  
>  static const struct spi_device_id adcxx_ids[] = {
> -	{ "adcxx1s", 1 },
> -	{ "adcxx2s", 2 },
> -	{ "adcxx4s", 4 },
> -	{ "adcxx8s", 8 },
> +	{ "adcxx1s", ADCXX1S },
> +	{ "adcxx2s", ADCXX2S },
> +	{ "adcxx4s", ADCXX4S },
> +	{ "adcxx8s", ADCXX8S },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, adcxx_ids);
> @@ -234,6 +278,7 @@ MODULE_DEVICE_TABLE(spi, adcxx_ids);
>  static struct spi_driver adcxx_driver = {
>  	.driver = {
>  		.name	= "adcxx",
> +		.of_match_table = of_match_ptr(adcxx_of_ids),
>  	},
>  	.id_table = adcxx_ids,
>  	.probe	= adcxx_probe,
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
