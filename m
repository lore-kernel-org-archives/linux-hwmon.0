Return-Path: <Michael.Hennerich@analog.com>
Return-path: <Michael.Hennerich@analog.com>
From: <michael.hennerich@analog.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <robh+dt@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Michael
 Hennerich" <michael.hennerich@analog.com>
Subject: [PATCH] drivers: hwmon: pmbus: ltc2978: Add support for LTM4686 uModule
Date: Tue, 14 Aug 2018 14:18:28 +0200
Message-ID: <1534249108-29765-1-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Michael Hennerich <michael.hennerich@analog.com>

This patch adds support for LTM4686 Ultrathin Dual 10A or
Single 20A uModule Regulator with Digital Power System Management.

Datasheet: http://www.analog.com/ltm4686


Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
---
 Documentation/devicetree/bindings/hwmon/ltc2978.txt | 2 ++
 Documentation/hwmon/ltc2978                         | 5 +++++
 drivers/hwmon/pmbus/Kconfig                         | 3 ++-
 drivers/hwmon/pmbus/ltc2978.c                       | 9 ++++++++-
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ltc2978.txt b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
index bf2a47b..b428a70 100644
--- a/Documentation/devicetree/bindings/hwmon/ltc2978.txt
+++ b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
@@ -15,6 +15,7 @@ Required properties:
   * "lltc,ltm2987"
   * "lltc,ltm4675"
   * "lltc,ltm4676"
+  * "lltc,ltm4686"
 - reg: I2C slave address
 
 Optional properties:
@@ -30,6 +31,7 @@ Valid names of regulators depend on number of supplies supported per device:
   * ltc3880, ltc3882, ltc3886 : vout0 - vout1
   * ltc3883 : vout0
   * ltm4676 : vout0 - vout1
+  * ltm4686 : vout0 - vout1
 
 Example:
 ltc2978@5e {
diff --git a/Documentation/hwmon/ltc2978 b/Documentation/hwmon/ltc2978
index 9a49d3c..dfb2caa 100644
--- a/Documentation/hwmon/ltc2978
+++ b/Documentation/hwmon/ltc2978
@@ -55,6 +55,10 @@ Supported chips:
     Prefix: 'ltm4676'
     Addresses scanned: -
     Datasheet: http://www.linear.com/product/ltm4676
+  * Analog Devices LTM4686
+    Prefix: 'ltm4686'
+    Addresses scanned: -
+    Datasheet: http://www.analog.com/ltm4686
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
@@ -76,6 +80,7 @@ additional components on a single die. The chip is instantiated and reported
 as two separate chips on two different I2C bus addresses.
 LTM4675 is a dual 9A or single 18A μModule regulator
 LTM4676 is a dual 13A or single 26A uModule regulator.
+LTM4686 is a dual 10A or single 20A uModule regulator.
 
 
 Usage Notes
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index e71aec6..28279a8 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -83,7 +83,8 @@ config SENSORS_LTC2978_REGULATOR
 	depends on SENSORS_LTC2978 && REGULATOR
 	help
 	  If you say yes here you get regulator support for Linear
-	  Technology LTC2974, LTC2977, LTC2978, LTC3880, LTC3883, and LTM4676.
+	  Technology LTC2974, LTC2977, LTC2978, LTC3880, LTC3883, LTM4676
+	  and LTM4686.
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 58b789c..07afb92 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2011 Ericsson AB.
  * Copyright (c) 2013, 2014, 2015 Guenter Roeck
  * Copyright (c) 2015 Linear Technology
+ * Copyright (c) 2018 Analog Devices Inc.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -28,7 +29,7 @@
 #include "pmbus.h"
 
 enum chips { ltc2974, ltc2975, ltc2977, ltc2978, ltc2980, ltc3880, ltc3882,
-	ltc3883, ltc3886, ltc3887, ltm2987, ltm4675, ltm4676 };
+	ltc3883, ltc3886, ltc3887, ltm2987, ltm4675, ltm4676, ltm4686 };
 
 /* Common for all chips */
 #define LTC2978_MFR_VOUT_PEAK		0xdd
@@ -81,6 +82,7 @@ enum chips { ltc2974, ltc2975, ltc2977, ltc2978, ltc2980, ltc3880, ltc3882,
 #define LTM4676_ID_REV1			0x4400
 #define LTM4676_ID_REV2			0x4480
 #define LTM4676A_ID			0x47e0
+#define LTM4686_ID			0x4770
 
 #define LTC2974_NUM_PAGES		4
 #define LTC2978_NUM_PAGES		8
@@ -512,6 +514,7 @@ static const struct i2c_device_id ltc2978_id[] = {
 	{"ltm2987", ltm2987},
 	{"ltm4675", ltm4675},
 	{"ltm4676", ltm4676},
+	{"ltm4686", ltm4686},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ltc2978_id);
@@ -588,6 +591,8 @@ static int ltc2978_get_id(struct i2c_client *client)
 	else if (chip_id == LTM4676_ID_REV1 || chip_id == LTM4676_ID_REV2 ||
 		 chip_id == LTM4676A_ID)
 		return ltm4676;
+	else if (chip_id == LTM4686_ID)
+		return ltm4686;
 
 	dev_err(&client->dev, "Unsupported chip ID 0x%x\n", chip_id);
 	return -ENODEV;
@@ -684,6 +689,7 @@ static int ltc2978_probe(struct i2c_client *client,
 	case ltc3887:
 	case ltm4675:
 	case ltm4676:
+	case ltm4686:
 		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
 		info->read_word_data = ltc3880_read_word_data;
 		info->pages = LTC3880_NUM_PAGES;
@@ -770,6 +776,7 @@ static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,ltm2987" },
 	{ .compatible = "lltc,ltm4675" },
 	{ .compatible = "lltc,ltm4676" },
+	{ .compatible = "lltc,ltm4686" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltc2978_of_match);
-- 
2.7.4
