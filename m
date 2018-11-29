Return-Path: <clabbe@baylibre.com>
Return-path: <clabbe@baylibre.com>
From: Corentin Labbe <clabbe@baylibre.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/2] hwmon: fix typo build -> built
Date: Thu, 29 Nov 2018 20:09:14 +0000
Message-Id: <1543522155-17406-1-git-send-email-clabbe@baylibre.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patch fix a typo where build is used instead of built.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/hwmon/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 532a0532d01b..100b7fce1412 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -179,7 +179,7 @@ config SENSORS_ADT7X10
 	  This module contains common code shared by the ADT7310/ADT7320 and
 	  ADT7410/ADT7420 temperature monitoring chip drivers.
 
-	  If build as a module, the module will be called adt7x10.
+	  If built as a module, the module will be called adt7x10.
 
 config SENSORS_ADT7310
 	tristate "Analog Devices ADT7310/ADT7320"
@@ -242,7 +242,7 @@ config SENSORS_ADT7475
 	  ADT7473, ADT7475, ADT7476 and ADT7490 hardware monitoring
 	  chips.
 
-	  This driver can also be build as a module.  If so, the module
+	  This driver can also be built as a module.  If so, the module
 	  will be called adt7475.
 
 config SENSORS_ASC7621
@@ -666,7 +666,7 @@ config SENSORS_JZ4740
 	  If you say yes here you get support for reading adc values from the ADCIN
 	  pin on Ingenic JZ4740 SoC based boards.
 
-	  This driver can also be build as a module. If so, the module will be
+	  This driver can also be built as a module. If so, the module will be
 	  called jz4740-hwmon.
 
 config SENSORS_JC42
@@ -1594,7 +1594,7 @@ config SENSORS_AMC6821
 	  If you say yes here you get support for the Texas Instruments
 	  AMC6821 hardware monitoring chips.
 
-	  This driver can also be build as a module.  If so, the module
+	  This driver can also be built as a module.  If so, the module
 	  will be called amc6821.
 
 config SENSORS_INA209
-- 
2.18.1
