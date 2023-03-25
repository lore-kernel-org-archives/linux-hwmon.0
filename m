Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D07EC6FD1F
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Mar 2023 13:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjCYNUt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Mar 2023 09:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjCYNUs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Mar 2023 09:20:48 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086F5BDED
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Mar 2023 06:20:46 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-544b959a971so85219607b3.3
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Mar 2023 06:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vvbW5ewoF05zWUtgve8qVhCT0Fkw348pDN6Zc7bw/g=;
        b=CF+n9wwRuWdg1oJdzpS0G/7Eqk0+QdpLAAr5D49NccsczCTZRRk435Q/gdLp6biV8j
         NF21dM7SwtMShvjUL+Ya7EwhTezqaXK7ZTirYmfuA1+kC2YmqwdisLKYqt3i9sKJ2TMi
         4H7eRv6n+yN5sYXTma8DzqYpSK95zeRj+wDvhSczU+tHZnT0pvp34tQsaxb1mwAnb/+T
         riSADmCaJ72t6mK/ATAZ5t0HTNgtc7VGH0Y5zh+TGCLjwC4ssClyYH1bRXPGsyyVhDhD
         6JEeEGnKdvPUFFalFjgVbdTWT+OpzwDcogKuHg08bTJ8s2JM5mcw6dWq/wWBCU9nnMXW
         UXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vvbW5ewoF05zWUtgve8qVhCT0Fkw348pDN6Zc7bw/g=;
        b=kQmJDmVtYi03FpXBExinQ7f6RPeBXHfIAkEh+v5aRm09YfyGiNYgWX2Tmas/HluZAl
         WAAd/CcVdyR3tSb0WKcsNYy+VUxeF3tG6rH/hSwTOze2pkl95+UVdnSe145Mp+sHeYRL
         97ZhNbChCVg8NMe+bc9kEzPB1ZTFnP+nF4bdzKOplaC4Yovq+0CrPCyI+PQIIoK+tLuP
         +NEcx4Qd3ejo16sC6FQmD9Pd+I/xq2sPNDGo9k+ajTpR9XDPaT7B0gXJ2QvLMskrRVRw
         8OkNuIdZ+p6GiFeyAvwtbtFIh3LKwvgfp/XeSCEfGEyglFJxbfUbx3De+NA+JAhV3jYO
         cFuQ==
X-Gm-Message-State: AAQBX9fifWmUSuJC1WphMWFeXawU2yT/YrOxRvQIGdB+UIOwundUVKJE
        bp/GX57U+k71ASDspN8TtT8=
X-Google-Smtp-Source: AKy350bC/h1whIPG7SsOogmQYn5pGvYXSrsgT6XZkq0qck+gP/IFMpYPCtTAe5psPy9YVpPNaZ73GQ==
X-Received: by 2002:a81:6c17:0:b0:541:6ff1:f492 with SMTP id h23-20020a816c17000000b005416ff1f492mr5392073ywc.14.1679750444648;
        Sat, 25 Mar 2023 06:20:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o63-20020a257342000000b00b7767ca7466sm1095896ybc.3.2023.03.25.06.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:20:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 25 Mar 2023 06:20:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Il Han <corone.il.han@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Driver for Sensylink CTF2304
Message-ID: <d42f2af1-dad5-40e2-84f0-9b8dac18210c@roeck-us.net>
References: <20230325032114.1865304-1-il.han@nosdev3.dzsi.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325032114.1865304-1-il.han@nosdev3.dzsi.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Mar 25, 2023 at 12:21:14PM +0900, Il Han wrote:
> From: Il Han <corone.il.han@gmail.com>
> 
> The driver supports the Sensylink CTF2304.
> 
> Signed-off-by: Il Han <corone.il.han@gmail.com>
> ---
>  Documentation/hwmon/ctf2304.rst |  41 +++

Needs to be added to Documentation/hwmon/index.rst.

>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/ctf2304.c         | 554 ++++++++++++++++++++++++++++++++
>  4 files changed, 606 insertions(+)
>  create mode 100644 Documentation/hwmon/ctf2304.rst
>  create mode 100644 drivers/hwmon/ctf2304.c
> 
> diff --git a/Documentation/hwmon/ctf2304.rst b/Documentation/hwmon/ctf2304.rst
> new file mode 100644
> index 000000000000..d0e9ef9ea52e
> --- /dev/null
> +++ b/Documentation/hwmon/ctf2304.rst
> @@ -0,0 +1,41 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver ctf2304
> +=====================
> +
> +Supported chips:
> +
> +  * Sensylink CTF2304
> +
> +    Prefix: 'ctf2304'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +Author: Il Han <corone.il.han@gmail.com>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for the Sensylink CTF2304 chip.
> +
> +The CTF2304 controls the speeds of up to four fans using four independent
> +PWM outputs with local and remote temperature and remote voltage sensing.
> +
> +
> +Sysfs entries
> +-------------
> +
> +================== === =======================================================
> +fan[1-4]_input     RO  fan tachometer speed in RPM
> +fan[1-4]_target    RW  desired fan speed in RPM
> +fan[1-4]_div       RW  sets the RPM range of the fan.
> +pwm[1-4]_enable    RW  regulator mode,
> +                       0=auto temperature mode, 1=manual mode, 2=rpm mode
> +pwm[1-4]           RW  read: current pwm duty cycle,
> +                       write: target pwm duty cycle (0-255)
> +in[1-8]_input      RO  measured output voltage
> +temp[1-9]_input    RO  measured temperature
> +================== === =======================================================
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5b3b76477b0e..da9fbb0f8af3 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -474,6 +474,16 @@ config SENSORS_CORSAIR_PSU
>  	  This driver can also be built as a module. If so, the module
>  	  will be called corsair-psu.
>  
> +config SENSORS_CTF2304
> +	tristate "Sensylink CTF2304 sensor chip"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for PWM and Fan Controller
> +	  with temperature and voltage sensing.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called ctf2304.
> +
>  config SENSORS_DRIVETEMP
>  	tristate "Hard disk drives with temperature sensors"
>  	depends on SCSI && ATA
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 88712b5031c8..3742b52f032d 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -60,6 +60,7 @@ obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
>  obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
>  obj-$(CONFIG_SENSORS_CORSAIR_CPRO) += corsair-cpro.o
>  obj-$(CONFIG_SENSORS_CORSAIR_PSU) += corsair-psu.o
> +obj-$(CONFIG_SENSORS_CTF2304)	+= ctf2304.o
>  obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
>  obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
>  obj-$(CONFIG_SENSORS_DELL_SMM)	+= dell-smm-hwmon.o
> diff --git a/drivers/hwmon/ctf2304.c b/drivers/hwmon/ctf2304.c
> new file mode 100644
> index 000000000000..5788740a57e5
> --- /dev/null
> +++ b/drivers/hwmon/ctf2304.c
> @@ -0,0 +1,554 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * ctf2304.c - Part of lm_sensors, Linux kernel modules for hardware
> + *             monitoring.
> + *
> + * (C) 2023 by Il Han <corone.il.han@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +/* CTF2304 registers */
> +#define CTF2304_REG_LOCAL_TEMP		0x00
> +#define CTF2304_REG_REMOTE_CHANNEL(ch)	(0x01 + (ch))
> +#define CTF2304_REG_TACH_COUNT(ch)	(0x09 + (ch))
> +#define CTF2304_REG_FAN_CONFIG1		0x10
> +#define CTF2304_REG_FAN_CONFIG2		0x11
> +#define CTF2304_REG_FAN_RPM_CTRL	0x18
> +#define CTF2304_REG_PWMOUT(ch)		(0x40 + (ch))
> +#define CTF2304_REG_TARGET_COUNT(ch)	(0x44 + (ch))
> +
> +/* Fan Configure1 register bits */
> +#define CTF2304_FAN_CFG1_TRANGE		0x0400
> +#define CTF2304_FAN_CFG1_MODE_MASK	(0x7)
> +#define CTF2304_FAN_CFG1_MODE_SHIFT	7
> +
> +/* Fan Configure2 register bits */
> +#define CTF2304_FAN_CFG2_MODE_MASK(ch)	(0x6 << (ch) * 4)
> +#define CTF2304_FAN_CFG2_MODE_SHIFT(ch)	(1 + (ch) * 4)
> +#define CTF2304_FAN_CFG2_DCY_MODE	0
> +#define CTF2304_FAN_CFG2_RPM_MODE	1
> +#define CTF2304_FAN_CFG2_TEMP_MODE	2
> +#define CTF2304_FAN_CFG2_MAX_MODE	3
> +
> +/* Fan RPM CTRL register bits */
> +#define CTF2304_FAN_DIV_MASK(ch)	(0x6 << (ch) * 4)
> +#define CTF2304_FAN_DIV_SHIFT(ch)	(1 + (ch) * 4)
> +
> +#define CTF2304_VCC			3300
> +
> +#define FAN_RPM_MIN			480
> +#define FAN_RPM_MAX			1966080
> +
> +#define FAN_COUNT_REG_MAX		0xFFF
> +
> +#define TEMP_FROM_REG(reg)		(((reg) * 1000) >> 8)
> +#define VOLT_FROM_REG(reg, fs)		((((reg) >> 4) * (fs)) >> 12)
> +#define DIV_FROM_REG(reg)		(1 << (reg))
> +#define DIV_TO_REG(div)			((div == 8) ? 0x3 : \
> +					 (div == 4) ? 0x2 : \
> +					 (div == 1) ? 0x0 : 0x1)
> +#define RPM_FROM_REG(reg)		(((reg) >> 4) ? \
> +					 ((32768 * 60) / ((reg) >> 4)) : \
> +					 FAN_RPM_MAX)
> +#define RPM_TO_REG(rpm)			((rpm) ? \
> +					 ((32768 * 60) / (rpm)) : \
> +					 FAN_COUNT_REG_MAX)
> +
> +#define NR_CHANNEL			8
> +#define NR_FAN_CHANNEL			4
> +
> +/*
> + * Client data (each client gets its own)
> + */
> +struct ctf2304_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock;
> +	char valid; /* zero until following fields are valid */
> +	unsigned long last_updated; /* in jiffies */
> +
> +	/* register values */
> +	u16 local_temp;
> +	u16 remote_channel[NR_CHANNEL];
> +	u16 tach[NR_FAN_CHANNEL];
> +	u16 fan_config1;
> +	u16 fan_config2;
> +	u16 fan_rpm_ctrl;
> +	u16 pwm[NR_FAN_CHANNEL];
> +	u16 target_count[NR_FAN_CHANNEL];
> +};
> +
> +static struct ctf2304_data *ctf2304_update_device(struct device *dev)
> +{
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int i;
> +	int rv;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_LOCAL_TEMP);
> +		if (rv >= 0)
> +			data->local_temp = rv;
> +
> +		for (i = 0; i < NR_CHANNEL; i++) {
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_REMOTE_CHANNEL(i));
> +			if (rv >= 0)
> +				data->remote_channel[i] = rv;
> +		}
> +
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_FAN_CONFIG1);
> +		if (rv >= 0)
> +			data->fan_config1 = rv;
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_FAN_CONFIG2);
> +		if (rv >= 0)
> +			data->fan_config2 = rv;
> +		rv = i2c_smbus_read_word_swapped(client,
> +				CTF2304_REG_FAN_RPM_CTRL);
> +		if (rv >= 0)
> +			data->fan_rpm_ctrl = rv;
> +
> +		for (i = 0; i < NR_FAN_CHANNEL; i++) {
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_TACH_COUNT(i));
> +			if (rv >= 0)
> +				data->tach[i] = rv;
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_PWMOUT(i));
> +			if (rv >= 0)
> +				data->pwm[i] = rv;
> +			rv = i2c_smbus_read_word_swapped(client,
> +					CTF2304_REG_TARGET_COUNT(i));
> +			if (rv >= 0)
> +				data->target_count[i] = rv;
> +		}
> +
> +		data->last_updated = jiffies;
> +		data->valid = true;
> +	}
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return data;
> +}
> +
> +static int register_to_temp(u16 reg, u16 config)
> +{
> +	if (config & CTF2304_FAN_CFG1_TRANGE)
> +		return TEMP_FROM_REG(reg & 0x7FF0) + ((reg >> 15) ? -64000:0);
> +	else
> +		return TEMP_FROM_REG(reg);
> +}
> +
> +static ssize_t show_temp(struct device *dev,
> +			 struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	u16 reg;
> +
> +	if (attr->index == 0)
> +		reg = data->local_temp;
> +	else
> +		reg = data->remote_channel[attr->index-1];
> +
> +	return sprintf(buf, "%d\n", register_to_temp(reg, data->fan_config1));
> +}
> +
> +static int get_full_scale(u16 config)
> +{
> +	int full_scale;
> +	u8 bits;
> +
> +	bits = (config >> CTF2304_FAN_CFG1_MODE_SHIFT)
> +	       & CTF2304_FAN_CFG1_MODE_MASK;
> +
> +	if (bits == 0x0)
> +		full_scale = 2560;
> +	else if (bits == 0x1)
> +		full_scale = CTF2304_VCC;
> +	else if (bits == 0x2)
> +		full_scale = 4096;
> +	else if (bits == 0x3)
> +		full_scale = 2048;
> +	else if (bits == 0x4)
> +		full_scale = 1024;
> +	else if (bits == 0x5)
> +		full_scale = 512;
> +	else
> +		full_scale = 256;
> +
> +	return full_scale;
> +}
> +
> +static int register_to_volt(u16 reg, u16 config)
> +{
> +	int full_scale;
> +
> +	full_scale = get_full_scale(config);
> +
> +	return VOLT_FROM_REG(reg, full_scale);
> +}
> +
> +static ssize_t show_voltage(struct device *dev,
> +			    struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	int voltage;
> +
> +	voltage = register_to_volt(data->remote_channel[attr->index],
> +			data->fan_config1);
> +
> +	return sprintf(buf, "%d\n", voltage);
> +}
> +
> +static ssize_t get_fan(struct device *dev,
> +		       struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	int rpm;
> +
> +	rpm = RPM_FROM_REG(data->tach[attr->index]);
> +
> +	return sprintf(buf, "%d\n", rpm);
> +}
> +
> +static ssize_t get_fan_target(struct device *dev,
> +			      struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	int rpm;
> +
> +	rpm = RPM_FROM_REG(data->target_count[attr->index]);
> +
> +	return sprintf(buf, "%d\n", rpm);
> +}
> +
> +static ssize_t set_fan_target(struct device *dev,
> +			      struct device_attribute *devattr,
> +			      const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned long rpm;
> +	int target_count;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &rpm);
> +	if (err)
> +		return err;
> +
> +	rpm = clamp_val(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
> +	target_count = RPM_TO_REG(rpm);
> +	target_count = clamp_val(target_count, 0x1, 0xFFF);
> +
> +	mutex_lock(&data->update_lock);
> +
> +	data->target_count[attr->index] = target_count << 4;
> +	i2c_smbus_write_word_swapped(client,
> +			CTF2304_REG_TARGET_COUNT(attr->index),
> +			data->target_count[attr->index]);
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return count;
> +}
> +
> +static ssize_t show_fan_div(struct device *dev,
> +			    struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	u8 bits;
> +
> +	bits = (data->fan_rpm_ctrl & CTF2304_FAN_DIV_MASK(attr->index))
> +	       >> CTF2304_FAN_DIV_SHIFT(attr->index);
> +
> +	return sprintf(buf, "%d\n", DIV_FROM_REG(bits));
> +}
> +
> +static ssize_t set_fan_div(struct device *dev,
> +			   struct device_attribute *devattr,
> +			   const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned long div;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &div);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	data->fan_rpm_ctrl = (data->fan_rpm_ctrl
> +			      & ~CTF2304_FAN_DIV_MASK(attr->index))
> +			     | (DIV_TO_REG(div)
> +				<< CTF2304_FAN_DIV_SHIFT(attr->index));
> +
> +	i2c_smbus_write_word_swapped(client,
> +			CTF2304_REG_FAN_RPM_CTRL, data->fan_rpm_ctrl);
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return count;
> +}
> +
> +static ssize_t get_pwm(struct device *dev,
> +		       struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	int pwm;
> +
> +	pwm = data->pwm[attr->index] >> 8;
> +
> +	return sprintf(buf, "%d\n", pwm);
> +}
> +
> +static ssize_t set_pwm(struct device *dev,
> +		       struct device_attribute *devattr,
> +		       const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned long pwm;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &pwm);
> +	if (err)
> +		return err;
> +
> +	pwm = clamp_val(pwm, 0, 255);
> +
> +	mutex_lock(&data->update_lock);
> +
> +	data->pwm[attr->index] = (data->pwm[attr->index] & 0xFF) | (pwm << 8);
> +	i2c_smbus_write_word_swapped(client,
> +			CTF2304_REG_PWMOUT(attr->index),
> +			data->pwm[attr->index]);
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return count;
> +}
> +
> +static ssize_t get_pwm_enable(struct device *dev,
> +			      struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = ctf2304_update_device(dev);
> +	int config;
> +	int mode;
> +
> +	config = (data->fan_config2 & CTF2304_FAN_CFG2_MODE_MASK(attr->index))
> +		 >> CTF2304_FAN_CFG2_MODE_SHIFT(attr->index);
> +	if (config == CTF2304_FAN_CFG2_RPM_MODE)
> +		mode = 2;
> +	else if (config == CTF2304_FAN_CFG2_DCY_MODE)
> +		mode = 1;
> +	else
> +		mode = 0;
> +
> +	return sprintf(buf, "%d\n", mode);
> +}
> +
> +static ssize_t set_pwm_enable(struct device *dev,
> +			      struct device_attribute *devattr,
> +			      const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct ctf2304_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned long mode;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &mode);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	switch (mode) {
> +	case 0:
> +		data->fan_config2 =
> +			(data->fan_config2
> +			 & ~CTF2304_FAN_CFG2_MODE_MASK(attr->index))
> +			| (CTF2304_FAN_CFG2_TEMP_MODE
> +			   << CTF2304_FAN_CFG2_MODE_SHIFT(attr->index));
> +		break;
> +	case 1:
> +		data->fan_config2 =
> +			(data->fan_config2
> +			 & ~CTF2304_FAN_CFG2_MODE_MASK(attr->index))
> +			| (CTF2304_FAN_CFG2_DCY_MODE
> +			   << CTF2304_FAN_CFG2_MODE_SHIFT(attr->index));
> +		break;
> +	case 2:
> +		data->fan_config2 =
> +			(data->fan_config2
> +			 & ~CTF2304_FAN_CFG2_MODE_MASK(attr->index))
> +			| (CTF2304_FAN_CFG2_RPM_MODE
> +			   << CTF2304_FAN_CFG2_MODE_SHIFT(attr->index));
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	i2c_smbus_write_word_swapped(client,
> +			CTF2304_REG_FAN_CONFIG2, data->fan_config2);
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, show_temp, NULL, 0);
> +static SENSOR_DEVICE_ATTR(temp2_input, 0444, show_temp, NULL, 1);
> +static SENSOR_DEVICE_ATTR(temp3_input, 0444, show_temp, NULL, 2);
> +static SENSOR_DEVICE_ATTR(temp4_input, 0444, show_temp, NULL, 3);
> +static SENSOR_DEVICE_ATTR(temp5_input, 0444, show_temp, NULL, 4);
> +static SENSOR_DEVICE_ATTR(temp6_input, 0444, show_temp, NULL, 5);
> +static SENSOR_DEVICE_ATTR(temp7_input, 0444, show_temp, NULL, 6);
> +static SENSOR_DEVICE_ATTR(temp8_input, 0444, show_temp, NULL, 7);
> +static SENSOR_DEVICE_ATTR(temp9_input, 0444, show_temp, NULL, 8);
> +static SENSOR_DEVICE_ATTR(in1_input, 0444, show_voltage, NULL, 0);
> +static SENSOR_DEVICE_ATTR(in2_input, 0444, show_voltage, NULL, 1);
> +static SENSOR_DEVICE_ATTR(in3_input, 0444, show_voltage, NULL, 2);
> +static SENSOR_DEVICE_ATTR(in4_input, 0444, show_voltage, NULL, 3);
> +static SENSOR_DEVICE_ATTR(in5_input, 0444, show_voltage, NULL, 4);
> +static SENSOR_DEVICE_ATTR(in6_input, 0444, show_voltage, NULL, 5);
> +static SENSOR_DEVICE_ATTR(in7_input, 0444, show_voltage, NULL, 6);
> +static SENSOR_DEVICE_ATTR(in8_input, 0444, show_voltage, NULL, 7);
> +static SENSOR_DEVICE_ATTR(fan1_input, 0444, get_fan, NULL, 0);
> +static SENSOR_DEVICE_ATTR(fan2_input, 0444, get_fan, NULL, 1);
> +static SENSOR_DEVICE_ATTR(fan3_input, 0444, get_fan, NULL, 2);
> +static SENSOR_DEVICE_ATTR(fan4_input, 0444, get_fan, NULL, 3);
> +static SENSOR_DEVICE_ATTR(fan1_target, 0644,
> +		get_fan_target, set_fan_target, 0);
> +static SENSOR_DEVICE_ATTR(fan2_target, 0644,
> +		get_fan_target, set_fan_target, 1);
> +static SENSOR_DEVICE_ATTR(fan3_target, 0644,
> +		get_fan_target, set_fan_target, 2);
> +static SENSOR_DEVICE_ATTR(fan4_target, 0644,
> +		get_fan_target, set_fan_target, 3);
> +static SENSOR_DEVICE_ATTR(fan1_div, 0644, show_fan_div, set_fan_div, 0);
> +static SENSOR_DEVICE_ATTR(fan2_div, 0644, show_fan_div, set_fan_div, 1);
> +static SENSOR_DEVICE_ATTR(fan3_div, 0644, show_fan_div, set_fan_div, 2);
> +static SENSOR_DEVICE_ATTR(fan4_div, 0644, show_fan_div, set_fan_div, 3);
> +static SENSOR_DEVICE_ATTR(pwm1, 0644, get_pwm, set_pwm, 0);
> +static SENSOR_DEVICE_ATTR(pwm2, 0644, get_pwm, set_pwm, 1);
> +static SENSOR_DEVICE_ATTR(pwm3, 0644, get_pwm, set_pwm, 2);
> +static SENSOR_DEVICE_ATTR(pwm4, 0644, get_pwm, set_pwm, 3);
> +static SENSOR_DEVICE_ATTR(pwm1_enable, 0644,
> +		get_pwm_enable, set_pwm_enable, 0);
> +static SENSOR_DEVICE_ATTR(pwm2_enable, 0644,
> +		get_pwm_enable, set_pwm_enable, 1);
> +static SENSOR_DEVICE_ATTR(pwm3_enable, 0644,
> +		get_pwm_enable, set_pwm_enable, 2);
> +static SENSOR_DEVICE_ATTR(pwm4_enable, 0644,
> +		get_pwm_enable, set_pwm_enable, 3);
> +
> +static struct attribute *ctf2304_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp2_input.dev_attr.attr,
> +	&sensor_dev_attr_temp3_input.dev_attr.attr,
> +	&sensor_dev_attr_temp4_input.dev_attr.attr,
> +	&sensor_dev_attr_temp5_input.dev_attr.attr,
> +	&sensor_dev_attr_temp6_input.dev_attr.attr,
> +	&sensor_dev_attr_temp7_input.dev_attr.attr,
> +	&sensor_dev_attr_temp8_input.dev_attr.attr,
> +	&sensor_dev_attr_temp9_input.dev_attr.attr,
> +	&sensor_dev_attr_in1_input.dev_attr.attr,
> +	&sensor_dev_attr_in2_input.dev_attr.attr,
> +	&sensor_dev_attr_in3_input.dev_attr.attr,
> +	&sensor_dev_attr_in4_input.dev_attr.attr,
> +	&sensor_dev_attr_in5_input.dev_attr.attr,
> +	&sensor_dev_attr_in6_input.dev_attr.attr,
> +	&sensor_dev_attr_in7_input.dev_attr.attr,
> +	&sensor_dev_attr_in8_input.dev_attr.attr,
> +	&sensor_dev_attr_fan1_input.dev_attr.attr,
> +	&sensor_dev_attr_fan2_input.dev_attr.attr,
> +	&sensor_dev_attr_fan3_input.dev_attr.attr,
> +	&sensor_dev_attr_fan4_input.dev_attr.attr,
> +	&sensor_dev_attr_fan1_target.dev_attr.attr,
> +	&sensor_dev_attr_fan2_target.dev_attr.attr,
> +	&sensor_dev_attr_fan3_target.dev_attr.attr,
> +	&sensor_dev_attr_fan4_target.dev_attr.attr,
> +	&sensor_dev_attr_fan1_div.dev_attr.attr,
> +	&sensor_dev_attr_fan2_div.dev_attr.attr,
> +	&sensor_dev_attr_fan3_div.dev_attr.attr,
> +	&sensor_dev_attr_fan4_div.dev_attr.attr,
> +	&sensor_dev_attr_pwm1.dev_attr.attr,
> +	&sensor_dev_attr_pwm2.dev_attr.attr,
> +	&sensor_dev_attr_pwm3.dev_attr.attr,
> +	&sensor_dev_attr_pwm4.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
> +	NULL
> +};
> +
> +ATTRIBUTE_GROUPS(ctf2304);
> +
> +static int ctf2304_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct ctf2304_data *data;
> +	struct device *hwmon_dev;
> +
> +	data = devm_kzalloc(dev, sizeof(struct ctf2304_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->update_lock);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
> +							   data,
> +							   ctf2304_groups);
> +

Documentation/hwmon/submitting-patches.rst:

* Use devm_hwmon_device_register_with_info() or, if your driver needs a remove
  function, hwmon_device_register_with_info() to register your driver with the
  hwmon subsystem. Try using devm_add_action() instead of a remove function if
  possible. Do not use any of the deprecated registration functions.

include/linux/hwmon.h:

/*
 * hwmon_device_register_with_groups() and
 * devm_hwmon_device_register_with_groups() are deprecated.
 */

Please rewrite to use [devm_]devm_hwmon_device_register_with_info().

Guenter

> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id ctf2304_id[] = {
> +	{ "ctf2304", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ctf2304_id);
> +
> +static struct i2c_driver ctf2304_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.probe		= ctf2304_probe,
> +	.driver = {
> +		.name	= "ctf2304",
> +	},
> +	.id_table	= ctf2304_id,
> +};
> +
> +module_i2c_driver(ctf2304_driver);
> +
> +MODULE_AUTHOR("Il Han <corone.il.han@gmail.com>");
> +MODULE_DESCRIPTION("CTF2304 sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.26.2
> 
