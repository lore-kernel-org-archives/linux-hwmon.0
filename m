Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3902 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938987AbcLVM06 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:58 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 24/66] hwmon: (lm87) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:53 +0100
Message-Id: <1482408335-3435-25-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/lm87.c |   43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index 13cca36..e06faf9 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -445,23 +445,23 @@ static SENSOR_DEVICE_ATTR(temp##offset##_min, S_IRUGO | S_IWUSR, \
 set_temp(2);
 set_temp(3);
 
-static ssize_t show_temp_crit_int(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t temp1_crit_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit_int));
 }
 
-static ssize_t show_temp_crit_ext(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t temp2_crit_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit_ext));
 }
 
-static DEVICE_ATTR(temp1_crit, S_IRUGO, show_temp_crit_int, NULL);
-static DEVICE_ATTR(temp2_crit, S_IRUGO, show_temp_crit_ext, NULL);
-static DEVICE_ATTR(temp3_crit, S_IRUGO, show_temp_crit_ext, NULL);
+static DEVICE_ATTR_RO(temp1_crit);
+static DEVICE_ATTR_RO(temp2_crit);
+static DEVICE_ATTR(temp3_crit, S_IRUGO, temp2_crit_show, NULL);
 
 static ssize_t show_fan_input(struct device *dev,
 			      struct device_attribute *attr, char *buf)
@@ -586,30 +586,30 @@ static SENSOR_DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR, \
 set_fan(1);
 set_fan(2);
 
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	return sprintf(buf, "%d\n", data->alarms);
 }
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
-static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
-static ssize_t show_vrm(struct device *dev, struct device_attribute *attr,
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct lm87_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", data->vrm);
 }
-static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct lm87_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -625,16 +625,17 @@ static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
 	data->vrm = val;
 	return count;
 }
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm, set_vrm);
+static DEVICE_ATTR_RW(vrm);
 
-static ssize_t show_aout(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t aout_output_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct lm87_data *data = lm87_update_device(dev);
 	return sprintf(buf, "%d\n", AOUT_FROM_REG(data->aout));
 }
-static ssize_t set_aout(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t aout_output_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
@@ -651,7 +652,7 @@ static ssize_t set_aout(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&data->update_lock);
 	return count;
 }
-static DEVICE_ATTR(aout_output, S_IRUGO | S_IWUSR, show_aout, set_aout);
+static DEVICE_ATTR_RW(aout_output);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 			  char *buf)

