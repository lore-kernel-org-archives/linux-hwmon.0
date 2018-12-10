Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46065 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729387AbeLJWJW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:09:22 -0500
Received: by mail-pg1-f196.google.com with SMTP id y4so5600328pgc.12
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:09:22 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Subject: [PATCH 21/30] hwmon: (da9052-hwmon) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:39 -0800
Message-Id: <1544479728-30077-22-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/da9052-hwmon.c | 105 ++++++++++++++++---------------------------
 1 file changed, 39 insertions(+), 66 deletions(-)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index a973eb6a2890..8ec5bf4ce392 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -87,7 +87,7 @@ static inline int da9052_disable_vddout_channel(struct da9052 *da9052)
 				 DA9052_ADCCONT_AUTOVDDEN, 0);
 }
 
-static ssize_t da9052_read_vddout(struct device *dev,
+static ssize_t da9052_vddout_show(struct device *dev,
 				  struct device_attribute *devattr, char *buf)
 {
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
@@ -119,7 +119,7 @@ static ssize_t da9052_read_vddout(struct device *dev,
 	return ret;
 }
 
-static ssize_t da9052_read_ich(struct device *dev,
+static ssize_t da9052_ich_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
@@ -133,7 +133,7 @@ static ssize_t da9052_read_ich(struct device *dev,
 	return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(ret * 39, 10));
 }
 
-static ssize_t da9052_read_tbat(struct device *dev,
+static ssize_t da9052_tbat_show(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
@@ -141,7 +141,7 @@ static ssize_t da9052_read_tbat(struct device *dev,
 	return sprintf(buf, "%d\n", da9052_adc_read_temp(hwmon->da9052));
 }
 
-static ssize_t da9052_read_vbat(struct device *dev,
+static ssize_t da9052_vbat_show(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
@@ -154,7 +154,7 @@ static ssize_t da9052_read_vbat(struct device *dev,
 	return sprintf(buf, "%d\n", volt_reg_to_mv(ret));
 }
 
-static ssize_t da9052_read_misc_channel(struct device *dev,
+static ssize_t da9052_misc_channel_show(struct device *dev,
 					struct device_attribute *devattr,
 					char *buf)
 {
@@ -242,9 +242,8 @@ static ssize_t __da9052_read_tsi(struct device *dev, int channel)
 	return da9052_get_tsi_result(hwmon, channel);
 }
 
-static ssize_t da9052_read_tsi(struct device *dev,
-			       struct device_attribute *devattr,
-			       char *buf)
+static ssize_t da9052_tsi_show(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
 {
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
 	int channel = to_sensor_dev_attr(devattr)->index;
@@ -260,7 +259,7 @@ static ssize_t da9052_read_tsi(struct device *dev,
 		return sprintf(buf, "%d\n", input_tsireg_to_mv(hwmon, ret));
 }
 
-static ssize_t da9052_read_tjunc(struct device *dev,
+static ssize_t da9052_tjunc_show(struct device *dev,
 				 struct device_attribute *devattr, char *buf)
 {
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
@@ -282,7 +281,7 @@ static ssize_t da9052_read_tjunc(struct device *dev,
 	return sprintf(buf, "%d\n", 1708 * (tjunc - toffset) - 108800);
 }
 
-static ssize_t da9052_read_vbbat(struct device *dev,
+static ssize_t da9052_vbbat_show(struct device *dev,
 				 struct device_attribute *devattr, char *buf)
 {
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
@@ -295,7 +294,7 @@ static ssize_t da9052_read_vbbat(struct device *dev,
 	return sprintf(buf, "%d\n", vbbat_reg_to_mv(ret));
 }
 
-static ssize_t show_label(struct device *dev,
+static ssize_t label_show(struct device *dev,
 			  struct device_attribute *devattr, char *buf)
 {
 	return sprintf(buf, "%s\n",
@@ -324,61 +323,35 @@ static umode_t da9052_channel_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static SENSOR_DEVICE_ATTR(in0_input, 0444, da9052_read_vddout, NULL,
-			  DA9052_ADC_VDDOUT);
-static SENSOR_DEVICE_ATTR(in0_label, 0444, show_label, NULL,
-			  DA9052_ADC_VDDOUT);
-static SENSOR_DEVICE_ATTR(in3_input, 0444, da9052_read_vbat, NULL,
-			  DA9052_ADC_VBAT);
-static SENSOR_DEVICE_ATTR(in3_label, 0444, show_label, NULL,
-			  DA9052_ADC_VBAT);
-static SENSOR_DEVICE_ATTR(in4_input, 0444, da9052_read_misc_channel, NULL,
-			  DA9052_ADC_IN4);
-static SENSOR_DEVICE_ATTR(in4_label, 0444, show_label, NULL,
-			  DA9052_ADC_IN4);
-static SENSOR_DEVICE_ATTR(in5_input, 0444, da9052_read_misc_channel, NULL,
-			  DA9052_ADC_IN5);
-static SENSOR_DEVICE_ATTR(in5_label, 0444, show_label, NULL,
-			  DA9052_ADC_IN5);
-static SENSOR_DEVICE_ATTR(in6_input, 0444, da9052_read_misc_channel, NULL,
-			  DA9052_ADC_IN6);
-static SENSOR_DEVICE_ATTR(in6_label, 0444, show_label, NULL,
-			  DA9052_ADC_IN6);
-static SENSOR_DEVICE_ATTR(in9_input, 0444, da9052_read_vbbat, NULL,
-			  DA9052_ADC_VBBAT);
-static SENSOR_DEVICE_ATTR(in9_label, 0444, show_label, NULL,
-			  DA9052_ADC_VBBAT);
-
-static SENSOR_DEVICE_ATTR(in70_input, 0444, da9052_read_tsi, NULL,
-			  DA9052_ADC_TSI_XP);
-static SENSOR_DEVICE_ATTR(in70_label, 0444, show_label, NULL,
-			  DA9052_ADC_TSI_XP);
-static SENSOR_DEVICE_ATTR(in71_input, 0444, da9052_read_tsi, NULL,
-			  DA9052_ADC_TSI_XN);
-static SENSOR_DEVICE_ATTR(in71_label, 0444, show_label, NULL,
-			  DA9052_ADC_TSI_XN);
-static SENSOR_DEVICE_ATTR(in72_input, 0444, da9052_read_tsi, NULL,
-			  DA9052_ADC_TSI_YP);
-static SENSOR_DEVICE_ATTR(in72_label, 0444, show_label, NULL,
-			  DA9052_ADC_TSI_YP);
-static SENSOR_DEVICE_ATTR(in73_input, 0444, da9052_read_tsi, NULL,
-			  DA9052_ADC_TSI_YN);
-static SENSOR_DEVICE_ATTR(in73_label, 0444, show_label, NULL,
-			  DA9052_ADC_TSI_YN);
-
-static SENSOR_DEVICE_ATTR(curr1_input, 0444, da9052_read_ich, NULL,
-			  DA9052_ADC_ICH);
-static SENSOR_DEVICE_ATTR(curr1_label, 0444, show_label, NULL,
-			  DA9052_ADC_ICH);
-
-static SENSOR_DEVICE_ATTR(temp2_input, 0444, da9052_read_tbat, NULL,
-			  DA9052_ADC_TBAT);
-static SENSOR_DEVICE_ATTR(temp2_label, 0444, show_label, NULL,
-			  DA9052_ADC_TBAT);
-static SENSOR_DEVICE_ATTR(temp8_input, 0444, da9052_read_tjunc, NULL,
-			  DA9052_ADC_TJUNC);
-static SENSOR_DEVICE_ATTR(temp8_label, 0444, show_label, NULL,
-			  DA9052_ADC_TJUNC);
+static SENSOR_DEVICE_ATTR_RO(in0_input, da9052_vddout, DA9052_ADC_VDDOUT);
+static SENSOR_DEVICE_ATTR_RO(in0_label, label, DA9052_ADC_VDDOUT);
+static SENSOR_DEVICE_ATTR_RO(in3_input, da9052_vbat, DA9052_ADC_VBAT);
+static SENSOR_DEVICE_ATTR_RO(in3_label, label, DA9052_ADC_VBAT);
+static SENSOR_DEVICE_ATTR_RO(in4_input, da9052_misc_channel, DA9052_ADC_IN4);
+static SENSOR_DEVICE_ATTR_RO(in4_label, label, DA9052_ADC_IN4);
+static SENSOR_DEVICE_ATTR_RO(in5_input, da9052_misc_channel, DA9052_ADC_IN5);
+static SENSOR_DEVICE_ATTR_RO(in5_label, label, DA9052_ADC_IN5);
+static SENSOR_DEVICE_ATTR_RO(in6_input, da9052_misc_channel, DA9052_ADC_IN6);
+static SENSOR_DEVICE_ATTR_RO(in6_label, label, DA9052_ADC_IN6);
+static SENSOR_DEVICE_ATTR_RO(in9_input, da9052_vbbat, DA9052_ADC_VBBAT);
+static SENSOR_DEVICE_ATTR_RO(in9_label, label, DA9052_ADC_VBBAT);
+
+static SENSOR_DEVICE_ATTR_RO(in70_input, da9052_tsi, DA9052_ADC_TSI_XP);
+static SENSOR_DEVICE_ATTR_RO(in70_label, label, DA9052_ADC_TSI_XP);
+static SENSOR_DEVICE_ATTR_RO(in71_input, da9052_tsi, DA9052_ADC_TSI_XN);
+static SENSOR_DEVICE_ATTR_RO(in71_label, label, DA9052_ADC_TSI_XN);
+static SENSOR_DEVICE_ATTR_RO(in72_input, da9052_tsi, DA9052_ADC_TSI_YP);
+static SENSOR_DEVICE_ATTR_RO(in72_label, label, DA9052_ADC_TSI_YP);
+static SENSOR_DEVICE_ATTR_RO(in73_input, da9052_tsi, DA9052_ADC_TSI_YN);
+static SENSOR_DEVICE_ATTR_RO(in73_label, label, DA9052_ADC_TSI_YN);
+
+static SENSOR_DEVICE_ATTR_RO(curr1_input, da9052_ich, DA9052_ADC_ICH);
+static SENSOR_DEVICE_ATTR_RO(curr1_label, label, DA9052_ADC_ICH);
+
+static SENSOR_DEVICE_ATTR_RO(temp2_input, da9052_tbat, DA9052_ADC_TBAT);
+static SENSOR_DEVICE_ATTR_RO(temp2_label, label, DA9052_ADC_TBAT);
+static SENSOR_DEVICE_ATTR_RO(temp8_input, da9052_tjunc, DA9052_ADC_TJUNC);
+static SENSOR_DEVICE_ATTR_RO(temp8_label, label, DA9052_ADC_TJUNC);
 
 static struct attribute *da9052_attrs[] = {
 	&sensor_dev_attr_in0_input.dev_attr.attr,
-- 
2.7.4
