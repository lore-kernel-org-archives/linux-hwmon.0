Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:41919 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbcJDEI1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2016 00:08:27 -0400
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael.Wang@alliedtelesis.co.nz,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCHv1] hwmon: adm9240: handle temperature readings below 0
Date: Tue,  4 Oct 2016 17:08:00 +1300
Message-Id: <20161004040800.9689-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Unlike the temperature thresholds the temperature data is a 9-bit signed
value. This allows and additional 0.5 degrees of precision on the
reading but means we can't rely on sign-extension to handle negative
values.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/hwmon/adm9240.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 98114ce..6929b25 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -107,6 +107,21 @@ static inline s8 TEMP_TO_REG(long val)
 	return clamp_val(SCALE(val, 1, 1000), -40, 127);
 }
 
+/* 8-bit signed temperature (from Thigh, Tlow etc) */
+static inline int TEMP_FROM_REG(s8 val)
+{
+	return val * 1000;
+}
+
+/* 9-bit signed temperature (from temperature data) */
+static inline int TEMP_FROM_DATA_REG(s16 val)
+{
+	if (val > 255)
+		val -= 512;
+
+	return val * 500;
+}
+
 /* two fans, each with low fan speed limit */
 static inline unsigned int FAN_FROM_REG(u8 reg, u8 div)
 {
@@ -263,7 +278,7 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *dummy,
 		char *buf)
 {
 	struct adm9240_data *data = adm9240_update_device(dev);
-	return sprintf(buf, "%d\n", data->temp * 500); /* 9-bit value */
+	return sprintf(buf, "%d\n", TEMP_FROM_DATA_REG(data->temp));
 }
 
 static ssize_t show_max(struct device *dev, struct device_attribute *devattr,
@@ -271,7 +286,7 @@ static ssize_t show_max(struct device *dev, struct device_attribute *devattr,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct adm9240_data *data = adm9240_update_device(dev);
-	return sprintf(buf, "%d\n", data->temp_max[attr->index] * 1000);
+	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[attr->index]));
 }
 
 static ssize_t set_max(struct device *dev, struct device_attribute *devattr,
-- 
2.10.0

