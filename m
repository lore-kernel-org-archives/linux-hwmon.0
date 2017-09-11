Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:35016 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750911AbdIKWmB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2017 18:42:01 -0400
Received: by mail-pg0-f52.google.com with SMTP id 188so17852344pgb.2
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Sep 2017 15:42:01 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, linux@roeck-us.net
Cc: kunyi@google.com, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) increase fan tach period
Date: Mon, 11 Sep 2017 15:41:55 -0700
Message-Id: <20170911224155.146738-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The previous value reduced the time required to determine
the fan value, however, it's also used as the final timeout
mechanism.  The prevous value would work for any fan speed
greater than around 3k RPM.  This increased value, lets the fan
speeds return quickly but will wait longer to handle speeds below 3k
RPM.

Testing: this value was determined through experimentation on the ast2400
on the Quanta-q71l.  This configurations runs 8 fans attached to the
controller.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 69b97d45e3cb..f914e5f41048 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -161,7 +161,7 @@
  * 11: reserved.
  */
 #define M_TACH_MODE 0x02 /* 10b */
-#define M_TACH_UNIT 0x00c0
+#define M_TACH_UNIT 0x0210
 #define INIT_FAN_CTRL 0xFF
 
 /* How long we sleep in us while waiting for an RPM result. */
-- 
2.14.1.581.gf28d330327-goog

