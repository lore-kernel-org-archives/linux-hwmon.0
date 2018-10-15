Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42375 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbeJORGF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Oct 2018 13:06:05 -0400
From: Dmitry Bazhenov <bazhenov.dn@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: Dmitry Bazhenov <bazhenov.dn@gmail.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus) Fix page count auto-detection.
Date: Mon, 15 Oct 2018 14:21:22 +0500
Message-Id: <20181015092122.10533-1-bazhenov.dn@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Devices with compatible="pmbus" field have zero initial page count,
and pmbus_clear_faults() being called before the page count auto-
detection does not actually clear faults because it depends on the
page count. Non-cleared faults in its turn may fail the subsequent
page count auto-detection.

This patch fixes this problem by calling pmbus_clear_fault_page()
for currently set page and calling pmbus_clear_faults() after the
page count was detected.

Signed-off-by: Dmitry Bazhenov <bazhenov.dn@gmail.com>
---
 drivers/hwmon/pmbus/pmbus.c      | 2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7718e58dbda5..7688dab32f6e 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -118,6 +118,8 @@ static int pmbus_identify(struct i2c_client *client,
 		} else {
 			info->pages = 1;
 		}
+
+		pmbus_clear_faults(client);
 	}
 
 	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 82c3754e21e3..2e2b5851139c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2015,7 +2015,10 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
 		client->flags |= I2C_CLIENT_PEC;
 
-	pmbus_clear_faults(client);
+	if (data->info->pages)
+		pmbus_clear_faults(client);
+	else
+		pmbus_clear_fault_page(client, -1);
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
-- 
2.17.1
