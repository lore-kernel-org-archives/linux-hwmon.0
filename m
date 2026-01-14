Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96303AEF59
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 22:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428759; cv=none; b=r2JtG7Yb1n80DiHv8x8GYrQ5i+0ToBHqWUoE1TmoG9Hp7ayEaU1GBZv6cL4vtWzWjYSNEE6pUVIEvP5pZjqB30ZvFHY+8czVAvZRpAlRn4ArCb1A/DapILUEiT8vqKBelzAJm8i4iX3cE7C0Kh++INv/37cbflEtgWZfLFrKsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428759; c=relaxed/simple;
	bh=W+mERa2bshCV1HgasC8vl/IXM22iJcfrOm3qbS2eccc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tg1A14Q7WnKhlUOOXK/Zue/gAt2my4t0XXRYjBrnjJoB2ZEBOoyb7LZ/h8uByJDr6i7QzA48YBAKRO7Tyx8R8vZeqA00IpXs8Sy01syuBRKR/JL2AWdzVZshGhgEkYbDuZRDgAu2RnuJu2oS+xpbQ8nK6w9l0kBpUm+GX5g73ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=gqJKUKfT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="gqJKUKfT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so1819425e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428739; x=1769033539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l+g792kSXhbsjX0MXutJrSM3vyj28X2EglOqZxof90=;
        b=gqJKUKfTrDrdP+rvTyNDaKosQpGMIY8SrBROm5d3tgNoFC3qw9nc+DTIf5wjuq/Pn6
         MG+XmJNw1Sxa7AEz1M7kAN/nWEBdxm2XlxhizjN2v2NRtHSMQ9we7f2e0w1FMM6OTxJv
         uMFa+BhkzxS6U0M8l8bf9UxHVGTbn1gspXxRjwxlnp1dvzwQNBzEwNddw3mhjTaWbi8i
         NzgMLeyi0uJm/FvlnZAvlrcJNMcbA1+MHJyE6yXn4PLVLSOBIWEd6/HCHy6Y6xsdwaB2
         +dfnSh8+d2lFzPxM1RETn7MpvvjmJQpKxLz2GllC+fB2iJx4PTNeyfPUWXnsYX3fBiU9
         8Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428739; x=1769033539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l+g792kSXhbsjX0MXutJrSM3vyj28X2EglOqZxof90=;
        b=duGwyPXxFRP0NKVhNTdv3bA/OgkVqnAxX0beXJUIKeJ1dAbJRieeibzhn94aaSWXSZ
         FdK1+r7lmzxpdqABodzf3/dbc5RNbB2B3XPSu7gk6CJl+UUnOMJAXli9CbGjSHgBCPvk
         lh6W4Uwqns4MtrkH/3ULcaCfj64Z9LHbq4wksb7JeQBIG7wSvAA4AtlXRnjjDK/sETv7
         6pUuLppbZCwys8Ff6u+B/bmZs41e7v+7kXx+wDqOU+R0xoWC1OyP3y6U3eSoKpqkR+Sc
         C4mgS664AoK9xjbkiJ5oNL4OzH65sbyBJvay9b1Tp74BNWYptbIO+RmjD9tU6+/i+nQG
         erqA==
X-Gm-Message-State: AOJu0YzhfPraAC48Y3NF0t+chwjR+z2cBwH/+dCKFgGaKJjhlbxZLCPF
	JhxbRpLxBekjRm7CuzzwBQN03yXz7dkabSHxB/yWXQCrgIHd1nUD+MeIj0n3Z78TWQ==
X-Gm-Gg: AY/fxX66EGbI8U3w9nhY5PiAEzreFs41S5isjgqwC69x4/ZtzzgvYiO1wwc0HkfO3VA
	IrPprHOAzZRHE/T133w/vVXWHz2vWTzSsp2wc2cnHD5vaOi55YA6jbdghjMdx6exiWsM+RbBq74
	EXXY1sp3K3zoF0IfQeBVApAEovpbf27GkVSIaVdq4KFjOYK1MHJsJ+XGUiNrTJz2FRzbH/G0z0i
	3G/f84E4h/AQKd81tIF1Z9BIYcy8EbVJSfE5q8bUVW5KesIhnmyrFqE/u9fxaQlkXdJ09uDBRBh
	l2w1n5fZH1JwIXSXv2clxq80H7iQtl5o7MWdXmIhiuRIxq0yjURLg2MkGBGMDRx6KU3he7eFxCB
	foK1iWNdatMG8YeSfgNaPrKR6UiWPVbZWITSNVMGCfzS0ijb81YFoQwURBxrOFNwPYm+PAnTkzh
	90G0rsAqq4YPmRAbaqOC+TJGtUtxRScRGE42ecrNiJ9IpjXnY7FcGJVKvdNdx0n3dzQ5oEHNeqq
	qdj3qkZ16F8kTyXRw==
X-Received: by 2002:a05:600c:45c8:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47ee3071491mr51527195e9.0.1768428738756;
        Wed, 14 Jan 2026 14:12:18 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:18 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 5/5] hwmon: it87: add IT8613E configuration
Date: Wed, 14 Jan 2026 23:12:10 +0100
Message-ID: <20260114221210.98071-6-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260114221210.98071-1-yahoo@perenite.com>
References: <20260114221210.98071-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IT8613E feature flags, resource counts, ADC scaling, and GPIO
quirk handling, then document the chip in the hwmon guide.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 Documentation/hwmon/it87.rst |  8 ++++++
 drivers/hwmon/it87.c         | 52 +++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index 5cef4f265000..fa968be84f7c 100644
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
index 4453bf3e8ef4..6a0ee13bc95f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -333,6 +333,7 @@ struct it87_devices {
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 #define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
+#define FEAT_11MV_ADC		BIT(25)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -552,6 +553,14 @@ static const struct it87_devices it87_devices[] = {
 	[it8613] = {
 		.name = "it8613",
 		.model = "IT8613E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,
+		.num_temp_limit = 6,
+		.num_temp_offset = 6,
+		.num_temp_map = 6,
+		.peci_mask = 0x07,
 	},
 	[it8620] = {
 		.name = "it8620",
@@ -612,6 +621,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_peci(data, nr)	(((data)->features & FEAT_TEMP_PECI) && \
@@ -641,7 +651,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -748,6 +759,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -3171,6 +3184,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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
2.50.1 (Apple Git-155)

