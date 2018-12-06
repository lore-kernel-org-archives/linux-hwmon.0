Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/13] hwmon: (tmp401) Auto-convert to use SENSOR_DEVICE_ATTR_{RO, RW, WO}
Date: Thu,  6 Dec 2018 11:22:31 -0800
Message-Id: <1544124153-23961-12-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
References: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Conversion was done done using the coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp401.c | 126 ++++++++++++++++++++++---------------------------
 1 file changed, 57 insertions(+), 69 deletions(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 1f2d13dc9439..ff66cf1bfb2e 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -288,8 +288,8 @@ static struct tmp401_data *tmp401_update_device(struct device *dev)
 	return ret;
 }
 
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	int nr = to_sensor_dev_attr_2(devattr)->nr;
 	int index = to_sensor_dev_attr_2(devattr)->index;
@@ -302,8 +302,9 @@ static ssize_t show_temp(struct device *dev,
 		tmp401_register_to_temp(data->temp[nr][index], data->config));
 }
 
-static ssize_t show_temp_crit_hyst(struct device *dev,
-	struct device_attribute *devattr, char *buf)
+static ssize_t temp_crit_hyst_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	int temp, index = to_sensor_dev_attr(devattr)->index;
 	struct tmp401_data *data = tmp401_update_device(dev);
@@ -319,8 +320,8 @@ static ssize_t show_temp_crit_hyst(struct device *dev,
 	return sprintf(buf, "%d\n", temp);
 }
 
-static ssize_t show_status(struct device *dev,
-	struct device_attribute *devattr, char *buf)
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *devattr, char *buf)
 {
 	int nr = to_sensor_dev_attr_2(devattr)->nr;
 	int mask = to_sensor_dev_attr_2(devattr)->index;
@@ -332,8 +333,9 @@ static ssize_t show_status(struct device *dev,
 	return sprintf(buf, "%d\n", !!(data->status[nr] & mask));
 }
 
-static ssize_t store_temp(struct device *dev, struct device_attribute *devattr,
-			  const char *buf, size_t count)
+static ssize_t temp_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	int nr = to_sensor_dev_attr_2(devattr)->nr;
 	int index = to_sensor_dev_attr_2(devattr)->index;
@@ -365,8 +367,9 @@ static ssize_t store_temp(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t store_temp_crit_hyst(struct device *dev, struct device_attribute
-	*devattr, const char *buf, size_t count)
+static ssize_t temp_crit_hyst_store(struct device *dev,
+				    struct device_attribute *devattr,
+				    const char *buf, size_t count)
 {
 	int temp, index = to_sensor_dev_attr(devattr)->index;
 	struct tmp401_data *data = tmp401_update_device(dev);
@@ -404,8 +407,9 @@ static ssize_t store_temp_crit_hyst(struct device *dev, struct device_attribute
  * This is done by writing any value to any of the minimum/maximum registers
  * (0x30-0x37).
  */
-static ssize_t reset_temp_history(struct device *dev,
-	struct device_attribute	*devattr, const char *buf, size_t count)
+static ssize_t reset_temp_history_store(struct device *dev,
+					struct device_attribute *devattr,
+					const char *buf, size_t count)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -467,38 +471,29 @@ static ssize_t update_interval_store(struct device *dev,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp, NULL, 0, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_min, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 1, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_max, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 2, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_crit, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 3, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO,
-			  show_temp_crit_hyst, store_temp_crit_hyst, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_min_alarm, S_IRUGO, show_status, NULL,
-			    1, TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2(temp1_max_alarm, S_IRUGO, show_status, NULL,
-			    2, TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2(temp1_crit_alarm, S_IRUGO, show_status, NULL,
-			    3, TMP432_STATUS_LOCAL);
-static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp, NULL, 0, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_min, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 1, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_max, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 2, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_crit, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 3, 1);
-static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IRUGO, show_temp_crit_hyst,
-			  NULL, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_fault, S_IRUGO, show_status, NULL,
-			    0, TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2(temp2_min_alarm, S_IRUGO, show_status, NULL,
-			    1, TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2(temp2_max_alarm, S_IRUGO, show_status, NULL,
-			    2, TMP432_STATUS_REMOTE1);
-static SENSOR_DEVICE_ATTR_2(temp2_crit_alarm, S_IRUGO, show_status, NULL,
-			    3, TMP432_STATUS_REMOTE1);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_input, temp, 0, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_min, temp, 1, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_max, temp, 2, 0);
+static SENSOR_DEVICE_ATTR_2_RW(temp1_crit, temp, 3, 0);
+static SENSOR_DEVICE_ATTR_RW(temp1_crit_hyst, temp_crit_hyst, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_min_alarm, status, 1,
+			       TMP432_STATUS_LOCAL);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_max_alarm, status, 2,
+			       TMP432_STATUS_LOCAL);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_crit_alarm, status, 3,
+			       TMP432_STATUS_LOCAL);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_input, temp, 0, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_min, temp, 1, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_max, temp, 2, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_crit, temp, 3, 1);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_hyst, temp_crit_hyst, 1);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_fault, status, 0, TMP432_STATUS_REMOTE1);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_min_alarm, status, 1,
+			       TMP432_STATUS_REMOTE1);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_max_alarm, status, 2,
+			       TMP432_STATUS_REMOTE1);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_crit_alarm, status, 3,
+			       TMP432_STATUS_REMOTE1);
 
 static DEVICE_ATTR_RW(update_interval);
 
@@ -538,12 +533,11 @@ static const struct attribute_group tmp401_group = {
  * minimum and maximum register reset for both the local
  * and remote channels.
  */
-static SENSOR_DEVICE_ATTR_2(temp1_lowest, S_IRUGO, show_temp, NULL, 4, 0);
-static SENSOR_DEVICE_ATTR_2(temp1_highest, S_IRUGO, show_temp, NULL, 5, 0);
-static SENSOR_DEVICE_ATTR_2(temp2_lowest, S_IRUGO, show_temp, NULL, 4, 1);
-static SENSOR_DEVICE_ATTR_2(temp2_highest, S_IRUGO, show_temp, NULL, 5, 1);
-static SENSOR_DEVICE_ATTR(temp_reset_history, S_IWUSR, NULL, reset_temp_history,
-			  0);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_lowest, temp, 4, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp1_highest, temp, 5, 0);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_lowest, temp, 4, 1);
+static SENSOR_DEVICE_ATTR_2_RO(temp2_highest, temp, 5, 1);
+static SENSOR_DEVICE_ATTR_WO(temp_reset_history, reset_temp_history, 0);
 
 static struct attribute *tmp411_attributes[] = {
 	&sensor_dev_attr_temp1_highest.dev_attr.attr,
@@ -558,23 +552,18 @@ static const struct attribute_group tmp411_group = {
 	.attrs = tmp411_attributes,
 };
 
-static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp, NULL, 0, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_min, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 1, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_max, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 2, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_crit, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 3, 2);
-static SENSOR_DEVICE_ATTR(temp3_crit_hyst, S_IRUGO, show_temp_crit_hyst,
-			  NULL, 2);
-static SENSOR_DEVICE_ATTR_2(temp3_fault, S_IRUGO, show_status, NULL,
-			    0, TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2(temp3_min_alarm, S_IRUGO, show_status, NULL,
-			    1, TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2(temp3_max_alarm, S_IRUGO, show_status, NULL,
-			    2, TMP432_STATUS_REMOTE2);
-static SENSOR_DEVICE_ATTR_2(temp3_crit_alarm, S_IRUGO, show_status, NULL,
-			    3, TMP432_STATUS_REMOTE2);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_input, temp, 0, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_min, temp, 1, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_max, temp, 2, 2);
+static SENSOR_DEVICE_ATTR_2_RW(temp3_crit, temp, 3, 2);
+static SENSOR_DEVICE_ATTR_RO(temp3_crit_hyst, temp_crit_hyst, 2);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_fault, status, 0, TMP432_STATUS_REMOTE2);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_min_alarm, status, 1,
+			       TMP432_STATUS_REMOTE2);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_max_alarm, status, 2,
+			       TMP432_STATUS_REMOTE2);
+static SENSOR_DEVICE_ATTR_2_RO(temp3_crit_alarm, status, 3,
+			       TMP432_STATUS_REMOTE2);
 
 static struct attribute *tmp432_attributes[] = {
 	&sensor_dev_attr_temp3_input.dev_attr.attr,
@@ -598,8 +587,7 @@ static const struct attribute_group tmp432_group = {
  * Additional features of the TMP461 chip.
  * The TMP461 temperature offset for the remote channel.
  */
-static SENSOR_DEVICE_ATTR_2(temp2_offset, S_IWUSR | S_IRUGO, show_temp,
-			    store_temp, 6, 1);
+static SENSOR_DEVICE_ATTR_2_RW(temp2_offset, temp, 6, 1);
 
 static struct attribute *tmp461_attributes[] = {
 	&sensor_dev_attr_temp2_offset.dev_attr.attr,
-- 
2.7.4
