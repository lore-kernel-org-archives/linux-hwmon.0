Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:47578 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753950AbdIYXJj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:39 -0400
Received: by mail-pf0-f172.google.com with SMTP id u12so4587460pfl.4
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/9] hwmon: gpio-fan: Localize platform data
Date: Tue, 26 Sep 2017 01:09:05 +0200
Message-Id: <20170925230911.20824-4-linus.walleij@linaro.org>
In-Reply-To: <20170925230911.20824-1-linus.walleij@linaro.org>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

There is not a single user of the platform data header in
<linux/gpio-fan.h>. We can conclude that all current users are
probing from the device tree, so start simplifying the code by
pulling the header into the driver.

Convert "unsigned" to "unsigned int" in the process to make
checkpatch happy.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hwmon/gpio-fan.c | 23 ++++++++++++++++++++++-
 include/linux/gpio-fan.h | 36 ------------------------------------
 2 files changed, 22 insertions(+), 37 deletions(-)
 delete mode 100644 include/linux/gpio-fan.h

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index f29cee9398ef..cfa8d9b578dd 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -30,12 +30,33 @@
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
 #include <linux/gpio.h>
-#include <linux/gpio-fan.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/thermal.h>
 
+struct gpio_fan_alarm {
+	unsigned int	gpio;
+	unsigned int	active_low;
+};
+
+struct gpio_fan_speed {
+	int rpm;
+	int ctrl_val;
+};
+
+struct gpio_fan_platform_data {
+	int			num_ctrl;
+	unsigned int		*ctrl;	/* fan control GPIOs. */
+	struct gpio_fan_alarm	*alarm;	/* fan alarm GPIO. */
+	/*
+	 * Speed conversion array: rpm from/to GPIO bit field.
+	 * This array _must_ be sorted in ascending rpm order.
+	 */
+	int			num_speed;
+	struct gpio_fan_speed	*speed;
+};
+
 struct gpio_fan_data {
 	struct platform_device	*pdev;
 	struct device		*hwmon_dev;
diff --git a/include/linux/gpio-fan.h b/include/linux/gpio-fan.h
deleted file mode 100644
index 096659169215..000000000000
--- a/include/linux/gpio-fan.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * include/linux/gpio-fan.h
- *
- * Platform data structure for GPIO fan driver
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- */
-
-#ifndef __LINUX_GPIO_FAN_H
-#define __LINUX_GPIO_FAN_H
-
-struct gpio_fan_alarm {
-	unsigned	gpio;
-	unsigned	active_low;
-};
-
-struct gpio_fan_speed {
-	int rpm;
-	int ctrl_val;
-};
-
-struct gpio_fan_platform_data {
-	int			num_ctrl;
-	unsigned		*ctrl;	/* fan control GPIOs. */
-	struct gpio_fan_alarm	*alarm;	/* fan alarm GPIO. */
-	/*
-	 * Speed conversion array: rpm from/to GPIO bit field.
-	 * This array _must_ be sorted in ascending rpm order.
-	 */
-	int			num_speed;
-	struct gpio_fan_speed	*speed;
-};
-
-#endif /* __LINUX_GPIO_FAN_H */
-- 
2.13.5

