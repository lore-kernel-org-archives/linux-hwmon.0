Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from p3plsmtpa06-02.prod.phx3.secureserver.net ([173.201.192.103]:43672
        "EHLO p3plsmtpa06-02.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932260AbcLRMmP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Dec 2016 07:42:15 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
To: linux-hwmon@vger.kernel.org
Cc: urs.fleisch@sensirion.com
Subject: [PATCH] hwmon: (sht21) Add Electronic Identification Code retrieval
Date: Sun, 18 Dec 2016 06:34:25 -0600
Message-Id: <1482064465-9674-1-git-send-email-pab@pabigot.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Expose the per-chip unique identifier so it can be used to identify the
sensor producing the measurements.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 Documentation/hwmon/sht21 |  6 ++--
 drivers/hwmon/sht21.c     | 92 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/sht21 b/Documentation/hwmon/sht21
index db17fda..a0db761 100644
--- a/Documentation/hwmon/sht21
+++ b/Documentation/hwmon/sht21
@@ -16,6 +16,7 @@ Supported chips:
 
 Author:
   Urs Fleisch <urs.fleisch@sensirion.com>
+  Peter A. Bigot <pab@pabigot.com>
 
 Description
 -----------
@@ -35,6 +36,7 @@ sysfs-Interface
 
 temp1_input - temperature input
 humidity1_input - humidity input
+eic1_input - Electronic Identification Code
 
 Notes
 -----
@@ -45,5 +47,5 @@ humidity and 66 ms for temperature. To keep self heating below 0.1 degree
 Celsius, the device should not be active for more than 10% of the time,
 e.g. maximum two measurements per second at the given resolution.
 
-Different resolutions, the on-chip heater, using the CRC checksum and reading
-the serial number are not supported yet.
+Different resolutions, the on-chip heater, and using the CRC checksum
+are not supported yet.
diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index 84cdb1c..530350b 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -1,6 +1,7 @@
 /* Sensirion SHT21 humidity and temperature sensor driver
  *
  * Copyright (C) 2010 Urs Fleisch <urs.fleisch@sensirion.com>
+ * Copyright (C) 2016 Peter A. Bigot <pab@pabigot.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -35,6 +36,10 @@
 #define SHT21_TRIG_T_MEASUREMENT_HM  0xe3
 #define SHT21_TRIG_RH_MEASUREMENT_HM 0xe5
 
+/* Valid flags */
+#define SHT21_MEASUREMENT_VALID 0x01
+#define SHT21_EIC_VALID 0x02
+
 /**
  * struct sht21 - SHT21 device specific data
  * @hwmon_dev: device registered with hwmon
@@ -43,6 +48,7 @@
  * @last_update: time of last update (jiffies)
  * @temperature: cached temperature measurement value
  * @humidity: cached humidity measurement value
+ * @eic: cached electronic identification code
  */
 struct sht21 {
 	struct i2c_client *client;
@@ -51,6 +57,7 @@ struct sht21 {
 	unsigned long last_update;
 	int temperature;
 	int humidity;
+	u8 eic[8];
 };
 
 /**
@@ -101,7 +108,8 @@ static int sht21_update_measurements(struct device *dev)
 	 * SHT2x should not be active for more than 10% of the time - e.g.
 	 * maximum two measurements per second at 12bit accuracy shall be made.
 	 */
-	if (time_after(jiffies, sht21->last_update + HZ / 2) || !sht21->valid) {
+	if (time_after(jiffies, sht21->last_update + HZ / 2)
+	    || !(SHT21_MEASUREMENT_VALID & sht21->valid)) {
 		ret = i2c_smbus_read_word_swapped(client,
 						  SHT21_TRIG_T_MEASUREMENT_HM);
 		if (ret < 0)
@@ -113,7 +121,7 @@ static int sht21_update_measurements(struct device *dev)
 			goto out;
 		sht21->humidity = sht21_rh_ticks_to_per_cent_mille(ret);
 		sht21->last_update = jiffies;
-		sht21->valid = 1;
+		sht21->valid |= SHT21_MEASUREMENT_VALID;
 	}
 out:
 	mutex_unlock(&sht21->lock);
@@ -165,15 +173,95 @@ static ssize_t sht21_show_humidity(struct device *dev,
 	return sprintf(buf, "%d\n", sht21->humidity);
 }
 
+/**
+ * sht21_show_eic() - show Electronic Identification Code in sysfs
+ * @dev: device
+ * @attr: device attribute
+ * @buf: sysfs buffer (PAGE_SIZE) where measurement values are written to
+ *
+ * Will be called on read access to eic1_input sysfs attribute.
+ * Returns number of bytes written into buffer, negative errno on error.
+ */
+static ssize_t sht21_show_eic(struct device *dev,
+	struct device_attribute *attr,
+	char *buf)
+{
+	struct sht21 *sht21 = dev_get_drvdata(dev);
+	struct i2c_client *client = sht21->client;
+	int ret = 0;
+	int i;
+	char *bp = buf;
+	mutex_lock(&sht21->lock);
+	if (!(SHT21_EIC_VALID & sht21->valid)) {
+		u8 tx[4];
+		u8 rx[8];
+		struct i2c_msg msgs[2] = {
+			{
+				.addr = client->addr,
+				.flags = 0,
+				.len = 0,
+				.buf = tx,
+			},
+			{
+				.addr = client->addr,
+				.flags = I2C_M_RD,
+				.len = 0,
+				.buf = rx,
+			},
+		};
+		u8 *dp = tx;
+		*dp++ = 0xFA;
+		*dp++ = 0x0F;
+		msgs[0].len = dp-tx;
+		msgs[1].len = 8;
+		ret = i2c_transfer(client->adapter, msgs, 2);
+		if (ret < 0)
+			goto out;
+		sht21->eic[2] = rx[0];
+		sht21->eic[3] = rx[2];
+		sht21->eic[4] = rx[4];
+		sht21->eic[5] = rx[6];
+		dp = tx;
+		*dp++ = 0xFC;
+		*dp++ = 0xC9;
+		msgs[0].len = dp-tx;
+		msgs[1].len = 6;
+		ret = i2c_transfer(client->adapter, msgs, 2);
+		if (ret < 0)
+			goto out;
+		sht21->eic[0] = rx[3];
+		sht21->eic[1] = rx[4];
+		sht21->eic[6] = rx[0];
+		sht21->eic[7] = rx[1];
+		sht21->valid |= SHT21_EIC_VALID;
+	}
+
+	for (i = 0; i < sizeof(sht21->eic); ++i) {
+		ret = sprintf(bp, "%02x", sht21->eic[i]);
+		if (ret < 0)
+			goto out;
+		bp += ret;
+	}
+out:
+	mutex_unlock(&sht21->lock);
+	if (ret >= 0) {
+		*bp++ = '\n';
+		ret = bp - buf;
+	}
+	return ret;
+}
+
 /* sysfs attributes */
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, sht21_show_temperature,
 	NULL, 0);
 static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO, sht21_show_humidity,
 	NULL, 0);
+static SENSOR_DEVICE_ATTR(eic1_input, S_IRUGO, sht21_show_eic, NULL, 0);
 
 static struct attribute *sht21_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
 	&sensor_dev_attr_humidity1_input.dev_attr.attr,
+	&sensor_dev_attr_eic1_input.dev_attr.attr,
 	NULL
 };
 
-- 
2.7.4

