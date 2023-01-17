Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33D6C677F1
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Jan 2023 18:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjAQSf5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Jan 2023 13:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbjAQSbu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jan 2023 13:31:50 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D57530E9;
        Tue, 17 Jan 2023 10:03:30 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-142b72a728fso32791714fac.9;
        Tue, 17 Jan 2023 10:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7d32lIS5659adSUN+iGBcEeQw3rbNcJYLe52JOdmiBs=;
        b=C7OSeH0WQtcY4HD9YyT8kWNdvCs3c7i7LSInGN39SebJr9XKJx7JSDSmdcC8S4s+lK
         IdusFb8LWN9nlffgU9LI42RPw16F8B+QdmnMYqZSWgpy9CbCeaM4IxFd9JkRqlTeHcEe
         QY3+mNcn0OGGbFhTf9+agwz/cEufMbt3XQCBcAeXrbBWVFXzaOkarnwg3UKneuM5Iqet
         6XEDSyT1fzbs4oZjJ8PDU9QJK1oLRWkZkkbT7ZIVtd2X4LcfQN3YYEmRCbUUFbtasCSL
         fScUihr3l+bqO/mb7XGAPPNcSVZH08Tk1SiTiIXLFBJux8io2jZcOaAgVYGeswE55e44
         4Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7d32lIS5659adSUN+iGBcEeQw3rbNcJYLe52JOdmiBs=;
        b=Hh98v41fFlExd2yhNZZOj+L0Atths4R/62RLuzBV6IypCjFvwZ9Xfmxf8DgwnSugrD
         DpIyWNnFVaBbaxxaFjud7YmzM8t9XZyh5uDyA38MNIcQjwUG6yv9eLkKJutAGnO8sijE
         AKwy47iBVgxjaDnswkzb7h2Hj9Ew/553OlSSnK1O+uLxxMAewetuuTLcI2ugeU0CjU6G
         CuQOQMlhH4v0pWDQEZIVHAGe9mTmkP/wCJHdaypvIOodT0gd1PeOdhbqQbflVUa0mebz
         AhHSpR+/XhFpJ7knU88wo2pnHRdewaJSSiWZNzLsnEFGf+9d7N4hI8JNj5b9/JfJl3p3
         /qqA==
X-Gm-Message-State: AFqh2kqOylP/lsNPx9ODkZI3Yv+lJ29PI5VHiHxUsLL3QxcTrPNAFG3b
        fh6dZY/IBqX5ilsa5V6Cim3ezM47wi8=
X-Google-Smtp-Source: AMrXdXsPuVUno1dEGhtkQP1JoZz2SJs1789g5ykTB7L3WkAfYmNJxaPWzHic17cs36a+DId+kqpREg==
X-Received: by 2002:a05:6870:588c:b0:15f:6de0:b74 with SMTP id be12-20020a056870588c00b0015f6de00b74mr1367503oab.19.1673978590928;
        Tue, 17 Jan 2023 10:03:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i7-20020a9d6507000000b00683e80b5ca7sm16634570otl.38.2023.01.17.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:03:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 Jan 2023 10:03:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: add initial NXP MC34VR500 PMIC monitoring
 support
Message-ID: <20230117180309.GC2335664@roeck-us.net>
References: <20230117161340.1310936-1-dev@kicherer.org>
 <20230117161340.1310936-2-dev@kicherer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117161340.1310936-2-dev@kicherer.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 17, 2023 at 05:13:38PM +0100, Mario Kicherer wrote:
> This patch adds initial monitoring support for the MC34VR500 PMIC. In its

I forgot:

Documentation/process/submitting-patches.rst

Describe your changes
---------------------
...
Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

Guenter

> current form, input voltage and temperature alarms are reported to hwmon.
> 
> Datasheet:
>  - https://www.nxp.com/docs/en/data-sheet/MC34VR500.pdf
> 
> Changes since v1:
>  - included required #defines directly in the C file
>  - removed separate header file
>  - removed #defines for unimplemented sensors
>  - removed error log output
>  - use hwmon_device_register_with_info API
>  - cleaned probe function
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---
>  drivers/hwmon/Kconfig     |   7 ++
>  drivers/hwmon/Makefile    |   1 +
>  drivers/hwmon/mc34vr500.c | 245 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 drivers/hwmon/mc34vr500.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3176c33af6c6..69d4c1609494 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1166,6 +1166,13 @@ config SENSORS_MAX31790
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31790.
>  
> +config SENSORS_MC34VR500
> +	tristate "NXP MC34VR500 hardware monitoring driver"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the temperature and input
> +	  voltage sensors of the NXP MC34VR500.
> +
>  config SENSORS_MCP3021
>  	tristate "Microchip MCP3021 and compatibles"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index e2e4e87b282f..4bef13d16c66 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -149,6 +149,7 @@ obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
>  obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
>  obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
>  obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
> +obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
>  obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
>  obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
>  obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
> diff --git a/drivers/hwmon/mc34vr500.c b/drivers/hwmon/mc34vr500.c
> new file mode 100644
> index 000000000000..211dc44af42e
> --- /dev/null
> +++ b/drivers/hwmon/mc34vr500.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * An hwmon driver for the NXP MC34VR500 PMIC
> + *
> + * Author: Mario Kicherer <dev@kicherer.org>
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +#define MC34VR500_I2C_ADDR		0x08
> +#define MC34VR500_DEVICEID_VALUE	0x14
> +
> +/* INTSENSE0 */
> +#define ENS_BIT		BIT(0)
> +#define LOWVINS_BIT	BIT(1)
> +#define THERM110S_BIT	BIT(2)
> +#define THERM120S_BIT	BIT(3)
> +#define THERM125S_BIT	BIT(4)
> +#define THERM130S_BIT	BIT(5)
> +
> +#define MC34VR500_DEVICEID	0x00
> +
> +#define MC34VR500_SILICONREVID	0x03
> +#define MC34VR500_FABID		0x04
> +#define MC34VR500_INTSTAT0	0x05
> +#define MC34VR500_INTMASK0	0x06
> +#define MC34VR500_INTSENSE0	0x07
> +
> +struct mc34vr500_data {
> +	struct device *hwmon_dev;
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +};
> +
> +static irqreturn_t mc34vr500_process_interrupt(int irq, void *userdata)
> +{
> +	struct mc34vr500_data *data = (struct mc34vr500_data *)userdata;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, MC34VR500_INTSTAT0, &reg);
> +	if (ret < 0)
> +		return IRQ_HANDLED;
> +
> +	if (reg) {
> +		if (reg & LOWVINS_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_in,
> +					   hwmon_in_min_alarm, 0);
> +
> +		if (reg & THERM110S_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> +					   hwmon_temp_max_alarm, 0);
> +
> +		if (reg & THERM120S_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> +					   hwmon_temp_crit_alarm, 0);
> +
> +		if (reg & THERM130S_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> +					   hwmon_temp_emergency_alarm, 0);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static umode_t mc34vr500_is_visible(const void *data,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	switch (attr) {
> +	case hwmon_in_min_alarm:
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_crit_alarm:
> +	case hwmon_temp_emergency_alarm:
> +		return 0444;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mc34vr500_alarm_read(struct mc34vr500_data *data, int index,
> +				long *val)
> +{
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, MC34VR500_INTSTAT0, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = !!(reg & index);
> +
> +	/* write 1 to clear */
> +	reg = index;
> +	regmap_write(data->regmap, MC34VR500_INTSTAT0, reg);
> +
> +	return 0;
> +}
> +
> +static int mc34vr500_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *val)
> +{
> +	struct mc34vr500_data *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_min_alarm:
> +			return mc34vr500_alarm_read(data, LOWVINS_BIT, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max_alarm:
> +			return mc34vr500_alarm_read(data, THERM110S_BIT, val);
> +		case hwmon_temp_crit_alarm:
> +			return mc34vr500_alarm_read(data, THERM120S_BIT, val);
> +		case hwmon_temp_emergency_alarm:
> +			return mc34vr500_alarm_read(data, THERM130S_BIT, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *mc34vr500_info[] = {
> +	HWMON_CHANNEL_INFO(in, HWMON_I_MIN_ALARM),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM
> +			   | HWMON_T_EMERGENCY_ALARM),
> +	NULL,
> +};
> +
> +static const struct hwmon_ops mc34vr500_hwmon_ops = {
> +	.is_visible = mc34vr500_is_visible,
> +	.read = mc34vr500_read,
> +};
> +
> +static const struct hwmon_chip_info mc34vr500_chip_info = {
> +	.ops = &mc34vr500_hwmon_ops,
> +	.info = mc34vr500_info,
> +};
> +
> +static const struct regmap_config mc34vr500_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MC34VR500_INTSENSE0,
> +};
> +
> +static int mc34vr500_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct mc34vr500_data *data;
> +	struct device *hwmon_dev;
> +	int ret;
> +	unsigned int reg, revid, fabid;
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i2c(client, &mc34vr500_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	data = devm_kzalloc(dev, sizeof(struct mc34vr500_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = regmap;
> +	data->client = client;
> +
> +	ret = regmap_read(regmap, MC34VR500_DEVICEID, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (reg != MC34VR500_DEVICEID_VALUE)
> +		return -ENODEV;
> +
> +	ret = regmap_read(regmap, MC34VR500_SILICONREVID, &revid);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read(regmap, MC34VR500_FABID, &fabid);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(dev, "mc34vr500: revid 0x%x fabid 0x%x\n", revid, fabid);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &mc34vr500_chip_info,
> +							 NULL);
> +	data->hwmon_dev = hwmon_dev;
> +
> +	if (client->irq) {
> +		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +						mc34vr500_process_interrupt,
> +						IRQF_TRIGGER_RISING |
> +						IRQF_ONESHOT |
> +						IRQF_SHARED,
> +						dev_name(dev), data);
> +		if (ret)
> +			return ret;
> +
> +		/* clear interrupts */
> +		ret = regmap_write(regmap, MC34VR500_INTSTAT0, 0);
> +		if (ret)
> +			return ret;
> +
> +		/* unmask interrupts */
> +		ret = regmap_write(regmap, MC34VR500_INTMASK0,
> +				   ~(LOWVINS_BIT | THERM110S_BIT));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id mc34vr500_id[] = {
> +	{ "mc34vr500", 0 },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mc34vr500_id);
> +
> +static struct i2c_driver mc34vr500_driver = {
> +	.driver = {
> +		   .name = "mc34vr500",
> +		    },
> +	.probe_new = mc34vr500_probe,
> +	.id_table = mc34vr500_id,
> +};
> +
> +module_i2c_driver(mc34vr500_driver);
> +
> +MODULE_AUTHOR("Mario Kicherer <dev@kicherer.org>");
> +
> +MODULE_DESCRIPTION("MC34VR500 driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 
