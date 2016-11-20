Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/7] hwmon: (core) Add support for string attributes to new API
Date: Sun, 20 Nov 2016 09:36:23 -0800
Message-Id: <1479663388-2000-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
References: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The new API is so far only suited for data attributes and does not work
well for string attributes, specifically for the 'label' attributes.
Provide a separate callback function for those.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Yes, I know, S_IRUGO ran out of favor. However, instead of changing it
in each file, I'd rather change it with a single patch in all files after
things calmed down a bit and we can rest assured that this is not just
a fluke.

 drivers/hwmon/hwmon.c | 33 +++++++++++++++++++++++++++++++--
 include/linux/hwmon.h | 19 +++++++++++++++++--
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index a74c075a30ec..491231fa0580 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -178,6 +178,22 @@ static ssize_t hwmon_attr_show(struct device *dev,
 	return sprintf(buf, "%ld\n", val);
 }
 
+static ssize_t hwmon_attr_show_string(struct device *dev,
+				      struct device_attribute *devattr,
+				      char *buf)
+{
+	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
+	char *s;
+	int ret;
+
+	ret = hattr->ops->read_string(dev, hattr->type, hattr->attr,
+				      hattr->index, &s);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%s\n", s);
+}
+
 static ssize_t hwmon_attr_store(struct device *dev,
 				struct device_attribute *devattr,
 				const char *buf, size_t count)
@@ -205,6 +221,17 @@ static int hwmon_attr_base(enum hwmon_sensor_types type)
 	return 1;
 }
 
+static bool is_string_attr(enum hwmon_sensor_types type, u32 attr)
+{
+	return (type == hwmon_temp && attr == hwmon_temp_label) ||
+	       (type == hwmon_in && attr == hwmon_in_label) ||
+	       (type == hwmon_curr && attr == hwmon_curr_label) ||
+	       (type == hwmon_power && attr == hwmon_power_label) ||
+	       (type == hwmon_energy && attr == hwmon_energy_label) ||
+	       (type == hwmon_humidity && attr == hwmon_humidity_label) ||
+	       (type == hwmon_fan && attr == hwmon_fan_label);
+}
+
 static struct attribute *hwmon_genattr(struct device *dev,
 				       const void *drvdata,
 				       enum hwmon_sensor_types type,
@@ -218,6 +245,7 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	struct attribute *a;
 	umode_t mode;
 	char *name;
+	bool is_string = is_string_attr(type, attr);
 
 	/* The attribute is invisible if there is no template string */
 	if (!template)
@@ -227,7 +255,8 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	if (!mode)
 		return ERR_PTR(-ENOENT);
 
-	if ((mode & S_IRUGO) && !ops->read)
+	if ((mode & S_IRUGO) && ((is_string && !ops->read_string) ||
+				 (!is_string && !ops->read)))
 		return ERR_PTR(-EINVAL);
 	if ((mode & S_IWUGO) && !ops->write)
 		return ERR_PTR(-EINVAL);
@@ -252,7 +281,7 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	hattr->ops = ops;
 
 	dattr = &hattr->dev_attr;
-	dattr->show = hwmon_attr_show;
+	dattr->show = is_string ? hwmon_attr_show_string : hwmon_attr_show;
 	dattr->store = hwmon_attr_store;
 
 	a = &dattr->attr;
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index b6a86aa4a9e2..e68334aede4c 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -298,7 +298,8 @@ enum hwmon_pwm_attributes {
  *			Channel number
  *		The function returns the file permissions.
  *		If the return value is 0, no attribute will be created.
- * @read:	Read callback. Mandatory if readable attributes are present.
+ * @read:	Read callback for data attributes. Mandatory if readable
+ *		data attributes are present.
  *		Parameters are:
  *		@dev:	Pointer to hardware monitoring device
  *		@type:	Sensor type
@@ -307,7 +308,19 @@ enum hwmon_pwm_attributes {
  *			Channel number
  *		@val:	Pointer to returned value
  *		The function returns 0 on success or a negative error number.
- * @write:	Write callback. Mandatory if writeable attributes are present.
+ * @read_string:
+ *		Read callback for string attributes. Mandatory if string
+ *		attributes are present.
+ *		Parameters are:
+ *		@dev:	Pointer to hardware monitoring device
+ *		@type:	Sensor type
+ *		@attr:	Sensor attribute
+ *		@channel:
+ *			Channel number
+ *		@str:	Pointer to returned string
+ *		The function returns 0 on success or a negative error number.
+ * @write:	Write callback for data attributes. Mandatory if writeable
+ *		data attributes are present.
  *		Parameters are:
  *		@dev:	Pointer to hardware monitoring device
  *		@type:	Sensor type
@@ -322,6 +335,8 @@ struct hwmon_ops {
 			      u32 attr, int channel);
 	int (*read)(struct device *dev, enum hwmon_sensor_types type,
 		    u32 attr, int channel, long *val);
+	int (*read_string)(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, char **str);
 	int (*write)(struct device *dev, enum hwmon_sensor_types type,
 		     u32 attr, int channel, long val);
 };
-- 
2.5.0
