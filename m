Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42150 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751950AbdBMVFl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Feb 2017 16:05:41 -0500
Date: Mon, 13 Feb 2017 13:05:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marco Franchi <marco.franchi@nxp.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, marcofrk@gmail.com,
        FoxPeter@kabelbw.de
Subject: Re: [PATCH 2/2] hwmon: (sht15) Add DTS support
Message-ID: <20170213210538.GA11362@roeck-us.net>
References: <1486737041-32014-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486737041-32014-1-git-send-email-marco.franchi@nxp.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Feb 10, 2017 at 12:30:41PM -0200, Marco Franchi wrote:
> Allow the driver to work with dts support.
> 
> Based on initial patch submission from Peter Fox.
> 
> Tested on a imx7d-sdb board connected to a SHT15 board via Mikro Bus.
> 
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
> ---
>  Documentation/devicetree/bindings/hwmon/sht15.txt | 25 ++++++++
>  drivers/hwmon/sht15.c                             | 69 +++++++++++++++++++++--
>  2 files changed, 90 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sht15.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sht15.txt b/Documentation/devicetree/bindings/hwmon/sht15.txt
> new file mode 100644
> index 0000000..6415f52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sht15.txt
> @@ -0,0 +1,25 @@
> +Sensirion SHT15 Humidity and Temperature Sensor
> +
> +Required properties:
> +
> + - "compatible": must be "sensirion,sht15".
> + - "data-gpios": GPIO connected to the data line.
> + - "clk-gpios": GPIO connected to the clock line.
> + - "vcc-supply": regulator that drives the VCC pin.
> +
> +Optional properties:
> +
> + - "checksum": boolean property that when present enables the CRC validation of the readings.
> + - "no-otp-reload": boolean property that when present indicates not to reload from OTP.
> + - "low-resolution": boolean property that when present indicates that the device operates in
> + 		low-resolution mode.
> +Example:
> +
> +	temp_humid_sensor: sht15 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sensor>;
> +		compatible = "sensirion,sht15";
> +		clk-gpios = <&gpio4 12 0>;
> +		data-gpios = <&gpio4 13 0>;
> +		vcc-supply = <&reg_sht15>;
> +	};
> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index f16687c..608ac9e 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -34,6 +34,7 @@
>  #include <linux/slab.h>
>  #include <linux/atomic.h>
>  #include <linux/bitrev.h>
> +#include <linux/of_gpio.h>
>  
>  /* Commands */
>  #define SHT15_MEASURE_TEMP		0x03
> @@ -911,6 +912,59 @@ static int sht15_invalidate_voltage(struct notifier_block *nb,
>  	return NOTIFY_OK;
>  }
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id sht15_dt_match[] = {
> +	{ .compatible = "sensirion,sht15" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sht15_dt_match);
> +
> +/*
> + * This function returns 1 if pdev isn't a device instatiated by dt, 0 if it
> + * could successfully get all information from dt or a negative error number.
> + */

Plese rework to not require negative/ 0 / 1 return. One possibility
would be to return NULL if no dt, PTR_ERR on error, and a pointer
to the data otherwise. More see below.

> +static int sht15_probe_dt(struct sht15_data *data, struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct sht15_platform_data *pdata;
> +
> +	/* no device tree device */
> +	if (!np)
> +		return 1;
> +
> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	data->pdata = pdata;
> +
> +	data->pdata->gpio_data = of_get_named_gpio(np, "data-gpios", 0);

There is a local variable 'pdata'. Dereferencing data->pdata repeatedly
is not necessary.

> +	if (data->pdata->gpio_data < 0) {
> +		dev_err(&pdev->dev, "data-gpios not found\n");
> +		return data->pdata->gpio_data;
> +	}
> +
> +	data->pdata->gpio_sck = of_get_named_gpio(np, "clk-gpios", 0);
> +	if (data->pdata->gpio_sck < 0) {
> +		dev_err(&pdev->dev, "clk-gpios not found\n");
> +		return data->pdata->gpio_sck;
> +	}
> +
> +	data->pdata->checksum = of_property_read_bool(np, "checksum");
> +	data->pdata->no_otp_reload = of_property_read_bool(np, "no-otp-reload");
> +	data->pdata->low_resolution = of_property_read_bool(np,
> +					"low-resolution");
> +
> +	return 0;
> +}
> +#else
> +static inline int sht15_probe_dt(struct sht15_data *data,
> +					struct platform_device *pdev)
> +{
> +	return 1;
> +}
> +#endif
> +
>  static int sht15_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -928,11 +982,17 @@ static int sht15_probe(struct platform_device *pdev)
>  	data->dev = &pdev->dev;
>  	init_waitqueue_head(&data->wait_queue);
>  
> -	if (dev_get_platdata(&pdev->dev) == NULL) {
> -		dev_err(&pdev->dev, "no platform data supplied\n");
> -		return -EINVAL;
> +	ret = sht15_probe_dt(data, pdev);

I would rather see a clear preference for dt or platform data.
Also, passing 'data' to sht15_probe_dt() is really unnecessary,
and sht15_probe_dt() doesn't really need a pointer to the
platform device.

Example, if DT is preferred:
	data->pdata = sht15_probe_dt(&pdev->dev);
	if (IS_ERR(data->pdata))
		return PTR_ERR(data->pdata);
	if (data->pdata == NULL) {
		data->pdata = dev_get_platdata(&pdev->dev);
		if (data->pdata == NULL) {
			dev_err(&pdev->dev, "no platform data supplied\n");
			return -EINVAL;
		}
	}

Guenter
