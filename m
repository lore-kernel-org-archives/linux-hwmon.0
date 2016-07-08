Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33510 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753600AbcGHDWO (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Jul 2016 23:22:14 -0400
Received: by mail-pf0-f196.google.com with SMTP id c74so3429494pfb.0
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Jul 2016 20:22:14 -0700 (PDT)
From: Matt Ranostay <mranostay@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Matt Ranostay <mranostay@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	David Frey <david.frey@sensirion.com>
Subject: [PATCH] hwmon: sht3x: add humidity heater element control
Date: Thu,  7 Jul 2016 20:22:00 -0700
Message-Id: <1467948120-25304-1-git-send-email-mranostay@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The enables control of the SHT31 sensors heating element that can turned
on to remove excess humidity.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: David Frey <david.frey@sensirion.com>
Signed-off-by: Matt Ranostay <mranostay@gmail.com>
---
 Documentation/hwmon/sht3x |  2 ++
 drivers/hwmon/sht3x.c     | 52 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/hwmon/sht3x b/Documentation/hwmon/sht3x
index f5aa633ed383..fb1d3f1d641f 100644
--- a/Documentation/hwmon/sht3x
+++ b/Documentation/hwmon/sht3x
@@ -67,6 +67,8 @@ temp1_alarm:        alarm flag is set to 1 if the temperature is outside the
                     configured limits. Alarm only works in periodic measure mode
 humidity1_alarm:    alarm flag is set to 1 if the humidity is outside the
                     configured limits. Alarm only works in periodic measure mode
+heater_enable:      heater enable, 1 for heating element turned on. Heating
+                    element removes excess humidity from sensor
 update_interval:    update interval, 0 for single shot, interval in msec
                     for periodic measurement. If the interval is not supported
                     by the sensor, the next faster interval is chosen
diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index b2c655add70e..05a925257938 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -44,6 +44,10 @@ static const unsigned char sht3x_cmd_measure_nonblocking_lpm[] = { 0x24, 0x16 };
 static const unsigned char sht3x_cmd_measure_periodic_mode[]   = { 0xe0, 0x00 };
 static const unsigned char sht3x_cmd_break[]                   = { 0x30, 0x93 };
 
+/* commands for heater control */
+static const unsigned char sht3x_cmd_heater_on[]               = { 0x30, 0x6d };
+static const unsigned char sht3x_cmd_heater_off[]              = { 0x30, 0x66 };
+
 /* other commands */
 static const unsigned char sht3x_cmd_read_status_reg[]         = { 0xf3, 0x2d };
 static const unsigned char sht3x_cmd_clear_status_reg[]        = { 0x30, 0x41 };
@@ -507,6 +511,51 @@ static ssize_t humidity1_alarm_show(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", !!(buffer[0] & 0x08));
 }
 
+static ssize_t heater_enable_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	char buffer[SHT3X_WORD_LEN + SHT3X_CRC8_LEN];
+	int ret;
+
+	ret = status_register_read(dev, attr, buffer,
+				   SHT3X_WORD_LEN + SHT3X_CRC8_LEN);
+	if (ret)
+		return ret;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", !!(buffer[0] & 0x20));
+}
+
+static ssize_t heater_enable_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf,
+				   size_t count)
+{
+	struct sht3x_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret;
+	int status;
+
+	ret = kstrtoint(buf, 0, &status);
+	if (ret)
+		return ret;
+
+	mutex_lock(&data->data_lock);
+	mutex_lock(&data->i2c_lock);
+
+	if (status)
+		ret = i2c_master_send(client, (char *) &sht3x_cmd_heater_on,
+				      SHT3X_CMD_LENGTH);
+	else
+		ret = i2c_master_send(client, (char *) &sht3x_cmd_heater_off,
+				      SHT3X_CMD_LENGTH);
+
+	mutex_unlock(&data->i2c_lock);
+	mutex_unlock(&data->data_lock);
+
+	return ret;
+}
+
 static ssize_t update_interval_show(struct device *dev,
 				    struct device_attribute *attr,
 				    char *buf)
@@ -612,6 +661,8 @@ static SENSOR_DEVICE_ATTR(humidity1_min_hyst, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, temp1_alarm_show, NULL, 0);
 static SENSOR_DEVICE_ATTR(humidity1_alarm, S_IRUGO, humidity1_alarm_show,
 			  NULL, 0);
+static SENSOR_DEVICE_ATTR(heater_enable, S_IRUGO | S_IWUSR,
+			  heater_enable_show, heater_enable_store, 0);
 static SENSOR_DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR,
 			  update_interval_show, update_interval_store, 0);
 
@@ -628,6 +679,7 @@ static struct attribute *sht3x_attrs[] = {
 	&sensor_dev_attr_humidity1_min_hyst.dev_attr.attr,
 	&sensor_dev_attr_temp1_alarm.dev_attr.attr,
 	&sensor_dev_attr_humidity1_alarm.dev_attr.attr,
+	&sensor_dev_attr_heater_enable.dev_attr.attr,
 	&sensor_dev_attr_update_interval.dev_attr.attr,
 	NULL
 };
-- 
2.7.4

