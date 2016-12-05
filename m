Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51785 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGEn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:04:43 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Juerg Haefliger <juergh@gmail.com>
Subject: [PATCH 12/17] hwmon: (dme1737) Fix overflows seen when writing into limit attributes
Date: Sun,  4 Dec 2016 20:55:35 -0800
Message-Id: <1480913740-5678-12-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into voltage limit, temperature limit, and temperature zone
attributes can overflow due to unchecked parameters to multiplications
and additions.

Cc: Juerg Haefliger <juergh@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/dme1737.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 8763c4a8280c..29d082c12c74 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -279,7 +279,8 @@ static inline int IN_FROM_REG(int reg, int nominal, int res)
 
 static inline int IN_TO_REG(long val, int nominal)
 {
-	return clamp_val((val * 192 + nominal / 2) / nominal, 0, 255);
+	return DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * nominal / 192) * 192,
+				 nominal);
 }
 
 /*
@@ -295,7 +296,7 @@ static inline int TEMP_FROM_REG(int reg, int res)
 
 static inline int TEMP_TO_REG(long val)
 {
-	return clamp_val((val < 0 ? val - 500 : val + 500) / 1000, -128, 127);
+	return DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
 }
 
 /* Temperature range */
@@ -1028,6 +1029,8 @@ static ssize_t set_zone(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	val = clamp_val(val, -256000, 255000);
+
 	mutex_lock(&data->update_lock);
 	switch (fn) {
 	case SYS_ZONE_AUTO_POINT1_TEMP_HYST:
-- 
2.5.0

