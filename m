Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/5] hwmon: (sht15) Fix parameter documentation of sht15_crc8()
Date: Sun,  3 Dec 2017 18:15:02 -0800
Message-Id: <1512353704-6973-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
References: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Sparse reports:

drivers/hwmon/sht15.c:188: warning:
		No description found for parameter 'len'

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht15.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 25d28343ba93..2be77752cd56 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -179,6 +179,7 @@ struct sht15_data {
  * sht15_crc8() - compute crc8
  * @data:	sht15 specific data.
  * @value:	sht15 retrieved data.
+ * @len:	Length of retrieved data
  *
  * This implements section 2 of the CRC datasheet.
  */
-- 
2.7.4
