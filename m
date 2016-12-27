Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53991 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932451AbcL0WPN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Dec 2016 17:15:13 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/3] hwmon: (gl518sm) Fix overflows seen when writing into limit attributes
Date: Tue, 27 Dec 2016 14:15:06 -0800
Message-Id: <1482876907-25289-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1482876907-25289-1-git-send-email-linux@roeck-us.net>
References: <1482876907-25289-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Writes into limit attributes can overflow due to additions and
multiplications with unchecked parameters.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Improve alignment
    Use DIV_ROUND_CLOSEST() more consistently

 drivers/hwmon/gl518sm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/gl518sm.c b/drivers/hwmon/gl518sm.c
index 0212c8317bca..b267510daeb2 100644
--- a/drivers/hwmon/gl518sm.c
+++ b/drivers/hwmon/gl518sm.c
@@ -86,9 +86,8 @@ enum chips { gl518sm_r00, gl518sm_r80 };
 #define BOOL_FROM_REG(val)	((val) ? 0 : 1)
 #define BOOL_TO_REG(val)	((val) ? 0 : 1)
 
-#define TEMP_TO_REG(val)	clamp_val(((((val) < 0 ? \
-				(val) - 500 : \
-				(val) + 500) / 1000) + 119), 0, 255)
+#define TEMP_CLAMP(val)		clamp_val(val, -119000, 136000)
+#define TEMP_TO_REG(val)	(DIV_ROUND_CLOSEST(TEMP_CLAMP(val), 1000) + 119)
 #define TEMP_FROM_REG(val)	(((val) - 119) * 1000)
 
 static inline u8 FAN_TO_REG(long rpm, int div)
@@ -101,11 +100,13 @@ static inline u8 FAN_TO_REG(long rpm, int div)
 }
 #define FAN_FROM_REG(val, div)	((val) == 0 ? 0 : (480000 / ((val) * (div))))
 
-#define IN_TO_REG(val)		clamp_val((((val) + 9) / 19), 0, 255)
+#define IN_CLAMP(val)		clamp_val(val, 0, 255 * 19)
+#define IN_TO_REG(val)		DIV_ROUND_CLOSEST(IN_CLAMP(val), 19)
 #define IN_FROM_REG(val)	((val) * 19)
 
-#define VDD_TO_REG(val)		clamp_val((((val) * 4 + 47) / 95), 0, 255)
-#define VDD_FROM_REG(val)	(((val) * 95 + 2) / 4)
+#define VDD_CLAMP(val)		clamp_val(val, 0, 255 * 95 / 4)
+#define VDD_TO_REG(val)		DIV_ROUND_CLOSEST(VDD_CLAMP(val) * 4, 95)
+#define VDD_FROM_REG(val)	DIV_ROUND_CLOSEST((val) * 95, 4)
 
 #define DIV_FROM_REG(val)	(1 << (val))
 
-- 
2.7.4

