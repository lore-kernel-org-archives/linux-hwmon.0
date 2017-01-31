Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39323 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751513AbdAaMA1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2017 07:00:27 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Register thermal zone only if 'dev' parameter was provided
Date: Tue, 31 Jan 2017 03:59:53 -0800
Message-Id: <1485863993-32711-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Rgistering a thermal zone uses devm_kzalloc(), which requires
a pointer to the parent device.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9a02c452f9e5..28375d59cc36 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -608,7 +608,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	if (err)
 		goto free_hwmon;
 
-	if (chip && chip->ops->read &&
+	if (dev && chip && chip->ops->read &&
 	    chip->info[0]->type == hwmon_chip &&
 	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
 		const struct hwmon_channel_info **info = chip->info;
-- 
2.7.4

