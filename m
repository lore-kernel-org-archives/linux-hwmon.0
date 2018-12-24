Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from devianza.investici.org ([198.167.222.108]:47640 "EHLO
        devianza.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbeLXQRv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Dec 2018 11:17:51 -0500
From: Michele Sorcinelli <michelesr@autistici.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-hwmon@vger.kernel.org,
        Michele Sorcinelli <michelesr@autistici.org>
Subject: [PATCH v5] dell-smm-hwmon.c: Support up to 10 temp sensors
Date: Mon, 24 Dec 2018 16:15:00 +0000
Message-Id: <20181224161459.8680-1-michelesr@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Changelog:

- v1: use i8k_get_temp() to probe temperature sensors
- v2: fix wrong index ranges in i8k_is_visible() if conditions
- v3: use i8k_get_temp_type() to probe temperature sensors as
      i8k_get_temp() is not reliable (for example it won't
      work when sensors are turned off)
- v4: rm wrong exec bit in dell-smm-hwmon.c and rebase
      from linux-next tree

Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 97 ++++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 68c9a6664557..a6a38ceec174 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -82,9 +82,15 @@ static bool disallow_fan_support;
 #define I8K_HWMON_HAVE_TEMP2	(1 << 1)
 #define I8K_HWMON_HAVE_TEMP3	(1 << 2)
 #define I8K_HWMON_HAVE_TEMP4	(1 << 3)
-#define I8K_HWMON_HAVE_FAN1	(1 << 4)
-#define I8K_HWMON_HAVE_FAN2	(1 << 5)
-#define I8K_HWMON_HAVE_FAN3	(1 << 6)
+#define I8K_HWMON_HAVE_TEMP5	(1 << 4)
+#define I8K_HWMON_HAVE_TEMP6	(1 << 5)
+#define I8K_HWMON_HAVE_TEMP7	(1 << 6)
+#define I8K_HWMON_HAVE_TEMP8	(1 << 7)
+#define I8K_HWMON_HAVE_TEMP9	(1 << 8)
+#define I8K_HWMON_HAVE_TEMP10	(1 << 9)
+#define I8K_HWMON_HAVE_FAN1	(1 << 10)
+#define I8K_HWMON_HAVE_FAN2	(1 << 11)
+#define I8K_HWMON_HAVE_FAN3	(1 << 12)

 MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
 MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
@@ -737,6 +743,18 @@ static SENSOR_DEVICE_ATTR_RO(temp3_input, i8k_hwmon_temp, 2);
 static SENSOR_DEVICE_ATTR_RO(temp3_label, i8k_hwmon_temp_label, 2);
 static SENSOR_DEVICE_ATTR_RO(temp4_input, i8k_hwmon_temp, 3);
 static SENSOR_DEVICE_ATTR_RO(temp4_label, i8k_hwmon_temp_label, 3);
+static SENSOR_DEVICE_ATTR_RO(temp5_input, i8k_hwmon_temp, 4);
+static SENSOR_DEVICE_ATTR_RO(temp5_label, i8k_hwmon_temp_label, 4);
+static SENSOR_DEVICE_ATTR_RO(temp6_input, i8k_hwmon_temp, 5);
+static SENSOR_DEVICE_ATTR_RO(temp6_label, i8k_hwmon_temp_label, 5);
+static SENSOR_DEVICE_ATTR_RO(temp7_input, i8k_hwmon_temp, 6);
+static SENSOR_DEVICE_ATTR_RO(temp7_label, i8k_hwmon_temp_label, 6);
+static SENSOR_DEVICE_ATTR_RO(temp8_input, i8k_hwmon_temp, 7);
+static SENSOR_DEVICE_ATTR_RO(temp8_label, i8k_hwmon_temp_label, 7);
+static SENSOR_DEVICE_ATTR_RO(temp9_input, i8k_hwmon_temp, 8);
+static SENSOR_DEVICE_ATTR_RO(temp9_label, i8k_hwmon_temp_label, 8);
+static SENSOR_DEVICE_ATTR_RO(temp10_input, i8k_hwmon_temp, 9);
+static SENSOR_DEVICE_ATTR_RO(temp10_label, i8k_hwmon_temp_label, 9);
 static SENSOR_DEVICE_ATTR_RO(fan1_input, i8k_hwmon_fan, 0);
 static SENSOR_DEVICE_ATTR_RO(fan1_label, i8k_hwmon_fan_label, 0);
 static SENSOR_DEVICE_ATTR_RW(pwm1, i8k_hwmon_pwm, 0);
@@ -756,15 +774,27 @@ static struct attribute *i8k_attrs[] = {
 	&sensor_dev_attr_temp3_label.dev_attr.attr,	/* 5 */
 	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 6 */
 	&sensor_dev_attr_temp4_label.dev_attr.attr,	/* 7 */
-	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 8 */
-	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 9 */
-	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 10 */
-	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
-	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
-	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
-	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
-	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
-	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
+	&sensor_dev_attr_temp5_input.dev_attr.attr,	/* 8 */
+	&sensor_dev_attr_temp5_label.dev_attr.attr,	/* 9 */
+	&sensor_dev_attr_temp6_input.dev_attr.attr,	/* 10 */
+	&sensor_dev_attr_temp6_label.dev_attr.attr,	/* 11 */
+	&sensor_dev_attr_temp7_input.dev_attr.attr,	/* 12 */
+	&sensor_dev_attr_temp7_label.dev_attr.attr,	/* 13 */
+	&sensor_dev_attr_temp8_input.dev_attr.attr,	/* 14 */
+	&sensor_dev_attr_temp8_label.dev_attr.attr,	/* 15 */
+	&sensor_dev_attr_temp9_input.dev_attr.attr,	/* 16 */
+	&sensor_dev_attr_temp9_label.dev_attr.attr,	/* 17 */
+	&sensor_dev_attr_temp10_input.dev_attr.attr,	/* 18 */
+	&sensor_dev_attr_temp10_label.dev_attr.attr,	/* 19 */
+	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 20 */
+	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 21 */
+	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 22 */
+	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 23 */
+	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 24 */
+	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 25 */
+	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 26 */
+	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 27 */
+	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 28 */
 	NULL
 };

@@ -788,13 +818,32 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
 	if (index >= 6 && index <= 7 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
 		return 0;
-	if (index >= 8 && index <= 10 &&
+	if (index >= 8 && index <= 9 &&
+	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
+		return 0;
+	if (index >= 10 && index <= 11 &&
+	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
+		return 0;
+	if (index >= 12 && index <= 13 &&
+	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
+		return 0;
+	if (index >= 14 && index <= 15 &&
+	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
+		return 0;
+	if (index >= 16 && index <= 17 &&
+	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
+		return 0;
+	if (index >= 18 && index <= 19 &&
+	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
+		return 0;
+
+	if (index >= 20 && index <= 22 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
 		return 0;
-	if (index >= 11 && index <= 13 &&
+	if (index >= 23 && index <= 25 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
 		return 0;
-	if (index >= 14 && index <= 16 &&
+	if (index >= 26 && index <= 28 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
 		return 0;

@@ -827,6 +876,24 @@ static int __init i8k_init_hwmon(void)
 	err = i8k_get_temp_type(3);
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
+	err = i8k_get_temp_type(4);
+	if (err >= 0)
+		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP5;
+	err = i8k_get_temp_type(5);
+	if (err >= 0)
+		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP6;
+	err = i8k_get_temp_type(6);
+	if (err >= 0)
+		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP7;
+	err = i8k_get_temp_type(7);
+	if (err >= 0)
+		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP8;
+	err = i8k_get_temp_type(8);
+	if (err >= 0)
+		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP9;
+	err = i8k_get_temp_type(9);
+	if (err >= 0)
+		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP10;

 	/* First fan attributes, if fan status or type is OK */
 	err = i8k_get_fan_status(0);
--
2.20.1
