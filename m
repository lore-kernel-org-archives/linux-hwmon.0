Return-Path: <venture@google.com>
Return-path: <venture@google.com>
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	emilyshaffer@google.com,
	peterh@google.com
Subject: [PATCH 1/2 v4] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
Date: Sat, 24 Jun 2017 08:39:32 -0700
Message-Id: <20170624153932.8895-1-venture@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

Reduce the fan_tach period such that the fan controller uses a shorter
period to measure the rpm.

The original period of 0x1000 was chosen as a conversative value from the
reference implementation.  Through experimentation on the quanta-q71l
board, I was able to drive the number down which ultimately reduced the
time the controller would use to determine the fan_tach.  This value was
recently tested and accepted downstream on the IBM Zaius board which uses
the ast2500.

Future work: It may be worthwhile as this is a tunable parameter to the
system, to allow overriding it through the device tree.

Testing: Tested on an ast2400 sitting on a quanta-q71l and ast2500 on
power9.

Signed-off-by: Patrick Venture <venture@google.com>
---
v4: Added explanation for value.
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
