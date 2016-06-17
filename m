Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35034 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964835AbcFQWzk (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 17 Jun 2016 18:55:40 -0400
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	=?UTF-8?q?David=20Santamar=C3=ADa=20Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Tolga Cakir <cevelnet@gmail.com>,
	"Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
	Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
	Dakota Whipple <dakotajaywhipple@gmail.com>,
	Leon Yu <leon@leonyu.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 5/6] hwmon: (dell-smm) Detect fan with index=2
Date: Sat, 18 Jun 2016 00:54:48 +0200
Message-Id: <1466204089-17030-6-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
References: <1466204089-17030-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Some Dell machines (e.g. Dell Precision M3800) have two fans, first with
index=0 and second with index=2. So export also attributes for third fan
device with index=2.

Reported-by: Tolga Cakir <cevelnet@gmail.com>
Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c |   24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 2ac87d5..571d498 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -81,6 +81,7 @@ static bool disallow_fan_type_call;
 #define I8K_HWMON_HAVE_TEMP4	(1 << 3)
 #define I8K_HWMON_HAVE_FAN1	(1 << 4)
 #define I8K_HWMON_HAVE_FAN2	(1 << 5)
+#define I8K_HWMON_HAVE_FAN3	(1 << 6)
 
 MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
 MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
@@ -252,7 +253,7 @@ static int _i8k_get_fan_type(int fan)
 static int i8k_get_fan_type(int fan)
 {
 	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
-	static int types[2] = { INT_MIN, INT_MIN };
+	static int types[3] = { INT_MIN, INT_MIN, INT_MIN };
 
 	if (types[fan] == INT_MIN)
 		types[fan] = _i8k_get_fan_type(fan);
@@ -719,6 +720,12 @@ static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
 			  1);
 static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
 			  i8k_hwmon_set_pwm, 1);
+static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
+			  2);
+static SENSOR_DEVICE_ATTR(fan3_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
+			  2);
+static SENSOR_DEVICE_ATTR(pwm3, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
+			  i8k_hwmon_set_pwm, 2);
 
 static struct attribute *i8k_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
@@ -735,6 +742,9 @@ static struct attribute *i8k_attrs[] = {
 	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
 	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
 	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
+	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 14 */
+	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 15 */
+	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 16 */
 	NULL
 };
 
@@ -742,7 +752,7 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
 			      int index)
 {
 	if (disallow_fan_type_call &&
-	    (index == 9 || index == 12))
+	    (index == 9 || index == 12 || index == 15))
 		return 0;
 	if (index >= 0 && index <= 1 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
@@ -762,6 +772,9 @@ static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
 	if (index >= 11 && index <= 13 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
 		return 0;
+	if (index >= 14 && index <= 16 &&
+	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
+		return 0;
 
 	return attr->mode;
 }
@@ -807,6 +820,13 @@ static int __init i8k_init_hwmon(void)
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
 
+	/* Third fan attributes, if fan status or type is OK */
+	err = i8k_get_fan_status(2);
+	if (err < 0)
+		err = i8k_get_fan_type(2);
+	if (err >= 0)
+		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN3;
+
 	i8k_hwmon_dev = hwmon_device_register_with_groups(NULL, "dell_smm",
 							  NULL, i8k_groups);
 	if (IS_ERR(i8k_hwmon_dev)) {
-- 
1.7.9.5

