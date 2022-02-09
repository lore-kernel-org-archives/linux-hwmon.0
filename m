Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F50AC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 14:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbiBIOqW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 09:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiBIOqW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 09:46:22 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61944C06157B
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 06:46:24 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id s6-20020a0568301e0600b0059ea5472c98so1635362otr.11
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Feb 2022 06:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=oXnG+4L1ZZrTabWuXr8FgYU8DopUPy2gbCRypXu/WYY=;
        b=JAeG9KhJPXrDMd+tn6Z6tgQNaNa5OCYP0EhTtjd3BXgyJTQglsNyE3kJ3xJhlf+D+y
         /b9INXp0zdHYIMFeUa8MPj+/HFruU+DozubqjzGj/lcG8jF1A87f6gb3rWj+KK187jda
         gryWZmemFafeBrCg4ajQvZmQeG/qsa3w9sQdIqQ7lzDC7gvTYxgOQ2l8xIxXL57GvTNM
         EDQSWfrxbMHhiS/Uboh5ZJjcPbxMunLJKyCzgk71aPWxdn5EvvJA4pIK5dR2rOQAJ97e
         5zZgXowTmyCAiYbQu9KNo7/PUKfCb5IWGHku6cUJV9yTnjiPwvAe1zB9HAeFqrB1IH9b
         GD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=oXnG+4L1ZZrTabWuXr8FgYU8DopUPy2gbCRypXu/WYY=;
        b=g21oBnOkG7076KiGzBAxnu5qaA8H1ljasM69D1A+5GddcUHB88HFJyxpPkpnMB4zOH
         EZlc2l/ZfmjrUt6xpAuHtqKHyvLXEZ+nytw6vdJes2PvGkVapwCBhjM3vUxNvYPoipBK
         wMHPdofjDTOJIJpGsoSERXbEHwqxvgPma2LXvnzJ0PRHr8KAhHVnRud6RRoKYq9vaZDs
         7FWuqOiylqxOY8GNfCtDtsQ4YsLbrK5ubn+djR5PxumtmdOl2qI6KYPbb4fG/vUl5tyR
         GNS/fSxvT+Q6rUFwdAhak/uRYoGd/wuvvGkV9ubeS0AmvQOzO3k7jck4Hb2iiOrrUTJJ
         vxRA==
X-Gm-Message-State: AOAM533yzFaAZeEoGfH+jZGkfYa7Cd5D6HSsXvEcSc7e03dDYYHBOfcj
        U7kuKOnTEniUTJaLGhgB8vE=
X-Google-Smtp-Source: ABdhPJynNOWXgAP+ZC/vQzZ8mQhmdtI3zpyap1heC09MZMuAF5ZK8Fv8u+emcYQ/BRimc9fejzcSHw==
X-Received: by 2002:a9d:6f8d:: with SMTP id h13mr1033766otq.309.1644417983519;
        Wed, 09 Feb 2022 06:46:23 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a32sm6767422oaf.17.2022.02.09.06.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 06:46:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <21c55ad9-dd7a-006e-0a82-9c93a36cc220@roeck-us.net>
Date:   Wed, 9 Feb 2022 06:46:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Agathe Porte <agathe.porte@nokia.com>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209133617.67297-2-agathe.porte@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] hwmon: Add driver for Texas Instruments TMP464 sensor
 chip
In-Reply-To: <20220209133617.67297-2-agathe.porte@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/9/22 05:36, Agathe Porte wrote:
> Add support for Texas Instruments TMP464 temperature sensor IC.
> 
> TI's TMP464 is an I2C temperature sensor chip. This chip is
> similar to TI's TMP421 chip, but with 16bit-wide registers (instead
> of 8bit-wide registers). The chip have one local sensor and four
> remote sensors.
> 
> Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
> Acked-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   Documentation/hwmon/tmp464.rst |  43 +++
>   MAINTAINERS                    |   7 +
>   drivers/hwmon/Kconfig          |  10 +
>   drivers/hwmon/Makefile         |   1 +
>   drivers/hwmon/tmp464.c         | 472 +++++++++++++++++++++++++++++++++
>   5 files changed, 533 insertions(+)
>   create mode 100644 Documentation/hwmon/tmp464.rst
>   create mode 100644 drivers/hwmon/tmp464.c
> 
> diff --git a/Documentation/hwmon/tmp464.rst b/Documentation/hwmon/tmp464.rst

Needs to be added to Documentation/hwmon/index.rst.

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
> index 3e461db9cd91..fa0b27a8fe28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19457,6 +19457,13 @@ S:	Maintained
>   F:	Documentation/hwmon/tmp401.rst
>   F:	drivers/hwmon/tmp401.c
>   
> +TMP464 HARDWARE MONITOR DRIVER
> +M:	Agathe Porte <agathe.porte@nokia.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/tmp464.rst
> +F:	drivers/hwmon/tmp464.c
> +
>   TMP513 HARDWARE MONITOR DRIVER
>   M:	Eric Tremblay <etremblay@distech-controls.com>
>   L:	linux-hwmon@vger.kernel.org
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
> index 000000000000..f294e12b1e39
> --- /dev/null
> +++ b/drivers/hwmon/tmp464.c
> @@ -0,0 +1,472 @@
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
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Unnecessary include.

> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/sysfs.h>

Is this include necessary ?

Include files in alphabetic order, please.

> +
> +/* Addresses to scan */
> +static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b,
> +					     I2C_CLIENT_END };

Unnecessary continuation line.

> +
> +enum chips { tmp464 };
> +
> +#define MAX_CHANNELS				5 /* chan 0 is internal, 1-4 are remote */
> +
> +/* TMP464 registers */
> +#define TMP464_REG_THERM_STATUS			0x21
> +#define TMP464_REG_THERM2_STATUS		0x22
> +
> +static const u8 TMP464_TEMP[MAX_CHANNELS] = { 0x00, 0x01, 0x02, 0x03, 0x04 };
> +static const u8 TMP464_THERM_LIMIT[MAX_CHANNELS] = { 0x39, 0x42, 0x4A, 0x52, 0x5A };
> +static const u8 TMP464_THERM2_LIMIT[MAX_CHANNELS] = { 0x3A, 0x43, 0x4B, 0x53, 0x5B };
> +static const u8 TMP464_OFFSET_REMOTE[MAX_CHANNELS] = { 0x40, 0x48, 0x50, 0x58 };

Most of those are unused (which would result in static analyzer warnings).
More on that below.

> +#define TMP464_N_FACTOR_REG_1			0x41
> +#define TMP464_CONFIG_REG			0x30
> +
> +/* alarm offset in THERM_STATUS/THERM2_STATUS register */
> +#define TMP464_ALARM_BASE_NUMBER		7
> +
> +#define TMP464_REG_THERM_HYSTERESIS		0x38
> +
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
> +
No double empty lines, please.

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
> +
No double empty lines, please. checkpatch --strict should tell you that. Please
run and fix what it reports.

> +struct tmp464_channel {
> +	const char *label;
> +	bool enabled;
> +	s16 temp;
> +};
> +
> +struct tmp464_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock;
> +	u32 temp_config[MAX_CHANNELS + 1];
> +	struct hwmon_channel_info temp_info;
> +	const struct hwmon_channel_info *info[2];
> +	struct hwmon_chip_info chip;
> +	bool valid;
> +	unsigned long last_updated;
> +	unsigned long channels;
> +	u16 config;
> +	struct tmp464_channel channel[MAX_CHANNELS];
> +};
> +
> +
> +/* funcs */
> +
Useless comment. Please drop.

> +static int temp_from_raw(u16 reg)
> +{
> +	int temp = 0;
> +
> +	temp = (reg >> 8) * 2000;
> +	temp += ((reg & 0xFF) >> 3) * 625 / 10;
> +

This doesn't correctly handle negative temperatures. reg needs to be s16
to be able to handle those. Also, why not just

	return (reg >> 3) * 625 / 10;
or
	return DIV_ROUND_CLOSEST((reg >> 3) * 625, 10);

?

> +	return temp;
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

We are moving away from local caching. Please consider using regmap instead.

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
> +
> +}
> +
> +static int tmp464_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, const char **str)
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
> +	int config, config_orig;
> +	struct i2c_client *client = data->client;
> +
> +	/* Set the conversion rate to 2 Hz */
> +	config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
> +	if (config < 0) {
> +		dev_err(&client->dev,
> +			"Could not read configuration register (%d)\n", config);
> +		return config;
> +	}
> +
> +	config_orig = config;
> +	config &= ~TMP464_CONFIG_CONVERSION_RATE_MASK;
> +	config |= (0x05) << TMP464_CONFIG_CONVERSION_RATE_B0;
> +
> +	if (config != config_orig) {
> +		dev_info(&client->dev, "Set conversion rate to 2 Hz\n");
> +		i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
> +	}
> +
> +	/* Start conversions (disable shutdown if necessary) */
> +	config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);

Why read this register twice ?

> +	if (config < 0) {
> +		dev_err(&client->dev,
> +			"Could not read configuration register (%d)\n", config);
> +		return config;
> +	}
> +
> +	config_orig = config;
> +	config &= ~TMP464_CONFIG_SHUTDOWN;
> +
> +	if (config != config_orig) {
> +		dev_info(&client->dev, "Enable monitoring chip\n");

Please only write the configuration register once, and drop the messages.

> +		i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
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
> +	u8 reg;

Should be int to enable error checks.

> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_MANUFACTURER_ID_REG);
> +	if (reg != TMP464_MANUFACTURER_ID)
> +		return -ENODEV;
> +
> +	/* Check for "always return zero" bits */
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM_STATUS);
> +	if (reg & 0x1f)

should also check for < 0.

> +		return -ENODEV;
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM2_STATUS);
> +	if (reg & 0x1f)
> +		return -ENODEV;

Should also check for < 0.

> +
> +	reg = i2c_smbus_read_word_swapped(client, TMP464_DEVICE_ID_REG);
> +	if (reg < 0)
> +		return reg;

That won't happen with an u8 variable.

> +	switch (reg) {
> +	case TMP464_DEVICE_ID:
> +		kind = tmp464;
> +		break;

Are there more devices with the same register set ? If not it is pointless to
have/prepare support for it.

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
> +		i2c_smbus_write_word_data(client, TMP464_N_FACTOR_REG_1 + i - 1,
> +					  val);

needs error check

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
> +	if (!i2c_check_functionality(client->adapter,
> +	    I2C_FUNC_SMBUS_WORD_DATA)) {
> +		dev_err(&client->dev, "i2c functionality check failed\n");
> +		return -ENODEV;
> +	}
> +	data = devm_kzalloc(dev, sizeof(struct tmp464_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->update_lock);
> +	if (client->dev.of_node)
> +		data->channels = (unsigned long)
> +			of_device_get_match_data(&client->dev);

Unnecessary continuation line.

> +	else
> +		data->channels = i2c_match_id(tmp464_id, client)->driver_data;
> +	data->client = client;
> +
> +	for (i = 0; i < data->channels; i++) {
> +		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_ENABLE;

Why not support limits, temperature offsets, alarms, hysteresis, and conversion
rate configuration ? It is kind of off to support n-factor correction but
nothing else.

Overall it looks like some of the support was dropped since defines for
limit and offset registers are there, and the driver seems to be prepared
to support more chips. Why ?

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
> +							 data,
> +							 &data->chip,
> +							 NULL);

Please drop some of those continuation lines. We can go up to 100 columns and
should do so in situations like this.

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

