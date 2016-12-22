Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3902 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938978AbcLVM0y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:54 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/66] hwmon: (adt7470) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:34 +0100
Message-Id: <1482408335-3435-6-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/adt7470.c |   48 +++++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index c9a1d9c..2cd9207 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -403,7 +403,7 @@ static struct adt7470_data *adt7470_update_device(struct device *dev)
 	return data;
 }
 
-static ssize_t show_auto_update_interval(struct device *dev,
+static ssize_t auto_update_interval_show(struct device *dev,
 					 struct device_attribute *devattr,
 					 char *buf)
 {
@@ -411,10 +411,9 @@ static ssize_t show_auto_update_interval(struct device *dev,
 	return sprintf(buf, "%d\n", data->auto_update_interval);
 }
 
-static ssize_t set_auto_update_interval(struct device *dev,
-					struct device_attribute *devattr,
-					const char *buf,
-					size_t count)
+static ssize_t auto_update_interval_store(struct device *dev,
+					  struct device_attribute *devattr,
+					  const char *buf, size_t count)
 {
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	long temp;
@@ -431,7 +430,7 @@ static ssize_t set_auto_update_interval(struct device *dev,
 	return count;
 }
 
-static ssize_t show_num_temp_sensors(struct device *dev,
+static ssize_t num_temp_sensors_show(struct device *dev,
 				     struct device_attribute *devattr,
 				     char *buf)
 {
@@ -439,10 +438,9 @@ static ssize_t show_num_temp_sensors(struct device *dev,
 	return sprintf(buf, "%d\n", data->num_temp_sensors);
 }
 
-static ssize_t set_num_temp_sensors(struct device *dev,
-				    struct device_attribute *devattr,
-				    const char *buf,
-				    size_t count)
+static ssize_t num_temp_sensors_store(struct device *dev,
+				      struct device_attribute *devattr,
+				      const char *buf, size_t count)
 {
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	long temp;
@@ -537,7 +535,7 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", 1000 * data->temp[attr->index]);
 }
 
-static ssize_t show_alarm_mask(struct device *dev,
+static ssize_t alarm_mask_show(struct device *dev,
 			   struct device_attribute *devattr,
 			   char *buf)
 {
@@ -546,10 +544,9 @@ static ssize_t show_alarm_mask(struct device *dev,
 	return sprintf(buf, "%x\n", data->alarms_mask);
 }
 
-static ssize_t set_alarm_mask(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf,
-			      size_t count)
+static ssize_t alarm_mask_store(struct device *dev,
+				struct device_attribute *devattr,
+				const char *buf, size_t count)
 {
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	long mask;
@@ -723,8 +720,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
 	11, 15, 22, 29, 35, 44, 59, 88, 1400, 22500
 };
 
-static ssize_t show_pwm_freq(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
+static ssize_t pwm1_freq_show(struct device *dev,
+			      struct device_attribute *devattr, char *buf)
 {
 	struct adt7470_data *data = adt7470_update_device(dev);
 	unsigned char cfg_reg_1;
@@ -745,9 +742,9 @@ static ssize_t show_pwm_freq(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%d\n", adt7470_freq_map[index]);
 }
 
-static ssize_t set_pwm_freq(struct device *dev,
-			    struct device_attribute *devattr,
-			    const char *buf, size_t count)
+static ssize_t pwm1_freq_store(struct device *dev,
+			       struct device_attribute *devattr,
+			       const char *buf, size_t count)
 {
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1012,12 +1009,9 @@ static ssize_t show_alarm(struct device *dev,
 		return sprintf(buf, "0\n");
 }
 
-static DEVICE_ATTR(alarm_mask, S_IWUSR | S_IRUGO, show_alarm_mask,
-		   set_alarm_mask);
-static DEVICE_ATTR(num_temp_sensors, S_IWUSR | S_IRUGO, show_num_temp_sensors,
-		   set_num_temp_sensors);
-static DEVICE_ATTR(auto_update_interval, S_IWUSR | S_IRUGO,
-		   show_auto_update_interval, set_auto_update_interval);
+static DEVICE_ATTR_RW(alarm_mask);
+static DEVICE_ATTR_RW(num_temp_sensors);
+static DEVICE_ATTR_RW(auto_update_interval);
 
 static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp_max,
 		    set_temp_max, 0);
@@ -1133,7 +1127,7 @@ static SENSOR_DEVICE_ATTR(force_pwm_max, S_IWUSR | S_IRUGO,
 static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2);
 static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 3);
 
-static DEVICE_ATTR(pwm1_freq, S_IWUSR | S_IRUGO, show_pwm_freq, set_pwm_freq);
+static DEVICE_ATTR_RW(pwm1_freq);
 
 static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IWUSR | S_IRUGO,
 		    show_pwm_min, set_pwm_min, 0);

