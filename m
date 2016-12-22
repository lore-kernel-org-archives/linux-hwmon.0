Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938941AbcLVM06 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:58 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 20/66] hwmon: (lm63) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:49 +0100
Message-Id: <1482408335-3435-21-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/lm63.c |   48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 33bfdb4..2e19486 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -417,16 +417,16 @@ static ssize_t set_pwm1(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t show_pwm1_enable(struct device *dev,
+static ssize_t pwm1_enable_show(struct device *dev,
 				struct device_attribute *dummy, char *buf)
 {
 	struct lm63_data *data = lm63_update_device(dev);
 	return sprintf(buf, "%d\n", data->config_fan & 0x20 ? 1 : 2);
 }
 
-static ssize_t set_pwm1_enable(struct device *dev,
-			       struct device_attribute *dummy,
-			       const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *dummy,
+				 const char *buf, size_t count)
 {
 	struct lm63_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -600,7 +600,7 @@ static ssize_t set_temp11(struct device *dev, struct device_attribute *devattr,
  * Hysteresis register holds a relative value, while we want to present
  * an absolute to user-space
  */
-static ssize_t show_temp2_crit_hyst(struct device *dev,
+static ssize_t temp2_crit_hyst_show(struct device *dev,
 				    struct device_attribute *dummy, char *buf)
 {
 	struct lm63_data *data = lm63_update_device(dev);
@@ -624,9 +624,9 @@ static ssize_t show_lut_temp_hyst(struct device *dev,
  * And now the other way around, user-space provides an absolute
  * hysteresis value and we have to store a relative one
  */
-static ssize_t set_temp2_crit_hyst(struct device *dev,
-				   struct device_attribute *dummy,
-				   const char *buf, size_t count)
+static ssize_t temp2_crit_hyst_store(struct device *dev,
+				     struct device_attribute *dummy,
+				     const char *buf, size_t count)
 {
 	struct lm63_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -670,7 +670,7 @@ static void lm63_set_convrate(struct lm63_data *data, unsigned int interval)
 	data->update_interval = UPDATE_INTERVAL(data->max_convrate_hz, i);
 }
 
-static ssize_t show_update_interval(struct device *dev,
+static ssize_t update_interval_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct lm63_data *data = dev_get_drvdata(dev);
@@ -678,9 +678,9 @@ static ssize_t show_update_interval(struct device *dev,
 	return sprintf(buf, "%u\n", data->update_interval);
 }
 
-static ssize_t set_update_interval(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static ssize_t update_interval_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct lm63_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -697,16 +697,17 @@ static ssize_t set_update_interval(struct device *dev,
 	return count;
 }
 
-static ssize_t show_type(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t temp2_type_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct lm63_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, data->trutherm ? "1\n" : "2\n");
 }
 
-static ssize_t set_type(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t temp2_type_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
 {
 	struct lm63_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -731,7 +732,7 @@ static ssize_t set_type(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_alarms(struct device *dev, struct device_attribute *dummy,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *dummy,
 			   char *buf)
 {
 	struct lm63_data *data = lm63_update_device(dev);
@@ -753,8 +754,7 @@ static SENSOR_DEVICE_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan,
 	set_fan, 1);
 
 static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm1, set_pwm1, 0);
-static DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
-	show_pwm1_enable, set_pwm1_enable);
+static DEVICE_ATTR_RW(pwm1_enable);
 static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IWUSR | S_IRUGO,
 	show_pwm1, set_pwm1, 1);
 static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, S_IWUSR | S_IRUGO,
@@ -841,10 +841,9 @@ static SENSOR_DEVICE_ATTR(temp2_offset, S_IWUSR | S_IRUGO, show_temp11,
 	set_temp11, 3);
 static SENSOR_DEVICE_ATTR(temp2_crit, S_IRUGO, show_remote_temp8,
 	set_temp8, 2);
-static DEVICE_ATTR(temp2_crit_hyst, S_IWUSR | S_IRUGO, show_temp2_crit_hyst,
-	set_temp2_crit_hyst);
+static DEVICE_ATTR_RW(temp2_crit_hyst);
 
-static DEVICE_ATTR(temp2_type, S_IWUSR | S_IRUGO, show_type, set_type);
+static DEVICE_ATTR_RW(temp2_type);
 
 /* Individual alarm files */
 static SENSOR_DEVICE_ATTR(fan1_min_alarm, S_IRUGO, show_alarm, NULL, 0);
@@ -854,10 +853,9 @@ static DEVICE_ATTR(temp2_crit_hyst, S_IWUSR | S_IRUGO, show_temp2_crit_hyst,
 static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, 4);
 static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, 6);
 /* Raw alarm file for compatibility */
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
-static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR, show_update_interval,
-		   set_update_interval);
+static DEVICE_ATTR_RW(update_interval);
 
 static struct attribute *lm63_attributes[] = {
 	&sensor_dev_attr_pwm1.dev_attr.attr,

