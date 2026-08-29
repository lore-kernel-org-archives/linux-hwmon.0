Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F3A12CDA5
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788040920; cv=none; b=W310NFj8dTxDkNbtSs1325lcUb4XboVBbwwgLRqz5NlkXhpF75pEPRURNunsvhwnXhYrfTG6yM5WdtEiOahU7/o/iyiqhK9gMllQLdRSQHC/oovIkTNc1EFCEnRvADoAAdR7dpwVX8divo1MdJKNoIq9PHZqcjCgMLqITEatO0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788040920; c=relaxed/simple;
	bh=RJSUUh4fgtXUygYuVbgSdukp1C2OM4T1uVejk7Y94uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0XerWKTV8L182UK8xhRtCc7+4Qej5DmivYDQ60XAmjsOe/EGy/Frl9z88GPpghwLuSZbvF8x6dUwum8OSLveudfSLINrs/6QgrVMgw4FkmoO5DkCPY1gcQRfvWT3IQ6N8fSbHvvo3Y9X4XeaK6ttA9nPQBKyNFKrcNzb1BqFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXHcN6oR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXHcN6oR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5f1d0af69so3507049a12.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 15:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788040916; x=1788645716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JFhWkWodxMSkWp+6Z15Z5pE2y0iuR1u3iUizzID/Fc=;
        b=cXHcN6oR3N9mzBy2ZCd2EyB30ZfM7ofIsfvfKQ3nsWzbBVyFA+Xv3Ovh2r+J+STxUt
         yN/27YgHudsmnGpXR0WheEiq3771UQKjFYozclnnqtETnk9eZdt4zkGtd4rVTM+7tDdJ
         5SGOduGIYhVbklgRLO0o/ipsnimNFt0Xj1cce7tDBOv5vbHf9paWzzpz4K/hfKxh1/hD
         VrULBO+L3gBKSZM0ONVjix+KhFlIU8+c0x5EezQWwEXjALPZWZuZtocEx6Whr5hbNsbR
         Sy+vub4pLpCXdYhzqPwmZCxMkN2qgMJMVIpVuwjoP4F7pahu7qPGdIcQv0r1BKNNKaK9
         VHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788040916; x=1788645716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JFhWkWodxMSkWp+6Z15Z5pE2y0iuR1u3iUizzID/Fc=;
        b=oFQp5HPpFecKWG68kBuSkhdHUoaoK98+mF6AkWACQg5cicqj5dUOtG7FNaDpaNZdle
         IGv8Q1NaKTBpUC6mzvQntJ1YYnaoA5PWTiBDvcf1GPKp8mHCT06HV/1epOWzYhaumxvw
         4+WcKhih6Ows7fjphEuc0ZPYl0cIpGSn3Uz+TIeX9T/eDEaIv8EtCzgAdC1SHmqdZCDu
         D7PyuuGji2GHYf4EZsu+Xlsh7Qul3is1/h3YImPCOljxPqT+toZOJcz7vbD2m8q/Dbej
         gf3LoZKi/yv/JOFlbaeS0YYhRGUnB2hBaxP2IwocG3suMvNr2mOM/RC/x9WV226y4XQi
         UW8w==
X-Gm-Message-State: AFuF++kKVqAJOQFE2pppeqPLi8QDUANUsi1WKtv9KaJNdaD6/chZxtUP
	JyMftTTTkZ9oImMuQ898yjoF/iPNI1I1sENkLoIV3+19/Rui4pQfQJz+
X-Gm-Gg: AR+sD11wqvAhTzH4wNCD6KKnKoY4Dikpj6B5Ox4sje3LcBHZqsVroGErIjiqknfLGtp
	RHcG36JuVj0r+12AvNwBdmTtrmllXuydQ0FBVaLE50B/JtT+mLeqhxajnW7u5s7k4xQz2kpKK0W
	H3fBAnbQHweOQildjvIkITL0j+XsC0D5J6wUsRCxd2g3dpJdJ3B+rIBWd6J6xqLlju6xMXErjPT
	F7A6KyrWYjQTQnJT4Pnes7JSwdO05amJXTdHGI2iZuOEr6XZfTsdxDxpHQTTxF6aZlZyZbJ7xyQ
	hfvZNJK+AxJUiRQH2c3FsHznLJLvV2XNH3jsETRUS49IqveOWlNgXjyCZQw4xd/Wl2XHT80iLTs
	FxQ84KBvg0v6yZe226i/GQ+4c0f04Z9O9mlBkJ2STuCKE+lh7PgE+OWVJjNtB1JivrmXuFcKLiF
	vk4arO2t2VOov29VCFU+iti191UCKiOKX+5gpGIOv6rIqYBMH11N2ZIZKt54JLPbk+i9EmkkUEY
	8q8fEq1uySO8sA8
X-Received: by 2002:a17:906:fe0b:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-c2557411026mr1003940866b.24.1788040916496;
        Sat, 29 Aug 2026 15:01:56 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:cf7b:6b6c:bc26:7dfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c256f8e498csm140948966b.8.2026.08.29.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:01:55 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v7 1/3] hwmon: it87: describe per-chip PWM temperature maps
Date: Sun, 30 Aug 2026 00:01:47 +0200
Message-ID: <619425df92463b3c3f9e90f00c527c4009599ea8.1788040385.git.jerome.tollet@gmail.com>
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

Add a per-chip count for PWM temperature mapping sources and use it
when reporting and validating mappings.

Keep existing chips on their previous three-source defaults. This
prepares the driver for chips with a different number of mapping sources.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/hwmon/it87.c | 46 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 87edb1b60..5cb1c0029 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -292,6 +292,7 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 	u8 smbus_bitmap;	/* SMBus enable bits in extra config register */
@@ -335,12 +336,14 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.num_temp_map = 3,
 	},
 	[it8712] = {
 		.name = "it8712",
 		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.num_temp_map = 3,
 	},
 	[it8716] = {
 		.name = "it8716",
@@ -348,6 +351,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 	},
 	[it8718] = {
 		.name = "it8718",
@@ -355,6 +359,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8720] = {
@@ -363,6 +368,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8721] = {
@@ -372,6 +378,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.peci_mask = 0x05,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -382,6 +389,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8732] = {
@@ -391,6 +399,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
 		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -404,6 +413,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
 				/* three fans, always 16 bit (guesswork) */
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8772] = {
@@ -416,6 +426,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
 				/* three fans, always 16 bit (datasheet) */
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8781] = {
@@ -424,6 +435,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8782] = {
@@ -432,6 +444,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8783] = {
@@ -440,6 +453,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_TEMP_OFFSET
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.old_peci_mask = 0x4,
 	},
 	[it8786] = {
@@ -448,6 +462,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8790] = {
@@ -456,6 +471,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_NOCONF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
@@ -465,6 +481,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -474,6 +491,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8620] = {
@@ -483,6 +501,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8622] = {
@@ -492,6 +511,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
@@ -502,6 +522,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
 	[it8689] = {
@@ -511,6 +532,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_SIX_PWM | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3
 		  | FEAT_FANCTL_ONOFF,
+		.num_temp_map = 3,
 		.smbus_bitmap = BIT(1) | BIT(2),
 	},
 	[it87952] = {
@@ -520,6 +542,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.num_temp_map = 3,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -589,6 +612,7 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	u8 num_temp_map;
 	u8 peci_mask;
 	u8 old_peci_mask;
 
@@ -1693,16 +1717,18 @@ static ssize_t show_pwm_temp_map(struct device *dev,
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
@@ -1714,6 +1740,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
+	u8 num_map = data->num_temp_map;
 	long val;
 	int err;
 	u8 reg;
@@ -1721,8 +1748,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
-	if (nr >= 3)
-		val -= 3;
+	if (nr >= num_map)
+		val -= num_map;
 
 	switch (val) {
 	case BIT(0):
@@ -3461,6 +3488,7 @@ static int it87_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct it87_sio_data *sio_data = dev_get_platdata(dev);
+	const struct it87_devices *chip;
 	int enable_pwm_interface;
 	struct device *hwmon_dev;
 	int err;
@@ -3483,9 +3511,11 @@ static int it87_probe(struct platform_device *pdev)
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
+	data->num_temp_map = chip->num_temp_map;
 	/*
 	 * IT8705F Datasheet 0.4.1, 3h == Version G.
 	 * IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h == Version J.
-- 
2.55.0

