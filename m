Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/10] hwmon: (w83627ehf) Replace function macros with explicit code
Date: Tue, 27 Dec 2016 15:28:27 -0800
Message-Id: <1482881308-13550-10-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
References: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Replace function macros with explicit code to to reduce code obfuscation
and to simplify auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW} and
SENSOR_ATTR_{RO,RW}.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83627ehf.c | 534 +++++++++++++++++++++++++++++++---------------
 1 file changed, 363 insertions(+), 171 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index ab346ed142de..94820051f9e4 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -933,46 +933,83 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 /*
  * Sysfs callback functions
  */
-#define show_in_reg(reg) \
-static ssize_t \
-show_##reg(struct device *dev, struct device_attribute *attr, \
-	   char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%ld\n", in_from_reg(data->reg[nr], nr, \
-		       data->scale_in)); \
-}
-show_in_reg(in)
-show_in_reg(in_min)
-show_in_reg(in_max)
-
-#define store_in_reg(REG, reg) \
-static ssize_t \
-store_in_##reg(struct device *dev, struct device_attribute *attr, \
-	       const char *buf, size_t count) \
-{ \
-	struct w83627ehf_data *data = dev_get_drvdata(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	unsigned long val; \
-	int err; \
-	err = kstrtoul(buf, 10, &val); \
-	if (err < 0) \
-		return err; \
-	mutex_lock(&data->update_lock); \
-	data->in_##reg[nr] = in_to_reg(val, nr, data->scale_in); \
-	w83627ehf_write_value(data, W83627EHF_REG_IN_##REG(nr), \
-			      data->in_##reg[nr]); \
-	mutex_unlock(&data->update_lock); \
-	return count; \
-}
-
-store_in_reg(MIN, min)
-store_in_reg(MAX, max)
+
+static ssize_t
+show_in(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%ld\n",
+		       in_from_reg(data->in[nr], nr, data->scale_in));
+}
+
+static ssize_t
+show_in_min(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%ld\n",
+		       in_from_reg(data->in_min[nr], nr, data->scale_in));
+}
+
+static ssize_t
+show_in_max(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%ld\n",
+		       in_from_reg(data->in_max[nr], nr, data->scale_in));
+}
+
+static ssize_t
+store_in_min(struct device *dev, struct device_attribute *attr,
+	     const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&data->update_lock);
+	data->in_min[nr] = in_to_reg(val, nr, data->scale_in);
+	w83627ehf_write_value(data, W83627EHF_REG_IN_MIN(nr), data->in_min[nr]);
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+static ssize_t
+store_in_max(struct device *dev, struct device_attribute *attr,
+	     const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&data->update_lock);
+	data->in_max[nr] = in_to_reg(val, nr, data->scale_in);
+	w83627ehf_write_value(data, W83627EHF_REG_IN_MAX(nr), data->in_max[nr]);
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -1204,43 +1241,81 @@ show_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
 	return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
 }
 
-#define show_temp_reg(addr, reg) \
-static ssize_t \
-show_##reg(struct device *dev, struct device_attribute *attr, \
-	   char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->reg[nr])); \
-}
-show_temp_reg(reg_temp, temp);
-show_temp_reg(reg_temp_over, temp_max);
-show_temp_reg(reg_temp_hyst, temp_max_hyst);
-
-#define store_temp_reg(addr, reg) \
-static ssize_t \
-store_##reg(struct device *dev, struct device_attribute *attr, \
-	    const char *buf, size_t count) \
-{ \
-	struct w83627ehf_data *data = dev_get_drvdata(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	int err; \
-	long val; \
-	err = kstrtol(buf, 10, &val); \
-	if (err < 0) \
-		return err; \
-	mutex_lock(&data->update_lock); \
-	data->reg[nr] = LM75_TEMP_TO_REG(val); \
-	w83627ehf_write_temp(data, data->addr[nr], data->reg[nr]); \
-	mutex_unlock(&data->update_lock); \
-	return count; \
-}
-store_temp_reg(reg_temp_over, temp_max);
-store_temp_reg(reg_temp_hyst, temp_max_hyst);
+static ssize_t
+show_temp(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->temp[nr]));
+}
+
+static ssize_t
+show_temp_max(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->temp_max[nr]));
+}
+
+static ssize_t
+show_temp_max_hyst(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n",
+		       LM75_TEMP_FROM_REG(data->temp_max_hyst[nr]));
+}
+
+static ssize_t
+store_temp_max(struct device *dev, struct device_attribute *attr,
+	       const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	int err;
+	long val;
+
+	err = kstrtol(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&data->update_lock);
+	data->temp_max[nr] = LM75_TEMP_TO_REG(val);
+	w83627ehf_write_temp(data, data->reg_temp_over[nr], data->temp_max[nr]);
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
+
+static ssize_t
+store_temp_max_hyst(struct device *dev, struct device_attribute *attr,
+		    const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	int err;
+	long val;
+
+	err = kstrtol(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&data->update_lock);
+	data->temp_max_hyst[nr] = LM75_TEMP_TO_REG(val);
+	w83627ehf_write_temp(data, data->reg_temp_hyst[nr],
+			     data->temp_max_hyst[nr]);
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
 
 static ssize_t
 show_temp_offset(struct device *dev, struct device_attribute *attr, char *buf)
@@ -1371,20 +1446,35 @@ static struct sensor_device_attribute sda_temp_offset[] = {
 		    store_temp_offset, 2),
 };
 
-#define show_pwm_reg(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-			  char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", data->reg[nr]); \
+static ssize_t show_pwm_mode(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->pwm_mode[nr]);
 }
 
-show_pwm_reg(pwm_mode)
-show_pwm_reg(pwm_enable)
-show_pwm_reg(pwm)
+static ssize_t show_pwm_enable(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->pwm_enable[nr]);
+}
+
+static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->pwm[nr]);
+}
 
 static ssize_t
 store_pwm_mode(struct device *dev, struct device_attribute *attr,
@@ -1485,19 +1575,25 @@ store_pwm_enable(struct device *dev, struct device_attribute *attr,
 }
 
 
-#define show_tol_temp(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-				char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", data->reg[nr] * 1000); \
+static ssize_t show_tolerance(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->tolerance[nr] * 1000);
 }
 
-show_tol_temp(tolerance)
-show_tol_temp(target_temp)
+static ssize_t show_target_temp(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->target_temp[nr] * 1000);
+}
 
 static ssize_t
 store_target_temp(struct device *dev, struct device_attribute *attr,
@@ -1615,77 +1711,173 @@ static struct sensor_device_attribute sda_tolerance[] = {
 
 /* Smart Fan registers */
 
-#define fan_functions(reg, REG) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-		       char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", data->reg[nr]); \
-} \
-static ssize_t \
-store_##reg(struct device *dev, struct device_attribute *attr, \
-			    const char *buf, size_t count) \
-{ \
-	struct w83627ehf_data *data = dev_get_drvdata(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	unsigned long val; \
-	int err; \
-	err = kstrtoul(buf, 10, &val); \
-	if (err < 0) \
-		return err; \
-	val = clamp_val(val, 1, 255); \
-	mutex_lock(&data->update_lock); \
-	data->reg[nr] = val; \
-	w83627ehf_write_value(data, data->REG_##REG[nr], val); \
-	mutex_unlock(&data->update_lock); \
-	return count; \
-}
-
-fan_functions(fan_start_output, FAN_START_OUTPUT)
-fan_functions(fan_stop_output, FAN_STOP_OUTPUT)
-fan_functions(fan_max_output, FAN_MAX_OUTPUT)
-fan_functions(fan_step_output, FAN_STEP_OUTPUT)
-
-#define fan_time_functions(reg, REG) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
-				char *buf) \
-{ \
-	struct w83627ehf_data *data = w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	return sprintf(buf, "%d\n", \
-			step_time_from_reg(data->reg[nr], \
-					   data->pwm_mode[nr])); \
-} \
-\
-static ssize_t \
-store_##reg(struct device *dev, struct device_attribute *attr, \
-			const char *buf, size_t count) \
-{ \
-	struct w83627ehf_data *data = dev_get_drvdata(dev); \
-	struct sensor_device_attribute *sensor_attr = \
-		to_sensor_dev_attr(attr); \
-	int nr = sensor_attr->index; \
-	unsigned long val; \
-	int err; \
-	err = kstrtoul(buf, 10, &val); \
-	if (err < 0) \
-		return err; \
-	val = step_time_to_reg(val, data->pwm_mode[nr]); \
-	mutex_lock(&data->update_lock); \
-	data->reg[nr] = val; \
-	w83627ehf_write_value(data, data->REG_##REG[nr], val); \
-	mutex_unlock(&data->update_lock); \
-	return count; \
-} \
-
-fan_time_functions(fan_stop_time, FAN_STOP_TIME)
+static ssize_t show_fan_start_output(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr =
+		to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->fan_start_output[nr]);
+}
+
+static ssize_t
+store_fan_start_output(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	val = clamp_val(val, 1, 255);
+	mutex_lock(&data->update_lock);
+	data->fan_start_output[nr] = val;
+	w83627ehf_write_value(data, data->REG_FAN_START_OUTPUT[nr], val);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
+static ssize_t show_fan_stop_output(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr =
+		to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->fan_stop_output[nr]);
+}
+
+static ssize_t
+store_fan_stop_output(struct device *dev, struct device_attribute *attr,
+		      const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	val = clamp_val(val, 1, 255);
+	mutex_lock(&data->update_lock);
+	data->fan_stop_output[nr] = val;
+	w83627ehf_write_value(data, data->REG_FAN_STOP_OUTPUT[nr], val);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
+static ssize_t show_fan_max_output(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr =
+		to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->fan_max_output[nr]);
+}
+
+static ssize_t
+store_fan_max_output(struct device *dev, struct device_attribute *attr,
+		      const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	val = clamp_val(val, 1, 255);
+	mutex_lock(&data->update_lock);
+	data->fan_max_output[nr] = val;
+	w83627ehf_write_value(data, data->REG_FAN_MAX_OUTPUT[nr], val);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
+static ssize_t show_fan_step_output(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr =
+		to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n", data->fan_step_output[nr]);
+}
+
+static ssize_t
+store_fan_step_output(struct device *dev, struct device_attribute *attr,
+		      const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	val = clamp_val(val, 1, 255);
+	mutex_lock(&data->update_lock);
+	data->fan_step_output[nr] = val;
+	w83627ehf_write_value(data, data->REG_FAN_STEP_OUTPUT[nr], val);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
+static ssize_t show_fan_stop_time(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct w83627ehf_data *data = w83627ehf_update_device(dev);
+	struct sensor_device_attribute *sensor_attr =
+		to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+
+	return sprintf(buf, "%d\n",
+		       step_time_from_reg(data->fan_stop_time[nr],
+					  data->pwm_mode[nr]));
+}
+
+static ssize_t
+store_fan_stop_time(struct device *dev, struct device_attribute *attr,
+		    const char *buf, size_t count)
+{
+	struct w83627ehf_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sensor_attr =
+		to_sensor_dev_attr(attr);
+	int nr = sensor_attr->index;
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+	val = step_time_to_reg(val, data->pwm_mode[nr]);
+	mutex_lock(&data->update_lock);
+	data->fan_stop_time[nr] = val;
+	w83627ehf_write_value(data, data->REG_FAN_STOP_TIME[nr], val);
+	mutex_unlock(&data->update_lock);
+
+	return count;
+}
 
 static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
-- 
2.7.4
