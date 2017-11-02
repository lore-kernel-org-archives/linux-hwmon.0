Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:56329 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934073AbdKBDyK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2017 23:54:10 -0400
From: Joel Stanley <joel@jms.id.au>
To: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hwmon: (aspeed-pwm-tacho) Sort headers
Date: Thu,  2 Nov 2017 14:53:47 +1100
Message-Id: <20171102035349.1902-2-joel@jms.id.au>
In-Reply-To: <20171102035349.1902-1-joel@jms.id.au>
References: <20171102035349.1902-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Sort the headers in preperation for future changes.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index f914e5f41048..63a95e23ca81 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -7,19 +7,19 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
-#include <linux/delay.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/sysfs.h>
 #include <linux/thermal.h>
 
 /* ASPEED PWM & FAN Tach Register Definition */
-- 
2.14.1

