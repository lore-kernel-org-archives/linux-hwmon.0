Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B129C677F1
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Jan 2023 15:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjAPP4A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:56:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjAPPzp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Jan 2023 10:55:45 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FB4227B9
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Jan 2023 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1673884524; bh=wWevBSKOntVjpibMBCbXnwkxqSQbB2wgEjL4e0i0uJc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=E9Ez3Zwb/Xv6KQAawXHro8tH4VFElfgeTgJum2PswNGxw7mO3XlOO/MYD/0ga6pRy
         xOPTAtDO7lrvjUD2OR6Ir9jb/HNPtuXoFcMc0bV3wPOon2oQ7eNczD7yH+HIv7wNdg
         mJEH54EC22yq/TrGNv2I/1LA6TdDU7PdrZ7+Csbhzcm1glNyqBiKDbccfzvOQ7DR+Z
         kckOI3HWqEwADHqMg0zirQ6Nr6GWqIPap0CmZc7iydR8WY94IDBwZU7QRk01w0HjIl
         xzYn82ZJzcK1wUc+0RZYZc0v/OAZi8E9GG2ph0ebMnwCdt5UAJNvHRIe9kCeF43mtb
         duq9l4b/UkVTQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.82.67] ([141.76.181.36]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQv8x-1p3L3s3RX5-00O0Tf; Mon, 16
 Jan 2023 16:55:23 +0100
Subject: Re: [PATCH] hwmon: add initial NXP MC34VR500 PMIC monitoring support
To:     Mario Kicherer <dev@kicherer.org>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net
References: <20230116134258.3136852-1-dev@kicherer.org>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <47b32a54-dd4a-74ab-cff0-6bdfe11e1ec5@gmx.de>
Date:   Mon, 16 Jan 2023 16:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20230116134258.3136852-1-dev@kicherer.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:EyttrJUtV4sBQC5Bn9t+3gg1/HGkiebxC/f6v8lWKT9p9Zg/Ho6
 80Z0LY0JPq/IxP+EYCFqI5X4MW8pJxOHIut1wASCvrR5pV4+v1NpeUmCSNynDzGEFLV9DwX
 v4k0ySeMJNsySOFug2tq49CZ3Awk0wCoWoJBgq3XsdEge0uoNsSNmW4pWDLJ/EQPxG0lZ9u
 8RSe4cEBEMR7PN4vGLurA==
UI-OutboundReport: notjunk:1;M01:P0:CM4ZVmhhyN0=;aG4chwHgkHQTxXD3NPpMZYvriUa
 luo8dkH3vsb95s47UWyJPMD6UN0yIfk7FS0hYqeBW8D+FdwULJVQizaKjPRAq9EqTsjGsP8w4
 N67+gX5BlJv4zLL7v+qwxFgiEdvIcqsYrbmuiK1Sizoh34NqQYDLyUHfiSSa3HiIo85RPHJng
 Kjn6KyNfnVmOjryPc9AF0TboG0UJnlVPccudXsmLgMtbJxdnk7u23iCX+SBSQxuRzEJN5ElSx
 HKpiH0OrAxe+b5FlBT4e33EL5zD5dvdVELFnkJP5yX9Rohzb2634a9/FVanpeldx8AaNEk2YS
 fHTnAxDEvfszXwd30akgFYti7q84cTQOFblaVq7YTxDkNNyZvyMqucBS8GfSgy7ptk+y08KmX
 29apIZzickVDwAGkij/XUramwGS91yfhkBdUzr1dDy0XzEzuay/gasS24a3BpnUITq9CzRKdz
 SOX7fnfLL52RCzILKbSID8+kX6p4eKo7yGCz28u410Yi64FQAMYZ3SFVTGaWEERLp9vWjzR9d
 UEc5qKYr17jmor03jfbN8/5ZeFkuB0JDN25UJ3kTNmCju+eqbT+3Zr89Ax05tpxrSQTeDb8DN
 Z6K8MVoq8db/FP2zGpUW074Yi13JL1HF1vwqUs2QKiYpPf7CyeiKQJsBP73qoksSO4qEEjJyw
 8X19orgrqYkpQ8N07AqVNPGSlI1oCxHyUyjjmBHkZoKGsaZPPOVhDbyio/yBPstMThAgWte3H
 o0X/r/Y4jmfmK6GPSE3dP1Qa2FMOhRtv1lCKRDhusP+TWX0oQNJEhhfwWo7+bTTGmrzSIYP3h
 jmaTiCUOAcclNNM5/lUuLtHQ/YhtisTddTv4l70XxeERcWRONMXWSoUwKmGptnxj8kcQxdbdv
 X7YfGotr7Kvm7NnXtu1Ujbklkr6QqngIbxUeY5pCBhaZx6piNHAKdD52Cx5e8QetQ+vYTXku6
 5tKe1wsm+L59N/+OB6MBJALfdgw=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 16.01.23 um 14:42 schrieb Mario Kicherer:

> This patch adds initial monitoring support for the MC34VR500 PMIC. In it=
s
> current form, input voltage and temperature events are reported to hwmon=
.
> Other interrupts only generate a generic entry in the kernel log so far.
>
> The header file is copied from U-Boot and placed next to the C file as t=
he
> chip is usually only configured by the bootloader and it is unlikely tha=
t
> it will be used by another Linux subsystem. If I should remove unused pa=
rts
> or move the file to another path, let me know.
>
> Datasheet:
>   - https://www.nxp.com/docs/en/data-sheet/MC34VR500.pdf
>
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---
>   drivers/hwmon/Kconfig          |   7 +
>   drivers/hwmon/Makefile         |   1 +
>   drivers/hwmon/mc34vr500.c      | 382 +++++++++++++++++++++++++++++++++
>   drivers/hwmon/mc34vr500_pmic.h | 172 +++++++++++++++
>   4 files changed, 562 insertions(+)
>   create mode 100644 drivers/hwmon/mc34vr500.c
>   create mode 100644 drivers/hwmon/mc34vr500_pmic.h
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3176c33af6c6..b917c2528b62 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2350,6 +2350,13 @@ config SENSORS_INTEL_M10_BMC_HWMON
>   	  sensors monitor various telemetry data of different components on t=
he
>   	  card, e.g. board temperature, FPGA core temperature/voltage/current=
.
>
> +config SENSORS_MC34VR500
> +	tristate "NXP MC34VR500 hardware monitoring driver"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the temperature and input
> +	  voltage sensors of the NXP MC34VR500.
> +
>   if ACPI
>
>   comment "ACPI drivers"
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index e2e4e87b282f..99e8cd8275c5 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -216,6 +216,7 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+=3D w83l786ng.o
>   obj-$(CONFIG_SENSORS_WM831X)	+=3D wm831x-hwmon.o
>   obj-$(CONFIG_SENSORS_WM8350)	+=3D wm8350-hwmon.o
>   obj-$(CONFIG_SENSORS_XGENE)	+=3D xgene-hwmon.o
> +obj-$(CONFIG_SENSORS_MC34VR500)	+=3D mc34vr500.o
>
>   obj-$(CONFIG_SENSORS_OCC)	+=3D occ/
>   obj-$(CONFIG_SENSORS_PECI)	+=3D peci/
> diff --git a/drivers/hwmon/mc34vr500.c b/drivers/hwmon/mc34vr500.c
> new file mode 100644
> index 000000000000..bddf108d05ae
> --- /dev/null
> +++ b/drivers/hwmon/mc34vr500.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * An hwmon driver for the NXP MC34VR500
> + *
> + * Copyright 2022 Mario Kicherer <dev@kicherer.org>
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include "mc34vr500_pmic.h"
> +
> +#define MC34VR500_DEVICEID_VALUE	0x14
> +
> +// INTSENSE0
> +#define ENS_BIT		(1<<0)
> +#define LOWVINS_BIT	(1<<1)
> +#define THERM110S_BIT	(1<<2)
> +#define THERM120S_BIT	(1<<3)
> +#define THERM125S_BIT	(1<<4)
> +#define THERM130S_BIT	(1<<5)
> +
> +// INTSENSE1
> +#define SW1FAULTS1_BIT	(1<<0)
> +#define SW1FAULTS2_BIT	(1<<1)
> +#define SW1FAULTS3_BIT	(1<<2)
> +#define SW2FAULTS_BIT	(1<<3)
> +#define SW3FAULTS1_BIT	(1<<4)
> +#define SW3FAULTS2_BIT	(1<<5)
> +#define SW4FAULTS_BIT	(1<<6)
> +
> +// INTSENSE4
> +#define LDO1FAULTS_BIT	(1<<1)
> +#define LDO2FAULTS_BIT	(1<<2)
> +#define LDO3FAULTS_BIT	(1<<3)
> +#define LDO4FAULTS_BIT	(1<<4)
> +#define LDO5FAULTS_BIT	(1<<5)

Maybe you could use BIT() here?

> +
> +struct mc34vr500_data {
> +	struct i2c_client	*client;
> +	struct regmap *regmap;
> +};
> +
> +static ssize_t mc34vr500_bool_show(struct device *dev,
> +				   struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> +	struct mc34vr500_data *data =3D (struct mc34vr500_data *) dev_get_drvd=
ata(dev);
> +	unsigned int reg;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, MC34VR500_INTSENSE0 + (attr->index >=
> 8), &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg &=3D (attr->index & 0xff);
> +
> +	return sysfs_emit(buf, "%d\n", !!reg);
> +}
> +
> +// INTSENSE0
> +static SENSOR_DEVICE_ATTR_RO(in1_alarm, mc34vr500_bool, 0x00 | LOWVINS_=
BIT);
> +static SENSOR_DEVICE_ATTR_RO(temp110_alarm, mc34vr500_bool, 0x00 | THER=
M110S_BIT);
> +static SENSOR_DEVICE_ATTR_RO(temp120_alarm, mc34vr500_bool, 0x00 | THER=
M120S_BIT);
> +static SENSOR_DEVICE_ATTR_RO(temp125_alarm, mc34vr500_bool, 0x00 | THER=
M125S_BIT);
> +static SENSOR_DEVICE_ATTR_RO(temp130_alarm, mc34vr500_bool, 0x00 | THER=
M130S_BIT);

Does the chip support up to 130 temperature channels? If no, then maybe yo=
u could
name them "temp1_*", ..., "temp5_*" and use tempX_label for the labeling.

> +
> +// INTSENSE1
> +static SENSOR_DEVICE_ATTR_RO(curr1_alarm, mc34vr500_bool, 0x300 | SW1FA=
ULTS1_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr2_alarm, mc34vr500_bool, 0x300 | SW1FA=
ULTS2_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr3_alarm, mc34vr500_bool, 0x300 | SW1FA=
ULTS3_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr4_alarm, mc34vr500_bool, 0x300 | SW2FA=
ULTS_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr5_alarm, mc34vr500_bool, 0x300 | SW3FA=
ULTS1_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr6_alarm, mc34vr500_bool, 0x300 | SW3FA=
ULTS2_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr7_alarm, mc34vr500_bool, 0x300 | SW4FA=
ULTS_BIT);
> +
> +// INTSENSE4
> +static SENSOR_DEVICE_ATTR_RO(curr8_alarm, mc34vr500_bool, 0x600 | LDO1F=
AULTS_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr9_alarm, mc34vr500_bool, 0x600 | LDO2F=
AULTS_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr10_alarm, mc34vr500_bool, 0x600 | LDO3=
FAULTS_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr11_alarm, mc34vr500_bool, 0x600 | LDO4=
FAULTS_BIT);
> +static SENSOR_DEVICE_ATTR_RO(curr12_alarm, mc34vr500_bool, 0x600 | LDO5=
FAULTS_BIT);
> +
> +static struct attribute *mc34vr500_attrs[] =3D {
> +	&sensor_dev_attr_in1_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp110_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp120_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp125_alarm.dev_attr.attr,
> +	&sensor_dev_attr_temp130_alarm.dev_attr.attr,
> +
> +	&sensor_dev_attr_curr1_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr2_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr3_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr4_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr5_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr6_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr7_alarm.dev_attr.attr,
> +
> +	&sensor_dev_attr_curr8_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr9_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr10_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr11_alarm.dev_attr.attr,
> +	&sensor_dev_attr_curr12_alarm.dev_attr.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(mc34vr500);

You should use the new hwmon_device_register_with_info() API, which does
the sysfs handling for you.

> +
> +static irqreturn_t mc34vr500_process_interrupt(int irq, void *userdata)
> +{
> +	struct mc34vr500_data *data =3D (struct mc34vr500_data *) userdata;
> +	struct i2c_client *client =3D data->client;
> +	unsigned int reg;
> +	int ret;
> +
> +	pr_debug("mc34vr500: received interrupt\n");
> +
> +	ret =3D regmap_read(data->regmap, MC34VR500_INTSTAT0, &reg);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "unable to read mc34vr500 intsense0 register\n"=
);

Maybe use some sort of ratelimiting here? Otherwise it could potentially f=
ill up
the kernel log with redundant messages. Or maybe just omit this and all th=
e other
error messages?

> +		return ret;
> +	}
> +
> +	if (reg) {
> +		pr_warn("mc34vr500: interrupt intstat0 %u\n", reg);

Same as above, it could fill up the kernel log is the alarm interrupt is t=
riggered fast enough.

> +
> +		if (reg & LOWVINS_BIT) {
> +			ret =3D hwmon_notify_event(&client->dev, hwmon_in,
> +						 hwmon_in_alarm, 1);
> +			if (ret)
> +				dev_err(&client->dev,
> +					"mc34vr500: error, hwmon_notify_event() failed: %d\n",
> +					ret);
> +		}
> +
> +		if (reg & THERM110S_BIT) {
> +			ret =3D hwmon_notify_event(&client->dev, hwmon_temp,
> +						 hwmon_temp_alarm, 110);
> +			if (ret)
> +				dev_err(&client->dev,
> +					"mc34vr500: error, hwmon_notify_event() failed: %d\n",
> +					ret);
> +		}
> +
> +		reg =3D 0;
> +		ret =3D regmap_write(data->regmap, MC34VR500_INTSTAT0, reg);
> +		if (ret) {
> +			dev_err(&client->dev, "unable to enable intmask0 interrupts\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D regmap_read(data->regmap, MC34VR500_INTSTAT1, &reg);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "unable to read mc34vr500 intsense1 register\n"=
);
> +		return ret;
> +	}
> +
> +	if (reg) {
> +		pr_warn("mc34vr500: interrupt intstat1 %u\n", reg);
> +
> +		reg =3D 0;
> +		ret =3D regmap_write(data->regmap, MC34VR500_INTSTAT1, reg);
> +		if (ret) {
> +			dev_err(&client->dev, "unable to enable intmask1 interrupts\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D regmap_read(data->regmap, MC34VR500_INTSTAT4, &reg);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "unable to read mc34vr500 intsense4 register\n"=
);
> +		return ret;
> +	}
> +
> +	if (reg) {
> +		pr_warn("mc34vr500: interrupt intstat4 %u\n", reg);
> +
> +		reg =3D 0;
> +		ret =3D regmap_write(data->regmap, MC34VR500_INTSTAT4, reg);
> +		if (ret) {
> +			dev_err(&client->dev, "unable to enable intmask4 interrupts\n");
> +			return ret;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct regmap_config mc34vr500_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D MC34VR500_PWRGD_EN,
> +};
> +
> +static int mc34vr500_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct mc34vr500_data *data;
> +	struct device *hwmon_dev;
> +	int ret;
> +	unsigned int reg, revid, fabid;
> +	struct regmap *regmap;
> +	u32 interrupt_mask;
> +
> +	regmap =3D devm_regmap_init_i2c(client, &mc34vr500_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to allocate register map\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	data =3D devm_kzalloc(dev, sizeof(struct mc34vr500_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap =3D regmap;
> +	data->client =3D client;
> +
> +	ret =3D regmap_read(regmap, MC34VR500_DEVICEID, &reg);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read config register\n");
> +
> +		return ret;
> +	}
> +
> +	if (reg !=3D MC34VR500_DEVICEID_VALUE) {
> +		dev_err(dev, "invalid config register value 0x%x\n", reg);
> +
> +		return -ENODEV;
> +	}
> +
> +	ret =3D regmap_read(regmap, MC34VR500_SILICONREVID, &revid);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read mc34vr500 revid register\n");
> +		return ret;
> +	}
> +
> +	ret =3D regmap_read(regmap, MC34VR500_FABID, &fabid);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read mc34vr500 fabid register\n");
> +		return ret;
> +	}
> +
> +	pr_notice("mc34vr500: revid 0x%x fabid 0x%x\n", revid, fabid);
> +
> +
> +	ret =3D of_property_read_u32(dev->of_node,
> +				   "interrupt-mask",
> +				   &interrupt_mask);
> +	if (ret =3D=3D -EINVAL) {
> +		interrupt_mask =3D 0;
> +	} else if (ret) {
> +		dev_err(dev, "Error reading interrupt_mask\n");
> +		return ret;
> +	}
> +
> +	ret =3D regmap_read(regmap, MC34VR500_INTSTAT0, &reg);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read mc34vr500 intstat0 register\n");
> +		return ret;
> +	}
> +	reg =3D reg & (~interrupt_mask);
> +
> +	if (reg)
> +		pr_notice("mc34vr500: intstat0: 0x%x\n", reg);
> +
> +	if (reg & LOWVINS_BIT)
> +		pr_notice("mc34vr500: low input voltage detected\n");
> +
> +	if (reg & THERM130S_BIT)
> +		pr_notice("mc34vr500: temperature >=3D 130=C2=B0c\n");
> +	else if (reg & THERM125S_BIT)
> +		pr_notice("mc34vr500: temperature >=3D 125=C2=B0c\n");
> +	else if (reg & THERM120S_BIT)
> +		pr_notice("mc34vr500: temperature >=3D 120=C2=B0c\n");
> +	else if (reg & THERM110S_BIT)
> +		pr_notice("mc34vr500: temperature >=3D 110=C2=B0c\n");
> +
> +	ret =3D regmap_read(regmap, MC34VR500_INTSTAT1, &reg);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read mc34vr500 intstat1 register\n");
> +		return ret;
> +	}
> +	reg =3D reg & ((~interrupt_mask) >> 8);
> +
> +	if (reg)
> +		pr_notice("mc34vr500: intstat1: 0x%x\n", reg);
> +
> +	ret =3D regmap_read(regmap, MC34VR500_INTSTAT4, &reg);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read mc34vr500 intstat4 register\n");
> +		return ret;
> +	}
> +	reg =3D reg & ((~interrupt_mask) >> 16);
> +
> +	if (reg)
> +		pr_notice("mc34vr500: intstat4: 0x%x\n", reg);
> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, client->name=
,
> +							   data,
> +							   mc34vr500_groups);
> +
> +	if (client->irq) {
> +		pr_notice("mc34vr500: enabling IRQ...\n");
> +
> +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +						mc34vr500_process_interrupt,
> +						IRQF_TRIGGER_RISING |
> +							IRQF_ONESHOT |
> +							IRQF_SHARED,
> +						dev_name(dev),
> +						data);
> +		if (ret) {
> +			dev_err(dev, "Error requesting irq\n");
> +			return ret;
> +		}
> +
> +		/* clear interrupts */
> +		reg =3D 0;
> +		ret =3D regmap_write(regmap, MC34VR500_INTSTAT0, reg);
> +		if (ret) {
> +			dev_err(dev, "unable to write intstat0 register\n");
> +			return ret;
> +		}
> +
> +		/* enable interrupts */
> +		ret =3D regmap_write(regmap, MC34VR500_INTMASK0, interrupt_mask & 0xf=
f);
> +		if (ret) {
> +			dev_err(dev, "unable to enable intmask0 interrupts\n");
> +			return ret;
> +		}
> +
> +		reg =3D 0;
> +		ret =3D regmap_write(regmap, MC34VR500_INTSTAT1, reg);
> +		if (ret) {
> +			dev_err(dev, "unable to write intstat1 register\n");
> +			return ret;
> +		}
> +
> +		ret =3D regmap_write(regmap, MC34VR500_INTMASK1, (interrupt_mask >> 8=
) & 0xff);
> +		if (ret) {
> +			dev_err(dev, "unable to enable intmask1 interrupts\n");
> +			return ret;
> +		}
> +
> +		reg =3D 0;
> +		ret =3D regmap_write(regmap, MC34VR500_INTSTAT4, reg);
> +		if (ret) {
> +			dev_err(dev, "unable to write intstat1 register\n");
> +			return ret;
> +		}
> +
> +		ret =3D regmap_write(regmap, MC34VR500_INTMASK4, (interrupt_mask >> 1=
6) & 0xff);
> +		if (ret) {
> +			dev_err(dev, "unable to enable intmask1 interrupts\n");
> +			return ret;
> +		}
> +	}
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id mc34vr500_id[] =3D {
> +	{ "mc34vr500", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, mc34vr500_id);
> +
> +static struct i2c_driver mc34vr500_driver =3D {
> +	.driver =3D {
> +		.name	=3D "mc34vr500",
> +	},
> +	.probe_new =3D mc34vr500_probe,
> +	.id_table =3D mc34vr500_id,
> +};
> +
> +module_i2c_driver(mc34vr500_driver);
> +
> +MODULE_AUTHOR("Mario Kicherer <dev@kicherer.org>");
> +
> +MODULE_DESCRIPTION("MC34VR500 driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/mc34vr500_pmic.h b/drivers/hwmon/mc34vr500_pm=
ic.h
> new file mode 100644
> index 000000000000..1543ac692d72
> --- /dev/null
> +++ b/drivers/hwmon/mc34vr500_pmic.h
> @@ -0,0 +1,172 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2016 Freescale Semiconductor, Inc.
> + * Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
> + */
> +
> +#ifndef __MC34VR500_H_
> +#define __MC34VR500_H_
> +
> +#define MC34VR500_I2C_ADDR	0x08
> +
> +/* Drivers name */
> +#define MC34VR500_REGULATOR_DRIVER	"mc34vr500_regulator"
> +
> +/* Register map */
> +enum {
> +	MC34VR500_DEVICEID		=3D 0x00,
> +
> +	MC34VR500_SILICONREVID		=3D 0x03,
> +	MC34VR500_FABID,
> +	MC34VR500_INTSTAT0,
> +	MC34VR500_INTMASK0,
> +	MC34VR500_INTSENSE0,
> +	MC34VR500_INTSTAT1,
> +	MC34VR500_INTMASK1,
> +	MC34VR500_INTSENSE1,
> +
> +	MC34VR500_INTSTAT4		=3D 0x11,
> +	MC34VR500_INTMASK4,
> +	MC34VR500_INTSENSE4,
> +
> +	MC34VR500_PWRCTL		=3D 0x1B,
> +
> +	MC34VR500_SW1VOLT		=3D 0x2E,
> +	MC34VR500_SW1STBY,
> +	MC34VR500_SW1OFF,
> +	MC34VR500_SW1MODE,
> +	MC34VR500_SW1CONF,
> +	MC34VR500_SW2VOLT,
> +	MC34VR500_SW2STBY,
> +	MC34VR500_SW2OFF,
> +	MC34VR500_SW2MODE,
> +	MC34VR500_SW2CONF,
> +
> +	MC34VR500_SW3VOLT		=3D 0x3C,
> +	MC34VR500_SW3STBY,
> +	MC34VR500_SW3OFF,
> +	MC34VR500_SW3MODE,
> +	MC34VR500_SW3CONF,
> +
> +	MC34VR500_SW4VOLT		=3D 0x4A,
> +	MC34VR500_SW4STBY,
> +	MC34VR500_SW4OFF,
> +	MC34VR500_SW4MODE,
> +	MC34VR500_SW4CONF,
> +
> +	MC34VR500_REFOUTCRTRL		=3D 0x6A,
> +
> +	MC34VR500_LDO1CTL		=3D 0x6D,
> +	MC34VR500_LDO2CTL,
> +	MC34VR500_LDO3CTL,
> +	MC34VR500_LDO4CTL,
> +	MC34VR500_LDO5CTL,
> +
> +	MC34VR500_PAGE_REGISTER		=3D 0x7F,
> +
> +	/* Internal RAM */
> +	MC34VR500_SW1_VOLT		=3D 0xA8,
> +	MC34VR500_SW1_SEQ,
> +	MC34VR500_SW1_CONFIG,
> +
> +	MC34VR500_SW2_VOLT		=3D 0xAC,
> +	MC34VR500_SW2_SEQ,
> +	MC34VR500_SW2_CONFIG,
> +
> +	MC34VR500_SW3_VOLT		=3D 0xB0,
> +	MC34VR500_SW3_SEQ,
> +	MC34VR500_SW3_CONFIG,
> +
> +	MC34VR500_SW4_VOLT		=3D 0xB8,
> +	MC34VR500_SW4_SEQ,
> +	MC34VR500_SW4_CONFIG,
> +
> +	MC34VR500_REFOUT_SEQ		=3D 0xC4,
> +
> +	MC34VR500_LDO1_VOLT		=3D 0xCC,
> +	MC34VR500_LDO1_SEQ,
> +
> +	MC34VR500_LDO2_VOLT		=3D 0xD0,
> +	MC34VR500_LDO2_SEQ,
> +
> +	MC34VR500_LDO3_VOLT		=3D 0xD4,
> +	MC34VR500_LDO3_SEQ,
> +
> +	MC34VR500_LDO4_VOLT		=3D 0xD8,
> +	MC34VR500_LDO4_SEQ,
> +
> +	MC34VR500_LDO5_VOLT		=3D 0xDC,
> +	MC34VR500_LDO5_SEQ,
> +
> +	MC34VR500_PU_CONFIG1		=3D 0xE0,
> +
> +	MC34VR500_TBB_POR		=3D 0xE4,
> +
> +	MC34VR500_PWRGD_EN		=3D 0xE8,
> +
> +	MC34VR500_NUM_OF_REGS,
> +};
> +
> +/* Registor offset based on SWxVOLT register */
> +#define MC34VR500_VOLT_OFFSET	0
> +#define MC34VR500_STBY_OFFSET	1
> +#define MC34VR500_OFF_OFFSET	2
> +#define MC34VR500_MODE_OFFSET	3
> +#define MC34VR500_CONF_OFFSET	4
> +
> +#define SW_MODE_MASK	0xf
> +#define SW_MODE_SHIFT	0
> +
> +#define LDO_VOL_MASK	0xf
> +#define LDO_EN		(1 << 4)
> +#define LDO_MODE_SHIFT	4
> +#define LDO_MODE_MASK	(1 << 4)
> +#define LDO_MODE_OFF	0
> +#define LDO_MODE_ON	1
> +
> +#define REFOUTEN	(1 << 4)
> +
> +/*
> + * Regulator Mode Control
> + *
> + * OFF: The regulator is switched off and the output voltage is dischar=
ged.
> + * PFM: In this mode, the regulator is always in PFM mode, which is use=
ful
> + *      at light loads for optimized efficiency.
> + * PWM: In this mode, the regulator is always in PWM mode operation
> + *	regardless of load conditions.
> + * APS: In this mode, the regulator moves automatically between pulse
> + *	skipping mode and PWM mode depending on load conditions.
> + *
> + * SWxMODE[3:0]
> + * Normal Mode  |  Standby Mode	|      value
> + *   OFF		OFF		0x0
> + *   PWM		OFF		0x1
> + *   PFM		OFF		0x3
> + *   APS		OFF		0x4
> + *   PWM		PWM		0x5
> + *   PWM		APS		0x6
> + *   APS		APS		0x8
> + *   APS		PFM		0xc
> + *   PWM		PFM		0xd
> + */
> +#define OFF_OFF		0x0
> +#define PWM_OFF		0x1
> +#define PFM_OFF		0x3
> +#define APS_OFF		0x4
> +#define PWM_PWM		0x5
> +#define PWM_APS		0x6
> +#define APS_APS		0x8
> +#define APS_PFM		0xc
> +#define PWM_PFM		0xd
> +
> +enum swx {
> +	SW1 =3D 0,
> +	SW2,
> +	SW3,
> +	SW4,
> +};
> +
> +int mc34vr500_get_sw_volt(uint8_t sw);
> +int mc34vr500_set_sw_volt(uint8_t sw, int sw_volt);
> +int power_mc34vr500_init(unsigned char bus);
> +#endif /* __MC34VR500_PMIC_H_ */
