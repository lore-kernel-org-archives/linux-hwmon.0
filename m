Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63945 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965392AbcLVM1F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:05 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 43/66] hwmon: (w83781d) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:12 +0100
Message-Id: <1482408335-3435-44-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/w83781d.c |   34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
index 54848fd..246fb23 100644
--- a/drivers/hwmon/w83781d.c
+++ b/drivers/hwmon/w83781d.c
@@ -416,24 +416,24 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO | S_IWUSR, \
 sysfs_temp_offsets(3);
 
 static ssize_t
-show_vid_reg(struct device *dev, struct device_attribute *attr, char *buf)
+cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83781d_data *data = w83781d_update_device(dev);
 	return sprintf(buf, "%ld\n", (long) vid_from_reg(data->vid, data->vrm));
 }
 
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid_reg, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 static ssize_t
-show_vrm_reg(struct device *dev, struct device_attribute *attr, char *buf)
+vrm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83781d_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%ld\n", (long) data->vrm);
 }
 
 static ssize_t
-store_vrm_reg(struct device *dev, struct device_attribute *attr,
-	      const char *buf, size_t count)
+vrm_store(struct device *dev, struct device_attribute *attr, const char *buf,
+	  size_t count)
 {
 	struct w83781d_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -447,16 +447,16 @@ static SENSOR_DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO | S_IWUSR, \
 	return count;
 }
 
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm_reg, store_vrm_reg);
+static DEVICE_ATTR_RW(vrm);
 
 static ssize_t
-show_alarms_reg(struct device *dev, struct device_attribute *attr, char *buf)
+alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct w83781d_data *data = w83781d_update_device(dev);
 	return sprintf(buf, "%u\n", data->alarms);
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms_reg, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -491,7 +491,7 @@ static ssize_t show_temp3_alarm(struct device *dev,
 static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5);
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_temp3_alarm, NULL, 0);
 
-static ssize_t show_beep_mask(struct device *dev,
+static ssize_t beep_mask_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct w83781d_data *data = w83781d_update_device(dev);
@@ -500,7 +500,7 @@ static ssize_t show_beep_mask(struct device *dev,
 }
 
 static ssize_t
-store_beep_mask(struct device *dev, struct device_attribute *attr,
+beep_mask_store(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
 	struct w83781d_data *data = dev_get_drvdata(dev);
@@ -527,8 +527,7 @@ static ssize_t show_beep_mask(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(beep_mask, S_IRUGO | S_IWUSR,
-		show_beep_mask, store_beep_mask);
+static DEVICE_ATTR_RW(beep_mask);
 
 static ssize_t show_beep(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -708,7 +707,7 @@ static SENSOR_DEVICE_ATTR(fan3_div, S_IRUGO | S_IWUSR,
 }
 
 static ssize_t
-show_pwm2_enable(struct device *dev, struct device_attribute *da, char *buf)
+pwm2_enable_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct w83781d_data *data = w83781d_update_device(dev);
 	return sprintf(buf, "%d\n", (int)data->pwm2_enable);
@@ -736,7 +735,7 @@ static SENSOR_DEVICE_ATTR(fan3_div, S_IRUGO | S_IWUSR,
 }
 
 static ssize_t
-store_pwm2_enable(struct device *dev, struct device_attribute *da,
+pwm2_enable_store(struct device *dev, struct device_attribute *da,
 		const char *buf, size_t count)
 {
 	struct w83781d_data *data = dev_get_drvdata(dev);
@@ -778,8 +777,7 @@ static SENSOR_DEVICE_ATTR(fan3_div, S_IRUGO | S_IWUSR,
 static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, show_pwm, store_pwm, 2);
 static SENSOR_DEVICE_ATTR(pwm4, S_IRUGO | S_IWUSR, show_pwm, store_pwm, 3);
 /* only PWM2 can be enabled/disabled */
-static DEVICE_ATTR(pwm2_enable, S_IRUGO | S_IWUSR,
-		show_pwm2_enable, store_pwm2_enable);
+static DEVICE_ATTR_RW(pwm2_enable);
 
 static ssize_t
 show_sensor(struct device *dev, struct device_attribute *da, char *buf)
@@ -1616,12 +1614,12 @@ static struct w83781d_data *w83781d_update_device(struct device *dev)
  * we must create it by ourselves.
  */
 static ssize_t
-show_name(struct device *dev, struct device_attribute *devattr, char *buf)
+name_show(struct device *dev, struct device_attribute *devattr, char *buf)
 {
 	struct w83781d_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 static struct w83781d_data *w83781d_data_if_isa(void)
 {

