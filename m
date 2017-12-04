Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/5] hwmon: (hih6130) Fix documentation of struct hih6130
Date: Sun,  3 Dec 2017 18:15:04 -0800
Message-Id: <1512353704-6973-5-git-send-email-linux@roeck-us.net>
In-Reply-To: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
References: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Sparse reports:

drivers/hwmon/hih6130.c:56: warning:
	No description found for parameter 'client'
drivers/hwmon/hih6130.c:56: warning:
	Excess struct member 'hwmon_dev' description in 'hih6130'

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hih6130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index 7b73d2002d3e..0ae1ee1dbf76 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -37,7 +37,7 @@
 
 /**
  * struct hih6130 - HIH-6130 device specific data
- * @hwmon_dev: device registered with hwmon
+ * @client: pointer to I2C client device
  * @lock: mutex to protect measurement values
  * @valid: only false before first measurement is taken
  * @last_update: time of last update (jiffies)
-- 
2.7.4
