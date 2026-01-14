Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68FD3B52FC
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428750; cv=none; b=nROWs6CGMXtU1+y6wl/DyGaHc+uWLia2PgR4YfQLy1HjNLtvRUVaYSpJHzb0NleszxH5k6hqO0n2oGSA9BfyYNbexyx1VbjWr+8G404mtpgDQf7LG/le//umcK44rM9XtykZYGBBAx1ofckfEA3TPtaWcHKBtRBrZpEA0Mx8UOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428750; c=relaxed/simple;
	bh=CZUPwjqpRwAkJ0G0ZvPsL1bCYGkLFpLiebXf66hSzCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uf7dPx7f95Ojyzgy+8Za5mJa9cAwG/zAo83KpAgmujjpVcvXIR7X6ZdrR8O3Y2ZIvaMJoRv2uI76zjJ3/QruV/KO91EjZmZZbqR1KYzt1kTGRBh0e3jquJ7joxPf4uHbhoztxT8V5n+k4WfI8/a5B367iS2N4udhSbGbt41nfXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=waw0AWzb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="waw0AWzb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edffe5540so3059935e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428735; x=1769033535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYVrDxAFik9ZlMUAZjSOaSsJUzl9iKpSUm/XmRoX4Ic=;
        b=waw0AWzbjzK4Mf0cb5axGLzTyMJ+fcrARLe2Xi/f7ZJpHYfru1eRLjseWa6DhpfIv0
         fNnjBq7oQLrkqW2+Exo/ZJLZme//VFWBelEcuYBPRYBm+q/rY9dA+n0iK8MdKOUZjzfT
         vGTHRhrXmWN+ubJ/6YjoL0a6n7lIVJ2WDyf8nn1/BJXgn2AXolc1SIZJ6QnXfiCHSpqg
         z7eBeKdi9p51PJ8DyKSWSbvwb11sEXkkeYk0rQmsJbdIM4ymWlSESSV74BpfKMRohAjK
         fMCsOyQ5dtkWfog8QKVL81oBKjRHTt/swUHIvGDsgQ/VRXPkqPbvno6jg6z5YiLDy1Ad
         XX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428735; x=1769033535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eYVrDxAFik9ZlMUAZjSOaSsJUzl9iKpSUm/XmRoX4Ic=;
        b=MXjGLxFUDiv2jLM7HdA2xaQ0iqEk6JTfOPUOZCmQ7ZEgyFlrs1bda3pdB30ZiPbcI3
         Tl8vpVo4ba1KmjzNog+7eW9OLZ0Xmk3xucx+PGw3F2Z3QEeoOm1iGvlwyYykfAZJM1vo
         nptWIBnJ+kXygs6j/0LvbdxaRhI0XON9xPRJaARaCG45MLg4Ztc69aJXNoIMghHt3KHG
         MDDzprL2MlfBwSn8pUzl6wdi2jfwbskO5z+ZsKGraq/7G4fLro6/5w3H3eB8RMtxdATT
         Y5C4EnF8WHTZGfe4CgZCyDcLavSxtbsJynC3SpKCUfWLrySh4dEshgDB4/gq3BxU9b99
         KV/w==
X-Gm-Message-State: AOJu0YxYk+D2gRmFiOhGQUPU73wifDgHcYSTSFPNDmEyM2nVtlMs22+x
	48DQL32hnNeh79lAZus5PNpaAcW9NgZhjJIzkgfYsZcLOobGcxx/iP/1ALnmCbMRdA==
X-Gm-Gg: AY/fxX6nyaMoVphsnPPvhc1yD4xkcSEitGz57yukIhwjxs/+H+gq69g4/K/sXhNab9x
	6eUoojUy/8EgbcLgipuDv7IyaIxTz6bEJysahjBlTN328ofNTN8EMq6anczGo/VF0Ja8OyvhjP6
	Z6FDYIb5toH2tspWRiwpymQziVPoEfFGkyTN2X+hMcJI+v1Ne12eZjAjDoUKPwB3DcjhgKTdoDb
	MsvGfb7N+mLLGBV8BFtcuEVlRu7JaEELpGnL//Sz69stO0bp+B3xJBUUcomlGIel1SwvQXMly3P
	ALjxpqyZqKPZiZUNnmYxYbivAnhoilcim5kyhASIYPAmXwocsVqcBorwpOAi7+VsXPpNZN2N8CC
	O7LMOabQqLx0VBhZJjrCvuDUYZcqwUSUG8Vnr7V72AqbOmgfjj1mUFZM3f8ZwLDaNXRe8c3qSlM
	pGV753skeS2wgKDsda5aBBk47vCIr7ipl0WmAy5KVoPJ/THRzDEg/7UEiNRyHheKeGd/ND+cDoU
	2mi44u6rYphwP7J8w==
X-Received: by 2002:a05:600c:3ba4:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-47ee334f7b8mr53242725e9.22.1768428734465;
        Wed, 14 Jan 2026 14:12:14 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:13 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 1/5] hwmon: it87: describe per-chip temperature resources
Date: Wed, 14 Jan 2026 23:12:06 +0100
Message-ID: <20260114221210.98071-2-yahoo@perenite.com>
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

Add per-chip temp limit/offset/map counts and wire the driver
to use them.

This keeps existing chips on the previous defaults while allowing newer
chips to advertise larger resources.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 144 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 109 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..b50ba1cd2362 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -280,7 +280,6 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define NUM_VIN_LIMIT		8
 #define NUM_TEMP		6
 #define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
-#define NUM_TEMP_LIMIT		3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -290,6 +289,9 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	u8 num_temp_limit;
+	u8 num_temp_offset;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 	u8 smbus_bitmap;	/* SMBus enable bits in extra config register */
@@ -300,7 +302,6 @@ struct it87_devices {
 #define FEAT_NEWER_AUTOPWM	BIT(1)
 #define FEAT_OLD_AUTOPWM	BIT(2)
 #define FEAT_16BIT_FANS		BIT(3)
-#define FEAT_TEMP_OFFSET	BIT(4)
 #define FEAT_TEMP_PECI		BIT(5)
 #define FEAT_TEMP_OLD_PECI	BIT(6)
 #define FEAT_FAN16_CONFIG	BIT(7)	/* Need to enable 16-bit fans */
@@ -333,43 +334,61 @@ static const struct it87_devices it87_devices[] = {
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
@@ -377,18 +396,24 @@ static const struct it87_devices it87_devices[] = {
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
@@ -396,73 +421,97 @@ static const struct it87_devices it87_devices[] = {
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
@@ -470,45 +519,60 @@ static const struct it87_devices it87_devices[] = {
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
@@ -519,7 +583,6 @@ static const struct it87_devices it87_devices[] = {
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
-#define has_temp_offset(data)	((data)->features & FEAT_TEMP_OFFSET)
 #define has_temp_peci(data, nr)	(((data)->features & FEAT_TEMP_PECI) && \
 				 ((data)->peci_mask & BIT(nr)))
 #define has_temp_old_peci(data, nr) \
@@ -578,6 +641,9 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	u8 num_temp_limit;
+	u8 num_temp_offset;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 
@@ -926,12 +992,12 @@ static struct it87_data *it87_update_device(struct device *dev)
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
@@ -1679,16 +1745,18 @@ static ssize_t show_pwm_temp_map(struct device *dev,
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
@@ -1700,6 +1768,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
+	u8 num_map = data->num_temp_map;
 	long val;
 	int err;
 	u8 reg;
@@ -1707,8 +1776,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	if (nr >= 3)
-		val -= 3;
+	if (nr >= num_map)
+		val -= num_map;
 
 	switch (val) {
 	case BIT(0):
@@ -2362,7 +2431,7 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 		return attr->mode;
 	}
 
-	if (a == 5 && !has_temp_offset(data))
+	if (a == 5 && i >= data->num_temp_offset)
 		return 0;
 
 	if (a == 6 && !data->has_beep)
@@ -3206,7 +3275,7 @@ static void it87_check_limit_regs(struct it87_data *data)
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
 	}
-	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
+	for (i = 0; i < data->num_temp_limit; i++) {
 		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
 		if (reg == 0xff)
 			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
@@ -3399,6 +3468,7 @@ static int it87_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct it87_sio_data *sio_data = dev_get_platdata(dev);
+	const struct it87_devices *chip;
 	int enable_pwm_interface;
 	struct device *hwmon_dev;
 	int err;
@@ -3421,9 +3491,13 @@ static int it87_probe(struct platform_device *pdev)
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
2.50.1 (Apple Git-155)

