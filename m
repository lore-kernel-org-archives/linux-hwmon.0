Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] hwmon: (sht21) Fix documentation of struct sht21
Date: Sun,  3 Dec 2017 18:15:01 -0800
Message-Id: <1512353704-6973-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
References: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Sparse reports:

drivers/hwmon/sht21.c:60: warning:
	No description found for parameter 'client'
drivers/hwmon/sht21.c:60:
	warning: Excess struct member 'hwmon_dev' description in 'sht21'

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
index 06706d288355..190e7b39ce32 100644
--- a/drivers/hwmon/sht21.c
+++ b/drivers/hwmon/sht21.c
@@ -41,7 +41,7 @@
 
 /**
  * struct sht21 - SHT21 device specific data
- * @hwmon_dev: device registered with hwmon
+ * @client: I2C client device
  * @lock: mutex to protect measurement values
  * @last_update: time of last update (jiffies)
  * @temperature: cached temperature measurement value
-- 
2.7.4
