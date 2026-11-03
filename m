Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712610;
	b=z/NmpTsx8daPgvdJmdKmhTHdBQaZNJEGrkAacent1sRpB9FhZ1UHtsJK5KzyLUFO1MzT
	 x09W2OtYejkS2PmHDmc+mFOzTCoUd6Bf7Ppr7Ttl+IqKTyuxITXbgYMRXbG1tI7LRN6n7
	 KDcI+gx6fySwtcA4wP0FVINMaH317+i5WTnrSFmOleKIttxqUn/F4aShlbHTveb0euvQt
	 K3EDEa/McBi/8CRMAhRzAguCHtjWJMEVtj64TLyJHOe6SG6BLITJkVqkusTK/bru2OsxR
	 lK0LwzTZtBne3bh7mDePCv8nmmZtUqP7Dgqh8bnfDngHgm+38LbVvy3bHYFCo3C96mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JTROya2bTzd5B3SbJn2nvj63HLnc4zdCP8wYkffad7U=;
	b=Bo/jkx/lS78veBE2wkUE1Yxk251336ZjsKY5NAGtpXerGT3VAai8Suca26IXKGdxHWyS
	 BDBoWDWWl+7rdgSdsU/x7M8buNlf4bexMFpAjPyW+T7u2PIXO413ZiloaadGlTBjjtPjv
	 Tz9tC+SFFITTZg7PRgaK/We2b4T/I0IbX4/w7lRelk5usMqy0DaEWcKvadPWVpn8kdIL1
	 75uyurLqETv5VrEhIfS+JCsfAmaI7NuTmZWOfh/nWUQ2EjiQZtJeZiw/4qzR57D1GAjA4
	 CUzibsBM7YfpevjwIyssFGzZRPhxfqaK421OKozLXzmgoVxuv9DhEHbMMyT07ANuyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=accum.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=rQDkRWsu;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74939606A334
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 13:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74939606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accum.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=rQDkRWsu
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 8620544B93;
	Tue,  3 Nov 2026 14:29:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1793712598; bh=khFoiHy19Bj+2wFzgw82xoUNjV/Y0dvaDyPwAURRL64=;
	h=From:To:Cc:Subject:Date:From;
	b=rQDkRWsu2RQDfFTSfHMVqb9rhDocrnSh4+r2FFCbAK+lssjzNfd1k+DUB5I6+sYRZ
	 QDHGjUQgAXu1U/TO6KQ4r2kE3SyqLHXBLz/qoOSfC2uv/exZJFbtIpaqLkOhzBolmR
	 NcDk/iDsOUnZkBcmijqWHmYqYhPTpS+A678XeWJk=
Received: from suiko.ac2.se (suiko.ac2.se [130.239.18.162])
	by mail.acc.umu.se (Postfix) with ESMTP id 7E96C44B92;
	Tue,  3 Nov 2026 14:29:57 +0100 (CET)
Received: by suiko.ac2.se (Postfix, from userid 24471)
	id 68FA742B4B; Tue,  3 Nov 2026 14:29:57 +0100 (CET)
From: Anton Lundin <glance@ac2.se>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>,
	Anton Lundin <glance@ac2.se>
Subject: [PATCH] hwmon: (nct6775) Add support for NCT5525
Date: Tue,  3 Nov 2026 14:29:48 +0100
Message-ID: <20261103132948.144216-1-glance@ac2.se>
X-Mailer: git-send-email 2.47.3
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

Assisted-by: Copilot:GPT-5.6-Terra
Signed-off-by: Anton Lundin <glance@ac2.se>
---
 .../bindings/hwmon/nuvoton,nct6775.yaml       |   1 +
 Documentation/hwmon/nct6775.rst               |  10 +-
 drivers/hwmon/nct6775-core.c                  | 130 +++++++++++++++++-
 drivers/hwmon/nct6775-i2c.c                   |   6 +-
 drivers/hwmon/nct6775-platform.c              |  12 ++
 drivers/hwmon/nct6775.h                       |   3 +-
 6 files changed, 156 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
index 244470282890..16c21f1f46ef 100644
--- a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
@@ -25,6 +25,7 @@ properties:
       - nuvoton,nct6797
       - nuvoton,nct6798
       - nuvoton,nct6799
+      - nuvoton,nct5525
 
   reg:
     maxItems: 1
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
index cf27b9c7a89e..fb99bdf16764 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -38,6 +38,7 @@
  * nct5585d    14      7       7       2+6    0xd428 0xc1    0x5ca3
  * nct6796d-s  18      7       7       6+2    0xd801 0xc1    0x5ca3
  * nct6799d-r  18      7       7       6+2    0xd802 0xc1    0x5ca3
+ * nct5525d     8      3       2       3+3    0xd2b3 0xc1    0x5ca3
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -80,6 +81,7 @@ static const char * const nct6775_device_names[] = {
 	[nct6797] = "nct6797",
 	[nct6798] = "nct6798",
 	[nct6799] = "nct6799",
+	[nct5525] = "nct5525",
 };
 
 /* Common and NCT6775 specific data */
@@ -840,6 +842,33 @@ static const u16 NCT6106_REG_TEMP_CRIT[32] = {
 
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
+static const u16 NCT5525_REG_FAN[] = { 0x20, 0x22, 0x28 };
+static const u16 NCT5525_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe8 };
+static const u16 NCT5525_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf5 };
+static const u16 NCT5525_FAN_PULSE_SHIFT[] = { 0, 2, 6 };
+
+static const s8 NCT5525_ALARM_BITS[NUM_ALARM_BITS] = {
+	 1,  2,  3,  5,  6,  7,  8,  9, -1, -1, -1, -1,	  /* in0-in11     */
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
+	32, 33, 36, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
+	16, 17, 18, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	-1, -1,						  /* intr0-intr1  */
+};
+
+static const u16 NCT5525_REG_BEEP[NUM_REG_BEEP] = { 0 };
+static const s8 NCT5525_BEEP_BITS[NUM_BEEP_BITS] = {
+	[0 ... NUM_BEEP_BITS - 1] = -1,
+};
+
 /* NCT6112D/NCT6114D/NCT6116D specific data */
 
 static const u16 NCT6116_REG_FAN[] = { 0x20, 0x22, 0x24, 0x26, 0x28 };
@@ -1034,6 +1063,10 @@ static const u16 scale_in_6126[10] = {
 	800, 800, 1600, 1600, 800, 800, 1600, 1600, 1600, 800
 };
 
+static const u16 scale_in_5525[8] = {
+	800, 1600, 1600, 800, 1600, 1600, 1600, 800
+};
+
 static inline long in_from_reg(u8 reg, u8 nr, const u16 *scales)
 {
 	return DIV_ROUND_CLOSEST(reg * scales[nr], 100);
@@ -1191,6 +1224,10 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
 		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
 		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
 		  reg == 0x111 || reg == 0x121 || reg == 0x131;
+	case nct5525:
+		return reg == 0x20 || reg == 0x22 || reg == 0x28 ||
+		  reg == 0x59 || reg == 0x5b || reg == 0xe0 || reg == 0xe2 ||
+		  reg == 0xe8 || reg == 0x111 || reg == 0x121;
 	case nct6116:
 	case nct6126:
 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
@@ -1574,6 +1611,7 @@ static int nct6775_update_pwm_limits(struct device *dev)
 			data->auto_pwm[i][data->auto_pwm_num] = 0xff;
 			break;
 		case nct6106:
+		case nct5525:
 		case nct6116:
 		case nct6126:
 		case nct6779:
@@ -1955,6 +1993,8 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
 
 	if (nr == 1 && data->ALARM_BITS[in] == -1)
 		return 0;
+	if (nr == 2 && data->BEEP_BITS[in] == -1)
+		return 0;
 
 	if (!(data->have_in & BIT(in)))
 		return 0;
@@ -2398,8 +2438,12 @@ static umode_t nct6775_temp_is_visible(struct kobject *kobj,
 	if (nr == 2 && find_temp_source(data, temp, data->num_temp_alarms) < 0)
 		return 0;				/* alarm */
 
-	if (nr == 3 && find_temp_source(data, temp, data->num_temp_beeps) < 0)
-		return 0;				/* beep */
+	if (nr == 3) {
+		int source = find_temp_source(data, temp, data->num_temp_beeps);
+
+		if (source < 0 || data->BEEP_BITS[source + TEMP_ALARM_BASE] == -1)
+			return 0;			/* beep */
+	}
 
 	if (nr == 4 && !data->reg_temp[1][temp])	/* max */
 		return 0;
@@ -3240,6 +3284,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6776:
 			break; /* always enabled, nothing to do */
 		case nct6106:
+		case nct5525:
 		case nct6116:
 		case nct6126:
 		case nct6779:
@@ -3640,6 +3685,87 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
 		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
 
+		break;
+	case nct5525:
+		data->in_num = 8;
+		data->scale_in = scale_in_5525;
+		data->pwm_num = 2;
+		data->auto_pwm_num = 4;
+		data->temp_fixed_num = 3;
+		data->num_temp_alarms = 3;
+		data->num_temp_beeps = 0;
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
+		data->REG_TARGET = NCT6106_REG_TARGET;
+		data->REG_FAN = NCT5525_REG_FAN;
+		data->REG_FAN_MODE = NCT6106_REG_FAN_MODE;
+		data->REG_FAN_MIN = NCT5525_REG_FAN_MIN;
+		data->REG_FAN_PULSES = NCT5525_REG_FAN_PULSES;
+		data->FAN_PULSE_SHIFT = NCT5525_FAN_PULSE_SHIFT;
+		data->REG_FAN_TIME[0] = NCT6106_REG_FAN_STOP_TIME;
+		data->REG_FAN_TIME[1] = NCT6106_REG_FAN_STEP_UP_TIME;
+		data->REG_FAN_TIME[2] = NCT6106_REG_FAN_STEP_DOWN_TIME;
+		data->REG_TOLERANCE_H = NCT6106_REG_TOLERANCE_H;
+		data->REG_PWM[0] = NCT6116_REG_PWM;
+		data->REG_PWM[1] = NCT6106_REG_FAN_START_OUTPUT;
+		data->REG_PWM[2] = NCT6106_REG_FAN_STOP_OUTPUT;
+		data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
+		data->REG_PWM[6] = NCT6106_REG_WEIGHT_DUTY_BASE;
+		data->REG_PWM_READ = NCT6106_REG_PWM_READ;
+		data->REG_PWM_MODE = NCT6106_REG_PWM_MODE;
+		data->PWM_MODE_MASK = NCT6106_PWM_MODE_MASK;
+		data->REG_AUTO_TEMP = NCT6106_REG_AUTO_TEMP;
+		data->REG_AUTO_PWM = NCT6106_REG_AUTO_PWM;
+		data->REG_CRITICAL_TEMP = NCT6106_REG_CRITICAL_TEMP;
+		data->REG_CRITICAL_TEMP_TOLERANCE
+		  = NCT6106_REG_CRITICAL_TEMP_TOLERANCE;
+		data->REG_CRITICAL_PWM_ENABLE = NCT6106_REG_CRITICAL_PWM_ENABLE;
+		data->CRITICAL_PWM_ENABLE_MASK
+		  = NCT6106_CRITICAL_PWM_ENABLE_MASK;
+		data->REG_CRITICAL_PWM = NCT6106_REG_CRITICAL_PWM;
+		data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
+		data->REG_TEMP_SOURCE = NCT6106_REG_TEMP_SOURCE;
+		data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
+		data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
+		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
+		data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
+		data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
+		data->REG_ALARM = NCT6106_REG_ALARM;
+		data->REG_BEEP = NCT5525_REG_BEEP;
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
 		break;
 	case nct6116:
 		data->in_num = 9;
diff --git a/drivers/hwmon/nct6775-i2c.c b/drivers/hwmon/nct6775-i2c.c
index 07783910c058..3efae4bf5e4a 100644
--- a/drivers/hwmon/nct6775-i2c.c
+++ b/drivers/hwmon/nct6775-i2c.c
@@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused nct6775_i2c_of_match[] = {
 	{ .compatible = "nuvoton,nct6797", .data = (void *)nct6797, },
 	{ .compatible = "nuvoton,nct6798", .data = (void *)nct6798, },
 	{ .compatible = "nuvoton,nct6799", .data = (void *)nct6799, },
+	{ .compatible = "nuvoton,nct5525", .data = (void *)nct5525, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, nct6775_i2c_of_match);
@@ -106,6 +107,7 @@ static const struct i2c_device_id nct6775_i2c_id[] = {
 	{ .name = "nct6797", .driver_data = nct6797 },
 	{ .name = "nct6798", .driver_data = nct6798 },
 	{ .name = "nct6799", .driver_data = nct6799 },
+	{ .name = "nct5525", .driver_data = nct5525 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nct6775_i2c_id);
@@ -126,8 +128,8 @@ static int nct6775_i2c_probe_init(struct nct6775_data *data)
 	 * controlling/monitoring the fans -- these are thus unlikely to be
 	 * doing anything actually useful.
 	 */
-	data->has_fan = 0x03;
-	data->has_fan_min = 0x03;
+	data->has_fan = data->kind == nct5525 ? 0x07 : 0x03;
+	data->has_fan_min = data->has_fan;
 	data->has_pwm = 0x03;
 
 	/*
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index d359c28f3e0f..3bc7a27d58a6 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -37,6 +37,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	[nct6797] = "NCT6797D",
 	[nct6798] = "NCT6798D/NCT5585D",
 	[nct6799] = "NCT6796D-S/NCT6799D-R",
+	[nct5525] = "NCT5525D",
 };
 
 static unsigned short force_id;
@@ -91,6 +92,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6797_ID		0xd450
 #define SIO_NCT6798_ID		0xd428
 #define SIO_NCT6799_ID		0xd800
+#define SIO_NCT5525_ID		0xd2b0
 #define SIO_ID_MASK		0xFFF8
 
 /*
@@ -552,6 +554,8 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 
 		fan3pin = !(cr24 & 0x80);
 		pwm3pin = cr24 & 0x08;
+	} else if (data->kind == nct5525) {
+		fan3pin = true;
 	} else if (data->kind == nct6116) {
 		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
 		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
@@ -839,6 +843,8 @@ static umode_t nct6775_other_is_visible(struct kobject *kobj,
 		if (data->BEEP_BITS[INTRUSION_ALARM_BASE + index - 3] < 0)
 			return 0;
 	}
+	if (index == 5 && data->BEEP_BITS[BEEP_ENABLE_BASE] < 0)
+		return 0;
 
 	return nct6775_attr_mode(data, attr);
 }
@@ -883,6 +889,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 		data->have_vid = (cr2a & 0x60) == 0x40;
 		break;
 	case nct6106:
+	case nct5525:
 	case nct6116:
 	case nct6126:
 	case nct6779:
@@ -919,6 +926,8 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 		case nct6126:
 			tmp |= 0xe0;
 			break;
+		case nct5525:
+			break;
 		case nct6775:
 			tmp |= 0x1e;
 			break;
@@ -1072,6 +1081,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	case SIO_NCT6799_ID:
 		sio_data->kind = nct6799;
 		break;
+	case SIO_NCT5525_ID:
+		sio_data->kind = nct5525;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index d18ac91be497..d94a1c1a31f5 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -5,7 +5,8 @@
 #include <linux/types.h>
 
 enum kinds { nct6106, nct6116, nct6126, nct6775, nct6776, nct6779, nct6791,
-	     nct6792, nct6793, nct6795, nct6796, nct6797, nct6798, nct6799 };
+	     nct6792, nct6793, nct6795, nct6796, nct6797, nct6798, nct6799,
+	     nct5525 };
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
 #define NUM_TEMP	12	/* Max number of temp attribute sets w/ limits*/
-- 
2.47.3

