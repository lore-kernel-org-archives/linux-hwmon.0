Return-Path: <lucasrangit@gmail.com>
Return-path: <lucasrangit@gmail.com>
Sender: Lucas Rangit Magasweran <lucasrangit@gmail.com>
From: Lucas Magasweran <lucas.magasweran@ieee.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Lucas Magasweran <lucas.magasweran@ieee.org>
Subject: [PATCH] hwmon: (core) check parent dev != NULL when chip != NULL
Date: Tue,  8 May 2018 04:43:33 -0700
Message-Id: <1525779813-25716-2-git-send-email-lucas.magasweran@ieee.org>
In-Reply-To: <1525779813-25716-1-git-send-email-lucas.magasweran@ieee.org>
References: <20180504223950.GA5392@roeck-us.net>
 <1525779813-25716-1-git-send-email-lucas.magasweran@ieee.org>
List-ID: <linux-hwmon@vger.kernel.org>

hwmon_device_register_with_info() registration API requires a
non-NULL parent device when chip is non-NULL.

This commit adds a check and documents this requirement.

Signed-off-by: Lucas Magasweran <lucas.magasweran@ieee.org>
---
 Documentation/hwmon/hwmon-kernel-api.txt | 3 ++-
 drivers/hwmon/hwmon.c                    | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
index 53a8066..eb7a78a 100644
--- a/Documentation/hwmon/hwmon-kernel-api.txt
+++ b/Documentation/hwmon/hwmon-kernel-api.txt
@@ -71,7 +71,8 @@ hwmon_device_register_with_info is the most comprehensive and preferred means
 to register a hardware monitoring device. It creates the standard sysfs
 attributes in the hardware monitoring core, letting the driver focus on reading
 from and writing to the chip instead of having to bother with sysfs attributes.
-Its parameters are described in more detail below.
+The parent device parameter cannot be NULL with non-NULL chip info. Its
+parameters are described in more detail below.
 
 devm_hwmon_device_register_with_info is similar to
 hwmon_device_register_with_info. However, it is device managed, meaning the
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 32083e4..e88c019 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -698,6 +698,9 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
 	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
 		return ERR_PTR(-EINVAL);
 
+	if (chip && !dev)
+		return ERR_PTR(-EINVAL);
+
 	return __hwmon_device_register(dev, name, drvdata, chip, extra_groups);
 }
 EXPORT_SYMBOL_GPL(hwmon_device_register_with_info);
-- 
2.7.4
