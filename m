Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56324 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751136AbdAWWPr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Jan 2017 17:15:47 -0500
Date: Mon, 23 Jan 2017 14:15:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Edward James <eajames@us.ibm.com>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com,
        jdelvare@suse.com, joel@jms.id.au, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Subject: Re: [PATCH linux v3 2/6] hwmon: occ: Add sysfs interface
Message-ID: <20170123221540.GA31280@roeck-us.net>
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-3-git-send-email-eajames.ibm@gmail.com>
 <40f255c4-b490-5548-3c1e-1be15f3a2a5d@roeck-us.net>
 <OFE34EEAB4.7855326B-ON002580B1.0078AA61-862580B1.0078FABB@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFE34EEAB4.7855326B-ON002580B1.0078AA61-862580B1.0078FABB@notes.na.collabserv.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jan 23, 2017 at 04:01:25PM -0600, Edward James wrote:
> 
> 
> On Sat, Jan 21, 2017 at 12:08 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
> >>
> >> From: "Edward A. James" <eajames@us.ibm.com>
> >>
> >> Add a generic mechanism to expose the sensors provided by the OCC in
> >> sysfs.
> >>
> >> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >>  Documentation/hwmon/occ       |  62 ++++++++++
> >>  drivers/hwmon/occ/Makefile    |   2 +-
> >>  drivers/hwmon/occ/occ_sysfs.c | 271
> >> ++++++++++++++++++++++++++++++++++++++++++
> >>  drivers/hwmon/occ/occ_sysfs.h |  44 +++++++
> >>  4 files changed, 378 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/hwmon/occ/occ_sysfs.c
> >>  create mode 100644 drivers/hwmon/occ/occ_sysfs.h
> >>
> >> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> >> index 79d1642..d0bdf06 100644
> >> --- a/Documentation/hwmon/occ
> >> +++ b/Documentation/hwmon/occ
> >> @@ -25,6 +25,68 @@ Currently, all versions of the OCC support four types
> >> of sensor data: power,
> >>  temperature, frequency, and "caps," which indicate limits and
> thresholds
> >> used
> >>  internally on the OCC.
> >>
> >> +sysfs Entries
> >> +-------------
> >> +
> >> +The OCC driver uses the hwmon sysfs framework to provide data to
> >> userspace.
> >> +
> >> +The driver exports a number of sysfs files for each type of sensor. The
> >> +sensor-specific files vary depending on the processor type, though many
> >> of the
> >> +attributes are common for both the POWER8 and POWER9.
> >> +
> >> +The hwmon interface cannot define every type of sensor that may be
> used.
> >> +Therefore, the frequency sensor on the OCC uses the "input" type sensor
> >> defined
> >> +by the hwmon interface, rather than defining a new type of custom
> sensor.
> >> +
> >> +Below are detailed the names and meaning of each sensor file for both
> >> types of
> >> +processors. All sensors are read-only unless otherwise specified. <x>
> >> indicates
> >> +the hwmon index. sensor id indicates the unique internal OCC identifer.
> >> Please
> >> +see the POWER OCC specification for details on all these sensor values.
> >> +
> >> +frequency:
> >> +       all processors:
> >> +               in<x>_input - frequency value
> >> +               in<x>_label - sensor id
> >> +temperature:
> >> +       POWER8:
> >> +               temp<x>_input - temperature value
> >> +               temp<x>_label - sensor id
> >> +       POWER9 (in addition to above):
> >> +               temp<x>_type - FRU type
> >> +
> >> +power:
> >> +       POWER8:
> >> +               power<x>_input - power value
> >> +               power<x>_label - sensor id
> >> +               power<x>_average - accumulator
> >> +               power<x>_average_interval - update tag (number of
> samples
> >> in
> >> +                       accumulator)
> >> +       POWER9:
> >> +               power<x>_input - power value
> >> +               power<x>_label - sensor id
> >> +               power<x>_average_min - accumulator[0]
> >> +               power<x>_average_max - accumulator[1] (64 bits total)
> >> +               power<x>_average_interval - update tag
> >> +               power<x>_reset_history - (function_id | (apss_channel <<
> >> 8)
> >> +
> >> +caps:
> >> +       POWER8:
> >> +               power<x>_cap - current powercap
> >> +               power<x>_cap_max - max powercap
> >> +               power<x>_cap_min - min powercap
> >> +               power<x>_max - normal powercap
> >> +               power<x>_alarm - user powercap, r/w
> >> +       POWER9:
> >> +               power<x>_cap_alarm - user powercap source
> >> +
> >> +The driver also provides two sysfs entries through hwmon to better
> >> +control the driver and monitor the master OCC. Though there may be
> >> multiple
> >> +OCCs present on the system, these two files are only present for the
> >> "master"
> >> +OCC.
> >> +       name - read the name of the driver
> >> +       update_interval - read or write the minimum interval for polling
> >> the
> >> +               OCC.
> >> +
> >>  BMC - Host Communications
> >>  -------------------------
> >>
> >> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> >> index 93cb52f..a6881f9 100644
> >> --- a/drivers/hwmon/occ/Makefile
> >> +++ b/drivers/hwmon/occ/Makefile
> >> @@ -1 +1 @@
> >> -obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o
> >> +obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
> >> diff --git a/drivers/hwmon/occ/occ_sysfs.c
> b/drivers/hwmon/occ/occ_sysfs.c
> >> new file mode 100644
> >> index 0000000..2f20c40
> >> --- /dev/null
> >> +++ b/drivers/hwmon/occ/occ_sysfs.c
> >> @@ -0,0 +1,271 @@
> >> +/*
> >> + * occ_sysfs.c - OCC sysfs interface
> >> + *
> >> + * This file contains the methods and data structures for implementing
> >> the OCC
> >> + * hwmon sysfs entries.
> >> + *
> >> + * Copyright 2016 IBM Corp.
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> >> + * GNU General Public License for more details.
> >> + */
> >> +
> >> +#include <linux/delay.h>
> >> +#include <linux/device.h>
> >> +#include <linux/err.h>
> >> +#include <linux/hwmon.h>
> >> +#include <linux/hwmon-sysfs.h>
> >> +#include <linux/init.h>
> >> +#include <linux/jiffies.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/slab.h>
> >> +#include "occ.h"
> >> +#include "occ_sysfs.h"
> >> +
> >> +#define RESP_RETURN_CMD_INVAL  0x13
> >> +
> >> +static int occ_hwmon_read(struct device *dev, enum hwmon_sensor_types
> >> type,
> >> +                         u32 attr, int channel, long *val)
> >> +{
> >> +       int rc = 0;
> >
> >
> > Unnecessary initialization.
> 
> Got it.
> 
> >
> >
> >> +       struct occ_sysfs *driver = dev_get_drvdata(dev);
> >> +       struct occ *occ = driver->occ;
> >> +
> >> +       switch (type) {
> >> +       case hwmon_in:
> >> +               rc = occ_get_sensor_value(occ, FREQ, channel, attr,
> val);
> >> +               break;
> >> +       case hwmon_temp:
> >> +               rc = occ_get_sensor_value(occ, TEMP, channel, attr,
> val);
> >> +               break;
> >> +       case hwmon_power:
> >> +               rc = occ_get_sensor_value(occ, POWER, channel, attr,
> val);
> >> +               break;
> >> +       default:
> >> +               rc = -EOPNOTSUPP;
> >> +       }
> >> +
> >> +       return rc;
> >> +}
> >> +
> >> +static int occ_hwmon_read_string(struct device *dev,
> >> +                                enum hwmon_sensor_types type, u32 attr,
> >> +                                int channel, char **str)
> >> +{
> >> +       int rc;
> >> +       unsigned long val = 0;
> >> +
> >> +       if (!((type == hwmon_in && attr == hwmon_in_label) ||
> >> +           (type == hwmon_temp && attr == hwmon_temp_label) ||
> >> +           (type == hwmon_power && attr == hwmon_power_label)))
> >> +               return -EOPNOTSUPP;
> >> +
> >> +       rc = occ_hwmon_read(dev, type, attr, channel, &val);
> >> +       if (rc < 0)
> >> +               return rc;
> >> +
> >> +       rc = snprintf(*str, PAGE_SIZE - 1, "%ld", val);
> >
> >
> > val is unsigned long.
> >
> > I am quite confused what this is for, though. The function is used for
> > string attributes,
> > or in other words for labels. What is the benefit of having a label that
> > returns the same
> > data as the value attribute ? Is this maybe a misunderstanding ?
> 
> So this does work, though I admit it's a bit confusing.
> occ_get_sensor_value returns either the value or the occ sensor id
> depending on the "type" passed in. I'll rename occ_get_sensor_value
> and add a comment.
> 
> >
> >> +       if (rc > 0)
> >> +               rc = 0;
> >> +
> >> +       return rc;
> >> +}
> >> +
> >> +static int occ_hwmon_write(struct device *dev, enum hwmon_sensor_types
> >> type,
> >> +                          u32 attr, int channel, long val)
> >> +{
> >> +       int rc = 0;
> >> +       struct occ_sysfs *driver = dev_get_drvdata(dev);
> >> +
> >> +       if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
> >> +               occ_set_update_interval(driver->occ, val);
> >
> >
> > As mentioned in the other patch, please drop. This is not the intended
> use
> > case
> > for this attribute.
> 
> OK.
> 
> >
> >
> >> +               return 0;
> >> +       } else if (type == hwmon_power && attr == hwmon_power_alarm) {
> >> +               rc = occ_set_user_powercap(driver->occ, val);
> >> +               if (rc) {
> >> +                       if (rc == RESP_RETURN_CMD_INVAL) {
> >> +                               dev_err(dev,
> >> +                                       "set invalid powercap value:
> >> %ld\n",
> >> +                                       val);
> >> +                               return -EINVAL;
> >> +                       }
> >> +
> >> +                       dev_err(dev, "set user powercap failed: 0x:%x
> \n",
> >> rc);
> >> +                       return rc;
> >> +               }
> >> +
> >> +               driver->user_powercap = val;
> >> +
> >> +               return rc;
> >> +       }
> >> +
> >> +       return -EOPNOTSUPP;
> >> +}
> >> +
> >> +static umode_t occ_is_visible(const void *data, enum hwmon_sensor_types
> >> type,
> >> +                             u32 attr, int channel)
> >> +{
> >> +       const struct occ_sysfs *driver = data;
> >> +
> >> +       switch (type) {
> >> +       case hwmon_chip:
> >> +               if (attr == hwmon_chip_update_interval)
> >> +                       return S_IRUGO | S_IWUSR;
> >> +               break;
> >> +       case hwmon_in:
> >> +               if (BIT(attr) & driver->sensor_hwmon_configs[0])
> >> +                       return S_IRUGO;
> >> +               break;
> >> +       case hwmon_temp:
> >> +               if (BIT(attr) & driver->sensor_hwmon_configs[1])
> >> +                       return S_IRUGO;
> >> +               break;
> >> +       case hwmon_power:
> >> +               /* user power limit */
> >> +               if (attr == hwmon_power_alarm)
> >> +                       return S_IRUGO | S_IWUSR;
> >> +               else if ((BIT(attr) & driver->sensor_hwmon_configs[2])
> ||
> >> +                        (BIT(attr) & driver->sensor_hwmon_configs[3]))
> >> +                       return S_IRUGO;
> >> +               break;
> >> +       default:
> >> +               return 0;
> >
> >
> > Might as well use break; here for consistency.
> >
> >
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct hwmon_ops occ_hwmon_ops = {
> >> +       .is_visible = occ_is_visible,
> >> +       .read = occ_hwmon_read,
> >> +       .read_string = occ_hwmon_read_string,
> >> +       .write = occ_hwmon_write,
> >> +};
> >> +
> >> +static const u32 occ_chip_config[] = {
> >> +       HWMON_C_UPDATE_INTERVAL,
> >> +       0
> >> +};
> >> +
> >> +static const struct hwmon_channel_info occ_chip = {
> >> +       .type = hwmon_chip,
> >> +       .config = occ_chip_config
> >> +};
> >> +
> >> +static const enum hwmon_sensor_types
> >> occ_sensor_types[MAX_OCC_SENSOR_TYPE] = {
> >> +       hwmon_in,
> >> +       hwmon_temp,
> >> +       hwmon_power,
> >> +       hwmon_power
> >> +};
> >> +
> >> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
> >> +                                 const u32 *sensor_hwmon_configs,
> >> +                                 const char *name)
> >> +{
> >> +       bool master_occ = false;
> >> +       int rc, i, j, sensor_num, index = 0, id;
> >> +       char *brk;
> >> +       struct occ_blocks *resp = NULL;
> >> +       u32 *sensor_config;
> >> +       struct occ_sysfs *hwmon = devm_kzalloc(dev, sizeof(struct
> >> occ_sysfs),
> >> +                                              GFP_KERNEL);
> >> +       if (!hwmon)
> >> +               return ERR_PTR(-ENOMEM);
> >> +
> >> +       /* need space for null-termination and occ chip */
> >> +       hwmon->occ_sensors =
> >> +               devm_kzalloc(dev, sizeof(struct hwmon_channel_info *) *
> >> +                            (MAX_OCC_SENSOR_TYPE + 2), GFP_KERNEL);
> >> +       if (!hwmon->occ_sensors)
> >> +               return ERR_PTR(-ENOMEM);
> >> +
> >> +       hwmon->occ = occ;
> >> +       hwmon->sensor_hwmon_configs = (u32 *)sensor_hwmon_configs;
> >
> >
> > Either this is a const or it isn't. If it isn't, it should not be passed
> in
> > as const.
> > If it is, it can be declared const in struct occ_sysfs.
> 
> It is const, i'll fix.
> 
> >
> >
> >> +       hwmon->occ_info.ops = &occ_hwmon_ops;
> >> +       hwmon->occ_info.info =
> >> +               (const struct hwmon_channel_info **)hwmon->occ_sensors;
> >
> >
> > Why is this typecast needed ?
> 
> struct hwmon_chip_info {
>         const struct hwmon_ops *ops;
>         const struct hwmon_channel_info **info;
> };
> 
> My compiler throws an error without a cast here.
> 
> occ_sysfs.c:195:23: error: assignment from incompatible pointer type
> [-Werror=incompatible-pointer-types]
> |   hwmon->occ_info.info = hwmon->occ_sensors;
> 
> occ_sensors is not const, as it's dynamically zero-allocated and then
> if we poll and get a sensor, we allocate a new hwmon_channel_info. Not
> sure what the best solution is here except to cast.
> 

Your statement makes me quite concerned. "if we poll and get a sensor, we
allocate a new hwmon_channel_info". Are you doing that before or after
registering with the hwmon core ? Hopefully before.

> >
> >
> >> +
> >> +       occ_get_response_blocks(occ, &resp);
> >> +
> >> +       for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> >> +               resp->sensor_block_id[i] = -1;
> >> +
> >> +       /* read sensor data from occ */
> >> +       rc = occ_update_device(occ);
> >> +       if (rc) {
> >> +               dev_err(dev, "cannot get occ sensor data: %d\n", rc);
> >> +               return ERR_PTR(rc);
> >> +       }
> >> +       if (!resp->blocks)
> >> +               return ERR_PTR(-ENOMEM);
> >> +
> >> +       master_occ = resp->sensor_block_id[CAPS] >= 0;
> >> +
> >> +       for (i = 0; i < MAX_OCC_SENSOR_TYPE; i++) {
> >> +               id = resp->sensor_block_id[i];
> >> +               if (id < 0)
> >> +                       continue;
> >> +
> >> +               sensor_num = resp->blocks[id].header.sensor_num;
> >> +               /* need null-termination */
> >> +               sensor_config = devm_kzalloc(dev,
> >> +                                            sizeof(u32) * (sensor_num +
> >> 1),
> >> +                                            GFP_KERNEL);
> >> +               if (!sensor_config)
> >> +                       return ERR_PTR(-ENOMEM);
> >> +
> >> +               for (j = 0; j < sensor_num; j++)
> >> +                       sensor_config[j] = sensor_hwmon_configs[i];
> >> +
> >> +               hwmon->occ_sensors[index] =
> >> +                       devm_kzalloc(dev, sizeof(struct
> >> hwmon_channel_info),
> >> +                                    GFP_KERNEL);
> >> +               if (!hwmon->occ_sensors[index])
> >> +                       return ERR_PTR(-ENOMEM);
> >> +
> >> +               hwmon->occ_sensors[index]->type = occ_sensor_types[i];
> >> +               hwmon->occ_sensors[index]->config = sensor_config;
> >> +               index++;
> >> +       }
> >
> >
> > I had the impression from patch 1 that the number of sensors can change
> at
> > runtime.
> > If so, this doesn't really work well; the sysfs attributes won't be
> updated
> > in this
> > case.
> >
> > Can it really happen that the sensor information can change ?
> 
> Well, the number of sensors won't change while we are running. But we
> don't know how many sensors we have when we start up. So this first
> poll will tell us how many we need and allow the driver to initialize
> the correct number of hwmon attributes. But yes, it shouldn't change while
> we
> are running.
> 
I'll have to look into the other patch again. I seem to recall that it does
handle changing number of sensors, but I may be wrong.

> >
> >> +
> >> +       /* only need one of these for any number of occs */
> >> +       if (master_occ)
> >> +               hwmon->occ_sensors[index] =
> >> +                       (struct hwmon_channel_info *)&occ_chip;
> >
> >
> > Why this typecast ?
> 
> occ_chip is const but my occ_sensors field isn't.
> 
Hmm .. I'll have to have a closer look. Maybe I need to make the core fields
non-const. Having to use typecasts isn't really desirable and defeats the
purpose.

Guenter

> >
> >
> >> +
> >> +       /* search for bad chars */
> >> +       strncpy(hwmon->hwmon_name, name, OCC_HWMON_NAME_LENGTH);
> >> +       brk = strpbrk(hwmon->hwmon_name, "-* \t\n");
> >> +       while (brk) {
> >> +               *brk = '_';
> >> +               brk = strpbrk(brk,  "-* \t\n");
> >> +       }
> >> +
> >> +       hwmon->dev = devm_hwmon_device_register_with_info(dev,
> >> +
> >> hwmon->hwmon_name,
> >> +                                                         hwmon,
> >> +
> >> &hwmon->occ_info,
> >> +                                                         NULL);
> >> +       if (IS_ERR(hwmon->dev)) {
> >> +               dev_err(dev, "cannot register hwmon device %s: %ld\n",
> >> +                       hwmon->hwmon_name, PTR_ERR(hwmon->dev));
> >> +               return ERR_CAST(hwmon->dev);
> >> +       }
> >> +
> >> +       return hwmon;
> >> +}
> >> +EXPORT_SYMBOL(occ_sysfs_start);
> >> +
> >> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> >> +MODULE_DESCRIPTION("OCC sysfs driver");
> >> +MODULE_LICENSE("GPL");
> >> diff --git a/drivers/hwmon/occ/occ_sysfs.h
> b/drivers/hwmon/occ/occ_sysfs.h
> >> new file mode 100644
> >> index 0000000..7de92e7
> >> --- /dev/null
> >> +++ b/drivers/hwmon/occ/occ_sysfs.h
> >> @@ -0,0 +1,44 @@
> >> +/*
> >> + * occ_sysfs.h - OCC sysfs interface
> >> + *
> >> + * This file contains the data structures and function prototypes for
> the
> >> OCC
> >> + * hwmon sysfs entries.
> >> + *
> >> + * Copyright 2016 IBM Corp.
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> >> + * GNU General Public License for more details.
> >> + */
> >> +
> >> +#ifndef __OCC_SYSFS_H__
> >> +#define __OCC_SYSFS_H__
> >> +
> >> +#include <linux/hwmon.h>
> >> +
> >> +struct occ;
> >> +struct device;
> >> +
> >> +#define OCC_HWMON_NAME_LENGTH  32
> >> +
> >> +struct occ_sysfs {
> >> +       struct device *dev;
> >> +       struct occ *occ;
> >> +
> >> +       char hwmon_name[OCC_HWMON_NAME_LENGTH + 1];
> >> +       u32 *sensor_hwmon_configs;
> >> +       struct hwmon_channel_info **occ_sensors;
> >> +       struct hwmon_chip_info occ_info;
> >> +       u16 user_powercap;
> >> +};
> >
> >
> > Is this information used outside the sysfs code ? If not, it should be
> > defined
> > in the source file and not be available outside of it.
> 
> OK. It is used in p8_occ_i2c.c but none of the members are accessed so
> we shouldn't need it defined there, just declared, you're right.
> 
> 
> >
> >
> >> +
> >> +struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
> >> +                                 const u32 *sensor_hwmon_configs,
> >> +                                 const char *name);
> >> +#endif /* __OCC_SYSFS_H__ */
> >>
> >
