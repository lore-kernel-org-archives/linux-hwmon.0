Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:54051 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751847AbdHOOuw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Aug 2017 10:50:52 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: aspeed: add THERMAL dependency
Date: Tue, 15 Aug 2017 16:47:47 +0200
Message-Id: <20170815144856.2059759-1-arnd@arndb.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

With CONFIG_THERMAL=m, a built-in aspeed pwm tacho driver causes
a link error:

drivers/hwmon/aspeed-pwm-tacho.o: In function `aspeed_pwm_tacho_probe':
aspeed-pwm-tacho.c:(.text+0x7f0): undefined reference to `thermal_of_cooling_device_register'

This adds a dependency similar to what other hwmon drivers use,
ensuring that the aspeed driver cannot be built-in in this
case but has to be a module. With THERMAL=n, we still allow building it.

Fixes: 2d7a548a3eff ("drivers: hwmon: Support for ASPEED PWM/Fan tach")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5ef2814345ef..5b9a61f766ac 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -343,6 +343,7 @@ config SENSORS_ASB100
 
 config SENSORS_ASPEED
 	tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
+	depends on THERMAL || THERMAL=n
 	select REGMAP
 	help
 	  This driver provides support for ASPEED AST2400/AST2500 PWM
-- 
2.9.0

