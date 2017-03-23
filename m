Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:56807 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934737AbdCWPEa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Mar 2017 11:04:30 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Luca Tettamanti <kronos.it@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: asus_atk0110.c fix uninitialized data access
Date: Thu, 23 Mar 2017 16:03:11 +0100
Message-Id: <20170323150323.271584-1-arnd@arndb.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The latest gcc-7 snapshot adds a warning to point out that when
atk_read_value_old or atk_read_value_new fails, we copy
uninitialized data into sensor->cached_value:

drivers/hwmon/asus_atk0110.c: In function 'atk_input_show':
drivers/hwmon/asus_atk0110.c:651:26: error: 'value' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Adding an error check avoids this. All versions of the driver
are affected.

Fixes: 2c03d07ad54d ("hwmon: Add Asus ATK0110 support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/asus_atk0110.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index cccef87963e0..975c43d446f8 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -646,6 +646,9 @@ static int atk_read_value(struct atk_sensor_data *sensor, u64 *value)
 		else
 			err = atk_read_value_new(sensor, value);
 
+		if (err)
+			return err;
+
 		sensor->is_valid = true;
 		sensor->last_updated = jiffies;
 		sensor->cached_value = *value;
-- 
2.9.0

