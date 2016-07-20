Return-path: <weiyj_lk@163.com>
From: Wei Yongjun <weiyj_lk@163.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Wei Yongjun <weiyj.lk@gmail.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH -next] hwmon: Remove unused including <linux/version.h>
Date: Wed, 20 Jul 2016 12:06:16 +0000
Message-Id: <1469016376-20327-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Wei Yongjun <weiyj.lk@gmail.com>

Remove including <linux/version.h> that don't need it.

Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
---
 drivers/hwmon/ftsteutates.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index aaef5b5..2b2ff67 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -27,7 +27,6 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/uaccess.h>
-#include <linux/version.h>
 #include <linux/watchdog.h>
 
 #define FTS_DEVICE_ID_REG		0x0000
