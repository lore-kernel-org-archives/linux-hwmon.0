Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3903 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965174AbcLVM04 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:56 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 15/66] hwmon: (gpio-fan) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:04:44 +0100
Message-Id: <1482408335-3435-16-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/gpio-fan.c |   54 +++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 685568b..9c355b9 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -77,8 +77,8 @@ static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static ssize_t show_fan_alarm(struct device *dev,
-			      struct device_attribute *attr, char *buf)
+static ssize_t fan1_alarm_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 	struct gpio_fan_alarm *alarm = fan_data->alarm;
@@ -90,7 +90,7 @@ static ssize_t show_fan_alarm(struct device *dev,
 	return sprintf(buf, "%d\n", value);
 }
 
-static DEVICE_ATTR(fan1_alarm, S_IRUGO, show_fan_alarm, NULL);
+static DEVICE_ATTR_RO(fan1_alarm);
 
 static int fan_alarm_init(struct gpio_fan_data *fan_data,
 			  struct gpio_fan_alarm *alarm)
@@ -188,8 +188,8 @@ static int rpm_to_speed_index(struct gpio_fan_data *fan_data, unsigned long rpm)
 	return fan_data->num_speed - 1;
 }
 
-static ssize_t show_pwm(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t pwm1_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 	u8 pwm = fan_data->speed_index * 255 / (fan_data->num_speed - 1);
@@ -197,8 +197,8 @@ static ssize_t show_pwm(struct device *dev,
 	return sprintf(buf, "%d\n", pwm);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t pwm1_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 	unsigned long pwm;
@@ -224,16 +224,17 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	return ret;
 }
 
-static ssize_t show_pwm_enable(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t pwm1_enable_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%d\n", fan_data->pwm_enable);
 }
 
-static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
-			      const char *buf, size_t count)
+static ssize_t pwm1_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 	unsigned long val;
@@ -257,22 +258,22 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_pwm_mode(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t pwm1_mode_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	return sprintf(buf, "0\n");
 }
 
-static ssize_t show_rpm_min(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan1_min_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%d\n", fan_data->speed[0].rpm);
 }
 
-static ssize_t show_rpm_max(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+static ssize_t fan1_max_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 
@@ -280,8 +281,8 @@ static ssize_t show_rpm_max(struct device *dev,
 		       fan_data->speed[fan_data->num_speed - 1].rpm);
 }
 
-static ssize_t show_rpm(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t fan1_input_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
 
@@ -313,14 +314,13 @@ static ssize_t set_rpm(struct device *dev, struct device_attribute *attr,
 	return ret;
 }
 
-static DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm);
-static DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR,
-		   show_pwm_enable, set_pwm_enable);
-static DEVICE_ATTR(pwm1_mode, S_IRUGO, show_pwm_mode, NULL);
-static DEVICE_ATTR(fan1_min, S_IRUGO, show_rpm_min, NULL);
-static DEVICE_ATTR(fan1_max, S_IRUGO, show_rpm_max, NULL);
-static DEVICE_ATTR(fan1_input, S_IRUGO, show_rpm, NULL);
-static DEVICE_ATTR(fan1_target, S_IRUGO | S_IWUSR, show_rpm, set_rpm);
+static DEVICE_ATTR_RW(pwm1);
+static DEVICE_ATTR_RW(pwm1_enable);
+static DEVICE_ATTR_RO(pwm1_mode);
+static DEVICE_ATTR_RO(fan1_min);
+static DEVICE_ATTR_RO(fan1_max);
+static DEVICE_ATTR_RO(fan1_input);
+static DEVICE_ATTR(fan1_target, S_IRUGO | S_IWUSR, fan1_input_show, set_rpm);
 
 static umode_t gpio_fan_is_visible(struct kobject *kobj,
 				   struct attribute *attr, int index)

