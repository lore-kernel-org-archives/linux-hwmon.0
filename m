Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEC0416CF4
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023158; cv=none; b=QpjNBmxVqsUEKA0TgwJZxwwK71FGd/YxpxpyhiVQFtRBubOk0bEmloUVP04Ug/uJAv93SWnSx+V5b/6H+m4grUMA7DZqcvJJXok7CxSBVRfrPVmvMg2/rG4z5IqJWdGDuNO8dUFE48ERlfIDEdRwtfKH61rRbXwxWTVyS0xruGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023158; c=relaxed/simple;
	bh=EwN2Ufrk3JZ1LOcr39JKvze/sQpqpgu7i1kuyfgBogA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTxicxPT54FfEIAHtqFLzYP+kvKrxKF9rGscwgQKKYPovybwvXYx23bUYMxC/t/LWyQll8gCTkfvbQiP/ZlMWD637Cq/ZnLy7sG4inV6uoxsotnSUl7qQ3pB4EEifNR8St0DbVGbos0/GZTJTTuPCBtIVL6dh+iZ6ieRsZ6QyeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAYjA0Lu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAYjA0Lu"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2544ff970dso318623266b.2
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023152; x=1788627952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+xOVsFk+EtrsGYFgTGdtYSvPsI3GoZT83F/GKM9fnU=;
        b=IAYjA0Luub0LcHKgk7TP/vrW9Vxz3HDMFu9CHhnhyO/WMFVWLAriNt3Gljqc8Qq6R+
         E4mBkWbl/zea+FA37ZVPKZctWAUrsXTGrO++/zWGTsKtGw2O+XXh8pOMQa7aD6lIbhFf
         NJ4Wg19igUzLlVPbgTV77mkLAx1PAUEe7RCuvy8UmjcsY+wffomUD9FyFet7JkJJzsfR
         8oMZeyxBG5amkF3aJF6iYAA7zoWCXuXIzN3aCHiMB/+jiogYohT8fLL6Fgky0M1jg64k
         OhgWlC9v3Xwv8l2C295ZbPzdsCMP+nif/QUkdK3Yr4oAcIn2iK1xb2UbR7gY7T2HOpqW
         demA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023152; x=1788627952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+xOVsFk+EtrsGYFgTGdtYSvPsI3GoZT83F/GKM9fnU=;
        b=ePHIe3dHrhPtEUI1O0zucwG2QBOSCWDT21AkyU1X0YzfpjDwxuyecufacNC+XlrUkW
         VNr1nvm58QhjR4b6IhXrhscIKq0WbTwr7aeuYtJ3wJ0kHsz9L2rQVqs64CDAVCvZUV2V
         a23KjtvMRDSBgnJRhgiG2hz03WC5r7T07Nct22ikU3ygbon4p9MrOWPuthJgeYR/n4EY
         sC6aa23pasAdUf0eGtsR8gv/k7aaAWOUhgskHi1ggrV2dkhHyWqOXVpWgMSJMGooHtCZ
         tv7c1xB37mfJvSm6sjXHSWgH3+iDUeDZulf3Nel/q4L9hzhx5uEka9fOQxQLK1YbLvQ9
         DdBw==
X-Gm-Message-State: AFuF++kdYujB5IMb1+hg8LXmk3mzIlTFqkfQunFqobru+GFlUEJpnwFu
	0Q2d0MA2qaxJMcf+lKifjxn5/whOoxVSr2ZVaBYIt91Rkp3skzu60gho
X-Gm-Gg: AR+sD12GDybRufoVedUO23Yjs9rGJDlIYfq9lyG+wmV/65M+LQr+69nC9chU7JZoEOc
	fO+5KQrN5l6cV7xALiqFcOKYp4JUZg9GuoyMdzXtAcHJEDv+AG6eIYMY5HVXXis8WMP3xd2xv3v
	V5S1H/04Y+5+UWtXS8k6bpK8gshmcqJ0VBWqmH+3CaVTPiUqvRCLwBM3uyyrE3/Lhy8yaVxjbub
	KjiepNnXgp6LN4GfsrIj/IRdIIi7SrT5qF6xj6UfLZU7wuIx8FxLmWbs194As2OtHXqTsmFbolf
	iVotIkeMv+jCT0mz0D4tWLJlzXjjF3BbM8ZFIvlu6upanEYS+yzM6TDO/X73PYTIhiM+eu0tbyS
	HrGxmQdkj9QDnwr/L07N/xp7du3PScuxr2NJ5EJTklwjAhr+7ARNgv2Ma9QEH8NAPOf4+4wD/gK
	ftAmEU1CScY7fImKXhQfAitBwuibL/sZ3hl1br7oXcZiU9hRPfCEjETM9qObTPjqMdVij9/WiKh
	3/yJ/03cn471xx7
X-Received: by 2002:a17:907:e1c4:20b0:c25:33db:939e with SMTP id a640c23a62f3a-c2556be4184mr773861266b.4.1788023151911;
        Sat, 29 Aug 2026 10:05:51 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:cf7b:6b6c:bc26:7dfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f29a9dfsm222290266b.63.2026.08.29.10.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:05:51 -0700 (PDT)
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
Subject: [PATCH v5 1/4] hwmon: it87: describe per-chip temperature resources
Date: Sat, 29 Aug 2026 19:05:42 +0200
Message-ID: <20260829170545.33401-2-jerome.tollet@gmail.com>
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

Add per-chip temp limit/offset/map counts and wire the driver
to use them.

This keeps existing chips on the previous defaults while allowing newer
chips to advertise larger resources.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/hwmon/it87.c | 151 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 114 insertions(+), 37 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 87edb1b60..1c77f6c97 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -247,7 +247,7 @@ static const u8 IT87_REG_FAN[]         = { 0x0d, 0x0e, 0x0f, 0x80, 0x82, 0x4c };
 static const u8 IT87_REG_FAN_MIN[]     = { 0x10, 0x11, 0x12, 0x84, 0x86, 0x4e };
 static const u8 IT87_REG_FANX[]        = { 0x18, 0x19, 0x1a, 0x81, 0x83, 0x4d };
 static const u8 IT87_REG_FANX_MIN[]    = { 0x1b, 0x1c, 0x1d, 0x85, 0x87, 0x4f };
-static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59 };
+static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59, 0x5a, 0x90, 0x91 };
 
 #define IT87_REG_FAN_MAIN_CTRL 0x13
 #define IT87_REG_FAN_CTL       0x14
@@ -282,7 +282,6 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define NUM_VIN_LIMIT		8
 #define NUM_TEMP		6
 #define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
-#define NUM_TEMP_LIMIT		3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -292,6 +291,9 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	u8 num_temp_limit;
+	u8 num_temp_offset;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 	u8 smbus_bitmap;	/* SMBus enable bits in extra config register */
@@ -302,7 +304,6 @@ struct it87_devices {
 #define FEAT_NEWER_AUTOPWM	BIT(1)
 #define FEAT_OLD_AUTOPWM	BIT(2)
 #define FEAT_16BIT_FANS		BIT(3)
-#define FEAT_TEMP_OFFSET	BIT(4)
 #define FEAT_TEMP_PECI		BIT(5)
 #define FEAT_TEMP_OLD_PECI	BIT(6)
 #define FEAT_FAN16_CONFIG	BIT(7)	/* Need to enable 16-bit fans */
@@ -335,43 +336,61 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.num_temp_limit = 3,
+		.num_temp_offset = 0,
+		.num_temp_map = 3,
 	},
 	[it8712] = {
 		.name = "it8712",
 		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.num_temp_limit = 3,
+		.num_temp_offset = 0,
+		.num_temp_map = 3,
 	},
 	[it8716] = {
 		.name = "it8716",
 		.model = "IT8716F",
-		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
+		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 	},
 	[it8718] = {
 		.name = "it8718",
 		.model = "IT8718F",
-		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
+		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8720] = {
 		.name = "it8720",
 		.model = "IT8720F",
-		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
+		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8721] = {
 		.name = "it8721",
 		.model = "IT8721F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
+		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x05,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -379,18 +398,24 @@ static const struct it87_devices it87_devices[] = {
 		.name = "it8728",
 		.model = "IT8728F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 6,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8732] = {
 		.name = "it8732",
 		.model = "IT8732F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
+		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
 		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -398,73 +423,97 @@ static const struct it87_devices it87_devices[] = {
 		.name = "it8771",
 		.model = "IT8771E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 				/* PECI: guesswork */
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
 				/* three fans, always 16 bit (guesswork) */
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8772] = {
 		.name = "it8772",
 		.model = "IT8772E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
 				/* PECI (coreboot) */
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
 				/* three fans, always 16 bit (datasheet) */
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8781] = {
 		.name = "it8781",
 		.model = "IT8781F",
-		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
+		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8782] = {
 		.name = "it8782",
 		.model = "IT8782F",
-		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
+		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8783] = {
 		.name = "it8783",
 		.model = "IT8783E/F",
-		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
+		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8786] = {
 		.name = "it8786",
 		.model = "IT8786E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8790] = {
 		.name = "it8790",
 		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_NOCONF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
 		.name = "it8792",
 		.model = "IT8792E/IT8795E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
+		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -472,54 +521,72 @@ static const struct it87_devices it87_devices[] = {
 		.name = "it8603",
 		.model = "IT8603E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
+		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
+		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8622] = {
 		.name = "it8622",
 		.model = "IT8622E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
-		.peci_mask = 0x07,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 4,
+		.peci_mask = 0x0f,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
 	[it8628] = {
 		.name = "it8628",
 		.model = "IT8628E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
+		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 6,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8689] = {
 		.name = "it8689",
 		.model = "IT8689E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
+		  | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_SIX_PWM | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
 	[it87952] = {
 		.name = "it87952",
 		.model = "IT87952E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
-		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
+		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.num_temp_limit = 3,
+		.num_temp_offset = 3,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -530,7 +597,6 @@ static const struct it87_devices it87_devices[] = {
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
-#define has_temp_offset(data)	((data)->features & FEAT_TEMP_OFFSET)
 #define has_temp_peci(data, nr)	(((data)->features & FEAT_TEMP_PECI) && \
 				 ((data)->peci_mask & BIT(nr)))
 #define has_temp_old_peci(data, nr) \
@@ -589,6 +655,9 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	u8 num_temp_limit;
+	u8 num_temp_offset;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 
@@ -937,12 +1006,12 @@ static struct it87_data *it87_update_device(struct device *dev)
 			data->temp[i][0] =
 				it87_read_value(data, IT87_REG_TEMP(i));
 
-			if (has_temp_offset(data) && i < NUM_TEMP_OFFSET)
+			if (i < data->num_temp_offset)
 				data->temp[i][3] =
 				  it87_read_value(data,
 						  IT87_REG_TEMP_OFFSET[i]);
 
-			if (i >= NUM_TEMP_LIMIT)
+			if (i >= data->num_temp_limit)
 				continue;
 
 			data->temp[i][1] =
@@ -1693,16 +1762,18 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
+	u8 num_map;
 	int map;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
+	num_map = data->num_temp_map;
 	map = data->pwm_temp_map[nr];
-	if (map >= 3)
+	if (map >= num_map)
 		map = 0;	/* Should never happen */
-	if (nr >= 3)		/* pwm channels 3..6 map to temp4..6 */
-		map += 3;
+	if (nr >= num_map)	/* pwm channels 3..6 map to temp4..6 */
+		map += num_map;
 
 	return sprintf(buf, "%d\n", (int)BIT(map));
 }
@@ -1714,6 +1785,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
+	u8 num_map = data->num_temp_map;
 	long val;
 	int err;
 	u8 reg;
@@ -1721,8 +1793,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	if (nr >= 3)
-		val -= 3;
+	if (nr >= num_map)
+		val -= num_map;
 
 	switch (val) {
 	case BIT(0):
@@ -2376,7 +2448,7 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 		return attr->mode;
 	}
 
-	if (a == 5 && !has_temp_offset(data))
+	if (a == 5 && i >= data->num_temp_offset)
 		return 0;
 
 	if (a == 6 && !data->has_beep)
@@ -3268,7 +3340,7 @@ static void it87_check_limit_regs(struct it87_data *data)
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
 	}
-	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
+	for (i = 0; i < data->num_temp_limit; i++) {
 		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
@@ -3461,6 +3533,7 @@ static int it87_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct it87_sio_data *sio_data = dev_get_platdata(dev);
+	const struct it87_devices *chip;
 	int enable_pwm_interface;
 	struct device *hwmon_dev;
 	int err;
@@ -3483,9 +3556,13 @@ static int it87_probe(struct platform_device *pdev)
 	data->type = sio_data->type;
 	data->smbus_bitmap = sio_data->smbus_bitmap;
 	data->ec_special_config = sio_data->ec_special_config;
-	data->features = it87_devices[sio_data->type].features;
-	data->peci_mask = it87_devices[sio_data->type].peci_mask;
-	data->old_peci_mask = it87_devices[sio_data->type].old_peci_mask;
+	chip = &it87_devices[sio_data->type];
+	data->features = chip->features;
+	data->peci_mask = chip->peci_mask;
+	data->old_peci_mask = chip->old_peci_mask;
+	data->num_temp_limit = chip->num_temp_limit;
+	data->num_temp_offset = chip->num_temp_offset;
+	data->num_temp_map = chip->num_temp_map;
 	/*
 	 * IT8705F Datasheet 0.4.1, 3h == Version G.
 	 * IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h == Version J.
-- 
2.55.0

