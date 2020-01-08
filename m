Return-Path: <SRS0=XJeT=25=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5D9C282DD
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jan 2020 14:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C9252070E
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jan 2020 14:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgAHOLx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jan 2020 09:11:53 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50801 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728764AbgAHOLw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jan 2020 09:11:52 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 8 Jan 2020 16:11:47 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 008EBgZJ030061;
        Wed, 8 Jan 2020 16:11:47 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 4/5] hwmon: (pmbus) Add support for Infineon Multi-phase xdpe122 family controllers
Date:   Wed,  8 Jan 2020 14:11:39 +0000
Message-Id: <20200108141140.2175-5-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108141140.2175-1-vadimp@mellanox.com>
References: <20200108141140.2175-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for devices XDPE12250, XDPE12254, XDPE12283, XDPE12284,
XDPE12286.

All these device support two pages.
The below lists of VOUT_MODE command readout with their related VID
protocols, Digital to Analog Converter steps, supported by these
devices:
VR12.0 mode, 5-mV DAC - 0x01;
VR12.5 mode, 10-mV DAC - 0x02;
IMVP9 mode, 5-mV DAC - 0x03;
AMD mode 6.25mV - 0x10.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/Kconfig     |   9 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/xdpe12284.c | 121 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/xdpe12284.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 0dd30b07bf18..ae6eb02419e6 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -228,6 +228,15 @@ config SENSORS_UCD9200
 	  This driver can also be built as a module. If so, the module will
 	  be called ucd9200.
 
+config SENSORS_XDPE122
+	tristate "Infineon XDPE122 family"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDPE12250, XDPE12254, XDPE12283, XDPE12284, XDPE12286 devices.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdpe12284.
+
 config SENSORS_ZL6100
 	tristate "Intersil ZL6100 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 3f8c1014938b..5421fcc0a01c 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -26,4 +26,5 @@ obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
+obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
new file mode 100644
index 000000000000..91162cfe1be6
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Infineon Multi-phase Digital VR Controllers
+ *
+ * Copyright (c) 2020 Mellanox Technologies. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define XDPE122_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV DAC */
+#define XDPE122_PROT_VR12_5_10MV	0x02 /* VR12.5 mode, 10-mV DAC */
+#define XDPE122_PROT_IMVP9_10MV		0x03 /* IMVP9 mode, 10-mV DAC */
+#define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
+#define XDPE122_PAGE_NUM		2
+
+static int xdpe122_identify(struct i2c_client *client,
+			    struct pmbus_driver_info *info)
+{
+	u8 vout_params;
+	int i, ret;
+
+	for (i = 0; i < XDPE122_PAGE_NUM; i++) {
+		/* Read the register with VOUT scaling value.*/
+		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
+		if (ret < 0)
+			return ret;
+
+		vout_params = ret & GENMASK(4, 0);
+
+		switch (vout_params) {
+		case XDPE122_PROT_VR12_5_10MV:
+			info->vrm_version[i] = vr13;
+			break;
+		case XDPE122_PROT_VR12_5MV:
+			info->vrm_version[i] = vr12;
+			break;
+		case XDPE122_PROT_IMVP9_10MV:
+			info->vrm_version[i] = imvp9;
+		case XDPE122_AMD_625MV:
+			info->vrm_version[i] = amd625mv;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static struct pmbus_driver_info xdpe122_info = {
+	.pages = XDPE122_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = vid,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_POUT,
+	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_POUT,
+	.identify = xdpe122_identify,
+};
+
+static int xdpe122_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct pmbus_driver_info *info;
+
+	info = devm_kmemdup(&client->dev, &xdpe122_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, id, info);
+}
+
+static const struct i2c_device_id xdpe122_id[] = {
+	{"xdpe12250", 0},
+	{"xdpe12254", 0},
+	{"xdpe12283", 0},
+	{"xdpe12284", 0},
+	{"xdpe12286", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, xdpe122_id);
+
+static const struct of_device_id __maybe_unused xdpe122_of_match[] = {
+	{.compatible = "infineon, xdpe12250"},
+	{.compatible = "infineon, xdpe12254"},
+	{.compatible = "infineon, xdpe12283"},
+	{.compatible = "infineon, xdpe12284"},
+	{.compatible = "infineon, xdpe12286"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, xdpe122_of_match);
+
+static struct i2c_driver xdpe122_driver = {
+	.driver = {
+		.name = "xdpe12284",
+		.of_match_table = of_match_ptr(xdpe122_of_match),
+	},
+	.probe = xdpe122_probe,
+	.remove = pmbus_do_remove,
+	.id_table = xdpe122_id,
+};
+
+module_i2c_driver(xdpe122_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDPE122 family");
+MODULE_LICENSE("GPL");
-- 
2.11.0

