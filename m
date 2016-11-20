Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/7] hwmon: (core) Clarify use of chip attributes
Date: Sun, 20 Nov 2016 09:36:24 -0800
Message-Id: <1479663388-2000-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
References: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Describing chip attributes as "attributes which apply to the entire chip"
is confusing. Rephrase to "attributes which are not bound to a specific
input or output".

Also rename hwmon_chip_attr_templates[] to hwmon_chip_attrs[] to indicate
that the respective strings strings are not templates but actual attribute
names.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.txt |  2 +-
 drivers/hwmon/hwmon.c                    | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
index ef9d74947f5c..562ef44adb5e 100644
--- a/Documentation/hwmon/hwmon-kernel-api.txt
+++ b/Documentation/hwmon/hwmon-kernel-api.txt
@@ -160,7 +160,7 @@ It contains following fields:
 * type: The hardware monitoring sensor type.
   Supported sensor types are
   * hwmon_chip		A virtual sensor type, used to describe attributes
-			which apply to the entire chip.
+  *			which are not bound to a specific input or output
   * hwmon_temp		Temperature sensor
   * hwmon_in		Voltage sensor
   * hwmon_curr		Current sensor
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 491231fa0580..112aae60f51f 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -292,7 +292,11 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	return a;
 }
 
-static const char * const hwmon_chip_attr_templates[] = {
+/*
+ * Chip attributes are not attribute templates but actual sysfs attributes.
+ * See hwmon_genattr() for special handling.
+ */
+static const char * const hwmon_chip_attrs[] = {
 	[hwmon_chip_temp_reset_history] = "temp_reset_history",
 	[hwmon_chip_in_reset_history] = "in_reset_history",
 	[hwmon_chip_curr_reset_history] = "curr_reset_history",
@@ -429,7 +433,7 @@ static const char * const hwmon_pwm_attr_templates[] = {
 };
 
 static const char * const *__templates[] = {
-	[hwmon_chip] = hwmon_chip_attr_templates,
+	[hwmon_chip] = hwmon_chip_attrs,
 	[hwmon_temp] = hwmon_temp_attr_templates,
 	[hwmon_in] = hwmon_in_attr_templates,
 	[hwmon_curr] = hwmon_curr_attr_templates,
@@ -441,7 +445,7 @@ static const char * const *__templates[] = {
 };
 
 static const int __templates_size[] = {
-	[hwmon_chip] = ARRAY_SIZE(hwmon_chip_attr_templates),
+	[hwmon_chip] = ARRAY_SIZE(hwmon_chip_attrs),
 	[hwmon_temp] = ARRAY_SIZE(hwmon_temp_attr_templates),
 	[hwmon_in] = ARRAY_SIZE(hwmon_in_attr_templates),
 	[hwmon_curr] = ARRAY_SIZE(hwmon_curr_attr_templates),
-- 
2.5.0
