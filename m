Return-Path: <arnd@arndb.de>
Return-path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"Edward A. James" <eajames@us.ibm.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: pmbus: ibm-cffps depends on LEDS_CLASS
Date: Fri, 12 Jan 2018 16:49:00 +0100
Message-Id: <20180112154926.3646202-1-arnd@arndb.de>
List-ID: <linux-hwmon@vger.kernel.org>

Building without CONFIG_LEDS_CLASS causes a link failure:

drivers/hwmon/pmbus/ibm-cffps.o: In function `ibm_cffps_probe':
ibm-cffps.c:(.text+0x4f4): undefined reference to `devm_of_led_classdev_register'

This adds the required dependency.

Fixes: f69316d62c70 ("hwmon: (pmbus) Add IBM Common Form Factor (CFF) power supply driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/pmbus/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 08479006c7f9..6e4298e99222 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -39,6 +39,7 @@ config SENSORS_ADM1275
 
 config SENSORS_IBM_CFFPS
 	tristate "IBM Common Form Factor Power Supply"
+	depends on LEDS_CLASS
 	help
 	  If you say yes here you get hardware monitoring support for the IBM
 	  Common Form Factor power supply.
-- 
2.9.0
