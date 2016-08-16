Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta3.messagelabs.com ([195.245.230.164]:34994 "EHLO
	mail1.bemta3.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753182AbcHPLLr (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 16 Aug 2016 07:11:47 -0400
Received: from abgdgate60u.abg.fsc.net ([172.25.138.90])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id u7GBC6Co002874
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Aug 2016 12:12:22 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: linux-hwmon@vger.kernel.org
Cc: Thilo Cestonaro <thilo@cestona.ro>
Subject: [PATCH] hwmon: add i2c detect functionality to fts teutates driver
Date: Tue, 16 Aug 2016 13:07:53 +0200
Message-Id: <1471345673-17729-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Thilo Cestonaro <thilo@cestona.ro>

Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
---
 drivers/hwmon/ftsteutates.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 48633e5..0f0277e 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -36,6 +36,10 @@
 #define FTS_EVENT_STATUS_REG		0x0006
 #define FTS_GLOBAL_CONTROL_REG		0x0007
 
+#define FTS_DEVICE_DETECT_REG_1		0x0C
+#define FTS_DEVICE_DETECT_REG_2		0x0D
+#define FTS_DEVICE_DETECT_REG_3		0x0E
+
 #define FTS_SENSOR_EVENT_REG		0x0010
 
 #define FTS_FAN_EVENT_REG		0x0014
@@ -54,6 +58,8 @@
 #define FTS_NO_TEMP_SENSORS		0x10
 #define FTS_NO_VOLT_SENSORS		0x04
 
+static const unsigned short normal_i2c[] = { 0x73, I2C_CLIENT_END };
+
 static struct i2c_device_id fts_id[] = {
 	{ "ftsteutates", 0 },
 	{ }
@@ -734,6 +740,42 @@ static const struct attribute_group *fts_attr_groups[] = {
 /*****************************************************************************/
 /* Module initialization / remove functions				     */
 /*****************************************************************************/
+static int fts_detect(struct i2c_client *client,
+		      struct i2c_board_info *info)
+{
+	int val;
+
+	/* detection works with revsion greater or equal to 0x2b */
+	val = i2c_smbus_read_byte_data(client, FTS_DEVICE_REVISION_REG);
+	if (val < 0x2b)
+		return -ENODEV;
+
+	/* Device Detect Regs must have 0x17 0x34 and 0x54 */
+	val = i2c_smbus_read_byte_data(client, FTS_DEVICE_DETECT_REG_1);
+	if (val != 0x17)
+		return -ENODEV;
+
+	val = i2c_smbus_read_byte_data(client, FTS_DEVICE_DETECT_REG_2);
+	if (val != 0x34)
+		return -ENODEV;
+
+	val = i2c_smbus_read_byte_data(client, FTS_DEVICE_DETECT_REG_3);
+	if (val != 0x54)
+		return -ENODEV;
+
+	/*
+	 * 0x10 == Baseboard Management Controller, 0x01 == Teutates
+	 * Device ID Reg needs to be 0x11
+	 */
+	val = i2c_smbus_read_byte_data(client, FTS_DEVICE_ID_REG);
+	if (val != 0x11)
+		return -ENODEV;
+
+	strlcpy(info->type, fts_id[0].name, I2C_NAME_SIZE);
+	info->flags = 0;
+	return 0;
+}
+
 static int fts_remove(struct i2c_client *client)
 {
 	struct fts_data *data = dev_get_drvdata(&client->dev);
@@ -804,12 +846,15 @@ static int fts_probe(struct i2c_client *client, const struct i2c_device_id *id)
 /* Module Details							     */
 /*****************************************************************************/
 static struct i2c_driver fts_driver = {
+	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "ftsteutates",
 	},
 	.id_table = fts_id,
 	.probe = fts_probe,
 	.remove = fts_remove,
+	.detect = fts_detect,
+	.address_list = normal_i2c,
 };
 
 module_i2c_driver(fts_driver);
-- 
2.8.1

