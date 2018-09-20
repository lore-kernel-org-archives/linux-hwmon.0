Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35161 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbeITT3h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id p12-v6so4413250pfh.2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:46:03 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/13] hwmon: (nct6775) Add support for NCT6798D
Date: Thu, 20 Sep 2018 06:45:41 -0700
Message-Id: <1537451141-27242-13-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

NCT6798D is, with the exception of fan and pwm channel configuration
registers, similar to other chips of the series. One interesting
difference is the chip ID, which is now extended to 13 bit (the 12-bit
chip ID value overlaps with the chip ID of NCT6797D).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 9569acf80e18..c3040079b1cb 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -43,6 +43,9 @@
  * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
  * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
  * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
+ *                                           (0xd451)
+ * nct6798d    14      7       7       2+6    0xd458 0xc1    0x5ca3
+ *                                           (0xd459)
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -70,7 +73,7 @@
 #define USE_ALTERNATE
 
 enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
-	     nct6795, nct6796, nct6797 };
+	     nct6795, nct6796, nct6797, nct6798 };
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] = {
@@ -84,6 +87,7 @@ static const char * const nct6775_device_names[] = {
 	"nct6795",
 	"nct6796",
 	"nct6797",
+	"nct6798",
 };
 
 static const char * const nct6775_sio_names[] __initconst = {
@@ -97,6 +101,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6795D",
 	"NCT6796D",
 	"NCT6797D",
+	"NCT6798D",
 };
 
 static unsigned short force_id;
@@ -133,7 +138,8 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6795_ID		0xd350
 #define SIO_NCT6796_ID		0xd420
 #define SIO_NCT6797_ID		0xd450
-#define SIO_ID_MASK		0xFFF0
+#define SIO_NCT6798_ID		0xd458
+#define SIO_ID_MASK		0xFFF8
 
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
@@ -761,6 +767,44 @@ static const char *const nct6796_temp_label[] = {
 #define NCT6796_TEMP_MASK	0xbfff0ffe
 #define NCT6796_VIRT_TEMP_MASK	0x80000c00
 
+static const char *const nct6798_temp_label[] = {
+	"",
+	"SYSTIN",
+	"CPUTIN",
+	"AUXTIN0",
+	"AUXTIN1",
+	"AUXTIN2",
+	"AUXTIN3",
+	"AUXTIN4",
+	"SMBUSMASTER 0",
+	"SMBUSMASTER 1",
+	"Virtual_TEMP",
+	"Virtual_TEMP",
+	"",
+	"",
+	"",
+	"",
+	"PECI Agent 0",
+	"PECI Agent 1",
+	"PCH_CHIP_CPU_MAX_TEMP",
+	"PCH_CHIP_TEMP",
+	"PCH_CPU_TEMP",
+	"PCH_MCH_TEMP",
+	"Agent0 Dimm0",
+	"Agent0 Dimm1",
+	"Agent1 Dimm0",
+	"Agent1 Dimm1",
+	"BYTE_TEMP0",
+	"BYTE_TEMP1",
+	"",
+	"",
+	"",
+	"Virtual_TEMP"
+};
+
+#define NCT6798_TEMP_MASK	0x8fff0ffe
+#define NCT6798_VIRT_TEMP_MASK	0x80000c00
+
 /* NCT6102D/NCT6106D specific data */
 
 #define NCT6106_REG_VBAT	0x318
@@ -1293,6 +1337,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6795:
 	case nct6796:
 	case nct6797:
+	case nct6798:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
 		  (reg & 0xfff0) == 0x4c0 ||
 		  reg == 0x402 ||
@@ -1649,6 +1694,7 @@ static void nct6775_update_pwm_limits(struct device *dev)
 		case nct6795:
 		case nct6796:
 		case nct6797:
+		case nct6798:
 			reg = nct6775_read_value(data,
 					data->REG_CRITICAL_PWM_ENABLE[i]);
 			if (reg & data->CRITICAL_PWM_ENABLE_MASK)
@@ -3084,6 +3130,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6795:
 		case nct6796:
 		case nct6797:
+		case nct6798:
 			nct6775_write_value(data, data->REG_CRITICAL_PWM[nr],
 					    val);
 			reg = nct6775_read_value(data,
@@ -3505,7 +3552,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 	} else {
 		/*
 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
-		 * NCT6797D
+		 * NCT6797D, NCT6798D
 		 */
 		int cr1a = superio_inb(sioreg, 0x1a);
 		int cr1b = superio_inb(sioreg, 0x1b);
@@ -3606,6 +3653,23 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 			pwm7pin = cr1d & BIT(4);
 			break;
+		case nct6798:
+			fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
+			fan6pin |= cr2a & BIT(4);
+			fan6pin |= creb & BIT(5);
+
+			fan7pin = cr1b & BIT(5);
+			fan7pin |= !(cr2b & BIT(2));
+			fan7pin |= creb & BIT(3);
+
+			pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
+			pwm6pin |= !(cred & BIT(2)) && (cr2a & BIT(3));
+			pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+
+			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
+			pwm7pin |= cr2d & BIT(7);
+			pwm7pin |= creb & BIT(2);
+			break;
 		default:	/* NCT6779D */
 			break;
 		}
@@ -3984,9 +4048,11 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6795:
 	case nct6796:
 	case nct6797:
+	case nct6798:
 		data->in_num = 15;
 		data->pwm_num = (data->kind == nct6796 ||
-				 data->kind == nct6797) ? 7 : 6;
+				 data->kind == nct6797 ||
+				 data->kind == nct6798) ? 7 : 6;
 		data->auto_pwm_num = 4;
 		data->has_fan_div = false;
 		data->temp_fixed_num = 6;
@@ -4030,6 +4096,11 @@ static int nct6775_probe(struct platform_device *pdev)
 			data->temp_mask = NCT6796_TEMP_MASK;
 			data->virt_temp_mask = NCT6796_VIRT_TEMP_MASK;
 			break;
+		case nct6798:
+			data->temp_label = nct6798_temp_label;
+			data->temp_mask = NCT6798_TEMP_MASK;
+			data->virt_temp_mask = NCT6798_VIRT_TEMP_MASK;
+			break;
 		}
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
@@ -4300,6 +4371,7 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6795:
 	case nct6796:
 	case nct6797:
+	case nct6798:
 		break;
 	}
 
@@ -4336,6 +4408,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		case nct6795:
 		case nct6796:
 		case nct6797:
+		case nct6798:
 			tmp |= 0x7e;
 			break;
 		}
@@ -4541,6 +4614,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	case SIO_NCT6797_ID:
 		sio_data->kind = nct6797;
 		break;
+	case SIO_NCT6798_ID:
+		sio_data->kind = nct6798;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
-- 
2.7.4
