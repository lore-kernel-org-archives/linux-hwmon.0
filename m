Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1CC22541C
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 01:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008381; cv=none; b=TTMzZ7vauxSVPL3dY+ED75OUzv4LfZ2AMjs9NnESeNgdTL+4TH4Aofj8RLQH5TBrQ7GeJvRUSny79I1Z9MhjO6jXFqe+Nc4WJ77NemxEKngsIEAxjXMi8NqCfwGEMcD2Uu4X+KyMri3rI4DJzrgCW2b1w0y0UYqYNWPBwqrchFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008381; c=relaxed/simple;
	bh=TDDd9qRH30Jxzs7vVu8CkneY5/auV7dFiBK40vfflKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qsz46snrY/Kftc8PMzGMAbT9+oVWIuNZV/XW7alX3GF46EwfaiEqekFt7EoQ2hBR18WCPTcmBT/tLgi9KjBnS3FL+DO/wzVWGb8VjnQPlZN7QAUNZVa1nHpbo+48J9QGAsEPqA5BXr4+gfcl34FeZu7OU5iA7But6TyZtLqTFis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=cS+YuDRL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="cS+YuDRL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so45039895e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 17:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768008378; x=1768613178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzxrMR5YefBOzP4Z2aTyL16iNYZgq3G71L4IYKxvjEo=;
        b=cS+YuDRLAhBSH486ekG2LblF4fMY2LzN8fCWij9tiKJb8PesgQxqnWthN1CMM1W6hB
         Nu0U4Ag0Q6wJ5cpf3f9M4d3bcUasB3rkY1jU0EDYONoG3QV51xfmLfjX04oEQTjWZZMo
         X3mSJTLK96O2bzBNJvf60N8zd6adk3yM+0oCNShE0V+YNP1zrAL3rFgCuG1puSzyD+Le
         20Mo1Eixkykw0eLifaC4RpOSS8MLdQWacyAAlptgZd6BwaD1u6fx8eZc7SvQ2o6VaCYM
         PPbqPLBsWw5Asp183ZL9msGq5JUsOhUu7WT5ul4NrM7hLFOiYVp+bB5JV102VPZDfSa5
         9w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768008378; x=1768613178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzxrMR5YefBOzP4Z2aTyL16iNYZgq3G71L4IYKxvjEo=;
        b=OPL696+yKq4CiTqb071cHjxHak0D2H0rxu7S+Sz6jttgNalTac3RxmWUYWRJqHxhP6
         1qc8wHZGOSaJmNnA7gd5K2h9/2try1Hpf3G2uS64n/17F/ySBZqMbwHemQ4hriEKytEs
         lNwUXVsGeMSJN4MvFATk66inFli5+YcXRs/Nnk5YT6XKI9F+1SZ2M8N8oLdIQ/WOxr1t
         HXwSiB3vx/VlrVvFLNnXbQ0Q2IvGpW04isJh9MHLeLgfl0fYoQMnazegWLKyoUF43xNf
         RSay+Yfgmezv+n/B4YIK3kGRKb6nkkijBGamA8qBsH8w/eUiDb2nWw/ISwyPJG0ayIyx
         KUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgIRKwCh9FO3JJ2Vm6JLhS9zAh3uoRGXmJ7PCYWMBq7zRuhr3sJnh4rQw0SPtiDxsn1D+jhvPLvx1Y0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFFTNRNN1W5z+khgWdfEo7evE/Qn4gcmqD4sSzLOipZ+JV52jw
	vrvPcyyZlPh8J7m6Jo6/+8YBJ5V604SH4gaGoYT0e5qp4MWms3jWo1Srm9qxuCk9lZW/3fu2aJR
	OmoY=
X-Gm-Gg: AY/fxX7eLgZnBKqs4fohvvTqUHWkDHz4PZTOfhySwmxqLxe3U7FOlnwLoG6YVgNB6RQ
	apa/mRZScTSVJ4P1XBxLud2TIx0Lp9rfpP+gkbLwT++BAeOcmMYO3Cwh1rmXBDQP9FodrCD9pn/
	u/kjbaVK2lxq+mB3t/DEVeIaZmYArkRd2JxGClA6gu4grAkgu7vAHCgSgHOy2jo7ChFy5ZvjFJO
	eoNKxx1z+HU2a5TmAtfdMo+0bjN4wU7E4ElhBp47Fu7tt6BV0WKVvV/SqXdJf4+wlyxFEsw44Or
	QbVOMsBlnzjfMKMvqTiq/tp9Kn9uWPJFPeyzMM7cz4MsJOpXWnqPoYm9RLEKz8eHE5OzhCk5HDV
	JieRgLlGLTQ26s7r7aJ7DWXA3dlm74iLJjbWZ3kkmWWBHylLLh+0hLT2+/Jcj75syLsl2prEuca
	Zg3qGMxLVOKAfwWAKvSquVORoPZENlL4v6TgFlwek=
X-Google-Smtp-Source: AGHT+IGCig68ibb0nVKyAmIqTKa948YwAGL8D6G1gzKzla18gKcyRGEwF2fYh8wV5ht7uEywSjMTmQ==
X-Received: by 2002:a05:600c:474f:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47d84b41294mr125418375e9.25.1768008377117;
        Fri, 09 Jan 2026 17:26:17 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:6cf2:f0aa:7bc6:15fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm25859761f8f.17.2026.01.09.17.26.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jan 2026 17:26:16 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v3 5/5] hwmon: it87: add IT8613E configuration
Date: Sat, 10 Jan 2026 02:26:13 +0100
Message-ID: <20260110012613.48150-5-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110012613.48150-1-yahoo@perenite.com>
References: <20260110012613.48150-1-yahoo@perenite.com>
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
index 1f4936c0e746..746ea9279efc 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -336,6 +336,7 @@ struct it87_devices {
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 #define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
+#define FEAT_11MV_ADC		BIT(25)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -487,6 +488,14 @@ static const struct it87_devices it87_devices[] = {
 	[it8613] = {
 		.name = "it8613",
 		.model = "IT8613E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,
+		.num_temp_limit = 6,
+		.num_temp_offset = 6,
+		.num_temp_map = 6,
+		.peci_mask = 0x07,
 	},
 	[it8620] = {
 		.name = "it8620",
@@ -531,6 +540,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_offset(data)	((data)->features & FEAT_TEMP_OFFSET)
@@ -561,7 +571,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -667,6 +678,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -3095,6 +3108,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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

