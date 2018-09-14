Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35775 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbeINWG2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Sep 2018 18:06:28 -0400
Received: by mail-pg1-f193.google.com with SMTP id 7-v6so4673788pgf.2
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Sep 2018 09:51:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Robert Kern <ulteq@web.de>
Subject: [PATCH v2 2/2] hwmon: (nct6775) Fix RPM output for fan7 on NCT6796D
Date: Fri, 14 Sep 2018 09:51:05 -0700
Message-Id: <1536943865-25699-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

fan7 on NCT6796D does not have a fan count register; it only has an RPM
register. Switch to using RPM registers to read the fan speed for all
chips supporting it to solve the problem for good.

Reported-by: Robert Kern <ulteq@web.de>
Cc: Robert Kern <ulteq@web.de>
Fixes: 81820059a428 ("hwmon: (nct6775) Add support for NCT6796D")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: NCT6795D/NCT6796D still have the old RPM registers, only the register
    at 0x660 is new and has to be used. Minimize required changes by using
    the 'old' RPM registers where possible.

 drivers/hwmon/nct6775.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 1e6f0e6ba740..b36c7b4ba227 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -501,8 +501,8 @@ static const s8 NCT6779_BEEP_BITS[] = {
 	16, 17, -1, -1, -1, -1,		/* temp1..temp6 */
 	30, 31 };			/* intrusion0, intrusion1 */
 
-static const u16 NCT6779_REG_FAN[] = {
-	0x4b0, 0x4b2, 0x4b4, 0x4b6, 0x4b8, 0x4ba, 0x660 };
+static const u16 NCT6779_REG_FAN_RPM[] = {
+	0x4c0, 0x4c2, 0x4c4, 0x4c6, 0x4c8, 0x4ca, 0x660 };
 static const u16 NCT6779_REG_FAN_PULSES[NUM_FAN] = {
 	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
 
@@ -984,6 +984,7 @@ struct nct6775_data {
 
 	const u16 *REG_TARGET;
 	const u16 *REG_FAN;
+	const u16 *REG_FAN_RPM;
 	const u16 *REG_FAN_MODE;
 	const u16 *REG_FAN_MIN;
 	const u16 *REG_FAN_PULSES;
@@ -1277,7 +1278,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6795:
 	case nct6796:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
-		  ((reg & 0xfff0) == 0x4b0 && (reg & 0x000f) < 0x0b) ||
+		  (reg & 0xfff0) == 0x4c0 ||
 		  reg == 0x402 ||
 		  reg == 0x63a || reg == 0x63c || reg == 0x63e ||
 		  reg == 0x640 || reg == 0x642 || reg == 0x64a ||
@@ -1676,10 +1677,6 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
 			if (!(data->has_fan & BIT(i)))
 				continue;
 
-			reg = nct6775_read_value(data, data->REG_FAN[i]);
-			data->rpm[i] = data->fan_from_reg(reg,
-							  data->fan_div[i]);
-
 			if (data->has_fan_min & BIT(i))
 				data->fan_min[i] = nct6775_read_value(data,
 					   data->REG_FAN_MIN[i]);
@@ -1691,7 +1688,16 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
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
@@ -3875,7 +3881,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
 		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
 		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6779_REG_FAN;
+		data->REG_FAN_RPM = NCT6779_REG_FAN_RPM;
 		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
 		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
 		data->REG_FAN_PULSES = NCT6779_REG_FAN_PULSES;
@@ -3976,7 +3982,7 @@ static int nct6775_probe(struct platform_device *pdev)
 		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
 		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
 		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6779_REG_FAN;
+		data->REG_FAN_RPM = NCT6779_REG_FAN_RPM;
 		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
 		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
 		data->REG_FAN_PULSES = NCT6779_REG_FAN_PULSES;
-- 
2.7.4
