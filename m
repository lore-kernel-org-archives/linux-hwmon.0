Return-Path: <34CSYWwUKBW0VfYjTRZZRWP.NZXWTYficZPNV-fd.YPe@flex--kunyi.bounces.google.com>
Return-path: <34CSYWwUKBW0VfYjTRZZRWP.NZXWTYficZPNV-fd.YPe@flex--kunyi.bounces.google.com>
Date: Tue, 11 Sep 2018 13:25:58 -0700
Message-Id: <20180911202558.58433-1-kunyi@google.com>
Mime-Version: 1.0
Subject: [PATCH] hwmon: (lm75) Add MAX31725/6 support
From: Kun Yi <kunyi@google.com>
To: linux-hwmon@vger.kernel.org, linux@roeck-us.net, frodol@dds.nl
Cc: openbmc@lists.ozlabs.org, rlippert@google.com, benjaminfair@google.com,
	Kun Yi <kunyi@google.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

MAX31725/MAX31726 are local temperature sensors with +/- 0.5 degree
Celsius accuracy and 16-bit (0.00390625 degrees Celsius) resolution.
They have a register mapping and encoding compatible with the lm75
series drivers. Address scan and extended temperature range are
not supported by this patch.

Tested on real hardware and verified temperature readings are correct.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 Documentation/hwmon/lm75 |  6 +++---
 drivers/hwmon/lm75.c     | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
index ac95edfcd907..2f1120f88c16 100644
--- a/Documentation/hwmon/lm75
+++ b/Documentation/hwmon/lm75
@@ -17,8 +17,8 @@ Supported chips:
     Addresses scanned: none
     Datasheet: Publicly available at the Maxim website
                http://www.maximintegrated.com/
-  * Maxim MAX6625, MAX6626
-    Prefixes: 'max6625', 'max6626'
+  * Maxim MAX6625, MAX6626, MAX31725, MAX31726
+    Prefixes: 'max6625', 'max6626', 'max31725', 'max31726'
     Addresses scanned: none
     Datasheet: Publicly available at the Maxim website
                http://www.maxim-ic.com/
@@ -86,7 +86,7 @@ The LM75 is essentially an industry standard; there may be other
 LM75 clones not listed here, with or without various enhancements,
 that are supported. The clones are not detected by the driver, unless
 they reproduce the exact register tricks of the original LM75, and must
-therefore be instantiated explicitly. Higher resolution up to 12-bit
+therefore be instantiated explicitly. Higher resolution up to 16-bit
 is supported by this driver, other specific enhancements are not.
 
 The LM77 is not supported, contrary to what we pretended for a long time.
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 49f4b33a5685..e6e5a1080f09 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -47,6 +47,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	lm75b,
 	max6625,
 	max6626,
+	max31725,
 	mcp980x,
 	stds75,
 	tcn75,
@@ -64,7 +65,6 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 					0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
 
-
 /* The LM75 registers */
 #define LM75_REG_TEMP		0x00
 #define LM75_REG_CONF		0x01
@@ -76,7 +76,7 @@ struct lm75_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
 	u8			orig_conf;
-	u8			resolution;	/* In bits, between 9 and 12 */
+	u8			resolution;	/* In bits, between 9 and 16 */
 	u8			resolution_limits;
 	unsigned int		sample_time;	/* In ms */
 };
@@ -339,6 +339,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->resolution_limits = 9;
 		data->sample_time = MSEC_PER_SEC / 4;
 		break;
+	case max31725:
+		data->resolution = 16;
+		data->sample_time = MSEC_PER_SEC / 8;
+		break;
 	case tcn75:
 		data->resolution = 9;
 		data->sample_time = MSEC_PER_SEC / 8;
@@ -415,6 +419,8 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "lm75b", lm75b, },
 	{ "max6625", max6625, },
 	{ "max6626", max6626, },
+	{ "max31725", max31725, },
+	{ "max31726", max31725, },
 	{ "mcp980x", mcp980x, },
 	{ "stds75", stds75, },
 	{ "tcn75", tcn75, },
@@ -471,6 +477,14 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "maxim,max6626",
 		.data = (void *)max6626
 	},
+	{
+		.compatible = "maxim,max31725",
+		.data = (void *)max31725
+	},
+	{
+		.compatible = "maxim,max31726",
+		.data = (void *)max31725
+	},
 	{
 		.compatible = "maxim,mcp980x",
 		.data = (void *)mcp980x
-- 
2.19.0.rc2.392.g5ba43deb5a-goog
