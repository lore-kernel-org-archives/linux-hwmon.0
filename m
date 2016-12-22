Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3902 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965478AbcLVM1M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:12 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Roger Lucas <vt8231@hiddenengine.co.uk>
Cc: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 49/66] hwmon: (vt8231) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:18 +0100
Message-Id: <1482408335-3435-50-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch for the RO case, in the case where the show function
already has the expected name, is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/hwmon/vt8231.c |   59 +++++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index cb69a8c..367b5eb5 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -263,8 +263,8 @@ static ssize_t set_in_max(struct device *dev, struct device_attribute *attr,
 }
 
 /* Special case for input 5 as this has 3.3V scaling built into the chip */
-static ssize_t show_in5(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in5_input_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct vt8231_data *data = vt8231_update_device(dev);
 
@@ -272,7 +272,7 @@ static ssize_t show_in5(struct device *dev, struct device_attribute *attr,
 		(((data->in[5] - 3) * 10000 * 54) / (958 * 34)));
 }
 
-static ssize_t show_in5_min(struct device *dev, struct device_attribute *attr,
+static ssize_t in5_min_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct vt8231_data *data = vt8231_update_device(dev);
@@ -281,7 +281,7 @@ static ssize_t show_in5_min(struct device *dev, struct device_attribute *attr,
 		(((data->in_min[5] - 3) * 10000 * 54) / (958 * 34)));
 }
 
-static ssize_t show_in5_max(struct device *dev, struct device_attribute *attr,
+static ssize_t in5_max_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct vt8231_data *data = vt8231_update_device(dev);
@@ -290,8 +290,9 @@ static ssize_t show_in5_max(struct device *dev, struct device_attribute *attr,
 		(((data->in_max[5] - 3) * 10000 * 54) / (958 * 34)));
 }
 
-static ssize_t set_in5_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in5_min_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct vt8231_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -309,8 +310,9 @@ static ssize_t set_in5_min(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_in5_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t in5_max_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct vt8231_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -342,34 +344,35 @@ static SENSOR_DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,	\
 define_voltage_sysfs(3);
 define_voltage_sysfs(4);
 
-static DEVICE_ATTR(in5_input, S_IRUGO, show_in5, NULL);
-static DEVICE_ATTR(in5_min, S_IRUGO | S_IWUSR, show_in5_min, set_in5_min);
-static DEVICE_ATTR(in5_max, S_IRUGO | S_IWUSR, show_in5_max, set_in5_max);
+static DEVICE_ATTR_RO(in5_input);
+static DEVICE_ATTR_RW(in5_min);
+static DEVICE_ATTR_RW(in5_max);
 
 /* Temperatures */
-static ssize_t show_temp0(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp1_input_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct vt8231_data *data = vt8231_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp[0] * 250);
 }
 
-static ssize_t show_temp0_max(struct device *dev, struct device_attribute *attr,
+static ssize_t temp1_max_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct vt8231_data *data = vt8231_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp_max[0] * 1000);
 }
 
-static ssize_t show_temp0_min(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t temp1_max_hyst_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct vt8231_data *data = vt8231_update_device(dev);
 	return sprintf(buf, "%d\n", data->temp_min[0] * 1000);
 }
 
-static ssize_t set_temp0_max(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp1_max_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct vt8231_data *data = dev_get_drvdata(dev);
 	long val;
@@ -385,8 +388,9 @@ static ssize_t set_temp0_max(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static ssize_t set_temp0_min(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t temp1_max_hyst_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	struct vt8231_data *data = dev_get_drvdata(dev);
 	long val;
@@ -481,10 +485,9 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,	\
 static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO | S_IWUSR,	\
 		show_temp_min, set_temp_min, offset - 1)
 
-static DEVICE_ATTR(temp1_input, S_IRUGO, show_temp0, NULL);
-static DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR, show_temp0_max, set_temp0_max);
-static DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR, show_temp0_min,
-		   set_temp0_min);
+static DEVICE_ATTR_RO(temp1_input);
+static DEVICE_ATTR_RW(temp1_max);
+static DEVICE_ATTR_RW(temp1_max_hyst);
 
 define_temperature_sysfs(2);
 define_temperature_sysfs(3);
@@ -603,13 +606,13 @@ static SENSOR_DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
 define_fan_sysfs(2);
 
 /* Alarms */
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct vt8231_data *data = vt8231_update_device(dev);
 	return sprintf(buf, "%d\n", data->alarms);
 }
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -633,13 +636,13 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 static SENSOR_DEVICE_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6);
 static SENSOR_DEVICE_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7);
 
-static ssize_t show_name(struct device *dev, struct device_attribute
+static ssize_t name_show(struct device *dev, struct device_attribute
 			 *devattr, char *buf)
 {
 	struct vt8231_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct attribute *vt8231_attributes_temps[6][5] = {
 	{

