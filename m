Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55220 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040AbcHMAhZ (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 12 Aug 2016 20:37:25 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Keerthy J <j-keerthy@ti.com>
Subject: [PATCH] hwmon: (core) Avoid cyclic dependency between hwmon and thermal_sys
Date: Fri, 12 Aug 2016 17:37:19 -0700
Message-Id: <1471048639-9792-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If both hwmon and thermal_sys are built as modules, and
CONFIG_THERMAL_HWMON is enabled, the following cyclic module dependency
is reported.

depmod: ERROR: Found 2 modules in dependency cycles!
depmod: ERROR: Cycle detected: hwmon -> thermal_sys -> hwmon

Fixes: e4bce763adb2 ("hwmon: (core) New hwmon registration API")
Reported-by: Vignesh R <vigneshr@ti.com>
Cc: Keerthy J <j-keerthy@ti.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index fade170977e8..adae6848ffb2 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -108,7 +108,13 @@ static DEFINE_IDA(hwmon_ida);
 
 /* Thermal zone handling */
 
-#if IS_REACHABLE(CONFIG_THERMAL) && defined(CONFIG_THERMAL_OF)
+/*
+ * The complex conditional is necessary to avoid a cyclic dependency
+ * between hwmon and thermal_sys modules.
+ */
+#if IS_REACHABLE(CONFIG_THERMAL) && defined(CONFIG_THERMAL_OF) && \
+	(!defined(CONFIG_THERMAL_HWMON) || \
+	 !(defined(MODULE) && IS_MODULE(CONFIG_THERMAL)))
 static int hwmon_thermal_get_temp(void *data, int *temp)
 {
 	struct hwmon_thermal_data *tdata = data;
@@ -153,7 +159,7 @@ static int hwmon_thermal_add_sensor(struct device *dev,
 {
 	return 0;
 }
-#endif /* IS_REACHABLE(CONFIG_THERMAL) && defined(CONFIG_THERMAL_OF) */
+#endif /* IS_REACHABLE(CONFIG_THERMAL) && ... */
 
 /* sysfs attribute management */
 
-- 
2.5.0

