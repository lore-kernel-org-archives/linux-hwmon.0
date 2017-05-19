Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56171 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754641AbdESSGO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 May 2017 14:06:14 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (nct6775) Add support for NCT6795D
Date: Fri, 19 May 2017 11:06:00 -0700
Message-Id: <1495217160-32336-4-git-send-email-linux@roeck-us.net>
In-Reply-To: <1495217160-32336-1-git-send-email-linux@roeck-us.net>
References: <1495217160-32336-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

NCT6795D is mostly compatible to NCT6793D with a few minor differences.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 769daa78c560..c04c46f659c0 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -40,6 +40,8 @@
  * nct6791d    15      6       6       2+6    0xc800 0xc1    0x5ca3
  * nct6792d    15      6       6       2+6    0xc910 0xc1    0x5ca3
  * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
+ * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
+ *
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -65,7 +67,8 @@
 
 #define USE_ALTERNATE
 
-enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793 };
+enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
+	     nct6795 };
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] = {
@@ -76,6 +79,7 @@ static const char * const nct6775_device_names[] = {
 	"nct6791",
 	"nct6792",
 	"nct6793",
+	"nct6795",
 };
 
 static const char * const nct6775_sio_names[] __initconst = {
@@ -86,6 +90,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6791D",
 	"NCT6792D",
 	"NCT6793D",
+	"NCT6795D",
 };
 
 static unsigned short force_id;
@@ -119,6 +124,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6791_ID		0xc800
 #define SIO_NCT6792_ID		0xc910
 #define SIO_NCT6793_ID		0xd120
+#define SIO_NCT6795_ID		0xd350
 #define SIO_ID_MASK		0xFFF0
 
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
@@ -664,6 +670,43 @@ static const char *const nct6793_temp_label[] = {
 
 #define NCT6793_TEMP_MASK	0xbfff037e
 
+static const char *const nct6795_temp_label[] = {
+	"",
+	"SYSTIN",
+	"CPUTIN",
+	"AUXTIN0",
+	"AUXTIN1",
+	"AUXTIN2",
+	"AUXTIN3",
+	"",
+	"SMBUSMASTER 0",
+	"SMBUSMASTER 1",
+	"SMBUSMASTER 2",
+	"SMBUSMASTER 3",
+	"SMBUSMASTER 4",
+	"SMBUSMASTER 5",
+	"SMBUSMASTER 6",
+	"SMBUSMASTER 7",
+	"PECI Agent 0",
+	"PECI Agent 1",
+	"PCH_CHIP_CPU_MAX_TEMP",
+	"PCH_CHIP_TEMP",
+	"PCH_CPU_TEMP",
+	"PCH_MCH_TEMP",
+	"PCH_DIM0_TEMP",
+	"PCH_DIM1_TEMP",
+	"PCH_DIM2_TEMP",
+	"PCH_DIM3_TEMP",
+	"BYTE_TEMP0",
+	"BYTE_TEMP1",
+	"PECI Agent 0 Calibration",
+	"PECI Agent 1 Calibration",
+	"",
+	"Virtual_TEMP"
+};
+
+#define NCT6795_TEMP_MASK	0xbfffff7e
+
 /* NCT6102D/NCT6106D specific data */
 
 #define NCT6106_REG_VBAT	0x318
@@ -1187,6 +1230,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6791:
 	case nct6792:
 	case nct6793:
+	case nct6795:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
 		  ((reg & 0xfff0) == 0x4b0 && (reg & 0x000f) < 0x0b) ||
 		  reg == 0x402 ||
@@ -1539,6 +1583,7 @@ static void nct6775_update_pwm_limits(struct device *dev)
 		case nct6791:
 		case nct6792:
 		case nct6793:
+		case nct6795:
 			reg = nct6775_read_value(data,
 					data->REG_CRITICAL_PWM_ENABLE[i]);
 			if (reg & data->CRITICAL_PWM_ENABLE_MASK)
@@ -2958,6 +3003,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6791:
 		case nct6792:
 		case nct6793:
+		case nct6795:
 			nct6775_write_value(data, data->REG_CRITICAL_PWM[nr],
 					    val);
 			reg = nct6775_read_value(data,
@@ -3392,7 +3438,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		pwm4pin = false;
 		pwm5pin = false;
 		pwm6pin = false;
-	} else {	/* NCT6779D, NCT6791D, NCT6792D, or NCT6793D */
+	} else { /* NCT6779D, NCT6791D, NCT6792D, NCT6793D, or NCT6795D */
 		int regval_1b, regval_2a, regval_eb;
 
 		regval = superio_inb(sioreg, 0x1c);
@@ -3413,6 +3459,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			pwm6pin = regval & BIT(0);
 			break;
 		case nct6793:
+		case nct6795:
 			regval_1b = superio_inb(sioreg, 0x1b);
 			regval_2a = superio_inb(sioreg, 0x2a);
 
@@ -3808,6 +3855,7 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6791:
 	case nct6792:
 	case nct6793:
+	case nct6795:
 		data->in_num = 15;
 		data->pwm_num = 6;
 		data->auto_pwm_num = 4;
@@ -3839,6 +3887,10 @@ static int nct6775_probe(struct platform_device *pdev)
 			data->temp_label = nct6793_temp_label;
 			data->temp_mask = NCT6793_TEMP_MASK;
 			break;
+		case nct6795:
+			data->temp_label = nct6795_temp_label;
+			data->temp_mask = NCT6795_TEMP_MASK;
+			break;
 		}
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
@@ -4106,6 +4158,7 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6791:
 	case nct6792:
 	case nct6793:
+	case nct6795:
 		break;
 	}
 
@@ -4139,6 +4192,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		case nct6791:
 		case nct6792:
 		case nct6793:
+		case nct6795:
 			tmp |= 0x7e;
 			break;
 		}
@@ -4237,7 +4291,7 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 		superio_outb(sioreg, SIO_REG_ENABLE, data->sio_reg_enable);
 
 	if (data->kind == nct6791 || data->kind == nct6792 ||
-	    data->kind == nct6793)
+	    data->kind == nct6793 || data->kind == nct6795)
 		nct6791_enable_io_mapping(sioreg);
 
 	superio_exit(sioreg);
@@ -4334,6 +4388,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	case SIO_NCT6793_ID:
 		sio_data->kind = nct6793;
 		break;
+	case SIO_NCT6795_ID:
+		sio_data->kind = nct6795;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
@@ -4360,7 +4417,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	}
 
 	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
-	    sio_data->kind == nct6793)
+	    sio_data->kind == nct6793 || sio_data->kind == nct6795)
 		nct6791_enable_io_mapping(sioaddr);
 
 	superio_exit(sioaddr);
-- 
2.7.4

