Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45957 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbeLZPjO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Dec 2018 10:39:14 -0500
Received: by mail-pg1-f194.google.com with SMTP id y4so7678579pgc.12
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Dec 2018 07:39:14 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Cook <mcook@mackal.net>
Subject: [PATCH] hwmon: (nct6775) Fix chip ID for NCT6798D
Date: Wed, 26 Dec 2018 07:39:10 -0800
Message-Id: <1545838750-20373-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The chip ID is 0xd42[8-f], not 0xd45[8-f].

Fixes: 0599682b826f ("hwmon: (nct6775) Add support for NCT6798D")
Reported-by: Michael Cook <mcook@mackal.net>
Cc: Michael Cook <mcook@mackal.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index c3040079b1cb..8f91e366866f 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -44,8 +44,8 @@
  * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
  * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
  *                                           (0xd451)
- * nct6798d    14      7       7       2+6    0xd458 0xc1    0x5ca3
- *                                           (0xd459)
+ * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
+ *                                           (0xd429)
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -138,7 +138,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6795_ID		0xd350
 #define SIO_NCT6796_ID		0xd420
 #define SIO_NCT6797_ID		0xd450
-#define SIO_NCT6798_ID		0xd458
+#define SIO_NCT6798_ID		0xd428
 #define SIO_ID_MASK		0xFFF8
 
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
-- 
2.7.4
