Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:7146 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726902AbeHGLML (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Aug 2018 07:12:11 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 4/4] hwmon: (adt7475) Change show functions to return error data correctly
Date: Tue,  7 Aug 2018 17:57:33 +0900
Message-Id: <20180807085733.28756-5-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180807085733.28756-1-ikegami@allied-telesis.co.jp>
References: <20180807085733.28756-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The update device function was changed to return error pointer value.
So change the show functions using the update function to return error.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/adt7475.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index fb89b88f1998..21a40fbb3a49 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -326,6 +326,9 @@ static ssize_t show_voltage(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	unsigned short val;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	switch (sattr->nr) {
 	case ALARM:
 		return sprintf(buf, "%d\n",
@@ -381,6 +384,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	int out;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	switch (sattr->nr) {
 	case HYSTERSIS:
 		mutex_lock(&data->lock);
@@ -625,6 +631,9 @@ static ssize_t show_point2(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	int out, val;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	mutex_lock(&data->lock);
 	out = (data->range[sattr->index] >> 4) & 0x0F;
 	val = reg2temp(data, data->temp[AUTOMIN][sattr->index]);
@@ -683,6 +692,9 @@ static ssize_t show_tach(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	int out;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (sattr->nr == ALARM)
 		out = (data->alarms >> (sattr->index + 10)) & 1;
 	else
@@ -720,6 +732,9 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwm[sattr->nr][sattr->index]);
 }
 
@@ -729,6 +744,9 @@ static ssize_t show_pwmchan(struct device *dev, struct device_attribute *attr,
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwmchan[sattr->index]);
 }
 
@@ -738,6 +756,9 @@ static ssize_t show_pwmctrl(struct device *dev, struct device_attribute *attr,
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwmctl[sattr->index]);
 }
 
@@ -945,6 +966,9 @@ static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
 	int i = clamp_val(data->range[sattr->index] & 0xf, 0,
 			  ARRAY_SIZE(pwmfreq_table) - 1);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", pwmfreq_table[i]);
 }
 
@@ -1035,6 +1059,10 @@ static ssize_t cpu0_vid_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 
-- 
2.16.1

