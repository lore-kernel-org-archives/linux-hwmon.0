Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2073C001DF
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 18:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjHBS7d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 14:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjHBS7b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 14:59:31 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1DAE46
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 11:59:26 -0700 (PDT)
Received: from [2a00:23c5:dcb6:1b33::b56] (helo=orangina.lan)
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qRH46-003si5-Hb; Wed, 02 Aug 2023 18:59:22 +0000
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH] hwmon: (nct6775) Additional TEMP registers for nct6799
Date:   Wed,  2 Aug 2023 19:58:21 +0100
Message-Id: <20230802185820.3642399-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Additional TEMP registers for nct6798d, nct6799d-r and nct6796d-s
This allows the max/max_hyst/crit attributes to be shown/stored

* Increase NUM_TEMP from 10 to 12
* Separate TEMP/MON_TEMP/OVER/HYST/CRIT registers
* Rename "PECI Calibration" to include "TSI" too
* Update ALARM/BEEP bits for temps for 6799
* For 6799, keep temp_fixed_num at 6, but increase
  num_temp_alarms/num_temp_beeps to 7/8

Tested with NCT6799D-R showing additional sysfs attributes:
* temp3-temp8: max/max_hyst/beep/alarm
* temp3-temp6: crit/offset

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---

Notes:
    Remarks on increasing temps, temp labels and testing
    
    * Increasing NUM_TEMP was a worry at first, but all access is
      protected by data->have_temp bitmask check, so other chips
      shouldn't go out of bounds.
      12 seems to be enough, 16 and higher is too much, not sure
      any single board would combine all those
    
    * AUXTIN3 connected to T_SENSOR on Asus board, so tested with
      HIGH/HYST/ALARM as well. AUXTIN4/AUXTIN5 pins not used as TEMP
    
    * On labels, since 'Source Select' labels for fan monitoring
      and OVT are different, but the sources are mixed when adding
      the different registers (temp/temp_mon/alternative), there
      will be labels that are not valid for that set of registers.
      But the source mask covers all the valid ones, so no
      unnecessary dmesg warning for invalid source.
    
    * For 6799d-r and 6796d-s, AUXTIN5 may be incorrectly labelled as
      "Virtual TEMP", but it's not worth carrying 2 sets of labels
      Maybe a note in the docs? Not sure.
      Also, keeping the temp_fixed_num to 6 helps avoid picking up
      AUXTIN5 and labelling it incorrectly as SMBUSMASTER0 as it's
      better picked up from REG_ALTERNATE instead.
        *DRIVER_LABEL - Monitoring*          *SMIOVT LABEL*
        0 1 0 1 0: Select Virtual_TEMP       0 1 0 1 0: Select AUXTIN5
        0 1 0 1 1: Select Virtual_TEMP       0 1 0 1 1: Reserved.
        0 1 1 0 0: Reserved.                 0 1 1 0 0: Reserved.
        0 1 1 0 1: Select AUXTIN5            0 1 1 0 1: Reserved.
    
    * 6796d-s mostly the same as 6799, but it has no PECI Calibration
      Again, no harm as it shouldn't have a reserved value set
      (6798 comment as *undocumented* but they're reserved there too)
        *DRIVER_LABEL*                       *6796d-s datasheet*
        1 1 1 0 0: PECI Agent 0 Cal...       1 1 1 0 0: Reserved.
        1 1 1 0 1: PECI Agent 1 Cal...       1 1 1 0 1: Reserved.
    
    * Sensors output
    SYSTIN:                        +35.0°C  (high = +80.0°C, hyst = +75.0°C)
                                            (crit = +125.0°C)  sensor = thermistor
    CPUTIN:                        +37.0°C  (high = +80.0°C, hyst = +75.0°C)
                                            (crit = +125.0°C)  sensor = thermistor
    AUXTIN0:                       +55.0°C  (high = +80.0°C, hyst = +75.0°C)
                                            (crit = +100.0°C)  sensor = thermistor
    AUXTIN1:                       +20.0°C  (high = +80.0°C, hyst = +75.0°C)
                                            (crit = +100.0°C)  sensor = thermistor
    AUXTIN2:                       +20.0°C  (high = +80.0°C, hyst = +75.0°C)
                                            (crit = +100.0°C)  sensor = thermistor
    AUXTIN3_TSENS:                 +26.0°C  (high = +30.0°C, hyst = +27.0°C)
                                            (crit = +100.0°C)  sensor = thermistor
    AUXTIN4:                       +25.0°C  (high = +80.0°C, hyst = +75.0°C)
                                            (crit = +100.0°C)
    PECI/TSI Agent 0 Calibration:  +37.0°C  (high = +80.0°C, hyst = +75.0°C)
    AUXTIN5:                       +24.0°C
    PCH_CHIP_CPU_MAX_TEMP:          +0.0°C
    PCH_CHIP_TEMP:                  +0.0°C
    PCH_CPU_TEMP:                   +0.0°C
    TSI0_TEMP:                     +40.0°C
    
    * Previously it would have been:
    
    SYSTIN:                    +33.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
    CPUTIN:                    +35.5°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
    AUXTIN0:                   +54.0°C    sensor = thermistor
    AUXTIN1:                   +20.0°C    sensor = thermistor
    AUXTIN2:                   +20.0°C    sensor = thermistor
    AUXTIN3_TSENSOR:           +22.0°C    sensor = thermistor
    PECI Agent 0 Calibration:  +35.5°C
    PCH_CHIP_CPU_MAX_TEMP:      +0.0°C
    PCH_CHIP_TEMP:              +0.0°C
    PCH_CPU_TEMP:               +0.0°C
    TSI0_TEMP:                 +37.5°C
    
    * And just for reference, here is what registers my board picked up.
      source 0x1c "PECI Calibration" is what's used by the fans/pwm_temp_sel
    
    nct6775: Found NCT6796D-S/NCT6799D-R or compatible chip at 0x2e:0x290
    nct6775: AK: max,  NUM_TEMP: 12, NUM_TEMP_FIXED: 6, NUM_TSI_TEMP: 8
    nct6775: AK: regs, num_reg_temp: 8, num_reg_temp_mon: 7, num_reg_tsi_temp: 2
    nct6775: AK: setting fixed temp,   index: 0, src: 0x01, reg: 0x027
    nct6775: AK: setting fixed temp,   index: 1, src: 0x02, reg: 0x150
    nct6775: AK: setting fixed temp,   index: 2, src: 0x03, reg: 0x670
    nct6775: AK: setting fixed temp,   index: 3, src: 0x04, reg: 0x672
    nct6775: AK: setting fixed temp,   index: 4, src: 0x05, reg: 0x674
    nct6775: AK: setting fixed temp,   index: 5, src: 0x06, reg: 0x676
    nct6775: AK: setting dynamic temp, index: 6, src: 0x07, reg: 0x678
    nct6775: AK: setting dynamic temp, index: 7, src: 0x1c, reg: 0x67a
    nct6775: AK: setting alternate temp (>fix), index: 12, src: 0x0d, reg: 0x4a2
    nct6775: AK: setting alternate temp (>fix), index: 17, src: 0x12, reg: 0x400
    nct6775: AK: setting alternate temp (>fix), index: 18, src: 0x13, reg: 0x401
    nct6775: AK: setting alternate temp (>fix), index: 19, src: 0x14, reg: 0x402
    nct6775: AK: setting TSI temp, index: 0, reg: 0x409

 drivers/hwmon/nct6775-core.c | 152 ++++++++++++++++++++++++++++-------
 drivers/hwmon/nct6775.h      |   2 +-
 2 files changed, 123 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 33533d95cf48..828460efb29a 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -617,6 +617,28 @@ static const char *const nct6796_temp_label[] = {
 
 static const u16 NCT6796_REG_TSI_TEMP[] = { 0x409, 0x40b };
 
+static const u16 NCT6798_REG_TEMP[] = {
+	0x27, 0x150, 0x670, 0x672, 0x674, 0x676, 0x678, 0x67a};
+
+static const u16 NCT6798_REG_TEMP_SOURCE[] = {
+	0x621, 0x622, 0xc26, 0xc27, 0xc28, 0xc29, 0xc2a, 0xc2b };
+
+static const u16 NCT6798_REG_TEMP_MON[] = {
+	0x73, 0x75, 0x77, 0x79, 0x7b, 0x7d, 0x4a0 };
+static const u16 NCT6798_REG_TEMP_OVER[] = {
+	0x39, 0x155, 0xc1a, 0xc1b, 0xc1c, 0xc1d, 0xc1e, 0xc1f };
+static const u16 NCT6798_REG_TEMP_HYST[] = {
+	0x3a, 0x153, 0xc20, 0xc21, 0xc22, 0xc23, 0xc24, 0xc25 };
+
+static const u16 NCT6798_REG_TEMP_CRIT[32] = {
+	0x135, 0x235, 0x335, 0x835, 0x935, 0xa35, 0xb35, 0 };
+
+static const u16 NCT6798_REG_TEMP_ALTERNATE[32] = {
+	0x490, 0x491, 0x492, 0x493, 0x494, 0x495, 0x496, 0,
+	0, 0, 0, 0, 0x4a2, 0, 0, 0,
+	0, 0x400, 0x401, 0x402, 0x404, 0x405, 0x406, 0x407,
+	0x408, 0x419, 0x41a, 0x4f4, 0x4f5 };
+
 static const char *const nct6798_temp_label[] = {
 	"",
 	"SYSTIN",
@@ -655,11 +677,14 @@ static const char *const nct6798_temp_label[] = {
 #define NCT6798_TEMP_MASK	0xbfff0ffe
 #define NCT6798_VIRT_TEMP_MASK	0x80000c00
 
+static const u16 NCT6799_REG_ALARM[NUM_REG_ALARM] = {
+	0x459, 0x45A, 0x45B, 0x568, 0x45D, 0xc01 };
+
 static const s8 NCT6799_ALARM_BITS[NUM_ALARM_BITS] = {
 	 0,  1,  2,  3,  8, -1, 20, 16, 17, 24, 25, 26,	  /* in0-in11     */
 	27, 28, 29, 30, 31, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
 	 6,  7, 11, 10, 23, 33, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
-	 4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	 4,  5, 40, 41, 42, 43, 44, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
 	12,  9,						  /* intr0-intr1  */
 };
 
@@ -667,10 +692,11 @@ static const s8 NCT6799_BEEP_BITS[NUM_BEEP_BITS] = {
 	 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11,	  /* in0-in11     */
 	12, 13, 14, 15, 34, 35, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
 	25, 26, 27, 28, 29, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
-	16, 17, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	16, 17, 18, 19, 20, 21, 22, 23, -1, -1, -1, -1,	  /* temp1-temp12 */
 	30, 31, 24					  /* intr0-intr1, beep_en */
 };
 
+/* PECI Calibration only for NCT6799D, not NCT6796D-S */
 static const char *const nct6799_temp_label[] = {
 	"",
 	"SYSTIN",
@@ -700,8 +726,8 @@ static const char *const nct6799_temp_label[] = {
 	"Agent1 Dimm1",
 	"BYTE_TEMP0",
 	"BYTE_TEMP1",
-	"PECI Agent 0 Calibration",	/* undocumented */
-	"PECI Agent 1 Calibration",	/* undocumented */
+	"PECI/TSI Agent 0 Calibration",
+	"PECI/TSI Agent 1 Calibration",
 	"",
 	"Virtual_TEMP"
 };
@@ -3869,13 +3895,9 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 	case nct6795:
 	case nct6796:
 	case nct6797:
-	case nct6798:
-	case nct6799:
 		data->in_num = 15;
 		data->pwm_num = (data->kind == nct6796 ||
-				 data->kind == nct6797 ||
-				 data->kind == nct6798 ||
-				 data->kind == nct6799) ? 7 : 6;
+				 data->kind == nct6797) ? 7 : 6;
 		data->auto_pwm_num = 4;
 		data->has_fan_div = false;
 		data->temp_fixed_num = 6;
@@ -3919,16 +3941,6 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 			data->temp_mask = NCT6796_TEMP_MASK;
 			data->virt_temp_mask = NCT6796_VIRT_TEMP_MASK;
 			break;
-		case nct6798:
-			data->temp_label = nct6798_temp_label;
-			data->temp_mask = NCT6798_TEMP_MASK;
-			data->virt_temp_mask = NCT6798_VIRT_TEMP_MASK;
-			break;
-		case nct6799:
-			data->temp_label = nct6799_temp_label;
-			data->temp_mask = NCT6799_TEMP_MASK;
-			data->virt_temp_mask = NCT6799_VIRT_TEMP_MASK;
-			break;
 		}
 
 		data->REG_CONFIG = NCT6775_REG_CONFIG;
@@ -3987,14 +3999,6 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		case nct6795:
 		case nct6796:
 		case nct6797:
-		case nct6798:
-			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
-			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
-			break;
-		case nct6799:
-			data->in_num = 18;
-			data->ALARM_BITS = NCT6799_ALARM_BITS;
-			data->BEEP_BITS = NCT6799_BEEP_BITS;
 			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
 			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
 			break;
@@ -4003,9 +4007,6 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 			break;
 		}
 
-		if (data->kind == nct6798 || data->kind == nct6799)
-			data->scale_in = scale_in_6798;
-
 		reg_temp = NCT6779_REG_TEMP;
 		num_reg_temp = ARRAY_SIZE(NCT6779_REG_TEMP);
 		if (data->kind == nct6791) {
@@ -4021,6 +4022,97 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_alternate = NCT6779_REG_TEMP_ALTERNATE;
 		reg_temp_crit = NCT6779_REG_TEMP_CRIT;
 
+		break;
+	case nct6798:
+	case nct6799:
+		data->in_num = data->kind == nct6799 ? 18 : 15;
+		data->scale_in = scale_in_6798;
+		data->pwm_num = 7;
+		data->auto_pwm_num = 4;
+		data->has_fan_div = false;
+		data->temp_fixed_num = 6;
+		data->num_temp_alarms = 7;
+		data->num_temp_beeps = 8;
+
+		data->ALARM_BITS = NCT6799_ALARM_BITS;
+		data->BEEP_BITS = NCT6799_BEEP_BITS;
+
+		data->fan_from_reg = fan_from_reg_rpm;
+		data->fan_from_reg_min = fan_from_reg13;
+		data->target_temp_mask = 0xff;
+		data->tolerance_mask = 0x07;
+		data->speed_tolerance_limit = 63;
+
+		switch (data->kind) {
+		default:
+		case nct6798:
+			data->temp_label = nct6798_temp_label;
+			data->temp_mask = NCT6798_TEMP_MASK;
+			data->virt_temp_mask = NCT6798_VIRT_TEMP_MASK;
+			break;
+		case nct6799:
+			data->temp_label = nct6799_temp_label;
+			data->temp_mask = NCT6799_TEMP_MASK;
+			data->virt_temp_mask = NCT6799_VIRT_TEMP_MASK;
+			break;
+		}
+
+		data->REG_CONFIG = NCT6775_REG_CONFIG;
+		data->REG_VBAT = NCT6775_REG_VBAT;
+		data->REG_DIODE = NCT6775_REG_DIODE;
+		data->DIODE_MASK = NCT6775_DIODE_MASK;
+		data->REG_VIN = NCT6779_REG_IN;
+		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
+		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
+		data->REG_TARGET = NCT6775_REG_TARGET;
+		data->REG_FAN = NCT6779_REG_FAN;
+		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
+		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
+		data->REG_FAN_PULSES = NCT6779_REG_FAN_PULSES;
+		data->FAN_PULSE_SHIFT = NCT6775_FAN_PULSE_SHIFT;
+		data->REG_FAN_TIME[0] = NCT6775_REG_FAN_STOP_TIME;
+		data->REG_FAN_TIME[1] = NCT6776_REG_FAN_STEP_UP_TIME;
+		data->REG_FAN_TIME[2] = NCT6776_REG_FAN_STEP_DOWN_TIME;
+		data->REG_TOLERANCE_H = NCT6776_REG_TOLERANCE_H;
+		data->REG_PWM[0] = NCT6775_REG_PWM;
+		data->REG_PWM[1] = NCT6775_REG_FAN_START_OUTPUT;
+		data->REG_PWM[2] = NCT6775_REG_FAN_STOP_OUTPUT;
+		data->REG_PWM[5] = NCT6791_REG_WEIGHT_DUTY_STEP;
+		data->REG_PWM[6] = NCT6791_REG_WEIGHT_DUTY_BASE;
+		data->REG_PWM_READ = NCT6775_REG_PWM_READ;
+		data->REG_PWM_MODE = NCT6776_REG_PWM_MODE;
+		data->PWM_MODE_MASK = NCT6776_PWM_MODE_MASK;
+		data->REG_AUTO_TEMP = NCT6775_REG_AUTO_TEMP;
+		data->REG_AUTO_PWM = NCT6775_REG_AUTO_PWM;
+		data->REG_CRITICAL_TEMP = NCT6775_REG_CRITICAL_TEMP;
+		data->REG_CRITICAL_TEMP_TOLERANCE
+		  = NCT6775_REG_CRITICAL_TEMP_TOLERANCE;
+		data->REG_CRITICAL_PWM_ENABLE = NCT6779_REG_CRITICAL_PWM_ENABLE;
+		data->CRITICAL_PWM_ENABLE_MASK
+		  = NCT6779_CRITICAL_PWM_ENABLE_MASK;
+		data->REG_CRITICAL_PWM = NCT6779_REG_CRITICAL_PWM;
+		data->REG_TEMP_OFFSET = NCT6779_REG_TEMP_OFFSET;
+		data->REG_TEMP_SOURCE = NCT6798_REG_TEMP_SOURCE;
+		data->REG_TEMP_SEL = NCT6775_REG_TEMP_SEL;
+		data->REG_WEIGHT_TEMP_SEL = NCT6791_REG_WEIGHT_TEMP_SEL;
+		data->REG_WEIGHT_TEMP[0] = NCT6791_REG_WEIGHT_TEMP_STEP;
+		data->REG_WEIGHT_TEMP[1] = NCT6791_REG_WEIGHT_TEMP_STEP_TOL;
+		data->REG_WEIGHT_TEMP[2] = NCT6791_REG_WEIGHT_TEMP_BASE;
+		data->REG_ALARM = NCT6799_REG_ALARM;
+		data->REG_BEEP = NCT6792_REG_BEEP;
+		data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
+		num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
+
+		reg_temp = NCT6798_REG_TEMP;
+		num_reg_temp = ARRAY_SIZE(NCT6798_REG_TEMP);
+		reg_temp_mon = NCT6798_REG_TEMP_MON;
+		num_reg_temp_mon = ARRAY_SIZE(NCT6798_REG_TEMP_MON);
+		reg_temp_over = NCT6798_REG_TEMP_OVER;
+		reg_temp_hyst = NCT6798_REG_TEMP_HYST;
+		reg_temp_config = NCT6779_REG_TEMP_CONFIG;
+		reg_temp_alternate = NCT6798_REG_TEMP_ALTERNATE;
+		reg_temp_crit = NCT6798_REG_TEMP_CRIT;
+
 		break;
 	default:
 		return -ENODEV;
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index edcde39c4791..296eff99d003 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -8,7 +8,7 @@ enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
 	     nct6793, nct6795, nct6796, nct6797, nct6798, nct6799 };
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
-#define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
+#define NUM_TEMP	12	/* Max number of temp attribute sets w/ limits*/
 #define NUM_TEMP_FIXED	6	/* Max number of fixed temp attribute sets */
 #define NUM_TSI_TEMP	8	/* Max number of TSI temp register pairs */
 
-- 
2.39.2

