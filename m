Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0B8C43219
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 18:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbiD0SzD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 14:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbiD0Sxz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 14:53:55 -0400
Received: from smtp14.infineon.com (smtp14.infineon.com [IPv6:2a00:18f0:1e00:4::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC31F153D69
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1651084815; x=1682620815;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=q3Y6H+3f0PV0x2ehSnsx3uj+dLBnD9WSR/0VMwSTYPI=;
  b=oC2R2HhKEnX0aZuBGzSyWKIf/P9KHysNu53Tcjkx3C4Mjt2D7KhaOByn
   xkMV7/KM8yjhdbt2HlPNSpZ34uNMWMZqks7DA5DLsNGbEscy5zXPgzFcY
   Ol4WmQcvQ2mDrKfcvut2NbHcn05sSP4mpfQZs2PCu7VuQDCDlNRODwYw2
   E=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="118491655"
X-IronPort-AV: E=Sophos;i="5.90,293,1643670000"; 
   d="scan'208";a="118491655"
Received: from unknown (HELO mucxv002.muc.infineon.com) ([172.23.11.17])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 20:40:13 +0200
Received: from MUCSE803.infineon.com (MUCSE803.infineon.com [172.23.29.29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mucxv002.muc.infineon.com (Postfix) with ESMTPS;
        Wed, 27 Apr 2022 20:40:13 +0200 (CEST)
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 20:40:12 +0200
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 20:40:12 +0200
Received: from MUCSE820.infineon.com ([172.23.29.46]) by MUCSE820.infineon.com
 ([172.23.29.46]) with mapi id 15.02.0986.022; Wed, 27 Apr 2022 20:40:12 +0200
From:   <Greg.Schwendimann@infineon.com>
To:     <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
CC:     <Greg.Schwendimann@infineon.com>
Subject: [PATCH v4 1/2] hwmon: (pmbus) Add support for Infineon Digital
 Multi-phase xdp152 faimly controllers
Thread-Topic: [PATCH v4 1/2] hwmon: (pmbus) Add support for Infineon Digital
 Multi-phase xdp152 faimly controllers
Thread-Index: AdhaZXigbWtSprhYSRW2k72NE01cpw==
Date:   Wed, 27 Apr 2022 18:40:12 +0000
Message-ID: <5e6d50e9b28140158f339b0de343eea4@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.8.247]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Add support for devices XDPE152C4, XDPE12584.

Signed-off-by: Greg Schwendimann <Greg.Schwendimann@infineon.com>
---
Separated the device tree bindings documentation
Resending from same email as Signed-off-by header

 Documentation/hwmon/index.rst     |   1 +
 Documentation/hwmon/xdpe152c4.rst | 118 ++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig       |   9 +++
 drivers/hwmon/pmbus/Makefile      |   1 +
 drivers/hwmon/pmbus/xdpe152c4.c   |  75 +++++++++++++++++++
 5 files changed, 204 insertions(+)
 create mode 100644 Documentation/hwmon/xdpe152c4.rst
 create mode 100644 drivers/hwmon/pmbus/xdpe152c4.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 863b76289159..355c682f9ec4 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -223,6 +223,7 @@ Hardware Monitoring Kernel Drivers
    wm8350
    xgene-hwmon
    xdpe12284
+   xdpe152c4
    zl6100
=20
 .. only::  subproject and html
diff --git a/Documentation/hwmon/xdpe152c4.rst b/Documentation/hwmon/xdpe15=
2c4.rst
new file mode 100644
index 000000000000..ab92c32d4d69
--- /dev/null
+++ b/Documentation/hwmon/xdpe152c4.rst
@@ -0,0 +1,118 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver xdpe152
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Supported chips:
+
+  * Infineon XDPE152C4
+
+    Prefix: 'xdpe152c4'
+
+  * Infineon XDPE15284
+
+    Prefix: 'xdpe15284'
+
+Authors:
+
+    Greg Schwendimann <greg.schwendimann@infineon.com>
+
+Description
+-----------
+
+This driver implements support for Infineon Digital Multi-phase Controller
+XDPE152C4 and XDPE15284 dual loop voltage regulators.
+The devices are compliant with:
+
+- Intel VR13, VR13HC and VR14 rev 1.86
+  converter specification.
+- Intel SVID rev 1.93. protocol.
+- PMBus rev 1.3.1 interface.
+
+Devices support linear format for reading input and output voltage, input
+and output current, input and output power and temperature.
+
+Devices support two pages for telemetry.
+
+The driver provides for current: input, maximum and critical thresholds
+and maximum and critical alarms. Low Critical thresholds and Low critical =
alarm are
+supported only for current output.
+The driver exports the following attributes for via the sysfs files, where
+indexes 1, 2 are for "iin" and 3, 4 for "iout":
+
+**curr[1-4]_crit**
+
+**curr[1-4]_crit_alarm**
+
+**curr[1-4]_input**
+
+**curr[1-4]_label**
+
+**curr[1-4]_max**
+
+**curr[1-4]_max_alarm**
+
+**curr[3-4]_lcrit**
+
+**curr[3-4]_lcrit_alarm**
+
+**curr[3-4]_rated_max**
+
+The driver provides for voltage: input, critical and low critical threshol=
ds
+and critical and low critical alarms.
+The driver exports the following attributes for via the sysfs files, where
+indexes 1, 2 are for "vin" and 3, 4 for "vout":
+
+**in[1-4]_min**
+
+**in[1-4]_crit**
+
+**in[1-4_crit_alarm**
+
+**in[1-4]_input**
+
+**in[1-4]_label**
+
+**in[1-4]_max**
+
+**in[1-4]_max_alarm**
+
+**in[1-4]_min**
+
+**in[1-4]_min_alarm**
+
+**in[3-4]_lcrit**
+
+**in[3-4]_lcrit_alarm**
+
+**in[3-4]_rated_max**
+
+**in[3-4]_rated_min**
+
+The driver provides for power: input and alarms.
+The driver exports the following attributes for via the sysfs files, where
+indexes 1, 2 are for "pin" and 3, 4 for "pout":
+
+**power[1-2]_alarm**
+
+**power[1-4]_input**
+
+**power[1-4]_label**
+
+**power[1-4]_max**
+
+**power[1-4]_rated_max**
+
+The driver provides for temperature: input, maximum and critical threshold=
s
+and maximum and critical alarms.
+The driver exports the following attributes for via the sysfs files:
+
+**temp[1-2]_crit**
+
+**temp[1-2]_crit_alarm**
+
+**temp[1-2]_input**
+
+**temp[1-2]_max**
+
+**temp[1-2]_max_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a2ea1d5a8765..fe0d0e44da4f 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -408,6 +408,15 @@ config SENSORS_UCD9200
 	  This driver can also be built as a module. If so, the module will
 	  be called ucd9200.
=20
+config SENSORS_XDPE152
+	tristate "Infineon XDPE152 family"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDPE15284, XDPE152C4, device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdpe152c4.
+
 config SENSORS_XDPE122
 	tristate "Infineon XDPE122 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index a4a96ac71de7..4678fba5012c 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -43,5 +43,6 @@ obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679.o
 obj-$(CONFIG_SENSORS_UCD9000)	+=3D ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+=3D ucd9200.o
 obj-$(CONFIG_SENSORS_XDPE122)	+=3D xdpe12284.o
+obj-$(CONFIG_SENSORS_XDPE152)	+=3D xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+=3D zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+=3D pim4328.o
diff --git a/drivers/hwmon/pmbus/xdpe152c4.c b/drivers/hwmon/pmbus/xdpe152c=
4.c
new file mode 100644
index 000000000000..b8a36ef73e45
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdpe152c4.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Infineon Multi-phase Digital VR Controll=
ers
+ *
+ * Copyright (c) 2022 Infineon Technologies. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define XDPE152_PAGE_NUM 2
+
+static struct pmbus_driver_info xdpe152_info =3D {
+	.pages =3D XDPE152_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] =3D linear,
+	.format[PSC_VOLTAGE_OUT] =3D linear,
+	.format[PSC_TEMPERATURE] =3D linear,
+	.format[PSC_CURRENT_IN] =3D linear,
+	.format[PSC_CURRENT_OUT] =3D linear,
+	.format[PSC_POWER] =3D linear,
+	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
+	.func[1] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
+};
+
+static int xdpe152_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+
+	info =3D devm_kmemdup(&client->dev, &xdpe152_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id xdpe152_id[] =3D {
+	{"xdpe152c4", 0},
+	{"xdpe15284", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, xdpe152_id);
+
+static const struct of_device_id __maybe_unused xdpe152_of_match[] =3D {
+	{.compatible =3D "infineon,xdpe152c4"},
+	{.compatible =3D "infineon,xdpe15284"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, xdpe152_of_match);
+
+static struct i2c_driver xdpe152_driver =3D {
+	.driver =3D {
+		.name =3D "xdpe152c4",
+		.of_match_table =3D of_match_ptr(xdpe152_of_match),
+	},
+	.probe_new =3D xdpe152_probe,
+	.id_table =3D xdpe152_id,
+};
+
+module_i2c_driver(xdpe152_driver);
+
+MODULE_AUTHOR("Greg Schwendimann <greg.schwendimann@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDPE152 family");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
--=20
2.25.1

