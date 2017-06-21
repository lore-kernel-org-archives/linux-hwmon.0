Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:36552 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752592AbdFUAge (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jun 2017 20:36:34 -0400
Received: by mail-pf0-f180.google.com with SMTP id x63so76869875pff.3
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Jun 2017 17:36:34 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, raltherr@google.com,
        peterh@google.com, emilyshaffer@google.com
Subject: [PATCH v2] hwmon: (aspeed-pwm-tacho) Poll register instead of sleep
Date: Tue, 20 Jun 2017 17:36:29 -0700
Message-Id: <20170621003629.21795-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The controller should provide an answer nearly immediately if the
fan_tach period is short.  I found through testing that the combination
of these factors improved the device driver responsiveness.

Testing: tested on quanta-q71l board with aspeed ast2400 using a slightly
different tree.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 86e2ea8287a7..aa5174d0fd90 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -163,6 +163,9 @@
 #define M_TACH_UNIT 0x1000
 #define INIT_FAN_CTRL 0xFF
 
+/* How many times we poll the fan_tach controller for rpm data. */
+#define FAN_TACH_RPM_TIMEOUT 25
+
 struct aspeed_pwm_tacho_data {
 	struct regmap *regmap;
 	unsigned long clk_freq;
@@ -508,7 +511,7 @@ static u32 aspeed_get_fan_tach_ch_measure_period(struct aspeed_pwm_tacho_data
 static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 				      u8 fan_tach_ch)
 {
-	u32 raw_data, tach_div, clk_source, sec, val;
+	u32 raw_data, tach_div, clk_source, sec, val, timeout;
 	u8 fan_tach_ch_source, type, mode, both;
 
 	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
@@ -517,12 +520,20 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 	fan_tach_ch_source = priv->fan_tach_ch_source[fan_tach_ch];
 	type = priv->pwm_port_type[fan_tach_ch_source];
 
-	sec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
-	msleep(sec);
-
 	regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
-	if (!(val & RESULT_STATUS_MASK))
-		return -ETIMEDOUT;
+	/*
+	 * Instead of sleeping first, poll register for result.
+	 * This is based on the reference driver's approach which expects to
+	 * receive a value quickly.
+	 */
+	timeout = 0;
+	while (!(val & RESULT_STATUS_MASK)) {
+		timeout++;
+		if (timeout > FAN_TACH_RPM_TIMEOUT)
+			return -ETIMEDOUT;
+
+		regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
+	}
 
 	raw_data = val & RESULT_VALUE_MASK;
 	tach_div = priv->type_fan_tach_clock_division[type];
-- 
2.13.1.611.g7e3b11ae1-goog

