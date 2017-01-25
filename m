Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35375 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751565AbdAYJeq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2017 04:34:46 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3] hwmon: Make name attribute mandatory for new APIs
Date: Wed, 25 Jan 2017 01:34:40 -0800
Message-Id: <1485336880-16958-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

It does not make sense to use one of the the new APIs when not
even providing a name attribute. Make it mandatory.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: hwmon_device_register() needs to call __hwmon_device_register() directly.
v2: One should use ERR_PTR where appropriate

 drivers/hwmon/hwmon.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 0c5660ccdbf4..affff8195fff 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -651,6 +651,9 @@ hwmon_device_register_with_groups(struct device *dev, const char *name,
 				  void *drvdata,
 				  const struct attribute_group **groups)
 {
+	if (!name)
+		return ERR_PTR(-EINVAL);
+
 	return __hwmon_device_register(dev, name, drvdata, NULL, groups);
 }
 EXPORT_SYMBOL_GPL(hwmon_device_register_with_groups);
@@ -674,6 +677,9 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
 				const struct hwmon_chip_info *chip,
 				const struct attribute_group **extra_groups)
 {
+	if (!name)
+		return ERR_PTR(-EINVAL);
+
 	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
 		return ERR_PTR(-EINVAL);
 
@@ -695,7 +701,7 @@ struct device *hwmon_device_register(struct device *dev)
 	dev_warn(dev,
 		 "hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().\n");
 
-	return hwmon_device_register_with_groups(dev, NULL, NULL, NULL);
+	return __hwmon_device_register(dev, NULL, NULL, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(hwmon_device_register);
 
-- 
2.7.4

