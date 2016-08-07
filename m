Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/6] hwmon: (lm95241) Add support for fault attributes
Date: Sun,  7 Aug 2016 16:31:56 -0700
Message-Id: <1470612720-30165-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1470612720-30165-1-git-send-email-linux@roeck-us.net>
References: <1470612720-30165-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The chip reports if remote diodes are present, which can be used for
the fault attrributes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95241.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index a8cf666fe661..e4e7bf169b07 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -70,6 +70,8 @@ static const unsigned short normal_i2c[] = {
 #define R2DF_MASK (0x01 << (R2DF_SHIFT))
 #define R1FE_MASK 0x01
 #define R2FE_MASK 0x05
+#define R1DM 0x01
+#define R2DM 0x02
 #define TT1_SHIFT 0
 #define TT2_SHIFT 4
 #define TT_OFF 0
@@ -97,7 +99,7 @@ struct lm95241_data {
 	char valid;		/* zero until following fields are valid */
 	/* registers values */
 	u8 temp[ARRAY_SIZE(lm95241_reg_address)];
-	u8 config, model, trutherm;
+	u8 status, config, model, trutherm;
 };
 
 /* Conversions */
@@ -130,6 +132,9 @@ static struct lm95241_data *lm95241_update_device(struct device *dev)
 			data->temp[i]
 			  = i2c_smbus_read_byte_data(client,
 						     lm95241_reg_address[i]);
+
+		data->status = i2c_smbus_read_byte_data(client,
+							LM95241_REG_R_STATUS);
 		data->last_updated = jiffies;
 		data->valid = 1;
 	}
@@ -274,6 +279,15 @@ static ssize_t set_max(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t show_fault(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct lm95241_data *data = lm95241_update_device(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d",
+			!!(data->status & to_sensor_dev_attr(attr)->index));
+}
+
 static ssize_t show_interval(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
@@ -335,6 +349,8 @@ static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO, show_max, set_max,
 			  R1DF_MASK);
 static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO, show_max, set_max,
 			  R2DF_MASK);
+static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_fault, NULL, R1DM);
+static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_fault, NULL, R2DM);
 static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_interval,
 		   set_interval);
 
@@ -348,6 +364,8 @@ static struct attribute *lm95241_attrs[] = {
 	&sensor_dev_attr_temp3_min.dev_attr.attr,
 	&sensor_dev_attr_temp2_max.dev_attr.attr,
 	&sensor_dev_attr_temp3_max.dev_attr.attr,
+	&sensor_dev_attr_temp2_fault.dev_attr.attr,
+	&sensor_dev_attr_temp3_fault.dev_attr.attr,
 	&dev_attr_update_interval.attr,
 	NULL
 };
-- 
2.5.0
