Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/7] hwmon: (core) Deprecate hwmon_device_register()
Date: Sun, 20 Nov 2016 09:36:25 -0800
Message-Id: <1479663388-2000-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
References: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Inform the user that hwmon_device_register() is deprecated,
and suggest conversion to the newest API. Also remove
hwmon_device_register() from the kernel API documentation.

Note that hwmon_device_register() is not marked as __deprecated()
since doing so might result in build errors.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.txt | 34 +++++++++++++-------------------
 drivers/hwmon/hwmon.c                    |  3 +++
 include/linux/hwmon.h                    |  2 ++
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
index 562ef44adb5e..633fa90909eb 100644
--- a/Documentation/hwmon/hwmon-kernel-api.txt
+++ b/Documentation/hwmon/hwmon-kernel-api.txt
@@ -23,7 +23,6 @@ Each hardware monitoring driver must #include <linux/hwmon.h> and, in most
 cases, <linux/hwmon-sysfs.h>. linux/hwmon.h declares the following
 register/unregister functions:
 
-struct device *hwmon_device_register(struct device *dev);
 struct device *
 hwmon_device_register_with_groups(struct device *dev, const char *name,
 				  void *drvdata,
@@ -50,24 +49,19 @@ devm_hwmon_device_register_with_info(struct device *dev,
 void hwmon_device_unregister(struct device *dev);
 void devm_hwmon_device_unregister(struct device *dev);
 
-hwmon_device_register registers a hardware monitoring device. The parameter
-of this function is a pointer to the parent device.
-This function returns a pointer to the newly created hardware monitoring device
-or PTR_ERR for failure. If this registration function is used, hardware
-monitoring sysfs attributes are expected to have been created and attached to
-the parent device prior to calling hwmon_device_register. A name attribute must
-have been created by the caller.
-
-hwmon_device_register_with_groups is similar to hwmon_device_register. However,
-it has additional parameters. The name parameter is a pointer to the hwmon
-device name. The registration function wil create a name sysfs attribute
-pointing to this name. The drvdata parameter is the pointer to the local
-driver data.  hwmon_device_register_with_groups will attach this pointer
-to the newly allocated hwmon device. The pointer can be retrieved by the driver
-using dev_get_drvdata() on the hwmon device pointer. The groups parameter is
+hwmon_device_register_with_groups registers a hardware monitoring device.
+The first parameter of this function is a pointer to the parent device.
+The name parameter is a pointer to the hwmon device name. The registration
+function wil create a name sysfs attribute pointing to this name.
+The drvdata parameter is the pointer to the local driver data.
+hwmon_device_register_with_groups will attach this pointer to the newly
+allocated hwmon device. The pointer can be retrieved by the driver using
+dev_get_drvdata() on the hwmon device pointer. The groups parameter is
 a pointer to a list of sysfs attribute groups. The list must be NULL terminated.
 hwmon_device_register_with_groups creates the hwmon device with name attribute
 as well as all sysfs attributes attached to the hwmon device.
+This function returns a pointer to the newly created hardware monitoring device
+or PTR_ERR for failure.
 
 devm_hwmon_device_register_with_groups is similar to
 hwmon_device_register_with_groups. However, it is device managed, meaning the
@@ -87,13 +81,13 @@ hwmon_device_unregister deregisters a registered hardware monitoring device.
 The parameter of this function is the pointer to the registered hardware
 monitoring device structure. This function must be called from the driver
 remove function if the hardware monitoring device was registered with
-hwmon_device_register, hwmon_device_register_with_groups, or
-hwmon_device_register_with_info.
+hwmon_device_register_with_groups or hwmon_device_register_with_info.
 
 devm_hwmon_device_unregister does not normally have to be called. It is only
 needed for error handling, and only needed if the driver probe fails after
-the call to devm_hwmon_device_register_with_groups and if the automatic
-(device managed) removal would be too late.
+the call to devm_hwmon_device_register_with_groups or
+hwmon_device_register_with_info and if the automatic (device managed)
+removal would be too late.
 
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 112aae60f51f..971c9eb78e6a 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -691,6 +691,9 @@ EXPORT_SYMBOL_GPL(hwmon_device_register_with_info);
  */
 struct device *hwmon_device_register(struct device *dev)
 {
+	dev_warn(dev,
+		 "hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().\n");
+
 	return hwmon_device_register_with_groups(dev, NULL, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(hwmon_device_register);
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index e68334aede4c..2588e6ee7660 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -362,7 +362,9 @@ struct hwmon_chip_info {
 	const struct hwmon_channel_info **info;
 };
 
+/* hwmon_device_register() is deprecated */
 struct device *hwmon_device_register(struct device *dev);
+
 struct device *
 hwmon_device_register_with_groups(struct device *dev, const char *name,
 				  void *drvdata,
-- 
2.5.0
