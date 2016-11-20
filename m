Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/7] hwmon: (core) Clarify when read and write callbacks are mandatory
Date: Sun, 20 Nov 2016 09:36:22 -0800
Message-Id: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The callback descrption in hwmon.h was misleading and stated that read and
write callbacks would be optional. More accurate is is that the callbacks
are mandatory if readable / writeable attributes are present.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/linux/hwmon.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 9d2f8bde7d12..b6a86aa4a9e2 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -298,8 +298,7 @@ enum hwmon_pwm_attributes {
  *			Channel number
  *		The function returns the file permissions.
  *		If the return value is 0, no attribute will be created.
- * @read:       Read callback. Optional. If not provided, attributes
- *		will not be readable.
+ * @read:	Read callback. Mandatory if readable attributes are present.
  *		Parameters are:
  *		@dev:	Pointer to hardware monitoring device
  *		@type:	Sensor type
@@ -308,8 +307,7 @@ enum hwmon_pwm_attributes {
  *			Channel number
  *		@val:	Pointer to returned value
  *		The function returns 0 on success or a negative error number.
- * @write:	Write callback. Optional. If not provided, attributes
- *		will not be writable.
+ * @write:	Write callback. Mandatory if writeable attributes are present.
  *		Parameters are:
  *		@dev:	Pointer to hardware monitoring device
  *		@type:	Sensor type
-- 
2.5.0
