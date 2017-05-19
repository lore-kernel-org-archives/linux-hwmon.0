Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (nct6775) Rework temperature source and label handling
Date: Fri, 19 May 2017 11:05:58 -0700
Message-Id: <1495217160-32336-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1495217160-32336-1-git-send-email-linux@roeck-us.net>
References: <1495217160-32336-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Instead of checking if a temperature source has a label, use a bit mask
to determine if a temperature source is valid for a given chip.
This simplifies the code and, if necessary, lets us support chips with
unknown or incomplete labels.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 96 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index d506d8e3bb2c..9d8d25c54415 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -361,12 +361,24 @@ static const char *const nct6775_temp_label[] = {
 	"PCH_DIM3_TEMP"
 };
 
-static const u16 NCT6775_REG_TEMP_ALTERNATE[ARRAY_SIZE(nct6775_temp_label) - 1]
-	= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x661, 0x662, 0x664 };
+#define NCT6775_TEMP_MASK	0x001ffffe
 
-static const u16 NCT6775_REG_TEMP_CRIT[ARRAY_SIZE(nct6775_temp_label) - 1]
-	= { 0, 0, 0, 0, 0xa00, 0xa01, 0xa02, 0xa03, 0xa04, 0xa05, 0xa06,
-	    0xa07 };
+static const u16 NCT6775_REG_TEMP_ALTERNATE[32] = {
+	[13] = 0x661,
+	[14] = 0x662,
+	[15] = 0x664,
+};
+
+static const u16 NCT6775_REG_TEMP_CRIT[32] = {
+	[4] = 0xa00,
+	[5] = 0xa01,
+	[6] = 0xa02,
+	[7] = 0xa03,
+	[8] = 0xa04,
+	[9] = 0xa05,
+	[10] = 0xa06,
+	[11] = 0xa07
+};
 
 /* NCT6776 specific data */
 
@@ -435,11 +447,18 @@ static const char *const nct6776_temp_label[] = {
 	"BYTE_TEMP"
 };
 
-static const u16 NCT6776_REG_TEMP_ALTERNATE[ARRAY_SIZE(nct6776_temp_label) - 1]
-	= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x401, 0x402, 0x404 };
+#define NCT6776_TEMP_MASK	0x007ffffe
 
-static const u16 NCT6776_REG_TEMP_CRIT[ARRAY_SIZE(nct6776_temp_label) - 1]
-	= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x709, 0x70a };
+static const u16 NCT6776_REG_TEMP_ALTERNATE[32] = {
+	[14] = 0x401,
+	[15] = 0x402,
+	[16] = 0x404,
+};
+
+static const u16 NCT6776_REG_TEMP_CRIT[32] = {
+	[11] = 0x709,
+	[12] = 0x70a,
+};
 
 /* NCT6779 specific data */
 
@@ -526,17 +545,19 @@ static const char *const nct6779_temp_label[] = {
 	"Virtual_TEMP"
 };
 
-#define NCT6779_NUM_LABELS	(ARRAY_SIZE(nct6779_temp_label) - 5)
-#define NCT6791_NUM_LABELS	ARRAY_SIZE(nct6779_temp_label)
+#define NCT6779_TEMP_MASK	0x07ffff7e
+#define NCT6791_TEMP_MASK	0x87ffff7e
 
-static const u16 NCT6779_REG_TEMP_ALTERNATE[NCT6791_NUM_LABELS - 1]
+static const u16 NCT6779_REG_TEMP_ALTERNATE[32]
 	= { 0x490, 0x491, 0x492, 0x493, 0x494, 0x495, 0, 0,
 	    0, 0, 0, 0, 0, 0, 0, 0,
 	    0, 0x400, 0x401, 0x402, 0x404, 0x405, 0x406, 0x407,
 	    0x408, 0 };
 
-static const u16 NCT6779_REG_TEMP_CRIT[NCT6791_NUM_LABELS - 1]
-	= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x709, 0x70a };
+static const u16 NCT6779_REG_TEMP_CRIT[32] = {
+	[15] = 0x709,
+	[16] = 0x70a,
+};
 
 /* NCT6791 specific data */
 
@@ -603,6 +624,8 @@ static const char *const nct6792_temp_label[] = {
 	"Virtual_TEMP"
 };
 
+#define NCT6792_TEMP_MASK	0x9fffff7e
+
 static const char *const nct6793_temp_label[] = {
 	"",
 	"SYSTIN",
@@ -638,6 +661,8 @@ static const char *const nct6793_temp_label[] = {
 	"Virtual_TEMP"
 };
 
+#define NCT6793_TEMP_MASK	0xbfff037e
+
 /* NCT6102D/NCT6106D specific data */
 
 #define NCT6106_REG_VBAT	0x318
@@ -732,11 +757,16 @@ static const s8 NCT6106_BEEP_BITS[] = {
 	34, -1				/* intrusion0, intrusion1 */
 };
 
-static const u16 NCT6106_REG_TEMP_ALTERNATE[ARRAY_SIZE(nct6776_temp_label) - 1]
-	= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x51, 0x52, 0x54 };
+static const u16 NCT6106_REG_TEMP_ALTERNATE[32] = {
+	[14] = 0x51,
+	[15] = 0x52,
+	[16] = 0x54,
+};
 
-static const u16 NCT6106_REG_TEMP_CRIT[ARRAY_SIZE(nct6776_temp_label) - 1]
-	= { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x204, 0x205 };
+static const u16 NCT6106_REG_TEMP_CRIT[32] = {
+	[11] = 0x204,
+	[12] = 0x205,
+};
 
 static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
 {
@@ -851,7 +881,7 @@ struct nct6775_data {
 	u8 temp_src[NUM_TEMP];
 	u16 reg_temp_config[NUM_TEMP];
 	const char * const *temp_label;
-	int temp_label_num;
+	u32 temp_mask;
 
 	u16 REG_CONFIG;
 	u16 REG_VBAT;
@@ -2197,6 +2227,9 @@ static umode_t nct6775_temp_is_visible(struct kobject *kobj,
 	if (!(data->have_temp & BIT(temp)))
 		return 0;
 
+	if (nr == 1 && !data->temp_label)
+		return 0;
+
 	if (nr == 2 && find_temp_source(data, temp, data->num_temp_alarms) < 0)
 		return 0;				/* alarm */
 
@@ -3406,8 +3439,7 @@ static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
 		src &= 0x1f;
 		if (!src || (*mask & BIT(src)))
 			continue;
-		if (src >= data->temp_label_num ||
-		    !strlen(data->temp_label[src]))
+		if (!(data->temp_mask & BIT(src)))
 			continue;
 
 		index = __ffs(*available);
@@ -3465,7 +3497,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->fan_from_reg_min = fan_from_reg13;
 
 		data->temp_label = nct6776_temp_label;
-		data->temp_label_num = ARRAY_SIZE(nct6776_temp_label);
+		data->temp_mask = NCT6776_TEMP_MASK;
 
 		data->REG_VBAT = NCT6106_REG_VBAT;
 		data->REG_DIODE = NCT6106_REG_DIODE;
@@ -3543,7 +3575,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->speed_tolerance_limit = 15;
 
 		data->temp_label = nct6775_temp_label;
-		data->temp_label_num = ARRAY_SIZE(nct6775_temp_label);
+		data->temp_mask = NCT6775_TEMP_MASK;
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
 		data->REG_VBAT = NCT6775_REG_VBAT;
@@ -3615,7 +3647,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->speed_tolerance_limit = 63;
 
 		data->temp_label = nct6776_temp_label;
-		data->temp_label_num = ARRAY_SIZE(nct6776_temp_label);
+		data->temp_mask = NCT6776_TEMP_MASK;
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
 		data->REG_VBAT = NCT6775_REG_VBAT;
@@ -3687,7 +3719,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->speed_tolerance_limit = 63;
 
 		data->temp_label = nct6779_temp_label;
-		data->temp_label_num = NCT6779_NUM_LABELS;
+		data->temp_mask = NCT6779_TEMP_MASK;
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
 		data->REG_VBAT = NCT6775_REG_VBAT;
@@ -3768,15 +3800,17 @@ static int nct6775_probe(struct platform_device *pdev)
 		default:
 		case nct6791:
 			data->temp_label = nct6779_temp_label;
+			data->temp_mask = NCT6791_TEMP_MASK;
 			break;
 		case nct6792:
 			data->temp_label = nct6792_temp_label;
+			data->temp_mask = NCT6792_TEMP_MASK;
 			break;
 		case nct6793:
 			data->temp_label = nct6793_temp_label;
+			data->temp_mask = NCT6793_TEMP_MASK;
 			break;
 		}
-		data->temp_label_num = NCT6791_NUM_LABELS;
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
 		data->REG_VBAT = NCT6775_REG_VBAT;
@@ -3885,8 +3919,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		if (!src || (mask & BIT(src)))
 			continue;
 
-		if (src >= data->temp_label_num ||
-		    !strlen(data->temp_label[src])) {
+		if (!(data->temp_mask & BIT(src))) {
 			dev_info(dev,
 				 "Invalid temperature source %d at index %d, source register 0x%x, temp register 0x%x\n",
 				 src, i, data->REG_TEMP_SOURCE[i], reg_temp[i]);
@@ -3946,8 +3979,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		if (!src)
 			continue;
 
-		if (src >= data->temp_label_num ||
-		    !strlen(data->temp_label[src])) {
+		if (!(data->temp_mask & BIT(src))) {
 			dev_info(dev,
 				 "Invalid temperature source %d at index %d, source register 0x%x, temp register 0x%x\n",
 				 src, i, data->REG_TEMP_SEL[i],
@@ -3994,7 +4026,9 @@ static int nct6775_probe(struct platform_device *pdev)
 	 * The temperature is already monitored if the respective bit in <mask>
 	 * is set.
 	 */
-	for (i = 0; i < data->temp_label_num - 1; i++) {
+	for (i = 0; i < 32; i++) {
+		if (!(data->temp_mask & BIT(i)))
+			continue;
 		if (!reg_temp_alternate[i])
 			continue;
 		if (mask & BIT(i + 1))
-- 
2.7.4
