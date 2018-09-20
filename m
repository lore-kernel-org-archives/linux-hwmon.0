Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40593 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeITT3g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 15:29:36 -0400
Received: by mail-pl1-f193.google.com with SMTP id s17-v6so4380878plp.7
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Sep 2018 06:46:02 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/13] hwmon: (nct6775) Add support for NCT6797D
Date: Thu, 20 Sep 2018 06:45:40 -0700
Message-Id: <1537451141-27242-12-git-send-email-linux@roeck-us.net>
In-Reply-To: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
References: <1537451141-27242-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for NCT6797D. With the exception of fan/pwm configuration
registers, it is mostly compatible with NCT6795D.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 45 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 77255f7da974..9569acf80e18 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -42,6 +42,7 @@
  * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
  * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
  * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
+ * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -69,7 +70,7 @@
 #define USE_ALTERNATE
 
 enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
-	     nct6795, nct6796 };
+	     nct6795, nct6796, nct6797 };
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] = {
@@ -82,6 +83,7 @@ static const char * const nct6775_device_names[] = {
 	"nct6793",
 	"nct6795",
 	"nct6796",
+	"nct6797",
 };
 
 static const char * const nct6775_sio_names[] __initconst = {
@@ -94,6 +96,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6793D",
 	"NCT6795D",
 	"NCT6796D",
+	"NCT6797D",
 };
 
 static unsigned short force_id;
@@ -129,6 +132,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6793_ID		0xd120
 #define SIO_NCT6795_ID		0xd350
 #define SIO_NCT6796_ID		0xd420
+#define SIO_NCT6797_ID		0xd450
 #define SIO_ID_MASK		0xFFF0
 
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
@@ -504,7 +508,7 @@ static const s8 NCT6779_BEEP_BITS[] = {
 static const u16 NCT6779_REG_FAN[] = {
 	0x4c0, 0x4c2, 0x4c4, 0x4c6, 0x4c8, 0x4ca, 0x4ce };
 static const u16 NCT6779_REG_FAN_PULSES[NUM_FAN] = {
-	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
+	0x644, 0x645, 0x646, 0x647, 0x648, 0x649, 0x64f };
 
 static const u16 NCT6779_REG_CRITICAL_PWM_ENABLE[] = {
 	0x136, 0x236, 0x336, 0x836, 0x936, 0xa36, 0xb36 };
@@ -1288,6 +1292,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6793:
 	case nct6795:
 	case nct6796:
+	case nct6797:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
 		  (reg & 0xfff0) == 0x4c0 ||
 		  reg == 0x402 ||
@@ -1643,6 +1648,7 @@ static void nct6775_update_pwm_limits(struct device *dev)
 		case nct6793:
 		case nct6795:
 		case nct6796:
+		case nct6797:
 			reg = nct6775_read_value(data,
 					data->REG_CRITICAL_PWM_ENABLE[i]);
 			if (reg & data->CRITICAL_PWM_ENABLE_MASK)
@@ -3077,6 +3083,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6793:
 		case nct6795:
 		case nct6796:
+		case nct6797:
 			nct6775_write_value(data, data->REG_CRITICAL_PWM[nr],
 					    val);
 			reg = nct6775_read_value(data,
@@ -3496,7 +3503,11 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		fan3pin = !(cr24 & 0x80);
 		pwm3pin = cr24 & 0x08;
 	} else {
-		/* NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D */
+		/*
+		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
+		 * NCT6797D
+		 */
+		int cr1a = superio_inb(sioreg, 0x1a);
 		int cr1b = superio_inb(sioreg, 0x1b);
 		int cr1c = superio_inb(sioreg, 0x1c);
 		int cr1d = superio_inb(sioreg, 0x1d);
@@ -3505,6 +3516,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		int cr2d = superio_inb(sioreg, 0x2d);
 		int cr2f = superio_inb(sioreg, 0x2f);
 		bool dsw_en = cr2f & BIT(3);
+		bool ddr4_en = cr2f & BIT(4);
 		int cre0;
 		int creb;
 		int cred;
@@ -3577,6 +3589,23 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
 			break;
+		case nct6797:
+			fan5pin |= !ddr4_en && (cr1b & BIT(5));
+			fan5pin |= creb & BIT(5);
+
+			fan6pin = cr2a & BIT(4);
+			fan6pin |= creb & BIT(3);
+
+			fan7pin = cr1a & BIT(1);
+
+			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+			pwm5pin |= !ddr4_en && (cr2d & BIT(7));
+
+			pwm6pin = creb & BIT(2);
+			pwm6pin |= cred & BIT(2);
+
+			pwm7pin = cr1d & BIT(4);
+			break;
 		default:	/* NCT6779D */
 			break;
 		}
@@ -3954,8 +3983,10 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6793:
 	case nct6795:
 	case nct6796:
+	case nct6797:
 		data->in_num = 15;
-		data->pwm_num = (data->kind == nct6796) ? 7 : 6;
+		data->pwm_num = (data->kind == nct6796 ||
+				 data->kind == nct6797) ? 7 : 6;
 		data->auto_pwm_num = 4;
 		data->has_fan_div = false;
 		data->temp_fixed_num = 6;
@@ -3989,6 +4020,7 @@ static int nct6775_probe(struct platform_device *pdev)
 			data->virt_temp_mask = NCT6793_VIRT_TEMP_MASK;
 			break;
 		case nct6795:
+		case nct6797:
 			data->temp_label = nct6795_temp_label;
 			data->temp_mask = NCT6795_TEMP_MASK;
 			data->virt_temp_mask = NCT6795_VIRT_TEMP_MASK;
@@ -4267,6 +4299,7 @@ static int nct6775_probe(struct platform_device *pdev)
 	case nct6793:
 	case nct6795:
 	case nct6796:
+	case nct6797:
 		break;
 	}
 
@@ -4302,6 +4335,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		case nct6793:
 		case nct6795:
 		case nct6796:
+		case nct6797:
 			tmp |= 0x7e;
 			break;
 		}
@@ -4504,6 +4538,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	case SIO_NCT6796_ID:
 		sio_data->kind = nct6796;
 		break;
+	case SIO_NCT6797_ID:
+		sio_data->kind = nct6797;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
-- 
2.7.4
