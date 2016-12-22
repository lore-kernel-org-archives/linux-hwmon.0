Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31267 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965159AbcLVM04 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:56 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 14/66] hwmon: (gl520sm) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:43 +0100
Message-Id: <1482408335-3435-15-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/gl520sm.c |   48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/gl520sm.c b/drivers/hwmon/gl520sm.c
index dee93ec..f24a614 100644
--- a/drivers/hwmon/gl520sm.c
+++ b/drivers/hwmon/gl520sm.c
@@ -200,13 +200,13 @@ static struct gl520_data *gl520_update_device(struct device *dev)
  * Sysfs stuff
  */
 
-static ssize_t get_cpu_vid(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct gl520_data *data = gl520_update_device(dev);
 	return sprintf(buf, "%u\n", vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, get_cpu_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 #define VDD_FROM_REG(val) (((val) * 95 + 2) / 4)
 #define VDD_TO_REG(val) clamp_val((((val) * 4 + 47) / 95), 0, 255)
@@ -381,8 +381,8 @@ static ssize_t get_fan_div(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[n]));
 }
 
-static ssize_t get_fan_off(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+static ssize_t fan1_off_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct gl520_data *data = gl520_update_device(dev);
 	return sprintf(buf, "%d\n", data->fan_off);
@@ -476,8 +476,9 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_fan_off(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t fan1_off_store(struct device *dev,
+			      struct device_attribute *attr, const char *buf,
+			      size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -510,8 +511,7 @@ static SENSOR_DEVICE_ATTR(fan1_div, S_IRUGO | S_IWUSR,
 		get_fan_div, set_fan_div, 0);
 static SENSOR_DEVICE_ATTR(fan2_div, S_IRUGO | S_IWUSR,
 		get_fan_div, set_fan_div, 1);
-static DEVICE_ATTR(fan1_off, S_IRUGO | S_IWUSR,
-		get_fan_off, set_fan_off);
+static DEVICE_ATTR_RW(fan1_off);
 
 #define TEMP_FROM_REG(val) (((val) - 130) * 1000)
 #define TEMP_TO_REG(val) clamp_val(((((val) < 0 ? \
@@ -596,29 +596,30 @@ static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(temp2_max_hyst, S_IRUGO | S_IWUSR,
 		get_temp_max_hyst, set_temp_max_hyst, 1);
 
-static ssize_t get_alarms(struct device *dev, struct device_attribute *attr,
-			  char *buf)
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct gl520_data *data = gl520_update_device(dev);
 	return sprintf(buf, "%d\n", data->alarms);
 }
 
-static ssize_t get_beep_enable(struct device *dev, struct device_attribute
-			       *attr, char *buf)
+static ssize_t beep_enable_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct gl520_data *data = gl520_update_device(dev);
 	return sprintf(buf, "%d\n", data->beep_enable);
 }
 
-static ssize_t get_beep_mask(struct device *dev, struct device_attribute *attr,
-			     char *buf)
+static ssize_t beep_mask_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct gl520_data *data = gl520_update_device(dev);
 	return sprintf(buf, "%d\n", data->beep_mask);
 }
 
-static ssize_t set_beep_enable(struct device *dev, struct device_attribute
-			       *attr, const char *buf, size_t count)
+static ssize_t beep_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -641,8 +642,9 @@ static ssize_t set_beep_enable(struct device *dev, struct device_attribute
 	return count;
 }
 
-static ssize_t set_beep_mask(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t beep_mask_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct gl520_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -661,11 +663,9 @@ static ssize_t set_beep_mask(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, get_alarms, NULL);
-static DEVICE_ATTR(beep_enable, S_IRUGO | S_IWUSR,
-		get_beep_enable, set_beep_enable);
-static DEVICE_ATTR(beep_mask, S_IRUGO | S_IWUSR,
-		get_beep_mask, set_beep_mask);
+static DEVICE_ATTR_RO(alarms);
+static DEVICE_ATTR_RW(beep_enable);
+static DEVICE_ATTR_RW(beep_mask);
 
 static ssize_t get_alarm(struct device *dev, struct device_attribute *attr,
 			 char *buf)

