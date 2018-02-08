Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:41848 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751130AbeBHB56 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Feb 2018 20:57:58 -0500
Received: by mail-pf0-f195.google.com with SMTP id 68so1160379pfj.8
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2018 17:57:58 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (k10temp) Only apply temperature offset if result is positive
Date: Wed,  7 Feb 2018 17:57:54 -0800
Message-Id: <1518055074-27110-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

A user reports a really bad temperature on Ryzen 1950X.

k10temp-pci-00cb
Adapter: PCI adapter
temp1: +4294948.3°C (high = +70.0°C)

This will happen if the temperature reported by the chip is lower than
the offset temperature. If that happens, let's report a temperature
of 0 degrees C.

Fixes: 1b50b776355f ("hwmon: (k10temp) Add support for temperature offsets")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 06b4e1c78bd8..4c6594a4661d 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -129,7 +129,10 @@ static ssize_t temp1_input_show(struct device *dev,
 
 	data->read_tempreg(data->pdev, &regval);
 	temp = (regval >> 21) * 125;
-	temp -= data->temp_offset;
+	if (temp > data->temp_offset)
+		temp -= data->temp_offset;
+	else
+		temp = 0;
 
 	return sprintf(buf, "%u\n", temp);
 }
-- 
2.7.4

