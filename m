Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDD3F1070
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001717; cv=none; b=QNFanslgQM8Ragjr23UhayLe5+JWUDSORGWrrY/fB3BOA5RBdUdFZt+gFhZ+vChwH3W5p+y79vcHoTVe2NhGHEnVHeTpVT5SjBw0wT7t59Gs8gYv9DRP7LNIyrEb8vFLhgwmKT9EacDzNSV6ADQNfGoKU/Bvz2iLYZIe6nJOX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001717; c=relaxed/simple;
	bh=LDYOr0rEyS7amfq1J9ayMBTRgACWhl+Rh4F8K2IMMzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sx95aps5GNJ5yG/15c185j/XPPLVHBKhRu714g1eGLnRjTZl4t4Qh+F+xJiX+HgaqSp1vMp2e+uU/Ng/wKxJ6Bm75weeifbQF0VzZtlaMB3NIODYLepTCX2rrE3BodtHrdIimsb2RY5l81T9qjcgRR67Oyo3am2l1IpgVP1yU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjGHmE7I; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjGHmE7I"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2946035a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001714; x=1788606514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+l1SqkWk65wBJ+489uxNBFWoE04JKMlEtghGIetHEQ=;
        b=LjGHmE7ID2wmz740rl/zKZDX1V7uVvGVpw7GDhajZGNq65an/EGtSweeon5SYGkPls
         3A1LvhIGLdczlTviUiKHEVUKY0XnZksMuJVbPrnm86zqcV4lD9rDqVteuTrJcQFKxVwe
         4TrU7y876wArmLYzE/JR9bs9PSXUgD0DSohFM7VHFPelPGUYjbDgwmmKvpdhc1O2Q0+H
         qpHx2i8fnUUH/pmlwNC9qR2rA7DBxwOrD8nHHsn6wgvmbl5Ny7/CAuoH0tVPiN9evCnR
         bK+OePfWusG8g86tdERgoo2q+8FrKoDhivkpTKddYT4yrPxC5Kt6xvu6l5Nxvax/ZRm1
         k+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001714; x=1788606514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+l1SqkWk65wBJ+489uxNBFWoE04JKMlEtghGIetHEQ=;
        b=pCLVHiQnCiiwWZtMFvb7Ny0rUQtBwmzz2tc1GfK4YDelab4qK1i+25sZLLAEBXaL2L
         pna3r6ucTiiKTV6weyOcqzJ2uZgpBo/LjLKeJbOopPdpWTNzmv6pTi1bUw4X2BHRBM3m
         g+yPelzJjTfU7aKzmFu/Bo9vvVblVwZ4EsudqYB5Dw4jK0jdp8RyPf542NipnO+wxL9a
         CnlXpTEb7bK7GTJ3gV4UH2kaBMJb/ocF0RSIYAtH5dTaEkO3MyNFnAkleXwykDUK0sEP
         r8nri+EqN7b8Mavodk/2iAhv0J27jKFlv4+dj3eu/JHICAYWqJDLs0f4hJVSIzV/xJ0z
         zQRg==
X-Gm-Message-State: AFuF++lF8TTNomlKP9BWbTsYMdD/yT0qmfGTeLGJt/NQtnNoi88u9GKO
	DlG8n042vZ+87v+TyJAmlOb9LAndga7KNUi9QItUMmm0RkxgslvN20kn
X-Gm-Gg: AYBFou2ggzxDWmkC5Nk3SbXDQsMKrzIXr369spYEuuDfSo0V+lmVRCAqGYlp8j4v48t
	Q397WAgZQkiBxLnDe69X5aRKsvsCEgqjAH9oyhITQtcMCiuDGM2hnWx07cMR9D6IgvCxOQgNx+6
	lZ3RsVeNDaVXYgvmU6v3VE5jBgcRu0xFE155Pm0Q0/+3pLazparHKeorl5qypngNh9zOy5H+QLG
	TlATimzcgatmDgPC4odXnHlKbBBL71ZY2ktUXf2gGORRDn5fL/QhVmalqRq+YHtc8Csh6GMkz03
	ozBYYzJ4mGYM6/EnB6ohGZGUNHrKi7iLJbe/1WD7XzXy67JQ6Wbvsl0ihhpcgz4/44O3vG5XQI8
	Z1w4BmJaPmMrMWU2qBFHFEM4fCaH7q9D8FeCWePJlHNyg4eHPjw1d42JWOs7q2W3WkaEmCze3n/
	M6wkveatptn3JJ8Knfvpd+MClcddQhnpN3kEj8sVmClw3ggXUVoIk7QcOJP+uUwG4dAY0JOuu8S
	oME+9Bidz2i9g2A
X-Received: by 2002:a05:6402:360e:b0:6a6:32f5:90b2 with SMTP id 4fb4d7f45d1cf-6a632f59377mr984771a12.20.1788001713268;
        Sat, 29 Aug 2026 04:08:33 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:cf7b:6b6c:bc26:7dfa])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c389aasm1507540a12.14.2026.08.29.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:08:31 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [RFC PATCH] hwmon: it87: Add basic IT8613E fan monitoring support
Date: Sat, 29 Aug 2026 13:08:29 +0200
Message-ID: <20260829110829.34269-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IT8613E is not recognized by the in-tree it87 driver. Full
support was proposed previously but withdrawn after problems were found
in the temperature and PWM paths.

Add conservative support limited to fan input monitoring. Detect device
ID 0x8613, check the fan pin muxes, use the existing 16-bit tachometer
layout, and expose enabled fan inputs read-only. Do not expose voltage,
temperature, PWM, limit, beep, or alarm interfaces.

The device ID and fan pin-mux checks follow the earlier v4 proposal by
Benoit Masson.

Tested on a system with an IT8613E at 0xa30, revision 12. Only
fan2_input was exposed, with stable readings between 1268 and 1320 RPM.
In a back-to-back comparison, the in-tree driver with force_id=0x8622
reported 1483 RPM and the out-of-tree driver reported 1442 RPM.

Link: https://lore.kernel.org/linux-hwmon/20260114221210.98071-1-yahoo@perenite.com/
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 Documentation/hwmon/it87.rst | 10 ++++++
 drivers/hwmon/it87.c         | 65 ++++++++++++++++++++++++++++++++----
 2 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index fc1c90b02..d00238e7e 100644
--- a/Documentation/hwmon/it87.rst
+++ b/Documentation/hwmon/it87.rst
@@ -11,6 +11,16 @@ Supported chips:
 
     Datasheet: Not publicly available
 
+  * IT8613E
+
+    Prefix: 'it8613'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
+    Only fan input monitoring is currently supported.
+
   * IT8620E
 
     Prefix: 'it8620'
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 87edb1b60..2f5800424 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -12,6 +12,7 @@
  *  similar parts.  The other devices are supported by different drivers.
  *
  *  Supports: IT8603E  Super I/O chip w/LPC interface
+ *            IT8613E  Super I/O chip w/LPC interface (fan inputs only)
  *            IT8620E  Super I/O chip w/LPC interface
  *            IT8622E  Super I/O chip w/LPC interface
  *            IT8623E  Super I/O chip w/LPC interface
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
@@ -328,6 +330,7 @@ struct it87_devices {
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
+#define FEAT_FAN_INPUT_ONLY	BIT(24)	/* only fan inputs are supported */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -476,6 +479,12 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
+		.features = FEAT_16BIT_FANS | FEAT_FIVE_FANS
+		  | FEAT_FAN_INPUT_ONLY,
+	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
@@ -560,6 +569,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
+#define has_fan_input_only(data)	((data)->features & FEAT_FAN_INPUT_ONLY)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -2427,6 +2437,9 @@ static umode_t it87_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct it87_data *data = dev_get_drvdata(dev);
 
+	if (has_fan_input_only(data))
+		return 0;
+
 	if ((index == 2 || index == 3) && !data->has_vid)
 		return 0;
 
@@ -2469,6 +2482,9 @@ static umode_t it87_fan_is_visible(struct kobject *kobj,
 	if (!(data->has_fan & BIT(i)))
 		return 0;
 
+	if (has_fan_input_only(data) && a != 0)
+		return 0;
+
 	if (a == 3) {				/* beep */
 		if (!data->has_beep)
 			return 0;
@@ -2790,6 +2806,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
@@ -2944,6 +2963,28 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
+	} else if (sio_data->type == it8613) {
+		int reg27, reg29, reg2a;
+
+		superio_select(sioaddr, GPIO);
+
+		reg27 = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
+		reg29 = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
+		reg2a = superio_inb(sioaddr, IT87_SIO_PINX1_REG);
+
+		/* fan1 is not available on IT8613E. */
+		sio_data->skip_fan |= BIT(0);
+		if (reg29 & BIT(2))
+			sio_data->skip_fan |= BIT(1);
+		if (reg27 & BIT(7))
+			sio_data->skip_fan |= BIT(2);
+		if (!(reg2a & BIT(0)) || (reg29 & BIT(7)))
+			sio_data->skip_fan |= BIT(3);
+		if (!(reg27 & BIT(1)))
+			sio_data->skip_fan |= BIT(4);
+
+		/* PWM control is not yet supported. */
+		sio_data->skip_pwm |= GENMASK(5, 0);
 	} else if (sio_data->type == it8603) {
 		int reg27, reg29;
 
@@ -3355,7 +3396,8 @@ static void it87_init_device(struct platform_device *pdev)
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
 	}
 
-	it87_check_limit_regs(data);
+	if (!has_fan_input_only(data))
+		it87_check_limit_regs(data);
 
 	/*
 	 * Temperature channels are not forcibly enabled, as they can be
@@ -3364,7 +3406,8 @@ static void it87_init_device(struct platform_device *pdev)
 	 * run-time through the temp{1-3}_type sysfs accessors if needed.
 	 */
 
-	it87_check_voltage_monitors_reset(data);
+	if (!has_fan_input_only(data))
+		it87_check_voltage_monitors_reset(data);
 
 	it87_check_tachometers_reset(pdev);
 
@@ -3525,10 +3568,14 @@ static int it87_probe(struct platform_device *pdev)
 	}
 
 	/* Check PWM configuration */
-	enable_pwm_interface = it87_check_pwm(dev);
-	if (!enable_pwm_interface)
-		dev_info(dev,
-			 "Detected broken BIOS defaults, disabling PWM interface\n");
+	if (has_fan_input_only(data)) {
+		enable_pwm_interface = 0;
+	} else {
+		enable_pwm_interface = it87_check_pwm(dev);
+		if (!enable_pwm_interface)
+			dev_info(dev,
+				 "Detected broken BIOS defaults, disabling PWM interface\n");
+	}
 
 	/* Starting with IT8721F, we handle scaling of internal voltages */
 	if (has_scaling(data)) {
@@ -3580,6 +3627,10 @@ static int it87_probe(struct platform_device *pdev)
 		if (((reg >> 4) & 0x03) == 0x01)
 			data->has_in |= BIT(12);
 	}
+	if (has_fan_input_only(data)) {
+		data->has_in = 0;
+		data->has_temp = 0;
+	}
 
 	data->has_beep = !!sio_data->beep_pin;
 

base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.55.0

