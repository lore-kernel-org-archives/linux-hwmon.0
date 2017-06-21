Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:33083 "EHLO
        mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752633AbdFUBOx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jun 2017 21:14:53 -0400
Received: by mail-pf0-f173.google.com with SMTP id 83so77420246pfr.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Jun 2017 18:14:53 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, jdelvare@suse.com,
        linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, raltherr@google.com,
        emilyshaffer@google.com, peterh@google.com
Subject: [PATCH 1/2] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
Date: Tue, 20 Jun 2017 18:14:48 -0700
Message-Id: <20170621011448.25296-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Reduce the fan_tach period such that the fan controller uses a shorter
period to measure the rpm.

Testing: This was tested on an ast2400 sitting on a quanta-q71l.

Signed-off-by: Patrick Venture <venture@google.com>
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

