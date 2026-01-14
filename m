Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D0D3B52FD
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428750; cv=none; b=L/jr8rzjnGQT30+xjmmkWO21hVLw74l7N3jkwhnbsuXuMmibWkmAZiYbM0IxUUs5UliIe2UCbzuyMUWtIPuepGR0cYuw2RySfSvkIY0NwmUMax0TE7XWDvXR+qF1MMaruoJ+wEK2zzj25IKpvFlrvpcu5PdC06clHIsGhx0vTik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428750; c=relaxed/simple;
	bh=srQNe1bdxPtarkPHtN+SaizPLzfJBPNYBGeND/TdZ3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GstknZxzhxs7Z2QIwhM22PLGS3kk+oh4m9TWMe70YGSmGWf5ujyvrpJRS24Ecg0AmC6lgtW/oJ/5UJWHaoeCzqDtqD36eAj6ohjNJ1bTkdMgO8K7bygGg8b2Rrok7gBha0u8c4lwHBCexrdaVQGlOaKc6raDjyY/gbpzaMuBiiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=u6Bo2sCh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="u6Bo2sCh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so3556815e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768428736; x=1769033536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9n/8zfCD6P7G2M5f9LemgItBkNY+iI9RuUXt9g5qnc=;
        b=u6Bo2sChlcDG1mezipCfYiUHxUghIfHERYt/pEWX4a6QmpNdv7bLz3PnWZcxSHsAl/
         mPPH9qXt3MoayNBbPB8ISz5zu8GZLX/CbsI8JvECp6aoheZxVlHPeGmCOwrE90DeVz2c
         2p3LFA/UEN6/c5XOujzazNRJiyOUTFuAR/4GPYmjczA2WJDSyiedhbi+alXZt7Xb2UVV
         fgdGY2dVmYa82sGKtHWKFynDhvxFP3DaN6Ri6bRy1D9bdKqzXyevZh8CCQWc+zFcph+U
         KZZCh2EfNWDmbTwkrQJP7Y2T5B8CKb3ogTQQyuJdDPywTQB0EMI3mQBh2pyMflviykdn
         odkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428736; x=1769033536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9n/8zfCD6P7G2M5f9LemgItBkNY+iI9RuUXt9g5qnc=;
        b=hWW7KrinCbxHhm8Fc+cNfk6mhRf3PP29cZcWIrDX/9RQ+q/AEucM4E8XAJcPuD3ejT
         XmAubqOo3goB5QhYEYN+hU9qt097sadC8EXLnQrBVDR1a+bArtEUsVzwiI03cY+vT9ZV
         OulY6CKykyPsmuirr0rXCAb0ydF9ALZvUoDfHXBboaf9BB5oOUk2rQxv6iHmP1aHrR3T
         XhyXbKDNDf1mZlNqBvfCMsxmi+jFhiUy2MaVL9ayWj5YMXN8IfFR0Pf9Ol53zIfbfOLD
         8TUsujHuOa7sAn1stlVqe7BBkCbwrWyYzH2nLoUYmKlqS7jzFvSUGbOn+RlYmBBIUyMW
         527Q==
X-Gm-Message-State: AOJu0YzPuFrSMmm0u9x/yzU9y6ZbZg4zJXkJuR6FEPsgQWjWoYkb5Ivo
	NnIkKd5Vgg9mJ4M+AieNzjapDPUlLxx9L+ScZtbv090aGRJEf1eZQ7UNbIHCWo6o00pK34485n6
	g0HQ=
X-Gm-Gg: AY/fxX55cW5d+Ag3gkAT/Bb0s5raS2Z+I2J+jNTwICfG1YNow8jcNW9aNK1o0PeunQR
	oFjUl8GjKNvFW75j1ZiqrveW6JsV0QdVU4OpudsYcpJ3EwnDwi7WGmXCbi60Uh7cYyPiw09jIiE
	1qcMIAy2EChI/c1c7HAVJMLlJ3ePiH5HhZ8FmMNeM02mzhvXHiesVDw/4hduREm18KBUdTbOs5h
	V1byOlCz/S6T+ouNc+Tx9f4hPp+OAL0eZaL0LG95/ZzdYKdbbe0gvAq05E8X6zqjsZyIUEQOCQB
	YcWFSUNESz5QG5VvI7neHVegjAUFL31WjPos/CrJi1R5ryI8ulaK4/AdqxHa1aZ0VjXMainIqOQ
	BK/+SUNj/h2OpcrwO9KojliUw906xt8xJ/3ZmUNtIS7fnLfArAT73GCmvnyXrJ0uIcHjnYEILE/
	2M8J4nsr6fVy95/UeTyChqK0ymxbzrZtS+3N8q1kqnLEci8UIEGR4HkLZuuzGLAPSFjAt9OqkrA
	v7p0oUfg/VBtlekdw==
X-Received: by 2002:a05:600c:1c15:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-47ee339e454mr43477545e9.37.1768428735785;
        Wed, 14 Jan 2026 14:12:15 -0800 (PST)
Received: from localhost.localdomain (217-128-226-200.ftth.fr.orangecustomers.net. [217.128.226.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f941a670dsm3098195e9.5.2026.01.14.14.12.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 14:12:15 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v4 2/5] hwmon: it87: prepare for extended PWM temp maps
Date: Wed, 14 Jan 2026 23:12:07 +0100
Message-ID: <20260114221210.98071-3-yahoo@perenite.com>
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

Introduce helper logic for PWM-to-temperature mappings so newer
register layouts can be supported without affecting legacy chips.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 198 +++++++++++++++++++++++++++++++++----------
 1 file changed, 153 insertions(+), 45 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index b50ba1cd2362..2d4264d05bc2 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -250,6 +250,7 @@ static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59 };
 #define IT87_REG_FAN_MAIN_CTRL 0x13
 #define IT87_REG_FAN_CTL       0x14
 static const u8 IT87_REG_PWM[]         = { 0x15, 0x16, 0x17, 0x7f, 0xa7, 0xaf };
+static const u8 IT87_REG_PWM_8665[]    = { 0x15, 0x16, 0x17, 0x1e, 0x1f, 0x92 };
 static const u8 IT87_REG_PWM_DUTY[]    = { 0x63, 0x6b, 0x73, 0x7b, 0xa3, 0xab };
 
 static const u8 IT87_REG_VIN[]	= { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
@@ -280,6 +281,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define NUM_VIN_LIMIT		8
 #define NUM_TEMP		6
 #define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
+#define IT87_PWM_OLD_NUM_TEMP	3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -289,6 +291,7 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_limit;
 	u8 num_temp_offset;
 	u8 num_temp_map;
@@ -327,6 +330,7 @@ struct it87_devices {
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
+#define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -334,6 +338,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 0,
 		.num_temp_map = 3,
@@ -343,6 +348,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 0,
 		.num_temp_map = 3,
@@ -353,6 +359,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -363,6 +370,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -374,6 +382,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -386,6 +395,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -399,6 +409,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 6,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -411,6 +422,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
 		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -427,6 +439,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
 				/* three fans, always 16 bit (guesswork) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -442,6 +455,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
 				/* three fans, always 16 bit (datasheet) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -453,6 +467,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -464,6 +479,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -475,6 +491,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -486,6 +503,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -497,6 +515,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -509,6 +528,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -521,6 +541,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 4,
@@ -533,6 +554,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -545,6 +567,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
+		.reg_pwm = IT87_REG_PWM_8665,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 4,
@@ -558,6 +581,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 6,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -570,6 +594,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -612,6 +637,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
+#define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -641,6 +667,7 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_limit;
 	u8 num_temp_offset;
 	u8 num_temp_map;
@@ -690,7 +717,9 @@ struct it87_data {
 	u8 has_pwm;		/* Bitfield, pwm control enabled */
 	u8 pwm_ctrl[NUM_PWM];	/* Register value */
 	u8 pwm_duty[NUM_PWM];	/* Manual PWM value set by user */
-	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping (bits 1-0) */
+	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping */
+	u8 pwm_temp_map_mask;
+	u8 pwm_temp_map_shift;
 
 	/* Automatic fan speed control registers */
 	u8 auto_pwm[NUM_AUTO_PWM][4];	/* [nr][3] is hard-coded */
@@ -772,6 +801,71 @@ static int pwm_from_reg(const struct it87_data *data, u8 reg)
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
+static unsigned int pwm_temp_channel(const struct it87_data *data,
+				     int nr, u8 map)
+{
+	if (has_new_tempmap(data)) {
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
+	if (has_new_tempmap(data)) {
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
@@ -783,6 +877,11 @@ static int DIV_TO_REG(int val)
 
 #define DIV_FROM_REG(val) BIT(val)
 
+static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
+{
+	return data->reg_pwm[nr];
+}
+
 /*
  * PWM base frequencies. The frequency has to be divided by either 128 or 256,
  * depending on the chip type, to calculate the actual PWM frequency.
@@ -863,14 +962,22 @@ static void it87_write_value(struct it87_data *data, u8 reg, u8 value)
 
 static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
 {
-	data->pwm_ctrl[nr] = it87_read_value(data, IT87_REG_PWM[nr]);
+	data->pwm_ctrl[nr] = it87_read_value(data, it87_reg_pwm(data, nr));
 	if (has_newer_autopwm(data)) {
-		data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+		data->pwm_temp_map[nr] =
+			pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (has_new_tempmap(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
 		data->pwm_duty[nr] = it87_read_value(data,
 						     IT87_REG_PWM_DUTY[nr]);
 	} else {
 		if (data->pwm_ctrl[nr] & 0x80)	/* Automatic mode */
-			data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+			data->pwm_temp_map[nr] =
+				pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (has_new_tempmap(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
 		else				/* Manual mode */
 			data->pwm_duty[nr] = data->pwm_ctrl[nr] & 0x7f;
 	}
@@ -1600,6 +1707,8 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	it87_update_pwm_ctrl(data, nr);
+
 	if (val == 0) {
 		if (nr < 3 && has_fanctl_onoff(data)) {
 			int tmp;
@@ -1619,27 +1728,30 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
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
@@ -1690,7 +1802,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 		 */
 		if (!(data->pwm_ctrl[nr] & 0x80)) {
 			data->pwm_ctrl[nr] = data->pwm_duty[nr];
-			it87_write_value(data, IT87_REG_PWM[nr],
+			it87_write_value(data, it87_reg_pwm(data, nr),
 					 data->pwm_ctrl[nr]);
 		}
 	}
@@ -1745,20 +1857,14 @@ static ssize_t show_pwm_temp_map(struct device *dev,
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
@@ -1768,45 +1874,34 @@ static ssize_t set_pwm_temp_map(struct device *dev,
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
 	 * If we are in automatic mode, write the temp mapping immediately;
 	 * otherwise, just store it for later use.
 	 */
 	if (data->pwm_ctrl[nr] & 0x80) {
-		data->pwm_ctrl[nr] = (data->pwm_ctrl[nr] & 0xfc) |
-						data->pwm_temp_map[nr];
-		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
+		data->pwm_ctrl[nr] = pwm_temp_map_set(data,
+						      data->pwm_ctrl[nr],
+						      data->pwm_temp_map[nr]);
+		it87_write_value(data, it87_reg_pwm(data, nr),
+				 data->pwm_ctrl[nr]);
 	}
 	it87_unlock(data);
 	return count;
@@ -3357,7 +3452,10 @@ static void it87_init_device(struct platform_device *pdev)
 	 * manual duty cycle.
 	 */
 	for (i = 0; i < NUM_AUTO_PWM; i++) {
-		data->pwm_temp_map[i] = i;
+		if (has_new_tempmap(data))
+			data->pwm_temp_map[i] = 0;
+		else
+			data->pwm_temp_map[i] = i % IT87_PWM_OLD_NUM_TEMP;
 		data->pwm_duty[i] = 0x7f;	/* Full speed */
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
 	}
@@ -3429,7 +3527,8 @@ static int it87_check_pwm(struct device *dev)
 
 			for (i = 0; i < ARRAY_SIZE(pwm); i++)
 				pwm[i] = it87_read_value(data,
-							 IT87_REG_PWM[i]);
+							 it87_reg_pwm(data,
+								      i));
 
 			/*
 			 * If any fan is in automatic pwm mode, the polarity
@@ -3444,7 +3543,8 @@ static int it87_check_pwm(struct device *dev)
 						 tmp | 0x87);
 				for (i = 0; i < 3; i++)
 					it87_write_value(data,
-							 IT87_REG_PWM[i],
+							 it87_reg_pwm(data,
+								      i),
 							 0x7f & ~pwm[i]);
 				return 1;
 			}
@@ -3493,11 +3593,19 @@ static int it87_probe(struct platform_device *pdev)
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
2.50.1 (Apple Git-155)

