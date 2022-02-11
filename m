Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72632C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 05:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbiBKFQ2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Feb 2022 00:16:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbiBKFQ1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Feb 2022 00:16:27 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28801020
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Feb 2022 21:16:26 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id u3so8383244oiv.12
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Feb 2022 21:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=4tsboKrG3XqJVJ2gjNSJyoY340/rSS2Q+UbOfDWVhDc=;
        b=SR/2UI9LUoT0gCqZaf3DrYLMLgNWmX8MF7GuhRWUiZw63gadhLNaAZi3SotRIW49+B
         ee2gjORUOIDenJpoEEbK1G+c/bx0aMCT3TJbch3KWDLeUJl/33xBxGRpyP4tcCNE2m3/
         OEiGagDyzuZKvpHNH4+r6RgIF+ECzuqpCZQ8L8xhO+Z/I4E6cfOY0kpA6B9GpeIZ1Xyd
         R/NUbX0xhPWuJgxF14ivoB12hSmpAHxTHq2GnuBiuFbrxNjAXPmx4+nTO6XlairSV5XX
         g6PnxV2JkbqMnbKyHeZKGjps0YCD8zV1fKZW29yS8Bq+yvTkMf2fzRQZRUVDopVB2qh5
         Nm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=4tsboKrG3XqJVJ2gjNSJyoY340/rSS2Q+UbOfDWVhDc=;
        b=q1RZMnkkQRihY+oG9k4pa1oEK0Wrxwlm04aH3GManmUsWF9lD7MdKTVvtrHCwPsldq
         ySsDAkj6Iyo3IEp/iNf04PKJ4evHmJ9yfBL/odycNsx0Tc3ZOvfEWExWCuCI87wDqLSl
         em+iaf3Zzd0UADbS6jJTTEXVQBfdpJl+LE3NcxYF2r//RebNpTXpONwNsaSdpOq/112K
         f05VxywNKoQjCTwLpUiVy+fQfVJutamFtBF4VrejNZpK4x02L9SW1bzsJXhbzH3QvBzN
         8X89xL29FgVibFWreCPJaEni6q2GkimeUvg4PgjJTa9uouYwqIsJ6wLfootp/ehGAT3L
         q9dg==
X-Gm-Message-State: AOAM533NPrVDxHiVuy73Bg6eLwHUCkFaIEU1e7ndNJxt/Tr05Khchvq1
        mfWHipHwD188JE8qbBsH4+Fsdgebkes/xQ==
X-Google-Smtp-Source: ABdhPJyXc5X7Pb6fDaQ8CjLB/YVVrYp0V5DJCOzgGKGSWlTVxMRr4pEBJLmss2h/++tTuC/Gzq5JDw==
X-Received: by 2002:aca:398a:: with SMTP id g132mr350534oia.207.1644556585864;
        Thu, 10 Feb 2022 21:16:25 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x31sm3589992otb.55.2022.02.10.21.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 21:16:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <53861f0c-6447-7a50-39c3-924290a6f9bf@roeck-us.net>
Date:   Thu, 10 Feb 2022 21:16:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Agathe Porte <agathe.porte@nokia.com>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209155308.88938-1-agathe.porte@nokia.com>
 <20220209155308.88938-2-agathe.porte@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP464
 sensor chip
In-Reply-To: <20220209155308.88938-2-agathe.porte@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/9/22 07:53, Agathe Porte wrote:
> Add support for Texas Instruments TMP464 temperature sensor IC.
> 
> TI's TMP464 is an I2C temperature sensor chip. This chip is
> similar to TI's TMP421 chip, but with 16bit-wide registers (instead
> of 8bit-wide registers). The chip have one local sensor and four
> remote sensors.
> 
> Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
> Acked-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

First, please _never_ send a new version of a patch or patch series
as response to an older version. I almost missed this version of the series.

Second, I really dislike continuing this driver without all the attibutes
making it valuable as hwmon driver, and I really want to drop local caching
and use regmap instead. I can not get a TMP464 (they appear to be sold out
until 2023 everywhere I checked, and I can not even get a sample from TI
either). However, I ordered and - according to Fedex - should get an
evaluation board for TMP468 tomorrow. Before we keep going back and
forth, I'd prefer to use that chip to add support for all attributes (or
in other words take the driver from here). Would that be ok with you ?

Additional comment inline.

Thanks,
Guenter

> ---
>   Documentation/hwmon/index.rst  |   1 +
>   Documentation/hwmon/tmp464.rst |  43 ++++
>   MAINTAINERS                    |   2 +
>   drivers/hwmon/Kconfig          |  10 +
>   drivers/hwmon/Makefile         |   1 +
>   drivers/hwmon/tmp464.c         | 447 +++++++++++++++++++++++++++++++++
>   6 files changed, 504 insertions(+)
>   create mode 100644 Documentation/hwmon/tmp464.rst
>   create mode 100644 drivers/hwmon/tmp464.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index df20022c741f..37590db85e65 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -193,6 +193,7 @@ Hardware Monitoring Kernel Drivers
>      tmp108
>      tmp401
>      tmp421
> +   tmp464
>      tmp513
>      tps23861
>      tps40422
> diff --git a/Documentation/hwmon/tmp464.rst b/Documentation/hwmon/tmp464.rst
> new file mode 100644
> index 000000000000..8990554194de
> --- /dev/null
> +++ b/Documentation/hwmon/tmp464.rst
> @@ -0,0 +1,43 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver tmp421
> +====================
> +
> +Supported chips:
> +
> +  * Texas Instruments TMP464
> +
> +    Prefix: 'tmp464'
> +
> +    Addresses scanned: I2C 0x48, 0x49, 0x4a and 0x4b
> +
> +    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp464.html
> +
> +Authors:
> +
> +	Agathe Porte <agathe.porte@nokia.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Texas Instruments TMP464
> +temperature sensor chip. This chip implement one local four remote
> +sensors. Temperature is measured in degrees Celsius. The chips are
> +wired over I2C/SMBus and specified over a temperature range of -40 to
> ++125 degrees Celsius. Resolution for both the local and remote
> +channels is 0.0625 degree C.
> +
> +The chips support only temperature measurement. The driver exports
> +the temperature values via the following sysfs files:
> +
> +**temp[1-5]_input**
> +
> +Each sensor can be individually disabled via Devicetree or from sysfs
> +via:
> +
> +**temp[1-5]_enable**
> +
> +If labels were specified in Devicetree, additional sysfs files will
> +be present:
> +
> +**temp[1-5]_label**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 136cd34be715..7fa2796adbef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19462,6 +19462,8 @@ M:	Agathe Porte <agathe.porte@nokia.com>
>   L:	linux-hwmon@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> +F:	Documentation/hwmon/tmp464.rst
> +F:	drivers/hwmon/tmp464.c
> 
>   TMP513 HARDWARE MONITOR DRIVER
>   M:	Eric Tremblay <etremblay@distech-controls.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8df25f1079ba..52b4f5688b45 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1979,6 +1979,16 @@ config SENSORS_TMP421
>   	  This driver can also be built as a module. If so, the module
>   	  will be called tmp421.
> 
> +config SENSORS_TMP464
> +	tristate "Texas Instruments TMP464 and compatible"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for Texas Instruments TMP464
> +	  temperature sensor chip.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called tmp464.
> +
>   config SENSORS_TMP513
>   	tristate "Texas Instruments TMP513 and compatibles"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 185f946d698b..a1f2d6686227 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -194,6 +194,7 @@ obj-$(CONFIG_SENSORS_TMP103)	+= tmp103.o
>   obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
>   obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
>   obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
> +obj-$(CONFIG_SENSORS_TMP464)	+= tmp464.o
>   obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
>   obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
>   obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
> diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
> new file mode 100644
> index 000000000000..564090929ad4
> --- /dev/null
> +++ b/drivers/hwmon/tmp464.c
> @@ -0,0 +1,447 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/* Driver for the Texas Instruments TMP464 SMBus temperature sensor IC.
> + * Supported models: TMP464
> +
> + * Copyright (C) 2022 Agathe Porte <agathe.porte@nokia.com>
> + * Preliminary support by:
> + * Lionel Pouliquen <lionel.lp.pouliquen@nokia.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +
> +/* Addresses to scan */
> +static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, I2C_CLIENT_END };
> +
> +enum chips { tmp464 };
> +
> +#define MAX_CHANNELS				5 /* chan 0 is internal, 1-4 are remote */
> +
> +/* TMP464 registers */
> +static const u8 TMP464_TEMP[MAX_CHANNELS] = { 0x00, 0x01, 0x02, 0x03, 0x04 };
> +static const u8 TMP464_THERM_LIMIT[MAX_CHANNELS] = { 0x39, 0x42, 0x4A, 0x52, 0x5A };
> +static const u8 TMP464_THERM2_LIMIT[MAX_CHANNELS] = { 0x3A, 0x43, 0x4B, 0x53, 0x5B };
> +static const u8 TMP464_OFFSET_REMOTE[MAX_CHANNELS] = { 0x40, 0x48, 0x50, 0x58 };
> +#define TMP464_N_FACTOR_REG_1			0x41
> +#define TMP464_CONFIG_REG			0x30
> +
> +/* Identification */
> +#define TMP464_MANUFACTURER_ID_REG		0xFE
> +#define TMP464_DEVICE_ID_REG			0xFF
> +
> +/* Flags */
> +#define TMP464_CONFIG_SHUTDOWN			BIT(5)
> +#define TMP464_CONFIG_RANGE			0x04
> +#define TMP464_CONFIG_REG_REN(x)		(BIT(7 + (x)))
> +#define TMP464_CONFIG_REG_REN_MASK		GENMASK(11, 7)
> +#define TMP464_CONFIG_CONVERSION_RATE_B0	2
> +#define TMP464_CONFIG_CONVERSION_RATE_MASK      GENMASK(TMP464_CONFIG_CONVERSION_RATE_B0, \
> +							TMP464_CONFIG_CONVERSION_RATE_B0 + 2)
> +
> +/* Manufacturer / Device ID's */
> +#define TMP464_MANUFACTURER_ID			0x5449
> +#define TMP464_DEVICE_ID			0x1468
> +
> +static const struct i2c_device_id tmp464_id[] = {
> +	{ "tmp464", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tmp464_id);
> +
> +static const struct of_device_id __maybe_unused tmp464_of_match[] = {
> +	{
> +		.compatible = "ti,tmp464",
> +		.data = (void *)5
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tmp464_of_match);
> +
> +struct tmp464_channel {
> +	const char *label;
> +	bool enabled;
> +	s16 temp;
> +};
> +
> +struct tmp464_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock; /* used to update the struct values */
> +	u32 temp_config[MAX_CHANNELS + 1];
> +	struct hwmon_channel_info temp_info;
> +	const struct hwmon_channel_info *info[2];
> +	struct hwmon_chip_info chip;

There is really no good reason to have the above structures dynamically
allocated. They can as well be declared statically. The only dynamic
attribute is the label, and the visibility of that attribute can be
controlled with the is_visible callback. After all, that is what
the callback is for.

> +	bool valid;
> +	unsigned long last_updated;
> +	unsigned long channels;

Not sure why this should be unsigned long.

> +	u16 config;
> +	struct tmp464_channel channel[MAX_CHANNELS];
> +};
> +
> +static int temp_from_raw(s16 reg)
> +{
> +	return DIV_ROUND_CLOSEST((reg >> 3) * 625, 10);
> +}
> +
> +static int tmp464_update_device(struct tmp464_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	int ret = 0;
> +	int i;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + (HZ / 2)) ||
> +	    !data->valid) {
> +		ret = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
> +		if (ret < 0)
> +			goto exit;
> +		data->config = ret;
> +
> +		for (i = 0; i < data->channels; i++) {
> +			ret = i2c_smbus_read_word_swapped(client, TMP464_TEMP[i]);
> +			if (ret < 0)
> +				goto exit;
> +			data->channel[i].temp = ret;
> +		}
> +		data->last_updated = jiffies;
> +		data->valid = true;
> +	}
> +
> +exit:
> +	mutex_unlock(&data->update_lock);
> +
> +	if (ret < 0) {
> +		data->valid = false;
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tmp464_enable_channels(struct tmp464_data *data)
> +{
> +	int err;
> +	struct i2c_client *client = data->client;
> +	struct device *dev = &client->dev;
> +	int old = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
> +	int new, i;
> +
> +	if (old < 0) {
> +		dev_err(dev, "error reading register, can't disable channels\n");
> +		return old;
> +	}
> +
> +	new = old & ~TMP464_CONFIG_REG_REN_MASK;
> +	for (i = 0; i < data->channels; i++)
> +		if (data->channel[i].enabled)
> +			new |= TMP464_CONFIG_REG_REN(i);
> +
> +	if (new == old)
> +		return 0;
> +
> +	err = i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, new);
> +	if (err < 0)
> +		dev_err(dev, "error writing register, can't disable channels\n");
> +
> +	return err;
> +}
> +
> +static int tmp464_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *val)
> +{
> +	struct tmp464_data *tmp464 = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	ret = tmp464_update_device(tmp464);
> +	if (ret)
> +		return ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		if (!tmp464->channel[channel].enabled)
> +			return -ENODATA;
> +		*val = temp_from_raw(tmp464->channel[channel].temp);
> +		return 0;
> +	case hwmon_temp_enable:
> +		*val = tmp464->channel[channel].enabled;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int tmp464_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, const char **str)
> +{
> +	struct tmp464_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->channel[channel].label;
> +
> +	return 0;
> +}
> +
> +static int tmp464_write(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long val)
> +{
> +	struct tmp464_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_enable:
> +		data->channel[channel].enabled = val;
> +		ret = tmp464_enable_channels(data);
> +		break;
> +	default:
> +	    ret = -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +static umode_t tmp464_is_visible(const void *data, enum hwmon_sensor_types type,
> +				 u32 attr, int channel)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return 0444;
> +	case hwmon_temp_label:
> +		return 0444;
> +	case hwmon_temp_enable:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int tmp464_init_client(struct tmp464_data *data)
> +{
> +	int err;
> +	int config, config_orig;
> +	struct i2c_client *client = data->client;
> +
> +	config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
> +	if (config < 0) {
> +		dev_err(&client->dev,
> +			"Could not read configuration register (%d)\n", config);
> +		return config;
> +	}
> +
> +	/* Set the conversion rate to 2 Hz */
> +	config_orig = config;
> +	config &= ~TMP464_CONFIG_CONVERSION_RATE_MASK;
> +	config |= (0x05) << TMP464_CONFIG_CONVERSION_RATE_B0;
> +
> +	/* Start conversions (disable shutdown if necessary) */
> +	config_orig = config;
> +	config &= ~TMP464_CONFIG_SHUTDOWN;
> +
> +	if (config != config_orig) {
> +		config = i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
> +		if (config < 0) {
> +			dev_err(&client->dev,
> +				"Could not write configuration register (%d)\n", err);
> +			return config;
> +		}
> +	}
> +
> +	return tmp464_enable_channels(data);
> +}
> +
> +static int tmp464_detect(struct i2c_client *client,
> +			 struct i2c_board_info *info)
> +{
> +	enum chips kind;
> +	struct i2c_adapter *adapter = client->adapter;
> +	static const char * const names[] = {
> +		"TMP464"
> +	};
> +	int reg;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_MANUFACTURER_ID_REG);
> +	if (reg < 0)
> +		return reg;
> +	if (reg != TMP464_MANUFACTURER_ID)
> +		return -ENODEV;
> +
> +	/* Check for "always return zero" bits */
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM_STATUS);
> +	if (reg < 0)
> +		return reg;
> +	if (reg & 0x1f)
> +		return -ENODEV;
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM2_STATUS);
> +	if (reg < 0)
> +		return reg;
> +	if (reg & 0x1f)
> +		return -ENODEV;
> +
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_DEVICE_ID_REG);
> +	if (reg < 0)
> +		return reg;
> +	switch (reg) {
> +	case TMP464_DEVICE_ID:
> +		kind = tmp464;
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	strscpy(info->type, tmp464_id[kind].name, I2C_NAME_SIZE);
> +	dev_info(&adapter->dev, "Detected TI %s chip at 0x%02x\n",
> +		 names[kind], client->addr);
> +
> +	return 0;
> +}
> +
> +static int tmp464_probe_child_from_dt(struct i2c_client *client,
> +				      struct device_node *child,
> +				      struct tmp464_data *data)
> +
> +{
> +	struct device *dev = &client->dev;
> +	u32 i;
> +	s32 val;
> +	int err;
> +
> +	err = of_property_read_u32(child, "reg", &i);
> +	if (err) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return err;
> +	}
> +
> +	if (i >= data->channels) {
> +		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
> +		return -EINVAL;
> +	}
> +
> +	of_property_read_string(child, "label", &data->channel[i].label);
> +	if (data->channel[i].label)
> +		data->temp_config[i] |= HWMON_T_LABEL;
> +
> +	data->channel[i].enabled = of_device_is_available(child);
> +
> +	err = of_property_read_s32(child, "ti,n-factor", &val);
> +	if (!err) {
> +		if (i == 0) {
> +			dev_err(dev, "n-factor can't be set for internal channel\n");
> +			return -EINVAL;
> +		}
> +
> +		if (val > 127 || val < -128) {
> +			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
> +				i, val);
> +			return -EINVAL;
> +		}
> +		err = i2c_smbus_write_word_data(client, TMP464_N_FACTOR_REG_1 + i - 1, val);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tmp464_probe_from_dt(struct i2c_client *client, struct tmp464_data *data)
> +{
> +	struct device *dev = &client->dev;
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int err;
> +
> +	for_each_child_of_node(np, child) {
> +		if (strcmp(child->name, "channel"))
> +			continue;
> +
> +		err = tmp464_probe_child_from_dt(client, child, data);
> +		if (err) {
> +			of_node_put(child);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops tmp464_ops = {
> +	.is_visible = tmp464_is_visible,
> +	.read = tmp464_read,
> +	.read_string = tmp464_read_string,
> +	.write = tmp464_write,
> +};
> +
> +static int tmp464_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct tmp464_data *data;
> +	int i, err;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
> +		dev_err(&client->dev, "i2c functionality check failed\n");
> +		return -ENODEV;
> +	}
> +	data = devm_kzalloc(dev, sizeof(struct tmp464_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->update_lock);
> +	if (client->dev.of_node)
> +		data->channels = (unsigned long)of_device_get_match_data(&client->dev);
> +	else
> +		data->channels = i2c_match_id(tmp464_id, client)->driver_data;
> +	data->client = client;
> +
> +	for (i = 0; i < data->channels; i++) {
> +		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_ENABLE;
> +		data->channel[i].enabled = true;
> +	}
> +
> +	err = tmp464_probe_from_dt(client, data);
> +	if (err)
> +		return err;
> +
> +	err = tmp464_init_client(data);
> +	if (err)
> +		return err;
> +
> +	data->chip.ops = &tmp464_ops;
> +	data->chip.info = data->info;
> +
> +	data->info[0] = &data->temp_info;
> +
> +	data->temp_info.type = hwmon_temp;
> +	data->temp_info.config = data->temp_config;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data, &data->chip, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct i2c_driver tmp464_driver = {
> +	.class = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "tmp464",
> +		.of_match_table = of_match_ptr(tmp464_of_match),
> +	},
> +	.probe_new = tmp464_probe,
> +	.id_table = tmp464_id,
> +	.detect = tmp464_detect,
> +	.address_list = normal_i2c,
> +};
> +
> +module_i2c_driver(tmp464_driver);
> +
> +MODULE_AUTHOR("Agathe Porte <agathe.porte@nokia.com>");
> +MODULE_DESCRIPTION("Texas Instruments TMP464 temperature sensor driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
> 

