Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAB8C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 15:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiFTP5C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243053AbiFTP5B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 11:57:01 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF8D1D32A;
        Mon, 20 Jun 2022 08:56:59 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id b12-20020a17090a6acc00b001ec2b181c98so9564176pjm.4;
        Mon, 20 Jun 2022 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SS/D4hnlqWQrprGkE9sRetP75/gL8N5WgzQWDFd/Cyo=;
        b=b+VssJ/YOYsK4VqXadeW6wfHQUy1XByHSFzLenzM8H+z4tlm4ujreBdH4vMKhkrySi
         2eVsTL4Cx9ar17EGq/gkJmH0+MZP/13IeVm8g00tWGDWGZRm54gvgTX/dizlGwu6d6qV
         YAp6RZs3TbjCiF24UbJzbeyX1c+iT+VbeE1v1Gyyks6vSehccCGa9w71CVKexXjno0oJ
         qGxgN73JJBcqQjhvOc+P7b3BnhSeq73Ty4381z+622CUK1Rec5Fnb6lPwALku+UtyTVm
         v/lfY4zaSXJbFsPkEzUZNM/CMy2slLcHqCw/0AZlR6dy5fFKioP15tdRnRGyj4+zUvDx
         w1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=SS/D4hnlqWQrprGkE9sRetP75/gL8N5WgzQWDFd/Cyo=;
        b=hSXeEqjzOejNDTgEvXp0Ndy5baJ3gpuQWx2tUt94s/vNKgDhItuXj1qAmPpGx/JrDa
         UNhAzlkyiVGj2r3xIqCwSKzL1jrPvacT/UuGztY4b5My/bwHs+InCnWF7KB3FUCZ4iYd
         EhJqHSEZUqGLWR9htA6e83apxir10N759uZc6zvE3pO7MR+iq2YjsDzwLGvuuppRio4e
         IpVbjIdZmFNCzzkbO9hrIteS+VH5at8GcsHil90aTlV8ZL7wFuO0H6sARnOIkpOp2PsM
         fWlk7TZM9VI6ZMmhVEZC8Lilk17IvdoWHcWvatPkB6TTiRosH5yxsW8j2YihJu2hXY1+
         Ycmw==
X-Gm-Message-State: AJIora8gMQIiRdX97mSn0CQBjBkW8hgRIGCgJ/mIKvo+HeC3Z7MkBdKu
        p8DbiJmDG3IFtpNLgD+zcbM=
X-Google-Smtp-Source: AGRyM1s2GvTQKY4+Cj4ipJ5Vn6vtwiZv2EXMDYzhZuUvPwM6wCm3RkKpiRHfZGoXWv5DXWEcIklooA==
X-Received: by 2002:a17:902:bc85:b0:168:dadd:f86 with SMTP id bb5-20020a170902bc8500b00168dadd0f86mr23963172plb.93.1655740619200;
        Mon, 20 Jun 2022 08:56:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a104200b001ea629a431bsm8516631pjd.8.2022.06.20.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:56:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 20 Jun 2022 08:56:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH hwmon-next v3 1/3] hwmon: (emc2305) add support for
 EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
Message-ID: <20220620155656.GA4001288@roeck-us.net>
References: <20220529170536.10043-1-michaelsh@nvidia.com>
 <20220529170536.10043-2-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220529170536.10043-2-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, May 29, 2022 at 08:05:34PM +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add driver for Microchip EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
> Modify Makefile and Kconfig to support Microchip EMC2305 RPM-based
> PWM Fan Speed Controller.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

First of all, sorry for the late reply.

Overall I am mostly concerned about the lack of error checks in some
situations; see inline for details. If that is on purpose, please add
explanations.

Thanks,
Guenter

> ---
> v2->v3
> Change pointed out by Guenter Roeck:
> - Change casting from const pointer;
> - Remove pwm_max per channel parameter.
> Changes added by Michael Shych:
> - Add pwm_separate field instead using of a special case of pwm_channel;
> - Change the mechanism of obtaining a number of pwm channels.
> v1->v2
> Changes pointed out by Guenter Roeck:
> - Remove unnecessary include;
> - Standard multi-line comments form;
> - Defines indentation;
> - Remove unnecessary returns;
> - Add validation of received dt parameters;
> - Remove unnecessary brackets;
> Changes added by Michael Shych:
> - Fix initial PWM settings;
> - Change PWM write in case of common PWM channel;
> - Separate pwm-min, pwm-max per PWM channel.
> ---
>  drivers/hwmon/Kconfig   |  13 +
>  drivers/hwmon/Makefile  |   1 +
>  drivers/hwmon/emc2305.c | 654 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 668 insertions(+)
>  create mode 100644 drivers/hwmon/emc2305.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 590d3d550acb..642d56e42476 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1780,6 +1780,19 @@ config SENSORS_EMC2103
>  	  This driver can also be built as a module. If so, the module
>  	  will be called emc2103.
>  
> +config SENSORS_EMC2305
> +	tristate "Microchip EMC2305 and compatible EMC2301/2/3"
> +	depends on I2C
> +	imply THERMAL
> +	help
> +	  If you say yes here you get support for the Microchip EMC2305
> +	  fan controller chips.
> +	  The Microchip EMC2305 is a fan controller for up to 5 fans.
> +	  Fan rotation speeds are reported in RPM.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called emc2305.
> +
>  config SENSORS_EMC6W201
>  	tristate "SMSC EMC6W201"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 007e829d1d0d..7706557dfa86 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
>  obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
>  obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
>  obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
> +obj-$(CONFIG_SENSORS_EMC2305)	+= emc2305.o
>  obj-$(CONFIG_SENSORS_EMC6W201)	+= emc6w201.o
>  obj-$(CONFIG_SENSORS_F71805F)	+= f71805f.o
>  obj-$(CONFIG_SENSORS_F71882FG)	+= f71882fg.o
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> new file mode 100644
> index 000000000000..8a9bd31eda76
> --- /dev/null
> +++ b/drivers/hwmon/emc2305.c
> @@ -0,0 +1,654 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for EMC2305 fan controller
> + *
> + * Copyright (C) 2022 Nvidia Technologies Ltd and Delta Networks, Inc.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/thermal.h>
> +#include <linux/version.h>
> +
> +static const unsigned short
> +emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_END };
> +
> +#define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
> +#define EMC2305_REG_DEVICE		0xfd
> +#define EMC2305_REG_VENDOR		0xfe
> +#define EMC2305_FAN_MAX			0xff
> +#define EMC2305_FAN_MIN			0x00
> +#define EMC2305_FAN_MAX_STATE		10
> +#define EMC2305_DEVICE			0x34
> +#define EMC2305_VENDOR			0x5d
> +#define EMC2305_REG_PRODUCT_ID		0xfd
> +#define EMC2305_TACH_REGS_UNUSE_BITS	3
> +#define EMC2305_TACH_CNT_MULTIPLIER	0x02
> +#define EMC2305_PWM_MAX			5
> +
> +#define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
> +	(DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max)))
> +#define EMC2305_PWM_STATE2DUTY(state, max_state, pwm_max) \
> +	(DIV_ROUND_CLOSEST((state) * (pwm_max), (max_state)))
> +
> +/*
> + * Factor by equations [2] and [3] from data sheet; valid for fans where the number of edges
> + * equal (poles * 2 + 1).
> + */
> +#define EMC2305_RPM_FACTOR		3932160
> +
> +#define EMC2305_REG_FAN_DRIVE(n)	(0x30 + 0x10 * (n))
> +#define EMC2305_REG_FAN_MIN_DRIVE(n)	(0x38 + 0x10 * (n))
> +#define EMC2305_REG_FAN_TACH(n)		(0x3e + 0x10 * (n))
> +
> +enum emc230x_product_id {
> +	EMC2305 = 0x34,
> +	EMC2303 = 0x35,
> +	EMC2302 = 0x36,
> +	EMC2301 = 0x37,
> +};
> +
> +static const struct i2c_device_id emc2305_ids[] = {
> +	{ "emc2305", 0 },
> +	{ "emc2303", 0 },
> +	{ "emc2302", 0 },
> +	{ "emc2301", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, emc2305_ids);
> +
> +static const struct of_device_id emc2305_dt_ids[] = {
> +	{ .compatible = "microchip,emc2305" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, emc2305_dt_ids);
> +
> +/**
> + * @cdev: cooling device;
> + * @curr_state: cooling current state;
> + * @last_hwmon_state: last cooling state updated by hwmon subsystem;
> + * @last_thermal_state: last cooling state updated by thermal subsystem;
> + *
> + * The 'last_hwmon_state' and 'last_thermal_state' fields are provided to support fan low limit
> + * speed feature. The purpose of this feature is to provides ability to limit fan speed
> + * according to some system wise considerations, like absence of some replaceable units (PSU or
> + * line cards), high system ambient temperature, unreliable transceivers temperature sensing or
> + * some other factors which indirectly impacts system's airflow
> + * Fan low limit feature is supported through 'hwmon' interface: 'hwmon' 'pwm' attribute is
> + * used for setting low limit for fan speed in case 'thermal' subsystem is configured in
> + * kernel. In this case setting fan speed through 'hwmon' will never let the 'thermal'
> + * subsystem to select a lower duty cycle than the duty cycle selected with the 'pwm'
> + * attribute.
> + * From other side, fan speed is to be updated in hardware through 'pwm' only in case the
> + * requested fan speed is above last speed set by 'thermal' subsystem, otherwise requested fan
> + * speed will be just stored with no PWM update.
> + */
> +struct emc2305_cdev_data {
> +	struct thermal_cooling_device *cdev;
> +	unsigned int cur_state;
> +	unsigned long last_hwmon_state;
> +	unsigned long last_thermal_state;
> +};
> +
> +/**
> + * @client: i2c client;
> + * @hwmon_dev: hwmon device;
> + * @max_state: maximum cooling state of the cooling device;
> + * @pwm_num: number of PWM channels;
> + * @pwm_separate: separate PWM settings for every channel;
> + * @pwm_min: array of minimum PWM per channel;
> + * @cdev_data: array of cooling devices data;
> + */
> +struct emc2305_data {
> +	struct i2c_client *client;
> +	struct device *hwmon_dev;
> +	u8 max_state;
> +	u8 pwm_num;
> +	bool pwm_separate;
> +	u8 pwm_min[EMC2305_PWM_MAX];
> +	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
> +};
> +
> +static char *emc2305_fan_name[] = {
> +	"emc2305_fan",
> +	"emc2305_fan1",
> +	"emc2305_fan2",
> +	"emc2305_fan3",
> +	"emc2305_fan4",
> +	"emc2305_fan5",
> +};
> +
> +static void emc2305_unset_tz(struct device *dev);
> +
> +static int emc2305_get_max_channel(const struct emc2305_data *data)
> +{
> +	return data->pwm_num;
> +}
> +
> +static int emc2305_get_cdev_idx(struct thermal_cooling_device *cdev)
> +{
> +	struct emc2305_data *data = cdev->devdata;
> +	size_t len = strlen(cdev->type);
> +	int ret;
> +
> +	if (len <= 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * Retuns index of cooling device 0..4 in case of separate PWM setting.

Returns

> +	 * Zero index is used in case of one common PWM setting.
> +	 * If the mode is not set as pwm_separate, all PWMs are to be bound
> +	 * to the common thermal zone and should work at the same speed
> +	 * to perform cooling for the same thermal junction.
> +	 * Otherwise, return specific channel that will be used in bound
> +	 * related PWM to the thermal zone.
> +	 */
> +	if (!data->pwm_separate)
> +		return 0;
> +
> +	ret = cdev->type[len - 1];
> +	switch (ret) {
> +	case '1' ... '5':
> +		return ret - '1';
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int emc2305_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +	int cdev_idx;
> +	struct emc2305_data *data = cdev->devdata;
> +
> +	cdev_idx = emc2305_get_cdev_idx(cdev);
> +	if (cdev_idx < 0)
> +		return cdev_idx;
> +
> +	*state = data->cdev_data[cdev_idx].cur_state;
> +	return 0;
> +}
> +
> +static int emc2305_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +	struct emc2305_data *data = cdev->devdata;
> +	*state = data->max_state;
> +	return 0;
> +}
> +
> +static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +{
> +	int cdev_idx;
> +	struct emc2305_data *data = cdev->devdata;
> +	struct i2c_client *client = data->client;
> +	u8 val, i;
> +
> +	if (state > data->max_state)
> +		return -EINVAL;
> +
> +	cdev_idx =  emc2305_get_cdev_idx(cdev);
> +	if (cdev_idx < 0)
> +		return cdev_idx;
> +
> +	/* Save thermal state. */
> +	data->cdev_data[cdev_idx].last_thermal_state = state;
> +	state = max_t(unsigned long, state, data->cdev_data[cdev_idx].last_hwmon_state);
> +
> +	val = EMC2305_PWM_STATE2DUTY(state, data->max_state, EMC2305_FAN_MAX);
> +	if (val > EMC2305_FAN_MAX)
> +		return -EINVAL;
> +
> +	data->cdev_data[cdev_idx].cur_state = state;
> +	if (data->pwm_separate)
> +		i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(cdev_idx), val);

No error handling ?

> +	else
> +		/*
> +		 * Set the same PWM value in all channels
> +		 * if common PWM channel is used.
> +		 */
> +		for (i = 0; i < data->pwm_num; i++)
> +			i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i), val);

No error handling ?

> +
> +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops emc2305_cooling_ops = {
> +	.get_max_state = emc2305_get_max_state,
> +	.get_cur_state = emc2305_get_cur_state,
> +	.set_cur_state = emc2305_set_cur_state,
> +};
> +
> +static int emc2305_show_fault(struct device *dev, int channel)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int status_reg;
> +
> +	status_reg = i2c_smbus_read_byte_data(client, EMC2305_REG_DRIVE_FAIL_STATUS);

Needs error check

> +	return status_reg & (1 << channel) ? 1 : 0;
> +}
> +
> +static int emc2305_show_fan(struct device *dev, int channel)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int ret;
> +
> +	ret = i2c_smbus_read_word_swapped(client, EMC2305_REG_FAN_TACH(channel));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ret >> EMC2305_TACH_REGS_UNUSE_BITS;
> +	return EMC2305_RPM_FACTOR * EMC2305_TACH_CNT_MULTIPLIER / (ret > 0 ? ret : 1);
> +}
> +
> +static int emc2305_show_pwm(struct device *dev, int channel)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +
> +	return i2c_smbus_read_byte_data(client, EMC2305_REG_FAN_DRIVE(channel));
> +}
> +
> +static int emc2305_set_pwm(struct device *dev, long val, int channel)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +
> +	if (val < data->pwm_min[channel] || val > EMC2305_FAN_MAX)
> +		return -EINVAL;
> +
> +	i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(channel), val);

No error handling ?

> +	data->cdev_data[channel].cur_state = EMC2305_PWM_DUTY2STATE(val, data->max_state,
> +								    EMC2305_FAN_MAX);
> +	return 0;
> +}
> +
> +static int emc2305_get_tz_of(struct device *dev)
> +{
> +	struct device_node *pwm_np, *np = dev->of_node;
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	int i = 0, ret = 0;
> +	u8 tmp;
> +
> +	/*
> +	 * OF parameters are optional - overwrite default setting
> +	 * if some of them are provided.
> +	 */
> +
> +	if (of_find_property(np, "microchip,cooling-levels", NULL)) {
> +		ret = of_property_read_u8(np, "microchip,cooling-levels", &tmp);
> +		if (ret)
> +			return ret;
> +		else if (!data->max_state || tmp > EMC2305_FAN_MAX_STATE)
> +			return -EINVAL;
> +
> +		data->max_state = tmp;
> +	}
> +
> +	if (of_property_read_bool(np, "microchip,pwm-separate"))
> +		data->pwm_separate = true;
> +
> +	/* PWM_MIN can be any value in range 0..255 */
> +	for_each_child_of_node(np, pwm_np) {
> +		if (of_find_property(pwm_np, "pwm-min", NULL)) {
> +			ret = of_property_read_u8(pwm_np, "pwm-min", &tmp);
> +			if (ret) {
> +				of_node_put(pwm_np);
> +				return ret;
> +			} else if (tmp > EMC2305_FAN_MAX) {
> +				of_node_put(pwm_np);
> +				return -EINVAL;
> +			}
> +			data->pwm_min[i] = tmp;
> +		}
> +		i++;
> +	}
> +	/*
> +	 * Number of active pwm channels can be less than maximum
> +	 * suppoerted by device.
> +	 */
> +	if (i > 0 && i < data->pwm_num)
> +		data->pwm_num = i;
> +
> +	return ret;
> +}
> +
> +static int emc2305_set_single_tz(struct device *dev, int idx)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	long pwm;
> +	int i, cdev_idx;
> +
> +	cdev_idx = (idx) ? idx - 1 : 0;
> +	pwm = data->pwm_min[cdev_idx];
> +
> +	if (dev->of_node)
> +		data->cdev_data[cdev_idx].cdev =
> +			devm_thermal_of_cooling_device_register(dev, dev->of_node,
> +								emc2305_fan_name[idx], data,
> +								&emc2305_cooling_ops);
> +	else
> +		data->cdev_data[cdev_idx].cdev =
> +			thermal_cooling_device_register(emc2305_fan_name[idx], data,
> +							&emc2305_cooling_ops);
> +
> +	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
> +		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
> +		return PTR_ERR(data->cdev_data[cdev_idx].cdev);
> +	}
> +	/* Set minimal PWM speed. */
> +	if (data->pwm_separate)
> +		emc2305_set_pwm(dev, pwm, cdev_idx);
> +	else
> +		for (i = 0; i < data->pwm_num; i++)
> +			emc2305_set_pwm(dev, pwm, i);

No error handling ?

> +	data->cdev_data[cdev_idx].cur_state =
> +		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
> +				       EMC2305_FAN_MAX);
> +	data->cdev_data[cdev_idx].last_hwmon_state =
> +		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
> +				       EMC2305_FAN_MAX);
> +	return 0;
> +}
> +
> +static int emc2305_set_tz(struct device *dev)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	if (!data->pwm_separate)
> +		return emc2305_set_single_tz(dev, 0);
> +
> +	for (i = 0; i < data->pwm_num; i++) {
> +		ret = emc2305_set_single_tz(dev, i + 1);
> +		if (ret)
> +			goto thermal_cooling_device_register_fail;
> +	}
> +	return 0;
> +
> +thermal_cooling_device_register_fail:
> +	emc2305_unset_tz(dev);
> +	return ret;
> +}
> +
> +static void emc2305_unset_tz(struct device *dev)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	int i;
> +
> +	/*
> +	 * Unregister cooling device in case they have been registered by
> +	 * thermal_cooling_device_register(). Clean-up flow in case they
> +	 * have been registered by devm_thermal_of_cooling_device_register()
> +	 * will be done automatically, no need in unwind function.
> +	 */
> +	if (!dev->of_node) {
> +		for (i = 0; i < EMC2305_PWM_MAX; i++)
> +			if (data->cdev_data[i].cdev)
> +				thermal_cooling_device_unregister(data->cdev_data[i].cdev);
> +	}
> +}
> +
> +static umode_t
> +emc2305_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr, int channel)
> +{
> +	int max_channel = emc2305_get_max_channel(data);
> +
> +	/* Don't show channels which are not physically connected. */
> +	if (channel + 1 > max_channel)

	if (channel >= max_channel)

would not require the +1.

> +		return 0;
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_fault:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +};
> +
> +static int
> +emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel, long val)
> +{
> +	struct emc2305_data *data = dev_get_drvdata(dev);
> +	int cdev_idx;
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			/* If thermal is configured - handle PWM limit setting. */
> +			if (IS_REACHABLE(CONFIG_THERMAL)) {
> +				if (data->pwm_separate)
> +					cdev_idx = channel;
> +				else
> +					cdev_idx = 0;
> +				data->cdev_data[cdev_idx].last_hwmon_state =
> +					EMC2305_PWM_DUTY2STATE(val, data->max_state,
> +							       EMC2305_FAN_MAX);
> +				/*
> +				 * Update PWM only in case requested state is not less than the
> +				 * last thermal state.
> +				 */
> +				if (data->cdev_data[cdev_idx].last_hwmon_state >=
> +				    data->cdev_data[cdev_idx].last_thermal_state)
> +					return emc2305_set_cur_state(data->cdev_data[cdev_idx].cdev,
> +							data->cdev_data[cdev_idx].last_hwmon_state);
> +				return 0;
> +			}
> +			return emc2305_set_pwm(dev, val, channel);
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +};
> +
> +static int
> +emc2305_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel, long *val)
> +{
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			ret = emc2305_show_fan(dev, channel);
> +			if (ret < 0)
> +				return ret;
> +			*val = ret;
> +			return 0;
> +		case hwmon_fan_fault:
> +			ret = emc2305_show_fault(dev, channel);
> +			if (ret < 0)
> +				return ret;
> +			*val = ret;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = emc2305_show_pwm(dev, channel);
> +			if (ret < 0)
> +				return ret;
> +			*val = ret;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +};
> +
> +static const struct hwmon_ops emc2305_ops = {
> +	.is_visible = emc2305_is_visible,
> +	.read = emc2305_read,
> +	.write = emc2305_write,
> +};
> +
> +static const struct hwmon_channel_info *emc2305_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_FAULT,
> +			   HWMON_F_INPUT | HWMON_F_FAULT,
> +			   HWMON_F_INPUT | HWMON_F_FAULT,
> +			   HWMON_F_INPUT | HWMON_F_FAULT,
> +			   HWMON_F_INPUT | HWMON_F_FAULT),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info emc2305_chip_info = {
> +	.ops = &emc2305_ops,
> +	.info = emc2305_info,
> +};
> +
> +static int emc2305_identify(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct emc2305_data *data = i2c_get_clientdata(client);
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, EMC2305_REG_PRODUCT_ID);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (ret) {
> +	case EMC2305:
> +		data->pwm_num = 5;
> +		break;
> +	case EMC2303:
> +		data->pwm_num = 3;
> +		break;
> +	case EMC2302:
> +		data->pwm_num = 2;
> +		break;
> +	case EMC2301:
> +		data->pwm_num = 1;
> +		break;
> +	default:
> +		return -EINVAL;

Should that be -ENODEV ?

> +	}
> +
> +	return 0;
> +}
> +
> +static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	struct device *dev = &client->dev;
> +	struct emc2305_data *data;
> +	int vendor, device;
> +	int ret;
> +	int i;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	vendor = i2c_smbus_read_byte_data(client, EMC2305_REG_VENDOR);
> +	if (vendor != EMC2305_VENDOR)
> +		return -ENODEV;
> +
> +	device = i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
> +	if (device != EMC2305_DEVICE)
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, data);
> +	data->client = client;
> +
> +	ret = emc2305_identify(dev);
> +	if (ret)
> +		return ret;
> +
> +	data->max_state = EMC2305_FAN_MAX_STATE;
> +	data->pwm_separate =  false;
> +	for (i = 0; i < EMC2305_PWM_MAX; i++)
> +		data->pwm_min[i] = EMC2305_FAN_MIN;
> +	if (dev->of_node) {
> +		ret = emc2305_get_tz_of(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "emc2305", data,
> +							       &emc2305_chip_info, NULL);
> +	if (IS_ERR(data->hwmon_dev))
> +		return PTR_ERR(data->hwmon_dev);
> +
> +	if (IS_REACHABLE(CONFIG_THERMAL)) {
> +		ret = emc2305_set_tz(dev);
> +		if (ret != 0)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < data->pwm_num; i++)
> +		i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_MIN_DRIVE(i), data->pwm_min[i]);
> +
> +	return 0;
> +}
> +
> +static int emc2305_remove(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +
> +	if (IS_REACHABLE(CONFIG_THERMAL))
> +		emc2305_unset_tz(dev);
> +	return 0;
> +}
> +
> +static struct i2c_driver emc2305_driver = {
> +	.class  = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = "emc2305",
> +		.of_match_table = emc2305_dt_ids,
> +	},
> +	.probe    = emc2305_probe,
> +	.remove	  = emc2305_remove,
> +	.id_table = emc2305_ids,
> +	.address_list = emc2305_normal_i2c,
> +};
> +
> +module_i2c_driver(emc2305_driver);
> +
> +MODULE_AUTHOR("Nvidia");
> +MODULE_DESCRIPTION("Microchip EMC2305 fan controller driver");
> +MODULE_LICENSE("GPL");
