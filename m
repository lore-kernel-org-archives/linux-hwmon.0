Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] hwmon : (iio_hwmon) Fix documentation of struct iio_hwmon_state
Date: Sun,  3 Dec 2017 18:15:03 -0800
Message-Id: <1512353704-6973-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
References: <1512353704-6973-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Sparse reports:

drivers/hwmon/iio_hwmon.c:36: warning:
	No description found for parameter 'groups'

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/iio_hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index f6a76679c650..5e5b32a1ec4b 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -23,7 +23,8 @@
  * @channels:		filled with array of channels from iio
  * @num_channels:	number of channels in channels (saves counting twice)
  * @hwmon_dev:		associated hwmon device
- * @attr_group:	the group of attributes
+ * @attr_group:		the group of attributes
+ * @groups:		null terminated array of attribute groups
  * @attrs:		null terminated array of attribute pointers.
  */
 struct iio_hwmon_state {
-- 
2.7.4
