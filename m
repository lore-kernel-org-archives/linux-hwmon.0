Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41450 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbeLJWJH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:07 -0500
Received: by mail-pf1-f196.google.com with SMTP id b7so6054968pfi.8
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:06 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/30] hwmon: (ads7828) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:28 -0800
Message-Id: <1544479728-30077-11-git-send-email-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ads7828.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 898607bf682b..12c56d3783ed 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -62,8 +62,8 @@ static inline u8 ads7828_cmd_byte(u8 cmd, int ch)
 }
 
 /* sysfs callback function */
-static ssize_t ads7828_show_in(struct device *dev, struct device_attribute *da,
-			       char *buf)
+static ssize_t ads7828_in_show(struct device *dev,
+			       struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct ads7828_data *data = dev_get_drvdata(dev);
@@ -79,14 +79,14 @@ static ssize_t ads7828_show_in(struct device *dev, struct device_attribute *da,
 		       DIV_ROUND_CLOSEST(regval * data->lsb_resol, 1000));
 }
 
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, ads7828_show_in, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, ads7828_show_in, NULL, 1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, ads7828_show_in, NULL, 2);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, ads7828_show_in, NULL, 3);
-static SENSOR_DEVICE_ATTR(in4_input, S_IRUGO, ads7828_show_in, NULL, 4);
-static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, ads7828_show_in, NULL, 5);
-static SENSOR_DEVICE_ATTR(in6_input, S_IRUGO, ads7828_show_in, NULL, 6);
-static SENSOR_DEVICE_ATTR(in7_input, S_IRUGO, ads7828_show_in, NULL, 7);
+static SENSOR_DEVICE_ATTR_RO(in0_input, ads7828_in, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_input, ads7828_in, 1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, ads7828_in, 2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, ads7828_in, 3);
+static SENSOR_DEVICE_ATTR_RO(in4_input, ads7828_in, 4);
+static SENSOR_DEVICE_ATTR_RO(in5_input, ads7828_in, 5);
+static SENSOR_DEVICE_ATTR_RO(in6_input, ads7828_in, 6);
+static SENSOR_DEVICE_ATTR_RO(in7_input, ads7828_in, 7);
 
 static struct attribute *ads7828_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4
