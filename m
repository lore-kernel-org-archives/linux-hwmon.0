Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54044 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751386AbdFZQjD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2017 12:39:03 -0400
Date: Mon, 26 Jun 2017 09:38:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, cbostic@linux.vnet.ibm.com,
        jk@ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH 1/7] drivers/hwmon: Add On-Chip Controller (OCC) hwmon
 driver
Message-ID: <20170626163859.GA20491@roeck-us.net>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1498171716-26620-2-git-send-email-eajames@linux.vnet.ibm.com>
 <8994a4fd-3949-f1a9-3f70-9fa7d406c17a@roeck-us.net>
 <191fdaaa-95e3-5c9b-9439-6f561cac556d@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <191fdaaa-95e3-5c9b-9439-6f561cac556d@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jun 26, 2017 at 10:06:50AM -0500, Eddie James wrote:
> 
> 
> On 06/24/2017 09:15 AM, Guenter Roeck wrote:
> >On 06/22/2017 03:48 PM, Eddie James wrote:
> >>From: "Edward A. James" <eajames@us.ibm.com>
> >>
> >>The OCC is a device embedded on a POWER processor that collects and
> >>aggregates sensor data from the processor and system. The OCC can
> >>provide the raw sensor data as well as perform thermal and power
> >>management on the system.
> >>
> >>This driver provides a hwmon interface to the OCC from a service
> >>processor (e.g. a BMC). The driver supports both POWER8 and POWER9 OCCs.
> >>Communications with the POWER8 OCC are established over standard I2C
> >>bus. The driver communicates with the POWER9 OCC through the FSI-based
> >>OCC driver, which handles the lower-level communication details.
> >>
> >>This patch lays out the structure of the OCC hwmon driver. There are two
> >>platform drivers, one each for P8 and P9 OCCs. These are probed through
> >>the I2C tree and the FSI-based OCC driver, respectively. The patch also
> >
> >Where is that driver ?
> 
> My apologies Guenter, here is the series:
> 
> https://patchwork.kernel.org/patch/9802807/
> https://patchwork.kernel.org/patch/9802801/
> https://patchwork.kernel.org/patch/9802805/
> https://patchwork.kernel.org/patch/9802803/
> 
> Do these FSI drivers need to be into linux-next before you want to look at
> this hwmon driver?
> 
Not necessarily in -next, but I'll need to have at least an immutable branch
to be able to integrate the series.

> Just a couple questions below on your comments.
> 
> Thanks,
> Eddie
> 
> >
> >>defines the first common structures and methods between the two OCC
> >>versions.
> >>
> >>Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >>---
> >>  .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt   | 18 ++++++
> >>  .../devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt   | 25 ++++++++
> >>  drivers/hwmon/Kconfig                              |  2 +
> >>  drivers/hwmon/Makefile                             |  1 +
> >>  drivers/hwmon/occ/Kconfig                          | 28 +++++++++
> >>  drivers/hwmon/occ/Makefile                         | 11 ++++
> >>  drivers/hwmon/occ/common.c                         | 43 +++++++++++++
> >>  drivers/hwmon/occ/common.h                         | 41 +++++++++++++
> >>  drivers/hwmon/occ/p8_i2c.c                         | 70
> >>++++++++++++++++++++++
> >>  drivers/hwmon/occ/p9_sbe.c                         | 65
> >>++++++++++++++++++++
> >>  10 files changed, 304 insertions(+)
> >>  create mode 100644
> >>Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> >>  create mode 100644
> >>Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> >>  create mode 100644 drivers/hwmon/occ/Kconfig
> >>  create mode 100644 drivers/hwmon/occ/Makefile
> >>  create mode 100644 drivers/hwmon/occ/common.c
> >>  create mode 100644 drivers/hwmon/occ/common.h
> >>  create mode 100644 drivers/hwmon/occ/p8_i2c.c
> >>  create mode 100644 drivers/hwmon/occ/p9_sbe.c
> >>
> >>diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> >>b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> >>new file mode 100644
> >>index 0000000..0ecebb7
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> >
> >This needs to be approved by a DT maintainer, if for nothing else for
> >the new directory and file naming. For my part I have no idea how this
> >relates to the "fsi" directory introduced in -next.
> >
> >
> >>@@ -0,0 +1,18 @@
> >>+Device-tree bindings for FSI-based On-Chip Controller hwmon driver
> >>+------------------------------------------------------------------
> >>+
> >>+This node MUST be a child node of an OCC driver node.
> >>+
> >>+Required properties:
> >>+ - compatible = "ibm,p9-occ-hwmon";
> >>+
> >>+Examples:
> >>+
> >>+    occ@1 {
> >>+        compatible = "ibm,p9-occ";
> >
> >I don't see "ibm,p9-occ" documented anywhere (including linux-next).
> >
> >>+        reg = <1>;
> >>+
> >>+        occ-hwmon@1 {
> >>+            compatible = "ibm,p9-occ-hwmon";
> >>+        };
> >>+    };
> >>diff --git a/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> >>b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> >>new file mode 100644
> >>index 0000000..8c765d0
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/i2c/ibm,p8-occ-hwmon.txt
> >>@@ -0,0 +1,25 @@
> >>+Device-tree bindings for I2C-based On-Chip Controller hwmon driver
> >>+------------------------------------------------------------------
> >>+
> >>+Required properties:
> >>+ - compatible = "ibm,p8-occ-hwmon";
> >>+ - reg = <I2C address>;            : I2C bus address
> >>+
> >>+Examples:
> >>+
> >>+    i2c-bus@100 {
> >>+        #address-cells = <1>;
> >>+        #size-cells = <0>;
> >>+        clock-frequency = <100000>;
> >>+        < more properties >
> >>+
> >>+        occ-hwmon@1 {
> >>+            compatible = "ibm,p8-occ-hwmon";
> >>+            reg = <0x50>;
> >>+        };
> >>+
> >>+        occ-hwmon@2 {
> >>+            compatible = "ibm,p8-occ-hwmon";
> >>+            reg = <0x51>;
> >>+        };
> >>+    };
> >>diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >>index 5ef2814..08add7b 100644
> >>--- a/drivers/hwmon/Kconfig
> >>+++ b/drivers/hwmon/Kconfig
> >>@@ -1250,6 +1250,8 @@ config SENSORS_NSA320
> >>        This driver can also be built as a module. If so, the module
> >>        will be called nsa320-hwmon.
> >>  +source drivers/hwmon/occ/Kconfig
> >>+
> >>  config SENSORS_PCF8591
> >>      tristate "Philips PCF8591 ADC/DAC"
> >>      depends on I2C
> >>diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >>index d4641a9..0b342d0 100644
> >>--- a/drivers/hwmon/Makefile
> >>+++ b/drivers/hwmon/Makefile
> >>@@ -170,6 +170,7 @@ obj-$(CONFIG_SENSORS_WM831X)    += wm831x-hwmon.o
> >>  obj-$(CONFIG_SENSORS_WM8350)    += wm8350-hwmon.o
> >>  obj-$(CONFIG_SENSORS_XGENE)    += xgene-hwmon.o
> >>  +obj-$(CONFIG_SENSORS_OCC)    += occ/
> >>  obj-$(CONFIG_PMBUS)        += pmbus/
> >>    ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> >>diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> >>new file mode 100644
> >>index 0000000..0501280
> >>--- /dev/null
> >>+++ b/drivers/hwmon/occ/Kconfig
> >>@@ -0,0 +1,28 @@
> >>+#
> >>+# On-Chip Controller configuration
> >>+#
> >>+
> >>+config SENSORS_OCC
> >>+    tristate "POWER On-Chip Controller"
> >>+    ---help---
> >>+    This option enables support for monitoring a variety of system
> >>sensors
> >>+    provided by the On-Chip Controller (OCC) on a POWER processor.
> >>+
> >>+    This driver can also be built as a module. If so, the module will
> >>be
> >>+    called occ-hwmon.
> >>+
> >>+config SENSORS_OCC_P8_I2C
> >>+    bool "POWER8 OCC through I2C"
> >>+    depends on I2C && SENSORS_OCC
> >>+    ---help---
> >>+    This option enables support for monitoring sensors provided by the
> >>OCC
> >>+    on a POWER8 processor. Communications with the OCC are established
> >>+    through I2C bus.
> >>+
> >>+config SENSORS_OCC_P9_SBE
> >>+    bool "POWER9 OCC through SBE"
> >>+    depends on OCCFIFO && SENSORS_OCC
> >
> >OCCFIFO is not declared anywhere in the kernel, including -next. This
> >leads me to
> >believe that I am missing some context. As a result, I can not even
> >compile this driver.
> >Please provide the missing context.
> >
> >>+    ---help---
> >>+    This option enables support for monitoring sensors provided by the
> >>OCC
> >>+    on a POWER9 processor. Communications with the OCC are established
> >>+    through SBE engine on an FSI bus.
> >>diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> >>new file mode 100644
> >>index 0000000..ab5c3e9
> >>--- /dev/null
> >>+++ b/drivers/hwmon/occ/Makefile
> >>@@ -0,0 +1,11 @@
> >>+occ-hwmon-objs := common.o
> >>+
> >>+ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
> >>+occ-hwmon-objs += p9_sbe.o
> >>+endif
> >>+
> >>+ifeq ($(CONFIG_SENSORS_OCC_P8_I2C), y)
> >>+occ-hwmon-objs += p8_i2c.o
> >>+endif
> >>+
> >>+obj-$(CONFIG_SENSORS_OCC) += occ-hwmon.o
> >>diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> >>new file mode 100644
> >>index 0000000..60c808c
> >>--- /dev/null
> >>+++ b/drivers/hwmon/occ/common.c
> >>@@ -0,0 +1,43 @@
> >>+/*
> >>+ * Copyright 2017 IBM Corp.
> >>+ *
> >>+ * This program is free software; you can redistribute it and/or modify
> >>+ * it under the terms of the GNU General Public License as published by
> >>+ * the Free Software Foundation; either version 2 of the License, or
> >>+ * (at your option) any later version.
> >>+ */
> >>+
> >>+#include "common.h"
> >
> >Please include local include files last, and include files needed here
> >from here, not indirectly.
> >
> >>+#include <linux/hwmon.h>
> >>+
> >>+static int occ_poll(struct occ *occ)
> >>+{
> >>+    u16 checksum = occ->poll_cmd_data + 1;
> >>+    u8 cmd[8];
> >>+
> >>+    /* big endian */
> >>+    cmd[0] = 0;            /* sequence number */
> >>+    cmd[1] = 0;            /* cmd type */
> >>+    cmd[2] = 0;            /* data length msb */
> >>+    cmd[3] = 1;            /* data length lsb */
> >>+    cmd[4] = occ->poll_cmd_data;    /* data */
> >>+    cmd[5] = checksum >> 8;        /* checksum msb */
> >>+    cmd[6] = checksum & 0xFF;    /* checksum lsb */
> >>+    cmd[7] = 0;
> >>+
> >>+    return occ->send_cmd(occ, cmd);
> >>+}
> >>+
> >>+int occ_setup(struct occ *occ, const char *name)
> >>+{
> >>+    int rc;
> >>+
> >>+    rc = occ_poll(occ);
> >>+    if (rc < 0) {
> >>+        dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
> >>+            rc);
> >>+        return rc;
> >>+    }
> >>+
> >>+    return 0;
> >>+}
> >>diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> >>new file mode 100644
> >>index 0000000..dca642a
> >>--- /dev/null
> >>+++ b/drivers/hwmon/occ/common.h
> >>@@ -0,0 +1,41 @@
> >>+/*
> >>+ * Copyright 2017 IBM Corp.
> >>+ *
> >>+ * This program is free software; you can redistribute it and/or modify
> >>+ * it under the terms of the GNU General Public License as published by
> >>+ * the Free Software Foundation; either version 2 of the License, or
> >>+ * (at your option) any later version.
> >>+ */
> >>+
> >>+#ifndef OCC_COMMON_H
> >>+#define OCC_COMMON_H
> >>+
> >>+#include <linux/hwmon-sysfs.h>
> >>+#include <linux/sysfs.h>
> >
> >Those include files are not needed here. Other include files,
> >which are needed, are missing. You can not expect the above
> >to include everything you need for you.
> >
> >>+
> >>+#define OCC_RESP_DATA_BYTES        4089
> >>+
> >>+/* Same response format for all OCC versions.
> >>+ * Allocate the largest possible response.
> >>+ */
> >>+struct occ_response {
> >>+    u8 seq_no;
> >>+    u8 cmd_type;
> >>+    u8 return_status;
> >>+    u16 data_length_be;
> >
> >Why not "__be16 data_length" if that is what it is ?
> >
> >>+    u8 data[OCC_RESP_DATA_BYTES];
> >>+    u16 checksum_be;
> >
> >Same here.
> >
> >>+} __packed;
> >>+
> >>+struct occ {
> >>+    struct device *bus_dev;
> >>+
> >>+    struct occ_response resp;
> >>+
> >>+    u8 poll_cmd_data;        /* to perform OCC poll command */
> >>+    int (*send_cmd)(struct occ *occ, u8 *cmd);
> >>+};
> >>+
> >>+int occ_setup(struct occ *occ, const char *name);
> >>+
> >>+#endif /* OCC_COMMON_H */
> >>diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> >>new file mode 100644
> >>index 0000000..5075146
> >>--- /dev/null
> >>+++ b/drivers/hwmon/occ/p8_i2c.c
> >>@@ -0,0 +1,70 @@
> >>+/*
> >>+ * Copyright 2017 IBM Corp.
> >>+ *
> >>+ * This program is free software; you can redistribute it and/or modify
> >>+ * it under the terms of the GNU General Public License as published by
> >>+ * the Free Software Foundation; either version 2 of the License, or
> >>+ * (at your option) any later version.
> >>+ */
> >>+
> >>+#include "common.h"
> >>+#include <linux/i2c.h>
> >>+#include <linux/init.h>
> >>+#include <linux/module.h>
> >
> >Please include files in alphabetic order, and local include file(s) last.
> >
> >>+
> >>+struct p8_i2c_occ {
> >>+    struct occ occ;
> >>+    struct i2c_client *client;
> >>+};
> >>+
> >>+#define to_p8_i2c_occ(x)    container_of((x), struct p8_i2c_occ, occ)
> >>+
> >>+static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
> >>+{
> >>+    return -EOPNOTSUPP;
> >>+}
> >>+
> >>+static int p8_i2c_occ_probe(struct i2c_client *client,
> >>+                const struct i2c_device_id *id)
> >>+{
> >>+    struct occ *occ;
> >>+    struct p8_i2c_occ *p8_i2c_occ = devm_kzalloc(&client->dev,
> >>+                             sizeof(*p8_i2c_occ),
> >>+                             GFP_KERNEL);
> >
> >I am quite sure this results in a checkpatch warning. It is also clumsy,
> >with
> >all those continuation lines. I would sugegst to split the variable
> >declaration
> >and the assignment.
> >
> >>+    if (!p8_i2c_occ)
> >>+        return -ENOMEM;
> >>+
> >>+    p8_i2c_occ->client = client;
> >>+    occ = &p8_i2c_occ->occ;
> >>+    occ->bus_dev = &client->dev;
> >>+    dev_set_drvdata(&client->dev, occ);
> >>+
> >>+    occ->poll_cmd_data = 0x10;        /* P8 OCC poll data */
> >
> >It would be beneficial to define those commands in the include file.
> 
> I can add a #define for them, but I'm not sure it makes sense to have the
> P8/P9 specific command in the common include file? They don't need to be
> used anywhere else.
> 
In the source file is ok as well.

> >
> >>+    occ->send_cmd = p8_i2c_occ_send_cmd;
> >>+
> >>+    return occ_setup(occ, "p8_occ");
> >>+}
> >>+
> >>+static const struct of_device_id p8_i2c_occ_of_match[] = {
> >>+    { .compatible = "ibm,p8-occ-hwmon" },
> >>+    {}
> >>+};
> >>+MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
> >>+
> >>+static const unsigned short p8_i2c_occ_addr[] = { 0x50, 0x51,
> >>I2C_CLIENT_END };
> >
> >Those addresses should never be listed for auto-detection.
> 
> Why not? I see lots of drivers in the kernel with a list of I2C addresses to
> scan.
> 

Sure, but not in the EEPROM address range (0x50..0x57), and not without
detect function. A detect function on an EEPROM is pretty much worthless;
one would only have to write the right (or wrong) sequence of values
into the EEPROM to cause lots of false positive detections.

> >
> >>+
> >>+static struct i2c_driver p8_i2c_occ_driver = {
> >>+    .class = I2C_CLASS_HWMON,
> >
> >FWIW, this only adds value if the driver has a detect function.
> >
> >>+    .driver = {
> >>+        .name = "occ-hwmon",
> >>+        .of_match_table = p8_i2c_occ_of_match,
> >>+    },
> >>+    .probe = p8_i2c_occ_probe,
> >>+    .address_list = p8_i2c_occ_addr,
> >
> >Same here.
> >
> >>+};
> >>+
> >>+module_i2c_driver(p8_i2c_occ_driver);
> >>+
> >>+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> >>+MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
> >>+MODULE_LICENSE("GPL");
> >>diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> >>new file mode 100644
> >>index 0000000..0cef428
> >>--- /dev/null
> >>+++ b/drivers/hwmon/occ/p9_sbe.c
> >>@@ -0,0 +1,65 @@
> >>+/*
> >>+ * Copyright 2017 IBM Corp.
> >>+ *
> >>+ * This program is free software; you can redistribute it and/or modify
> >>+ * it under the terms of the GNU General Public License as published by
> >>+ * the Free Software Foundation; either version 2 of the License, or
> >>+ * (at your option) any later version.
> >>+ */
> >>+
> >>+#include "common.h"
> >>+#include <linux/init.h>
> >>+#include <linux/module.h>
> >>+#include <linux/platform_device.h>
> >>+#include <linux/occ.h>
> >>+
> >Alphabetic order, and local include file(s) last.
> >
> >>+struct p9_sbe_occ {
> >>+    struct occ occ;
> >>+    struct device *sbe;
> >>+};
> >>+
> >>+#define to_p9_sbe_occ(x)    container_of((x), struct p9_sbe_occ, occ)
> >>+
> >>+static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> >>+{
> >>+    return -EOPNOTSUPP;
> >>+}
> >>+
> >>+static int p9_sbe_occ_probe(struct platform_device *pdev)
> >>+{
> >>+    struct occ *occ;
> >>+    struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
> >>+                             sizeof(*p9_sbe_occ),
> >>+                             GFP_KERNEL);
> >
> >Same as above.
> >
> >>+    if (!p9_sbe_occ)
> >>+        return -ENOMEM;
> >>+
> >>+    p9_sbe_occ->sbe = pdev->dev.parent;
> >>+    occ = &p9_sbe_occ->occ;
> >>+    occ->bus_dev = &pdev->dev;
> >>+    platform_set_drvdata(pdev, occ);
> >>+
> >>+    occ->poll_cmd_data = 0x20;        /* P9 OCC poll data */
> >>+    occ->send_cmd = p9_sbe_occ_send_cmd;
> >>+
> >>+    return occ_setup(occ, "p9_occ");
> >>+}
> >>+
> >>+static const struct of_device_id p9_sbe_occ_of_match[] = {
> >>+    { .compatible = "ibm,p9-occ-hwmon" },
> >>+    { },
> >>+};
> >>+
> >>+static struct platform_driver p9_sbe_occ_driver = {
> >>+    .driver = {
> >>+        .name = "occ-hwmon",
> >>+        .of_match_table    = p9_sbe_occ_of_match,
> >>+    },
> >>+    .probe    = p9_sbe_occ_probe,
> >>+};
> >>+
> >>+module_platform_driver(p9_sbe_occ_driver);
> >>+
> >>+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> >>+MODULE_DESCRIPTION("BMC P9 OCC hwmon driver");
> >>+MODULE_LICENSE("GPL");
> >>
> >
> 
