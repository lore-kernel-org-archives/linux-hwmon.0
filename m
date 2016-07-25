Return-path: <michael@walle.cc>
From: Michael Walle <michael@walle.cc>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 1/2] hwmon: adt7411: set sane values for CFG1 and CFG3
Date: Mon, 25 Jul 2016 11:12:05 +0200
Message-Id: <1469437926-3508-1-git-send-email-michael@walle.cc>
List-ID: <linux-hwmon@vger.kernel.org>

According to the datasheet we have to set some bits as 0 and others as 1.
Make sure we do this for CFG1 and CFG3.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes v2:
 - remove unnecessary locking in adt7411_init_device()

 drivers/hwmon/adt7411.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index a7f8869..fc1e65a 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -30,6 +30,7 @@
 
 #define ADT7411_REG_CFG1			0x18
 #define ADT7411_CFG1_START_MONITOR		(1 << 0)
+#define ADT7411_CFG1_RESERVED_BIT1		(1 << 1)
 #define ADT7411_CFG1_RESERVED_BIT3		(1 << 3)
 
 #define ADT7411_REG_CFG2			0x19
@@ -37,6 +38,9 @@
 
 #define ADT7411_REG_CFG3			0x1a
 #define ADT7411_CFG3_ADC_CLK_225		(1 << 0)
+#define ADT7411_CFG3_RESERVED_BIT1		(1 << 1)
+#define ADT7411_CFG3_RESERVED_BIT2		(1 << 2)
+#define ADT7411_CFG3_RESERVED_BIT3		(1 << 3)
 #define ADT7411_CFG3_REF_VDD			(1 << 4)
 
 #define ADT7411_REG_DEVICE_ID			0x4d
@@ -280,6 +284,45 @@ static int adt7411_detect(struct i2c_client *client,
 	return 0;
 }
 
+static int adt7411_init_device(struct adt7411_data *data)
+{
+	int ret;
+	u8 val;
+
+	ret = i2c_smbus_read_byte_data(data->client, ADT7411_REG_CFG3);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We must only write zero to bit 1 and bit 2 and only one to bit 3
+	 * according to the datasheet.
+	 */
+	val = ret;
+	val &= ~(ADT7411_CFG3_RESERVED_BIT1 | ADT7411_CFG3_RESERVED_BIT2);
+	val |= ADT7411_CFG3_RESERVED_BIT3;
+
+	ret = i2c_smbus_write_byte_data(data->client, ADT7411_REG_CFG3, val);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_byte_data(data->client, ADT7411_REG_CFG1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We must only write zero to bit 1 and only one to bit 3 according to
+	 * the datasheet.
+	 */
+	val = ret;
+	val &= ~ADT7411_CFG1_RESERVED_BIT1;
+	val |= ADT7411_CFG1_RESERVED_BIT3;
+
+	/* enable monitoring */
+	val |= ADT7411_CFG1_START_MONITOR;
+
+	return i2c_smbus_write_byte_data(data->client, ADT7411_REG_CFG1, val);
+}
+
 static int adt7411_probe(struct i2c_client *client,
 				   const struct i2c_device_id *id)
 {
@@ -297,10 +340,7 @@ static int adt7411_probe(struct i2c_client *client,
 	mutex_init(&data->device_lock);
 	mutex_init(&data->update_lock);
 
-	/* According to the datasheet, we must only write 1 to bit 3 */
-	ret = adt7411_modify_bit(client, ADT7411_REG_CFG1,
-				 ADT7411_CFG1_RESERVED_BIT3
-				 | ADT7411_CFG1_START_MONITOR, 1);
+	ret = adt7411_init_device(data);
 	if (ret < 0)
 		return ret;
 
-- 
2.1.4
