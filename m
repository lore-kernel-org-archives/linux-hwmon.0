Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	"Andrew F. Davis" <afd@ti.com>
Subject: [PATCH] hwmon: (ina3221) Fix negative limits
Date: Fri, 24 Jun 2016 19:47:07 -0700
Message-Id: <1466822827-31231-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The result of an integer divide by an unsigned is undefined.
This causes unexpected results when writing negative values
into the limit registers.

Maintain the shunt_resistors variables as signed integer to avoid
the problem. Also, for simplicity and ease of use, clamp shunt
resistor value on writes instead of rejecting bad values.

Cc: Andrew F. Davis <afd@ti.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina3221.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index d055b6a2266b..e6b49500c52a 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -95,7 +95,7 @@ static const unsigned int register_channel[] = {
 struct ina3221_data {
 	struct regmap *regmap;
 	struct regmap_field *fields[F_MAX_FIELDS];
-	unsigned int shunt_resistors[INA3221_NUM_CHANNELS];
+	int shunt_resistors[INA3221_NUM_CHANNELS];
 };
 
 static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
@@ -155,7 +155,7 @@ static ssize_t ina3221_show_current(struct device *dev,
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	unsigned int reg = sd_attr->index;
 	unsigned int channel = register_channel[reg];
-	unsigned int resistance_uo = ina->shunt_resistors[channel];
+	int resistance_uo = ina->shunt_resistors[channel];
 	int val, current_ma, voltage_nv, ret;
 
 	ret = ina3221_read_value(ina, reg, &val);
@@ -176,7 +176,7 @@ static ssize_t ina3221_set_current(struct device *dev,
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	unsigned int reg = sd_attr->index;
 	unsigned int channel = register_channel[reg];
-	unsigned int resistance_uo = ina->shunt_resistors[channel];
+	int resistance_uo = ina->shunt_resistors[channel];
 	int val, current_ma, voltage_uv, ret;
 
 	ret = kstrtoint(buf, 0, &current_ma);
@@ -223,15 +223,14 @@ static ssize_t ina3221_set_shunt(struct device *dev,
 	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
 	struct ina3221_data *ina = dev_get_drvdata(dev);
 	unsigned int channel = sd_attr->index;
-	unsigned int val;
+	int val;
 	int ret;
 
-	ret = kstrtouint(buf, 0, &val);
+	ret = kstrtoint(buf, 0, &val);
 	if (ret)
 		return ret;
 
-	if (val == 0)
-		return -EINVAL;
+	val = clamp_val(val, 1, INT_MAX);
 
 	ina->shunt_resistors[channel] = val;
 
-- 
2.5.0
