Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36542 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751950AbeGCTfv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jul 2018 15:35:51 -0400
From: Aleksei Mamlin <mamlinav@gmail.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH] hwmon: w83795: Convert to hwmon_device_register_with_info()
Date: Tue,  3 Jul 2018 22:35:15 +0300
Message-Id: <20180703193515.4379-1-mamlinav@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch replaces deprecated call to hwmon_device_register() with the new
hwmon_device_register_with_info().

Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
---
 drivers/hwmon/w83795.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
index 49276bbdac3d..25bcf988ef1c 100644
--- a/drivers/hwmon/w83795.c
+++ b/drivers/hwmon/w83795.c
@@ -2234,7 +2234,8 @@ static int w83795_probe(struct i2c_client *client,
 	if (data->chip_type == w83795g)
 		w83795_check_dynamic_in_limits(client);
 
-	data->hwmon_dev = hwmon_device_register(dev);
+	data->hwmon_dev = hwmon_device_register_with_info(dev, client->name,
+							  data, NULL, NULL);
 	if (IS_ERR(data->hwmon_dev)) {
 		err = PTR_ERR(data->hwmon_dev);
 		goto exit_remove;
-- 
2.16.4

