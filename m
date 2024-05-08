Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AEC71B3A
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174344; cv=none; b=h7B8/RTxfZyyUyUZHnwnHF8ueFS+bGIX0LU3wju99Y8Vi3xdSgPHXV8K1302Bq5zvnMWAEi6r762iyy508r9cEqdLSuPplu/qApIhFBGQrpk5CF3Qa5GX6CgwGXCvFyEmLgPeLrr7UEactuVVbCzKAMoA9crvaaC2n8dXlqIi4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174344; c=relaxed/simple;
	bh=6OfVm5WAVEBftD/i9UssieiJGqL9Df4FzVxqEVrMZRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRgquzIxvRze9sRX3ye4kZMqf3QKhNt0193P5Q8dKbTlRntWs2/UEL9wKFsU4nfJkCCT0P6rPk929lbAP/+qHxMnYFom9BPjoA8ywuTvFGKDM6cAxkPUxHtms/X3oGAJxFkAz4KgcRVrZJ2iI6EeX18rXGQEPvv4fwUL0IpCBeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPzXJ/VJ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPzXJ/VJ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2dcc8d10d39so49304911fa.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 May 2024 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715174341; x=1715779141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2y764UEDBP+KINTJuQv4e1jc8H1cvAOvgJeTw40YJvs=;
        b=KPzXJ/VJPgGUB1tBbp2kXt+Rh/9jLIO8awU6R9W4XUWGqcd5M2pKvvfHEiuClu+uzz
         Qz+cPDxvgNUe5ryLVPgqLIbtoKH+7MEjlR1hJwTyrwOAo6igBJ91or8m823ghLK4zuY7
         mMBt6PD+zV3IUYos83WSXqowcakeN5PhkVoEbyzeVkliekzevd97KRYVk2bkX2MhBQ7e
         ZsZ3yfKREnLCX8FDdXXcIbhiH9diUtkBUgVPeM8Nnk8KgB08+axoKNO5Bdy9vR3T7Hqs
         JH9Faqhp8McSmoNxi5d8LInmT01IUcKpVY1o0vn3gC8WKUrZxmX5WEdXukjy7BPcFkwl
         GrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715174341; x=1715779141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y764UEDBP+KINTJuQv4e1jc8H1cvAOvgJeTw40YJvs=;
        b=V7TMDQiXOt1HcoNcKM3qZqO1KkNvOdIWQ4f2e1x6ClQf5jFoYA3QeaUD/l5j3vVTxE
         KCAHys92JZAnDiH1jDe4tP7z1+HRtNalM0XbTuoYcY8Q8xkFwXsYWduLzGJe66Sj+EG1
         huM1fTCXqWBoK6A/BS5TlSfTww5iRy7YH7YPi+6C857GIpL80ojCw1VPT5FlEaZtD2Rb
         2fMTplvvQ6RKU9uGYvaAFQTd2UXZwijRzCayoda7CM7STnHmRNkLxSlNr+0U9ghT2Qdb
         2dTy/QDNtv1R4tOmHSJswwg4sNL4CpEBhBT9Yt54JB4q7X5m2UTwISYyoYJhQZkZVsrK
         /MfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAU2UjUb/fN9W5oYt3+WqTMl6fmpDo55QBscyE91NLeSDapmF2x52/7dzKoKqQ5A3jU/qNmUml2s/7IYikv/+O27ydlP7ccjoPjI4=
X-Gm-Message-State: AOJu0YxNZHzTZMGSV8XzUXZQ0T3qegS2CjmWyREg8pqebdGoSGizZfo/
	DK9Ao/P/Xy7w3WXjirouRT+pu61x/b46775mDC9Iq9zkl2d6wsMu
X-Google-Smtp-Source: AGHT+IHaWKxq/3awanEehu9j+HyBJrb7plpcSxN6L4aAh++90EzmUJVS0Sl4IDPFv7gknkONCY+prw==
X-Received: by 2002:a05:651c:222c:b0:2df:65ed:2c34 with SMTP id 38308e7fff4ca-2e446f7c757mr19388301fa.14.1715174340769;
        Wed, 08 May 2024 06:19:00 -0700 (PDT)
Received: from lpm-pc.appeartv.lan (195-159-183-44.customer.powertech.no. [195.159.183.44])
        by smtp.gmail.com with ESMTPSA id v5-20020a2e9245000000b002dce3eab848sm2389109ljg.47.2024.05.08.06.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 06:19:00 -0700 (PDT)
From: Lars Petter Mostad <larspm@gmail.com>
X-Google-Original-From: Lars Petter Mostad <lars.petter.mostad@appear.net>
To: linux@roeck-us.net,
	larspm@gmail.com,
	linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: [PATCH v2] hwmon: (emc1403) Add support for EMC1428 and EMC1438.
Date: Wed,  8 May 2024 15:18:37 +0200
Message-ID: <20240508131837.684391-1-lars.petter.mostad@appear.net>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EMC1428 and EMC1438 are similar to EMC14xx, but have eight temperature
channels, as well as signed data and limit registers. Chips currently
supported by this driver have unsigned registers only.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
---
 drivers/hwmon/emc1403.c | 121 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 110 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 43322bb9aaa1..eca33220d34a 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -25,7 +25,7 @@
 #define THERMAL_SMSC_ID_REG	0xfe
 #define THERMAL_REVISION_REG	0xff
 
-enum emc1403_chip { emc1402, emc1403, emc1404 };
+enum emc1403_chip { emc1402, emc1403, emc1404, emc1428 };
 
 struct thermal_data {
 	enum emc1403_chip chip;
@@ -100,6 +100,12 @@ static int emc1403_detect(struct i2c_client *client,
 	case 0x27:
 		strscpy(info->type, "emc1424", I2C_NAME_SIZE);
 		break;
+	case 0x29:
+		strscpy(info->type, "emc1428", I2C_NAME_SIZE);
+		break;
+	case 0x59:
+		strscpy(info->type, "emc1438", I2C_NAME_SIZE);
+		break;
 	case 0x60:
 		strscpy(info->type, "emc1442", I2C_NAME_SIZE);
 		break;
@@ -130,6 +136,14 @@ static bool emc1403_regmap_is_volatile(struct device *dev, unsigned int reg)
 	case 0x35:	/* high limit status */
 	case 0x36:	/* low limit status */
 	case 0x37:	/* therm limit status */
+	case 0x41:	/* external diode 4 high byte */
+	case 0x42:	/* external diode 4 low byte */
+	case 0x43:	/* external diode 5 high byte */
+	case 0x44:	/* external diode 5 low byte */
+	case 0x45:	/* external diode 6 high byte */
+	case 0x46:	/* external diode 6 low byte */
+	case 0x47:	/* external diode 7 high byte */
+	case 0x48:	/* external diode 7 low byte */
 		return true;
 	default:
 		return false;
@@ -177,6 +191,30 @@ static u8 emc1403_temp_regs[][4] = {
 		[temp_crit] = 0x30,
 		[temp_input] = 0x2a,
 	},
+	[4] = {
+		[temp_min] = 0x51,
+		[temp_max] = 0x50,
+		[temp_crit] = 0x64,
+		[temp_input] = 0x41,
+	},
+	[5] = {
+		[temp_min] = 0x55,
+		[temp_max] = 0x54,
+		[temp_crit] = 0x65,
+		[temp_input] = 0x43
+	},
+	[6] = {
+		[temp_min] = 0x59,
+		[temp_max] = 0x58,
+		[temp_crit] = 0x66,
+		[temp_input] = 0x45,
+	},
+	[7] = {
+		[temp_min] = 0x5d,
+		[temp_max] = 0x5c,
+		[temp_crit] = 0x67,
+		[temp_input] = 0x47,
+	},
 };
 
 static s8 emc1403_temp_regs_low[][4] = {
@@ -204,27 +242,56 @@ static s8 emc1403_temp_regs_low[][4] = {
 		[temp_crit] = -1,
 		[temp_input] = 0x2b,
 	},
+	[4] = {
+		[temp_min] = 0x53,
+		[temp_max] = 0x52,
+		[temp_crit] = -1,
+		[temp_input] = 0x42,
+	},
+	[5] = {
+		[temp_min] = 0x57,
+		[temp_max] = 0x56,
+		[temp_crit] = -1,
+		[temp_input] = 0x44,
+	},
+	[6] = {
+		[temp_min] = 0x5b,
+		[temp_max] = 0x5a,
+		[temp_crit] = -1,
+		[temp_input] = 0x46,
+	},
+	[7] = {
+		[temp_min] = 0x5f,
+		[temp_max] = 0x5e,
+		[temp_crit] = -1,
+		[temp_input] = 0x48,
+	},
 };
 
 static int __emc1403_get_temp(struct thermal_data *data, int channel,
 			      enum emc1403_reg_map map, long *val)
 {
-	unsigned int regval;
+	unsigned int regvalh;
+	unsigned int regvall = 0;
 	int ret;
 	s8 reg;
 
-	ret = regmap_read(data->regmap, emc1403_temp_regs[channel][map], &regval);
+	ret = regmap_read(data->regmap, emc1403_temp_regs[channel][map], &regvalh);
 	if (ret < 0)
 		return ret;
-	*val = regval * 1000;
 
 	reg = emc1403_temp_regs_low[channel][map];
 	if (reg >= 0) {
-		ret = regmap_read(data->regmap, reg, &regval);
+		ret = regmap_read(data->regmap, reg, &regvall);
 		if (ret < 0)
 			return ret;
-		*val += (regval >> 5) * 125;
 	}
+
+	if (data->chip == emc1428)
+		*val = sign_extend32((regvalh << 3) | (regvall >> 5), 10) * 125;
+	else
+		*val = ((regvalh << 3) | (regvall >> 5)) * 125;
+
 	return 0;
 }
 
@@ -379,7 +446,10 @@ static int emc1403_set_hyst(struct thermal_data *data, long val)
 	int hyst, ret;
 	long limit;
 
-	val = clamp_val(val, 0, 255000);
+	if (data->chip == emc1428)
+		val = clamp_val(val, -128000, 127000);
+	else
+		val = clamp_val(val, 0, 255000);
 
 	mutex_lock(&data->mutex);
 	ret = __emc1403_get_temp(data, 0, temp_crit, &limit);
@@ -387,7 +457,10 @@ static int emc1403_set_hyst(struct thermal_data *data, long val)
 		goto unlock;
 
 	hyst = limit - val;
-	hyst = clamp_val(DIV_ROUND_CLOSEST(hyst, 1000), 0, 255);
+	if (data->chip == emc1428)
+		hyst = clamp_val(DIV_ROUND_CLOSEST(hyst, 1000), 0, 127);
+	else
+		hyst = clamp_val(DIV_ROUND_CLOSEST(hyst, 1000), 0, 255);
 	ret = regmap_write(data->regmap, 0x21, hyst);
 unlock:
 	mutex_unlock(&data->mutex);
@@ -407,14 +480,20 @@ static int emc1403_set_temp(struct thermal_data *data, int channel,
 
 	mutex_lock(&data->mutex);
 	if (regl >= 0) {
-		val = clamp_val(val, 0, 255875);
+		if (data->chip == emc1428)
+			val = clamp_val(val, -128000, 127875);
+		else
+			val = clamp_val(val, 0, 255875);
 		regval = DIV_ROUND_CLOSEST(val, 125);
-		ret = regmap_write(data->regmap, regh, regval >> 3);
+		ret = regmap_write(data->regmap, regh, (regval >> 3) & 0xff);
 		if (ret < 0)
 			goto unlock;
 		ret = regmap_write(data->regmap, regl, (regval & 0x07) << 5);
 	} else {
-		val = clamp_val(val, 0, 255000);
+		if (data->chip == emc1428)
+			val = clamp_val(val, -128000, 127000);
+		else
+			val = clamp_val(val, 0, 255000);
 		regval = DIV_ROUND_CLOSEST(val, 1000);
 		ret = regmap_write(data->regmap, regh, regval);
 	}
@@ -484,6 +563,8 @@ static umode_t emc1403_temp_is_visible(const void *_data, u32 attr, int channel)
 		return 0;
 	if (data->chip == emc1403 && channel > 2)
 		return 0;
+	if (data->chip != emc1428 && channel > 3)
+		return 0;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -548,6 +629,22 @@ static const struct hwmon_channel_info * const emc1403_info[] = {
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
 			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
 			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT
 			   ),
 	NULL
@@ -575,6 +672,8 @@ static const struct i2c_device_id emc1403_idtable[] = {
 	{ "emc1422", emc1402 },
 	{ "emc1423", emc1403 },
 	{ "emc1424", emc1404 },
+	{ "emc1428", emc1428 },
+	{ "emc1438", emc1428 },
 	{ "emc1442", emc1402 },
 	{ }
 };

base-commit: 6a8157812f5b486d1fdabeefa070d75ae49220ee
-- 
2.44.0

