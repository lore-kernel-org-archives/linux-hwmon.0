Return-Path: <cengizc@gmail.com>
Return-path: <cengizc@gmail.com>
From: Cengiz Can <cengizc@gmail.com>
To: Henrik Rydberg <rydberg@bitmath.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cengiz Can <cengizc@gmail.com>
Subject: [PATCH] hwmon: applesmc: fix deprecated hwmon_device_register call
Date: Sun,  2 Jul 2017 03:05:05 +0300
Message-Id: <20170702000505.2650-1-cengizc@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hello.

This is my first patch attempt on drivers so I might be completely wrong.

applesmc driver was using the deprecated `hwmon_device_register` call for
some reason. And that causes a deprecation warning in dmesg.

I've replaced the call with `hwmon_device_register_with_info` and booted
my MBP 11,2 with it.

The warning is no longer shown. And the functionality doesn't seem to be
broken.

Thank you for reading this.

Signed-off-by: Cengiz Can <cengizc@gmail.com>
---
 drivers/hwmon/applesmc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 0af7fd311979..6e897310151a 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1326,7 +1326,11 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
+	hwmon_dev = hwmon_device_register_with_info(&pdev->dev,
+						   "applesmcbacklight",
+						   NULL,
+						   NULL,
+						   NULL);
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		goto out_light_ledclass;
-- 
2.13.2
