Return-path: <joshuas@alliedtelesis.co.nz>
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: (lm73) Add temp1_max_hyst entry to sysfs
Date: Fri,  7 Oct 2016 17:42:21 +1300
Message-Id: <20161007044221.25577-1-joshua.scott@alliedtelesis.co.nz>
List-ID: <linux-hwmon@vger.kernel.org>

Currently, the lm73 driver has a temp1_max and a temp1_min. These make
sense when using temp1_max_alarm and temp1_min_alarm to determine if the
temperature has exceeded the chosen limits.

However, when using the ALARM output pin on the lm73 chip, the lower
temperature value behaves as a hysteresis value. Rather than the low value
triggering a "too cold" alarm, it is the point at which an existing high
temperature alarm is turned off.

Add a sysfs entry for temp1_max_hyst, tied to the same register as
temp1_min.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 drivers/hwmon/lm73.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/lm73.c b/drivers/hwmon/lm73.c
index 9653bb8..b46a91a 100644
--- a/drivers/hwmon/lm73.c
+++ b/drivers/hwmon/lm73.c
@@ -170,6 +170,8 @@ abort:
 
 static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
 			show_temp, set_temp, LM73_REG_MAX);
+static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
+			show_temp, set_temp, LM73_REG_MIN);
 static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,
 			show_temp, set_temp, LM73_REG_MIN);
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
@@ -184,6 +186,7 @@ static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO,
 static struct attribute *lm73_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
 	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
 	&sensor_dev_attr_temp1_min.dev_attr.attr,
 	&sensor_dev_attr_update_interval.dev_attr.attr,
 	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
-- 
2.9.3
