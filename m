Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897833FB05A
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023166; cv=none; b=bA3M7YU9OaiaeT2BL51Yzw2d+mZ7ia2Vm6XYm4uOXSIbsJtQu+ut5q4MeugD6NkpsvM9ISgAmoLmAKmMxEiATogSeIzZfkNV7p8kAOcVfPCUcREY6Eo6/UsI/B9Td4TMkmLk7PCOqQFaTRZuRMy8cD3CdPSHF4B+uul7W7QCCF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023166; c=relaxed/simple;
	bh=/ESLAF9xL9OgW79vd2hVpl4AEXYy9EUVtkY1xmIQ9z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hP/zKxD4AuxjaeifzOFbyrnYKFYRCYMaPLFFPixc683nEFFPEQMdHukXPaqBHpwCTr+kW2sFc/w27zmbYAqqnGMmHqUBRNPrkPqe7Uh/Jui9O5Gv+ZJKKkC2fXXmFU/ur4rXOa9gqkxhWouYCWcq8ebFKwG29iFNra0M2VZnpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTuNIaO1; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTuNIaO1"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c253425b253so330598266b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 10:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023160; x=1788627960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+O3FjPNkpZ9C9VUnIRaSGoxe9eYJb6Pa5F8ITJvBpI=;
        b=jTuNIaO1r97Ogg4ZzVzZx2QPIAccnX/8GyC246cns04CU4bbtbgOTCT4EeTlASi3ON
         23FBiq0WsrhECRbHipItl+V6ZKfJQ80tQfdSjYvBPrcZ32ouvv7Hq7AMr0mO4kpN9DdT
         qgdJqF8MDQTgttvh3hF7ip/LBiaVvCSUga0bR7kmt/CLQZOZfCGuzcPcv8rvK82Nzk4M
         YhvIW84QcYD9yeRuloC1Sx8I1jH0LqpWGCq1a+EFYgkPRIgTxd7GqWTQibeRVj0XBoKl
         B7BwtGj98gusr4BaoIS2OsBT6XaCcRub8dPwrdHQj6Rl2mLzMCX45s3izkt6AodTFtnM
         VoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023160; x=1788627960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+O3FjPNkpZ9C9VUnIRaSGoxe9eYJb6Pa5F8ITJvBpI=;
        b=AAeqR48MQ7xpovjnxLUmpepAorTWkoSvpTpds0KZO5tmUob/ZGSAheIzsxRwATlhoo
         9YLHX6QpzjIrGGkkUEJ6WsWolbE83A+jw7ohFt+ou9jLFPe95WkPJrGcOU0QhlLce20b
         Cf1DRpqGiPnuvl6qjHz2oHEdraOPv4mgg0CIhQCtg76jHKYllSAjc2FIBqIlbqCEF3OE
         uk4kdT4znSxKcUxbHQsTpS5gwM0ShTnabp76uzWeWPGEbOoZ1rRHjkxA2cGX8ohnKo4M
         dGkV4qCW2iygR6sjiWVkZ8RtuuSzipDi+AgzYkszVTp7vwn/2xZP7gOICk/J2zZ7L5hf
         5QMg==
X-Gm-Message-State: AFuF++nPEFLbfnztmeGmsUDg3joxrgSCtGF0ZnPdcgt3KlyaUcqZZS2i
	fegz2jjw9f+OQoP9BcPQ6tsr/IRxEVxf/HCAzk0KK+/ao4vaOIyYLb/5
X-Gm-Gg: AR+sD11YknLA3CpTojGpypRudFxW7QyVnHr3pxHEJak+BrBi4xx/aBxFz1+HtFXYOYj
	07iaHhvL0z9swHxMH/E5QvQV6lyMRwGp7RB23lBqd1DmmbNEGTvhgsCqgvOiW26IHpiKWE0a/I5
	oBSX8GmljND34aXMnxDn42xjVYc3hIFS/bdHNmcvGqGgT8gxsKoZ+7ULltbxWORYRiUbiAhMHnj
	qiO+3b8+Jh5W+GpN5RJuxThzUEnT6D5gkQE/DbvEF/SEi8nKl7NXj5Ea2/U43inYvgIOAmu5DKz
	09yI7U1wiN5NXhzojTVC52GLhWIpqoUi29IcTtcvNkuQ5fLmRvemaS04PcUvap68EnMOyValy+v
	+YrIziq+oGAsBTm4gBDWHxKI57CNyQdN5gHxeGxydD0OQkhc1EpUxsTX/I1drxJH3KnaZzEaJ0V
	W1LgJmo61A4owIP/sa880OKgA+gHdp7R31v6Ur6DIN4dmfpQRqLflaI/pqjjR5TzYJgOsCgWiES
	s5AYmbEwfXs2KM=
X-Received: by 2002:a17:906:9fc8:b0:c25:1a5:62a4 with SMTP id a640c23a62f3a-c2557164d51mr1038686166b.17.1788023159688;
        Sat, 29 Aug 2026 10:05:59 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa6a7sm207780466b.46.2026.08.29.10.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:05:59 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v5 4/4] hwmon: it87: add IT8613E support
Date: Sat, 29 Aug 2026 19:05:45 +0200
Message-ID: <20260829170545.33401-5-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829170545.33401-1-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "benoit.masson" <yahoo@perenite.com>

Teach the Super I/O probe path to recognize IT8613E and add its
complete hardware monitoring configuration.

Add feature flags, temperature resource counts, 11 mV ADC scaling,
the IT8665-style PWM register map, and GPIO pin-mux checks. Document
the chip in the hwmon guide.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 Documentation/hwmon/it87.rst |  8 +++++
 drivers/hwmon/it87.c         | 64 ++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 2 deletions(-)

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
index e44ec65c7..67a94761d 100644
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
@@ -333,6 +335,7 @@ struct it87_devices {
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 #define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
+#define FEAT_11MV_ADC		BIT(25)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -549,6 +552,19 @@ static const struct it87_devices it87_devices[] = {
 		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
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
@@ -621,6 +637,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_peci(data, nr)	(((data)->features & FEAT_TEMP_PECI) && \
@@ -650,7 +667,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -757,6 +775,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -3006,6 +3026,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
@@ -3183,6 +3206,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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

