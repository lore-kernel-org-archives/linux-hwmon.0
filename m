Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57505 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbeFZQae (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jun 2018 12:30:34 -0400
Date: Tue, 26 Jun 2018 09:30:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gabriel Matni <gabriel.matni@exfo.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>
Subject: Re: [PATCH] hwmon: driver for sfp/sfp+ integrated sensors
Message-ID: <20180626163031.GA13826@roeck-us.net>
References: <3B588D51285A4A4D8D39C94212E078262A4503@SPQCMBX02.exfo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3B588D51285A4A4D8D39C94212E078262A4503@SPQCMBX02.exfo.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jun 26, 2018 at 01:34:34PM +0000, Gabriel Matni wrote:
> From: Gabriel Matni <gabriel.matni@exfo.com>
> 
> This driver supports the Small Form Factor Pluggable (SFP) Transceivers
> that implement the Digital Diagnostic Monitoring Interface (DDMI) as
> defined in SFF-8472. It currently supports temperature monitoring.
> 
Code only review; not questioning the NAK.

> Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
> ---
>  drivers/hwmon/Kconfig  |  11 ++
>  drivers/hwmon/Makefile |   1 +
>  drivers/hwmon/sfpmon.c | 299 +++++++++++++++++++++++++++++++++++++++++++++++++

Documentation/hwmon/sfpmon would be required for a separate driver.

>  3 files changed, 311 insertions(+)
>  create mode 100644 drivers/hwmon/sfpmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index f10840ad465c..52de64ccdcfa 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1357,6 +1357,17 @@ config SENSORS_S3C_RAW
>  	  Say Y here if you want to include raw copies of all the ADC
>  	  channels in sysfs.
>  
> +config SENSORS_SFP
> +	tristate "Small Form Factor Pluggable (SFP) Transceiver"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the integrated sensors in
> +	  SFP/SFP+ modules that implement the Digital Diagnostic Monitoring
> +	  Interface (DDMI) as defined in SFF-8472.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sfpmon.
> +
>  config SENSORS_SIS5595
>  	tristate "Silicon Integrated Systems Corp. SiS5595"
>  	depends on PCI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index e7d52a36e6c4..d687b6667c1c 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
> +obj-$(CONFIG_SENSORS_SFP)       += sfpmon.o
>  obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
>  obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
>  obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
> diff --git a/drivers/hwmon/sfpmon.c b/drivers/hwmon/sfpmon.c
> new file mode 100644
> index 000000000000..7744577348f1
> --- /dev/null
> +++ b/drivers/hwmon/sfpmon.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardware monitoring driver for SFP/SFP+ modules that implement the
> + * Digital Diagnostic Monitoring Interface (DDMI) as defined in SFF-8472.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Not needed.

> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +
> +#define	DRIVER_NAME "sfpmon"
> +
> +/* id chip registers */
> +#define SFF_8472_IDENTIFIER  0
> +#define SFF_8472_DIAG_TYPE  92
> +
> +/* monitoring chip registers */
> +#define SFF_8472_TEMP_HIGH_ALARM 0
> +#define SFF_8472_TEMP_LOW_ALARM  2
> +#define SFF_8472_TEMP_HIGH_WARN  4
> +#define SFF_8472_TEMP_LOW_WARN   6
> +#define SFF_8472_T_SLOPE        84
> +#define SFF_8472_T_OFFSET       86
> +#define SFF_8472_TEMP           96

I prefer to see tabs before the value.

> +
> +struct calib_info {
> +	bool avail;
> +	bool external;
> +	u16 temp_slope;
> +	s16 temp_offset;
> +};
> +
> +struct sfp_data {
> +	struct i2c_client *id_client;
> +	struct i2c_client *ddmi_client;
> +};
> +
> +static int sfp_detect(struct i2c_client *id, bool *detected)
> +{
> +	int ret;
> +	s32 val;

A single variable is good enough.

> +
> +	val = i2c_smbus_read_byte_data(id, SFF_8472_IDENTIFIER);
> +	if (val < 0) {
> +		ret = val;
> +		*detected = false;
> +		goto abort;

goto to a return ? Please don't.

> +	}
> +
> +	*detected = (val == 3);

3 is asking for a define. No one knows that this identifies SFP modules.

The parameter is unnecessary. Just return -ENODEV if this is not a SFP.

> +
> +	ret = 0;
> +abort:
> +	return ret;
> +}


> +
> +static int sfp_get_calib_info(struct i2c_client *id, struct i2c_client *ddmi,
> +		struct calib_info *calib)
> +{
> +	int ret;
> +	s32 val;

One variable is unnecessary. We don't need to variables just to indicate
that one is used as return value and the other is a value, especially not
if there is overlap.
> +
> +	val = i2c_smbus_read_byte_data(id, SFF_8472_DIAG_TYPE);
> +	if (val < 0) {
> +		ret = val;
> +		goto abort;

Another goto to a return statement.

	if (val < 0)
		return val;

> +	}
> +
> +	calib->avail = !!(val & BIT(6));
> +	calib->external = !!(val & BIT(4));

6 and 4 are asking for defines, at the very least for documentation purposes.

> +
> +	if (calib->avail && calib->external) {
> +		u16 data;
> +
> +		val = i2c_smbus_read_word_data(ddmi, SFF_8472_T_SLOPE);
> +		if (unlikely(val < 0)) {
> +			ret = val;
> +			goto abort;

			return val;

Not going to repeat.

> +		}
> +		data = be16_to_cpu(val & 0xFFFF);
> +		calib->temp_slope = *(s16 *)&data;
> +
> +		val = i2c_smbus_read_word_data(ddmi, SFF_8472_T_OFFSET);
> +		if (unlikely(val < 0)) {
> +			ret = val;
> +			goto abort;
> +		}
> +		data = be16_to_cpu(val & 0xFFFF);
> +		calib->temp_offset = *(s16 *)&data;
> +	}
> +
> +	ret = 0;
> +abort:
> +	return ret;
> +}
> +
> +static int sfp_get_temp(struct sfp_data *priv, u8 addr, long *temp_mC)
> +{
> +	int ret;
> +	struct calib_info calib = {0};
> +	s32 temp, val;
> +	u16 data;
> +	bool detected;
> +
> +	ret = sfp_detect(priv->id_client, &detected);

When reading the temperature ? This is wrong. This should happen at probe time.

> +	if (ret < 0)
> +		goto abort;
> +
> +	if (!detected) {
> +		ret = -ENODEV;
> +		goto abort;
> +	}
> +
> +	ret = sfp_get_calib_info(priv->id_client, priv->ddmi_client, &calib);

THis also seems wrong. There should be no need to read the calibration
data more than once.


> +	if (ret < 0)
> +		goto abort;
> +
> +	if (!calib.avail) {
> +		ret = -ENODEV;
> +		goto abort;
> +	}
> +
> +	val = i2c_smbus_read_word_data(priv->ddmi_client, addr);
> +	if (unlikely(val < 0)) {
> +		ret = val;
> +		goto abort;
> +	}
> +
> +	data = be16_to_cpu(val & 0xFFFF);
> +	temp = *(s16 *)&data;

What is the problem with the following ?
	temp = be16_to_cpu(val & 0xFFFF);

> +
> +	/* To get better precision we keep slope in unit of 1/256 and scale

This is not a networking driver.

> +	 * up the offset accordingly. We also convert to mC by multiplying
> +	 * by 1000. At the very end we divide by 256*256 (using >>16
> +	 * operation). The first 256 is to rescale down, and the second
> +	 * 256 is because the calibration result is in unit of 1/256
> +	 */
> +	if (calib.external)
> +		*temp_mC = (((s64) calib.temp_slope * temp +
> +				(calib.temp_offset << 8)) * 1000) >> 16;
> +	else
> +		*temp_mC = ((s64)temp*1000) >> 8;

spaces between operators.

> +
> +abort:
> +	return ret;
> +}
> +
> +static int sfp_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *temp)
> +{
> +	struct sfp_data *priv = dev_get_drvdata(dev);
> +	int err;
> +	u8 reg;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		reg = SFF_8472_TEMP;
> +		break;
> +	case hwmon_temp_crit:
> +		reg = SFF_8472_TEMP_HIGH_ALARM;
> +		break;
> +	case hwmon_temp_lcrit:
> +		reg = SFF_8472_TEMP_LOW_ALARM;
> +		break;
> +	case hwmon_temp_max:
> +		reg = SFF_8472_TEMP_HIGH_WARN;
> +		break;
> +	case hwmon_temp_min:
> +		reg = SFF_8472_TEMP_LOW_WARN;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	err = sfp_get_temp(priv, reg, temp);
> +	if (err < 0)
> +		return err;
> +

why not just the following ?
	return err;

> +	return 0;
> +}
> +
> +static umode_t sfp_is_visible(const void *data, enum hwmon_sensor_types type,
> +				 u32 attr, int channel)
> +{
> +	if (type != hwmon_temp)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_crit:
> +	case hwmon_temp_lcrit:
> +	case hwmon_temp_max:
> +	case hwmon_temp_min:
> +		return S_IRUGO;

discouraged nowadays and should generate a checkpatch warning.
Please run checkpatch on your patches.

> +	default:
> +		return 0;
> +	}
> +}
> +
> +static u32 ddmi_temp_config[] = {
> +	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_CRIT
> +		| HWMON_T_LCRIT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info ddmi_temp = {
> +	.type = hwmon_temp,
> +	.config = ddmi_temp_config,
> +};
> +
> +static const struct hwmon_channel_info *channel_info[] = {
> +	&ddmi_temp,
> +	NULL
> +};
> +
> +static const struct hwmon_ops sfp_hwmon_ops = {
> +	.is_visible = sfp_is_visible,
> +	.read = sfp_read,
> +};
> +
> +static const struct hwmon_chip_info sfp_chip_info = {
> +	.ops = &sfp_hwmon_ops,
> +	.info = channel_info,
> +};
> +
> +static int sfp_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct device_node *id_node;
> +	struct sfp_data *priv;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WORD_DATA)) {
> +		dev_err(dev,
> +			"adapter doesn't support SMBus word transactions\n");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, priv);
> +
> +	priv->ddmi_client = client;
> +
> +	id_node = of_parse_phandle(client->dev.of_node, "id", 0);
> +	if (id_node) {
> +		priv->id_client = of_find_i2c_device_by_node(id_node);
> +		of_node_put(id_node);
> +	}

The use of devicetree properties suggests that there is or should be
a matching property description file. A search for sfp,ddmi in linux-next
returns nothing. A search for sfp returns bindings such as "sff,sfp"
which suggests that 1) the bindings used here are not documented and 2)
the suggested bindings are different than the ones used elsewhere in the
kernel.

[ And, yes, I agree with Russell's NAK. This should be part of the sfp
  infrastructure. ]

Why are there two different clients anyway ? This will require a lot
of explanation.

> +
> +	if (!priv->id_client) {
> +		dev_err(dev, "ID client missing\n");
> +		return -ENODEV;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +			priv, &sfp_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(dev, "unable to register sfp hwmon device\n");
> +		return PTR_ERR(hwmon_dev);
> +	}

Just return PTR_ERR_OR_NULL().

> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sfp_id[] = {
> +	{ "sfp", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, sfp_id);
> +
> +static const struct of_device_id sfp_of_match[] = {
> +	{ .compatible = "sfp,ddmi" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sfp_of_match);
> +
> +static struct i2c_driver sfp_driver = {
> +	.driver.name	= DRIVER_NAME,
> +	.driver.of_match_table = of_match_ptr(sfp_of_match),
> +	.probe		= sfp_probe,
> +	.id_table	= sfp_id,
> +};
> +
> +module_i2c_driver(sfp_driver);
> +
> +MODULE_AUTHOR("Gabriel Matni <gabriel.matni@exfo.com>");
> +MODULE_DESCRIPTION("SFP/SFP+ hwmon driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.7.4
> 
