Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/7] hwmon: (core) Make is_visible callback truly mandatory
Date: Sun, 20 Nov 2016 09:36:26 -0800
Message-Id: <1479663388-2000-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
References: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The is_visible callback provides the sysfs attribute mode and is thus
truly mandatory as documented. Check it once at registration and remove
other checks for its existence.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 971c9eb78e6a..a0b5becf91fa 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -559,7 +559,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 
 	hdev = &hwdev->dev;
 
-	if (chip && chip->ops->is_visible) {
+	if (chip) {
 		struct attribute **attrs;
 		int ngroups = 2;
 
@@ -605,7 +605,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	if (err)
 		goto free_hwmon;
 
-	if (chip && chip->ops->is_visible && chip->ops->read &&
+	if (chip && chip->ops->read &&
 	    chip->info[0]->type == hwmon_chip &&
 	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
 		const struct hwmon_channel_info **info = chip->info;
@@ -673,7 +673,7 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
 				const struct hwmon_chip_info *chip,
 				const struct attribute_group **groups)
 {
-	if (chip && (!chip->ops || !chip->info))
+	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
 		return ERR_PTR(-EINVAL);
 
 	return __hwmon_device_register(dev, name, drvdata, chip, groups);
-- 
2.5.0
