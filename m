Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51588 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcLEGEc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:04:32 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/17] hwmon: (adm1025) Fix overflows seen when writing voltage limits
Date: Sun,  4 Dec 2016 20:55:28 -0800
Message-Id: <1480913740-5678-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into voltage limit attributes can overflow due to an unbound
multiplication.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adm1025.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adm1025.c b/drivers/hwmon/adm1025.c
index d6c767ace916..1abb4609b412 100644
--- a/drivers/hwmon/adm1025.c
+++ b/drivers/hwmon/adm1025.c
@@ -93,7 +93,7 @@ static const int in_scale[6] = { 2500, 2250, 3300, 5000, 12000, 3300 };
 
 #define IN_FROM_REG(reg, scale)	(((reg) * (scale) + 96) / 192)
 #define IN_TO_REG(val, scale)	((val) <= 0 ? 0 : \
-				 (val) * 192 >= (scale) * 255 ? 255 : \
+				 (val) >= (scale) * 255 / 192 ? 255 : \
 				 ((val) * 192 + (scale) / 2) / (scale))
 
 #define TEMP_FROM_REG(reg)	((reg) * 1000)
-- 
2.5.0

