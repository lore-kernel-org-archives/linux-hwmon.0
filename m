Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:60175 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S964895AbcLVM0y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:54 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/66] hwmon: (asb100) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:36 +0100
Message-Id: <1482408335-3435-8-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/asb100.c |   36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/asb100.c b/drivers/hwmon/asb100.c
index 272fcc8..62e1913 100644
--- a/drivers/hwmon/asb100.c
+++ b/drivers/hwmon/asb100.c
@@ -483,25 +483,25 @@ static SENSOR_DEVICE_ATTR(temp##num##_max_hyst, S_IRUGO | S_IWUSR, \
 sysfs_temp(4);
 
 /* VID */
-static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t cpu0_vid_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct asb100_data *data = asb100_update_device(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 
-static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
+static DEVICE_ATTR_RO(cpu0_vid);
 
 /* VRM */
-static ssize_t show_vrm(struct device *dev, struct device_attribute *attr,
+static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct asb100_data *data = dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", data->vrm);
 }
 
-static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t vrm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct asb100_data *data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -519,16 +519,16 @@ static ssize_t set_vrm(struct device *dev, struct device_attribute *attr,
 }
 
 /* Alarms */
-static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm, set_vrm);
+static DEVICE_ATTR_RW(vrm);
 
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct asb100_data *data = asb100_update_device(dev);
 	return sprintf(buf, "%u\n", data->alarms);
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -550,15 +550,15 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 13);
 
 /* 1 PWM */
-static ssize_t show_pwm1(struct device *dev, struct device_attribute *attr,
+static ssize_t pwm1_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
 {
 	struct asb100_data *data = asb100_update_device(dev);
 	return sprintf(buf, "%d\n", ASB100_PWM_FROM_REG(data->pwm & 0x0f));
 }
 
-static ssize_t set_pwm1(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t pwm1_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct asb100_data *data = i2c_get_clientdata(client);
@@ -577,15 +577,16 @@ static ssize_t set_pwm1(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_pwm_enable1(struct device *dev,
+static ssize_t pwm1_enable_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct asb100_data *data = asb100_update_device(dev);
 	return sprintf(buf, "%d\n", (data->pwm & 0x80) ? 1 : 0);
 }
 
-static ssize_t set_pwm_enable1(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct asb100_data *data = i2c_get_clientdata(client);
@@ -604,9 +605,8 @@ static ssize_t set_pwm_enable1(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm1, set_pwm1);
-static DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR,
-		show_pwm_enable1, set_pwm_enable1);
+static DEVICE_ATTR_RW(pwm1);
+static DEVICE_ATTR_RW(pwm1_enable);
 
 static struct attribute *asb100_attributes[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,

