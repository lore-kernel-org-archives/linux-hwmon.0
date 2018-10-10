Return-Path: <b.zolnierkie@samsung.com>
Return-path: <b.zolnierkie@samsung.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] hwmon: (pmbus) remove redundant 'default n' from Kconfig
Date: Wed, 10 Oct 2018 16:35:57 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20181010143559eucas1p109d607c22ad0d3b2934ac92e14b02256~cRgTZHiWX1762717627eucas1p1I@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20181010143559eucas1p109d607c22ad0d3b2934ac92e14b02256@eucas1p1.samsung.com>
List-ID: <linux-hwmon@vger.kernel.org>

'default n' is the default value for any bool or tristate Kconfig
setting so there is no need to write it explicitly.

Also since commit f467c5640c29 ("kconfig: only write '# CONFIG_FOO
is not set' for visible symbols") the Kconfig behavior is the same
regardless of 'default n' being present or not:

    ...
    One side effect of (and the main motivation for) this change is making
    the following two definitions behave exactly the same:
    
        config FOO
                bool
    
        config FOO
                bool
                default n
    
    With this change, neither of these will generate a
    '# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
    That might make it clearer to people that a bare 'default n' is
    redundant.
    ...

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/hwmon/pmbus/Kconfig |   15 ---------------
 1 file changed, 15 deletions(-)

Index: b/drivers/hwmon/pmbus/Kconfig
===================================================================
--- a/drivers/hwmon/pmbus/Kconfig	2018-10-09 15:58:39.067122941 +0200
+++ b/drivers/hwmon/pmbus/Kconfig	2018-10-10 16:31:57.671888538 +0200
@@ -5,7 +5,6 @@
 menuconfig PMBUS
 	tristate "PMBus support"
 	depends on I2C
-	default n
 	help
 	  Say yes here if you want to enable PMBus support.
 
@@ -28,7 +27,6 @@ config SENSORS_PMBUS
 
 config SENSORS_ADM1275
 	tristate "Analog Devices ADM1275 and compatibles"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Analog
 	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293,
@@ -49,7 +47,6 @@ config SENSORS_IBM_CFFPS
 
 config SENSORS_IR35221
 	tristate "Infineon IR35221"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for the
 	  Infineon IR35221 controller.
@@ -59,7 +56,6 @@ config SENSORS_IR35221
 
 config SENSORS_LM25066
 	tristate "National Semiconductor LM25066 and compatibles"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for National
 	  Semiconductor LM25056, LM25066, LM5064, and LM5066.
@@ -69,7 +65,6 @@ config SENSORS_LM25066
 
 config SENSORS_LTC2978
 	tristate "Linear Technologies LTC2978 and compatibles"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Linear
 	  Technology LTC2974, LTC2975, LTC2977, LTC2978, LTC2980, LTC3880,
@@ -88,7 +83,6 @@ config SENSORS_LTC2978_REGULATOR
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Linear
 	  Technology LTC3815.
@@ -98,7 +92,6 @@ config SENSORS_LTC3815
 
 config SENSORS_MAX16064
 	tristate "Maxim MAX16064"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX16064.
@@ -108,7 +101,6 @@ config SENSORS_MAX16064
 
 config SENSORS_MAX20751
 	tristate "Maxim MAX20751"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX20751.
@@ -118,7 +110,6 @@ config SENSORS_MAX20751
 
 config SENSORS_MAX31785
 	tristate "Maxim MAX31785 and compatibles"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX31785.
@@ -128,7 +119,6 @@ config SENSORS_MAX31785
 
 config SENSORS_MAX34440
 	tristate "Maxim MAX34440 and compatibles"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX34440, MAX34441, MAX34446, MAX34451, MAX34460, and MAX34461.
@@ -138,7 +128,6 @@ config SENSORS_MAX34440
 
 config SENSORS_MAX8688
 	tristate "Maxim MAX8688"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX8688.
@@ -148,7 +137,6 @@ config SENSORS_MAX8688
 
 config SENSORS_TPS40422
 	tristate "TI TPS40422"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for TI
 	  TPS40422.
@@ -167,7 +155,6 @@ config SENSORS_TPS53679
 
 config SENSORS_UCD9000
 	tristate "TI UCD90120, UCD90124, UCD90160, UCD9090, UCD90910"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for TI
 	  UCD90120, UCD90124, UCD90160, UCD9090, UCD90910, Sequencer and System
@@ -178,7 +165,6 @@ config SENSORS_UCD9000
 
 config SENSORS_UCD9200
 	tristate "TI UCD9220, UCD9222, UCD9224, UCD9240, UCD9244, UCD9246, UCD9248"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for TI
 	  UCD9220, UCD9222, UCD9224, UCD9240, UCD9244, UCD9246, and UCD9248
@@ -189,7 +175,6 @@ config SENSORS_UCD9200
 
 config SENSORS_ZL6100
 	tristate "Intersil ZL6100 and compatibles"
-	default n
 	help
 	  If you say yes here you get hardware monitoring support for Intersil
 	  ZL2004, ZL2005, ZL2006, ZL2008, ZL2105, ZL2106, ZL6100, ZL6105,
