Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/10] hwmon: (w83791d) Replace function macros with explicit code
Date: Tue, 27 Dec 2016 15:28:26 -0800
Message-Id: <1482881308-13550-9-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Replace function macros with explicit code to to reduce code obfuscation
and to simplify auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW} and
SENSOR_ATTR_{RO,RW}.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83791d.c | 140 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 93 insertions(+), 47 deletions(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 8af6081b4ab4..9a9d89697672 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -363,44 +363,82 @@ static struct i2c_driver w83791d_driver = {
 };
 
 /* following are the sysfs callback functions */
-#define show_in_reg(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-			char *buf) \
-{ \
-	struct sensor_device_attribute *sensor_attr = \
-						to_sensor_dev_attr(attr); \
-	struct w83791d_data *data = w83791d_update_device(dev); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", IN_FROM_REG(data->reg[nr])); \
+
+static ssize_t show_in(struct device *dev, struct device_attribute *attr,
+		       char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct w83791d_data *data = w83791d_update_device(dev);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[nr]));
+}
+
+static ssize_t show_in_min(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct w83791d_data *data = w83791d_update_device(dev);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[nr]));
+}
+
+static ssize_t show_in_max(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct w83791d_data *data = w83791d_update_device(dev);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[nr]));
+}
+
+static ssize_t store_in_min(struct device *dev,
+			    struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sensor_attr =
+						to_sensor_dev_attr(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct w83791d_data *data = i2c_get_clientdata(client);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
+	mutex_lock(&data->update_lock);
+	data->in_min[nr] = IN_TO_REG(val);
+	w83791d_write(client, W83791D_REG_IN_MIN[nr], data->in_min[nr]);
+	mutex_unlock(&data->update_lock);
+
+	return count;
 }
 
-show_in_reg(in);
-show_in_reg(in_min);
-show_in_reg(in_max);
-
-#define store_in_reg(REG, reg) \
-static ssize_t store_in_##reg(struct device *dev, \
-				struct device_attribute *attr, \
-				const char *buf, size_t count) \
-{ \
-	struct sensor_device_attribute *sensor_attr = \
-						to_sensor_dev_attr(attr); \
-	struct i2c_client *client = to_i2c_client(dev); \
-	struct w83791d_data *data = i2c_get_clientdata(client); \
-	int nr = sensor_attr->index; \
-	unsigned long val; \
-	int err = kstrtoul(buf, 10, &val); \
-	if (err) \
-		return err; \
-	mutex_lock(&data->update_lock); \
-	data->in_##reg[nr] = IN_TO_REG(val); \
-	w83791d_write(client, W83791D_REG_IN_##REG[nr], data->in_##reg[nr]); \
-	mutex_unlock(&data->update_lock); \
-	 \
-	return count; \
+static ssize_t store_in_max(struct device *dev,
+			    struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sensor_attr =
+						to_sensor_dev_attr(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct w83791d_data *data = i2c_get_clientdata(client);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
+	mutex_lock(&data->update_lock);
+	data->in_max[nr] = IN_TO_REG(val);
+	w83791d_write(client, W83791D_REG_IN_MAX[nr], data->in_max[nr]);
+	mutex_unlock(&data->update_lock);
+
+	return count;
 }
-store_in_reg(MIN, min);
-store_in_reg(MAX, max);
 
 static struct sensor_device_attribute sda_in_input[] = {
 	SENSOR_ATTR(in0_input, S_IRUGO, show_in, NULL, 0),
@@ -529,20 +567,28 @@ static struct sensor_device_attribute sda_in_alarm[] = {
 	SENSOR_ATTR(in9_alarm, S_IRUGO, show_alarm, NULL, 14),
 };
 
-#define show_fan_reg(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-				char *buf) \
-{ \
-	struct sensor_device_attribute *sensor_attr = \
-						to_sensor_dev_attr(attr); \
-	struct w83791d_data *data = w83791d_update_device(dev); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", \
-		FAN_FROM_REG(data->reg[nr], DIV_FROM_REG(data->fan_div[nr]))); \
+static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct w83791d_data *data = w83791d_update_device(dev);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n",
+		FAN_FROM_REG(data->fan[nr], DIV_FROM_REG(data->fan_div[nr])));
 }
 
-show_fan_reg(fan);
-show_fan_reg(fan_min);
+static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct w83791d_data *data = w83791d_update_device(dev);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n",
+		FAN_FROM_REG(data->fan_min[nr],
+			     DIV_FROM_REG(data->fan_div[nr])));
+}
 
 static ssize_t store_fan_min(struct device *dev, struct device_attribute *attr,
 				const char *buf, size_t count)
-- 
2.7.4
