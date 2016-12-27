Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/10] hwmon: (w83l786ng) Replace function macros with explicit code
Date: Tue, 27 Dec 2016 15:28:25 -0800
Message-Id: <1482881308-13550-8-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Replace function macros with explicit code to to reduce code obfuscation
and to simplify auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW} and
SENSOR_ATTR_{RO,RW}.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83l786ng.c | 158 ++++++++++++++++++++++++++++++----------------
 1 file changed, 105 insertions(+), 53 deletions(-)

diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
index 330299613d38..cc3845358544 100644
--- a/drivers/hwmon/w83l786ng.c
+++ b/drivers/hwmon/w83l786ng.c
@@ -231,43 +231,72 @@ static struct w83l786ng_data *w83l786ng_update_device(struct device *dev)
 	return data;
 }
 
-/* following are the sysfs callback functions */
-#define show_in_reg(reg) \
-static ssize_t \
-show_##reg(struct device *dev, struct device_attribute *attr, \
-	   char *buf) \
-{ \
-	int nr = to_sensor_dev_attr(attr)->index; \
-	struct w83l786ng_data *data = w83l786ng_update_device(dev); \
-	return sprintf(buf, "%d\n", IN_FROM_REG(data->reg[nr])); \
+static ssize_t
+show_in(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+
+	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[nr]));
+}
+
+static ssize_t
+show_in_min(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+
+	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[nr]));
+}
+
+static ssize_t
+show_in_max(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+
+	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[nr]));
 }
 
-show_in_reg(in)
-show_in_reg(in_min)
-show_in_reg(in_max)
-
-#define store_in_reg(REG, reg) \
-static ssize_t \
-store_in_##reg(struct device *dev, struct device_attribute *attr, \
-	       const char *buf, size_t count) \
-{ \
-	int nr = to_sensor_dev_attr(attr)->index; \
-	struct w83l786ng_data *data = dev_get_drvdata(dev); \
-	struct i2c_client *client = data->client; \
-	unsigned long val; \
-	int err = kstrtoul(buf, 10, &val); \
-	if (err) \
-		return err; \
-	mutex_lock(&data->update_lock); \
-	data->in_##reg[nr] = IN_TO_REG(val); \
-	w83l786ng_write_value(client, W83L786NG_REG_IN_##REG(nr), \
-			      data->in_##reg[nr]); \
-	mutex_unlock(&data->update_lock); \
-	return count; \
+static ssize_t
+store_in_min(struct device *dev, struct device_attribute *attr, const char *buf,
+	     size_t count)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct w83l786ng_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	unsigned long val;
+	int err = kstrtoul(buf, 10, &val);
+
+	if (err)
+		return err;
+	mutex_lock(&data->update_lock);
+	data->in_min[nr] = IN_TO_REG(val);
+	w83l786ng_write_value(client, W83L786NG_REG_IN_MIN(nr),
+			      data->in_min[nr]);
+	mutex_unlock(&data->update_lock);
+	return count;
 }
 
-store_in_reg(MIN, min)
-store_in_reg(MAX, max)
+static ssize_t
+store_in_max(struct device *dev, struct device_attribute *attr, const char *buf,
+	     size_t count)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct w83l786ng_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	unsigned long val;
+	int err = kstrtoul(buf, 10, &val);
+
+	if (err)
+		return err;
+	mutex_lock(&data->update_lock);
+	data->in_max[nr] = IN_TO_REG(val);
+	w83l786ng_write_value(client, W83L786NG_REG_IN_MAX(nr),
+			      data->in_max[nr]);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
 
 static struct sensor_device_attribute sda_in_input[] = {
 	SENSOR_ATTR(in0_input, S_IRUGO, show_in, NULL, 0),
@@ -287,18 +316,27 @@ static struct sensor_device_attribute sda_in_max[] = {
 	SENSOR_ATTR(in2_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 2),
 };
 
-#define show_fan_reg(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-			  char *buf) \
-{ \
-	int nr = to_sensor_dev_attr(attr)->index; \
-	struct w83l786ng_data *data = w83l786ng_update_device(dev); \
-	return sprintf(buf, "%d\n", \
-		FAN_FROM_REG(data->reg[nr], DIV_FROM_REG(data->fan_div[nr]))); \
+static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+
+	return sprintf(buf, "%d\n",
+		       FAN_FROM_REG(data->fan[nr],
+				    DIV_FROM_REG(data->fan_div[nr])));
 }
 
-show_fan_reg(fan);
-show_fan_reg(fan_min);
+static ssize_t show_fan_min(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+
+	return sprintf(buf, "%d\n",
+		       FAN_FROM_REG(data->fan_min[nr],
+				    DIV_FROM_REG(data->fan_div[nr])));
+}
 
 static ssize_t
 store_fan_min(struct device *dev, struct device_attribute *attr,
@@ -471,18 +509,32 @@ static struct sensor_device_attribute_2 sda_temp_max_hyst[] = {
 		      show_temp, store_temp, 1, 2),
 };
 
-#define show_pwm_reg(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-			  char *buf) \
-{ \
-	struct w83l786ng_data *data = w83l786ng_update_device(dev); \
-	int nr = to_sensor_dev_attr(attr)->index; \
-	return sprintf(buf, "%d\n", data->reg[nr]); \
+static ssize_t show_pwm_mode(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+	int nr = to_sensor_dev_attr(attr)->index;
+
+	return sprintf(buf, "%d\n", data->pwm_mode[nr]);
 }
 
-show_pwm_reg(pwm_mode)
-show_pwm_reg(pwm_enable)
-show_pwm_reg(pwm)
+static ssize_t show_pwm_enable(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+	int nr = to_sensor_dev_attr(attr)->index;
+
+	return sprintf(buf, "%d\n", data->pwm_enable[nr]);
+}
+
+static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct w83l786ng_data *data = w83l786ng_update_device(dev);
+	int nr = to_sensor_dev_attr(attr)->index;
+
+	return sprintf(buf, "%d\n", data->pwm[nr]);
+}
 
 static ssize_t
 store_pwm_mode(struct device *dev, struct device_attribute *attr,
-- 
2.7.4
