Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Joel Stanley <joel@jms.id.au>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) Select REGMAP
Date: Sat, 27 May 2017 06:54:35 -0700
Message-Id: <1495893275-32017-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

The driver uses regmap and thus has to select it to avoid build
errors such as the following.

drivers/hwmon/aspeed-pwm-tacho.c:337:21: error: variable
	'aspeed_pwm_tacho_regmap_config' has initializer but incomplete type

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 22d5eafd6815..5ef2814345ef 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -343,6 +343,7 @@ config SENSORS_ASB100
 
 config SENSORS_ASPEED
 	tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
+	select REGMAP
 	help
 	  This driver provides support for ASPEED AST2400/AST2500 PWM
 	  and Fan Tacho controllers.
-- 
2.7.4
