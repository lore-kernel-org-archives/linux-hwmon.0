Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:60175 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965373AbcLVM1E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:27:04 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 26/66] hwmon: (lm93) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:55 +0100
Message-Id: <1482408335-3435-27-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/lm93.c |   39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 90bb048..77a0a83 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -2156,7 +2156,7 @@ static SENSOR_DEVICE_ATTR(pwm2_auto_spinup_time, S_IWUSR | S_IRUGO,
 			  show_pwm_auto_spinup_time,
 			  store_pwm_auto_spinup_time, 1);
 
-static ssize_t show_pwm_auto_prochot_ramp(struct device *dev,
+static ssize_t pwm_auto_prochot_ramp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2164,7 +2164,7 @@ static ssize_t show_pwm_auto_prochot_ramp(struct device *dev,
 		       LM93_RAMP_FROM_REG(data->pwm_ramp_ctl >> 4 & 0x0f));
 }
 
-static ssize_t store_pwm_auto_prochot_ramp(struct device *dev,
+static ssize_t pwm_auto_prochot_ramp_store(struct device *dev,
 						struct device_attribute *attr,
 						const char *buf, size_t count)
 {
@@ -2186,11 +2186,9 @@ static ssize_t store_pwm_auto_prochot_ramp(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(pwm_auto_prochot_ramp, S_IRUGO | S_IWUSR,
-			show_pwm_auto_prochot_ramp,
-			store_pwm_auto_prochot_ramp);
+static DEVICE_ATTR_RW(pwm_auto_prochot_ramp);
 
-static ssize_t show_pwm_auto_vrdhot_ramp(struct device *dev,
+static ssize_t pwm_auto_vrdhot_ramp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
@@ -2198,7 +2196,7 @@ static ssize_t show_pwm_auto_vrdhot_ramp(struct device *dev,
 		       LM93_RAMP_FROM_REG(data->pwm_ramp_ctl & 0x0f));
 }
 
-static ssize_t store_pwm_auto_vrdhot_ramp(struct device *dev,
+static ssize_t pwm_auto_vrdhot_ramp_store(struct device *dev,
 						struct device_attribute *attr,
 						const char *buf, size_t count)
 {
@@ -2220,9 +2218,7 @@ static ssize_t store_pwm_auto_vrdhot_ramp(struct device *dev,
 	return 0;
 }
 
-static DEVICE_ATTR(pwm_auto_vrdhot_ramp, S_IRUGO | S_IWUSR,
-			show_pwm_auto_vrdhot_ramp,
-			store_pwm_auto_vrdhot_ramp);
+static DEVICE_ATTR_RW(pwm_auto_vrdhot_ramp);
 
 static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
 			char *buf)
@@ -2378,7 +2374,7 @@ static SENSOR_DEVICE_ATTR(prochot1_interval, S_IWUSR | S_IRUGO,
 static SENSOR_DEVICE_ATTR(prochot2_interval, S_IWUSR | S_IRUGO,
 			  show_prochot_interval, store_prochot_interval, 1);
 
-static ssize_t show_prochot_override_duty_cycle(struct device *dev,
+static ssize_t prochot_override_duty_cycle_show(struct device *dev,
 						struct device_attribute *attr,
 						char *buf)
 {
@@ -2386,7 +2382,7 @@ static ssize_t show_prochot_override_duty_cycle(struct device *dev,
 	return sprintf(buf, "%d\n", data->prochot_override & 0x0f);
 }
 
-static ssize_t store_prochot_override_duty_cycle(struct device *dev,
+static ssize_t prochot_override_duty_cycle_store(struct device *dev,
 						struct device_attribute *attr,
 						const char *buf, size_t count)
 {
@@ -2408,18 +2404,16 @@ static ssize_t store_prochot_override_duty_cycle(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(prochot_override_duty_cycle, S_IRUGO | S_IWUSR,
-			show_prochot_override_duty_cycle,
-			store_prochot_override_duty_cycle);
+static DEVICE_ATTR_RW(prochot_override_duty_cycle);
 
-static ssize_t show_prochot_short(struct device *dev,
+static ssize_t prochot_short_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", (data->config & 0x10) ? 1 : 0);
 }
 
-static ssize_t store_prochot_short(struct device *dev,
+static ssize_t prochot_short_store(struct device *dev,
 					struct device_attribute *attr,
 					const char *buf, size_t count)
 {
@@ -2442,8 +2436,7 @@ static ssize_t store_prochot_short(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(prochot_short, S_IRUGO | S_IWUSR,
-		   show_prochot_short, store_prochot_short);
+static DEVICE_ATTR_RW(prochot_short);
 
 static ssize_t show_vrdhot(struct device *dev, struct device_attribute *attr,
 				char *buf)
@@ -2457,23 +2450,23 @@ static ssize_t show_vrdhot(struct device *dev, struct device_attribute *attr,
 static SENSOR_DEVICE_ATTR(vrdhot1, S_IRUGO, show_vrdhot, NULL, 0);
 static SENSOR_DEVICE_ATTR(vrdhot2, S_IRUGO, show_vrdhot, NULL, 1);
 
-static ssize_t show_gpio(struct device *dev, struct device_attribute *attr,
+static ssize_t gpio_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", LM93_GPI_FROM_REG(data->gpi));
 }
 
-static DEVICE_ATTR(gpio, S_IRUGO, show_gpio, NULL);
+static DEVICE_ATTR_RO(gpio);
 
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
 	return sprintf(buf, "%d\n", LM93_ALARMS_FROM_REG(data->block1));
 }
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 
 static struct attribute *lm93_attrs[] = {
 	&sensor_dev_attr_in1_input.dev_attr.attr,

