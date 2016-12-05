Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51633 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGEd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:04:33 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/17] hwmon: (lm87) Fix overflow seen when writing voltage limit attributes
Date: Sun,  4 Dec 2016 20:55:33 -0800
Message-Id: <1480913740-5678-10-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into voltage limit attributes can overflow due to an unbound
multiplication.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm87.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index a5e295826aea..24f971b75e46 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -121,7 +121,7 @@ static u8 LM87_REG_TEMP_LOW[3] = { 0x3A, 0x38, 0x2C };
 
 #define IN_FROM_REG(reg, scale)	(((reg) * (scale) + 96) / 192)
 #define IN_TO_REG(val, scale)	((val) <= 0 ? 0 : \
-				 (val) * 192 >= (scale) * 255 ? 255 : \
+				 (val) >= (scale) * 255 / 192 ? 255 : \
 				 ((val) * 192 + (scale) / 2) / (scale))
 
 #define TEMP_FROM_REG(reg)	((reg) * 1000)
-- 
2.5.0

