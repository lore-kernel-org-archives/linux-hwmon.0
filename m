Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52324 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGFG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:05:06 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/17] hwmon: (emcw201) Fix overflows seen when writing into limit attributes
Date: Sun,  4 Dec 2016 20:55:37 -0800
Message-Id: <1480913740-5678-14-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into temperature and voltage limit attributes can overflow
due to multiplications with unchecked parameters. Also, the input
parameter to DIV_ROUND_CLOSEST() needis to be range checked.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc6w201.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/emc6w201.c b/drivers/hwmon/emc6w201.c
index f37fe2011640..f8c776c49df9 100644
--- a/drivers/hwmon/emc6w201.c
+++ b/drivers/hwmon/emc6w201.c
@@ -215,12 +215,13 @@ static ssize_t set_in(struct device *dev, struct device_attribute *devattr,
 	if (err < 0)
 		return err;
 
-	val = DIV_ROUND_CLOSEST(val * 0xC0, nominal_mv[nr]);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * nominal_mv[nr] / 192)
+				* 192, nominal_mv[nr]);
 	reg = (sf == min) ? EMC6W201_REG_IN_LOW(nr)
 			  : EMC6W201_REG_IN_HIGH(nr);
 
 	mutex_lock(&data->update_lock);
-	data->in[sf][nr] = clamp_val(val, 0, 255);
+	data->in[sf][nr] = val;
 	err = emc6w201_write8(client, reg, data->in[sf][nr]);
 	mutex_unlock(&data->update_lock);
 
@@ -252,12 +253,12 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
 	if (err < 0)
 		return err;
 
-	val = DIV_ROUND_CLOSEST(val, 1000);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -127000, 127000), 1000);
 	reg = (sf == min) ? EMC6W201_REG_TEMP_LOW(nr)
 			  : EMC6W201_REG_TEMP_HIGH(nr);
 
 	mutex_lock(&data->update_lock);
-	data->temp[sf][nr] = clamp_val(val, -127, 127);
+	data->temp[sf][nr] = val;
 	err = emc6w201_write8(client, reg, data->temp[sf][nr]);
 	mutex_unlock(&data->update_lock);
 
-- 
2.5.0

