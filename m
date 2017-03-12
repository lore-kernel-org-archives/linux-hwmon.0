Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56985 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755784AbdCLW3y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2017 18:29:54 -0400
Subject: Re: [PATCH linux v8 2/6] hwmon: occ: Add sysfs interface
To: Eddie James <eajames@linux.vnet.ibm.com>
References: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1487104463-4253-3-git-send-email-eajames@linux.vnet.ibm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        benh@kernel.crashing.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <696d4bee-f1d1-5f98-808f-fd76889347eb@roeck-us.net>
Date: Sun, 12 Mar 2017 15:29:48 -0700
MIME-Version: 1.0
In-Reply-To: <1487104463-4253-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/14/2017 12:34 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add a generic mechanism to expose the sensors provided by the OCC in
> sysfs.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/hwmon/occ       |  62 +++++++++++
>  drivers/hwmon/occ/Makefile    |   2 +-
>  drivers/hwmon/occ/occ_sysfs.c | 245 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/occ_sysfs.h |  25 +++++
>  4 files changed, 333 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hwmon/occ/occ_sysfs.c
>  create mode 100644 drivers/hwmon/occ/occ_sysfs.h
>
> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> index d1c863b..580af26 100644
> --- a/Documentation/hwmon/occ
> +++ b/Documentation/hwmon/occ
> @@ -27,6 +27,68 @@ Currently, all versions of the OCC support four types of sensor data: power,
>  temperature, frequency, and "caps," which indicate limits and thresholds used
>  internally on the OCC.
>
> +sysfs Entries
> +-------------
> +
> +The OCC driver uses the hwmon sysfs framework to provide data to userspace.
> +
> +The driver exports a number of sysfs files for each type of sensor. The
> +sensor-specific files vary depending on the processor type, though many of the
> +attributes are common for both the POWER8 and POWER9.
> +
> +The hwmon interface cannot define every type of sensor that may be used.
> +Therefore, the frequency sensor on the OCC uses the "input" type sensor defined
> +by the hwmon interface, rather than defining a new type of custom sensor.
> +
> +Below are detailed the names and meaning of each sensor file for both types of
> +processors. All sensors are read-only unless otherwise specified. <x> indicates
> +the hwmon index. sensor id indicates the unique internal OCC identifer. Please
> +see the POWER OCC specification for details on all these sensor values.
> +
> +frequency:
> +	all processors:
> +		in<x>_input - frequency value
> +		in<x>_label - sensor id
> +temperature:
> +	POWER8:
> +		temp<x>_input - temperature value
> +		temp<x>_label - sensor id
> +	POWER9 (in addition to above):
> +		temp<x>_type - FRU type
> +
> +power:
> +	POWER8:
> +		power<x>_input - power value
> +		power<x>_label - sensor id
> +		power<x>_average - accumulator
> +		power<x>_average_interval - update tag (number of samples in
> +			accumulator)
> +	POWER9:
> +		power<x>_input - power value
> +		power<x>_label - sensor id
> +		power<x>_average_min - accumulator[0]
> +		power<x>_average_max - accumulator[1] (64 bits total)
> +		power<x>_average_interval - update tag
> +		power<x>_reset_history - (function_id | (apss_channel << 8)
> +
> +caps:
> +	POWER8:
> +		power<x>_cap - current powercap
> +		power<x>_cap_max - max powercap
> +		power<x>_cap_min - min powercap
> +		power<x>_max - normal powercap
> +		power<x>_alarm - user powercap, r/w
> +	POWER9:
> +		power<x>_cap_alarm - user powercap source
> +
> +The driver also provides two sysfs entries through hwmon to better
> +control the driver and monitor the master OCC. Though there may be multiple
> +OCCs present on the system, these two files are only present for the "master"
> +OCC.
> +	name - read the name of the driver
> +	update_interval - read or write the minimum interval for polling the
> +		OCC.
> +
>  BMC - Host Communications
>  -------------------------
>
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index 3ed79a5..67b5367 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1 +1 @@
> -obj-$(CONFIG_SENSORS_IBM_OCC) += occ.o
> +obj-$(CONFIG_SENSORS_IBM_OCC) += occ.o occ_sysfs.o
> diff --git a/drivers/hwmon/occ/occ_sysfs.c b/drivers/hwmon/occ/occ_sysfs.c
> new file mode 100644
> index 0000000..d6baf8d
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_sysfs.c
> @@ -0,0 +1,245 @@
> +/*
> + * occ_sysfs.c - OCC sysfs interface
> + *
> + * This file contains the methods and data structures for implementing the OCC
> + * hwmon sysfs entries.
> + *
> + * Copyright 2017 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include "occ.h"
> +#include "occ_sysfs.h"
> +
> +#define OCC_HWMON_NAME_LENGTH	32
> +
> +struct occ_sysfs {
> +	struct device *dev;
> +	struct occ *occ;
> +
> +	char hwmon_name[OCC_HWMON_NAME_LENGTH + 1];
> +	const u32 *sensor_hwmon_configs;
> +	struct hwmon_channel_info **occ_sensors;
> +	struct hwmon_chip_info occ_info;
> +	u16 user_powercap;
> +};
> +
> +static int occ_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *val)
> +{
> +	int rc;
> +	struct occ_sysfs *driver = dev_get_drvdata(dev);
> +	struct occ *occ = driver->occ;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		rc = occ_get_sensor_field(occ, FREQ, channel, attr, val);
> +		break;
> +	case hwmon_temp:
> +		rc = occ_get_sensor_field(occ, TEMP, channel, attr, val);
> +		break;
> +	case hwmon_power:
> +		rc = occ_get_sensor_field(occ, POWER, channel, attr, val);
> +		break;
> +	default:
> +		rc = -EOPNOTSUPP;
> +	}
> +
> +	return rc;
> +}
> +
> +static int occ_hwmon_read_string(struct device *dev,
> +				 enum hwmon_sensor_types type, u32 attr,
> +				 int channel, char **str)

We have changed the last parameter to const char **str, meaning this no longer works.

> +{
> +	int rc;
> +	unsigned long val = 0;
> +
> +	if (!((type == hwmon_in && attr == hwmon_in_label) ||
> +	    (type == hwmon_temp && attr == hwmon_temp_label) ||
> +	    (type == hwmon_power && attr == hwmon_power_label)))
> +		return -EOPNOTSUPP;
> +
> +	/* will fetch the "label", the sensor_id */
> +	rc = occ_hwmon_read(dev, type, attr, channel, &val);
> +	if (rc < 0)
> +		return rc;
> +
> +	rc = snprintf(*str, PAGE_SIZE - 1, "%lu", val);

Umm ... this doesn't work anyway. It is supposed to be something like

	*str = <some string>;

Doesn't this crash ?

Guenter

> +	if (rc > 0)
> +		rc = 0;
> +
> +	return rc;
> +}
> +
> +static int occ_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)
> +{
> +	int rc;
> +	struct occ_sysfs *driver = dev_get_drvdata(dev);
> +
> +	if (type == hwmon_power && attr == hwmon_power_alarm) {
> +		rc = occ_set_user_powercap(driver->occ, val);
> +		if (rc) {
> +			dev_err(dev, "set user powercap failed:%d\n", rc);
> +			return rc;
> +		}
> +
> +		driver->user_powercap = val;
> +
> +		return rc;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static umode_t occ_is_visible(const void *data, enum hwmon_sensor_types type,
> +			      u32 attr, int channel)
> +{
> +	const struct occ_sysfs *driver = data;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		if (attr == hwmon_chip_update_interval)
> +			return 0644;
> +		break;
> +	case hwmon_in:
> +		if (BIT(attr) & driver->sensor_hwmon_configs[0])
> +			return 0444;
> +		break;
> +	case hwmon_temp:
> +		if (BIT(attr) & driver->sensor_hwmon_configs[1])
> +			return 0444;
> +		break;
> +	case hwmon_power:
> +		/* user power limit */
> +		if (attr == hwmon_power_alarm)
> +			return 0644;
> +		else if ((BIT(attr) & driver->sensor_hwmon_configs[2]) ||
> +			 (BIT(attr) & driver->sensor_hwmon_configs[3]))
> +			return 0444;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops occ_hwmon_ops = {
> +	.is_visible = occ_is_visible,
> +	.read = occ_hwmon_read,
> +	.read_string = occ_hwmon_read_string,
> +	.write = occ_hwmon_write,
> +};
> +
> +static const enum hwmon_sensor_types occ_sensor_types[MAX_OCC_SENSOR_TYPE] = {
> +	hwmon_in,
> +	hwmon_temp,
> +	hwmon_power,
> +	hwmon_power
> +};
> +
> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
> +				  const u32 *sensor_hwmon_configs,
> +				  const char *name)
> +{
> +	int rc, i, j, num_sensors, index = 0, id;
> +	char *brk;
> +	struct occ_blocks *resp = NULL;
> +	u32 *sensor_config;
> +	struct occ_sysfs *hwmon = devm_kzalloc(dev, sizeof(struct occ_sysfs),
> +					       GFP_KERNEL);
> +	if (!hwmon)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* need space for null-termination */
> +	hwmon->occ_sensors =
> +		devm_kzalloc(dev, sizeof(struct hwmon_channel_info *) *
> +			     (MAX_OCC_SENSOR_TYPE + 1), GFP_KERNEL);
> +	if (!hwmon->occ_sensors)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hwmon->occ = occ;
> +	hwmon->sensor_hwmon_configs = sensor_hwmon_configs;
> +	hwmon->occ_info.ops = &occ_hwmon_ops;
> +	hwmon->occ_info.info =
> +		(const struct hwmon_channel_info **)hwmon->occ_sensors;
> +
> +	occ_get_response_blocks(occ, &resp);
> +
> +	for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> +		resp->sensor_block_id[i] = -1;
> +
> +	/* read sensor data from occ */
> +	rc = occ_update_device(occ);
> +	if (rc)
> +		return ERR_PTR(rc);
> +
> +	for (i = 0; i < MAX_OCC_SENSOR_TYPE; i++) {
> +		id = resp->sensor_block_id[i];
> +		if (id < 0)
> +			continue;
> +
> +		num_sensors = resp->blocks[id].header.num_sensors;
> +		/* need null-termination */
> +		sensor_config = devm_kzalloc(dev,
> +					     sizeof(u32) * (num_sensors + 1),
> +					     GFP_KERNEL);
> +		if (!sensor_config)
> +			return ERR_PTR(-ENOMEM);
> +
> +		for (j = 0; j < num_sensors; j++)
> +			sensor_config[j] = sensor_hwmon_configs[i];
> +
> +		hwmon->occ_sensors[index] =
> +			devm_kzalloc(dev, sizeof(struct hwmon_channel_info),
> +				     GFP_KERNEL);
> +		if (!hwmon->occ_sensors[index])
> +			return ERR_PTR(-ENOMEM);
> +
> +		hwmon->occ_sensors[index]->type = occ_sensor_types[i];
> +		hwmon->occ_sensors[index]->config = sensor_config;
> +		index++;
> +	}
> +
> +	/* search for bad chars */
> +	strncpy(hwmon->hwmon_name, name, OCC_HWMON_NAME_LENGTH);
> +	brk = strpbrk(hwmon->hwmon_name, "-* \t\n");
> +	while (brk) {
> +		*brk = '_';
> +		brk = strpbrk(brk,  "-* \t\n");
> +	}
> +
> +	hwmon->dev = devm_hwmon_device_register_with_info(dev,
> +							  hwmon->hwmon_name,
> +							  hwmon,
> +							  &hwmon->occ_info,
> +							  NULL);
> +	if (IS_ERR(hwmon->dev)) {
> +		dev_err(dev, "cannot register hwmon device %s: %ld\n",
> +			hwmon->hwmon_name, PTR_ERR(hwmon->dev));
> +		return ERR_CAST(hwmon->dev);
> +	}
> +
> +	return hwmon;
> +}
> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("OCC sysfs driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_sysfs.h b/drivers/hwmon/occ/occ_sysfs.h
> new file mode 100644
> index 0000000..fcd4f59a
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_sysfs.h
> @@ -0,0 +1,25 @@
> +/*
> + * occ_sysfs.h - OCC sysfs interface
> + *
> + * This file contains the data structures and function prototypes for the OCC
> + * hwmon sysfs entries.
> + *
> + * Copyright 2017 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __OCC_SYSFS_H__
> +#define __OCC_SYSFS_H__
> +
> +struct occ;
> +struct device;
> +struct occ_sysfs;
> +
> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
> +				  const u32 *sensor_hwmon_configs,
> +				  const char *name);
> +#endif /* __OCC_SYSFS_H__ */
>

