Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34060 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbeLJWJS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:18 -0500
Received: by mail-pl1-f195.google.com with SMTP id w4so5905519plz.1
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:18 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 18/30] hwmon: (aspeed-pwm-tacho) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:36 -0800
Message-Id: <1544479728-30077-19-git-send-email-linux@roeck-us.net>
In-Reply-To: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
References: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 80 ++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 52 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 92de8139d398..c4dd6301e7c8 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -570,8 +570,8 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 	return (clk_source * 60) / (2 * raw_data * tach_div);
 }
 
-static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int index = sensor_attr->index;
@@ -595,7 +595,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
+static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
@@ -605,7 +605,7 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%u\n", priv->pwm_port_fan_ctrl[index]);
 }
 
-static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
+static ssize_t rpm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
@@ -642,22 +642,14 @@ static umode_t fan_dev_is_visible(struct kobject *kobj,
 	return a->mode;
 }
 
-static SENSOR_DEVICE_ATTR(pwm1, 0644,
-			show_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, 0644,
-			show_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, 0644,
-			show_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm4, 0644,
-			show_pwm, set_pwm, 3);
-static SENSOR_DEVICE_ATTR(pwm5, 0644,
-			show_pwm, set_pwm, 4);
-static SENSOR_DEVICE_ATTR(pwm6, 0644,
-			show_pwm, set_pwm, 5);
-static SENSOR_DEVICE_ATTR(pwm7, 0644,
-			show_pwm, set_pwm, 6);
-static SENSOR_DEVICE_ATTR(pwm8, 0644,
-			show_pwm, set_pwm, 7);
+static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
+static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
+static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
+static SENSOR_DEVICE_ATTR_RW(pwm5, pwm, 4);
+static SENSOR_DEVICE_ATTR_RW(pwm6, pwm, 5);
+static SENSOR_DEVICE_ATTR_RW(pwm7, pwm, 6);
+static SENSOR_DEVICE_ATTR_RW(pwm8, pwm, 7);
 static struct attribute *pwm_dev_attrs[] = {
 	&sensor_dev_attr_pwm1.dev_attr.attr,
 	&sensor_dev_attr_pwm2.dev_attr.attr,
@@ -675,38 +667,22 @@ static const struct attribute_group pwm_dev_group = {
 	.is_visible = pwm_is_visible,
 };
 
-static SENSOR_DEVICE_ATTR(fan1_input, 0444,
-		show_rpm, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, 0444,
-		show_rpm, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, 0444,
-		show_rpm, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, 0444,
-		show_rpm, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input, 0444,
-		show_rpm, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input, 0444,
-		show_rpm, NULL, 5);
-static SENSOR_DEVICE_ATTR(fan7_input, 0444,
-		show_rpm, NULL, 6);
-static SENSOR_DEVICE_ATTR(fan8_input, 0444,
-		show_rpm, NULL, 7);
-static SENSOR_DEVICE_ATTR(fan9_input, 0444,
-		show_rpm, NULL, 8);
-static SENSOR_DEVICE_ATTR(fan10_input, 0444,
-		show_rpm, NULL, 9);
-static SENSOR_DEVICE_ATTR(fan11_input, 0444,
-		show_rpm, NULL, 10);
-static SENSOR_DEVICE_ATTR(fan12_input, 0444,
-		show_rpm, NULL, 11);
-static SENSOR_DEVICE_ATTR(fan13_input, 0444,
-		show_rpm, NULL, 12);
-static SENSOR_DEVICE_ATTR(fan14_input, 0444,
-		show_rpm, NULL, 13);
-static SENSOR_DEVICE_ATTR(fan15_input, 0444,
-		show_rpm, NULL, 14);
-static SENSOR_DEVICE_ATTR(fan16_input, 0444,
-		show_rpm, NULL, 15);
+static SENSOR_DEVICE_ATTR_RO(fan1_input, rpm, 0);
+static SENSOR_DEVICE_ATTR_RO(fan2_input, rpm, 1);
+static SENSOR_DEVICE_ATTR_RO(fan3_input, rpm, 2);
+static SENSOR_DEVICE_ATTR_RO(fan4_input, rpm, 3);
+static SENSOR_DEVICE_ATTR_RO(fan5_input, rpm, 4);
+static SENSOR_DEVICE_ATTR_RO(fan6_input, rpm, 5);
+static SENSOR_DEVICE_ATTR_RO(fan7_input, rpm, 6);
+static SENSOR_DEVICE_ATTR_RO(fan8_input, rpm, 7);
+static SENSOR_DEVICE_ATTR_RO(fan9_input, rpm, 8);
+static SENSOR_DEVICE_ATTR_RO(fan10_input, rpm, 9);
+static SENSOR_DEVICE_ATTR_RO(fan11_input, rpm, 10);
+static SENSOR_DEVICE_ATTR_RO(fan12_input, rpm, 11);
+static SENSOR_DEVICE_ATTR_RO(fan13_input, rpm, 12);
+static SENSOR_DEVICE_ATTR_RO(fan14_input, rpm, 13);
+static SENSOR_DEVICE_ATTR_RO(fan15_input, rpm, 14);
+static SENSOR_DEVICE_ATTR_RO(fan16_input, rpm, 15);
 static struct attribute *fan_dev_attrs[] = {
 	&sensor_dev_attr_fan1_input.dev_attr.attr,
 	&sensor_dev_attr_fan2_input.dev_attr.attr,
-- 
2.7.4
