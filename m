Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38479 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729387AbeLJWJY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:24 -0500
Received: by mail-pg1-f194.google.com with SMTP id g189so5621799pgc.5
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:23 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Subject: [PATCH 22/30] hwmon: (da9055-hwmon) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:40 -0800
Message-Id: <1544479728-30077-23-git-send-email-linux@roeck-us.net>
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

Cc: Support Opensource <support.opensource@diasemi.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/da9055-hwmon.c | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/da9055-hwmon.c b/drivers/hwmon/da9055-hwmon.c
index f6e159cabe23..4de6de683908 100644
--- a/drivers/hwmon/da9055-hwmon.c
+++ b/drivers/hwmon/da9055-hwmon.c
@@ -140,8 +140,9 @@ static int da9055_disable_auto_mode(struct da9055 *da9055, int channel)
 	return da9055_reg_update(da9055, DA9055_REG_ADC_CONT, 1 << channel, 0);
 }
 
-static ssize_t da9055_read_auto_ch(struct device *dev,
-				struct device_attribute *devattr, char *buf)
+static ssize_t da9055_auto_ch_show(struct device *dev,
+				   struct device_attribute *devattr,
+				   char *buf)
 {
 	struct da9055_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret, adc;
@@ -176,7 +177,7 @@ static ssize_t da9055_read_auto_ch(struct device *dev,
 	return ret;
 }
 
-static ssize_t da9055_read_tjunc(struct device *dev,
+static ssize_t da9055_tjunc_show(struct device *dev,
 				 struct device_attribute *devattr, char *buf)
 {
 	struct da9055_hwmon *hwmon = dev_get_drvdata(dev);
@@ -199,34 +200,24 @@ static ssize_t da9055_read_tjunc(struct device *dev,
 							+ 3076332, 10000));
 }
 
-static ssize_t show_label(struct device *dev,
+static ssize_t label_show(struct device *dev,
 			  struct device_attribute *devattr, char *buf)
 {
 	return sprintf(buf, "%s\n",
 		       input_names[to_sensor_dev_attr(devattr)->index]);
 }
 
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, da9055_read_auto_ch, NULL,
-			  DA9055_ADC_VSYS);
-static SENSOR_DEVICE_ATTR(in0_label, S_IRUGO, show_label, NULL,
-			  DA9055_ADC_VSYS);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, da9055_read_auto_ch, NULL,
-			  DA9055_ADC_ADCIN1);
-static SENSOR_DEVICE_ATTR(in1_label, S_IRUGO, show_label, NULL,
-			  DA9055_ADC_ADCIN1);
-static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, da9055_read_auto_ch, NULL,
-			  DA9055_ADC_ADCIN2);
-static SENSOR_DEVICE_ATTR(in2_label, S_IRUGO, show_label, NULL,
-			  DA9055_ADC_ADCIN2);
-static SENSOR_DEVICE_ATTR(in3_input, S_IRUGO, da9055_read_auto_ch, NULL,
-			  DA9055_ADC_ADCIN3);
-static SENSOR_DEVICE_ATTR(in3_label, S_IRUGO, show_label, NULL,
-			  DA9055_ADC_ADCIN3);
-
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, da9055_read_tjunc, NULL,
-			  DA9055_ADC_TJUNC);
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_label, NULL,
-			  DA9055_ADC_TJUNC);
+static SENSOR_DEVICE_ATTR_RO(in0_input, da9055_auto_ch, DA9055_ADC_VSYS);
+static SENSOR_DEVICE_ATTR_RO(in0_label, label, DA9055_ADC_VSYS);
+static SENSOR_DEVICE_ATTR_RO(in1_input, da9055_auto_ch, DA9055_ADC_ADCIN1);
+static SENSOR_DEVICE_ATTR_RO(in1_label, label, DA9055_ADC_ADCIN1);
+static SENSOR_DEVICE_ATTR_RO(in2_input, da9055_auto_ch, DA9055_ADC_ADCIN2);
+static SENSOR_DEVICE_ATTR_RO(in2_label, label, DA9055_ADC_ADCIN2);
+static SENSOR_DEVICE_ATTR_RO(in3_input, da9055_auto_ch, DA9055_ADC_ADCIN3);
+static SENSOR_DEVICE_ATTR_RO(in3_label, label, DA9055_ADC_ADCIN3);
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, da9055_tjunc, DA9055_ADC_TJUNC);
+static SENSOR_DEVICE_ATTR_RO(temp1_label, label, DA9055_ADC_TJUNC);
 
 static struct attribute *da9055_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4
