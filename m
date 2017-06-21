Return-Path: <venture@google.com>
Return-path: <venture@google.com>
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	raltherr@google.com,
	emilyshaffer@google.com,
	peterh@google.com
Subject: [PATCH 2/2] hwmon: (aspeed-pwm-tacho) Poll for fan_tach instead of sleep
Date: Tue, 20 Jun 2017 18:12:28 -0700
Message-Id: <20170621011228.25128-2-venture@google.com>
In-Reply-To: <20170621011228.25128-1-venture@google.com>
References: <20170621011228.25128-1-venture@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

The reference driver polled but mentioned it was possible to sleep
for a computed period to know when it's ready to read.  However, polling
is quick and works.  This also improves responsiveness from the driver.

Testing: tested on ast2400 on quanta-q71l

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index b2ab5612d8a4..a31d2648fb3a 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -163,6 +163,9 @@
 #define M_TACH_UNIT 0x00c0
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
