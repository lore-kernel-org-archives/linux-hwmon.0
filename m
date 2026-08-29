Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653BE3546C9
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788003019; cv=none; b=YkW6jymZMsAqFBDh3suMvxPsvLwwjJjcG2d5iI6wfSCIyqGKLAUHEg66Ozj7wb30MDOrLOe2q7BdsW8pzrJKvFEeQvt0RBebw7MaXpwb+c6cYBZxDgZ6CUokqPwaw8FuPgrYmMgKKsCytLLLbHumGpehEq9jFv/XTdwoldgImk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788003019; c=relaxed/simple;
	bh=PXsJuoJQOeUrTi7/6VnKi5Xf3d+DZsEGxlAPpwAuVk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9GDPMurIGYUeHJn2TphQ7194npO9uophPsK0Ja1nQm9WIKBNuKKbSuSQSBvqxcZ2sBtNn5EICCFw5cy3DCGIYIWL30nVmfF2S37LRDTHEZei4wBAu0JkVbkKGXdsCNG3HZyHQj/nFDvsl55nmOhsNMnwd8OgnnlPspOpsvhV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfsn7eBF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfsn7eBF"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2533d83e3bso307960966b.2
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788003015; x=1788607815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8z9FGepOAxQyVX+dHXNB3jA7Dixh7yP5oBUtVeOCBcU=;
        b=dfsn7eBF3yevzzGFTrsmWQTbp+UXi2mB+tZn0Mrh3GhljGxzhi5D/1+7FYe/Mb0t5w
         JrcQyziRIpCAXfOdepdPlzaSZIRGSghgU3lQrWOKzzGs69kpV9wIE82M/MuF87urmU8V
         Y6l/uXR3K/VRuwr+ySduBRIQBw9ylQmKL9s84gkEA95fXiG77yQAvA6/LRG26sQ+lbh8
         B6tAFI6/v83tenhsTMhIz2FDd5+zYtEtutUQBXjp71AWnwjOuWTyGHVq0pSR6xQVINfZ
         qT6ewM1AAr7SXbx5/OK0KA7btvQrFj4hxL2QHiuKzuEYZosZY79AOwF/6waFroq/iAS0
         /22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788003015; x=1788607815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8z9FGepOAxQyVX+dHXNB3jA7Dixh7yP5oBUtVeOCBcU=;
        b=FrGoKTQlQxkA7X89jtGqDYy1tkOvvkFTWu0QBXLB/Uh/ypMbNOqDHheFosQiU24Bp+
         nHTPBAJ7KF79Xm2Ya/TlX/G91t0BsF5m5VZE8meWHyd1tXdI9igw2oXS4JbtpsSFKEn4
         5+K+DSWsS+kc5Y8xchQg6ot4WKtqtAUJab08Q4imwobHezhXHUWefXWyHS2exJWiLxXs
         EkmCcrHaBnBlsP9kNq+L4Vcoa/THeZMozkJccV9Ogz76QtP1eHFg1GNGjxxNMKOIyEyg
         OR31ubOJ/PEKQkua662g48ffBCC/tLIHULMKog/tdkEKrpgD/uI2SeMDWE9Jlqdp455w
         XYuA==
X-Gm-Message-State: AFuF++lMoTE5wTNQpOCVHrdH/MBT1PWL19ayULTMpc5ZiZPYfs9GZeOO
	jraiJFqOEqzyidDPe9nw9Cp/3cgl87JJ202D3LAY720+7kse/sXy/WgE
X-Gm-Gg: AR+sD11LFwBTPT3A6xoDqzsdqkXu66Zkmq/ibkYFsLlUEZRgigE7DegowTQf4HNPTcU
	hHzKGv+yOlh4T+xc3r5aEBPe5U/0WwHFEQIFcbofxMHjoe+bUL+L6ntec22Rig2s0wWjEDs1j9f
	ws1bICeCNzPwjB+rc62SQFMSikKIT2SymEXQ+oDTVeXog1r6rnqlgz8IBW+j2AUHZFswyNjF+cD
	zdZox/CCIzsf/Fqlsrozg0O0iNqqA9tOxRAe4U66BY2/oc2e2WbjIjeWYK78eS2tt+oburLLOlX
	fa2lRtjkc65QqX+sGLgTQT6cGJgAtxTnYO1xAI5UYJjuIgGVnWZRYnTm3y3zv09mYx/fo+iPvSV
	qR2qTQ0WzUQ5hBduJwyf+PT/MJhIOf6a9/4PkJSh/SBTjJGd3SbtkX/6x1+GzqOfH5A1EFJjAYi
	kQJS3u5LhQuXYS399QoJbHxGVUYiToDPT3fTjtfW7yJuj5xBA0t2X0O0gTWwqx9cyBBIiqsCU71
	LXdpAGRBEN9rt9mC7jkTgdtmw==
X-Received: by 2002:a17:907:b048:10b0:c25:74be:b2a8 with SMTP id a640c23a62f3a-c2574bec8admr135034266b.21.1788003015238;
        Sat, 29 Aug 2026 04:30:15 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1facbcsm192181266b.44.2026.08.29.04.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:30:14 -0700 (PDT)
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
Subject: [RFC PATCH v2] hwmon: it87: Add basic IT8613E fan monitoring support
Date: Sat, 29 Aug 2026 13:30:11 +0200
Message-ID: <20260829113011.51290-1-jerome.tollet@gmail.com>
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
Changes in v2:
- Skip PWM, limit, and voltage configuration for fan-input-only chips
  in the resume path.
- Link to v1: https://lore.kernel.org/linux-hwmon/20260829110829.34269-1-jerome.tollet@gmail.com/

 Documentation/hwmon/it87.rst | 10 +++++
 drivers/hwmon/it87.c         | 73 +++++++++++++++++++++++++++++++-----
 2 files changed, 73 insertions(+), 10 deletions(-)

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
index 87edb1b60..a60a68b62 100644
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
 
@@ -3660,9 +3711,11 @@ static int it87_resume(struct device *dev)
 	if (err)
 		return err;
 
-	it87_check_pwm(dev);
-	it87_check_limit_regs(data);
-	it87_check_voltage_monitors_reset(data);
+	if (!has_fan_input_only(data)) {
+		it87_check_pwm(dev);
+		it87_check_limit_regs(data);
+		it87_check_voltage_monitors_reset(data);
+	}
 	it87_check_tachometers_reset(pdev);
 	it87_check_tachometers_16bit_mode(pdev);
 

base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.55.0
