Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:44683 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdKSRQI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Nov 2017 12:16:08 -0500
Received: by mail-pg0-f68.google.com with SMTP id c123so5519310pga.11
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Nov 2017 09:16:08 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Drop unnecessary 'default n' from Kconfig
Date: Sun, 19 Nov 2017 09:16:02 -0800
Message-Id: <1511111762-6419-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

'default n' is default, so there is no need to specify it explicitly.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 530ff7c9234c..ef23553ff5cb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -26,11 +26,9 @@ if HWMON
 
 config HWMON_VID
 	tristate
-	default n
 
 config HWMON_DEBUG_CHIP
 	bool "Hardware Monitoring Chip debugging messages"
-	default n
 	help
 	  Say Y here if you want the I2C chip drivers to produce a bunch of
 	  debug messages to the system log.  Select this if you are having
@@ -42,7 +40,6 @@ comment "Native drivers"
 config SENSORS_AB8500
 	tristate "AB8500 thermal monitoring"
 	depends on AB8500_GPADC && AB8500_BM
-	default n
 	help
 	  If you say yes here you get support for the thermal sensor part
 	  of the AB8500 chip. The driver includes thermal management for
@@ -302,7 +299,6 @@ config SENSORS_APPLESMC
 	select NEW_LEDS
 	select LEDS_CLASS
 	select INPUT_POLLDEV
-	default n
 	help
 	  This driver provides support for the Apple System Management
 	  Controller, which provides an accelerometer (Apple Sudden Motion
@@ -678,7 +674,6 @@ config SENSORS_JC42
 config SENSORS_POWR1220
 	tristate "Lattice POWR1220 Power Monitoring"
 	depends on I2C
-	default n
 	help
 	  If you say yes here you get access to the hardware monitoring
 	  functions of the Lattice POWR1220 isp Power Supply Monitoring,
@@ -702,7 +697,6 @@ config SENSORS_LTC2945
 	tristate "Linear Technology LTC2945"
 	depends on I2C
 	select REGMAP_I2C
-	default n
 	help
 	  If you say yes here you get support for Linear Technology LTC2945
 	  I2C System Monitor.
@@ -727,7 +721,6 @@ config SENSORS_LTC2990
 config SENSORS_LTC4151
 	tristate "Linear Technology LTC4151"
 	depends on I2C
-	default n
 	help
 	  If you say yes here you get support for Linear Technology LTC4151
 	  High Voltage I2C Current and Voltage Monitor interface.
@@ -738,7 +731,6 @@ config SENSORS_LTC4151
 config SENSORS_LTC4215
 	tristate "Linear Technology LTC4215"
 	depends on I2C
-	default n
 	help
 	  If you say yes here you get support for Linear Technology LTC4215
 	  Hot Swap Controller I2C interface.
@@ -750,7 +742,6 @@ config SENSORS_LTC4222
 	tristate "Linear Technology LTC4222"
 	depends on I2C
 	select REGMAP_I2C
-	default n
 	help
 	  If you say yes here you get support for Linear Technology LTC4222
 	  Dual Hot Swap Controller I2C interface.
@@ -761,7 +752,6 @@ config SENSORS_LTC4222
 config SENSORS_LTC4245
 	tristate "Linear Technology LTC4245"
 	depends on I2C
-	default n
 	help
 	  If you say yes here you get support for Linear Technology LTC4245
 	  Multiple Supply Hot Swap Controller I2C interface.
@@ -773,7 +763,6 @@ config SENSORS_LTC4260
 	tristate "Linear Technology LTC4260"
 	depends on I2C
 	select REGMAP_I2C
-	default n
 	help
 	  If you say yes here you get support for Linear Technology LTC4260
 	  Positive Voltage Hot Swap Controller I2C interface.
@@ -784,7 +773,6 @@ config SENSORS_LTC4260
 config SENSORS_LTC4261
 	tristate "Linear Technology LTC4261"
 	depends on I2C
-	default n
 	help
 	  If you say yes here you get support for Linear Technology LTC4261
 	  Negative Voltage Hot Swap Controller I2C interface.
@@ -1276,7 +1264,6 @@ config SENSORS_NSA320
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
 	depends on I2C
-	default n
 	help
 	  If you say yes here you get support for Philips PCF8591 4-channel
 	  ADC, 1-channel DAC chips.
@@ -1459,7 +1446,6 @@ config SENSORS_SMSC47B397
 
 config SENSORS_SCH56XX_COMMON
 	tristate
-	default n
 
 config SENSORS_SCH5627
 	tristate "SMSC SCH5627"
@@ -1505,7 +1491,6 @@ config SENSORS_STTS751
 config SENSORS_SMM665
 	tristate "Summit Microelectronics SMM665"
 	depends on I2C
-	default n
 	help
 	  If you say yes here you get support for the hardware monitoring
 	  features of the Summit Microelectronics SMM665/SMM665B Six-Channel
@@ -1792,7 +1777,6 @@ config SENSORS_W83795
 config SENSORS_W83795_FANCTRL
 	bool "Include automatic fan control support (DANGEROUS)"
 	depends on SENSORS_W83795
-	default n
 	help
 	  If you say yes here, support for automatic fan speed control
 	  will be included in the driver.
-- 
2.7.4

