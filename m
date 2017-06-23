Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f44.google.com ([74.125.83.44]:33000 "EHLO
        mail-pg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754035AbdFWBql (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2017 21:46:41 -0400
Received: by mail-pg0-f44.google.com with SMTP id f127so15158499pgc.0
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Jun 2017 18:46:41 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.aum, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, raltherr@google.com,
        emilyshaffer@google.com, peterh@google.com
Subject: [PATCH 2/2 v2] hwmon: (aspeed-pwm-tacho) Poll with short sleeps.
Date: Thu, 22 Jun 2017 18:46:37 -0700
Message-Id: <20170623014637.99846-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The reference driver polled but mentioned it was possible to sleep
for a computed period to know when it's ready to read.  However, polling
with minimal sleeps is quick and works.  This also improves responsiveness
from the driver.

Testing: tested on ast2400 on quanta-q71l

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index b2ab5612d8a4..b865541f4858 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -163,6 +163,9 @@
 #define M_TACH_UNIT 0x00c0
 #define INIT_FAN_CTRL 0xFF
 
+/* How long we sleep while waiting for an RPM result. */
+#define ASPEED_RPM_STATUS_SLEEP 500
+
 struct aspeed_pwm_tacho_data {
 	struct regmap *regmap;
 	unsigned long clk_freq;
@@ -508,7 +511,7 @@ static u32 aspeed_get_fan_tach_ch_measure_period(struct aspeed_pwm_tacho_data
 static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 				      u8 fan_tach_ch)
 {
-	u32 raw_data, tach_div, clk_source, sec, val;
+	u32 raw_data, tach_div, clk_source, msec, usec, val;
 	u8 fan_tach_ch_source, type, mode, both;
 
 	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
@@ -517,12 +520,16 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 	fan_tach_ch_source = priv->fan_tach_ch_source[fan_tach_ch];
 	type = priv->pwm_port_type[fan_tach_ch_source];
 
-	sec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
-	msleep(sec);
+	msec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
+	usec = msec * 1000;
 
-	regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
-	if (!(val & RESULT_STATUS_MASK))
-		return -ETIMEDOUT;
+	regmap_read_poll_timeout(
+		priv->regmap,
+		ASPEED_PTCR_RESULT,
+		val,
+		(val & RESULT_STATUS_MASK),
+		ASPEED_RPM_STATUS_SLEEP,
+		usec);
 
 	raw_data = val & RESULT_VALUE_MASK;
 	tach_div = priv->type_fan_tach_clock_division[type];
-- 
2.13.1.611.g7e3b11ae1-goog

