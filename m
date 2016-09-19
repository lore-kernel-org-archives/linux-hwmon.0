Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33233 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932720AbcISBlI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Sep 2016 21:41:08 -0400
Date: Sun, 18 Sep 2016 18:41:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan
 controller
Message-ID: <20160919014104.GA30840@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Sep 18, 2016 at 07:50:55PM -0500, Timothy Pearson wrote:
> Add a basic driver for the MAX31785, focusing on the fan control
> features but ignoring the temperature and voltage monitoring
> features of the device.
> 
> This driver supports all fan control modes and tachometer / PWM
> readback where applicable.
> 
Could you try using hwmon_device_register_with_info() as available in
linux-next ? Hopefully that should reduce driver size (and give the new API
some test coverage).

Please run the patch through checkpatch --strict. I don't expect you to
fix all the problems is reports, but the following should be addressed.

CHECK: Prefer kernel type 'u8' over 'uint8_t'
CHECK: Prefer kernel type 'u16' over 'uint16_t'
CHECK: Alignment should match open parenthesis
CHECK: Logical continuations should be on the previous line
WARNING: quoted string split across lines

Additional comments inline.

> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  Documentation/hwmon/max31785 |   36 +++
>  drivers/hwmon/Kconfig        |   10 +
>  drivers/hwmon/Makefile       |    1 +
>  drivers/hwmon/max31785.c     |  713 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 760 insertions(+)
>  create mode 100644 Documentation/hwmon/max31785
>  create mode 100644 drivers/hwmon/max31785.c
> 
> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
> new file mode 100644
> index 0000000..34dca74
> --- /dev/null
> +++ b/Documentation/hwmon/max31785
> @@ -0,0 +1,36 @@
> +Kernel driver max31785
> +======================
> +
> +Supported chips:
> +  * Maxim MAX31785
> +    Prefix: 'max31785'
> +    Addresses scanned: 0x52 0x53 0x54 0x55
> +    Datasheet: http://pdfserv.maximintegrated.com/en/ds/MAX31785.pdf
> +
> +Author: Timothy Pearson <tpearson@raptorengineering.com>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for the Maxim MAX31785 chip.
> +
> +The MAX31785 controls the speeds of up to six fans using six independent
> +PWM outputs. The desired fan speeds (or PWM duty cycles) are written
> +through the I2C interface. The outputs drive "4-wire" fans directly,
> +or can be used to modulate the fan's power terminals using an external
> +pass transistor.
> +
> +Tachometer inputs monitor fan tachometer logic outputs for precise (+/-1%)
> +monitoring and control of fan RPM as well as detection of fan failure.
> +
> +
> +Sysfs entries
> +-------------
> +
> +fan[1-6]_input           RO  fan tachometer speed in RPM
> +fan[1-6]_fault           RO  fan experienced fault
> +fan[1-6]_target          RW  desired fan speed in RPM
> +fan[1-6]_control_mode    RW  desired control mode: rpm, pwm, or auto

Please use pwm[]_enable (see API)

> +pwm[1-6]_enable          RW  output enabled, 0=disabled, 1=enabled

Per API: 0 = no fan speed control (full speed), 1 = manual fan speed control
enabled (using pwm[1-*]), 2+: automatic fan speed control

> +pwm[1-6]                 RW  fan target duty cycle (0-255)
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index eaf2f91..a202fd5 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -886,6 +886,16 @@ config SENSORS_MAX6697
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called max6697.
>  
> +config SENSORS_MAX31785
> +	tristate "Maxim MAX31785 sensor chip"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for 6-Channel PWM-Output
> +	  Fan RPM Controller.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called max31785.
> +
>  config SENSORS_MAX31790
>  	tristate "Maxim MAX31790 sensor chip"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index fe87d28..44c0c02 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
>  obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
>  obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
>  obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
> +obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
>  obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
>  obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> new file mode 100644
> index 0000000..9a23edd
> --- /dev/null
> +++ b/drivers/hwmon/max31785.c
> @@ -0,0 +1,713 @@
> +/*
> + * max31785.c - Part of lm_sensors, Linux kernel modules for hardware
> + *             monitoring.
> + *
> + * (C) 2016 Raptor Engineering, LLC
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
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
> +/* MAX31785 registers */
> +#define MAX31785_REG_PAGE			0x00
> +#define MAX31785_PAGE_FAN_CONFIG(ch)		(0x00 + (ch))
> +#define MAX31785_REG_FAN_CONFIG_1_2		0x3a
> +#define MAX31785_REG_FAN_COMMAND_1		0x3b
> +#define MAX31785_REG_STATUS_FANS_1_2		0x81
> +#define MAX31785_REG_FAN_SPEED_1		0x90
> +#define MAX31785_REG_MFR_ID			0x99
> +#define MAX31785_REG_MFR_MODEL			0x9a
> +#define MAX31785_REG_MFR_FAN_CONFIG		0xf1
> +#define MAX31785_REG_READ_FAN_PWM		0xf3
> +
> +/* Fan Config register bits */
> +#define MAX31785_FAN_CFG_PWM_ENABLE		0x80
> +#define MAX31785_FAN_CFG_CONTROL_MODE_RPM	0x40
> +
> +/* Fan Status register bits */
> +#define MAX31785_FAN_STATUS_FAULT_MASK		0x80
> +
> +#define NR_CHANNEL				6
> +
> +/* Addresses to scan */
> +static const unsigned short normal_i2c[] = { 0x52, 0x53, 0x54, 0x55,
> +							I2C_CLIENT_END };
> +
> +/*
> + * Client data (each client gets its own)
> + */
> +struct max31785_data {
> +	struct i2c_client *client;
> +	struct mutex device_lock;
> +	bool valid; /* zero until following fields are valid */
> +	unsigned long last_updated; /* in jiffies */
> +
> +	/* register values */
> +	uint8_t fan_config[NR_CHANNEL];
> +	uint16_t fan_command[NR_CHANNEL];
> +	uint8_t mfr_fan_config[NR_CHANNEL];
> +	uint8_t fault_status[NR_CHANNEL];
> +	uint16_t tach_rpm[NR_CHANNEL];
> +	uint16_t pwm[NR_CHANNEL];
> +};
> +
> +static int max31785_set_page(struct i2c_client *client,
> +				uint8_t page)
> +{
> +	return i2c_smbus_write_byte_data(client,
> +			MAX31785_REG_PAGE,
> +			page);
> +}
> +
> +static int max31785_read_fan_data(struct i2c_client *client,
> +				uint8_t fan, uint8_t reg, uint8_t byte_mode)
> +{
> +	int rv;
> +
> +	rv = max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
> +	if (rv < 0)
> +		return rv;
> +
> +	if (byte_mode)
> +		rv = i2c_smbus_read_byte_data(client, reg);
> +	else
> +		rv = i2c_smbus_read_word_data(client, reg);
> +
> +	return rv;
> +}
> +
> +static int max31785_write_fan_data(struct i2c_client *client,
> +				uint8_t fan, uint8_t reg, uint16_t data,
> +				uint8_t byte_mode)
> +{
> +	int err;
> +
> +	err = max31785_set_page(client, MAX31785_PAGE_FAN_CONFIG(fan));
> +	if (err < 0)
> +		return err;
> +
> +	if (byte_mode)
> +		err = i2c_smbus_write_byte_data(client, reg, data);
> +	else
> +		err = i2c_smbus_write_word_data(client, reg, data);
> +
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static uint8_t is_automatic_control_mode(struct max31785_data *data,
> +			int index)

Please use bool as return value
> +{
> +	if (data->fan_command[index] > 0x7fff)
> +		return 1;
> +	else
> +		return 0;

	return data->fan_command[index] > 0x7fff;

> +}
> +
> +static struct max31785_data *max31785_update_device(struct device *dev)
> +{
> +	struct max31785_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	struct max31785_data *ret = data;
> +	int i;
> +	int rv;
> +
> +	mutex_lock(&data->device_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +		for (i = 0; i < NR_CHANNEL; i++) {
> +			rv = max31785_read_fan_data(client, i,
> +					MAX31785_REG_STATUS_FANS_1_2, 1);
> +			if (rv < 0)
> +				goto abort;
> +			data->fault_status[i] = rv;
> +
> +			rv = max31785_read_fan_data(client, i,
> +					MAX31785_REG_FAN_SPEED_1, 0);
> +			if (rv < 0)
> +				goto abort;
> +			data->tach_rpm[i] = rv;
> +
> +			if ((data->fan_config[i]
> +				& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
> +				|| is_automatic_control_mode(data, i)) {
> +				rv = max31785_read_fan_data(client, i,
> +						MAX31785_REG_READ_FAN_PWM, 0);
> +				if (rv < 0)
> +					goto abort;
> +				data->pwm[i] = rv;
> +			}
> +
> +			if (!is_automatic_control_mode(data, i)) {
> +				/* Poke watchdog for manual fan control */
> +				rv = max31785_write_fan_data(client,
> +					i, MAX31785_REG_FAN_COMMAND_1,
> +					data->fan_command[i], 0);
> +				if (rv < 0)
> +					goto abort;
> +			}
> +		}
> +
> +		data->last_updated = jiffies;
> +		data->valid = true;
> +	}
> +	goto done;
> +
> +abort:
> +	data->valid = false;
> +	ret = ERR_PTR(rv);
> +
> +done:
> +	mutex_unlock(&data->device_lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t get_fan(struct device *dev,
> +		       struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = max31785_update_device(dev);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return sprintf(buf, "%d\n", data->tach_rpm[attr->index]);
> +}
> +
> +static ssize_t get_fan_target(struct device *dev,
> +			      struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = max31785_update_device(dev);
> +	int rpm;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	if (data->fan_config[attr->index]
> +		& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
> +		rpm = data->fan_command[attr->index];
> +	else
> +		rpm = data->fan_command[attr->index] / 40; 

Why / 40 ?

> +
> +	return sprintf(buf, "%d\n", rpm);
> +}
> +
> +static ssize_t set_fan_target(struct device *dev,
> +			      struct device_attribute *devattr,
> +			      const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned long rpm;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &rpm);
> +	if (err)
> +		return err;
> +
> +	if (rpm > 0x7fff)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->device_lock);
> +
> +	/* Switch fan to RPM mode */
> +	data->fan_config[attr->index] |= MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> +	err = max31785_write_fan_data(client, attr->index,
> +				MAX31785_REG_FAN_CONFIG_1_2,
> +				data->fan_config[attr->index], 1);

We don't usually make such implied changes. The user should be able
to set the target speed and then request the mode change explicitly.

> +
> +	if (err < 0) {
> +		mutex_unlock(&data->device_lock);
> +		return err;
> +	}
> +
> +	/* Write new RPM value */
> +	data->fan_command[attr->index] = rpm;
> +	err = max31785_write_fan_data(client, attr->index,
> +				MAX31785_REG_FAN_COMMAND_1,
> +				data->fan_command[attr->index], 0);
> +
> +	mutex_unlock(&data->device_lock);
> +
> +	if (err < 0)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t get_pwm(struct device *dev,
> +		       struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = max31785_update_device(dev);
> +	int pwm;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	if ((data->fan_config[attr->index]
> +		& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
> +		|| is_automatic_control_mode(data, attr->index))
> +		pwm = data->pwm[attr->index] / 100;
> +	else
> +		pwm = data->fan_command[attr->index] / 40;

Why / 40 ?

> +
> +	return sprintf(buf, "%d\n", pwm);
> +}
> +
> +static ssize_t set_pwm(struct device *dev,
> +		       struct device_attribute *devattr,
> +		       const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned long pwm;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &pwm);
> +	if (err)
> +		return err;
> +
> +	if (pwm > 255)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->device_lock);
> +
> +	/* Switch fan to PWM mode */
> +	data->fan_config[attr->index] &= ~MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> +	err = max31785_write_fan_data(client, attr->index,
> +				MAX31785_REG_FAN_CONFIG_1_2,
> +				data->fan_config[attr->index], 1);
> +
Another implied mode change ...

> +	if (err < 0) {
> +		mutex_unlock(&data->device_lock);
> +		return err;
> +	}
> +
> +	/* Write new PWM value */
> +	data->fan_command[attr->index] = pwm * 40;

Where is the * 40 coming from ?

> +	err = max31785_write_fan_data(client, attr->index,
> +				MAX31785_REG_FAN_COMMAND_1,
> +				data->fan_command[attr->index], 0);
> +
> +	mutex_unlock(&data->device_lock);
> +
> +	if (err < 0)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t get_pwm_enable(struct device *dev,
> +			      struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = max31785_update_device(dev);
> +	int enabled;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	if (data->fan_config[attr->index] & MAX31785_FAN_CFG_PWM_ENABLE)
> +		enabled = 1;
> +	else
> +		enabled = 0;

	enabled = !!(data->fan_config[attr->index] &
		     MAX31785_FAN_CFG_PWM_ENABLE);
> +
> +	return sprintf(buf, "%d\n", enabled);
> +}
> +
> +static ssize_t set_pwm_enable(struct device *dev,
> +			      struct device_attribute *devattr,
> +			      const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	unsigned long enabled;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &enabled);
> +	if (err)
> +		return err;
> +
> +	switch (enabled) {
> +	case 0:
> +		data->fan_config[attr->index] =
> +			data->fan_config[attr->index]
> +			& ~MAX31785_FAN_CFG_PWM_ENABLE;
> +		break;
> +	case 1:
> +		data->fan_config[attr->index] =
> +			data->fan_config[attr->index]
> +			 | MAX31785_FAN_CFG_PWM_ENABLE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&data->device_lock);
> +
> +	err = max31785_write_fan_data(client, attr->index,
> +				MAX31785_REG_FAN_CONFIG_1_2,
> +				data->fan_config[attr->index], 1);
> +
> +	mutex_unlock(&data->device_lock);
> +
> +	if (err < 0)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t get_control_mode(struct device *dev,
> +			      struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = max31785_update_device(dev);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	if (is_automatic_control_mode(data, attr->index))
> +		return sprintf(buf, "auto\n");
> +	else if (data->fan_config[attr->index]
> +				& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
> +		return sprintf(buf, "rpm\n");
> +
> +	return sprintf(buf, "pwm\n");
> +}
> +
> +static ssize_t set_control_mode(struct device *dev,
> +			      struct device_attribute *devattr,
> +			      const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int err;
> +
> +	if (!strcmp(buf, "auto") || !strcmp(buf, "auto\n")) {
> +		data->fan_command[attr->index] = 0xffff;
> +	} else if (!strcmp(buf, "pwm") || !strcmp(buf, "pwm\n")) {
> +		data->fan_config[attr->index] =
> +			data->fan_config[attr->index]
> +			& ~MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> +	} else if (!strcmp(buf, "rpm") || !strcmp(buf, "rpm\n")) {
> +		data->fan_config[attr->index] =
> +			data->fan_config[attr->index]
> +			| MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&data->device_lock);
> +
> +	if (data->fan_command[attr->index] == 0xffff)
> +		err = max31785_write_fan_data(client, attr->index,
> +					MAX31785_REG_FAN_COMMAND_1,
> +					data->fan_command[attr->index], 0);
> +	else
> +		err = max31785_write_fan_data(client, attr->index,
> +					MAX31785_REG_FAN_CONFIG_1_2,
> +					data->fan_config[attr->index], 1);
> +
> +	mutex_unlock(&data->device_lock);
> +
> +	if (err < 0)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t get_fan_fault(struct device *dev,
> +			     struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct max31785_data *data = max31785_update_device(dev);
> +	int fault;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	fault = !!(data->fault_status[attr->index]
> +			& MAX31785_FAN_STATUS_FAULT_MASK);
> +
> +	return sprintf(buf, "%d\n", fault);
> +}
> +
> +static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan, NULL, 0);
> +static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
> +static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
> +static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
> +static SENSOR_DEVICE_ATTR(fan5_input, S_IRUGO, get_fan, NULL, 4);
> +static SENSOR_DEVICE_ATTR(fan6_input, S_IRUGO, get_fan, NULL, 5);
> +
> +static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, get_fan_fault, NULL, 0);
> +static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, get_fan_fault, NULL, 1);
> +static SENSOR_DEVICE_ATTR(fan3_fault, S_IRUGO, get_fan_fault, NULL, 2);
> +static SENSOR_DEVICE_ATTR(fan4_fault, S_IRUGO, get_fan_fault, NULL, 3);
> +static SENSOR_DEVICE_ATTR(fan5_fault, S_IRUGO, get_fan_fault, NULL, 4);
> +static SENSOR_DEVICE_ATTR(fan6_fault, S_IRUGO, get_fan_fault, NULL, 5);
> +
> +static SENSOR_DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO,
> +		get_fan_target, set_fan_target, 0);
> +static SENSOR_DEVICE_ATTR(fan2_target, S_IWUSR | S_IRUGO,
> +		get_fan_target, set_fan_target, 1);
> +static SENSOR_DEVICE_ATTR(fan3_target, S_IWUSR | S_IRUGO,
> +		get_fan_target, set_fan_target, 2);
> +static SENSOR_DEVICE_ATTR(fan4_target, S_IWUSR | S_IRUGO,
> +		get_fan_target, set_fan_target, 3);
> +static SENSOR_DEVICE_ATTR(fan5_target, S_IWUSR | S_IRUGO,
> +		get_fan_target, set_fan_target, 4);
> +static SENSOR_DEVICE_ATTR(fan6_target, S_IWUSR | S_IRUGO,
> +		get_fan_target, set_fan_target, 5);
> +
> +static SENSOR_DEVICE_ATTR(fan1_control_mode, S_IWUSR | S_IRUGO,
> +		get_control_mode, set_control_mode, 0);
> +static SENSOR_DEVICE_ATTR(fan2_control_mode, S_IWUSR | S_IRUGO,
> +		get_control_mode, set_control_mode, 1);
> +static SENSOR_DEVICE_ATTR(fan3_control_mode, S_IWUSR | S_IRUGO,
> +		get_control_mode, set_control_mode, 2);
> +static SENSOR_DEVICE_ATTR(fan4_control_mode, S_IWUSR | S_IRUGO,
> +		get_control_mode, set_control_mode, 3);
> +static SENSOR_DEVICE_ATTR(fan5_control_mode, S_IWUSR | S_IRUGO,
> +		get_control_mode, set_control_mode, 4);
> +static SENSOR_DEVICE_ATTR(fan6_control_mode, S_IWUSR | S_IRUGO,
> +		get_control_mode, set_control_mode, 5);
> +
> +static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 0);
> +static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 1);
> +static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 2);
> +static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 3);
> +static SENSOR_DEVICE_ATTR(pwm5, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 4);
> +static SENSOR_DEVICE_ATTR(pwm6, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 5);
> +
> +static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
> +		get_pwm_enable, set_pwm_enable, 0);
> +static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO,
> +		get_pwm_enable, set_pwm_enable, 1);
> +static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR | S_IRUGO,
> +		get_pwm_enable, set_pwm_enable, 2);
> +static SENSOR_DEVICE_ATTR(pwm4_enable, S_IWUSR | S_IRUGO,
> +		get_pwm_enable, set_pwm_enable, 3);
> +static SENSOR_DEVICE_ATTR(pwm5_enable, S_IWUSR | S_IRUGO,
> +		get_pwm_enable, set_pwm_enable, 4);
> +static SENSOR_DEVICE_ATTR(pwm6_enable, S_IWUSR | S_IRUGO,
> +		get_pwm_enable, set_pwm_enable, 5);
> +
> +static struct attribute *max31785_attrs[] = {
> +	&sensor_dev_attr_fan1_input.dev_attr.attr,
> +	&sensor_dev_attr_fan2_input.dev_attr.attr,
> +	&sensor_dev_attr_fan3_input.dev_attr.attr,
> +	&sensor_dev_attr_fan4_input.dev_attr.attr,
> +	&sensor_dev_attr_fan5_input.dev_attr.attr,
> +	&sensor_dev_attr_fan6_input.dev_attr.attr,
> +
> +	&sensor_dev_attr_fan1_fault.dev_attr.attr,
> +	&sensor_dev_attr_fan2_fault.dev_attr.attr,
> +	&sensor_dev_attr_fan3_fault.dev_attr.attr,
> +	&sensor_dev_attr_fan4_fault.dev_attr.attr,
> +	&sensor_dev_attr_fan5_fault.dev_attr.attr,
> +	&sensor_dev_attr_fan6_fault.dev_attr.attr,
> +
> +	&sensor_dev_attr_fan1_target.dev_attr.attr,
> +	&sensor_dev_attr_fan2_target.dev_attr.attr,
> +	&sensor_dev_attr_fan3_target.dev_attr.attr,
> +	&sensor_dev_attr_fan4_target.dev_attr.attr,
> +	&sensor_dev_attr_fan5_target.dev_attr.attr,
> +	&sensor_dev_attr_fan6_target.dev_attr.attr,
> +
> +	&sensor_dev_attr_fan1_control_mode.dev_attr.attr,
> +	&sensor_dev_attr_fan2_control_mode.dev_attr.attr,
> +	&sensor_dev_attr_fan3_control_mode.dev_attr.attr,
> +	&sensor_dev_attr_fan4_control_mode.dev_attr.attr,
> +	&sensor_dev_attr_fan5_control_mode.dev_attr.attr,
> +	&sensor_dev_attr_fan6_control_mode.dev_attr.attr,
> +
> +	&sensor_dev_attr_pwm1.dev_attr.attr,
> +	&sensor_dev_attr_pwm2.dev_attr.attr,
> +	&sensor_dev_attr_pwm3.dev_attr.attr,
> +	&sensor_dev_attr_pwm4.dev_attr.attr,
> +	&sensor_dev_attr_pwm5.dev_attr.attr,
> +	&sensor_dev_attr_pwm6.dev_attr.attr,
> +
> +	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm5_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm6_enable.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t max31785_attrs_visible(struct kobject *kobj,
> +				     struct attribute *a, int n)
> +{
> +	return a->mode;
> +}
> +
> +static const struct attribute_group max31785_group = {
> +	.attrs = max31785_attrs,
> +	.is_visible = max31785_attrs_visible,
> +};
> +__ATTRIBUTE_GROUPS(max31785);
> +
> +static int max31785_init_client(struct i2c_client *client,
> +				struct max31785_data *data)
> +{
> +	int i, rv;
> +
> +	dev_info(&client->dev, "Reading device state\n");
> +
Noise; please drop.

> +	mutex_lock(&data->device_lock);
> +
This is only called from probe; setting the mutex is unnecessary.

> +	for (i = 0; i < NR_CHANNEL; i++) {
> +		rv = max31785_read_fan_data(client, i,
> +				MAX31785_REG_FAN_CONFIG_1_2, 1);
> +		if (rv < 0)
> +			goto abort;
> +		data->fan_config[i] = rv;
> +
> +		rv = max31785_read_fan_data(client, i,
> +				MAX31785_REG_FAN_COMMAND_1, 0);
> +		if (rv < 0)
> +			goto abort;
> +		data->fan_command[i] = rv;
> +
> +		rv = max31785_read_fan_data(client, i,
> +				MAX31785_REG_MFR_FAN_CONFIG, 1);
> +		if (rv < 0)
> +			goto abort;
> +		data->mfr_fan_config[i] = rv;
> +
> +		if (!((data->fan_config[i]
> +			& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
> +			|| is_automatic_control_mode(data, i))) {
> +			data->pwm[i] = 0;
> +		}
> +	}
> +
> +	dev_info(&client->dev, "Driver initialized\n");

Noise; please drop.

> +
> +abort:
> +	mutex_unlock(&data->device_lock);
> +	return rv;
> +}
> +
> +/* Return 0 if detection is successful, -ENODEV otherwise */
> +static int max31785_detect(struct i2c_client *client,
> +			  struct i2c_board_info *info)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	int rv, manufacturer, model;
> +
> +	if (!i2c_check_functionality(adapter,
> +			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	 dev_info(&adapter->dev, "Probing for MAX31785\n");
> +
Moise; please drop.

> +	/* Probe manufacturer / model registers */
> +	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_ID);
> +	if (rv < 0)
> +		return -ENODEV;
> +	manufacturer = rv;

The manufacturer variable is unnecessary. Also see below.

	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_ID);
	if (rv < 0 || rv != 0x4d)
		return -ENODEV;

> +
> +	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_MODEL);
> +	if (rv < 0)
> +		return -ENODEV;
> +	model = rv;
> +
> +	if (manufacturer != 0x4d)
> +		return -ENODEV;
> +	if (model != 0x53)
> +		return -ENODEV;
> +
> +	dev_info(&adapter->dev,
> +		"Detected MAX31785 at %d,0x%02x with"
> +		" MANUFACTURER: 0x%02x MODEL: %02x\n",
> +		i2c_adapter_id(client->adapter), client->addr,
> +		manufacturer, model);

Output of manufacturer and model is unnecessary. It will always be 0x4d and
0x53.

> +
> +	strlcpy(info->type, "max31785", I2C_NAME_SIZE);
> +
> +	return 0;
> +}
> +
> +static int max31785_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	struct device *dev = &client->dev;
> +	struct max31785_data *data;
> +	struct device *hwmon_dev;
> +	int err;
> +
> +	if (!i2c_check_functionality(adapter,
> +			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->device_lock);
> +
> +	/*
> +	 * Initialize the max31785 chip
> +	 */
> +	err = max31785_init_client(client, data);
> +	if (err)
> +		return err;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
> +			client->name, data, max31785_groups);
> +
As mentioned above, please try using devm_hwmon_device_register_with_info().
You'll find the documentation and some converted drivers in -next.

> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id max31785_id[] = {
> +	{ "max31785", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max31785_id);
> +
> +static struct i2c_driver max31785_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.probe		= max31785_probe,
> +	.driver = {
> +		.name	= "max31785",
> +	},
> +	.id_table	= max31785_id,
> +	.detect		= max31785_detect,
> +	.address_list	= normal_i2c,
> +};
> +
> +module_i2c_driver(max31785_driver);
> +
> +MODULE_AUTHOR("Timothy Pearson <tpearson@raptorengineering.com>");
> +MODULE_DESCRIPTION("MAX31785 sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
