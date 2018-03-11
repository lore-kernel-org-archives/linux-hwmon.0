Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:41551 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751223AbeCKC7M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Mar 2018 21:59:12 -0500
Received: by mail-oi0-f67.google.com with SMTP id g5so9808938oiy.8
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Mar 2018 18:59:12 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/3] hwmon: (pmbus/adm1275) Add support for ADM1272
Date: Sat, 10 Mar 2018 18:59:04 -0800
Message-Id: <1520737144-7955-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1520737144-7955-1-git-send-email-linux@roeck-us.net>
References: <1520737144-7955-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The chip is quite similar to other chips in the series,
but as usual it comes with its own quirks.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/adm1275   | 20 +++++++------
 drivers/hwmon/pmbus/Kconfig   |  4 +--
 drivers/hwmon/pmbus/adm1275.c | 67 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 11 deletions(-)

diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
index 791bc0bd91e6..39033538eb03 100644
--- a/Documentation/hwmon/adm1275
+++ b/Documentation/hwmon/adm1275
@@ -6,6 +6,10 @@ Supported chips:
     Prefix: 'adm1075'
     Addresses scanned: -
     Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1075.pdf
+  * Analog Devices ADM1272
+    Prefix: 'adm1272'
+    Addresses scanned: -
+    Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1272.pdf
   * Analog Devices ADM1275
     Prefix: 'adm1275'
     Addresses scanned: -
@@ -29,11 +33,11 @@ Author: Guenter Roeck <linux@roeck-us.net>
 Description
 -----------
 
-This driver supports hardware monitoring for Analog Devices ADM1075, ADM1275,
-ADM1276, ADM1278, ADM1293, and ADM1294 Hot-Swap Controller and Digital
-Power Monitors.
+This driver supports hardware monitoring for Analog Devices ADM1075, ADM1272,
+ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 Hot-Swap Controller and
+Digital Power Monitors.
 
-ADM1075, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 are hot-swap
+ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 are hot-swap
 controllers that allow a circuit board to be removed from or inserted into
 a live backplane. They also feature current and voltage readback via an
 integrated 12 bit analog-to-digital converter (ADC), accessed using a
@@ -100,11 +104,10 @@ power1_input_lowest	Lowest observed input power. ADM1293 and ADM1294 only.
 power1_input_highest	Highest observed input power.
 power1_reset_history	Write any value to reset history.
 
-			Power attributes are supported on ADM1075, ADM1276,
-			ADM1293, and ADM1294.
+			Power attributes are supported on ADM1075, ADM1272,
+			ADM1276, ADM1293, and ADM1294.
 
 temp1_input		Chip temperature.
-			Temperature attributes are only available on ADM1278.
 temp1_max		Maximum chip temperature.
 temp1_max_alarm		Temperature alarm.
 temp1_crit		Critical chip temperature.
@@ -112,4 +115,5 @@ temp1_crit_alarm	Critical temperature high alarm.
 temp1_highest		Highest observed temperature.
 temp1_reset_history	Write any value to reset history.
 
-			Temperature attributes are supported on ADM1278.
+			Temperature attributes are supported on ADM1272 and
+			ADM1278.
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 6e4298e99222..e71aec69e76e 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -31,8 +31,8 @@ config SENSORS_ADM1275
 	default n
 	help
 	  If you say yes here you get hardware monitoring support for Analog
-	  Devices ADM1075, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294
-	  Hot-Swap Controller and Digital Power Monitors.
+	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293,
+	  and ADM1294 Hot-Swap Controller and Digital Power Monitors.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 8a44e94d5679..13600fa79e7f 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -3,6 +3,7 @@
  * and Digital Power Monitor
  *
  * Copyright (c) 2011 Ericsson AB.
+ * Copyright (c) 2018 Guenter Roeck
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -24,7 +25,7 @@
 #include <linux/bitops.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -41,6 +42,8 @@ enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
 #define ADM1075_IRANGE_25		BIT(3)
 #define ADM1075_IRANGE_MASK		(BIT(3) | BIT(4))
 
+#define ADM1272_IRANGE			BIT(0)
+
 #define ADM1278_TEMP1_EN		BIT(3)
 #define ADM1278_VIN_EN			BIT(2)
 #define ADM1278_VOUT_EN			BIT(1)
@@ -105,6 +108,19 @@ static const struct coefficients adm1075_coefficients[] = {
 	[4] = { 4279, 0, -1 },		/* power, irange50 */
 };
 
+static const struct coefficients adm1272_coefficients[] = {
+	[0] = { 6770, 0, -2 },		/* voltage, vrange 60V */
+	[1] = { 4062, 0, -2 },		/* voltage, vrange 100V */
+	[2] = { 1326, 20480, -1 },	/* current, vsense range 15mV */
+	[3] = { 663, 20480, -1 },	/* current, vsense range 30mV */
+	[4] = { 3512, 0, -2 },		/* power, vrange 60V, irange 15mV */
+	[5] = { 21071, 0, -3 },		/* power, vrange 100V, irange 15mV */
+	[6] = { 17561, 0, -3 },		/* power, vrange 60V, irange 30mV */
+	[7] = { 10535, 0, -3 },		/* power, vrange 100V, irange 30mV */
+	[8] = { 42, 31871, -1 },	/* temperature */
+
+};
+
 static const struct coefficients adm1275_coefficients[] = {
 	[0] = { 19199, 0, -2 },		/* voltage, vrange set */
 	[1] = { 6720, 0, -1 },		/* voltage, vrange not set */
@@ -335,6 +351,7 @@ static int adm1275_read_byte_data(struct i2c_client *client, int page, int reg)
 
 static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1075", adm1075 },
+	{ "adm1272", adm1272 },
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
@@ -451,6 +468,54 @@ static int adm1275_probe(struct i2c_client *client,
 			info->func[0] |=
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
+	case adm1272:
+		data->have_vout = true;
+		data->have_pin_max = true;
+		data->have_temp_max = true;
+
+		coefficients = adm1272_coefficients;
+		vindex = (config & ADM1275_VRANGE) ? 1 : 0;
+		cindex = (config & ADM1272_IRANGE) ? 3 : 2;
+		/* pindex depends on the combination of the above */
+		switch (config & (ADM1275_VRANGE | ADM1272_IRANGE)) {
+		case 0:
+		default:
+			pindex = 4;
+			break;
+		case ADM1275_VRANGE:
+			pindex = 5;
+			break;
+		case ADM1272_IRANGE:
+			pindex = 6;
+			break;
+		case ADM1275_VRANGE | ADM1272_IRANGE:
+			pindex = 7;
+			break;
+		}
+		tindex = 8;
+
+		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+
+		/* Enable VOUT if not enabled (it is disabled by default) */
+		if (!(config & ADM1278_VOUT_EN)) {
+			config |= ADM1278_VOUT_EN;
+			ret = i2c_smbus_write_byte_data(client,
+							ADM1275_PMON_CONFIG,
+							config);
+			if (ret < 0) {
+				dev_err(&client->dev,
+					"Failed to enable VOUT monitoring\n");
+				return -ENODEV;
+			}
+		}
+
+		if (config & ADM1278_TEMP1_EN)
+			info->func[0] |=
+				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+		if (config & ADM1278_VIN_EN)
+			info->func[0] |= PMBUS_HAVE_VIN;
+		break;
 	case adm1275:
 		if (device_config & ADM1275_IOUT_WARN2_SELECT)
 			data->have_oc_fault = true;
-- 
2.7.4

