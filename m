Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36377 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752968AbdLDCPH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Dec 2017 21:15:07 -0500
Received: by mail-pg0-f65.google.com with SMTP id k134so7154006pga.3
        for <linux-hwmon@vger.kernel.org>; Sun, 03 Dec 2017 18:15:07 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] hwmon: Fix parameter documentation
Date: Sun,  3 Dec 2017 18:15:00 -0800
Message-Id: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

sparse reports:

drivers/hwmon/hwmon.c:681: warning:
	No description found for parameter 'chip'
drivers/hwmon/hwmon.c:681: warning:
	Excess function parameter 'info' description in
	'hwmon_device_register_with_info'
drivers/hwmon/hwmon.c:789: warning:
	No description found for parameter 'chip'
drivers/hwmon/hwmon.c:789: warning:
	No description found for parameter 'groups'
drivers/hwmon/hwmon.c:789: warning:
	Excess function parameter 'info' description in
	'devm_hwmon_device_register_with_info'

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index c9790e2c3440..c39edc2c5071 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -665,7 +665,7 @@ EXPORT_SYMBOL_GPL(hwmon_device_register_with_groups);
  * @dev: the parent device
  * @name: hwmon name attribute
  * @drvdata: driver data to attach to created device
- * @info: pointer to hwmon chip information
+ * @chip: pointer to hwmon chip information
  * @extra_groups: pointer to list of additional non-standard attribute groups
  *
  * hwmon_device_unregister() must be called when the device is no
@@ -772,11 +772,11 @@ EXPORT_SYMBOL_GPL(devm_hwmon_device_register_with_groups);
 
 /**
  * devm_hwmon_device_register_with_info - register w/ hwmon
- * @dev: the parent device
- * @name: hwmon name attribute
- * @drvdata: driver data to attach to created device
- * @info: Pointer to hwmon chip information
- * @groups - pointer to list of driver specific attribute groups
+ * @dev:	the parent device
+ * @name:	hwmon name attribute
+ * @drvdata:	driver data to attach to created device
+ * @chip:	pointer to hwmon chip information
+ * @groups:	pointer to list of driver specific attribute groups
  *
  * Returns the pointer to the new device. The new device is automatically
  * unregistered with the parent device.
-- 
2.7.4

