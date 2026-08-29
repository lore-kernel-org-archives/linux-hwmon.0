Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3780B3803CC
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037253; cv=none; b=EWndCa4t/lrgWyXOzAbhTb+g4hwHIO6bXdK8vvF624R7vmmcH5qR80WKNWSqUtCASOeFNU+z/6o81Cqk55x9yCl1kAD0MgOm1GVod/AgchOrev/Rs1OjFE8czyr37uhjJeVo+VquZTjv9AspmKGu6rk6QJlFlCdeSewbL7dSGwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037253; c=relaxed/simple;
	bh=X428jkZfeCYdz4QaiKJRopY0eKiYM6h00izoOqaZUzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cvl5j5T3iVeAGEJM6Obl/1iyF+pTk5TjO7hTmY4ZwWv3Qqw0Fnx7oUHgcof+1p9P2T9bmMcYX0nunfJHrYLGqUfJJHJJic9Yo+9W+89BkZ/tXaExb3Zyc6Nv2MLXGqi25Ku5zwuV5mF/miBIIEVGXrQ/Sz22TmlViK5BLQ7EIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN6Ojmpv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN6Ojmpv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2074710751so288622566b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 14:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788037249; x=1788642049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EUXc6VWY7TsEnTtAbtaVQPNyZf0sQ0AzeEE4bDTtiU=;
        b=AN6OjmpvxfMDA5V9iiOk48NWhrxYzCqDHZmaWH5oW0+N+niMKYZNCK841d2lpr1efb
         8pqIx2If0J05CKBwcED6nvMuSIVFYJP/XHw2N80EtsCVbkuAaAiSceZik6DL5Q2dml+x
         JX0WVQps+zZlcWCJVVOLZKuRzu/rbPLolHNMSStNdwzFGkU5Ylh6hdXZa2pmqjfmVgl4
         rWrwcisWp7izBvaFg2gap4US7uU2vQs5oZtYOsR2gl3FZOpioRV10j3hSrswn2CYLLaS
         g432vvL+bM7YNBfgJWjS9COA9UThGIczwGYKiCr+ODUKeygOC+ZVV5DQ6+mjEUCye10C
         u1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788037249; x=1788642049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EUXc6VWY7TsEnTtAbtaVQPNyZf0sQ0AzeEE4bDTtiU=;
        b=tO2qDZd+F0Wmzi1DB4eDDc5RCWlewPlYuL+9uoxpnudPKcULe6yn0o8GyebkPDqW0V
         AY6+bsc4Mi5aeww+eyXNaABt+ArKFZVgfYum1ZLYqZLzYcr6b3akP3DoK8sqiL+h/I+R
         +o4kF0AWhUdj9BpPhiVb7A27NXSnHuVbvUnmVUJCKLTBRSfYY/tZvU5qO9FHDHTX62Ch
         o7hacuUnA56B32NznN9uwNKogQEicp/VaQzRy3CokMWtET9xGBgnOok/ounbVygxXBk0
         J+RJ+N0NuEm096oLAwj1z8mbt2eStd0dOXftBrrfGWfKj/bHDXco/JYqYzFR4FiT7sNn
         quGg==
X-Gm-Message-State: AFuF++m61q9Ly+LhEIz9DtzawZ3tLQF9RpTh5lx1hHTZ9wzmbKQhtKQt
	5ThZie9hBnVvsoXtpOTEkKv9nY18WoSdfgcqI7CKqy71Cg1i2s9QTgRL
X-Gm-Gg: AR+sD11NtFd/aiglDnp1+3WW+EIITrEC1hcLucWN9SjzNTylgrc1CE/nEkHqjF++Yoh
	2fukGgRz1ziGY7KU6JTlttyETmuPo11U46k/rlTa9Ckb+d0MyoE4j/C9PICHv6CMttnu8IdmG8O
	F7rXdAjldSbB9LZCDftub8DQUjktJmfgKFPgh+9cpLbo9/kies/C/LMsscY+kV2j2WHh63reyzw
	nGZv66YmaXWkQNBBiJDsurQ+ZYqktyAg+8M0dBbDCP5k3rHCs6SAEueebewp/XJNWvfIhguHyx5
	GnuJlEC5r+WYP5lAx1IJa8FOLDk5wjQDCSXgg3WvPx8QUA3kfn1yxTrAHg7JCn5Eq31X8j9UerJ
	6HZ2q06GJB0iRpHm4+3dDwKsmEOWuVj4BME6DfAy5ktexNKOcLOGWh1FxFGPBKI6pHnihzUHSxA
	3f74/GvM6k6OfdJLIwpELxVVw6LvEgbycE3+Hwt6omZj8rhpFpPqWpajv+I6NieknNyIvaX4hHg
	JkzTYJJKw8Zleh3
X-Received: by 2002:a17:907:7241:b0:c25:88e2:fe25 with SMTP id a640c23a62f3a-c2588e305d8mr110792266b.7.1788037249118;
        Sat, 29 Aug 2026 14:00:49 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:cf7b:6b6c:bc26:7dfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm244258366b.37.2026.08.29.14.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 14:00:47 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v6 3/3] hwmon: it87: add IT8613E support
Date: Sat, 29 Aug 2026 23:00:36 +0200
Message-ID: <20260829210036.61136-4-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829210036.61136-1-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829210036.61136-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "benoit.masson" <yahoo@perenite.com>

Teach the Super I/O probe path to recognize IT8613E and add its hardware
monitoring configuration.

Add feature flags, temperature resource counts, 11 mV ADC scaling,
the IT8665-style PWM register map, and GPIO pin-mux checks. Only three
temperature inputs are currently known; the six limit, offset, and PWM
map resources do not imply six temperature inputs. Document the chip in
the hwmon guide.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 Documentation/hwmon/it87.rst |  8 +++++
 drivers/hwmon/it87.c         | 65 ++++++++++++++++++++++++++++++++++--
 2 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index fc1c90b02..c33ba8a07 100644
--- a/Documentation/hwmon/it87.rst
+++ b/Documentation/hwmon/it87.rst
@@ -11,6 +11,14 @@ Supported chips:
 
     Datasheet: Not publicly available
 
+  * IT8613E
+
+    Prefix: 'it8613'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
   * IT8620E
 
     Prefix: 'it8620'
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 980e425fc..376d20e72 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -36,6 +36,7 @@
  *            IT8790E  Super I/O chip w/LPC interface
  *            IT8792E  Super I/O chip w/LPC interface
  *            IT87952E  Super I/O chip w/LPC interface
+ *            IT8613E  Super I/O chip w/LPC interface
  *            Sis950   A clone of the IT8705F
  *
  *  Copyright (C) 2001 Chris Gauthron
@@ -65,7 +66,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
+	     it8792, it8603, it8613, it8620, it8622, it8628, it8689, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -159,6 +160,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8786E_DEVID 0x8786
 #define IT8790E_DEVID 0x8790
 #define IT8603E_DEVID 0x8603
+#define IT8613E_DEVID 0x8613
 #define IT8620E_DEVID 0x8620
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
@@ -332,6 +334,7 @@ struct it87_devices {
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 #define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
+#define FEAT_11MV_ADC		BIT(25)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -548,6 +551,20 @@ static const struct it87_devices it87_devices[] = {
 		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
+		/* Only three temperature inputs are currently known. */
+		.features = FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,
+		.reg_pwm = IT87_REG_PWM_8665,
+		.num_temp_limit = 6,
+		.num_temp_offset = 6,
+		.num_temp_map = 6,
+		.peci_mask = 0x07,
+	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
@@ -620,6 +637,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_peci(data, nr)	(((data)->features & FEAT_TEMP_PECI) && \
@@ -649,7 +667,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -756,6 +775,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -2961,6 +2982,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
@@ -3138,6 +3162,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		sio_data->skip_in |= BIT(5); /* No VIN5 */
 		sio_data->skip_in |= BIT(6); /* No VIN6 */
 
+		sio_data->beep_pin = superio_inb(sioaddr,
+						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
+	} else if (sio_data->type == it8613) {
+		int reg27, reg29, reg2a;
+
+		superio_select(sioaddr, GPIO);
+
+		/* Check for pwm3, fan3, pwm5, fan5 */
+		reg27 = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
+		if (!(reg27 & BIT(1)))
+			sio_data->skip_fan |= BIT(4);
+		if (reg27 & BIT(3))
+			sio_data->skip_pwm |= BIT(4);
+		if (reg27 & BIT(6))
+			sio_data->skip_pwm |= BIT(2);
+		if (reg27 & BIT(7))
+			sio_data->skip_fan |= BIT(2);
+
+		/* Check for pwm2, fan2 */
+		reg29 = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
+		if (reg29 & BIT(1))
+			sio_data->skip_pwm |= BIT(1);
+		if (reg29 & BIT(2))
+			sio_data->skip_fan |= BIT(1);
+
+		/* Check for pwm4, fan4 */
+		reg2a = superio_inb(sioaddr, IT87_SIO_PINX1_REG);
+		if (!(reg2a & BIT(0)) || (reg29 & BIT(7))) {
+			sio_data->skip_fan |= BIT(3);
+			sio_data->skip_pwm |= BIT(3);
+		}
+
+		sio_data->skip_pwm |= BIT(0); /* No pwm1 */
+		sio_data->skip_fan |= BIT(0); /* No fan1 */
+		sio_data->skip_in |= BIT(3);  /* No VIN3 */
+		sio_data->skip_in |= BIT(6);  /* No VIN6 */
+
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
 	} else if (sio_data->type == it8620 || sio_data->type == it8628) {
-- 
2.55.0

