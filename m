Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50963 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbcLEGD6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2016 01:03:58 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/17] hwmon: (gl518sm) Fix overflows seen when writing into limit attributes
Date: Sun,  4 Dec 2016 20:55:39 -0800
Message-Id: <1480913740-5678-16-git-send-email-linux@roeck-us.net>
In-Reply-To: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into limit attributes can overflow due to additions and
multiplications with unchecked parameters.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gl518sm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/gl518sm.c b/drivers/hwmon/gl518sm.c
index 0212c8317bca..0a11a550c2a2 100644
--- a/drivers/hwmon/gl518sm.c
+++ b/drivers/hwmon/gl518sm.c
@@ -86,9 +86,8 @@ enum chips { gl518sm_r00, gl518sm_r80 };
 #define BOOL_FROM_REG(val)	((val) ? 0 : 1)
 #define BOOL_TO_REG(val)	((val) ? 0 : 1)
 
-#define TEMP_TO_REG(val)	clamp_val(((((val) < 0 ? \
-				(val) - 500 : \
-				(val) + 500) / 1000) + 119), 0, 255)
+#define TEMP_TO_REG(val) (DIV_ROUND_CLOSEST(clamp_val(val, -119000, 136000), \
+					    1000) + 119)
 #define TEMP_FROM_REG(val)	(((val) - 119) * 1000)
 
 static inline u8 FAN_TO_REG(long rpm, int div)
@@ -101,10 +100,11 @@ static inline u8 FAN_TO_REG(long rpm, int div)
 }
 #define FAN_FROM_REG(val, div)	((val) == 0 ? 0 : (480000 / ((val) * (div))))
 
-#define IN_TO_REG(val)		clamp_val((((val) + 9) / 19), 0, 255)
+#define IN_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * 19), 19)
 #define IN_FROM_REG(val)	((val) * 19)
 
-#define VDD_TO_REG(val)		clamp_val((((val) * 4 + 47) / 95), 0, 255)
+#define VDD_TO_REG(val) \
+	DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * 95 / 4) * 4, 95)
 #define VDD_FROM_REG(val)	(((val) * 95 + 2) / 4)
 
 #define DIV_FROM_REG(val)	(1 << (val))
-- 
2.5.0

