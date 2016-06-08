Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([198.47.19.11]:59704 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751958AbcFHRBp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 8 Jun 2016 13:01:45 -0400
From: "Andrew F. Davis" <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v2 1/1] hwmon: (tmp401) Add support for TI TMP461
Date: Wed, 8 Jun 2016 12:00:54 -0500
Message-ID: <20160608170054.2249-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
Changes from v1:
 - Dropped n-factor correction until a generic solution is developed
 - Removed double empty line

 Documentation/hwmon/tmp401 | 14 ++++++++++++--
 drivers/hwmon/Kconfig      |  2 +-
 drivers/hwmon/tmp401.c     | 35 +++++++++++++++++++++++++++++------
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/tmp401 b/Documentation/hwmon/tmp401
index 711f75e..2d9ca42 100644
--- a/Documentation/hwmon/tmp401
+++ b/Documentation/hwmon/tmp401
@@ -22,6 +22,9 @@ Supported chips:
     Prefix: 'tmp435'
     Addresses scanned: I2C 0x48 - 0x4f
     Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp435.html
+  * Texas Instruments TMP461
+    Prefix: 'tmp461'
+    Datasheet: http://www.ti.com/product/tmp461
 
 Authors:
          Hans de Goede <hdegoede@redhat.com>
@@ -31,8 +34,8 @@ Description
 -----------
 
 This driver implements support for Texas Instruments TMP401, TMP411,
-TMP431, TMP432 and TMP435 chips. These chips implement one or two remote
-and one local temperature sensors. Temperature is measured in degrees
+TMP431, TMP432, TMP435, and TMP461 chips. These chips implement one or two
+remote and one local temperature sensors. Temperature is measured in degrees
 Celsius. Resolution of the remote sensor is 0.0625 degree. Local
 sensor resolution can be set to 0.5, 0.25, 0.125 or 0.0625 degree (not
 supported by the driver so far, so using the default resolution of 0.5
@@ -55,3 +58,10 @@ some additional features.
 
 TMP432 is compatible with TMP401 and TMP431. It supports two external
 temperature sensors.
+
+TMP461 is compatible with TMP401. It supports offset correction
+that is applied to the remote sensor.
+
+* Sensor offset values are temperature values
+
+  Exported via sysfs attribute tempX_offset
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index ff94007..c571dcf 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1561,7 +1561,7 @@ config SENSORS_TMP401
 	depends on I2C
 	help
 	  If you say yes here you get support for Texas Instruments TMP401,
-	  TMP411, TMP431, TMP432 and TMP435 temperature sensor chips.
+	  TMP411, TMP431, TMP432, TMP435, and TMP461 temperature sensor chips.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called tmp401.
diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index ccf4cff..eeeed2c 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -47,7 +47,7 @@
 static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4c, 0x4d,
 	0x4e, 0x4f, I2C_CLIENT_END };
 
-enum chips { tmp401, tmp411, tmp431, tmp432, tmp435 };
+enum chips { tmp401, tmp411, tmp431, tmp432, tmp435, tmp461 };
 
 /*
  * The TMP401 registers, note some registers have different addresses for
@@ -62,31 +62,34 @@ enum chips { tmp401, tmp411, tmp431, tmp432, tmp435 };
 #define TMP401_MANUFACTURER_ID_REG		0xFE
 #define TMP401_DEVICE_ID_REG			0xFF
 
-static const u8 TMP401_TEMP_MSB_READ[6][2] = {
+static const u8 TMP401_TEMP_MSB_READ[7][2] = {
 	{ 0x00, 0x01 },	/* temp */
 	{ 0x06, 0x08 },	/* low limit */
 	{ 0x05, 0x07 },	/* high limit */
 	{ 0x20, 0x19 },	/* therm (crit) limit */
 	{ 0x30, 0x34 },	/* lowest */
 	{ 0x32, 0x36 },	/* highest */
+	{ 0, 0x11 },	/* offset */
 };
 
-static const u8 TMP401_TEMP_MSB_WRITE[6][2] = {
+static const u8 TMP401_TEMP_MSB_WRITE[7][2] = {
 	{ 0, 0 },	/* temp (unused) */
 	{ 0x0C, 0x0E },	/* low limit */
 	{ 0x0B, 0x0D },	/* high limit */
 	{ 0x20, 0x19 },	/* therm (crit) limit */
 	{ 0x30, 0x34 },	/* lowest */
 	{ 0x32, 0x36 },	/* highest */
+	{ 0, 0x11 },	/* offset */
 };
 
-static const u8 TMP401_TEMP_LSB[6][2] = {
+static const u8 TMP401_TEMP_LSB[7][2] = {
 	{ 0x15, 0x10 },	/* temp */
 	{ 0x17, 0x14 },	/* low limit */
 	{ 0x16, 0x13 },	/* high limit */
 	{ 0, 0 },	/* therm (crit) limit (unused) */
 	{ 0x31, 0x35 },	/* lowest */
 	{ 0x33, 0x37 },	/* highest */
+	{ 0, 0x12 },	/* offset */
 };
 
 static const u8 TMP432_TEMP_MSB_READ[4][3] = {
@@ -149,6 +152,7 @@ static const struct i2c_device_id tmp401_id[] = {
 	{ "tmp431", tmp431 },
 	{ "tmp432", tmp432 },
 	{ "tmp435", tmp435 },
+	{ "tmp461", tmp461 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp401_id);
@@ -170,7 +174,7 @@ struct tmp401_data {
 	/* register values */
 	u8 status[4];
 	u8 config;
-	u16 temp[6][3];
+	u16 temp[7][3];
 	u8 temp_crit_hyst;
 };
 
@@ -613,6 +617,22 @@ static const struct attribute_group tmp432_group = {
 };
 
 /*
+ * Additional features of the TMP461 chip.
+ * The TMP461 temperature offset for the remote channel.
+ */
+static SENSOR_DEVICE_ATTR_2(temp2_offset, S_IWUSR | S_IRUGO, show_temp,
+			    store_temp, 6, 1);
+
+static struct attribute *tmp461_attributes[] = {
+	&sensor_dev_attr_temp2_offset.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group tmp461_group = {
+	.attrs = tmp461_attributes,
+};
+
+/*
  * Begin non sysfs callback code (aka Real code)
  */
 
@@ -714,7 +734,7 @@ static int tmp401_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	static const char * const names[] = {
-		"TMP401", "TMP411", "TMP431", "TMP432", "TMP435"
+		"TMP401", "TMP411", "TMP431", "TMP432", "TMP435", "TMP461"
 	};
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
@@ -745,6 +765,9 @@ static int tmp401_probe(struct i2c_client *client,
 	if (data->kind == tmp432)
 		data->groups[groups++] = &tmp432_group;
 
+	if (data->kind == tmp461)
+		data->groups[groups++] = &tmp461_group;
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
 							   data, data->groups);
 	if (IS_ERR(hwmon_dev))
-- 
2.8.3

