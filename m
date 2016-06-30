Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/6] hwmon: (lm90) Drop unnecessary else statements
Date: Thu, 30 Jun 2016 06:51:01 -0700
Message-Id: <1467294661-23879-6-git-send-email-linux@roeck-us.net>
In-Reply-To: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
References: <1467294661-23879-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

checkpatch rightfully complains that else after return is unnecessary.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index c38d6e4e95b5..f51e758ba529 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -790,16 +790,14 @@ static inline int temp_from_u8_adt7461(struct lm90_data *data, u8 val)
 {
 	if (data->flags & LM90_FLAG_ADT7461_EXT)
 		return (val - 64) * 1000;
-	else
-		return temp_from_s8(val);
+	return temp_from_s8(val);
 }
 
 static inline int temp_from_u16_adt7461(struct lm90_data *data, u16 val)
 {
 	if (data->flags & LM90_FLAG_ADT7461_EXT)
 		return (val - 0x4000) / 64 * 250;
-	else
-		return temp_from_s16(val);
+	return temp_from_s16(val);
 }
 
 static u8 temp_to_u8_adt7461(struct lm90_data *data, long val)
@@ -810,13 +808,12 @@ static u8 temp_to_u8_adt7461(struct lm90_data *data, long val)
 		if (val >= 191000)
 			return 0xFF;
 		return (val + 500 + 64000) / 1000;
-	} else {
-		if (val <= 0)
-			return 0;
-		if (val >= 127000)
-			return 127;
-		return (val + 500) / 1000;
 	}
+	if (val <= 0)
+		return 0;
+	if (val >= 127000)
+		return 127;
+	return (val + 500) / 1000;
 }
 
 static u16 temp_to_u16_adt7461(struct lm90_data *data, long val)
@@ -827,13 +824,12 @@ static u16 temp_to_u16_adt7461(struct lm90_data *data, long val)
 		if (val >= 191750)
 			return 0xFFC0;
 		return (val + 64000 + 125) / 250 * 64;
-	} else {
-		if (val <= 0)
-			return 0;
-		if (val >= 127750)
-			return 0x7FC0;
-		return (val + 125) / 250 * 64;
 	}
+	if (val <= 0)
+		return 0;
+	if (val >= 127750)
+		return 0x7FC0;
+	return (val + 125) / 250 * 64;
 }
 
 /*
-- 
2.5.0
