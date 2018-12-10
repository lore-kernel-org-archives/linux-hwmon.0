Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33097 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729607AbeLJWJc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:32 -0500
Received: by mail-pf1-f195.google.com with SMTP id c123so6075242pfb.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:32 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 28/30] hwmon: (emc6w201) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:46 -0800
Message-Id: <1544479728-30077-29-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/emc6w201.c | 150 +++++++++++++++++++----------------------------
 1 file changed, 61 insertions(+), 89 deletions(-)

diff --git a/drivers/hwmon/emc6w201.c b/drivers/hwmon/emc6w201.c
index 4aee5adf9ef2..b4735e7e18f5 100644
--- a/drivers/hwmon/emc6w201.c
+++ b/drivers/hwmon/emc6w201.c
@@ -189,8 +189,8 @@ static struct emc6w201_data *emc6w201_update_device(struct device *dev)
 
 static const s16 nominal_mv[6] = { 2500, 1500, 3300, 5000, 1500, 1500 };
 
-static ssize_t show_in(struct device *dev, struct device_attribute *devattr,
-	char *buf)
+static ssize_t in_show(struct device *dev, struct device_attribute *devattr,
+		       char *buf)
 {
 	struct emc6w201_data *data = emc6w201_update_device(dev);
 	int sf = to_sensor_dev_attr_2(devattr)->index;
@@ -200,8 +200,8 @@ static ssize_t show_in(struct device *dev, struct device_attribute *devattr,
 		       (unsigned)data->in[sf][nr] * nominal_mv[nr] / 0xC0);
 }
 
-static ssize_t set_in(struct device *dev, struct device_attribute *devattr,
-		      const char *buf, size_t count)
+static ssize_t in_store(struct device *dev, struct device_attribute *devattr,
+			const char *buf, size_t count)
 {
 	struct emc6w201_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -228,8 +228,8 @@ static ssize_t set_in(struct device *dev, struct device_attribute *devattr,
 	return err < 0 ? err : count;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
-	char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	struct emc6w201_data *data = emc6w201_update_device(dev);
 	int sf = to_sensor_dev_attr_2(devattr)->index;
@@ -238,8 +238,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", (int)data->temp[sf][nr] * 1000);
 }
 
-static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct emc6w201_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -266,8 +267,8 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
 	return err < 0 ? err : count;
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
-	char *buf)
+static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
+			char *buf)
 {
 	struct emc6w201_data *data = emc6w201_update_device(dev);
 	int sf = to_sensor_dev_attr_2(devattr)->index;
@@ -282,8 +283,8 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%u\n", rpm);
 }
 
-static ssize_t set_fan(struct device *dev, struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static ssize_t fan_store(struct device *dev, struct device_attribute *devattr,
+			 const char *buf, size_t count)
 {
 	struct emc6w201_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -312,83 +313,54 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *devattr,
 	return err < 0 ? err : count;
 }
 
-static SENSOR_DEVICE_ATTR_2(in0_input, S_IRUGO, show_in, NULL, 0, input);
-static SENSOR_DEVICE_ATTR_2(in0_min, S_IRUGO | S_IWUSR, show_in, set_in,
-			    0, min);
-static SENSOR_DEVICE_ATTR_2(in0_max, S_IRUGO | S_IWUSR, show_in, set_in,
-			    0, max);
-static SENSOR_DEVICE_ATTR_2(in1_input, S_IRUGO, show_in, NULL, 1, input);
-static SENSOR_DEVICE_ATTR_2(in1_min, S_IRUGO | S_IWUSR, show_in, set_in,
-			    1, min);
-static SENSOR_DEVICE_ATTR_2(in1_max, S_IRUGO | S_IWUSR, show_in, set_in,
-			    1, max);
-static SENSOR_DEVICE_ATTR_2(in2_input, S_IRUGO, show_in, NULL, 2, input);
-static SENSOR_DEVICE_ATTR_2(in2_min, S_IRUGO | S_IWUSR, show_in, set_in,
-			    2, min);
-static SENSOR_DEVICE_ATTR_2(in2_max, S_IRUGO | S_IWUSR, show_in, set_in,
-			    2, max);
-static SENSOR_DEVICE_ATTR_2(in3_input, S_IRUGO, show_in, NULL, 3, input);
-static SENSOR_DEVICE_ATTR_2(in3_min, S_IRUGO | S_IWUSR, show_in, set_in,
-			    3, min);
-static SENSOR_DEVICE_ATTR_2(in3_max, S_IRUGO | S_IWUSR, show_in, set_in,
-			    3, max);
-static SENSOR_DEVICE_ATTR_2(in4_input, S_IRUGO, show_in, NULL, 4, input);
-static SENSOR_DEVICE_ATTR_2(in4_min, S_IRUGO | S_IWUSR, show_in, set_in,
-			    4, min);
-static SENSOR_DEVICE_ATTR_2(in4_max, S_IRUGO | S_IWUSR, show_in, set_in,
-			    4, max);
-static SENSOR_DEVICE_ATTR_2(in5_input, S_IRUGO, show_in, NULL, 5, input);
-static SENSOR_DEVICE_ATTR_2(in5_min, S_IRUGO | S_IWUSR, show_in, set_in,
-			    5, min);
-static SENSOR_DEVICE_ATTR_2(in5_max, S_IRUGO | S_IWUSR, show_in, set_in,
-			    5, max);
-
-static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp, NULL, 0, input);
-static SENSOR_DEVICE_ATTR_2(temp1_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    0, min);
-static SENSOR_DEVICE_ATTR_2(temp1_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    0, max);
-static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp, NULL, 1, input);
-static SENSOR_DEVICE_ATTR_2(temp2_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    1, min);
-static SENSOR_DEVICE_ATTR_2(temp2_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    1, max);
-static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp, NULL, 2, input);
-static SENSOR_DEVICE_ATTR_2(temp3_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    2, min);
-static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    2, max);
-static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, input);
-static SENSOR_DEVICE_ATTR_2(temp4_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    3, min);
-static SENSOR_DEVICE_ATTR_2(temp4_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    3, max);
-static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, input);
-static SENSOR_DEVICE_ATTR_2(temp5_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    4, min);
-static SENSOR_DEVICE_ATTR_2(temp5_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    4, max);
-static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, input);
-static SENSOR_DEVICE_ATTR_2(temp6_min, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    5, min);
-static SENSOR_DEVICE_ATTR_2(temp6_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
-			    5, max);
-
-static SENSOR_DEVICE_ATTR_2(fan1_input, S_IRUGO, show_fan, NULL, 0, input);
-static SENSOR_DEVICE_ATTR_2(fan1_min, S_IRUGO | S_IWUSR, show_fan, set_fan,
-			    0, min);
-static SENSOR_DEVICE_ATTR_2(fan2_input, S_IRUGO, show_fan, NULL, 1, input);
-static SENSOR_DEVICE_ATTR_2(fan2_min, S_IRUGO | S_IWUSR, show_fan, set_fan,
-			    1, min);
-static SENSOR_DEVICE_ATTR_2(fan3_input, S_IRUGO, show_fan, NULL, 2, input);
-static SENSOR_DEVICE_ATTR_2(fan3_min, S_IRUGO | S_IWUSR, show_fan, set_fan,
-			    2, min);
-static SENSOR_DEVICE_ATTR_2(fan4_input, S_IRUGO, show_fan, NULL, 3, input);
-static SENSOR_DEVICE_ATTR_2(fan4_min, S_IRUGO | S_IWUSR, show_fan, set_fan,
-			    3, min);
-static SENSOR_DEVICE_ATTR_2(fan5_input, S_IRUGO, show_fan, NULL, 4, input);
-static SENSOR_DEVICE_ATTR_2(fan5_min, S_IRUGO | S_IWUSR, show_fan, set_fan,
-			    4, min);
+static SENSOR_DEVICE_ATTR_2_RO(in0_input, in, 0, input);
+static SENSOR_DEVICE_ATTR_2_RW(in0_min, in, 0, min);
+static SENSOR_DEVICE_ATTR_2_RW(in0_max, in, 0, max);
+static SENSOR_DEVICE_ATTR_2_RO(in1_input, in, 1, input);
+static SENSOR_DEVICE_ATTR_2_RW(in1_min, in, 1, min);
+static SENSOR_DEVICE_ATTR_2_RW(in1_max, in, 1, max);
+static SENSOR_DEVICE_ATTR_2_RO(in2_input, in, 2, input);
+static SENSOR_DEVICE_ATTR_2_RW(in2_min, in, 2, min);
+static SENSOR_DEVICE_ATTR_2_RW(in2_max, in, 2, max);
+static SENSOR_DEVICE_ATTR_2_RO(in3_input, in, 3, input);
+static SENSOR_DEVICE_ATTR_2_RW(in3_min, in, 3, min);
+static SENSOR_DEVICE_ATTR_2_RW(in3_max, in, 3, max);
+static SENSOR_DEVICE_ATTR_2_RO(in4_input, in, 4, input);
+static SENSOR_DEVICE_ATTR_2_RW(in4_min, in, 4, min);
+static SENSOR_DEVICE_ATTR_2_RW(in4_max, in, 4, max);
+static SENSOR_DEVICE_ATTR_2_RO(in5_input, in, 5, input);
+static SENSOR_DEVICE_ATTR_2_RW(in5_min, in, 5, min);
+static SENSOR_DEVICE_ATTR_2_RW(in5_max, in, 5, max);
+
+static SENSOR_DEVICE_ATTR_2_RO(temp1_input, temp, 0, input);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_min, temp, 0, min);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_max, temp, 0, max);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_input, temp, 1, input);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_min, temp, 1, min);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_max, temp, 1, max);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_input, temp, 2, input);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_min, temp, 2, min);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_max, temp, 2, max);
+static SENSOR_DEVICE_ATTR_2_RO(temp4_input, temp, 3, input);
+static SENSOR_DEVICE_ATTR_2_RW(temp4_min, temp, 3, min);
+static SENSOR_DEVICE_ATTR_2_RW(temp4_max, temp, 3, max);
+static SENSOR_DEVICE_ATTR_2_RO(temp5_input, temp, 4, input);
+static SENSOR_DEVICE_ATTR_2_RW(temp5_min, temp, 4, min);
+static SENSOR_DEVICE_ATTR_2_RW(temp5_max, temp, 4, max);
+static SENSOR_DEVICE_ATTR_2_RO(temp6_input, temp, 5, input);
+static SENSOR_DEVICE_ATTR_2_RW(temp6_min, temp, 5, min);
+static SENSOR_DEVICE_ATTR_2_RW(temp6_max, temp, 5, max);
+
+static SENSOR_DEVICE_ATTR_2_RO(fan1_input, fan, 0, input);
+static SENSOR_DEVICE_ATTR_2_RW(fan1_min, fan, 0, min);
+static SENSOR_DEVICE_ATTR_2_RO(fan2_input, fan, 1, input);
+static SENSOR_DEVICE_ATTR_2_RW(fan2_min, fan, 1, min);
+static SENSOR_DEVICE_ATTR_2_RO(fan3_input, fan, 2, input);
+static SENSOR_DEVICE_ATTR_2_RW(fan3_min, fan, 2, min);
+static SENSOR_DEVICE_ATTR_2_RO(fan4_input, fan, 3, input);
+static SENSOR_DEVICE_ATTR_2_RW(fan4_min, fan, 3, min);
+static SENSOR_DEVICE_ATTR_2_RO(fan5_input, fan, 4, input);
+static SENSOR_DEVICE_ATTR_2_RW(fan5_min, fan, 4, min);
 
 static struct attribute *emc6w201_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4
