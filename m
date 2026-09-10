Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB94C35E1CC;
	Thu, 10 Sep 2026 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023810; cv=none; b=MPMGQsvbtWwHRAFKDlberENGFQ0rCw13orjE7XWt5C37JG7B3uZO8jB1A7fLCHzZuRT0hYhfNtJPYR7ippIJAhaPBaH36fgI1fGQa4yIqcMn0z/cYCRvjuRTgB+JHU3RBz5CWla9NOXearbgcXu75tuANmr7lU7yLx4z3PqZf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023810; c=relaxed/simple;
	bh=WmjF1ODJiDGh1j2sapptMtW7CYD/5kgxkYspV5+P3nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+vH+Yg6vSdaEPR2yGChB5JdwGcmeW+hQ/goJl9b47KDQTNpwiD606MhM0nAoPryTlDLZ3NJjgG69V04xNdqDGIXiYsNlkuqUUSsSzGDq54iBhUsFNnunQvijekmReS5+ft3lwQ6mN2sAJdjnUc5zllDsH2hWryRK3pEDtMej9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WpqXupAK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WpqXupAK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A96E4E415C0;
	Thu, 10 Sep 2026 07:03:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F36E3602B8;
	Thu, 10 Sep 2026 07:03:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5857011C7AFA3;
	Thu, 10 Sep 2026 09:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789023800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/zTtyV3knytiy3eU3XabIocjDfHfEzC2g7ay34IkeDk=;
	b=WpqXupAKtjuvpTJXxK6ec35/e1NW9JizqNynRNhEEm3WG78DfRYcF09bUmonWL89JMLU18
	j3D/SYyx5M/P3CHiHy8OcWLf8onIJAlmSSJ5fQpFubeBb8TXVOvyRtViBmdE/15qEYh2An
	eKj+Pp84ZfdX7youlP3tNs+MJ1HAjKRmeN1AWhWA4aqPF+Ne/Dx81sXx44pyErg4ReKAer
	4Fqm45osya+0XvAiD3y4I+qcHcwAhsjPgCRZaK7tx1dQOvD057vEfZZoaYoNGOyjrIUNkF
	zIM59x/B+xvXT8XczVFzR6HPs6Awd+VS8sewCKvSuFV4Ff6yKwSfndlXZymdlA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 10 Sep 2026 09:02:39 +0200
Subject: [PATCH v2 2/3] hwmon: (nct6775) Add support for NCT6126D
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-bootlin-hwmon-nct6126-v2-2-ee629ab35e49@bootlin.com>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789023793; l=11335;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=WmjF1ODJiDGh1j2sapptMtW7CYD/5kgxkYspV5+P3nw=;
 b=3SDYajfCYAHutFGqND/45IiuGD2IEbLVi9aWyMOhd5J9JzU6Ukbq4qshcSliKJlPrR8mVy1Kl
 Pb1RX12/qYNCkidbVSMtZAyzd8tlUEgcwBaTz84D5YC3ukS2YC+9vFU
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add support for the hardware monitoring functionality of the NCT6126D
Super-I/O chip.

The NCT6126D hardware monitor is nearly identical to the NCT6116D: the
fan, PWM, temperature, TSI, alarm.

The differences are:

- Device IDs 0xd283 (A version) and 0xd284 (B version), which both fall
  into the NCT6116D ID range (0xd280) when masked with SIO_ID_MASK.
  Instead, compare the full value to distinguish from NCT6116D.

- One additional VIN: VHIF scaled at 16 mV/LSB.

- The fan count limit registers are documented for all five fans.
  Also expose fan4_min.

Assisted-by: opencode:z-ai/glm-5.3-flash
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/hwmon/nct6775-core.c     | 116 +++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/nct6775-platform.c |  29 +++++++++-
 drivers/hwmon/nct6775.h          |   4 +-
 3 files changed, 146 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 759ea3d1286e..cf27b9c7a89e 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -21,6 +21,8 @@
  * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
  * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
  * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
+ * nct6126d    10      5       5       3+3    0xd283 0xc1    0x5ca3
+ *                                           (0xd284)
  * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
  * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
  * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
@@ -66,6 +68,7 @@
 static const char * const nct6775_device_names[] = {
 	[nct6106] = "nct6106",
 	[nct6116] = "nct6116",
+	[nct6126] = "nct6126",
 	[nct6775] = "nct6775",
 	[nct6776] = "nct6776",
 	[nct6779] = "nct6779",
@@ -897,6 +900,31 @@ static const s8 NCT6116_BEEP_BITS[NUM_BEEP_BITS] = {
 
 static const u16 NCT6116_REG_TSI_TEMP[] = { 0x59, 0x5b };
 
+/* NCT6122D/NCT6126D specific data */
+
+static const u16 NCT6126_REG_IN[] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09 };
+static const u16 NCT6126_REG_IN_MAX[] = {
+	0x90, 0x92, 0x94, 0x96, 0x98, 0x9a, 0x9c, 0x9e, 0xa0, 0xa2 };
+static const u16 NCT6126_REG_IN_MIN[] = {
+	0x91, 0x93, 0x95, 0x97, 0x99, 0x9b, 0x9d, 0x9f, 0xa1, 0xa3 };
+
+static const s8 NCT6126_ALARM_BITS[NUM_ALARM_BITS] = {
+	 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, -1, -1,	  /* in0-in11     */
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
+	32, 33, 34, 35, 36, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
+	16, 17, 18, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	48, -1,						  /* intr0-intr1  */
+};
+
+static const s8 NCT6126_BEEP_BITS[NUM_BEEP_BITS] = {
+	 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11,	  /* in0-in11     */
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
+	24, 25, 26, 27, 28, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
+	16, 17, 18, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	34, -1, 32					  /* intr0-intr1, beep_en */
+};
+
 static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
 {
 	if (mode == 0 && pwm == 255)
@@ -998,6 +1026,14 @@ static const u16 scale_in_6798[NUM_IN] = {
 	800, 800,  800, 1600, 800
 };
 
+/*
+ * NCT6126 scaling:
+ * CPUVCORE, VIN0, AVSB, 3VCC, VIN1, VIN2, VHIF, 3VSB, VBAT,  VTT
+ */
+static const u16 scale_in_6126[10] = {
+	800, 800, 1600, 1600, 800, 800, 1600, 1600, 1600, 800
+};
+
 static inline long in_from_reg(u8 reg, u8 nr, const u16 *scales)
 {
 	return DIV_ROUND_CLOSEST(reg * scales[nr], 100);
@@ -1156,6 +1192,7 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
 		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
 		  reg == 0x111 || reg == 0x121 || reg == 0x131;
 	case nct6116:
+	case nct6126:
 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
 		  reg == 0x26 || reg == 0x28 || reg == 0x59 || reg == 0x5b ||
 		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 || reg == 0xe6 ||
@@ -1538,6 +1575,7 @@ static int nct6775_update_pwm_limits(struct device *dev)
 			break;
 		case nct6106:
 		case nct6116:
+		case nct6126:
 		case nct6779:
 		case nct6791:
 		case nct6792:
@@ -3203,6 +3241,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 			break; /* always enabled, nothing to do */
 		case nct6106:
 		case nct6116:
+		case nct6126:
 		case nct6779:
 		case nct6791:
 		case nct6792:
@@ -3677,6 +3716,83 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
 		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
 
+		break;
+	case nct6126:
+		data->in_num = 10;
+		data->scale_in = scale_in_6126;
+		data->pwm_num = 5;
+		data->auto_pwm_num = 4;
+		data->temp_fixed_num = 3;
+		data->num_temp_alarms = 3;
+		data->num_temp_beeps = 3;
+
+		data->fan_from_reg = fan_from_reg13;
+		data->fan_from_reg_min = fan_from_reg13;
+
+		data->temp_label = nct6776_temp_label;
+		data->temp_mask = NCT6776_TEMP_MASK;
+		data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
+
+		data->REG_VBAT = NCT6106_REG_VBAT;
+		data->REG_DIODE = NCT6106_REG_DIODE;
+		data->DIODE_MASK = NCT6106_DIODE_MASK;
+		data->REG_VIN = NCT6126_REG_IN;
+		data->REG_IN_MINMAX[0] = NCT6126_REG_IN_MIN;
+		data->REG_IN_MINMAX[1] = NCT6126_REG_IN_MAX;
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
+		data->REG_PWM_READ = NCT6106_REG_PWM_READ;
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
+		data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
+		data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
+		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
+		data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
+		data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
+		data->REG_ALARM = NCT6106_REG_ALARM;
+		data->ALARM_BITS = NCT6126_ALARM_BITS;
+		data->REG_BEEP = NCT6106_REG_BEEP;
+		data->BEEP_BITS = NCT6126_BEEP_BITS;
+		data->REG_TSI_TEMP = NCT6116_REG_TSI_TEMP;
+
+		reg_temp = NCT6106_REG_TEMP;
+		reg_temp_mon = NCT6106_REG_TEMP_MON;
+		num_reg_temp = 3;
+		num_reg_temp_mon = ARRAY_SIZE(NCT6106_REG_TEMP_MON);
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
 		break;
 	case nct6775:
 		data->in_num = 9;
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index d394376e4306..a8ef58d3a883 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -25,6 +25,7 @@ enum sensor_access { access_direct, access_asuswmi };
 static const char * const nct6775_sio_names[] __initconst = {
 	[nct6106] = "NCT6106D",
 	[nct6116] = "NCT6116D",
+	[nct6126] = "NCT6126D",
 	[nct6775] = "NCT6775F",
 	[nct6776] = "NCT6776D/F",
 	[nct6779] = "NCT6779D",
@@ -76,6 +77,8 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 
 #define SIO_NCT6106_ID		0xc450
 #define SIO_NCT6116_ID		0xd280
+#define SIO_NCT6126_A_ID	0xd283
+#define SIO_NCT6126_B_ID	0xd284
 #define SIO_NCT6775_ID		0xb470
 #define SIO_NCT6776_ID		0xc330
 #define SIO_NCT6779_ID		0xc560
@@ -565,6 +568,25 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 		pwm3pin = fan3pin && (cr24 & 0x08);
 		pwm4pin = fan4pin;
 		pwm5pin = fan5pin;
+	} else if (data->kind == nct6126) {
+		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
+		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
+		int cr24 = sio_data->sio_inb(sio_data, 0x24);
+		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
+		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
+		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
+
+		fan3pin = !(cr2b & 0x10);
+		fan4pin = (cr2b & 0x80) ||			/* pin 1(2) */
+			(!(cr2f & 0x10) && (cr1a & 0x04));	/* pin 65(66) */
+		fan5pin = (cr2b & 0x80) ||			/* pin 126(127) */
+			(!(cr1b & 0x03) && (cr2a & 0x02));	/* pin 94(96) */
+
+		pwm3pin = fan3pin && (cr24 & 0x08);
+		pwm4pin = fan4pin;
+		pwm5pin = fan5pin;
+
+		fan4min = fan4pin;
 	} else {
 		/*
 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
@@ -861,6 +883,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 		break;
 	case nct6106:
 	case nct6116:
+	case nct6126:
 	case nct6779:
 	case nct6791:
 	case nct6792:
@@ -892,6 +915,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 		switch (data->kind) {
 		case nct6106:
 		case nct6116:
+		case nct6126:
 			tmp |= 0xe0;
 			break;
 		case nct6775:
@@ -1006,7 +1030,10 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 		sio_data->kind = nct6106;
 		break;
 	case SIO_NCT6116_ID:
-		sio_data->kind = nct6116;
+		if (val == SIO_NCT6126_A_ID || val == SIO_NCT6126_B_ID)
+			sio_data->kind = nct6126;
+		else
+			sio_data->kind = nct6116;
 		break;
 	case SIO_NCT6775_ID:
 		sio_data->kind = nct6775;
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index 296eff99d003..d18ac91be497 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -4,8 +4,8 @@
 
 #include <linux/types.h>
 
-enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
-	     nct6793, nct6795, nct6796, nct6797, nct6798, nct6799 };
+enum kinds { nct6106, nct6116, nct6126, nct6775, nct6776, nct6779, nct6791,
+	     nct6792, nct6793, nct6795, nct6796, nct6797, nct6798, nct6799 };
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
 #define NUM_TEMP	12	/* Max number of temp attribute sets w/ limits*/

-- 
2.55.0

