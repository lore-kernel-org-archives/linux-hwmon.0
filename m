Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43508 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbdAWUVX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Jan 2017 15:21:23 -0500
Date: Mon, 23 Jan 2017 12:21:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Edward James <eajames@us.ibm.com>
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net,
        devicetree@vger.kernel.org, eajames.ibm@gmail.com,
        jdelvare@suse.com, joel@jms.id.au, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Subject: Re: [PATCH linux v3 1/6] hwmon: Add core On-Chip Controller support
 for POWER CPUs
Message-ID: <20170123202104.GA28847@roeck-us.net>
References: <1484601219-30196-1-git-send-email-eajames.ibm@gmail.com>
 <1484601219-30196-2-git-send-email-eajames.ibm@gmail.com>
 <11e7a9a0-2735-79fc-226f-e725aefa4df7@roeck-us.net>
 <OFFB249CF0.36530F73-ON002580B1.006A773E-862580B1.006B038A@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFFB249CF0.36530F73-ON002580B1.006A773E-862580B1.006B038A@notes.na.collabserv.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jan 23, 2017 at 01:28:52PM -0600, Edward James wrote:
> I still just can't get gmail to reply to this. Thanks for the review.
> 
> On Sat, Jan 21, 2017 at 11:49 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 01/16/2017 01:13 PM, eajames.ibm@gmail.com wrote:
> >>
> >> From: "Edward A. James" <eajames@us.ibm.com>
> >>
> >> Add core support for polling the OCC for it's sensor data and parsing
> that
> >> data into sensor-specific information.
> >>
> >> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >>  Documentation/hwmon/occ    |  40 ++++
> >>  MAINTAINERS                |   7 +
> >>  drivers/hwmon/Kconfig      |   2 +
> >>  drivers/hwmon/Makefile     |   1 +
> >>  drivers/hwmon/occ/Kconfig  |  15 ++
> >>  drivers/hwmon/occ/Makefile |   1 +
> >>  drivers/hwmon/occ/occ.c    | 522
> >> +++++++++++++++++++++++++++++++++++++++++++++
> >>  drivers/hwmon/occ/occ.h    |  81 +++++++
> >>  drivers/hwmon/occ/scom.h   |  47 ++++
> >>  9 files changed, 716 insertions(+)
> >>  create mode 100644 Documentation/hwmon/occ
> >>  create mode 100644 drivers/hwmon/occ/Kconfig
> >>  create mode 100644 drivers/hwmon/occ/Makefile
> >>  create mode 100644 drivers/hwmon/occ/occ.c
> >>  create mode 100644 drivers/hwmon/occ/occ.h
> >>  create mode 100644 drivers/hwmon/occ/scom.h
> >>
> >> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> >> new file mode 100644
> >> index 0000000..79d1642
> >> --- /dev/null
> >> +++ b/Documentation/hwmon/occ
> >> @@ -0,0 +1,40 @@
> >> +Kernel driver occ
> >> +=================
> >> +
> >> +Supported chips:
> >> + * ASPEED AST2400
> >> + * ASPEED AST2500
> >> +
> >> +Please note that the chip must be connected to a POWER8 or POWER9
> >> processor
> >> +(see the BMC - Host Communications section).
> >> +
> >> +Author: Eddie James <eajames@us.ibm.com>
> >> +
> >> +Description
> >> +-----------
> >> +
> >> +This driver implements support for the OCC (On-Chip Controller) on the
> >> IBM
> >> +POWER8 and POWER9 processors, from a BMC (Baseboard Management
> >> Controller). The
> >> +OCC is an embedded processor that provides real time power and thermal
> >> +monitoring.
> >> +
> >> +This driver provides an interface on a BMC to poll OCC sensor data, set
> >> user
> >> +power caps, and perform some basic OCC error handling.
> >> +
> >> +Currently, all versions of the OCC support four types of sensor data:
> >> power,
> >> +temperature, frequency, and "caps," which indicate limits and
> thresholds
> >> used
> >> +internally on the OCC.
> >> +
> >> +BMC - Host Communications
> >> +-------------------------
> >> +
> >> +For the POWER8 application, the BMC can communicate with the P8 over
> I2C
> >> bus.
> >> +However, to access the OCC register space, any data transfer must use a
> >> SCOM
> >> +operation. SCOM is a procedure to initiate a data transfer, typically
> of
> >> 8
> >> +bytes. SCOMs consist of writing a 32-bit command register and then
> >> +reading/writing two 32-bit data registers. This driver implements these
> >> +SCOM operations over I2C bus in order to communicate with the OCC.
> >> +
> >> +For the POWER9 application, the BMC can communicate with the P9 over
> FSI
> >> bus
> >> +and SBE engine. Once again, SCOM operations are required. This driver
> >> will
> >> +implement SCOM ops over FSI/SBE. This will require the FSI driver.
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 5f0420a..f5d4195 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -9112,6 +9112,13 @@ T:       git git://linuxtv.org/media_tree.git
> >>  S:     Maintained
> >>  F:     drivers/media/i2c/ov7670.c
> >>
> >> +ON-CHIP CONTROLLER HWMON DRIVER
> >> +M:     Eddie James <eajames@us.ibm.com>
> >> +L:     linux-hwmon@vger.kernel.org
> >> +S:     Maintained
> >> +F:     Documentation/hwmon/occ
> >> +F:     drivers/hwmon/occ/
> >> +
> >>  ONENAND FLASH DRIVER
> >>  M:     Kyungmin Park <kyungmin.park@samsung.com>
> >>  L:     linux-mtd@lists.infradead.org
> >> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >> index 190d270..e80ca81 100644
> >> --- a/drivers/hwmon/Kconfig
> >> +++ b/drivers/hwmon/Kconfig
> >> @@ -1240,6 +1240,8 @@ config SENSORS_NSA320
> >>           This driver can also be built as a module. If so, the module
> >>           will be called nsa320-hwmon.
> >>
> >> +source drivers/hwmon/occ/Kconfig
> >> +
> >>  config SENSORS_PCF8591
> >>         tristate "Philips PCF8591 ADC/DAC"
> >>         depends on I2C
> >> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >> index d2cb7e8..c7ec5d4 100644
> >> --- a/drivers/hwmon/Makefile
> >> +++ b/drivers/hwmon/Makefile
> >> @@ -169,6 +169,7 @@ obj-$(CONFIG_SENSORS_WM831X)        +=
> wm831x-hwmon.o
> >>  obj-$(CONFIG_SENSORS_WM8350)   += wm8350-hwmon.o
> >>  obj-$(CONFIG_SENSORS_XGENE)    += xgene-hwmon.o
> >>
> >> +obj-$(CONFIG_SENSORS_PPC_OCC)  += occ/
> >>  obj-$(CONFIG_PMBUS)            += pmbus/
> >>
> >>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> >> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> >> new file mode 100644
> >> index 0000000..cdb64a7
> >> --- /dev/null
> >> +++ b/drivers/hwmon/occ/Kconfig
> >> @@ -0,0 +1,15 @@
> >> +#
> >> +# On Chip Controller configuration
> >> +#
> >> +
> >> +menuconfig SENSORS_PPC_OCC
> >> +       bool "PPC On-Chip Controller"
> >> +       help
> >> +         If you say yes here you get support to monitor Power CPU
> >> +         sensors via the On-Chip Controller (OCC).
> >> +
> >> +         Generally this is used by management controllers such as a BMC
> >> +         on an OpenPower system.
> >> +
> >> +         This driver can also be built as a module. If so, the module
> >> +         will be called occ.
> >> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> >> new file mode 100644
> >> index 0000000..93cb52f
> >> --- /dev/null
> >> +++ b/drivers/hwmon/occ/Makefile
> >> @@ -0,0 +1 @@
> >> +obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o
> >> diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
> >> new file mode 100644
> >> index 0000000..3089762
> >> --- /dev/null
> >> +++ b/drivers/hwmon/occ/occ.c
> >> @@ -0,0 +1,522 @@
> >> +/*
> >> + * occ.c - OCC hwmon driver
> >> + *
> >> + * This file contains the methods and data structures for the OCC hwmon
> >> driver.
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
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + */
> >> +
> >> +#include <asm/unaligned.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/device.h>
> >> +#include <linux/err.h>
> >> +#include <linux/init.h>
> >> +#include <linux/jiffies.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/slab.h>
> >> +#include "occ.h"
> >> +
> >> +#define OCC_DATA_MAX           4096
> >> +#define OCC_BMC_TIMEOUT_MS     20000
> >> +
> >> +/* To generate attn to OCC */
> >> +#define ATTN_DATA              0x0006B035
> >> +
> >> +/* For BMC to read/write SRAM */
> >> +#define OCB_ADDRESS            0x0006B070
> >> +#define OCB_DATA               0x0006B075
> >> +#define OCB_STATUS_CONTROL_AND 0x0006B072
> >> +#define OCB_STATUS_CONTROL_OR  0x0006B073
> >> +
> >> +/* To init OCB */
> >> +#define OCB_AND_INIT0          0xFBFFFFFF
> >> +#define OCB_AND_INIT1          0xFFFFFFFF
> >> +#define OCB_OR_INIT0           0x08000000
> >> +#define OCB_OR_INIT1           0x00000000
> >> +
> >> +/* To generate attention on OCC */
> >> +#define ATTN0                  0x01010000
> >> +#define ATTN1                  0x00000000
> >> +
> >> +/* OCC return status */
> >> +#define RESP_RETURN_CMD_IN_PRG 0xFF
> >> +#define RESP_RETURN_SUCCESS    0
> >> +#define RESP_RETURN_CMD_INVAL  0x11
> >> +#define RESP_RETURN_CMD_LEN    0x12
> >> +#define RESP_RETURN_DATA_INVAL 0x13
> >> +#define RESP_RETURN_CHKSUM     0x14
> >> +#define RESP_RETURN_OCC_ERR    0x15
> >> +#define RESP_RETURN_STATE      0x16
> >> +
> >> +/* time interval to retry on "command in progress" return status */
> >> +#define CMD_IN_PRG_INT_MS      100
> >> +#define CMD_IN_PRG_RETRIES     (OCC_BMC_TIMEOUT_MS / CMD_IN_PRG_INT_MS)
> >> +
> >> +/* OCC command definitions */
> >> +#define OCC_POLL               0
> >> +#define OCC_SET_USER_POWR_CAP  0x22
> >> +
> >> +/* OCC poll command data */
> >> +#define OCC_POLL_STAT_SENSOR   0x10
> >> +
> >> +/* OCC response data offsets */
> >> +#define RESP_RETURN_STATUS     2
> >> +#define RESP_DATA_LENGTH       3
> >> +#define RESP_HEADER_OFFSET     5
> >> +#define SENSOR_STR_OFFSET      37
> >> +#define SENSOR_BLOCK_NUM_OFFSET        43
> >> +#define SENSOR_BLOCK_OFFSET    45
> >> +
> >> +/* occ_poll_header
> >> + * structure to match the raw occ poll response data
> >> + */
> >> +struct occ_poll_header {
> >> +       u8 status;
> >> +       u8 ext_status;
> >> +       u8 occs_present;
> >> +       u8 config;
> >> +       u8 occ_state;
> >> +       u8 mode;
> >> +       u8 ips_status;
> >> +       u8 error_log_id;
> >> +       u32 error_log_addr_start;
> >> +       u16 error_log_length;
> >> +       u8 reserved2;
> >> +       u8 reserved3;
> >> +       u8 occ_code_level[16];
> >> +       u8 sensor_eye_catcher[6];
> >> +       u8 sensor_block_num;
> >> +       u8 sensor_data_version;
> >> +} __attribute__((packed, aligned(4)));
> >> +
> >> +struct occ_response {
> >> +       struct occ_poll_header header;
> >> +       struct occ_blocks data;
> >> +};
> >> +
> >> +struct occ {
> >> +       struct device *dev;
> >> +       void *bus;
> >> +       struct occ_bus_ops bus_ops;
> >> +       struct occ_ops ops;
> >> +       struct occ_config config;
> >> +       unsigned long update_interval;
> >> +       unsigned long last_updated;
> >> +       struct mutex update_lock;
> >> +       struct occ_response response;
> >> +       bool valid;
> >> +};
> >> +
> >> +static void deinit_occ_resp_buf(struct occ_response *resp)
> >> +{
> >> +       int i;
> >> +
> >> +       if (!resp)
> >> +               return;
> >> +
> >
> >
> > This creates the impression that resp can ever be NULL, which is not the
> > case.
> 
> Agreed. This might go away anyway if I follow your suggestions below
> about memory management.
> 
> >
> >> +       if (!resp->data.blocks)
> >> +               return;
> >> +
> >> +       for (i = 0; i < resp->header.sensor_block_num; ++i)
> >> +               kfree(resp->data.blocks[i].sensors);
> >> +
> >> +       kfree(resp->data.blocks);
> >> +/sensor_type_s
> >>
> >> +       memset(resp, 0, sizeof(struct occ_response));
> >> +
> >> +       for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> >> +               resp->data.sensor_block_id[i] = -1;
> >> +}
> >> +
> >> +static void *occ_get_sensor_by_type(struct occ_response *resp,
> >> +                                   enum sensor_type t)
> >> +{
> >> +       if (!resp->data.blocks)
> >> +               return NULL;
> >> +
> >> +       if (resp->data.sensor_block_id[t] == -1)
> >> +               return NULL;
> >> +
> >> +       return resp->data.blocks[resp->data.sensor_block_id[t]].sensors;
> >> +}
> >> +
> >> +static int occ_check_sensor(struct occ *driver, u8 sensor_length,
> >> +                           u8 sensor_num, enum sensor_type t, int
> block)
> >> +{
> >> +       void *sensor;
> >> +       int type_block_id;
> >> +       struct occ_response *resp = &driver->response;
> >> +
> >> +       sensor = occ_get_sensor_by_type(resp, t);
> >> +
> >> +       /* empty sensor block, release older sensor data */
> >> +       if (sensor_num == 0 || sensor_length == 0) {
> >> +               kfree(sensor);
> >> +               dev_err(driver->dev, "no sensor blocks available\n");
> >> +               return -ENODATA;
> >> +       }
> >> +
> >> +       type_block_id = resp->data.sensor_block_id[t];
> >> +       if (!sensor || sensor_num !=
> >> +           resp->data.blocks[type_block_id].header.sensor_num) {
> >> +               kfree(sensor);
> >> +               resp->data.blocks[block].sensors =
> >> +                       driver->ops.alloc_sensor(t, sensor_num);
> >> +               if (!resp->data.blocks[block].sensors)
> >> +                       return -ENOMEM;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int parse_occ_response(struct occ *driver, u8 *data,
> >> +                             struct occ_response *resp)
> >> +{
> >> +       int b;
> >> +       int s;
> >> +       int rc;
> >> +       int offset = SENSOR_BLOCK_OFFSET;
> >> +       int sensor_type;
> >> +       u8 sensor_block_num;
> >> +       char sensor_type_string[5] = { 0 };
> >
> >
> > The only purpose of this variable seems to be to zero-terminate it to be
> > able
> > to print it. Why not use length-limited print functions instead ?
> 
> Is there such a function to length limit to dev_err or dev_dbg?
> Otherwise I have to snprintf or strncpy into a string to pass anyway.
> I can drop the dev_dbg but I would like to print out the sensor string
> if it doesn't match any of the expected ones.
> 
%*s or %-*s ?

> >
> >> +       struct sensor_data_block_header *block;
> >> +       struct device *dev = driver->dev;
> >> +
> >> +       /* check if the data is valid */
> >> +       if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
> >> +               dev_err(dev, "no SENSOR string in response\n");
> >
> >
> > Are those messages really necessary ? That can create a lot of logging
> noise
> > if the occ responds with bad data.
> 
> I will audit these, but I think it's limited to one error message
> logged in any one function in case of error. Is that acceptable?
> Otherwise it may be hard to tell where the error occurred.
> 
> >
> >> +               rc = -ENODATA;
> >> +               goto err;
> >> +       }
> >> +
> >> +       sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
> >
> >
> > There is a lot of trust in assuming that this data was actually received.
> > At the same time, there is a lot of error checking. Why check if the
> > information in this field is valid if you don't check if it was
> > received in the first place ?
> 
> If we get to parse_occ_response, we know we got some data back from
> the OCC (see occ_get_all). Here we are really checking the response is
> a valid one, which I think makes sense in the parsing function.
> 
Yes, but you don't check the length of the data vs. the length indicated
in the header.

> >
> >> +       if (sensor_block_num == 0) {
> >> +               dev_err(dev, "no sensor blocks available\n");
> >> +               rc = -ENODATA;
> >> +               goto err;
> >> +       }
> >> +
> >> +       /* if number of sensor block has changed, re-malloc */
> >> +       if (sensor_block_num != resp->header.sensor_block_num) {
> >> +               deinit_occ_resp_buf(resp);
> >> +               resp->data.blocks = kcalloc(sensor_block_num,
> >> +                                           sizeof(struct
> >> sensor_data_block),
> >> +                                           GFP_KERNEL);
> >> +               if (!resp->data.blocks)
> >> +                       return -ENOMEM;
> >
> >
> > Why not just allocate the maximum number of sensors once ? That might
> waste
> > a bit of memory, but it would make the code much less error prone. We
> know
> > that
> > there will never be more sensors than the number fitting into 4k of
> memory,
> > so the "waste" would not really be that much.
> 
> Fair point. I'll do that.
> 
> >
> >
> >> +       }
> >> +
> >> +       memcpy(&resp->header, &data[RESP_HEADER_OFFSET],
> >> +              sizeof(struct occ_poll_header));
> >> +       resp->header.error_log_addr_start =
> >> +               be32_to_cpu(resp->header.error_log_addr_start);
> >> +       resp->header.error_log_length =
> >> +               be16_to_cpu(resp->header.error_log_length);
> >> +
> >> +       dev_dbg(dev, "Reading %d sensor blocks\n",
> >> +               resp->header.sensor_block_num);
> >> +       for (b = 0; b < sensor_block_num; b++) {
> >> +               block = (struct sensor_data_block_header *)&data
> [offset];
> >> +               /* copy to a null terminated string */
> >> +               strncpy(sensor_type_string, block->sensor_type, 4);
> >> +               offset += 8;
> >> +
> >> +               dev_dbg(dev, "sensor block[%d]: type: %s, sensor_num:
> >> %d\n", b,
> >> +                       sensor_type_string, block->sensor_num);
> >> +
> >> +               if (strncmp(block->sensor_type, "FREQ", 4) == 0)
> >> +                       sensor_type = FREQ;
> >> +               else if (strncmp(block->sensor_type, "TEMP", 4) == 0)
> >> +                       sensor_type = TEMP;
> >> +               else if (strncmp(block->sensor_type, "POWR", 4) == 0)
> >> +                       sensor_type = POWER;
> >> +               else if (strncmp(block->sensor_type, "CAPS", 4) == 0)
> >> +                       sensor_type = CAPS;
> >> +               else {
> >> +                       dev_err(dev, "sensor type not supported %s\n",
> >> +                               sensor_type_string);
> >> +                       continue;
> >> +               }
> >> +
> >> +               rc = occ_check_sensor(driver, block->sensor_length,
> >> +                                     block->sensor_num, sensor_type,
> b);
> >> +               if (rc == -ENOMEM)
> >> +                       goto err;
> >> +               else if (rc)
> >> +                       continue;
> >> +
> >> +               resp->data.sensor_block_id[sensor_type] = b;
> >> +               for (s = 0; s < block->sensor_num; s++) {
> >> +                       driver->ops.parse_sensor(data,
> >> +
> >> resp->data.blocks[b].sensors,
> >> +                                                sensor_type, offset,
> s);
> >> +                       offset += block->sensor_length;
> >> +               }
> >> +
> >> +               /* copy block data over to response pointer */
> >> +               resp->data.blocks[b].header = *block;
> >> +       }
> >> +
> >> +       return 0;
> >> +err:
> >> +       deinit_occ_resp_buf(resp);
> >> +       return rc;
> >> +}
> >> +
> >> +static u8 occ_send_cmd(struct occ *driver, u8 seq, u8 type, u16 length,
> >> +                      const u8 *data, u8 *resp)
> >> +{
> >> +       u32 cmd1, cmd2;
> >> +       u16 checksum = 0;
> >> +       u16 length_le = cpu_to_le16(length);
> >> +       bool retry = 0;
> >> +       int i, rc, tries = 0;
> >> +
> >> +       cmd1 = (seq << 24) | (type << 16) | length_le;
> >> +       memcpy(&cmd2, data, length);
> >> +       cmd2 <<= ((4 - length) * 8);
> >> +
> >> +       /* checksum: sum of every bytes of cmd1, cmd2 */
> >> +       for (i = 0; i < 4; i++) {
> >> +               checksum += (cmd1 >> (i * 8)) & 0xFF;
> >> +               checksum += (cmd2 >> (i * 8)) & 0xFF;
> >> +       }
> >> +
> >> +       cmd2 |= checksum << ((2 - length) * 8);
> >> +
> >> +       /* Init OCB */
> >> +       rc = driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_OR,
> >> +                                    OCB_OR_INIT0, OCB_OR_INIT1);
> >> +       if (rc)
> >> +               goto err;
> >> +
> >> +       rc = driver->bus_ops.putscom(driver->bus,
> OCB_STATUS_CONTROL_AND,
> >> +                                    OCB_AND_INIT0, OCB_AND_INIT1);
> >> +       if (rc)
> >> +               goto err;
> >> +
> >> +       /* Send command, 2nd half of the 64-bit addr is unused (write 0)
> >> */
> >> +       rc = driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> >> +                                    driver->config.command_addr, 0);
> >> +       if (rc)
> >> +               goto err;
> >> +
> >> +       rc = driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1, cmd2);
> >> +       if (rc)
> >> +               goto err;
> >> +
> >> +       /* Trigger attention */
> >> +       rc = driver->bus_ops.putscom(driver->bus, ATTN_DATA, ATTN0,
> >> ATTN1);
> >> +       if (rc)
> >> +               goto err;
> >> +
> >> +       /* Get response data */
> >> +       rc = driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> >> +                                    driver->config.response_addr, 0);
> >> +       if (rc)
> >> +               goto err;
> >> +
> >> +       do {
> >> +               if (retry) {
> >> +                       set_current_state(TASK_INTERRUPTIBLE);
> >> +
> >> schedule_timeout(msecs_to_jiffies(CMD_IN_PRG_INT_MS));
> >> +               }
> >> +
> >
> > Isn't there a better way to do this ? What exactly is interrupted ? The
> > getscom function ? If so, shouldn't the timeout be handled there ?
> 
> There shouldn't be any interrupt. I set TASK_INTERRUPTIBLE because it
> doesn't really matter if it's interrupted or not. The purpose of this
> loop is to retry if we get the "command in progress" status from the
> OCC. It's higher level than the getscom function, so I think the loop
> is appropriate here.
> 
This is quite unusual. Why is this needed here but not elsewhere
in the kernel ? Normally the called function would time out and return
an appropriate error.

> >
> >> +               rc = driver->bus_ops.getscom(driver->bus, OCB_DATA,
> >> +                                            (u64 *)resp);
> >> +               if (rc)
> >> +                       goto err;
> >> +
> >> +               /* retry if we get "command in progress" return status
> */
> >> +               retry = (resp[RESP_RETURN_STATUS] ==
> >> RESP_RETURN_CMD_IN_PRG) &&
> >> +                       (tries++ < CMD_IN_PRG_RETRIES);
> >
> >
> > There are some unnecessary () in this expression.
> >
> >
> >> +       } while (retry);
> >> +
> >> +       switch (resp[RESP_RETURN_STATUS]) {
> >> +       case RESP_RETURN_CMD_IN_PRG:
> >> +               rc = -EALREADY;
> >> +               break;
> >> +       case RESP_RETURN_SUCCESS:
> >> +               rc = 0;
> >> +               break;
> >> +       case RESP_RETURN_CMD_INVAL:
> >> +       case RESP_RETURN_CMD_LEN:
> >> +       case RESP_RETURN_DATA_INVAL:
> >> +       case RESP_RETURN_CHKSUM:
> >> +               rc = -EINVAL;
> >> +               break;
> >> +       case RESP_RETURN_OCC_ERR:
> >> +               rc = -EREMOTE;
> >> +               break;
> >> +       default:
> >> +               rc = -EFAULT;
> >> +       }
> >> +
> >> +       return rc;
> >> +
> >> +err:
> >> +       dev_err(driver->dev, "scom op failed rc:%d\n", rc);
> >
> >
> > Some of the errors result in an error message, some don't. What is
> > the guiding principle ? Even if there is an error message, it doesn't
> report
> > what function caused it, which makes it as good as no error message.
> > Can this be dropped ?
> 
> resp[RESP_RETURN_STATUS] is the status reported on the OCC, these
> aren't necessarily errors, though most are. This is translating an OCC
> status code to an error for occ_get_all to pick up. It cannot be
> dropped, we need to know if the occ poll was successful. I'm not sure
> what you mean by reporting the function? occ_get_all will fail out if

There are several function returns which all end up here. You don't know
which one actually failed.

> we report the error here. If it's the scom op that failed we will have
> the dev_err message.
> 
But which scom operation ? You mean it is important to report that some
operation failed, but not which one ? Ok, I'll accept that, it just seems
odd.

> >
> >> +       return rc;
> >> +}
> >> +
> >> +static int occ_get_all(struct occ *driver)
> >> +{
> >> +       int i = 0, rc;
> >> +       u8 *occ_data;
> >> +       u16 num_bytes;
> >> +       const u8 poll_cmd_data = OCC_POLL_STAT_SENSOR;
> >> +       struct device *dev = driver->dev;
> >> +       struct occ_response *resp = &driver->response;
> >> +
> >> +       occ_data = devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
> >
> >
> > I am a bot lost here. What is the purpose of using a devm function ?
> >
> > Either case, you might want to allocate the memory once and just keep it
> > allocated.
> > Allocating a 4k buffer and freeing it each time data is read from the occ
> > seems
> > to be wasteful and not really worth it.
> 
> Agreed.
> 
> >
> >> +       if (!occ_data)
> >> +               return -ENOMEM;
> >> +
> >> +       rc = occ_send_cmd(driver, 0, OCC_POLL, 1, &poll_cmd_data,
> >> occ_data);
> >> +       if (rc) {
> >> +               dev_err(dev, "OCC poll failed: %d\n", rc);
> >> +               goto out;
> >> +       }
> >> +
> >> +       num_bytes = get_unaligned((u16 *)&occ_data[RESP_DATA_LENGTH]);
> >> +       num_bytes = be16_to_cpu(num_bytes);
> >
> >
> > What data is in big endian, and what data is in little endian ?
> >
> > Looks like everything is big endian except for the length in the send
> > command.
> > Is that correct ? If so, an explanation would be useful, because the
> logic
> > isn't entirely clear.
> 
> I'll add some comments.
> 
> >
> >> +       dev_dbg(dev, "OCC data length: %d\n", num_bytes);
> >> +
> >> +       if (num_bytes > OCC_DATA_MAX) {
> >> +               dev_err(dev, "OCC data length must be < 4KB\n");
> >> +               rc = -EINVAL;
> >> +               goto out;
> >> +       }
> >> +
> >> +       if (num_bytes <= 0) {
> >
> >
> > This can never be < 0.
> 
> Good point.
> 
> >
> >> +               dev_err(dev, "OCC data length is zero\n");
> >> +               rc = -EINVAL;
> >> +               goto out;
> >> +       }
> >> +
> >> +       /* read remaining data */
> >> +       for (i = 8; i < num_bytes + 8; i += 8) {
> >> +               rc = driver->bus_ops.getscom(driver->bus, OCB_DATA,
> >> +                                            (u64 *)&occ_data[i]);
> >> +               if (rc) {
> >> +                       dev_err(dev, "scom op failed rc:%d\n", rc);
> >> +                       goto out;
> >> +               }
> >> +       }
> >> +
> >> +       /* don't need more sanity checks; buffer is alloc'd for max
> >> response
> >> +        * size so we just check for valid data in parse_occ_response
> >> +        */
> >
> > Yes, but as mentioned above you don't check in that function if the data
> > was actually received.
> 
> If we don't receive data, the data length will be 0 or the low level
> getscom will fail. So we know we have data here.
> 
Ok. However, since you don't pass num_bytes to the parse function,
there is no verification that num_bytes actually matches what is in the packet.
The rest of the header could indicate that there is 4k of data, but num_bytes
reports, say, the minimum size. In that case, parse_occ_response() would end
up parsing a stale buffer.

> >
> >> +       rc = parse_occ_response(driver, occ_data, resp);
> >> +
> >> +out:
> >> +       devm_kfree(dev, occ_data);
> >> +       return rc;
> >> +}
> >> +
> >> +int occ_update_device(struct occ *driver)
> >> +{
> >> +       int rc = 0;
> >> +
> >> +       mutex_lock(&driver->update_lock);
> >> +
> >> +       if (time_after(jiffies, driver->last_updated +
> >> driver->update_interval)
> >> +           || !driver->valid) {
> >> +               driver->valid = 1;
> >
> >
> > valid is bool.
> >
> >> +
> >> +               rc = occ_get_all(driver);
> >> +               if (rc)
> >> +                       driver->valid = 0;
> >
> >
> > valid is bool.
> 
> Good point.
> 
> >
> >> +
> >> +               driver->last_updated = jiffies;
> >> +       }
> >> +
> >> +       mutex_unlock(&driver->update_lock);
> >> +
> >> +       return rc;
> >> +}
> >> +EXPORT_SYMBOL(occ_update_device);
> >> +
> >> +void *occ_get_sensor(struct occ *driver, int sensor_type)
> >> +{
> >> +       int rc;
> >> +
> >> +       /* occ_update_device locks the update lock */
> >> +       rc = occ_update_device(driver);
> >> +       if (rc) {
> >> +               dev_err(driver->dev, "cannot get occ sensor data: %d\n",
> >> +                       rc);
> >
> >
> > Have you counted the number of error messages reported if anything goes
> > wrong.
> > This driver is quite noisy. I won't force you to drop the messages, but
> it
> > seems
> > to me that if anything goes wrong, the kernel log will be clogged with
> > messages
> > just from this driver.
> 
> I'll audit these.
> 
> >
> >
> >> +               return NULL;
> >> +       }
> >> +
> >> +       return occ_get_sensor_by_type(&driver->response, sensor_type);
> >> +}
> >> +EXPORT_SYMBOL(occ_get_sensor);
> >> +
> >> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int
> >> sensor_num,
> >> +                        u32 hwmon, long *val)
> >> +{
> >> +       return occ->ops.get_sensor(occ, sensor_type, sensor_num, hwmon,
> >> val);
> >> +}
> >> +EXPORT_SYMBOL(occ_get_sensor_value);
> >> +
> >> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks
> **blocks)
> >> +{
> >> +       *blocks = &occ->response.data;
> >> +}
> >> +EXPORT_SYMBOL(occ_get_response_blocks);
> >> +
> >> +void occ_set_update_interval(struct occ *occ, unsigned long interval)
> >> +{
> >> +       occ->update_interval = msecs_to_jiffies(interval);
> >> +}
> >> +EXPORT_SYMBOL(occ_set_update_interval);
> >> +
> >> +int occ_set_user_powercap(struct occ *occ, u16 cap)
> >> +{
> >> +       u8 resp[8];
> >> +
> >> +       cap = cpu_to_be16(cap);
> >> +
> >> +       return occ_send_cmd(occ, 0, OCC_SET_USER_POWR_CAP, 2, (const u8
> >> *)&cap,
> >> +                           resp);
> >> +}
> >> +EXPORT_SYMBOL(occ_set_user_powercap);
> >> +
> >> +struct occ *occ_start(struct device *dev, void *bus,
> >> +                     struct occ_bus_ops *bus_ops, const struct occ_ops
> >> *ops,
> >> +                     const struct occ_config *config)
> >> +{
> >> +       struct occ *driver = devm_kzalloc(dev, sizeof(struct occ),
> >> GFP_KERNEL);
> >> +
> >> +       if (!driver)
> >> +               return ERR_PTR(-ENOMEM);
> >> +
> >> +       driver->dev = dev;
> >> +       driver->bus = bus;
> >> +       driver->bus_ops = *bus_ops;
> >> +       driver->ops = *ops;
> >> +       driver->config = *config;
> >> +
> >> +       driver->update_interval = HZ;
> >
> >
> > The update interval is only supposed to be configurable if it can be
> written
> > into the hardware. Otherwise it is really up to user space to decide how
> > often
> > it wants to poll the data, not up to the kernel.
> >
> > I don't see a function to send the update interval to the occ. As such,
> it
> > should
> > not be configurable but a constant.
> 
> I don't quite follow. Right now, the driver maximum polling rate is
> configurable by userspace (via hwmon sysfs attribute). If you mean
> that user space should control that rate just by how often users read
> the attributes, I'm not sure that will work as there are a large
> number of attributes that will all try and trigger an occ poll when
> read. Besides, different users don't want to communicate about when
> they last polled. If the rate is constant, if may be too slow or too
> fast depending on the system and needs of the users. Why can't the
> polling rate be configurable? To user space, the update interval works
> the same if it's driver or hardware.
> 

The update_interval attribute is only supposed to exist if writing it
results in writing a value into a chip register. It is supposed to set
the _chip_ update interval, not the kernel update interval. If you want
to limit the rate of chip accesses, you can do it by using a constant
in the driver, just like other drivers do it.

This is similar to limit registers. If the chip does not support limit
registers, we don't make up "soft" limits either, but don't support
the respective attributes.

Thanks,
Guenter
