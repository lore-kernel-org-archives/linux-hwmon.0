Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB5741CB4D
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037251; cv=none; b=KnCKIe8+d0lSisAfpfblmVWlSuDUf2zf/itQRHq5F4jl8n/zwI8AEfDtE0fyl558NmyP8zVLa7E9RcAhkDuwHwzaRLoPWD6xDyCBuMYMCP4zmgbz6sNf5EAKmNqIRnFDCChNcpvBEADDx/QfXWVv8blcz4xAsAInylAyjDjd1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037251; c=relaxed/simple;
	bh=Tqm4gVUO7Txbnu7ShWpX4Pu6AIQqSZWqGiUG2QHtv8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6jM232GIZnxlXY7v2K+maT3Zg1tto/9LNdGxRTFt1b54Md9eT0InqLrdHGefFGsDkI1JnrSqr6KJwoOHm2d8Mfxs2j1tkkQxU11mJjsv44WksaUyKjhhU+RLkDyrsLbqdrEAQoQWavyP1Jj4piz6RA0e4GwUEdWEe+P4rF11xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSMYTeHV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSMYTeHV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c253425b253so351175866b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788037247; x=1788642047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvGWII3vJzcnh2jAVZnYyzchirdsUaUxfvT1QWn/NfI=;
        b=aSMYTeHV5E4hqiuck78ErFyrqapWcjrwWJ7CSzlqyBRwKQAeQ40a4/flNDBDDH3lXd
         uEB84z1jTeHRm97gLjJ3BnxpkUbiJL5rf+SifHCqhE+qpBenynp9qF5HG0RuZ64zoacW
         rd6ioDb8sHR+K9u5rEgxUKJXobM9CDQ8ncklt1pW86toP3H96B2omDuUYVGMKV8OuWMB
         Xo2Cno4ZMxNpZF+LOb2DLEnEIsD/4okIaNQvGLc+yXCYY8u8dlxHRXhGDwdbKAUuEM3H
         Glzt3FED8QEgqhcrPjGMLPeskUYBILDF7RtzHrsaHXx6Rh3zA3h6+Q79UWDmXeKwoHCl
         M++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788037247; x=1788642047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvGWII3vJzcnh2jAVZnYyzchirdsUaUxfvT1QWn/NfI=;
        b=ZuMiJcv+9P+936jq6fi6oY0AlM3xnWGymqI8Wp3wteVuXaPqMtaJEXx74CCHdcUJHD
         mHfM4r+Eoj/oxeGTRbhvEWn2zpnwxi70h5ENdPc9Hs04ggiyLJAvFFlSSDfsw/1KKt28
         uur3ApCWd3m7Hy+/UhRzHz0E/oRcLtMsVb736p53DAaQtikttQ1rAzAi7OZcncbmwqEf
         OcmLa2u7w/9lg2fOqQ8Ctiu+m4e6yVxA3GaGMzLPISrA3ami6J8tD0/UbbEx4lXSBhkz
         V39udgeg5on8jKirtCAMm6paCP6ucuQ1CAEAXnxg0ESEQoCECj1dfNUmwhkr+bbwWt0W
         ySsw==
X-Gm-Message-State: AFuF++kIuDZ9nijQCPileilfjMxISdXnkpTAlywbE/q8yryvcOIATett
	Q/bbo+lyChQZg5E7jLvHZXiBacZLWpJbMDLJBR2g18yHievCxywHkBd6
X-Gm-Gg: AR+sD11NUvhEA1ZsOB9fweU3Ra/L/W3y3ikD3+n5YJQo7+LRp7tdXnJqnWShyOpjTWN
	u3ORG2M74qx3+zMb4vr8ZCArQtBo0ieCDh5pcj0IDlY9EjKgmD50DyQuwgZaCfz/aW+7Ozog5jw
	zXsfZcILIBMqMR/fzJDL6Lc568hjNXGkl2PnKHuJfcSTgMl6qje1rI2M0sWW1H+66pBs8LSxYPg
	3AM1ioTwZ/k/LT372j6x6hAr+6EohWPSaHSn8RKjxr9Wz0N5NA5S/ya5MpJX35Vyt/sKeqDd651
	KIpmxC0XHrtr4RxUAXXIyWNVjhdnLSV+Sk9FtjPW3y2bT8Yhed4ktsswcesHwYeVMoep3jOotCQ
	o93vsxEbs4egmzkjSxqlZjJYj5YghyfvQlqADdnIIYKy4dOZNsd6FBZ3tcEvpDhEcwPnl19BxhV
	hvbf1j6GYZ76PozYlZFoPDCdp7YfwagnWazQ+B+CPE9DkA48a8bNVlmZ6nOzCLPkRWbOmR4LJcV
	IG3nI2RjBPHOPM=
X-Received: by 2002:a17:907:cd0e:b0:c25:2fb9:b897 with SMTP id a640c23a62f3a-c2557164d7fmr1042184466b.18.1788037246890;
        Sat, 29 Aug 2026 14:00:46 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee288a4sm234934266b.16.2026.08.29.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 14:00:46 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v6 2/3] hwmon: it87: prepare for extended PWM temp maps
Date: Sat, 29 Aug 2026 23:00:35 +0200
Message-ID: <20260829210036.61136-3-jerome.tollet@gmail.com>
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

Introduce helper logic for PWM-to-temperature mappings so newer register
layouts can be supported while retaining the legacy two groups of three
temperature sources.

Honor the four global temperature sources on IT8603E and IT8622E instead
of applying the legacy grouping to those chips. Use per-chip masks and
shifts for newer extended mappings.

Newer controllers keep the duty cycle in a separate register, so write
their temperature mapping in both manual and automatic mode. This keeps
the selected mapping across cache refreshes and mode changes. Continue to
defer mapping writes on older controllers while they are in manual mode.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/hwmon/it87.c | 221 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 167 insertions(+), 54 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 1af815b5d..980e425fc 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -252,6 +252,7 @@ static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59, 0x5a, 0x90, 0x91 };
 #define IT87_REG_FAN_MAIN_CTRL 0x13
 #define IT87_REG_FAN_CTL       0x14
 static const u8 IT87_REG_PWM[]         = { 0x15, 0x16, 0x17, 0x7f, 0xa7, 0xaf };
+static const u8 IT87_REG_PWM_8665[]    = { 0x15, 0x16, 0x17, 0x1e, 0x1f, 0x92 };
 static const u8 IT87_REG_PWM_DUTY[]    = { 0x63, 0x6b, 0x73, 0x7b, 0xa3, 0xab };
 
 static const u8 IT87_REG_VIN[]	= { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
@@ -281,6 +282,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define NUM_VIN			ARRAY_SIZE(IT87_REG_VIN)
 #define NUM_VIN_LIMIT		8
 #define NUM_TEMP		6
+#define IT87_PWM_OLD_NUM_TEMP	3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -290,6 +292,7 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_limit;
 	u8 num_temp_offset;
 	u8 num_temp_map;
@@ -328,6 +331,7 @@ struct it87_devices {
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
+#define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -335,6 +339,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 0,
 		.num_temp_map = 3,
@@ -344,6 +349,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 0,
 		.num_temp_map = 3,
@@ -354,6 +360,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -364,6 +371,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -375,6 +383,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -387,6 +396,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -400,6 +410,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 6,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -412,6 +423,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
 		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -428,6 +440,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
 				/* three fans, always 16 bit (guesswork) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -443,6 +456,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
 				/* three fans, always 16 bit (datasheet) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -454,6 +468,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -465,6 +480,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -476,6 +492,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -487,6 +504,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -498,6 +516,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -510,6 +529,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -522,9 +542,10 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
-		.num_temp_map = 3,
+		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
 	[it8620] = {
@@ -534,6 +555,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -546,9 +568,10 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
+		.reg_pwm = IT87_REG_PWM_8665,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
-		.num_temp_map = 3,
+		.num_temp_map = 4,
 		.peci_mask = 0x0f,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
@@ -559,6 +582,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 6,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -571,6 +595,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_SIX_PWM | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -583,6 +608,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -625,6 +651,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
+#define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -654,6 +681,7 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_limit;
 	u8 num_temp_offset;
 	u8 num_temp_map;
@@ -703,7 +731,9 @@ struct it87_data {
 	u8 has_pwm;		/* Bitfield, pwm control enabled */
 	u8 pwm_ctrl[NUM_PWM];	/* Register value */
 	u8 pwm_duty[NUM_PWM];	/* Manual PWM value set by user */
-	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping (bits 1-0) */
+	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping */
+	u8 pwm_temp_map_mask;
+	u8 pwm_temp_map_shift;
 
 	/* Automatic fan speed control registers */
 	u8 auto_pwm[NUM_AUTO_PWM][4];	/* [nr][3] is hard-coded */
@@ -785,6 +815,77 @@ static int pwm_from_reg(const struct it87_data *data, u8 reg)
 		return (reg & 0x7f) << 1;
 }
 
+static inline u8 pwm_temp_map_get(const struct it87_data *data, u8 ctrl)
+{
+	return (ctrl >> data->pwm_temp_map_shift) &
+		data->pwm_temp_map_mask;
+}
+
+static inline u8 pwm_temp_map_set(const struct it87_data *data, u8 ctrl,
+				  u8 map)
+{
+	ctrl &= ~(data->pwm_temp_map_mask << data->pwm_temp_map_shift);
+	return ctrl | ((map & data->pwm_temp_map_mask)
+		       << data->pwm_temp_map_shift);
+}
+
+static inline u8 pwm_num_temp_map(const struct it87_data *data)
+{
+	return data->num_temp_map;
+}
+
+static inline bool uses_global_temp_map(const struct it87_data *data)
+{
+	return has_new_tempmap(data) ||
+		pwm_num_temp_map(data) != IT87_PWM_OLD_NUM_TEMP;
+}
+
+static unsigned int pwm_temp_channel(const struct it87_data *data,
+				     int nr, u8 map)
+{
+	if (uses_global_temp_map(data)) {
+		u8 num = pwm_num_temp_map(data);
+
+		if (map >= num)
+			map = 0;
+		return map;
+	}
+
+	if (map >= IT87_PWM_OLD_NUM_TEMP)
+		map = 0;
+
+	if (nr >= IT87_PWM_OLD_NUM_TEMP)
+		map += IT87_PWM_OLD_NUM_TEMP;
+
+	return map;
+}
+
+static int pwm_temp_map_from_channel(const struct it87_data *data, int nr,
+				     unsigned int channel, u8 *map)
+{
+	if (uses_global_temp_map(data)) {
+		u8 num = pwm_num_temp_map(data);
+
+		if (channel >= num)
+			return -EINVAL;
+		*map = channel;
+		return 0;
+	}
+
+	if (nr >= IT87_PWM_OLD_NUM_TEMP) {
+		if (channel < IT87_PWM_OLD_NUM_TEMP ||
+		    channel >= 2 * IT87_PWM_OLD_NUM_TEMP)
+			return -EINVAL;
+		channel -= IT87_PWM_OLD_NUM_TEMP;
+	} else {
+		if (channel >= IT87_PWM_OLD_NUM_TEMP)
+			return -EINVAL;
+	}
+
+	*map = channel;
+	return 0;
+}
+
 static int DIV_TO_REG(int val)
 {
 	int answer = 0;
@@ -796,6 +897,11 @@ static int DIV_TO_REG(int val)
 
 #define DIV_FROM_REG(val) BIT(val)
 
+static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
+{
+	return data->reg_pwm[nr];
+}
+
 /*
  * PWM base frequencies. The frequency has to be divided by either 128 or 256,
  * depending on the chip type, to calculate the actual PWM frequency.
@@ -876,16 +982,23 @@ static void it87_write_value(struct it87_data *data, u8 reg, u8 value)
 
 static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
 {
-	data->pwm_ctrl[nr] = it87_read_value(data, IT87_REG_PWM[nr]);
+	data->pwm_ctrl[nr] = it87_read_value(data, it87_reg_pwm(data, nr));
 	if (has_newer_autopwm(data)) {
-		data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+		data->pwm_temp_map[nr] =
+			pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (uses_global_temp_map(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
 		data->pwm_duty[nr] = it87_read_value(data,
 						     IT87_REG_PWM_DUTY[nr]);
-	} else {
-		if (data->pwm_ctrl[nr] & 0x80)	/* Automatic mode */
-			data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
-		else				/* Manual mode */
-			data->pwm_duty[nr] = data->pwm_ctrl[nr] & 0x7f;
+	} else if (data->pwm_ctrl[nr] & 0x80) {	/* Automatic mode */
+		data->pwm_temp_map[nr] =
+			pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (uses_global_temp_map(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
+	} else {				/* Manual mode */
+		data->pwm_duty[nr] = data->pwm_ctrl[nr] & 0x7f;
 	}
 
 	if (has_old_autopwm(data)) {
@@ -1635,27 +1748,30 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 					 data->pwm_duty[nr]);
 			/* and set manual mode */
 			if (has_newer_autopwm(data)) {
-				ctrl = (data->pwm_ctrl[nr] & 0x7c) |
-					data->pwm_temp_map[nr];
+				ctrl = pwm_temp_map_set(data,
+							data->pwm_ctrl[nr] &
+							~0x80,
+							data->pwm_temp_map[nr]);
 			} else {
 				ctrl = data->pwm_duty[nr];
 			}
 			data->pwm_ctrl[nr] = ctrl;
-			it87_write_value(data, IT87_REG_PWM[nr], ctrl);
+			it87_write_value(data, it87_reg_pwm(data, nr), ctrl);
 		}
 	} else {
 		u8 ctrl;
 
 		if (has_newer_autopwm(data)) {
-			ctrl = (data->pwm_ctrl[nr] & 0x7c) |
-				data->pwm_temp_map[nr];
+			ctrl = pwm_temp_map_set(data,
+						data->pwm_ctrl[nr] & ~0x80,
+						data->pwm_temp_map[nr]);
 			if (val != 1)
 				ctrl |= 0x80;
 		} else {
 			ctrl = (val == 1 ? data->pwm_duty[nr] : 0x80);
 		}
 		data->pwm_ctrl[nr] = ctrl;
-		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
+		it87_write_value(data, it87_reg_pwm(data, nr), ctrl);
 
 		if (has_fanctl_onoff(data) && nr < 3) {
 			/* set SmartGuardian mode */
@@ -1706,7 +1822,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 		 */
 		if (!(data->pwm_ctrl[nr] & 0x80)) {
 			data->pwm_ctrl[nr] = data->pwm_duty[nr];
-			it87_write_value(data, IT87_REG_PWM[nr],
+			it87_write_value(data, it87_reg_pwm(data, nr),
 					 data->pwm_ctrl[nr]);
 		}
 	}
@@ -1761,20 +1877,14 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
-	u8 num_map;
-	int map;
+	unsigned int channel;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	num_map = data->num_temp_map;
-	map = data->pwm_temp_map[nr];
-	if (map >= num_map)
-		map = 0;	/* Should never happen */
-	if (nr >= num_map)	/* pwm channels 3..6 map to temp4..6 */
-		map += num_map;
+	channel = pwm_temp_channel(data, nr, data->pwm_temp_map[nr]);
 
-	return sprintf(buf, "%d\n", (int)BIT(map));
+	return sprintf(buf, "%d\n", (int)BIT(channel));
 }
 
 static ssize_t set_pwm_temp_map(struct device *dev,
@@ -1784,45 +1894,35 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
-	u8 num_map = data->num_temp_map;
 	long val;
 	int err;
-	u8 reg;
+	unsigned int channel;
+	u8 map;
 
-	if (kstrtol(buf, 10, &val) < 0)
+	if (kstrtol(buf, 10, &val) < 0 || val <= 0 || !is_power_of_2(val))
 		return -EINVAL;
 
-	if (nr >= num_map)
-		val -= num_map;
-
-	switch (val) {
-	case BIT(0):
-		reg = 0x00;
-		break;
-	case BIT(1):
-		reg = 0x01;
-		break;
-	case BIT(2):
-		reg = 0x02;
-		break;
-	default:
+	channel = __ffs(val);
+	if (pwm_temp_map_from_channel(data, nr, channel, &map))
 		return -EINVAL;
-	}
 
 	err = it87_lock(data);
 	if (err)
 		return err;
 
 	it87_update_pwm_ctrl(data, nr);
-	data->pwm_temp_map[nr] = reg;
+	data->pwm_temp_map[nr] = map;
 	/*
-	 * If we are in automatic mode, write the temp mapping immediately;
-	 * otherwise, just store it for later use.
+	 * Newer controllers keep the duty cycle in a separate register, so
+	 * their temperature mapping can be updated in any mode. On older
+	 * controllers, defer the update until automatic mode is enabled.
 	 */
-	if (data->pwm_ctrl[nr] & 0x80) {
-		data->pwm_ctrl[nr] = (data->pwm_ctrl[nr] & 0xfc) |
-						data->pwm_temp_map[nr];
-		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
+	if (has_newer_autopwm(data) || (data->pwm_ctrl[nr] & 0x80)) {
+		data->pwm_ctrl[nr] = pwm_temp_map_set(data,
+						      data->pwm_ctrl[nr],
+						      data->pwm_temp_map[nr]);
+		it87_write_value(data, it87_reg_pwm(data, nr),
+				 data->pwm_ctrl[nr]);
 	}
 	it87_unlock(data);
 	return count;
@@ -3421,7 +3521,10 @@ static void it87_init_device(struct platform_device *pdev)
 	 * manual duty cycle.
 	 */
 	for (i = 0; i < NUM_AUTO_PWM; i++) {
-		data->pwm_temp_map[i] = i;
+		if (uses_global_temp_map(data))
+			data->pwm_temp_map[i] = 0;
+		else
+			data->pwm_temp_map[i] = i % IT87_PWM_OLD_NUM_TEMP;
 		data->pwm_duty[i] = 0x7f;	/* Full speed */
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
 	}
@@ -3493,7 +3596,8 @@ static int it87_check_pwm(struct device *dev)
 
 			for (i = 0; i < ARRAY_SIZE(pwm); i++)
 				pwm[i] = it87_read_value(data,
-							 IT87_REG_PWM[i]);
+							 it87_reg_pwm(data,
+								      i));
 
 			/*
 			 * If any fan is in automatic pwm mode, the polarity
@@ -3508,7 +3612,8 @@ static int it87_check_pwm(struct device *dev)
 						 tmp | 0x87);
 				for (i = 0; i < 3; i++)
 					it87_write_value(data,
-							 IT87_REG_PWM[i],
+							 it87_reg_pwm(data,
+								      i),
 							 0x7f & ~pwm[i]);
 				return 1;
 			}
@@ -3557,11 +3662,19 @@ static int it87_probe(struct platform_device *pdev)
 	data->ec_special_config = sio_data->ec_special_config;
 	chip = &it87_devices[sio_data->type];
 	data->features = chip->features;
+	data->reg_pwm = chip->reg_pwm;
 	data->peci_mask = chip->peci_mask;
 	data->old_peci_mask = chip->old_peci_mask;
 	data->num_temp_limit = chip->num_temp_limit;
 	data->num_temp_offset = chip->num_temp_offset;
 	data->num_temp_map = chip->num_temp_map;
+	if (has_new_tempmap(data)) {
+		data->pwm_temp_map_mask = 0x07;
+		data->pwm_temp_map_shift = 3;
+	} else {
+		data->pwm_temp_map_mask = 0x03;
+		data->pwm_temp_map_shift = 0;
+	}
 	/*
 	 * IT8705F Datasheet 0.4.1, 3h == Version G.
 	 * IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h == Version J.
-- 
2.55.0

