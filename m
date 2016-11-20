Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/7] hwmon: (core) Explain why at least two attribute groups are allocated
Date: Sun, 20 Nov 2016 09:36:27 -0800
Message-Id: <1479663388-2000-6-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
References: <1479663388-2000-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

A list of sysfs attribute groups is NULL-terminated, so we always need
to allocate data for at least two groups (the dynamically generated group
plus the NULL pointer). Add a comment to explain the situation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index a0b5becf91fa..8dc0466a9307 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -561,7 +561,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 
 	if (chip) {
 		struct attribute **attrs;
-		int ngroups = 2;
+		int ngroups = 2; /* terminating NULL plus &hwdev->groups */
 
 		if (groups)
 			for (i = 0; groups[i]; i++)
-- 
2.5.0
