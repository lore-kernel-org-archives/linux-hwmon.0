Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63945 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965456AbcLVM1K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:10 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Steve Glendinning <steve.glendinning@shawell.net>
Cc: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 61/66] hwmon: (emc2103) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:30 +0100
Message-Id: <1482408335-3435-62-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/emc2103.c |   36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index 4b870ee..1ed9a7a 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -284,7 +284,7 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *da,
 }
 
 static ssize_t
-show_fan(struct device *dev, struct device_attribute *da, char *buf)
+fan1_input_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	int rpm = 0;
@@ -294,7 +294,7 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *da,
 }
 
 static ssize_t
-show_fan_div(struct device *dev, struct device_attribute *da, char *buf)
+fan1_div_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	int fan_div = 8 / data->fan_multiplier;
@@ -307,8 +307,8 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *da,
  * of least surprise; the user doesn't expect the fan target to change just
  * because the divider changed.
  */
-static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
-			   const char *buf, size_t count)
+static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
+			      const char *buf, size_t count)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	struct i2c_client *client = data->client;
@@ -369,7 +369,7 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
 }
 
 static ssize_t
-show_fan_target(struct device *dev, struct device_attribute *da, char *buf)
+fan1_target_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	int rpm = 0;
@@ -382,8 +382,9 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *da,
 	return sprintf(buf, "%d\n", rpm);
 }
 
-static ssize_t set_fan_target(struct device *dev, struct device_attribute *da,
-			      const char *buf, size_t count)
+static ssize_t fan1_target_store(struct device *dev,
+				 struct device_attribute *da, const char *buf,
+				 size_t count)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	struct i2c_client *client = data->client;
@@ -412,7 +413,7 @@ static ssize_t set_fan_target(struct device *dev, struct device_attribute *da,
 }
 
 static ssize_t
-show_fan_fault(struct device *dev, struct device_attribute *da, char *buf)
+fan1_fault_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	bool fault = ((data->fan_tach & 0x1fe0) == 0x1fe0);
@@ -420,14 +421,15 @@ static ssize_t set_fan_target(struct device *dev, struct device_attribute *da,
 }
 
 static ssize_t
-show_pwm_enable(struct device *dev, struct device_attribute *da, char *buf)
+pwm1_enable_show(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct emc2103_data *data = emc2103_update_device(dev);
 	return sprintf(buf, "%d\n", data->fan_rpm_control ? 3 : 0);
 }
 
-static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *da,
-			      const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *da, const char *buf,
+				 size_t count)
 {
 	struct emc2103_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
@@ -512,14 +514,12 @@ static SENSOR_DEVICE_ATTR(temp4_min_alarm, S_IRUGO, show_temp_min_alarm,
 static SENSOR_DEVICE_ATTR(temp4_max_alarm, S_IRUGO, show_temp_max_alarm,
 	NULL, 3);
 
-static DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL);
-static DEVICE_ATTR(fan1_div, S_IRUGO | S_IWUSR, show_fan_div, set_fan_div);
-static DEVICE_ATTR(fan1_target, S_IRUGO | S_IWUSR, show_fan_target,
-	set_fan_target);
-static DEVICE_ATTR(fan1_fault, S_IRUGO, show_fan_fault, NULL);
+static DEVICE_ATTR_RO(fan1_input);
+static DEVICE_ATTR_RW(fan1_div);
+static DEVICE_ATTR_RW(fan1_target);
+static DEVICE_ATTR_RO(fan1_fault);
 
-static DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR, show_pwm_enable,
-	set_pwm_enable);
+static DEVICE_ATTR_RW(pwm1_enable);
 
 /* sensors present on all models */
 static struct attribute *emc2103_attributes[] = {

