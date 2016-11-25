Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33775 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932449AbcKYSW7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Nov 2016 13:22:59 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (core) Simplify sysfs attribute name allocation
Date: Fri, 25 Nov 2016 10:22:25 -0800
Message-Id: <1480098145-23528-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Allocating the sysfs attribute name only if needed and only with the
required minimum length looks optimal, but does not take the additional
overhead for both devm_ data structures and the allocation header itself
into account. This also results in unnecessary memory fragmentation.
Move the sysfs name string into struct hwmon_device_attribute and give it
a sufficient length to reduce this overhead.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 58c328f4508d..3932f9276c07 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -38,12 +38,15 @@ struct hwmon_device {
 
 #define to_hwmon_device(d) container_of(d, struct hwmon_device, dev)
 
+#define MAX_SYSFS_ATTR_NAME_LENGTH	32
+
 struct hwmon_device_attribute {
 	struct device_attribute dev_attr;
 	const struct hwmon_ops *ops;
 	enum hwmon_sensor_types type;
 	u32 attr;
 	int index;
+	char name[MAX_SYSFS_ATTR_NAME_LENGTH];
 };
 
 #define to_hwmon_attr(d) \
@@ -261,20 +264,18 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	if ((mode & S_IWUGO) && !ops->write)
 		return ERR_PTR(-EINVAL);
 
+	hattr = devm_kzalloc(dev, sizeof(*hattr), GFP_KERNEL);
+	if (!hattr)
+		return ERR_PTR(-ENOMEM);
+
 	if (type == hwmon_chip) {
 		name = (char *)template;
 	} else {
-		name = devm_kzalloc(dev, strlen(template) + 16, GFP_KERNEL);
-		if (!name)
-			return ERR_PTR(-ENOMEM);
-		scnprintf(name, strlen(template) + 16, template,
+		scnprintf(hattr->name, sizeof(hattr->name), template,
 			  index + hwmon_attr_base(type));
+		name = hattr->name;
 	}
 
-	hattr = devm_kzalloc(dev, sizeof(*hattr), GFP_KERNEL);
-	if (!hattr)
-		return ERR_PTR(-ENOMEM);
-
 	hattr->type = type;
 	hattr->attr = attr;
 	hattr->index = index;
-- 
2.5.0

