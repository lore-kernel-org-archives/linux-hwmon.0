Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/13] hwmon: (lm95234) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:24 -0800
Message-Id: <1544124153-23961-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Auto-conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/blob/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95234.c | 161 ++++++++++++++++++++----------------------------
 1 file changed, 67 insertions(+), 94 deletions(-)

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index c7fcc9e7f57a..02cd48bdde8d 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -211,7 +211,7 @@ static int lm95234_update_device(struct lm95234_data *data)
 	return ret;
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
+static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
@@ -225,8 +225,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 		       DIV_ROUND_CLOSEST(data->temp[index] * 125, 32));
 }
 
-static ssize_t show_alarm(struct device *dev,
-			  struct device_attribute *attr, char *buf)
+static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	u32 mask = to_sensor_dev_attr(attr)->index;
@@ -238,7 +238,7 @@ static ssize_t show_alarm(struct device *dev,
 	return sprintf(buf, "%u", !!(data->status & mask));
 }
 
-static ssize_t show_type(struct device *dev, struct device_attribute *attr,
+static ssize_t type_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
@@ -251,8 +251,8 @@ static ssize_t show_type(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, data->sensor_type & mask ? "1\n" : "2\n");
 }
 
-static ssize_t set_type(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t type_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -282,7 +282,7 @@ static ssize_t set_type(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_tcrit2(struct device *dev, struct device_attribute *attr,
+static ssize_t tcrit2_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
@@ -295,8 +295,8 @@ static ssize_t show_tcrit2(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u", data->tcrit2[index] * 1000);
 }
 
-static ssize_t set_tcrit2(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
@@ -320,7 +320,7 @@ static ssize_t set_tcrit2(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_tcrit2_hyst(struct device *dev,
+static ssize_t tcrit2_hyst_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
@@ -335,7 +335,7 @@ static ssize_t show_tcrit2_hyst(struct device *dev,
 		       ((int)data->tcrit2[index] - (int)data->thyst) * 1000);
 }
 
-static ssize_t show_tcrit1(struct device *dev, struct device_attribute *attr,
+static ssize_t tcrit1_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
@@ -344,8 +344,8 @@ static ssize_t show_tcrit1(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u", data->tcrit1[index] * 1000);
 }
 
-static ssize_t set_tcrit1(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
@@ -369,7 +369,7 @@ static ssize_t set_tcrit1(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_tcrit1_hyst(struct device *dev,
+static ssize_t tcrit1_hyst_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
@@ -384,9 +384,9 @@ static ssize_t show_tcrit1_hyst(struct device *dev,
 		       ((int)data->tcrit1[index] - (int)data->thyst) * 1000);
 }
 
-static ssize_t set_tcrit1_hyst(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static ssize_t tcrit1_hyst_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
@@ -411,7 +411,7 @@ static ssize_t set_tcrit1_hyst(struct device *dev,
 	return count;
 }
 
-static ssize_t show_offset(struct device *dev, struct device_attribute *attr,
+static ssize_t offset_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
@@ -424,8 +424,8 @@ static ssize_t show_offset(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d", data->toffset[index] * 500);
 }
 
-static ssize_t set_offset(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t offset_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	struct lm95234_data *data = dev_get_drvdata(dev);
 	int index = to_sensor_dev_attr(attr)->index;
@@ -492,80 +492,53 @@ static ssize_t update_interval_store(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4);
-
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL,
-			  BIT(0) | BIT(1));
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL,
-			  BIT(2) | BIT(3));
-static SENSOR_DEVICE_ATTR(temp4_fault, S_IRUGO, show_alarm, NULL,
-			  BIT(4) | BIT(5));
-static SENSOR_DEVICE_ATTR(temp5_fault, S_IRUGO, show_alarm, NULL,
-			  BIT(6) | BIT(7));
-
-static SENSOR_DEVICE_ATTR(temp2_type, S_IWUSR | S_IRUGO, show_type, set_type,
-			  BIT(1));
-static SENSOR_DEVICE_ATTR(temp3_type, S_IWUSR | S_IRUGO, show_type, set_type,
-			  BIT(2));
-static SENSOR_DEVICE_ATTR(temp4_type, S_IWUSR | S_IRUGO, show_type, set_type,
-			  BIT(3));
-static SENSOR_DEVICE_ATTR(temp5_type, S_IWUSR | S_IRUGO, show_type, set_type,
-			  BIT(4));
-
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_tcrit1,
-			  set_tcrit1, 0);
-static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_tcrit2,
-			  set_tcrit2, 0);
-static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO, show_tcrit2,
-			  set_tcrit2, 1);
-static SENSOR_DEVICE_ATTR(temp4_max, S_IWUSR | S_IRUGO, show_tcrit1,
-			  set_tcrit1, 3);
-static SENSOR_DEVICE_ATTR(temp5_max, S_IWUSR | S_IRUGO, show_tcrit1,
-			  set_tcrit1, 4);
-
-static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO, show_tcrit1_hyst,
-			  set_tcrit1_hyst, 0);
-static SENSOR_DEVICE_ATTR(temp2_max_hyst, S_IRUGO, show_tcrit2_hyst, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp3_max_hyst, S_IRUGO, show_tcrit2_hyst, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp4_max_hyst, S_IRUGO, show_tcrit1_hyst, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp5_max_hyst, S_IRUGO, show_tcrit1_hyst, NULL, 4);
-
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL,
-			  BIT(0 + 8));
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL,
-			  BIT(1 + 16));
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO, show_alarm, NULL,
-			  BIT(2 + 16));
-static SENSOR_DEVICE_ATTR(temp4_max_alarm, S_IRUGO, show_alarm, NULL,
-			  BIT(3 + 8));
-static SENSOR_DEVICE_ATTR(temp5_max_alarm, S_IRUGO, show_alarm, NULL,
-			  BIT(4 + 8));
-
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IWUSR | S_IRUGO, show_tcrit1,
-			  set_tcrit1, 1);
-static SENSOR_DEVICE_ATTR(temp3_crit, S_IWUSR | S_IRUGO, show_tcrit1,
-			  set_tcrit1, 2);
-
-static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IRUGO, show_tcrit1_hyst, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_crit_hyst, S_IRUGO, show_tcrit1_hyst, NULL, 2);
-
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL,
-			  BIT(1 + 8));
-static SENSOR_DEVICE_ATTR(temp3_crit_alarm, S_IRUGO, show_alarm, NULL,
-			  BIT(2 + 8));
-
-static SENSOR_DEVICE_ATTR(temp2_offset, S_IWUSR | S_IRUGO, show_offset,
-			  set_offset, 0);
-static SENSOR_DEVICE_ATTR(temp3_offset, S_IWUSR | S_IRUGO, show_offset,
-			  set_offset, 1);
-static SENSOR_DEVICE_ATTR(temp4_offset, S_IWUSR | S_IRUGO, show_offset,
-			  set_offset, 2);
-static SENSOR_DEVICE_ATTR(temp5_offset, S_IWUSR | S_IRUGO, show_offset,
-			  set_offset, 3);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
+static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
+
+static SENSOR_DEVICE_ATTR_RO(temp2_fault, alarm, BIT(0) | BIT(1));
+static SENSOR_DEVICE_ATTR_RO(temp3_fault, alarm, BIT(2) | BIT(3));
+static SENSOR_DEVICE_ATTR_RO(temp4_fault, alarm, BIT(4) | BIT(5));
+static SENSOR_DEVICE_ATTR_RO(temp5_fault, alarm, BIT(6) | BIT(7));
+
+static SENSOR_DEVICE_ATTR_RW(temp2_type, type, BIT(1));
+static SENSOR_DEVICE_ATTR_RW(temp3_type, type, BIT(2));
+static SENSOR_DEVICE_ATTR_RW(temp4_type, type, BIT(3));
+static SENSOR_DEVICE_ATTR_RW(temp5_type, type, BIT(4));
+
+static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0);
+static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0);
+static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1);
+static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3);
+static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4);
+
+static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, tcrit1_hyst, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_max_hyst, tcrit2_hyst, 0);
+static SENSOR_DEVICE_ATTR_RO(temp3_max_hyst, tcrit2_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp4_max_hyst, tcrit1_hyst, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_max_hyst, tcrit1_hyst, 4);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, BIT(0 + 8));
+static SENSOR_DEVICE_ATTR_RO(temp2_max_alarm, alarm, BIT(1 + 16));
+static SENSOR_DEVICE_ATTR_RO(temp3_max_alarm, alarm, BIT(2 + 16));
+static SENSOR_DEVICE_ATTR_RO(temp4_max_alarm, alarm, BIT(3 + 8));
+static SENSOR_DEVICE_ATTR_RO(temp5_max_alarm, alarm, BIT(4 + 8));
+
+static SENSOR_DEVICE_ATTR_RW(temp2_crit, tcrit1, 1);
+static SENSOR_DEVICE_ATTR_RW(temp3_crit, tcrit1, 2);
+
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_hyst, tcrit1_hyst, 1);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit_hyst, tcrit1_hyst, 2);
+
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, alarm, BIT(1 + 8));
+static SENSOR_DEVICE_ATTR_RO(temp3_crit_alarm, alarm, BIT(2 + 8));
+
+static SENSOR_DEVICE_ATTR_RW(temp2_offset, offset, 0);
+static SENSOR_DEVICE_ATTR_RW(temp3_offset, offset, 1);
+static SENSOR_DEVICE_ATTR_RW(temp4_offset, offset, 2);
+static SENSOR_DEVICE_ATTR_RW(temp5_offset, offset, 3);
 
 static DEVICE_ATTR_RW(update_interval);
 
-- 
2.7.4
