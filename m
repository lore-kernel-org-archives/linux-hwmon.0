Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212739;
	b=SUdOb3BivQb5c63Oyevx7+cFwgiXlOrPkaU5Zl3Tt1y0GylyPcORtjrcnNI3PoeK+k/Y
	 x/60RfAI+RDlwFM4mF/ZRK+KTy1LXJnX0BQ2NJbelXeQN+YXZRLuYgFGEuaiPvSiwpQH4
	 VwxzKe8Mtfa8qffCiI1PjMkP9mfWY7XOYfjqSZGiQnLAgXsVhw9BkbmskhZHkHQ5UI7/J
	 kR79yrglJH3WYLJ7WR1/dUN0LIrc2qwtiY2pWIdwjgMrI5U/yXSLzCabKIb3+914gE2DI
	 vgbpI1K4rbJ7Hnsz3uMiktWQtkV9XvJejJ1Gz2Ec73am2zbFqlM1sDz2/1yx1LiabOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=loEyxJdRdS5X9pr792ngpkqu2OPw1kVK+dT/ppKtXKI=;
	b=I52eLJo8tX/1yYQg87uIHcts2eq7cVCqnXDadZTTxOz+HE86Qk9MUS3iw0ZKU+LgypCi
	 pw/UiXB+AGuJTL2OV7uRoHNwjy7U2kiJT/37iyz4Snrj1XDPCMj6kNAaGnSU9GEedB3Ap
	 xvE/8ETS6Zjvtmw2lNdF6LbC2fqDEQp1LdeTaCWHOtNH35WJ2K1slyhfXTWNaavjlgSg6
	 3TK3xdFkoBGkprrtpZSLdzGmrGOSvrHxYXHghh/gAWXbjV0LNNyJmW593YYzuqfPg0OuN
	 e+ZWkA8oNFARlDz8qta6iMmBuMSvsH1VOA/cLB+de1V5KFlCrr7si8LLB9vB2VUtF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=accum.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=UyiIjib2;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0ED606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accum.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=UyiIjib2
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 7352844B97;
	Mon,  9 Nov 2026 09:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1794212730; bh=sw1BANvqoIf/vJVkzf2o8HsLUDGoHAHB8c33Vy2kU5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyiIjib26ruxey3djn36kFosg4gvDLsRFRAbfp/C85MIM2qAlhcDTutgoHMMMLQny
	 UI4yMevgN7Acx/qU94fzqUeP5OB9ciP3pPqatROCuhgAX3yb1em9ZFftsnPsCHIi3t
	 MNV/8B+Qw9V2SVQxF7HvW8vBZkEd5+Fy34jA5bxQ=
Received: from suiko.ac2.se (suiko.ac2.se [130.239.18.162])
	by mail.acc.umu.se (Postfix) with ESMTP id 711EC44B90;
	Mon,  9 Nov 2026 09:25:29 +0100 (CET)
Received: by suiko.ac2.se (Postfix, from userid 24471)
	id 6C82E42B4B; Mon,  9 Nov 2026 09:25:29 +0100 (CET)
From: Anton Lundin <glance@ac2.se>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>,
	Anton Lundin <glance@ac2.se>
Subject: [PATCH v2 3/3] hwmon: (nct6775) Add support for NCT5525
Date: Mon,  9 Nov 2026 09:25:11 +0100
Message-ID: <20261109082511.851377-4-glance@ac2.se>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109082511.851377-1-glance@ac2.se>
References: <20261109082511.851377-1-glance@ac2.se>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend nct6775 driver to support NCT5525.

Signed-off-by: Anton Lundin <glance@ac2.se>
---
 Documentation/hwmon/nct6775.rst  |  10 ++-
 drivers/hwmon/nct6775-core.c     | 134 +++++++++++++++++++++++++++++++
 drivers/hwmon/nct6775-platform.c |  17 ++++
 drivers/hwmon/nct6775.h          |   5 +-
 4 files changed, 163 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/nct6775.rst b/Documentation/hwmon/nct6775.rst
index d2dedade0606..3e2992a1e24f 100644
--- a/Documentation/hwmon/nct6775.rst
+++ b/Documentation/hwmon/nct6775.rst
@@ -48,6 +48,14 @@ Supported chips:
 
     Datasheet: Available from the Nuvoton web site
 
+  * Nuvoton NCT5525D
+
+    Prefix: 'nct5525'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from Nuvoton upon request
+
   * Nuvoton NCT5572D/NCT6771F/NCT6772F/NCT6775F/W83677HG-I
 
     Prefix: 'nct6775'
@@ -159,7 +167,7 @@ direct temperature sensor inputs, the others are special sources such as PECI,
 PCH, and SMBUS. Depending on the chip type, 2 to 6 of the temperature sources
 can be monitored and compared against minimum, maximum, and critical
 temperatures. The driver reports up to 10 of the temperatures to the user.
-There are 4 to 5 fan rotation speed sensors, 8 to 15 analog voltage sensors,
+There are 3 to 7 fan rotation speed sensors, 8 to 18 analog voltage sensors,
 one VID, alarms with beep warnings (control unimplemented), and some automatic
 fan regulation strategies (plus manual fan control mode).
 
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 09dc9cecb278..6f7279fb8814 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -19,6 +19,7 @@
  * Supports the following chips:
  *
  * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
+ * nct5525d     8      3       3       3+3    0xd2b3 0xc1    0x5ca3
  * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
  * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
  * nct6126d    10      5       5       3+3    0xd283 0xc1    0x5ca3
@@ -66,6 +67,7 @@
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] = {
+	[nct5525] = "nct5525",
 	[nct6106] = "nct6106",
 	[nct6116] = "nct6116",
 	[nct6126] = "nct6126",
@@ -840,6 +842,41 @@ static const u16 NCT6106_REG_TEMP_CRIT[32] = {
 
 static const u16 NCT6106_REG_TSI_TEMP[] = { 0x59, 0x5b, 0x5d, 0x5f, 0x61, 0x63, 0x65, 0x67 };
 
+/* NCT5525D specific data */
+
+static const u16 NCT5525_REG_IN_MAX[] = {
+	0x92, 0x94, 0x96, 0x9a, 0x9c, 0x9e, 0xa0, 0xa2 };
+static const u16 NCT5525_REG_IN_MIN[] = {
+	0x93, 0x95, 0x97, 0x9b, 0x9d, 0x9f, 0xa1, 0xa3 };
+static const u16 NCT5525_REG_IN[] = {
+	0x01, 0x02, 0x03, 0x05, 0x06, 0x07, 0x08, 0x09 };
+
+/* AUXFAN2 is a bit special without a Max Duty Output Register so
+ * use Output Value Select Register instead
+ */
+static const u16 NCT5525_REG_PWM_READ[] = {
+	0x4a, 0x4b, 0, 0, 0x1a9
+};
+
+static const u16 NCT5525_REG_TEMP_SEL[] = { 0x110, 0x120, 0, 0, 0x1a0 };
+static const u16 NCT5525_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0, 0, 0 };
+
+static const s8 NCT5525_ALARM_BITS[NUM_ALARM_BITS] = {
+	 1,  2,  3,  5,  6,  7,  8,  9, -1, -1, -1, -1,	  /* in0-in11     */
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
+	32, 33, -1, -1, 36, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
+	16, 17, 18, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	-1, -1,						  /* intr0-intr1  */
+};
+
+static const s8 NCT5525_BEEP_BITS[NUM_BEEP_BITS] = {
+	 1,  2,  3,  5,  6,  7,  8,  9, -1, -1, -1, -1,	  /* in0-in11     */
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
+	24, 25, -1, -1, 28, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
+	16, 17, 18, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	-1, -1, 32					  /* intr0-intr1, beep_en */
+};
+
 /* NCT6112D/NCT6114D/NCT6116D specific data */
 
 static const u16 NCT6116_REG_FAN[] = { 0x20, 0x22, 0x24, 0x26, 0x28 };
@@ -1034,6 +1071,14 @@ static const u16 scale_in_6126[10] = {
 	800, 800, 1600, 1600, 800, 800, 1600, 1600, 1600, 800
 };
 
+/*
+ * NCT5525 scaling:
+ * VIN0, AVSB, 3VCC, VIN2, VHIF, 3VSB, VBAT, VTT
+ */
+static const u16 scale_in_5525[8] = {
+	800, 1600, 1600, 800, 1600, 1600, 1600, 800
+};
+
 static inline long in_from_reg(u8 reg, u8 nr, const u16 *scales)
 {
 	return DIV_ROUND_CLOSEST(reg * scales[nr], 100);
@@ -1185,6 +1230,10 @@ static int nct6775_add_template_attr_group(struct device *dev, struct nct6775_da
 bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
 {
 	switch (data->kind) {
+	case nct5525:
+		return reg == 0x20 || reg == 0x22 || reg == 0x28 ||
+		  reg == 0x59 || reg == 0x5b || reg == 0xe0 || reg == 0xe2 ||
+		  reg == 0xe8;
 	case nct6106:
 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
 		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
@@ -1574,6 +1623,7 @@ static int nct6775_update_pwm_limits(struct device *dev)
 		case nct6776:
 			data->auto_pwm[i][data->auto_pwm_num] = 0xff;
 			break;
+		case nct5525:
 		case nct6106:
 		case nct6116:
 		case nct6126:
@@ -3240,6 +3290,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 			break;
 		case nct6776:
 			break; /* always enabled, nothing to do */
+		case nct5525:
 		case nct6106:
 		case nct6116:
 		case nct6126:
@@ -3566,6 +3617,89 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 	data->scale_in = scale_in;
 
 	switch (data->kind) {
+	case nct5525:
+		data->in_num = 8;
+		data->scale_in = scale_in_5525;
+		/* compatible with NCT6116, with pwm index 3 and 4 not populated. */
+		data->pwm_num = 5;
+		data->auto_pwm_num = 4;
+		data->temp_fixed_num = 3;
+		data->num_temp_alarms = 3;
+		data->num_temp_beeps = 3;
+
+		data->ALARM_BITS = NCT5525_ALARM_BITS;
+		data->BEEP_BITS = NCT5525_BEEP_BITS;
+
+		data->fan_from_reg = fan_from_reg13;
+		data->fan_from_reg_min = fan_from_reg13;
+		data->target_temp_mask = 0xff;
+		data->tolerance_mask = 0x07;
+		data->speed_tolerance_limit = 63;
+
+		data->temp_label = nct6776_temp_label;
+		data->temp_mask = NCT6776_TEMP_MASK;
+		data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
+
+		data->REG_VBAT = NCT6106_REG_VBAT;
+		data->REG_DIODE = NCT6106_REG_DIODE;
+		data->DIODE_MASK = NCT6106_DIODE_MASK;
+		data->REG_VIN = NCT5525_REG_IN;
+		data->REG_IN_MINMAX[0] = NCT5525_REG_IN_MIN;
+		data->REG_IN_MINMAX[1] = NCT5525_REG_IN_MAX;
+		/* compatible with NCT6116, with fans index 3 and 4 not populated. */
+		data->REG_TARGET = NCT6116_REG_TARGET;
+		data->REG_FAN = NCT6116_REG_FAN;
+		data->REG_FAN_MODE = NCT6116_REG_FAN_MODE;
+		data->REG_FAN_MIN = NCT6116_REG_FAN_MIN;
+		data->REG_FAN_PULSES = NCT6116_REG_FAN_PULSES;
+		data->FAN_PULSE_SHIFT = NCT6116_FAN_PULSE_SHIFT;
+		data->REG_FAN_TIME[0] = NCT6116_REG_FAN_STOP_TIME;
+		data->REG_FAN_TIME[1] = NCT6116_REG_FAN_STEP_UP_TIME;
+		data->REG_FAN_TIME[2] = NCT6116_REG_FAN_STEP_DOWN_TIME;
+		data->REG_TOLERANCE_H = NCT6116_REG_TOLERANCE_H;
+		data->REG_PWM[0] = NCT6116_REG_PWM;
+		data->REG_PWM[1] = NCT6116_REG_FAN_START_OUTPUT;
+		data->REG_PWM[2] = NCT6116_REG_FAN_STOP_OUTPUT;
+		data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
+		data->REG_PWM[6] = NCT6106_REG_WEIGHT_DUTY_BASE;
+		data->REG_PWM_READ = NCT5525_REG_PWM_READ;
+		data->REG_PWM_MODE = NCT6106_REG_PWM_MODE;
+		data->PWM_MODE_MASK = NCT6106_PWM_MODE_MASK;
+		data->REG_AUTO_TEMP = NCT6116_REG_AUTO_TEMP;
+		data->REG_AUTO_PWM = NCT6116_REG_AUTO_PWM;
+		data->REG_CRITICAL_TEMP = NCT6116_REG_CRITICAL_TEMP;
+		data->REG_CRITICAL_TEMP_TOLERANCE =
+			NCT6116_REG_CRITICAL_TEMP_TOLERANCE;
+		data->REG_CRITICAL_PWM_ENABLE = NCT6116_REG_CRITICAL_PWM_ENABLE;
+		data->CRITICAL_PWM_ENABLE_MASK =
+			NCT6106_CRITICAL_PWM_ENABLE_MASK;
+		data->REG_CRITICAL_PWM = NCT6116_REG_CRITICAL_PWM;
+		data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
+		data->REG_TEMP_SOURCE = NCT6106_REG_TEMP_SOURCE;
+		data->REG_TEMP_SEL = NCT5525_REG_TEMP_SEL;
+		data->REG_WEIGHT_TEMP_SEL = NCT5525_REG_WEIGHT_TEMP_SEL;
+		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
+		data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
+		data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
+		data->REG_ALARM = NCT6106_REG_ALARM;
+		data->REG_BEEP = NCT6106_REG_BEEP;
+		data->REG_TSI_TEMP = NCT6116_REG_TSI_TEMP;
+
+		reg_temp = NCT6106_REG_TEMP;
+		reg_temp_mon = NCT6106_REG_TEMP_MON;
+		num_reg_temp = 3;
+		num_reg_temp_mon = 2;
+		num_reg_tsi_temp = ARRAY_SIZE(NCT6116_REG_TSI_TEMP);
+		reg_temp_over = NCT6106_REG_TEMP_OVER;
+		reg_temp_hyst = NCT6106_REG_TEMP_HYST;
+		reg_temp_config = NCT6106_REG_TEMP_CONFIG;
+		num_reg_temp_config = 3;
+		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
+		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
+		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
+		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
+
+		break;
 	case nct6106:
 		data->in_num = 9;
 		data->pwm_num = 3;
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 7e09fd387d96..f443ae1dac67 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -23,6 +23,7 @@
 enum sensor_access { access_direct, access_asuswmi };
 
 static const char * const nct6775_sio_names[] __initconst = {
+	[nct5525] = "NCT5525D",
 	[nct6106] = "NCT6106D",
 	[nct6116] = "NCT6116D",
 	[nct6126] = "NCT6122D/NCT6126D",
@@ -75,6 +76,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_REG_ENABLE		0x30	/* Logical device enable */
 #define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
 
+#define SIO_NCT5525_ID		0xd2b0
 #define SIO_NCT6106_ID		0xc450
 #define SIO_NCT6116_ID		0xd280
 #define SIO_NCT6122_ID		0xd2a0
@@ -547,6 +549,14 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 
 		fan4min = fan4pin;
 		pwm3pin = fan3pin;
+	} else if (data->kind == nct5525) {
+		/* Pin 48 can be GP64 / SCL / MSCL / AUXFANOUT2 */
+		/* Pin 46 can be GP63 / SDA / MSDA / AUXFANIN2 */
+		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
+		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
+
+		fan5pin = (!(cr1b & 0x03) && (cr2a & 0x01));
+		pwm5pin = fan5pin;
 	} else if (data->kind == nct6106) {
 		int cr24 = sio_data->sio_inb(sio_data, 0x24);
 
@@ -882,6 +892,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 	case nct6776:
 		data->have_vid = (cr2a & 0x60) == 0x40;
 		break;
+	case nct5525:
 	case nct6106:
 	case nct6116:
 	case nct6126:
@@ -914,6 +925,9 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 		tmp = sio_data->sio_inb(sio_data,
 				    NCT6775_REG_CR_FAN_DEBOUNCE);
 		switch (data->kind) {
+		case nct5525:
+			tmp |= 0x68;
+			break;
 		case nct6106:
 		case nct6116:
 		case nct6126:
@@ -1027,6 +1041,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 		val = force_id;
 
 	switch (val & SIO_ID_MASK) {
+	case SIO_NCT5525_ID:
+		sio_data->kind = nct5525;
+		break;
 	case SIO_NCT6106_ID:
 		sio_data->kind = nct6106;
 		break;
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index d18ac91be497..ced4cb9fb1f3 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -4,8 +4,9 @@
 
 #include <linux/types.h>
 
-enum kinds { nct6106, nct6116, nct6126, nct6775, nct6776, nct6779, nct6791,
-	     nct6792, nct6793, nct6795, nct6796, nct6797, nct6798, nct6799 };
+enum kinds { nct5525, nct6106, nct6116, nct6126, nct6775, nct6776, nct6779,
+	     nct6791, nct6792, nct6793, nct6795, nct6796, nct6797, nct6798,
+	     nct6799 };
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
 #define NUM_TEMP	12	/* Max number of temp attribute sets w/ limits*/
-- 
2.47.3

