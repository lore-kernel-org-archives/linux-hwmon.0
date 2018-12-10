Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42195 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:05 -0500
Received: by mail-pl1-f194.google.com with SMTP id y1so5883837plp.9
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:05 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dirk Eibach <eibach@gdsys.de>
Subject: [PATCH 09/30] hwmon: (ads1015) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:27 -0800
Message-Id: <1544479728-30077-10-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Cc: Dirk Eibach <eibach@gdsys.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ads1015.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
index 98c704d3366a..c21b0529adb2 100644
--- a/drivers/hwmon/ads1015.c
+++ b/drivers/hwmon/ads1015.c
@@ -133,8 +133,8 @@ static int ads1015_reg_to_mv(struct i2c_client *client, unsigned int channel,
 }
 
 /* sysfs callback function */
-static ssize_t show_in(struct device *dev, struct device_attribute *da,
-	char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *da,
+		       char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct i2c_client *client = to_i2c_client(dev);
@@ -149,14 +149,14 @@ static ssize_t show_in(struct device *dev, struct device_attribute *da,
 }
 
 static const struct sensor_device_attribute ads1015_in[] = {
-	SENSOR_ATTR(in0_input, S_IRUGO, show_in, NULL, 0),
-	SENSOR_ATTR(in1_input, S_IRUGO, show_in, NULL, 1),
-	SENSOR_ATTR(in2_input, S_IRUGO, show_in, NULL, 2),
-	SENSOR_ATTR(in3_input, S_IRUGO, show_in, NULL, 3),
-	SENSOR_ATTR(in4_input, S_IRUGO, show_in, NULL, 4),
-	SENSOR_ATTR(in5_input, S_IRUGO, show_in, NULL, 5),
-	SENSOR_ATTR(in6_input, S_IRUGO, show_in, NULL, 6),
-	SENSOR_ATTR(in7_input, S_IRUGO, show_in, NULL, 7),
+	SENSOR_ATTR_RO(in0_input, in, 0),
+	SENSOR_ATTR_RO(in1_input, in, 1),
+	SENSOR_ATTR_RO(in2_input, in, 2),
+	SENSOR_ATTR_RO(in3_input, in, 3),
+	SENSOR_ATTR_RO(in4_input, in, 4),
+	SENSOR_ATTR_RO(in5_input, in, 5),
+	SENSOR_ATTR_RO(in6_input, in, 6),
+	SENSOR_ATTR_RO(in7_input, in, 7),
 };
 
 /*
-- 
2.7.4
