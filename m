Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:34463 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753313AbdFXDju (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Jun 2017 23:39:50 -0400
Received: by mail-pf0-f179.google.com with SMTP id s66so31338307pfs.1
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jun 2017 20:39:50 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, emilyshaffer@google.com,
        peterh@google.com
Subject: [PATCH 1/2 v3] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
Date: Fri, 23 Jun 2017 20:39:46 -0700
Message-Id: <20170624033946.120501-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Reduce the fan_tach period such that the fan controller uses a shorter
period to measure the rpm.

Testing: Tested on an ast2400 sitting on a quanta-q71l.

Signed-off-by: Patrick Venture <venture@google.com>
---
v3: Added missing change log
v2: Updated commit message language
---
 drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 86e2ea8287a7..b2ab5612d8a4 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -160,7 +160,7 @@
  * 11: reserved.
  */
 #define M_TACH_MODE 0x02 /* 10b */
-#define M_TACH_UNIT 0x1000
+#define M_TACH_UNIT 0x00c0
 #define INIT_FAN_CTRL 0xFF
 
 struct aspeed_pwm_tacho_data {
-- 
2.13.1.611.g7e3b11ae1-goog

