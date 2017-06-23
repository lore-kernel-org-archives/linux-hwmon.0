Return-Path: <venture@google.com>
Return-path: <venture@google.com>
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	emilyshaffer@google.com,
	peterh@google.com
Subject: [PATCH 2/2 v3] hwmon: (aspeed-pwm-tacho) Poll with short sleeps.
Date: Fri, 23 Jun 2017 08:05:42 -0700
Message-Id: <20170623150542.7088-1-venture@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

The reference driver polled but mentioned it was possible to sleep
for a computed period to know when it's ready to read.  However, polling
with minimal sleeps is quick and works.  This also improves responsiveness
from the driver.

Testing: tested on ast2400 on quanta-q71l

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index b2ab5612d8a4..cfcd769175e6 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -163,6 +163,9 @@
 #define M_TACH_UNIT 0x00c0
 #define INIT_FAN_CTRL 0xFF
 
+/* How long we sleep in us while waiting for an RPM result. */
+#define ASPEED_RPM_STATUS_SLEEP_USEC	500
+
 struct aspeed_pwm_tacho_data {
 	struct regmap *regmap;
 	unsigned long clk_freq;
@@ -508,8 +511,9 @@ static u32 aspeed_get_fan_tach_ch_measure_period(struct aspeed_pwm_tacho_data
 static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 				      u8 fan_tach_ch)
 {
-	u32 raw_data, tach_div, clk_source, sec, val;
+	u32 raw_data, tach_div, clk_source, msec, usec, val;
 	u8 fan_tach_ch_source, type, mode, both;
+	int ret;
 
 	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
 	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0x1 << fan_tach_ch);
@@ -517,12 +521,20 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 	fan_tach_ch_source = priv->fan_tach_ch_source[fan_tach_ch];
 	type = priv->pwm_port_type[fan_tach_ch_source];
 
-	sec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
-	msleep(sec);
+	msec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
+	usec = msec * 1000;
+
+	ret = regmap_read_poll_timeout(
+		priv->regmap,
+		ASPEED_PTCR_RESULT,
+		val,
+		(val & RESULT_STATUS_MASK),
+		ASPEED_RPM_STATUS_SLEEP_USEC,
+		usec);
 
-	regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
-	if (!(val & RESULT_STATUS_MASK))
-		return -ETIMEDOUT;
+	/* return -ETIMEDOUT if we didn't get an answer. */
+	if (ret)
+		return ret;
 
 	raw_data = val & RESULT_VALUE_MASK;
 	tach_div = priv->type_fan_tach_clock_division[type];
-- 
2.13.1.611.g7e3b11ae1-goog
