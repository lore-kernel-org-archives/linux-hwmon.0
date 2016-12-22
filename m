Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3905 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965461AbcLVM1K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:10 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 62/66] hwmon: (max6650) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:31 +0100
Message-Id: <1482408335-3435-63-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/max6650.c |   44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index a993b44..65be4b1 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -270,8 +270,8 @@ static ssize_t get_fan(struct device *dev, struct device_attribute *devattr,
  * controlled.
  */
 
-static ssize_t get_target(struct device *dev, struct device_attribute *devattr,
-			 char *buf)
+static ssize_t fan1_target_show(struct device *dev,
+				struct device_attribute *devattr, char *buf)
 {
 	struct max6650_data *data = max6650_update_device(dev);
 	int kscale, ktach, rpm;
@@ -318,8 +318,9 @@ static int max6650_set_target(struct max6650_data *data, unsigned long rpm)
 					 data->speed);
 }
 
-static ssize_t set_target(struct device *dev, struct device_attribute *devattr,
-			 const char *buf, size_t count)
+static ssize_t fan1_target_store(struct device *dev,
+				 struct device_attribute *devattr,
+				 const char *buf, size_t count)
 {
 	struct max6650_data *data = dev_get_drvdata(dev);
 	unsigned long rpm;
@@ -350,8 +351,8 @@ static ssize_t set_target(struct device *dev, struct device_attribute *devattr,
  * back exactly the value you have set.
  */
 
-static ssize_t get_pwm(struct device *dev, struct device_attribute *devattr,
-		       char *buf)
+static ssize_t pwm1_show(struct device *dev, struct device_attribute *devattr,
+			 char *buf)
 {
 	int pwm;
 	struct max6650_data *data = max6650_update_device(dev);
@@ -371,8 +372,9 @@ static ssize_t get_pwm(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", pwm);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
-			const char *buf, size_t count)
+static ssize_t pwm1_store(struct device *dev,
+			  struct device_attribute *devattr, const char *buf,
+			  size_t count)
 {
 	struct max6650_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -406,8 +408,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
  * 2 = Closed loop, RPM for all fans regulated by fan1 tachometer
  * 3 = Fan off
  */
-static ssize_t get_enable(struct device *dev, struct device_attribute *devattr,
-			  char *buf)
+static ssize_t pwm1_enable_show(struct device *dev,
+				struct device_attribute *devattr, char *buf)
 {
 	struct max6650_data *data = max6650_update_device(dev);
 	int mode = (data->config & MAX6650_CFG_MODE_MASK) >> 4;
@@ -416,8 +418,9 @@ static ssize_t get_enable(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%d\n", sysfs_modes[mode]);
 }
 
-static ssize_t set_enable(struct device *dev, struct device_attribute *devattr,
-			  const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *devattr,
+				 const char *buf, size_t count)
 {
 	struct max6650_data *data = dev_get_drvdata(dev);
 	unsigned long mode;
@@ -458,16 +461,17 @@ static ssize_t set_enable(struct device *dev, struct device_attribute *devattr,
  * defined for that. See the data sheet for details.
  */
 
-static ssize_t get_div(struct device *dev, struct device_attribute *devattr,
-		       char *buf)
+static ssize_t fan1_div_show(struct device *dev,
+			     struct device_attribute *devattr, char *buf)
 {
 	struct max6650_data *data = max6650_update_device(dev);
 
 	return sprintf(buf, "%d\n", DIV_FROM_REG(data->count));
 }
 
-static ssize_t set_div(struct device *dev, struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static ssize_t fan1_div_store(struct device *dev,
+			      struct device_attribute *devattr,
+			      const char *buf, size_t count)
 {
 	struct max6650_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -534,10 +538,10 @@ static ssize_t get_alarm(struct device *dev, struct device_attribute *devattr,
 static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
 static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
 static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
-static DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO, get_target, set_target);
-static DEVICE_ATTR(fan1_div, S_IWUSR | S_IRUGO, get_div, set_div);
-static DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, get_enable, set_enable);
-static DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm);
+static DEVICE_ATTR_RW(fan1_target);
+static DEVICE_ATTR_RW(fan1_div);
+static DEVICE_ATTR_RW(pwm1_enable);
+static DEVICE_ATTR_RW(pwm1);
 static SENSOR_DEVICE_ATTR(fan1_max_alarm, S_IRUGO, get_alarm, NULL,
 			  MAX6650_ALRM_MAX);
 static SENSOR_DEVICE_ATTR(fan1_min_alarm, S_IRUGO, get_alarm, NULL,

