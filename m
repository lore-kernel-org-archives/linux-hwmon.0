Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55167C6369E
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Dec 2020 01:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 003F920B80
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Dec 2020 01:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgLCBid (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Dec 2020 20:38:33 -0500
Received: from gproxy8-pub.mail.unifiedlayer.com ([67.222.33.93]:34436 "EHLO
        gproxy8-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729428AbgLCBic (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Dec 2020 20:38:32 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id D0ACC1AB0C6
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Dec 2020 18:37:50 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id kdZ8kkkzBwNNlkdZ8kwePN; Wed, 02 Dec 2020 18:37:50 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=cqm1bWwi c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=zd2uoN0lAAAA:8
 a=1XWaLZrsAAAA:8 a=2c-6TPCYEPNHg46C-J8A:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ieH2YtLgx5fTQiFq5GdpytczQvOdN1vwvBjenweIVfw=; b=k5XR8KvsW+YGJIcVguHoC004Se
        spoOs7m4PSQCsDAd6LtTwXkccVwaiZ7o/D/zc31kDvGqsAAPtfTsAwb8t1LXQqNSRNq7yIa32b4wK
        nTc5URCRX+8qMdXyahb+T7vQBL7EE/4Zc7/gOUEXqjuUF4THl2APQ45IqTzZU1hxThv1IAMUkbxGB
        8ufvuoQ1tZC9XzoFLMF3ND809SbbH8cgz7aeqHO3rXBYk5dfyfYP3ORe01catb9g+7jmTJt96aatf
        b3+840e89jQCljWEFRwkJlsXZIpChN/NyTy4C8H4bYcW/fv5baUmwcLcBcpq0yk32XTlpigXdv5Xt
        S4LxUs2g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40102 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kkdZ7-002OpQ-O0; Thu, 03 Dec 2020 01:37:49 +0000
Date:   Wed, 2 Dec 2020 17:37:48 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kun Yi <kunyi@google.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        supreeth.venkatesh@amd.com, openbmc@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux hwmon-next v4 1/3] hwmon: (sbtsi) Add basic support
 for SB-TSI sensors
Message-ID: <20201203013748.GA228752@roeck-us.net>
References: <20201202165601.1532213-1-kunyi@google.com>
 <20201202165601.1532213-2-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202165601.1532213-2-kunyi@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kkdZ7-002OpQ-O0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:40102
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 02, 2020 at 08:55:59AM -0800, Kun Yi wrote:
> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> interface that reports AMD SoC's Ttcl (normalized temperature),
> and resembles a typical 8-pin remote temperature sensor's I2C interface
> to BMC.
> 
> This commit adds basic support using this interface to read CPU
> temperature, and read/write high/low CPU temp thresholds.
> 
> To instantiate this driver on an AMD CPU with SB-TSI
> support, the i2c bus number would be the bus connected from the board
> management controller (BMC) to the CPU. The i2c address is specified in
> Section 6.3.1 of the spec [1]: The SB-TSI address is normally 98h for
> socket 0 and 90h for socket 1, but it could vary based on hardware address
> select pins.
> 
> [1]: https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
> 
> Test status: tested reading temp1_input, and reading/writing
> temp1_max/min.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/sbtsi_temp.c | 265 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/hwmon/sbtsi_temp.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3c059fc23cd6..3d6a809700ae 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1522,6 +1522,16 @@ config SENSORS_SL28CPLD
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called sl28cpld-hwmon.
>  
> +config SENSORS_SBTSI
> +	tristate "Emulated SB-TSI temperature sensor"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for emulated temperature
> +	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called sbtsi_temp.
> +
>  config SENSORS_SHT15
>  	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
>  	depends on GPIOLIB || COMPILE_TEST
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 01ca5d3fbad4..ee8c037919da 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -160,6 +160,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>  obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
> +obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> new file mode 100644
> index 000000000000..6b0a7b9df1f3
> --- /dev/null
> +++ b/drivers/hwmon/sbtsi_temp.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
> + *                compliant AMD SoC temperature device.
> + *
> + * Copyright (c) 2020, Google Inc.
> + * Copyright (c) 2020, Kun Yi <kunyi@google.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +
> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT" registers are
> + * the integer part of a temperature value or limit, and "_DEC" registers are
> + * corresponding decimal parts.
> + */
> +#define SBTSI_REG_TEMP_INT		0x01 /* RO */
> +#define SBTSI_REG_STATUS		0x02 /* RO */
> +#define SBTSI_REG_CONFIG		0x03 /* RO */
> +#define SBTSI_REG_TEMP_HIGH_INT		0x07 /* RW */
> +#define SBTSI_REG_TEMP_LOW_INT		0x08 /* RW */
> +#define SBTSI_REG_TEMP_DEC		0x10 /* RW */
> +#define SBTSI_REG_TEMP_HIGH_DEC		0x13 /* RW */
> +#define SBTSI_REG_TEMP_LOW_DEC		0x14 /* RW */
> +
> +#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
> +
> +#define SBTSI_TEMP_MIN	0
> +#define SBTSI_TEMP_MAX	255875
> +
> +/* Each client has this additional data */
> +struct sbtsi_data {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +};
> +
> +/*
> + * From SB-TSI spec: CPU temperature readings and limit registers encode the
> + * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
> + * register encodes the base-2 of the integer portion, and the upper 3 bits of
> + * the "low byte" encode in base-2 the decimal portion.
> + *
> + * e.g. INT=0x19, DEC=0x20 represents 25.125 degrees Celsius
> + *
> + * Therefore temperature in millidegree Celsius =
> + *   (INT + DEC / 256) * 1000 = (INT * 8 + DEC / 32) * 125
> + */
> +static inline int sbtsi_reg_to_mc(s32 integer, s32 decimal)
> +{
> +	return ((integer << 3) + (decimal >> 5)) * 125;
> +}
> +
> +/*
> + * Inversely, given temperature in millidegree Celsius
> + *   INT = (TEMP / 125) / 8
> + *   DEC = ((TEMP / 125) % 8) * 32
> + * Caller have to make sure temp doesn't exceed 255875, the max valid value.
> + */
> +static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
> +{
> +	temp /= 125;
> +	*integer = temp >> 3;
> +	*decimal = (temp & 0x7) << 5;
> +}
> +
> +static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	struct sbtsi_data *data = dev_get_drvdata(dev);
> +	s32 temp_int, temp_dec;
> +	int err, reg_int, reg_dec;
> +	bool reading_input;
> +
> +	if (type != hwmon_temp)
> +		return -EINVAL;

Unnecessary check.

> +
> +	reading_input = false;
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		reading_input = true;
> +		/*
> +		 * ReadOrder bit specifies the reading order of integer and
> +		 * decimal part of CPU temp for atomic reads. If bit == 0,
> +		 * reading integer part triggers latching of the decimal part,
> +		 * so integer part should be read first. If bit == 1, read
> +		 * order should be reversed.
> +		 */
> +		err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
> +		if (err < 0)
> +			return err;
> +
> +		mutex_lock(&data->lock);
> +		if (err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT)) {
> +			temp_dec = i2c_smbus_read_byte_data(data->client,
> +							    SBTSI_REG_TEMP_DEC);
> +			temp_int = i2c_smbus_read_byte_data(data->client,
> +							    SBTSI_REG_TEMP_INT);
> +		} else {
> +			temp_int = i2c_smbus_read_byte_data(data->client,
> +							    SBTSI_REG_TEMP_INT);
> +			temp_dec = i2c_smbus_read_byte_data(data->client,
> +							    SBTSI_REG_TEMP_DEC);
> +		}
> +		mutex_unlock(&data->lock);
> +		break;
> +	case hwmon_temp_max:
> +		reg_int = SBTSI_REG_TEMP_HIGH_INT;
> +		reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
> +		break;
> +	case hwmon_temp_min:
> +		reg_int = SBTSI_REG_TEMP_LOW_INT;
> +		reg_dec = SBTSI_REG_TEMP_LOW_DEC;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!reading_input) {
> +		temp_int = i2c_smbus_read_byte_data(data->client, reg_int);
> +		temp_dec = i2c_smbus_read_byte_data(data->client, reg_dec);
> +	}

This adds unnecessary complexity. I would suggest to move the calls
to the case statements and drop reading_input as well as reg_int,
reg_dec.

Also, I just realized that the mutex is needed here as well, since
the values might be written while being read, which could result in
inconsistent read values. Example: Limit is changed from 100 to 99.75.
Since the integer value is written first, it is possible that 99.0
is returned.

> +
> +	if (temp_int < 0)
> +		return temp_int;
> +	if (temp_dec < 0)
> +		return temp_dec;
> +
> +	*val = sbtsi_reg_to_mc(temp_int, temp_dec);
> +
> +	return 0;
> +}
> +
> +static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long val)
> +{
> +	struct sbtsi_data *data = dev_get_drvdata(dev);
> +	int reg_int, reg_dec, err;
> +	u8 temp_int, temp_dec;
> +
> +	if (type != hwmon_temp)
> +		return -EINVAL;

This check is really unnecessary.

> +
> +	switch (attr) {
> +	case hwmon_temp_max:
> +		reg_int = SBTSI_REG_TEMP_HIGH_INT;
> +		reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
> +		break;
> +	case hwmon_temp_min:
> +		reg_int = SBTSI_REG_TEMP_LOW_INT;
> +		reg_dec = SBTSI_REG_TEMP_LOW_DEC;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
> +	mutex_lock(&data->lock);
> +	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
> +	err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
> +	if (err)
> +		goto exit;
> +
> +	err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
> +exit:
> +	mutex_unlock(&data->lock);
> +	return err;
> +}
> +
> +static umode_t sbtsi_is_visible(const void *data,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			return 0444;
> +		case hwmon_temp_min:
> +			return 0644;
> +		case hwmon_temp_max:
> +			return 0644;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *sbtsi_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX),
> +	NULL
> +};
> +
> +static const struct hwmon_ops sbtsi_hwmon_ops = {
> +	.is_visible = sbtsi_is_visible,
> +	.read = sbtsi_read,
> +	.write = sbtsi_write,
> +};
> +
> +static const struct hwmon_chip_info sbtsi_chip_info = {
> +	.ops = &sbtsi_hwmon_ops,
> +	.info = sbtsi_info,
> +};
> +
> +static int sbtsi_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct sbtsi_data *data;
> +
> +	data = devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->lock);
> +
> +	hwmon_dev =
> +		devm_hwmon_device_register_with_info(dev, client->name, data,

Line length limit is now 100 columns, so the above line split is unnecessary.

> +						     &sbtsi_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id sbtsi_id[] = {
> +	{"sbtsi", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbtsi_id);
> +
> +static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
> +	{
> +		.compatible = "amd,sbtsi",
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sbtsi_of_match);
> +
> +static struct i2c_driver sbtsi_driver = {
> +	.class = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = "sbtsi",
> +		.of_match_table = of_match_ptr(sbtsi_of_match),
> +	},
> +	.probe = sbtsi_probe,
> +	.id_table = sbtsi_id,
> +};
> +
> +module_i2c_driver(sbtsi_driver);
> +
> +MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
> +MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
> +MODULE_LICENSE("GPL");
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
