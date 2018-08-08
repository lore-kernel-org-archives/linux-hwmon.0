Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:47667 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726245AbeHHDxs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Aug 2018 23:53:48 -0400
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Jean Delvare <jdelvare@suse.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v3 4/4] hwmon: (adt7475) Change show functions to return error data correctly
Date: Wed,  8 Aug 2018 10:32:19 +0900
Message-Id: <20180808013219.26118-5-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180808013219.26118-1-ikegami@allied-telesis.co.jp>
References: <20180808013219.26118-1-ikegami@allied-telesis.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The update device function was changed to return error pointer value.
So change the show functions using the update function to return error.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
---
Changes since v2:
- Change to rebase on the v3 patch 1.

Changes since v1:
- Move the changes in adt7475_update_device() from patch 3.
- Change to rebase on the v2 patch 1.

 drivers/hwmon/adt7475.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 9f7e1a5b08a5..90837f7c7d0f 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -325,6 +325,9 @@ static ssize_t show_voltage(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	unsigned short val;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	switch (sattr->nr) {
 	case ALARM:
 		return sprintf(buf, "%d\n",
@@ -380,6 +383,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	int out;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	switch (sattr->nr) {
 	case HYSTERSIS:
 		mutex_lock(&data->lock);
@@ -624,6 +630,9 @@ static ssize_t show_point2(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	int out, val;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	mutex_lock(&data->lock);
 	out = (data->range[sattr->index] >> 4) & 0x0F;
 	val = reg2temp(data, data->temp[AUTOMIN][sattr->index]);
@@ -682,6 +691,9 @@ static ssize_t show_tach(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	int out;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (sattr->nr == ALARM)
 		out = (data->alarms >> (sattr->index + 10)) & 1;
 	else
@@ -719,6 +731,9 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwm[sattr->nr][sattr->index]);
 }
 
@@ -728,6 +743,9 @@ static ssize_t show_pwmchan(struct device *dev, struct device_attribute *attr,
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwmchan[sattr->index]);
 }
 
@@ -737,6 +755,9 @@ static ssize_t show_pwmctrl(struct device *dev, struct device_attribute *attr,
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwmctl[sattr->index]);
 }
 
@@ -944,6 +965,9 @@ static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
 	int i = clamp_val(data->range[sattr->index] & 0xf, 0,
 			  ARRAY_SIZE(pwmfreq_table) - 1);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", pwmfreq_table[i]);
 }
 
@@ -1034,6 +1058,10 @@ static ssize_t cpu0_vid_show(struct device *dev,
 			     struct device_attribute *devattr, char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 
@@ -1677,7 +1705,9 @@ static int adt7475_probe(struct i2c_client *client,
 			 (data->bypass_attn & (1 << 4)) ? " in4" : "");
 
 	/* Limits and settings, should never change update more than once */
-	adt7475_update_limits(client);
+	ret = adt7475_update_limits(client);
+	if (ret)
+		goto eremove;
 
 	return 0;
 
@@ -1876,13 +1906,19 @@ static struct adt7475_data *adt7475_update_device(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct adt7475_data *data = i2c_get_clientdata(client);
+	int ret;
 
 	mutex_lock(&data->lock);
 
 	/* Measurement values update every 2 seconds */
 	if (time_after(jiffies, data->measure_updated + HZ * 2) ||
 	    !data->valid) {
-		adt7475_update_measure(dev);
+		ret = adt7475_update_measure(dev);
+		if (ret) {
+			data->valid = false;
+			mutex_unlock(&data->lock);
+			return ERR_PTR(ret);
+		}
 		data->measure_updated = jiffies;
 		data->valid = true;
 	}
-- 
2.16.1

