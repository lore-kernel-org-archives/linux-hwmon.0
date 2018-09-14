Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Robert Kern <ulteq@web.de>
Subject: [PATCH 2/2] hwmon: (nct6775) Fix RPM output for fan7 on NCT6796D
Date: Fri, 14 Sep 2018 09:32:54 -0700
Message-Id: <1536942774-23738-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1536942774-23738-1-git-send-email-linux@roeck-us.net>
References: <1536942774-23738-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

fan7 on NCT6796D does not have a fan count register; it only has an RPM
register. Switch to using RPM registers to read the fan speed for all
chips supporting it to solve the problem for good.

Reported-by: Robert Kern <ulteq@web.de>
Cc: Robert Kern <ulteq@web.de>
Fixes: 81820059a428 ("hwmon: (nct6775) Add support for NCT6796D")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 1e6f0e6ba740..c686a67ae133 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -501,8 +501,8 @@ static const s8 NCT6779_BEEP_BITS[] = {
 	16, 17, -1, -1, -1, -1,		/* temp1..temp6 */
 	30, 31 };			/* intrusion0, intrusion1 */
 
-static const u16 NCT6779_REG_FAN[] = {
-	0x4b0, 0x4b2, 0x4b4, 0x4b6, 0x4b8, 0x4ba, 0x660 };
+static const u16 NCT6779_REG_FAN_RPM[] = {
+	0x4c0, 0x4c2, 0x4c4, 0x4c6, 0x4c8, 0x4ca };
 static const u16 NCT6779_REG_FAN_PULSES[NUM_FAN] = {
 	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
 
@@ -677,6 +677,9 @@ static const char *const nct6793_temp_label[] = {
 
 #define NCT6793_TEMP_MASK	0xbfff037e
 
+static const u16 NCT6795_REG_FAN_RPM[] = {
+	0x656, 0x658, 0x65a, 0x65c, 0x65e, 0x654, 0x660 };
+
 static const char *const nct6795_temp_label[] = {
 	"",
 	"SYSTIN",
@@ -984,6 +987,7 @@ struct nct6775_data {
 
 	const u16 *REG_TARGET;
 	const u16 *REG_FAN;
+	const u16 *REG_FAN_RPM;
 	const u16 *REG_FAN_MODE;
 	const u16 *REG_FAN_MIN;
 	const u16 *REG_FAN_PULSES;
@@ -1277,11 +1281,12 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6795:
 	case nct6796:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
-		  ((reg & 0xfff0) == 0x4b0 && (reg & 0x000f) < 0x0b) ||
+		  (reg & 0xfff0) == 0x4c0 ||
 		  reg == 0x402 ||
 		  reg == 0x63a || reg == 0x63c || reg == 0x63e ||
 		  reg == 0x640 || reg == 0x642 || reg == 0x64a ||
-		  reg == 0x64c || reg == 0x660 ||
+		  reg == 0x64c ||
+		  (reg & 0xfff0) == 0x650 || reg == 0x660 ||
 		  reg == 0x73 || reg == 0x75 || reg == 0x77 || reg == 0x79 ||
 		  reg == 0x7b || reg == 0x7d;
 	}
@@ -1676,10 +1681,6 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
 			if (!(data->has_fan & BIT(i)))
 				continue;
 
-			reg = nct6775_read_value(data, data->REG_FAN[i]);
-			data->rpm[i] = data->fan_from_reg(reg,
-							  data->fan_div[i]);
-
 			if (data->has_fan_min & BIT(i))
 				data->fan_min[i] = nct6775_read_value(data,
 					   data->REG_FAN_MIN[i]);
@@ -1691,7 +1692,16 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
 				   >> data->FAN_PULSE_SHIFT[i]) & 0x03;
 			}
 
-			nct6775_select_fan_div(dev, data, i, reg);
+			if (data->REG_FAN) {
+				reg = nct6775_read_value(data,
+							data->REG_FAN[i]);
+				data->rpm[i] = data->fan_from_reg(reg,
+							data->fan_div[i]);
+				nct6775_select_fan_div(dev, data, i, reg);
+			} else {
+				data->rpm[i] = nct6775_read_value(data,
+							data->REG_FAN_RPM[i]);
+			}
 		}
 
 		nct6775_update_pwm(dev);
@@ -3875,7 +3885,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
 		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
 		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6779_REG_FAN;
+		data->REG_FAN_RPM = NCT6779_REG_FAN_RPM;
 		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
 		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
 		data->REG_FAN_PULSES = NCT6779_REG_FAN_PULSES;
@@ -3949,22 +3959,27 @@ static int nct6775_probe(struct platform_device *pdev)
 		case nct6791:
 			data->temp_label = nct6779_temp_label;
 			data->temp_mask = NCT6791_TEMP_MASK;
+			data->REG_FAN_RPM = NCT6779_REG_FAN_RPM;
 			break;
 		case nct6792:
 			data->temp_label = nct6792_temp_label;
 			data->temp_mask = NCT6792_TEMP_MASK;
+			data->REG_FAN_RPM = NCT6779_REG_FAN_RPM;
 			break;
 		case nct6793:
 			data->temp_label = nct6793_temp_label;
 			data->temp_mask = NCT6793_TEMP_MASK;
+			data->REG_FAN_RPM = NCT6779_REG_FAN_RPM;
 			break;
 		case nct6795:
 			data->temp_label = nct6795_temp_label;
 			data->temp_mask = NCT6795_TEMP_MASK;
+			data->REG_FAN_RPM = NCT6795_REG_FAN_RPM;
 			break;
 		case nct6796:
 			data->temp_label = nct6796_temp_label;
 			data->temp_mask = NCT6796_TEMP_MASK;
+			data->REG_FAN_RPM = NCT6795_REG_FAN_RPM;
 			break;
 		}
 
@@ -3976,7 +3991,6 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
 		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
 		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6779_REG_FAN;
 		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
 		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
 		data->REG_FAN_PULSES = NCT6779_REG_FAN_PULSES;
-- 
2.7.4
