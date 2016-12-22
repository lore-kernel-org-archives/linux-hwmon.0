Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63945 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938944AbcLVM0v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:51 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/66] hwmon: (adm1026) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:31 +0100
Message-Id: <1482408335-3435-3-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/adm1026.c |  128 ++++++++++++++++++++++++------------------------
 1 file changed, 66 insertions(+), 62 deletions(-)

diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
index b2a5d9e..e43f09a 100644
--- a/drivers/hwmon/adm1026.c
+++ b/drivers/hwmon/adm1026.c
@@ -1034,15 +1034,15 @@ static SENSOR_DEVICE_ATTR(temp##offset##_crit, S_IRUGO | S_IWUSR,	\
 temp_crit_reg(2);
 temp_crit_reg(3);
 
-static ssize_t show_analog_out_reg(struct device *dev,
-				   struct device_attribute *attr, char *buf)
+static ssize_t analog_out_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", DAC_FROM_REG(data->analog_out));
 }
-static ssize_t set_analog_out_reg(struct device *dev,
-				  struct device_attribute *attr,
-				  const char *buf, size_t count)
+static ssize_t analog_out_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1060,11 +1060,10 @@ static ssize_t set_analog_out_reg(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(analog_out, S_IRUGO | S_IWUSR, show_analog_out_reg,
-	set_analog_out_reg);
+static DEVICE_ATTR_RW(analog_out);
 
-static ssize_t show_vid_reg(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	int vid = (data->gpio >> 11) & 0x1f;
@@ -1073,17 +1072,17 @@ static ssize_t show_vid_reg(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", vid_from_reg(vid, data->vrm));
 }
 
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid_reg, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
-static ssize_t show_vrm_reg(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", data->vrm);
 }
 
-static ssize_t store_vrm_reg(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -1100,16 +1099,16 @@ static ssize_t store_vrm_reg(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm_reg, store_vrm_reg);
+static DEVICE_ATTR_RW(vrm);
 
-static ssize_t show_alarms_reg(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%ld\n", data->alarms);
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms_reg, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -1148,14 +1147,15 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 static SENSOR_DEVICE_ATTR(in10_alarm, S_IRUGO, show_alarm, NULL, 25);
 static SENSOR_DEVICE_ATTR(in8_alarm, S_IRUGO, show_alarm, NULL, 26);
 
-static ssize_t show_alarm_mask(struct device *dev,
+static ssize_t alarm_mask_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%ld\n", data->alarm_mask);
 }
-static ssize_t set_alarm_mask(struct device *dev, struct device_attribute *attr,
-			      const char *buf, size_t count)
+static ssize_t alarm_mask_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1186,18 +1186,17 @@ static ssize_t set_alarm_mask(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(alarm_mask, S_IRUGO | S_IWUSR, show_alarm_mask,
-	set_alarm_mask);
+static DEVICE_ATTR_RW(alarm_mask);
 
 
-static ssize_t show_gpio(struct device *dev, struct device_attribute *attr,
+static ssize_t gpio_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%ld\n", data->gpio);
 }
-static ssize_t set_gpio(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t gpio_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1221,16 +1220,18 @@ static ssize_t set_gpio(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(gpio, S_IRUGO | S_IWUSR, show_gpio, set_gpio);
+static DEVICE_ATTR_RW(gpio);
 
-static ssize_t show_gpio_mask(struct device *dev, struct device_attribute *attr,
+static ssize_t gpio_mask_show(struct device *dev,
+			      struct device_attribute *attr,
 			      char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%ld\n", data->gpio_mask);
 }
-static ssize_t set_gpio_mask(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t gpio_mask_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1254,17 +1255,17 @@ static ssize_t set_gpio_mask(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(gpio_mask, S_IRUGO | S_IWUSR, show_gpio_mask, set_gpio_mask);
+static DEVICE_ATTR_RW(gpio_mask);
 
-static ssize_t show_pwm_reg(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t pwm1_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm1.pwm));
 }
 
-static ssize_t set_pwm_reg(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t pwm1_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1285,16 +1286,17 @@ static ssize_t set_pwm_reg(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_auto_pwm_min(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+static ssize_t temp1_auto_point1_pwm_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm1.auto_pwm_min);
 }
 
-static ssize_t set_auto_pwm_min(struct device *dev,
-				struct device_attribute *attr, const char *buf,
-				size_t count)
+static ssize_t temp1_auto_point1_pwm_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1316,21 +1318,23 @@ static ssize_t set_auto_pwm_min(struct device *dev,
 	return count;
 }
 
-static ssize_t show_auto_pwm_max(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+static ssize_t temp1_auto_point2_pwm_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	return sprintf(buf, "%d\n", ADM1026_PWM_MAX);
 }
 
-static ssize_t show_pwm_enable(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t pwm1_enable_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct adm1026_data *data = adm1026_update_device(dev);
 	return sprintf(buf, "%d\n", data->pwm1.enable);
 }
 
-static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
-			      const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct adm1026_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -1366,25 +1370,25 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 }
 
 /* enable PWM fan control */
-static DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm_reg, set_pwm_reg);
-static DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, show_pwm_reg, set_pwm_reg);
-static DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, show_pwm_reg, set_pwm_reg);
-static DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR, show_pwm_enable,
-	set_pwm_enable);
-static DEVICE_ATTR(pwm2_enable, S_IRUGO | S_IWUSR, show_pwm_enable,
-	set_pwm_enable);
-static DEVICE_ATTR(pwm3_enable, S_IRUGO | S_IWUSR, show_pwm_enable,
-	set_pwm_enable);
-static DEVICE_ATTR(temp1_auto_point1_pwm, S_IRUGO | S_IWUSR,
-	show_auto_pwm_min, set_auto_pwm_min);
+static DEVICE_ATTR_RW(pwm1);
+static DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, pwm1_show, pwm1_store);
+static DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, pwm1_show, pwm1_store);
+static DEVICE_ATTR_RW(pwm1_enable);
+static DEVICE_ATTR(pwm2_enable, S_IRUGO | S_IWUSR, pwm1_enable_show,
+		   pwm1_enable_store);
+static DEVICE_ATTR(pwm3_enable, S_IRUGO | S_IWUSR, pwm1_enable_show,
+		   pwm1_enable_store);
+static DEVICE_ATTR_RW(temp1_auto_point1_pwm);
 static DEVICE_ATTR(temp2_auto_point1_pwm, S_IRUGO | S_IWUSR,
-	show_auto_pwm_min, set_auto_pwm_min);
+	temp1_auto_point1_pwm_show, temp1_auto_point1_pwm_store);
 static DEVICE_ATTR(temp3_auto_point1_pwm, S_IRUGO | S_IWUSR,
-	show_auto_pwm_min, set_auto_pwm_min);
+	temp1_auto_point1_pwm_show, temp1_auto_point1_pwm_store);
 
-static DEVICE_ATTR(temp1_auto_point2_pwm, S_IRUGO, show_auto_pwm_max, NULL);
-static DEVICE_ATTR(temp2_auto_point2_pwm, S_IRUGO, show_auto_pwm_max, NULL);
-static DEVICE_ATTR(temp3_auto_point2_pwm, S_IRUGO, show_auto_pwm_max, NULL);
+static DEVICE_ATTR_RO(temp1_auto_point2_pwm);
+static DEVICE_ATTR(temp2_auto_point2_pwm, S_IRUGO, temp1_auto_point2_pwm_show,
+		   NULL);
+static DEVICE_ATTR(temp3_auto_point2_pwm, S_IRUGO, temp1_auto_point2_pwm_show,
+		   NULL);
 
 static struct attribute *adm1026_attributes[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,

