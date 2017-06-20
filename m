Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:36321 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752785AbdFTVll (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jun 2017 17:41:41 -0400
Received: by mail-pf0-f170.google.com with SMTP id x63so75157928pff.3
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Jun 2017 14:41:41 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, raltherr@google.com
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
Date: Tue, 20 Jun 2017 14:41:35 -0700
Message-Id: <20170620214135.195572-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Through testing a variety of fan_tach values 0xc0 was found to provide
ideal fan_tach read performance.  The fans were also as responsive to
speed changes as desired.  This is part of a performance tweak for the
responsiveness of the driver.

Tested: This was tested on the Quanta-Q71l.

Caveat: I found that if a fan is broken this fan_tach period is too
short if used to get a reliable response and ETIMEDOUT will return.
I also found that if I set a fan's PWM to below 30% it would have a
similar issue returning the fan_tach.  However, that was in combination
with another patch that mimics the reference driver behavior that no
longer sleeps.  In our DCs, we never expect to run fans below this
threshold and it increases the responsiveness of the read fan_tach
response.

If suggested, we could move these knobs into device-trees or allow
device-tree overrides to these defaults with very few edits.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 48403a2115be..9b0796ead21d 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -150,7 +150,7 @@
 #define M_PWM_PERIOD 0x5F
 #define M_TACH_CLK_DIV 0x00
 #define M_TACH_MODE 0x00
-#define M_TACH_UNIT 0x1000
+#define M_TACH_UNIT 0x00c0
 #define INIT_FAN_CTRL 0xFF
 
 struct aspeed_pwm_tacho_data {
-- 
2.13.1.518.g3df882009-goog

