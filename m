Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37864 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753086AbcKTWdF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2016 17:33:05 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (ds620) Fix overflows seen when writing temperature limits
Date: Sun, 20 Nov 2016 14:32:58 -0800
Message-Id: <1479681180-6940-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479681180-6940-1-git-send-email-linux@roeck-us.net>
References: <1479681180-6940-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Module test reports:

temp1_max: Suspected overflow: [160000 vs. 0]
temp1_min: Suspected overflow: [160000 vs. 0]

This is seen because the values passed when writing temperature limits
are unbound.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ds620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ds620.c b/drivers/hwmon/ds620.c
index edf550fc4eef..0043a4c02b85 100644
--- a/drivers/hwmon/ds620.c
+++ b/drivers/hwmon/ds620.c
@@ -166,7 +166,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *da,
 	if (res)
 		return res;
 
-	val = (val * 10 / 625) * 8;
+	val = (clamp_val(val, -128000, 128000) * 10 / 625) * 8;
 
 	mutex_lock(&data->update_lock);
 	data->temp[attr->index] = val;
-- 
2.5.0

