Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59226 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752957AbcKTRgj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2016 12:36:39 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/7] hwmon: (core) Rename groups parameter in API to extra_groups
Date: Sun, 20 Nov 2016 09:36:28 -0800
Message-Id: <1479663388-2000-7-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
References: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The 'groups' parameter of hwmon_device_register_with_info() and
devm_hwmon_device_register_with_info() is only necessary if extra
non-standard attributes need to be provided. Rename the parameter
to extra_groups and clarify the documentation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.txt | 22 +++++++++++-----------
 drivers/hwmon/hwmon.c                    |  8 ++++----
 include/linux/hwmon.h                    |  8 ++++----
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
index 633fa90909eb..2505ae67e2b6 100644
--- a/Documentation/hwmon/hwmon-kernel-api.txt
+++ b/Documentation/hwmon/hwmon-kernel-api.txt
@@ -37,14 +37,14 @@ struct device *
 hwmon_device_register_with_info(struct device *dev,
 				const char *name, void *drvdata,
 				const struct hwmon_chip_info *info,
-				const struct attribute_group **groups);
+				const struct attribute_group **extra_groups);
 
 struct device *
 devm_hwmon_device_register_with_info(struct device *dev,
-				     const char *name,
-				     void *drvdata,
-				     const struct hwmon_chip_info *info,
-				     const struct attribute_group **groups);
+				const char *name,
+				void *drvdata,
+				const struct hwmon_chip_info *info,
+				const struct attribute_group **extra_groups);
 
 void hwmon_device_unregister(struct device *dev);
 void devm_hwmon_device_unregister(struct device *dev);
@@ -100,9 +100,9 @@ const char *name	Device name
 void *drvdata		Driver private data
 const struct hwmon_chip_info *info
 			Pointer to chip description.
-const struct attribute_group **groups
-			Null-terminated list of additional sysfs attribute
-			groups.
+const struct attribute_group **extra_groups
+			Null-terminated list of additional non-standard
+			sysfs attribute groups.
 
 This function returns a pointer to the created hardware monitoring device
 on success and a negative error code for failure.
@@ -287,9 +287,9 @@ Driver-provided sysfs attributes
 
 If the hardware monitoring device is registered with
 hwmon_device_register_with_info or devm_hwmon_device_register_with_info,
-it is most likely not necessary to provide sysfs attributes. Only non-standard
-sysfs attributes need to be provided when one of those registration functions
-is used.
+it is most likely not necessary to provide sysfs attributes. Only additional
+non-standard sysfs attributes need to be provided when one of those registration
+functions is used.
 
 The header file linux/hwmon-sysfs.h provides a number of useful macros to
 declare and use hardware monitoring sysfs attributes.
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 8dc0466a9307..58c328f4508d 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -659,8 +659,8 @@ EXPORT_SYMBOL_GPL(hwmon_device_register_with_groups);
  * @dev: the parent device
  * @name: hwmon name attribute
  * @drvdata: driver data to attach to created device
- * @info: Pointer to hwmon chip information
- * @groups - pointer to list of driver specific attribute groups
+ * @info: pointer to hwmon chip information
+ * @extra_groups: pointer to list of additional non-standard attribute groups
  *
  * hwmon_device_unregister() must be called when the device is no
  * longer needed.
@@ -671,12 +671,12 @@ struct device *
 hwmon_device_register_with_info(struct device *dev, const char *name,
 				void *drvdata,
 				const struct hwmon_chip_info *chip,
-				const struct attribute_group **groups)
+				const struct attribute_group **extra_groups)
 {
 	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
 		return ERR_PTR(-EINVAL);
 
-	return __hwmon_device_register(dev, name, drvdata, chip, groups);
+	return __hwmon_device_register(dev, name, drvdata, chip, extra_groups);
 }
 EXPORT_SYMBOL_GPL(hwmon_device_register_with_info);
 
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 2588e6ee7660..78d59dba563e 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -377,12 +377,12 @@ struct device *
 hwmon_device_register_with_info(struct device *dev,
 				const char *name, void *drvdata,
 				const struct hwmon_chip_info *info,
-				const struct attribute_group **groups);
+				const struct attribute_group **extra_groups);
 struct device *
 devm_hwmon_device_register_with_info(struct device *dev,
-				     const char *name, void *drvdata,
-				     const struct hwmon_chip_info *info,
-				     const struct attribute_group **groups);
+				const char *name, void *drvdata,
+				const struct hwmon_chip_info *info,
+				const struct attribute_group **extra_groups);
 
 void hwmon_device_unregister(struct device *dev);
 void devm_hwmon_device_unregister(struct device *dev);
-- 
2.5.0

