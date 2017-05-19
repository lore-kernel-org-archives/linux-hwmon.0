Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: (nct6775) Use bitops
Date: Fri, 19 May 2017 11:05:57 -0700
Message-Id: <1495217160-32336-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Using bitops instead of shift operations makes the code easier to read.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 123 ++++++++++++++++++++++++------------------------
 1 file changed, 62 insertions(+), 61 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 2458b406f6aa..d506d8e3bb2c 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -58,6 +58,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include "lm75.h"
@@ -810,7 +811,7 @@ static u16 fan_to_reg(u32 fan, unsigned int divreg)
 static inline unsigned int
 div_from_reg(u8 reg)
 {
-	return 1 << reg;
+	return BIT(reg);
 }
 
 /*
@@ -1276,7 +1277,7 @@ static void nct6775_update_fan_div(struct nct6775_data *data)
 	data->fan_div[1] = (i & 0x70) >> 4;
 	i = nct6775_read_value(data, NCT6775_REG_FANDIV2);
 	data->fan_div[2] = i & 0x7;
-	if (data->has_fan & (1 << 3))
+	if (data->has_fan & BIT(3))
 		data->fan_div[3] = (i & 0x70) >> 4;
 }
 
@@ -1298,7 +1299,7 @@ static void nct6775_init_fan_div(struct nct6775_data *data)
 	 * We'll compute a better divider later on.
 	 */
 	for (i = 0; i < ARRAY_SIZE(data->fan_div); i++) {
-		if (!(data->has_fan & (1 << i)))
+		if (!(data->has_fan & BIT(i)))
 			continue;
 		if (data->fan_div[i] == 0) {
 			data->fan_div[i] = 7;
@@ -1321,7 +1322,7 @@ static void nct6775_init_fan_common(struct device *dev,
 	 * prevents the unnecessary warning when fanX_min is reported as 0.
 	 */
 	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
-		if (data->has_fan_min & (1 << i)) {
+		if (data->has_fan_min & BIT(i)) {
 			reg = nct6775_read_value(data, data->REG_FAN_MIN[i]);
 			if (!reg)
 				nct6775_write_value(data, data->REG_FAN_MIN[i],
@@ -1356,7 +1357,7 @@ static void nct6775_select_fan_div(struct device *dev,
 			div_from_reg(fan_div));
 
 		/* Preserve min limit if possible */
-		if (data->has_fan_min & (1 << nr)) {
+		if (data->has_fan_min & BIT(nr)) {
 			fan_min = data->fan_min[nr];
 			if (fan_div > data->fan_div[nr]) {
 				if (fan_min != 255 && fan_min > 1)
@@ -1387,7 +1388,7 @@ static void nct6775_update_pwm(struct device *dev)
 	bool duty_is_dc;
 
 	for (i = 0; i < data->pwm_num; i++) {
-		if (!(data->has_pwm & (1 << i)))
+		if (!(data->has_pwm & BIT(i)))
 			continue;
 
 		duty_is_dc = data->REG_PWM_MODE[i] &&
@@ -1457,7 +1458,7 @@ static void nct6775_update_pwm_limits(struct device *dev)
 	u16 reg_t;
 
 	for (i = 0; i < data->pwm_num; i++) {
-		if (!(data->has_pwm & (1 << i)))
+		if (!(data->has_pwm & BIT(i)))
 			continue;
 
 		for (j = 0; j < ARRAY_SIZE(data->fan_time); j++) {
@@ -1534,7 +1535,7 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
 
 		/* Measured voltages and limits */
 		for (i = 0; i < data->in_num; i++) {
-			if (!(data->have_in & (1 << i)))
+			if (!(data->have_in & BIT(i)))
 				continue;
 
 			data->in[i][0] = nct6775_read_value(data,
@@ -1549,14 +1550,14 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
 		for (i = 0; i < ARRAY_SIZE(data->rpm); i++) {
 			u16 reg;
 
-			if (!(data->has_fan & (1 << i)))
+			if (!(data->has_fan & BIT(i)))
 				continue;
 
 			reg = nct6775_read_value(data, data->REG_FAN[i]);
 			data->rpm[i] = data->fan_from_reg(reg,
 							  data->fan_div[i]);
 
-			if (data->has_fan_min & (1 << i))
+			if (data->has_fan_min & BIT(i))
 				data->fan_min[i] = nct6775_read_value(data,
 					   data->REG_FAN_MIN[i]);
 			data->fan_pulses[i] =
@@ -1571,7 +1572,7 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
 
 		/* Measured temperatures and limits */
 		for (i = 0; i < NUM_TEMP; i++) {
-			if (!(data->have_temp & (1 << i)))
+			if (!(data->have_temp & BIT(i)))
 				continue;
 			for (j = 0; j < ARRAY_SIZE(data->reg_temp); j++) {
 				if (data->reg_temp[j][i])
@@ -1580,7 +1581,7 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
 						data->reg_temp[j][i]);
 			}
 			if (i >= NUM_TEMP_FIXED ||
-			    !(data->have_temp_fixed & (1 << i)))
+			    !(data->have_temp_fixed & BIT(i)))
 				continue;
 			data->temp_offset[i]
 			  = nct6775_read_value(data, data->REG_TEMP_OFFSET[i]);
@@ -1801,7 +1802,7 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
 	struct nct6775_data *data = dev_get_drvdata(dev);
 	int in = index / 5;	/* voltage index */
 
-	if (!(data->have_in & (1 << in)))
+	if (!(data->have_in & BIT(in)))
 		return 0;
 
 	return attr->mode;
@@ -1911,7 +1912,7 @@ store_fan_min(struct device *dev, struct device_attribute *attr,
 		 * even with the highest divider (128)
 		 */
 		data->fan_min[nr] = 254;
-		new_div = 7; /* 128 == (1 << 7) */
+		new_div = 7; /* 128 == BIT(7) */
 		dev_warn(dev,
 			 "fan%u low limit %lu below minimum %u, set to minimum\n",
 			 nr + 1, val, data->fan_from_reg_min(254, 7));
@@ -1921,7 +1922,7 @@ store_fan_min(struct device *dev, struct device_attribute *attr,
 		 * even with the lowest divider (1)
 		 */
 		data->fan_min[nr] = 1;
-		new_div = 0; /* 1 == (1 << 0) */
+		new_div = 0; /* 1 == BIT(0) */
 		dev_warn(dev,
 			 "fan%u low limit %lu above maximum %u, set to maximum\n",
 			 nr + 1, val, data->fan_from_reg_min(1, 0));
@@ -2008,14 +2009,14 @@ static umode_t nct6775_fan_is_visible(struct kobject *kobj,
 	int fan = index / 6;	/* fan index */
 	int nr = index % 6;	/* attribute index */
 
-	if (!(data->has_fan & (1 << fan)))
+	if (!(data->has_fan & BIT(fan)))
 		return 0;
 
 	if (nr == 1 && data->ALARM_BITS[FAN_ALARM_BASE + fan] == -1)
 		return 0;
 	if (nr == 2 && data->BEEP_BITS[FAN_ALARM_BASE + fan] == -1)
 		return 0;
-	if (nr == 4 && !(data->has_fan_min & (1 << fan)))
+	if (nr == 4 && !(data->has_fan_min & BIT(fan)))
 		return 0;
 	if (nr == 5 && data->kind != nct6775)
 		return 0;
@@ -2193,7 +2194,7 @@ static umode_t nct6775_temp_is_visible(struct kobject *kobj,
 	int temp = index / 10;	/* temp index */
 	int nr = index % 10;	/* attribute index */
 
-	if (!(data->have_temp & (1 << temp)))
+	if (!(data->have_temp & BIT(temp)))
 		return 0;
 
 	if (nr == 2 && find_temp_source(data, temp, data->num_temp_alarms) < 0)
@@ -2215,7 +2216,7 @@ static umode_t nct6775_temp_is_visible(struct kobject *kobj,
 		return 0;
 
 	/* offset and type only apply to fixed sensors */
-	if (nr > 7 && !(data->have_temp_fixed & (1 << temp)))
+	if (nr > 7 && !(data->have_temp_fixed & BIT(temp)))
 		return 0;
 
 	return attr->mode;
@@ -2484,7 +2485,7 @@ show_pwm_temp_sel_common(struct nct6775_data *data, char *buf, int src)
 	int i, sel = 0;
 
 	for (i = 0; i < NUM_TEMP; i++) {
-		if (!(data->have_temp & (1 << i)))
+		if (!(data->have_temp & BIT(i)))
 			continue;
 		if (src == data->temp_src[i]) {
 			sel = i + 1;
@@ -2520,7 +2521,7 @@ store_pwm_temp_sel(struct device *dev, struct device_attribute *attr,
 		return err;
 	if (val == 0 || val > NUM_TEMP)
 		return -EINVAL;
-	if (!(data->have_temp & (1 << (val - 1))) || !data->temp_src[val - 1])
+	if (!(data->have_temp & BIT(val - 1)) || !data->temp_src[val - 1])
 		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
@@ -2562,7 +2563,7 @@ store_pwm_weight_temp_sel(struct device *dev, struct device_attribute *attr,
 		return err;
 	if (val > NUM_TEMP)
 		return -EINVAL;
-	if (val && (!(data->have_temp & (1 << (val - 1))) ||
+	if (val && (!(data->have_temp & BIT(val - 1)) ||
 		    !data->temp_src[val - 1]))
 		return -EINVAL;
 
@@ -2995,7 +2996,7 @@ static umode_t nct6775_pwm_is_visible(struct kobject *kobj,
 	int pwm = index / 36;	/* pwm index */
 	int nr = index % 36;	/* attribute index */
 
-	if (!(data->has_pwm & (1 << pwm)))
+	if (!(data->has_pwm & BIT(pwm)))
 		return 0;
 
 	if ((nr >= 14 && nr <= 18) || nr == 21)   /* weight */
@@ -3246,7 +3247,7 @@ static inline void nct6775_init_device(struct nct6775_data *data)
 
 	/* Enable temperature sensors if needed */
 	for (i = 0; i < NUM_TEMP; i++) {
-		if (!(data->have_temp & (1 << i)))
+		if (!(data->have_temp & BIT(i)))
 			continue;
 		if (!data->reg_temp_config[i])
 			continue;
@@ -3264,7 +3265,7 @@ static inline void nct6775_init_device(struct nct6775_data *data)
 	diode = nct6775_read_value(data, data->REG_DIODE);
 
 	for (i = 0; i < data->temp_fixed_num; i++) {
-		if (!(data->have_temp_fixed & (1 << i)))
+		if (!(data->have_temp_fixed & BIT(i)))
 			continue;
 		if ((tmp & (data->DIODE_MASK << i)))	/* diode */
 			data->temp_type[i]
@@ -3290,8 +3291,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 	if (data->kind == nct6775) {
 		regval = superio_inb(sioreg, 0x2c);
 
-		fan3pin = regval & (1 << 6);
-		pwm3pin = regval & (1 << 7);
+		fan3pin = regval & BIT(6);
+		pwm3pin = regval & BIT(7);
 
 		/* On NCT6775, fan4 shares pins with the fdc interface */
 		fan4pin = !(superio_inb(sioreg, 0x2A) & 0x80);
@@ -3360,21 +3361,21 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 	} else {	/* NCT6779D, NCT6791D, NCT6792D, or NCT6793D */
 		regval = superio_inb(sioreg, 0x1c);
 
-		fan3pin = !(regval & (1 << 5));
-		fan4pin = !(regval & (1 << 6));
-		fan5pin = !(regval & (1 << 7));
+		fan3pin = !(regval & BIT(5));
+		fan4pin = !(regval & BIT(6));
+		fan5pin = !(regval & BIT(7));
 
-		pwm3pin = !(regval & (1 << 0));
-		pwm4pin = !(regval & (1 << 1));
-		pwm5pin = !(regval & (1 << 2));
+		pwm3pin = !(regval & BIT(0));
+		pwm4pin = !(regval & BIT(1));
+		pwm5pin = !(regval & BIT(2));
 
 		fan4min = fan4pin;
 
 		if (data->kind == nct6791 || data->kind == nct6792 ||
 		    data->kind == nct6793) {
 			regval = superio_inb(sioreg, 0x2d);
-			fan6pin = (regval & (1 << 1));
-			pwm6pin = (regval & (1 << 0));
+			fan6pin = (regval & BIT(1));
+			pwm6pin = (regval & BIT(0));
 		} else {	/* NCT6779D */
 			fan6pin = false;
 			pwm6pin = false;
@@ -3403,7 +3404,7 @@ static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
 			continue;
 		src = nct6775_read_value(data, regp[i]);
 		src &= 0x1f;
-		if (!src || (*mask & (1 << src)))
+		if (!src || (*mask & BIT(src)))
 			continue;
 		if (src >= data->temp_label_num ||
 		    !strlen(data->temp_label[src]))
@@ -3411,8 +3412,8 @@ static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
 
 		index = __ffs(*available);
 		nct6775_write_value(data, data->REG_TEMP_SOURCE[index], src);
-		*available &= ~(1 << index);
-		*mask |= 1 << src;
+		*available &= ~BIT(index);
+		*mask |= BIT(src);
 	}
 }
 
@@ -3843,7 +3844,7 @@ static int nct6775_probe(struct platform_device *pdev)
 	default:
 		return -ENODEV;
 	}
-	data->have_in = (1 << data->in_num) - 1;
+	data->have_in = BIT(data->in_num) - 1;
 	data->have_temp = 0;
 
 	/*
@@ -3861,10 +3862,10 @@ static int nct6775_probe(struct platform_device *pdev)
 			continue;
 
 		src = nct6775_read_value(data, data->REG_TEMP_SOURCE[i]) & 0x1f;
-		if (!src || (mask & (1 << src)))
-			available |= 1 << i;
+		if (!src || (mask & BIT(src)))
+			available |= BIT(i);
 
-		mask |= 1 << src;
+		mask |= BIT(src);
 	}
 
 	/*
@@ -3881,7 +3882,7 @@ static int nct6775_probe(struct platform_device *pdev)
 			continue;
 
 		src = nct6775_read_value(data, data->REG_TEMP_SOURCE[i]) & 0x1f;
-		if (!src || (mask & (1 << src)))
+		if (!src || (mask & BIT(src)))
 			continue;
 
 		if (src >= data->temp_label_num ||
@@ -3892,12 +3893,12 @@ static int nct6775_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		mask |= 1 << src;
+		mask |= BIT(src);
 
 		/* Use fixed index for SYSTIN(1), CPUTIN(2), AUXTIN(3) */
 		if (src <= data->temp_fixed_num) {
-			data->have_temp |= 1 << (src - 1);
-			data->have_temp_fixed |= 1 << (src - 1);
+			data->have_temp |= BIT(src - 1);
+			data->have_temp_fixed |= BIT(src - 1);
 			data->reg_temp[0][src - 1] = reg_temp[i];
 			data->reg_temp[1][src - 1] = reg_temp_over[i];
 			data->reg_temp[2][src - 1] = reg_temp_hyst[i];
@@ -3917,7 +3918,7 @@ static int nct6775_probe(struct platform_device *pdev)
 			continue;
 
 		/* Use dynamic index for other sources */
-		data->have_temp |= 1 << s;
+		data->have_temp |= BIT(s);
 		data->reg_temp[0][s] = reg_temp[i];
 		data->reg_temp[1][s] = reg_temp_over[i];
 		data->reg_temp[2][s] = reg_temp_hyst[i];
@@ -3960,17 +3961,17 @@ static int nct6775_probe(struct platform_device *pdev)
 		 * are no duplicates.
 		 */
 		if (src != TEMP_SOURCE_VIRTUAL) {
-			if (mask & (1 << src))
+			if (mask & BIT(src))
 				continue;
-			mask |= 1 << src;
+			mask |= BIT(src);
 		}
 
 		/* Use fixed index for SYSTIN(1), CPUTIN(2), AUXTIN(3) */
 		if (src <= data->temp_fixed_num) {
-			if (data->have_temp & (1 << (src - 1)))
+			if (data->have_temp & BIT(src - 1))
 				continue;
-			data->have_temp |= 1 << (src - 1);
-			data->have_temp_fixed |= 1 << (src - 1);
+			data->have_temp |= BIT(src - 1);
+			data->have_temp_fixed |= BIT(src - 1);
 			data->reg_temp[0][src - 1] = reg_temp_mon[i];
 			data->temp_src[src - 1] = src;
 			continue;
@@ -3980,7 +3981,7 @@ static int nct6775_probe(struct platform_device *pdev)
 			continue;
 
 		/* Use dynamic index for other sources */
-		data->have_temp |= 1 << s;
+		data->have_temp |= BIT(s);
 		data->reg_temp[0][s] = reg_temp_mon[i];
 		data->temp_src[s] = src;
 		s++;
@@ -3996,13 +3997,13 @@ static int nct6775_probe(struct platform_device *pdev)
 	for (i = 0; i < data->temp_label_num - 1; i++) {
 		if (!reg_temp_alternate[i])
 			continue;
-		if (mask & (1 << (i + 1)))
+		if (mask & BIT(i + 1))
 			continue;
 		if (i < data->temp_fixed_num) {
-			if (data->have_temp & (1 << i))
+			if (data->have_temp & BIT(i))
 				continue;
-			data->have_temp |= 1 << i;
-			data->have_temp_fixed |= 1 << i;
+			data->have_temp |= BIT(i);
+			data->have_temp_fixed |= BIT(i);
 			data->reg_temp[0][i] = reg_temp_alternate[i];
 			if (i < num_reg_temp) {
 				data->reg_temp[1][i] = reg_temp_over[i];
@@ -4015,7 +4016,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		if (s >= NUM_TEMP)	/* Abort if no more space */
 			break;
 
-		data->have_temp |= 1 << s;
+		data->have_temp |= BIT(s);
 		data->reg_temp[0][s] = reg_temp_alternate[i];
 		data->temp_src[s] = i + 1;
 		s++;
@@ -4180,7 +4181,7 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 
 	/* Restore limits */
 	for (i = 0; i < data->in_num; i++) {
-		if (!(data->have_in & (1 << i)))
+		if (!(data->have_in & BIT(i)))
 			continue;
 
 		nct6775_write_value(data, data->REG_IN_MINMAX[0][i],
@@ -4190,7 +4191,7 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
-		if (!(data->has_fan_min & (1 << i)))
+		if (!(data->has_fan_min & BIT(i)))
 			continue;
 
 		nct6775_write_value(data, data->REG_FAN_MIN[i],
@@ -4198,7 +4199,7 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 	}
 
 	for (i = 0; i < NUM_TEMP; i++) {
-		if (!(data->have_temp & (1 << i)))
+		if (!(data->have_temp & BIT(i)))
 			continue;
 
 		for (j = 1; j < ARRAY_SIZE(data->reg_temp); j++)
-- 
2.7.4
