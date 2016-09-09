Return-path: <joshuas@alliedtelesis.co.nz>
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] hwmon: adt7470: Add write support to alarm_mask
Date: Fri,  9 Sep 2016 17:19:25 +1200
Message-Id: <20160909051926.4253-1-joshua.scott@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

Add write support for the alarm_mask. A base of 0 is provided so that
either hex or decimal can be used. The hex format when reading alarm_mask
is unchanged.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 drivers/hwmon/adt7470.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 94550d7..dbd758b 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -545,6 +545,28 @@ static ssize_t show_alarm_mask(struct device *dev,
 	return sprintf(buf, "%x\n", data->alarms_mask);
 }
 
+static ssize_t set_alarm_mask(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf,
+			      size_t count)
+{
+	struct adt7470_data *data = dev_get_drvdata(dev);
+	long mask;
+
+	if (kstrtoul(buf, 0, &mask))
+		return -EINVAL;
+
+	if (mask & ~0xffff)
+		return -EINVAL;
+
+	mutex_lock(&data->lock);
+	data->alarms_mask = mask;
+	adt7470_write_word_data(data->client, ADT7470_REG_ALARM1_MASK, mask);
+	mutex_unlock(&data->lock);
+
+	return count;
+}
+
 static ssize_t show_fan_max(struct device *dev,
 			    struct device_attribute *devattr,
 			    char *buf)
@@ -989,7 +1011,8 @@ static ssize_t show_alarm(struct device *dev,
 		return sprintf(buf, "0\n");
 }
 
-static DEVICE_ATTR(alarm_mask, S_IRUGO, show_alarm_mask, NULL);
+static DEVICE_ATTR(alarm_mask, S_IWUSR | S_IRUGO, show_alarm_mask,
+		   set_alarm_mask);
 static DEVICE_ATTR(num_temp_sensors, S_IWUSR | S_IRUGO, show_num_temp_sensors,
 		   set_num_temp_sensors);
 static DEVICE_ATTR(auto_update_interval, S_IWUSR | S_IRUGO,
-- 
2.9.0
