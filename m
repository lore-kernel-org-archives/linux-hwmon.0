Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44508 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbeJZI0K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Oct 2018 04:26:10 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] hwmon: (core) Add pm ops to hwmon class
Date: Thu, 25 Oct 2018 16:51:18 -0700
Message-Id: <20181025235122.3240-2-nicoleotsuka@gmail.com>
In-Reply-To: <20181025235122.3240-1-nicoleotsuka@gmail.com>
References: <20181025235122.3240-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The hwmon core generates an extra child dev pointer for every
registered hwmon driver so as to link the new device to hwmon
class, and it exposes this new dev in /sys/class/hwmon/hwmon*/
directory including a power directory for pm runtime. However,
there is currently no way for hwmon drivers to link their own
pm related information to this power directory, so it's always
showing unsupported even if the driver implements the pm ops.

This is because pm_runtime core scans PM runtime callbacks in
the dev->driver pointer while this new child dev doesn't have
a driver pointer. It sounds easier to merely copy this driver
pointer from the parent dev to the child dev, however, this'd
create some problem like the same suspend() function might be
called twice during system suspend cycle and the second call
may fail since the device is already suspended, so the driver
would have to work around to bypass one of the two callbacks.

Actually, pm_runtime core also scans a class-level pm pointer:
         else if (dev->class && dev->class->pm)
                  ops = dev->class->pm;

This means that hwmon class in the hwmon core could actually
have its own generic pm callbacks so that a registered driver
would have the capability to link their own callbacks to the
hwmon core's.

So this patch adds a pm pointer to the hwmon class with some
generic pm callbacks of system suspend/resume and pm_runtime
suspend/resume, and also allows hwmon drivers to pass valid
pm pointers through _with_info API when registering devices.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v3->v4:
 * Dropped the risky pointer copies
 * Added generic pm runtime callbacks to the hwmon class
v2->v3:
 * N/A
v1->v2:
 * Added device pointers

 drivers/hwmon/hwmon.c | 24 ++++++++++++++++++++++++
 include/linux/hwmon.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 975c95169884..10bbd36be4a5 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -20,6 +20,7 @@
 #include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/thermal.h>
@@ -103,11 +104,34 @@ static void hwmon_dev_release(struct device *dev)
 	kfree(to_hwmon_device(dev));
 }
 
+#define HWMON_PM_FUNCTION(name)					\
+static int __maybe_unused hwmon_##name(struct device *dev)	\
+{								\
+	struct hwmon_device *hwdev = to_hwmon_device(dev);	\
+	const struct hwmon_chip_info *chip = hwdev->chip;	\
+								\
+	if (chip && chip->pm && chip->pm->name)			\
+		return chip->pm->name(dev);			\
+								\
+	return 0;						\
+}
+
+HWMON_PM_FUNCTION(suspend)
+HWMON_PM_FUNCTION(resume)
+HWMON_PM_FUNCTION(runtime_suspend)
+HWMON_PM_FUNCTION(runtime_resume)
+
+static const struct dev_pm_ops hwmon_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(hwmon_suspend, hwmon_resume)
+	SET_RUNTIME_PM_OPS(hwmon_runtime_suspend, hwmon_runtime_resume, NULL)
+};
+
 static struct class hwmon_class = {
 	.name = "hwmon",
 	.owner = THIS_MODULE,
 	.dev_groups = hwmon_dev_attr_groups,
 	.dev_release = hwmon_dev_release,
+	.pm = &hwmon_pm,
 };
 
 static DEFINE_IDA(hwmon_ida);
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 99e0c1b0b5fb..edbeddb489f8 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -369,10 +369,12 @@ struct hwmon_channel_info {
  * Chip configuration
  * @ops:	Pointer to hwmon operations.
  * @info:	Null-terminated list of channel information.
+ * @pm:		Pointer to dev_pm_ops callbacks.
  */
 struct hwmon_chip_info {
 	const struct hwmon_ops *ops;
 	const struct hwmon_channel_info **info;
+	const struct dev_pm_ops *pm;
 };
 
 /* hwmon_device_register() is deprecated */
-- 
2.17.1
