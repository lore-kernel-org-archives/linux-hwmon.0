Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E812CDA5
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788040924; cv=none; b=bt5yPRDJJs97obg+YsqV2lZgXGEq/HolN2qfMqZ3B3j72X58DOtL02iyYrgEKGMIrOMS2I2Hzhw8F2AbsRiyUAq+fn9A1xXbeeOpxC8uCbZqNfqmzCESgLNrmMxI33RUQr/Bqh+3wlwF8ngEuadWOo0lzRDUYM8T0be09eBhb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788040924; c=relaxed/simple;
	bh=cuDKfT54GiZncfgjjEZO0K5iaSP0vkULlC6eEEToc38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WnxOt6PEiWOS4AaIgYADXORFklb6uJXIy3L8RRQyiFffNLahB4+BVe0alhPFgaALG3Xjwnnr8P40gYsqKMDj0hE07FiqJkOveJ//ExAFziQFH0ZXmwTgeQ2nEAQF/bRtf4LYz6fZ04u64MVRVEkVnvCMXRjAI90ZBjwcyjLosOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJsykZaK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJsykZaK"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so3465645a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788040920; x=1788645720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idfnghC3eC/sOedy24nUAjvmSzD5gIwAdxxQgzt7IYg=;
        b=PJsykZaKIXPVYcCb081T45ET2e6PJ5guSWjidiL5pTlCfjjfPRAjs2dJS6aZvNNc24
         FYq8rJxxYcmWE0Skk8Y65BQnwl8NO3i5a5dSVPRpYtFwISVSTWJa05N6Jw4jRcDBqp9W
         3dsOL5yIIfsi6R8ak0rLhh2qQ0/pn/bGKXpjtv9LvKJA9hE5EqFY5BgRBO4QUHFsz7gw
         uEYiuY/tEqwyfzmyMrGvJvHFPHXrXL0z+V7S0TZl4gJmoNJyX97lnIZC5VIv1aglK52Z
         Nlsp09PFujzmz9E5mUh5TDoZJqqjCiI5x3FmC60mz/n9ntotuGvkOo0k8O1hQjkHF+My
         wGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788040920; x=1788645720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idfnghC3eC/sOedy24nUAjvmSzD5gIwAdxxQgzt7IYg=;
        b=HnfVrOKn2aTyXRACganlFS8k8wd8R5yjBoqZviB6Sr40id6pJPMP23+mA/y5BJ43Fy
         ja2WoSkmpIgEuX76et3/BDw0gLkwzyOM6jsAPaYOGTbmOsLv8MvOUlGVLE9M5ytmmS0J
         4ssK4mXFYSlMAD0LvMn1CkSCTOGBkUB/ugQR8c/rN8A80qU7AmMNjE1GDSIyXOfgpPxs
         ZAzqK+TJgjs6EbjJXsWyhucV55uo+MbX9+bfTlFKiEQEIp1L4ShZyRiKvZ+hzSBmqIlU
         yoHN/C1zPe6OZQ+q+umu+hJL1wkrxVhX7G6pXOe24J5x4KtvnUOTLNU5AqtcRPnD/sPS
         g7QA==
X-Gm-Message-State: AFuF++kYS9Zbkg7SJoICuo5E9SVnePA6f/M3+iXy4E0Rq518kh0xOYIG
	/lyhsQKpiSeSWrbsCVEXA6ci0l01NwGIgKSE9v/V/flQ2m+QtkiBpAuo
X-Gm-Gg: AR+sD13vSAwvVA53rFkC9yVSrhrtlE+P6qBbIDoo8UH8gBghMTlYcxarf4EzaTPJhrg
	bdJhv07HfrQ5jrWT/sW2BZUXmhT3Sg5PpmR3oxnxjhBSOqyh4xSej41x0s/3igyUobByCx42Cln
	4MptduZT8BKXbtcZtENWq9BImAqNjSzRL+olH1aSzH9VligjXnplqtPDbKRHTx9bw57myBQzn1X
	Vf2fwMhrrrFJJ7JksJOGLIo+E92JijsOkUr2EM5PkET+Z3Lci3Gw2gm3xrc5hFXvIFRguaUgIr5
	5R5/mI/U3s+eUN1TQyCam8Zz7sKm2SjwJNrrUru8oo5nvjs/IeNeUXAvGH/xUFRwptQT6naR+t6
	MSJ/QknEJlaooIvsvZ09EojQ9XITmxe7SbcFEvxOmUUV59i7Odq9YY1cBX2l13zY8TzzS/NNG8Z
	KGpEVz//CN9g9ySsYupP77BVnEpcAcpW+UXWhES0Xy4am6GZBuI51okQNKz/bhX3pMerhi6ah1u
	dzj5V2fxHOtCR1f1/+xasXaqw==
X-Received: by 2002:a17:906:f049:b0:c20:768:af62 with SMTP id a640c23a62f3a-c2557421cd8mr891115266b.22.1788040919969;
        Sat, 29 Aug 2026 15:01:59 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb4c3sm244648766b.48.2026.08.29.15.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:01:58 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v7 2/3] hwmon: it87: prepare for extended PWM temp maps
Date: Sun, 30 Aug 2026 00:01:48 +0200
Message-ID: <7b4f2befc3d214b646c0582e6410f17e78748b4e.1788040385.git.jerome.tollet@gmail.com>
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

Introduce helper logic for PWM-to-temperature mappings so newer
register layouts can be supported while retaining the legacy two groups
of three temperature sources.

Honor the four global temperature sources on IT8603E and IT8622E instead
of applying the legacy grouping to those chips. Use per-chip masks and
shifts for newer extended mappings.

Newer controllers keep the duty cycle in a separate register, so write
their temperature mapping in both manual and automatic mode. This keeps
the selected mapping across cache refreshes and mode changes.

On older controllers, defer mapping writes while in manual mode and apply
the cached mapping when switching to automatic mode.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/hwmon/it87.c | 219 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 166 insertions(+), 53 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5cb1c0029..232cc8586 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -252,6 +252,7 @@ static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59 };
 #define IT87_REG_FAN_MAIN_CTRL 0x13
 #define IT87_REG_FAN_CTL       0x14
 static const u8 IT87_REG_PWM[]         = { 0x15, 0x16, 0x17, 0x7f, 0xa7, 0xaf };
+static const u8 IT87_REG_PWM_8665[]    = { 0x15, 0x16, 0x17, 0x1e, 0x1f, 0x92 };
 static const u8 IT87_REG_PWM_DUTY[]    = { 0x63, 0x6b, 0x73, 0x7b, 0xa3, 0xab };
 
 static const u8 IT87_REG_VIN[]	= { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
@@ -283,6 +284,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define NUM_TEMP		6
 #define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
 #define NUM_TEMP_LIMIT		3
+#define IT87_PWM_OLD_NUM_TEMP	3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -292,6 +294,7 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
@@ -329,6 +332,7 @@ struct it87_devices {
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
+#define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -336,6 +340,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 	},
 	[it8712] = {
@@ -343,6 +348,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 	},
 	[it8716] = {
@@ -351,6 +357,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 	},
 	[it8718] = {
@@ -359,6 +366,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
@@ -368,6 +376,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
@@ -378,6 +387,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x05,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
@@ -389,6 +399,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
@@ -399,6 +410,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
 		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
@@ -413,6 +425,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
 				/* three fans, always 16 bit (guesswork) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
@@ -426,6 +439,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
 				/* three fans, always 16 bit (datasheet) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
@@ -435,6 +449,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
@@ -444,6 +459,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
@@ -453,6 +469,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
@@ -462,6 +479,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
@@ -471,6 +489,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
@@ -481,6 +500,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
@@ -491,7 +511,8 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
-		.num_temp_map = 3,
+		.reg_pwm = IT87_REG_PWM,
+		.num_temp_map = 4,
 		.peci_mask = 0x07,
 	},
 	[it8620] = {
@@ -501,6 +522,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
@@ -511,7 +533,8 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
-		.num_temp_map = 3,
+		.reg_pwm = IT87_REG_PWM_8665,
+		.num_temp_map = 4,
 		.peci_mask = 0x07,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
@@ -522,6 +545,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
@@ -532,6 +556,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_SIX_PWM | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
@@ -542,6 +567,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
@@ -583,6 +609,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
+#define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -612,6 +639,7 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
@@ -659,7 +687,9 @@ struct it87_data {
 	u8 has_pwm;		/* Bitfield, pwm control enabled */
 	u8 pwm_ctrl[NUM_PWM];	/* Register value */
 	u8 pwm_duty[NUM_PWM];	/* Manual PWM value set by user */
-	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping (bits 1-0) */
+	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping */
+	u8 pwm_temp_map_mask;
+	u8 pwm_temp_map_shift;
 
 	/* Automatic fan speed control registers */
 	u8 auto_pwm[NUM_AUTO_PWM][4];	/* [nr][3] is hard-coded */
@@ -741,6 +771,77 @@ static int pwm_from_reg(const struct it87_data *data, u8 reg)
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
@@ -752,6 +853,11 @@ static int DIV_TO_REG(int val)
 
 #define DIV_FROM_REG(val) BIT(val)
 
+static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
+{
+	return data->reg_pwm[nr];
+}
+
 /*
  * PWM base frequencies. The frequency has to be divided by either 128 or 256,
  * depending on the chip type, to calculate the actual PWM frequency.
@@ -832,16 +938,23 @@ static void it87_write_value(struct it87_data *data, u8 reg, u8 value)
 
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
@@ -1591,27 +1704,32 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
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
-			ctrl = (val == 1 ? data->pwm_duty[nr] : 0x80);
+			ctrl = val == 1 ? data->pwm_duty[nr] :
+				pwm_temp_map_set(data, 0x80,
+						 data->pwm_temp_map[nr]);
 		}
 		data->pwm_ctrl[nr] = ctrl;
-		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
+		it87_write_value(data, it87_reg_pwm(data, nr), ctrl);
 
 		if (has_fanctl_onoff(data) && nr < 3) {
 			/* set SmartGuardian mode */
@@ -1662,7 +1780,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 		 */
 		if (!(data->pwm_ctrl[nr] & 0x80)) {
 			data->pwm_ctrl[nr] = data->pwm_duty[nr];
-			it87_write_value(data, IT87_REG_PWM[nr],
+			it87_write_value(data, it87_reg_pwm(data, nr),
 					 data->pwm_ctrl[nr]);
 		}
 	}
@@ -1717,20 +1835,14 @@ static ssize_t show_pwm_temp_map(struct device *dev,
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
@@ -1740,45 +1852,35 @@ static ssize_t set_pwm_temp_map(struct device *dev,
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
@@ -3377,7 +3479,10 @@ static void it87_init_device(struct platform_device *pdev)
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
@@ -3513,9 +3618,17 @@ static int it87_probe(struct platform_device *pdev)
 	data->ec_special_config = sio_data->ec_special_config;
 	chip = &it87_devices[sio_data->type];
 	data->features = chip->features;
+	data->reg_pwm = chip->reg_pwm;
 	data->peci_mask = chip->peci_mask;
 	data->old_peci_mask = chip->old_peci_mask;
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

