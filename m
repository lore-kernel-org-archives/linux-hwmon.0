Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Juerg Haefliger <juergh@gmail.com>
Subject: [PATCH v2 1/3] hwmon: (dme1737) Fix overflows seen when writing into limit attributes
Date: Tue, 27 Dec 2016 14:15:05 -0800
Message-Id: <1482876907-25289-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Writes into voltage limit, temperature limit, temperature hysteresis,
and temperature zone attributes can overflow due to unclamped parameters
to multiplications, additions, and subtractions.

Cc: Juerg Haefliger <juergh@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Reorganize code to avoid double clamp in set_zone().

 drivers/hwmon/dme1737.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index 8763c4a8280c..dc7c26c68e6d 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -279,7 +279,8 @@ static inline int IN_FROM_REG(int reg, int nominal, int res)
 
 static inline int IN_TO_REG(long val, int nominal)
 {
-	return clamp_val((val * 192 + nominal / 2) / nominal, 0, 255);
+	val = clamp_val(val, 0, 255 * nominal / 192);
+	return DIV_ROUND_CLOSEST(val * 192, nominal);
 }
 
 /*
@@ -295,7 +296,8 @@ static inline int TEMP_FROM_REG(int reg, int res)
 
 static inline int TEMP_TO_REG(long val)
 {
-	return clamp_val((val < 0 ? val - 500 : val + 500) / 1000, -128, 127);
+	val = clamp_val(val, -128000, 127000);
+	return DIV_ROUND_CLOSEST(val, 1000);
 }
 
 /* Temperature range */
@@ -331,9 +333,10 @@ static inline int TEMP_HYST_FROM_REG(int reg, int ix)
 	return (((ix == 1) ? reg : reg >> 4) & 0x0f) * 1000;
 }
 
-static inline int TEMP_HYST_TO_REG(long val, int ix, int reg)
+static inline int TEMP_HYST_TO_REG(int temp, long hyst, int ix, int reg)
 {
-	int hyst = clamp_val((val + 500) / 1000, 0, 15);
+	hyst = clamp_val(hyst, temp - 15000, temp);
+	hyst = DIV_ROUND_CLOSEST(temp - hyst, 1000);
 
 	return (ix == 1) ? (reg & 0xf0) | hyst : (reg & 0x0f) | (hyst << 4);
 }
@@ -1022,7 +1025,9 @@ static ssize_t set_zone(struct device *dev, struct device_attribute *attr,
 	int ix = sensor_attr_2->index;
 	int fn = sensor_attr_2->nr;
 	long val;
+	int temp;
 	int err;
+	u8 reg;
 
 	err = kstrtol(buf, 10, &val);
 	if (err)
@@ -1035,10 +1040,9 @@ static ssize_t set_zone(struct device *dev, struct device_attribute *attr,
 		data->zone_low[ix] = dme1737_read(data,
 						  DME1737_REG_ZONE_LOW(ix));
 		/* Modify the temp hyst value */
-		data->zone_hyst[ix == 2] = TEMP_HYST_TO_REG(
-					TEMP_FROM_REG(data->zone_low[ix], 8) -
-					val, ix, dme1737_read(data,
-					DME1737_REG_ZONE_HYST(ix == 2)));
+		temp = TEMP_FROM_REG(data->zone_low[ix], 8);
+		reg = dme1737_read(data, DME1737_REG_ZONE_HYST(ix == 2));
+		data->zone_hyst[ix == 2] = TEMP_HYST_TO_REG(temp, val, ix, reg);
 		dme1737_write(data, DME1737_REG_ZONE_HYST(ix == 2),
 			      data->zone_hyst[ix == 2]);
 		break;
@@ -1055,10 +1059,10 @@ static ssize_t set_zone(struct device *dev, struct device_attribute *attr,
 		 * Modify the temp range value (which is stored in the upper
 		 * nibble of the pwm_freq register)
 		 */
-		data->pwm_freq[ix] = TEMP_RANGE_TO_REG(val -
-					TEMP_FROM_REG(data->zone_low[ix], 8),
-					dme1737_read(data,
-					DME1737_REG_PWM_FREQ(ix)));
+		temp = TEMP_FROM_REG(data->zone_low[ix], 8);
+		val = clamp_val(val, temp, temp + 80000);
+		reg = dme1737_read(data, DME1737_REG_PWM_FREQ(ix));
+		data->pwm_freq[ix] = TEMP_RANGE_TO_REG(val - temp, reg);
 		dme1737_write(data, DME1737_REG_PWM_FREQ(ix),
 			      data->pwm_freq[ix]);
 		break;
-- 
2.7.4
