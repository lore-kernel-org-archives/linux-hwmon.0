Return-Path: <arnd@arndb.de>
Return-path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Eric Anholt <eric@anholt.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Vadim Pasternak <vadimp@mellanox.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: rpi: fix link error against rpi_firmware module
Date: Mon,  9 Jul 2018 17:42:44 +0200
Message-Id: <20180709154301.1781663-1-arnd@arndb.de>
List-ID: <linux-hwmon@vger.kernel.org>

Compile-testing without CONFIG_RASPBERRYPI_FIRMWARE is possible, but we
cannot build the rpi hwmon driver into the kernel if the firmware code
is a loadable module:

drivers/hwmon/raspberrypi-hwmon.o: In function `rpi_hwmon_probe':
raspberrypi-hwmon.c:(.text+0x140): undefined reference to `rpi_firmware_property'
drivers/hwmon/raspberrypi-hwmon.o: In function `get_values_poll':
raspberrypi-hwmon.c:(.text+0x350): undefined reference to `rpi_firmware_property'

This adapts the dependency to disallow that combination.

Fixes: 3c493c885cf8 ("hwmon: Add support for RPi voltage sensor")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index a4e5d3c9fc71..81da17a42dc9 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1322,7 +1322,7 @@ config SENSORS_PWM_FAN
 
 config SENSORS_RASPBERRYPI_HWMON
 	tristate "Raspberry Pi voltage monitor"
-	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
+	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
 	help
 	  If you say yes here you get support for voltage sensor on the
 	  Raspberry Pi.
-- 
2.9.0
