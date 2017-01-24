Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34279 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750847AbdAXOex (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2017 09:34:53 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Make name attribute mandatory for new APIs
Date: Tue, 24 Jan 2017 06:34:46 -0800
Message-Id: <1485268486-29960-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

It does not make sense to use one of the the new APIs when not
even providing a name attribute. Make it mandatory.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 0c5660ccdbf4..ead5c94bb56c 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -651,6 +651,9 @@ hwmon_device_register_with_groups(struct device *dev, const char *name,
 				  void *drvdata,
 				  const struct attribute_group **groups)
 {
+	if (!name)
+		return -EINVAL;
+
 	return __hwmon_device_register(dev, name, drvdata, NULL, groups);
 }
 EXPORT_SYMBOL_GPL(hwmon_device_register_with_groups);
@@ -674,6 +677,9 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
 				const struct hwmon_chip_info *chip,
 				const struct attribute_group **extra_groups)
 {
+	if (!name)
+		return -EINVAL;
+
 	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
 		return ERR_PTR(-EINVAL);
 
-- 
2.7.4

