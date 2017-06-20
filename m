Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:35745 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752529AbdFTWA7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jun 2017 18:00:59 -0400
Received: by mail-pg0-f41.google.com with SMTP id 132so34739152pgb.2
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Jun 2017 15:00:59 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, raltherr@google.com
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) Poll register instead of sleep
Date: Tue, 20 Jun 2017 15:00:55 -0700
Message-Id: <20170620220055.6503-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The controller should provide an answer nearly immediately if the
fan_tach period is short.  I found through testing that the combination
of these factors improved the device driver responsiveness.

Testing: tested on quanta-q71l board with aspeed ast2400.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 86e2ea8287a7..9559c7b7e8c7 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -509,6 +509,7 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 				      u8 fan_tach_ch)
 {
 	u32 raw_data, tach_div, clk_source, sec, val;
+	u32 timeout = 0;
 	u8 fan_tach_ch_source, type, mode, both;
 
 	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
@@ -517,12 +518,17 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
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
+	while (!(val & RESULT_STATUS_MASK)) {
+		timeout++;
+		if (timeout > 25)
+			return -ETIMEDOUT;
+	}
 
 	raw_data = val & RESULT_VALUE_MASK;
 	tach_div = priv->type_fan_tach_clock_division[type];
-- 
2.13.1.611.g7e3b11ae1-goog

