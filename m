Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34797 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752273AbcEVLvI (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 22 May 2016 07:51:08 -0400
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
	Andy Lutomirski <luto@kernel.org>, Jethro <xtompok@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [Experimental PATCH] dell-smm-hwmon: Add support for disabling automatic BIOS fan control
Date: Sun, 22 May 2016 13:50:36 +0200
Message-Id: <1463917836-12985-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch exports standard hwmon pwmX_enable sysfs attribute for enabling
or disabling automatic fan control by BIOS. Standard value "1" is for
disabling automatic BIOS fan control and value "2" for enabling.

Currently there is no way to check if BIOS auto mode is enabled (at least
it is not know how to do it), so hwmon sysfs attribute is write-only.

By default BIOS auto mode is enabled by laptop firmware.

When BIOS auto mode is enabled, custom fan speed value (set via hwmon pwmX
sysfs attribute) is overwritten by SMM in few seconds and therefore any
custom settings are without effect. So this is reason why implementing
option for disabling BIOS auto mode is needed.

So finally this patch allows kernel to set and control fan speed on
laptops, but it can be dangerous (like setting speed of other fans).

This new feature is highly experimental, uses Dell SMM calls, so does not
have to be supported by all laptops BIOSes. It was tested on Dell Latitude
E6440 with BIOS A5.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c |   64 ++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 8a66a42..7b5144a 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -45,6 +45,8 @@
 #define I8K_SMM_GET_SPEED	0x02a3
 #define I8K_SMM_GET_FAN_TYPE	0x03a3
 #define I8K_SMM_GET_NOM_SPEED	0x04a3
+#define I8K_SMM_MANUAL_FAN	0x34a3
+#define I8K_SMM_AUTO_FAN	0x35a3
 #define I8K_SMM_GET_TEMP	0x10a3
 #define I8K_SMM_GET_TEMP_TYPE	0x11a3
 #define I8K_SMM_GET_DELL_SIG1	0xfea3
@@ -284,6 +286,17 @@ static int i8k_get_fan_nominal_speed(int fan, int speed)
 }
 
 /*
+ * Enable or disable automatic BIOS fan control support
+ */
+static int i8k_enable_fan_auto_mode(bool enable)
+{
+	struct smm_regs regs = { };
+
+	regs.eax = enable ? I8K_SMM_AUTO_FAN : I8K_SMM_MANUAL_FAN;
+	return i8k_smm(&regs);
+}
+
+/*
  * Set the fan speed (off, low, high). Returns the new fan status.
  */
 static int i8k_set_fan(int fan, int speed)
@@ -702,6 +715,30 @@ static ssize_t i8k_hwmon_set_pwm(struct device *dev,
 	return err < 0 ? -EIO : count;
 }
 
+static ssize_t i8k_hwmon_set_pwm_enable(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	int err;
+	bool enable;
+	unsigned long val;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
+
+	if (val == 0)
+		return -EINVAL;
+
+	enable = (val != 1);
+
+	mutex_lock(&i8k_mutex);
+	err = i8k_enable_fan_auto_mode(enable);
+	mutex_unlock(&i8k_mutex);
+
+	return err ? -EIO : count;
+}
+
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, i8k_hwmon_show_temp, NULL, 0);
 static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
 			  0);
@@ -719,18 +756,24 @@ static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
 			  0);
 static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
 			  i8k_hwmon_set_pwm, 0);
+static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR, NULL, i8k_hwmon_set_pwm_enable,
+			  0);
 static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
 			  1);
 static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
 			  1);
 static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
 			  i8k_hwmon_set_pwm, 1);
+static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR, NULL, i8k_hwmon_set_pwm_enable,
+			  1);
 static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
 			  2);
 static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
 			  2);
 static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
 			  i8k_hwmon_set_pwm, 2);
+static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR, NULL, i8k_hwmon_set_pwm_enable,
+			  2);
 
 static struct attribute *i8k_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
@@ -744,12 +787,15 @@ static struct attribute *i8k_attrs[] = {
 	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 8 */
 	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 9 */
 	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 10 */
-	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
-	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
-	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
-	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
-	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
-	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
+	&sensor_dev_attr_pwm1_enable.dev_attr.attr,	/* 11 */
+	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 12 */
+	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 13 */
+	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 14 */
+	&sensor_dev_attr_pwm2_enable.dev_attr.attr,	/* 15 */
+	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 16 */
+	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 17 */
+	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 18 */
+	&sensor_dev_attr_pwm3_enable.dev_attr.attr,	/* 19 */
 	NULL
 };
 
@@ -768,13 +814,13 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
 	if (index >= 6 && index <= 7 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
 		return 0;
-	if (index >= 8 && index <= 10 &&
+	if (index >= 8 && index <= 11 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
 		return 0;
-	if (index >= 11 && index <= 13 &&
+	if (index >= 12 && index <= 15 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
 		return 0;
-	if (index >= 14 && index <= 16 &&
+	if (index >= 16 && index <= 19 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
 		return 0;
 
-- 
1.7.9.5

