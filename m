Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (smsc47m192) Fix overflows seen when writing into limit attributes
Date: Sun, 20 Nov 2016 14:33:00 -0800
Message-Id: <1479681180-6940-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479681180-6940-1-git-send-email-linux@roeck-us.net>
References: <1479681180-6940-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Module test reports overflows when writing into temperature and voltage
limit attributes

temp1_min: Suspected overflow: [127000 vs. 0]
temp1_max: Suspected overflow: [127000 vs. 0]
temp1_offset: Suspected overflow: [127000 vs. 0]
temp2_min: Suspected overflow: [127000 vs. 0]
temp2_max: Suspected overflow: [127000 vs. 0]
temp2_offset: Suspected overflow: [127000 vs. 0]
temp3_min: Suspected overflow: [127000 vs. 0]
temp3_max: Suspected overflow: [127000 vs. 0]
temp3_offset: Suspected overflow: [127000 vs. 0]
in0_min: Suspected overflow: [3320 vs. 0]
in0_max: Suspected overflow: [3320 vs. 0]
in4_min: Suspected overflow: [15938 vs. 0]
in4_max: Suspected overflow: [15938 vs. 0]
in6_min: Suspected overflow: [1992 vs. 0]
in6_max: Suspected overflow: [1992 vs. 0]
in7_min: Suspected overflow: [2391 vs. 0]
in7_max: Suspected overflow: [2391 vs. 0]

The problem is caused by conversions from unsigned long to long and
from long to int.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/smsc47m192.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/smsc47m192.c b/drivers/hwmon/smsc47m192.c
index 6ac7cda72d4c..202e167d6a59 100644
--- a/drivers/hwmon/smsc47m192.c
+++ b/drivers/hwmon/smsc47m192.c
@@ -77,6 +77,7 @@ static inline unsigned int IN_FROM_REG(u8 reg, int n)
 
 static inline u8 IN_TO_REG(unsigned long val, int n)
 {
+	val = clamp_val(val, 0, 65535);
 	return clamp_val(SCALE(val, 192, nom_mv[n]), 0, 255);
 }
 
@@ -84,7 +85,7 @@ static inline u8 IN_TO_REG(unsigned long val, int n)
  * TEMP: 0.001 degC units (-128C to +127C)
  * REG: 1C/bit, two's complement
  */
-static inline s8 TEMP_TO_REG(int val)
+static inline s8 TEMP_TO_REG(long val)
 {
 	return SCALE(clamp_val(val, -128000, 127000), 1, 1000);
 }
-- 
2.5.0
