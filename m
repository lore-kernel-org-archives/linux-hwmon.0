Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ve1eur01on0105.outbound.protection.outlook.com ([104.47.1.105]:3776
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750722AbdKBLdQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 2 Nov 2017 07:33:16 -0400
From: Romain Porte <romain.porte@nokia.com>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Romain Porte <romain.porte@nokia.com>
Subject: [PATCH] pmbus: added possibility to change timeout for device update
Date: Thu, 2 Nov 2017 12:31:16 +0100
Message-ID: <20171102113116.14791-1-romain.porte@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

By default the time before really updating a device is hardcoded to one second
in the pmbus_core.c file (HZ). This patch proposes a new configuration entry
that allows to tune the timeout value before updating a device. It defaults
to one second in order to stay compatible with the previous behavior, but can
now be changed if needed.

Performing faster than one second sensor reads in userspace is what motivates
this patch.

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/hwmon/pmbus/Kconfig      | 15 +++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c |  5 ++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 40019325b517..5d865e3d0cb1 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -14,6 +14,21 @@ menuconfig PMBUS
 
 if PMBUS
 
+config PMBUS_DEV_CACHE_MS
+	int "PMBus device read cache in milliseconds"
+	default 1000
+	help
+	  This options allows you to control how much time should a device
+	  be stored in cache before being updated. If you attempt to read
+	  a sensor value from the device before this cache time is elapsed,
+	  then you will get a cached value and the driver will not update
+	  the device values.
+
+	  This option is using jiffies under the hood and thus is not very
+	  precise. Setting this option to more than zero will perform a delay
+	  of at least one jiffie. Setting this option to zero will lead to
+	  no delay, thus forcing to perform an update on every read.
+
 config SENSORS_PMBUS
 	tristate "Generic PMBus devices"
 	default y
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 302f0aef59de..2df0bc5a46f1 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -414,9 +414,12 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
 	struct pmbus_sensor *sensor;
+	unsigned long timeout;
 
 	mutex_lock(&data->update_lock);
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	timeout = data->last_updated +
+		(HZ * CONFIG_PMBUS_DEV_CACHE_MS + 999) / 1000;
+	if (time_after(jiffies, timeout) || !data->valid) {
 		int i, j;
 
 		for (i = 0; i < info->pages; i++) {
-- 
2.11.0

