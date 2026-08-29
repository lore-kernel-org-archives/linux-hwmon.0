Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55B12CDA5
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788040926; cv=none; b=Hcav0RAjcuwXNvjRH+uU7fJfZSu6bvzr0QJgP/44TVuTYuB8sINenDptVYm9NuYpE98VjMqBEiKlmzna8HEZedKe6jp5oFD/rTpqMLyFSrpYTly4gtWdIJy4apHG+5TKz86/VM59y81yb37gyhCYkuRp+HqUn/71LiulwWCze7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788040926; c=relaxed/simple;
	bh=2grbgdQXSe/rm4PEdWgCjQp4KmzIoyocdeO5InblCLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGVuW97JCgu42ZoXFrcmo+VnZCtiskHdU5IyvfkVKCXoAeVvjE6KCQLa3BQbd7SRINXokVTkrIirzVDf/bEoRGWlmyXwN+EbAJRzaizKHl/Z52JP3EOchT2RMJLYR6RwSnqXsZsMdqSD8ruQ3QGr1iNY+zMHLh0NbKzhE4ydpg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGEUwjCt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGEUwjCt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c255acff671so300386966b.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 15:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788040923; x=1788645723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0bMYmxJ9/jkX3lmW6e7asa3gX55fQ68kq5LlcGH1fQ=;
        b=CGEUwjCtpSplL8lYHB14GCnqKsG1DbLnt8M43LIM8haNHZAhCZ03MdroCW3boiiTBE
         XdG/5O3CpSd9qDu0qFYbWir52srDoQRpmug9NnsddXX1uzDpAyF/DiP8V2M70eNF000I
         3Qs2/McWRFggTlzPt4tlU6wHsOvNomd1uqwB81tIwc8k/9DnD1USGCpIs9OnL2l/xXZJ
         0BBi46d0LrXCYB+SZPhvrltH7e+RgLG7WAducxMawwhL6TDSRbT1GQchhENDfkGh4Bzj
         12e0Vi7YoKxeV6zkqe4S0xemqeLmITgCKuq+zanMLkicENu8BU5orlkp3yXgXIKBcUdP
         SRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788040923; x=1788645723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0bMYmxJ9/jkX3lmW6e7asa3gX55fQ68kq5LlcGH1fQ=;
        b=msZaEQhnT1p397IzpbPhCPl1KAo9h3QuQJSPOJfnm1YSKNSqCAMe9YbOdAvZnXmeR6
         RD/9NWAh6vp0eC49W+/XWfGjDYgaUKT6wFv/RHw+jFrnH14AzqvkDcBkKP+d7bsayODQ
         2oIzVcFDPDoQXor7N4R+9IsE9fVHyNlqlV2fkOxNjVuATuWXoZ13+RBu7TFqiPoNRNpM
         fR3yLiNWgLBA5+JvjTiq0sLw+hySMp3r0t8m6LtCFgGUpN8Fm05HqZxSs9gXhH2Mf0/z
         Rm3LUaVGtixQLS+SqNDMabdOu54cF5nQmkp1Re9nvI5Dn4HwWh/bSUeu6sb3bNw+NGTx
         h46A==
X-Gm-Message-State: AFuF++neBjNH8CarrsDQF72bUROzBJEs5weiSTXVAm4M6ySfNk9mN/Jf
	z1FN7QSswondC1kL+KY9uhSJoHwyudv11uH+NwIJy/ODlbvPmnK7EZl6bE7QC1aPzsQ=
X-Gm-Gg: AR+sD11/jm3Z2TrWweHvFT8JyvvqPMRPevpMwictfe53xdI6QGFpX/wM/tkJxiv2utd
	plC17urRtlL8MUriKLs/CAz8XdmswWcp02zqniRQ8QKMK3Q/oe3JgSrFyEUg7znqKgZT3CJrfol
	RLrL6E5DYFzamR/nASpAYHvFWaoX/f/8CH8wvGBm1kqjM/iENb8MfkLjOmgAeJ2jpVv6DOHwRjt
	7aqIKOw0lChECl6OFTd+1/jWGo7NtF9Kj76oS1IsKdT0Zl0AY5R+VfEVJJ12yldaPJ6tD2hm21X
	wTW3NlrWVf3lW4T69hncN5gAYJyNFNquE2MoiL018EFPbOIywjieL7oRzTd+okEnD4iUQNgYaM2
	1XEEYWdpkboqTm4S4d0IJerTpc6/ogFq9CYqL4rU3R8DzW+7kbUrbjdPGt5QTBCoSVlXgKQh3NO
	qQwIlNePtKfcKYhaEpnQ9X4e/+q/SMyKJMJPbDQmtNdaj9C2siGnkddzBqMvunyl8+tYUOhw+vE
	zFcAl1MGUT2BJc=
X-Received: by 2002:a17:907:c08c:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c2557423bfemr1151029666b.23.1788040923006;
        Sat, 29 Aug 2026 15:02:03 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm248747166b.37.2026.08.29.15.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:02:01 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v7 3/3] hwmon: it87: add IT8613E support
Date: Sun, 30 Aug 2026 00:01:49 +0200
Message-ID: <5afd336442307450f77467b2a749d405970a2099.1788040385.git.jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788040385.git.jerome.tollet@gmail.com>
References: <cover.1788040385.git.jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "benoit.masson" <yahoo@perenite.com>

Teach the Super I/O probe path to recognize IT8613E and add its
hardware monitoring configuration.

Add feature flags, 11 mV ADC scaling, the IT8665-style PWM register map,
six PWM temperature mapping sources, and GPIO pin-mux checks.

Only three temperature inputs are currently known, so retain the existing
three temperature limit and offset resources. Document the chip in the
hwmon guide.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 Documentation/hwmon/it87.rst |  8 +++++
 drivers/hwmon/it87.c         | 63 ++++++++++++++++++++++++++++++++++--
 2 files changed, 69 insertions(+), 2 deletions(-)

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
index 232cc8586..2757d428a 100644
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
@@ -515,6 +518,18 @@ static const struct it87_devices it87_devices[] = {
 		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
+		/* Only three temperature inputs are currently known. */
+		.features = FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,
+		.reg_pwm = IT87_REG_PWM_8665,
+		.num_temp_map = 6,
+		.peci_mask = 0x07,
+	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
@@ -577,6 +592,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_offset(data)	((data)->features & FEAT_TEMP_OFFSET)
@@ -607,7 +623,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -712,6 +729,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -2919,6 +2938,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
@@ -3096,6 +3118,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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

