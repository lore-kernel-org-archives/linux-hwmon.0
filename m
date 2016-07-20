Return-path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thilo Cestonaro <thilo@cestona.ro>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: ftsteutates: add watchdog dependency
Date: Wed, 20 Jul 2016 12:37:42 +0200
Message-Id: <20160720103809.2643157-1-arnd@arndb.de>
List-ID: <linux-hwmon@vger.kernel.org>

The newly added fts "Teutates" hwmon chip contains a watchdog but fails
to link when the watchdog subsystem is disabled:

drivers/hwmon/built-in.o: In function `fts_remove':
:(.text+0x161d8): undefined reference to `watchdog_unregister_device'
drivers/hwmon/built-in.o: In function `fts_probe':
:(.text+0x16cb4): undefined reference to `watchdog_register_device'

This adds a Kconfig dependency in the same way that the other
similar drivers have.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: ec9268ba1a96 ("hwmon: Add driver for FTS BMC chip "Teutates"")
---
 drivers/hwmon/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 15479eb15fa2..eaf2f916d48c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -488,7 +488,8 @@ config SENSORS_FSCHMD
 
 config SENSORS_FTSTEUTATES
 	tristate "Fujitsu Technology Solutions sensor chip Teutates"
-	depends on I2C
+	depends on I2C && WATCHDOG
+	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for the Fujitsu Technology
 	  Solutions (FTS) sensor chip "Teutates" including support for
-- 
2.9.0
