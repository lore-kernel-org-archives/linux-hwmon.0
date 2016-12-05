Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51288 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGEP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:04:15 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Steve Glendinning <steve.glendinning@shawell.net>
Subject: [PATCH 13/17] hwmon: (emc2103) Fix overflows seen when temperature limit attributes
Date: Sun,  4 Dec 2016 20:55:36 -0800
Message-Id: <1480913740-5678-13-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into temperature limit attributes can overflow due to unbound
values passed to DIV_ROUND_CLOSEST().

Cc: Steve Glendinning <steve.glendinning@shawell.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc2103.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index 24e395c5907d..4b870ee9b0d3 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -251,7 +251,7 @@ static ssize_t set_temp_min(struct device *dev, struct device_attribute *da,
 	if (result < 0)
 		return result;
 
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -63, 127);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -63000, 127000), 1000);
 
 	mutex_lock(&data->update_lock);
 	data->temp_min[nr] = val;
@@ -273,7 +273,7 @@ static ssize_t set_temp_max(struct device *dev, struct device_attribute *da,
 	if (result < 0)
 		return result;
 
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -63, 127);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -63000, 127000), 1000);
 
 	mutex_lock(&data->update_lock);
 	data->temp_max[nr] = val;
-- 
2.5.0

