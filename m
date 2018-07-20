Return-Path: <pbrobinson@gmail.com>
Return-path: <pbrobinson@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH] hwmon: rpi: add module alias to raspberrypi-hwmon
Date: Sat, 21 Jul 2018 00:02:12 +0100
Message-Id: <20180720230212.26006-1-pbrobinson@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

The raspberrypi-hwmon driver doesn't automatically load, although it does work
when loaded, by adding the alias it auto loads as expected when built as a
module. Tested on RPi2/RPi3 on 32 bit kernel and RPi3B+ on aarch64 with
Fedora 28 and a patched 4.18 RC kernel.

Fixes: q3c493c885cf ("hwmon: Add support for RPi voltage sensor")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
CC: Stefan Wahren <stefan.wahren@i2se.com>
CC: Eric Anholt <eric@anholt.net>
---
 drivers/hwmon/raspberrypi-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index fb4e4a6bb1f63..be5ba46908953 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -164,3 +164,4 @@ module_platform_driver(rpi_hwmon_driver);
 MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
 MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:raspberrypi-hwmon");
-- 
2.17.1
