Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51223 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGEM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:04:12 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/17] hwmon: (nct7802) Fix overflows seen when writing into limit attributes
Date: Sun,  4 Dec 2016 20:55:32 -0800
Message-Id: <1480913740-5678-9-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix overflows seen when writing voltage and temperature limit attributes.

The value passed to DIV_ROUND_CLOSEST() needs to be clamped.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct7802.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 3ce33d244cc0..6fe71cfe0320 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -326,8 +326,9 @@ static int nct7802_write_voltage(struct nct7802_data *data, int nr, int index,
 	int shift = 8 - REG_VOLTAGE_LIMIT_MSB_SHIFT[index - 1][nr];
 	int err;
 
-	voltage = DIV_ROUND_CLOSEST(voltage, nct7802_vmul[nr]);
-	voltage = clamp_val(voltage, 0, 0x3ff);
+	voltage = DIV_ROUND_CLOSEST(clamp_val(voltage, 0,
+					      0x3ff * nct7802_vmul[nr]),
+				    nct7802_vmul[nr]);
 
 	mutex_lock(&data->access_lock);
 	err = regmap_write(data->regmap,
@@ -402,7 +403,7 @@ static ssize_t store_temp(struct device *dev, struct device_attribute *attr,
 	if (err < 0)
 		return err;
 
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, -127000, 127000), 1000);
 
 	err = regmap_write(data->regmap, nr, val & 0xff);
 	return err ? : count;
-- 
2.5.0

