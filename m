Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: afd@ti.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (core) Add hwmon_in_enable attribute
Date: Fri,  5 Oct 2018 16:59:04 -0700
Message-Id: <20181005235905.29403-2-nicoleotsuka@gmail.com>
In-Reply-To: <20181005235905.29403-1-nicoleotsuka@gmail.com>
References: <20181005235905.29403-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

According to hwmon ABI, in%d_enable is a sysfs interface that
allows user space to enable and disable the input sensor. So
this patch just simply adds the attribute to the list.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/hwmon/hwmon.c | 1 +
 include/linux/hwmon.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 33d51281272b..ac1cdf88840f 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -356,6 +356,7 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_max_alarm] = "in%d_max_alarm",
 	[hwmon_in_lcrit_alarm] = "in%d_lcrit_alarm",
 	[hwmon_in_crit_alarm] = "in%d_crit_alarm",
+	[hwmon_in_enable] = "in%d_enable",
 };
 
 static const char * const hwmon_curr_attr_templates[] = {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 9493d4a388db..99e0c1b0b5fb 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -118,6 +118,7 @@ enum hwmon_in_attributes {
 	hwmon_in_max_alarm,
 	hwmon_in_lcrit_alarm,
 	hwmon_in_crit_alarm,
+	hwmon_in_enable,
 };
 
 #define HWMON_I_INPUT		BIT(hwmon_in_input)
@@ -135,6 +136,7 @@ enum hwmon_in_attributes {
 #define HWMON_I_MAX_ALARM	BIT(hwmon_in_max_alarm)
 #define HWMON_I_LCRIT_ALARM	BIT(hwmon_in_lcrit_alarm)
 #define HWMON_I_CRIT_ALARM	BIT(hwmon_in_crit_alarm)
+#define HWMON_I_ENABLE		BIT(hwmon_in_enable)
 
 enum hwmon_curr_attributes {
 	hwmon_curr_input,
-- 
2.17.1
