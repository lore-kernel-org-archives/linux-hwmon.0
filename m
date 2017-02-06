Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52481 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751873AbdBFDK4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Feb 2017 22:10:56 -0500
Subject: Re: [RFC 2/2] hwmon: lm90: add thermal_zone temperature sensor
 support
To: Christian Lamparter <chunkeey@googlemail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <e2c150ce1312a524ea0a524f3d476f910333ae82.1486327509.git.chunkeey@googlemail.com>
 <0e28c2989f021bedaff3c8958ab8c1ef738182b7.1486327509.git.chunkeey@googlemail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Wei Ni <wni@nvidia.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <edca1928-6909-f353-3524-30546d715ed3@roeck-us.net>
Date: Sun, 5 Feb 2017 19:10:53 -0800
MIME-Version: 1.0
In-Reply-To: <0e28c2989f021bedaff3c8958ab8c1ef738182b7.1486327509.git.chunkeey@googlemail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/05/2017 01:03 PM, Christian Lamparter wrote:
> This patch adds thermal_zone temperature sensor support
> to the lm90 module. The feature has to be enabled
> separately via the Kconfig option:
> 	CONFIG_SENSORS_LM90_THERMAL_DEVICE
>
> The LM90 supports two (three for MAX6695 and MAX6696)
> temperature sensors. The local sensor is integrated
> into the LM90 chip. The remote sensors are connected
> to external temperature sensing diodes.
>
> Cc: Wei Ni <wni@nvidia.com>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Since the hwnmon core now supports thermal registration, and since the lm90
driver has already been converted to using the new hwmon API, I would
rather like to understand why using the hwmon core for this purpose is
insufficient, and I would prefer to address the deficiencies in the hwmon
core and not in the driver.

Thanks,
Guenter

> ---
> ---
>  drivers/hwmon/Kconfig | 11 +++++++
>  drivers/hwmon/lm90.c  | 91 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 102 insertions(+)
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 190d270b20a2..9df70ad21a21 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1085,6 +1085,17 @@ config SENSORS_LM90
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called lm90.
>
> +config SENSORS_LM90_THERMAL_DEVICE
> +	bool "Support for thermal-zone temperature sensors"
> +	depends on SENSORS_LM90 && THERMAL_OF
> +	help
> +	  If you say yes here you get support for thermal-zone temperature
> +	  sensors for the lm90 module and all supported chips.
> +
> +	  Refer to Documentation/devicetree/bindings/thermal/thermal.txt
> +	  and Documentation/devicetree/bindings/hwmon/lm90.txt on how to
> +	  use it for your platform.
> +
>  config SENSORS_LM92
>  	tristate "National Semiconductor LM92 and compatibles"
>  	depends on I2C
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 841f2428e84a..584550c7336d 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -95,6 +95,9 @@
>  #include <linux/sysfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/of.h>
> +#include <linux/thermal.h>
> +#include <dt-bindings/thermal/lm90.h>
>
>  /*
>   * Addresses to scan
> @@ -1643,6 +1646,90 @@ static const struct hwmon_ops lm90_ops = {
>  	.write = lm90_write,
>  };
>
> +#ifdef CONFIG_SENSORS_LM90_THERMAL_DEVICE
> +
> +static int lm90_read_local_temp(void *data, int *temp)
> +{
> +	*temp = lm90_get_temp11(data, LOCAL_TEMP);
> +	return 0;
> +}
> +
> +static int lm90_read_remote_temp(void *data, int *temp)
> +{
> +	*temp = lm90_get_temp11(data, REMOTE_TEMP);
> +	return 0;
> +}
> +
> +static int lm90_read_remote2_temp(void *data, int *temp)
> +{
> +	*temp = lm90_get_temp11(data, REMOTE2_TEMP);
> +	return 0;
> +}
> +
> +static const struct thermal_zone_of_device_ops local_temp_sensor = {
> +	.get_temp = lm90_read_local_temp,
> +};
> +
> +static const struct thermal_zone_of_device_ops remote_temp_sensor = {
> +	.get_temp = lm90_read_remote_temp,
> +};
> +
> +static const struct thermal_zone_of_device_ops remote2_temp_sensor = {
> +	.get_temp = lm90_read_remote2_temp,
> +};
> +
> +static const struct thermal_zone_sensors_struct {
> +	int sensor_id;
> +	const char *name;
> +	const struct thermal_zone_of_device_ops *ops;
> +	u32 flag_mask;
> +	u32 flag_required;
> +} thermal_zone_sensors[] = {
> +	{ LM90_REMOTE_TEMPERATURE, "remote", &remote_temp_sensor },
> +	{ LM90_LOCAL_TEMPERATURE, "local", &local_temp_sensor },
> +	{ LM90_REMOTE2_TEMPERATURE, "second remote", &remote2_temp_sensor,
> +	  LM90_HAVE_TEMP3, LM90_HAVE_TEMP3 },
> +};
> +
> +static int lm90_setup_thermal_device(struct device *dev,
> +				     struct lm90_data *data)
> +{
> +	const struct thermal_zone_sensors_struct *entry;
> +	struct thermal_zone_device *therm_dev;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(thermal_zone_sensors); i++) {
> +		entry = &thermal_zone_sensors[i];
> +
> +		if ((data->flags & entry->flag_mask) != entry->flag_required)
> +			continue;
> +
> +		therm_dev = devm_thermal_zone_of_sensor_register(dev,
> +			entry->sensor_id, data, entry->ops);
> +
> +		/*
> +		 * if a sensor device isn't requested in a thermal-zone the
> +		 * call to devm_thermal_zone_of_sensor_register will fail
> +		 * with -ENODEV. In this case we can ignore/skip it.
> +		 */
> +
> +		if (IS_ERR(therm_dev) && (PTR_ERR(therm_dev) != -ENODEV)) {
> +			dev_err(dev, "Failed to register %s thermal_zone sensor device\n",
> +				entry->name);
> +			return PTR_ERR(therm_dev);
> +		}
> +	}
> +	return 0;
> +}
> +#else
> +static int lm90_setup_thermal_device(struct device __maybe_unused *dev,
> +				     struct lm90_data __maybe_unused *data)
> +{
> +	return 0;
> +}
> +#endif
> +
> +
>  static int lm90_probe(struct i2c_client *client,
>  		      const struct i2c_device_id *id)
>  {
> @@ -1765,6 +1852,10 @@ static int lm90_probe(struct i2c_client *client,
>  	if (IS_ERR(hwmon_dev))
>  		return PTR_ERR(hwmon_dev);
>
> +	err = lm90_setup_thermal_device(dev, data);
> +	if (err)
> +		return err;
> +
>  	if (client->irq) {
>  		dev_dbg(dev, "IRQ: %d\n", client->irq);
>  		err = devm_request_threaded_irq(dev, client->irq,
>

