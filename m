Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37880 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753086AbcKTWdG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2016 17:33:06 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (lm93) Fix overflows seen when writing into limit attributes
Date: Sun, 20 Nov 2016 14:32:59 -0800
Message-Id: <1479681180-6940-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1479681180-6940-1-git-send-email-linux@roeck-us.net>
References: <1479681180-6940-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Module test shows a large number of overflows, caused by missing clamps
as well as various conversions between variable types.

Also fix temperature calculations for hysteresis and offset registers.
For those, temperature calculations were a mix of millisecond and second
based, causing reported and accepted hysteresis and offset temperatures
to be widely off target.

This also changes the offset and base temperature attributes to be
officially reported and set in milli-degrees C. This was already the case
for the base temperature attribute, even though it was documented to be
reported and set in degrees C.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/lm93 | 26 +++++++++++++-------------
 drivers/hwmon/lm93.c     | 47 +++++++++++++++++++++++++----------------------
 2 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/Documentation/hwmon/lm93 b/Documentation/hwmon/lm93
index f3b2ad2ceb01..7bda7f0291e4 100644
--- a/Documentation/hwmon/lm93
+++ b/Documentation/hwmon/lm93
@@ -174,25 +174,25 @@ a "0" disables it. The h/w default is 0x0f (all temperatures bound).
 
 The function y = f(x) takes a source temperature x to a PWM output y.  This
 function of the LM93 is derived from a base temperature and a table of 12
-temperature offsets.  The base temperature is expressed in degrees C in the
-sysfs files temp<n>_auto_base.  The offsets are expressed in cumulative
-degrees C, with the value of offset <i> for temperature value <n> being
+temperature offsets.  The base temperature is expressed in milli-degrees C in
+the sysfs files temp<n>_auto_base.  The offsets are expressed in cumulative
+milli-degrees C, with the value of offset <i> for temperature value <n> being
 contained in the file temp<n>_auto_offset<i>.  E.g. if the base temperature
 is 40C:
 
      offset #	temp<n>_auto_offset<i>	range		pwm
 	 1		0		-		 25.00%
 	 2		0		-		 28.57%
-	 3		1		40C - 41C	 32.14%
-	 4		1		41C - 42C	 35.71%
-	 5		2		42C - 44C	 39.29%
-	 6		2		44C - 46C	 42.86%
-	 7		2		48C - 50C	 46.43%
-	 8		2		50C - 52C	 50.00%
-	 9		2		52C - 54C	 53.57%
-	10		2		54C - 56C	 57.14%
-	11		2		56C - 58C	 71.43%
-	12		2		58C - 60C	 85.71%
+	 3		500		40C - 41C	 32.14%
+	 4		500		41C - 42C	 35.71%
+	 5		1000		42C - 44C	 39.29%
+	 6		1000		44C - 46C	 42.86%
+	 7		1000		48C - 50C	 46.43%
+	 8		1000		50C - 52C	 50.00%
+	 9		1000		52C - 54C	 53.57%
+	10		1000		54C - 56C	 57.14%
+	11		1000		56C - 58C	 71.43%
+	12		1000		58C - 60C	 85.71%
 					> 60C		100.00%
 
 Valid offsets are in the range 0C <= x <= 7.5C in 0.5C increments.
diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index 90bb04858117..a7b9e4bc7eb6 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -368,7 +368,7 @@ static unsigned LM93_IN_FROM_REG(int nr, u8 reg)
  * IN: mV, limits determined by channel nr
  * REG: scaling determined by channel nr
  */
-static u8 LM93_IN_TO_REG(int nr, unsigned val)
+static u8 LM93_IN_TO_REG(int nr, unsigned long val)
 {
 	/* range limit */
 	const long mv = clamp_val(val,
@@ -407,9 +407,13 @@ static unsigned LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
  * upper also determines which nibble of the register is returned
  * (the other nibble will be 0x0)
  */
-static u8 LM93_IN_REL_TO_REG(unsigned val, int upper, int vid)
+static u8 LM93_IN_REL_TO_REG(unsigned long val, int upper, int vid)
 {
-	long uv_offset = vid * 1000 - val * 10000;
+	long uv_offset;
+
+	val = clamp_val(val, 0, 1000000);
+	uv_offset = vid * 1000 - val * 10000;
+
 	if (upper) {
 		uv_offset = clamp_val(uv_offset, 12500, 200000);
 		return (u8)((uv_offset /  12500 - 1) << 4);
@@ -453,28 +457,23 @@ static int LM93_TEMP_OFFSET_MODE_FROM_REG(u8 sfc2, int nr)
  * This function is common to all 4-bit temperature offsets
  * reg is 4 bits right justified
  * mode 0 => 1C/bit, mode !0 => 0.5C/bit
+ * Return value in milli-degrees C.
  */
 static int LM93_TEMP_OFFSET_FROM_REG(u8 reg, int mode)
 {
-	return (reg & 0x0f) * (mode ? 5 : 10);
+	return (reg & 0x0f) * (mode ? 500 : 1000);
 }
 
-#define LM93_TEMP_OFFSET_MIN  (0)
-#define LM93_TEMP_OFFSET_MAX0 (150)
-#define LM93_TEMP_OFFSET_MAX1 (75)
-
 /*
  * This function is common to all 4-bit temperature offsets
  * returns 4 bits right justified
  * mode 0 => 1C/bit, mode !0 => 0.5C/bit
+ * Input value is in milli-degrees C.
  */
-static u8 LM93_TEMP_OFFSET_TO_REG(int off, int mode)
+static u8 LM93_TEMP_OFFSET_TO_REG(long off, int mode)
 {
-	int factor = mode ? 5 : 10;
-
-	off = clamp_val(off, LM93_TEMP_OFFSET_MIN,
-		mode ? LM93_TEMP_OFFSET_MAX1 : LM93_TEMP_OFFSET_MAX0);
-	return (u8)((off + factor/2) / factor);
+	off = clamp_val(off, 0, mode ? 7500 : 15000);
+	return DIV_ROUND_CLOSEST(off, mode ? 500 : 1000);
 }
 
 /* 0 <= nr <= 3 */
@@ -494,7 +493,8 @@ static int LM93_TEMP_AUTO_OFFSET_FROM_REG(u8 reg, int nr, int mode)
  * REG: 1.0C/bit (mode 0) or 0.5C/bit (mode non-zero)
  * 0 <= nr <= 3
  */
-static u8 LM93_TEMP_AUTO_OFFSET_TO_REG(u8 old, int off, int nr, int mode)
+static u8 LM93_TEMP_AUTO_OFFSET_TO_REG(u8 old, unsigned long off, int nr,
+				       int mode)
 {
 	u8 new = LM93_TEMP_OFFSET_TO_REG(off, mode);
 
@@ -532,10 +532,13 @@ static int LM93_AUTO_BOOST_HYST_FROM_REGS(struct lm93_data *data, int nr,
 			LM93_TEMP_OFFSET_FROM_REG(reg, mode);
 }
 
-static u8 LM93_AUTO_BOOST_HYST_TO_REG(struct lm93_data *data, long hyst,
-		int nr, int mode)
+static u8 LM93_AUTO_BOOST_HYST_TO_REG(struct lm93_data *data,
+				      long hyst, int nr, int mode)
 {
-	u8 reg = LM93_TEMP_OFFSET_TO_REG(
+	u8 reg;
+
+	hyst = clamp_val(hyst, LM93_TEMP_MIN, LM93_TEMP_MAX);
+	reg = LM93_TEMP_OFFSET_TO_REG(
 			(LM93_TEMP_FROM_REG(data->boost[nr]) - hyst), mode);
 
 	switch (nr) {
@@ -592,7 +595,7 @@ static int LM93_PWM_FROM_REG(u8 reg, enum pwm_freq freq)
 }
 
 /* round up to nearest match */
-static u8 LM93_PWM_TO_REG(int pwm, enum pwm_freq freq)
+static u8 LM93_PWM_TO_REG(unsigned long pwm, enum pwm_freq freq)
 {
 	int i;
 	for (i = 0; i < 13; i++)
@@ -642,7 +645,7 @@ static int LM93_PWM_FREQ_FROM_REG(u8 reg)
 }
 
 /* round up to nearest match */
-static u8 LM93_PWM_FREQ_TO_REG(int freq)
+static u8 LM93_PWM_FREQ_TO_REG(unsigned long freq)
 {
 	int i;
 	for (i = 7; i > 0; i--)
@@ -1471,10 +1474,10 @@ static ssize_t store_temp_auto_boost_hyst(struct device *dev,
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long val;
+	long val;
 	int err;
 
-	err = kstrtoul(buf, 10, &val);
+	err = kstrtol(buf, 10, &val);
 	if (err)
 		return err;
 
-- 
2.5.0

