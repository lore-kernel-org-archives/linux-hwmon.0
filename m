Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4D17088A
	for <linux-hwmon@vger.kernel.org>; Fri, 10 May 2024 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715351316; cv=none; b=leHK0i0oMXqwSt+S1BhEyuVhPrwZP7RJiLddIq3XYpJu88Pe9Tjd7rOXmG5Q70INPrpVqrEB8kFZ2/EoYJzxG8b+SpZjNjThl5lVn7Ca5xKYfFNbPdlpw/hjoMtgNqGzDS1u+7ct8ly2QJxWNjGNN2Bvjk9ixYMCPhlkYNYKIdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715351316; c=relaxed/simple;
	bh=jNV78Ic1jnblHLj4PtyKc6t9dyFwqXUxynjxmMje5EM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcgwPGY9yU4KsRnmmWDyuWWC6v32uXqud8BtonzlrWSqYUAvk2wnEPdOaZN6HLp+7nHoFCPYXx2YRBAERRFFkyrs5vusQXtTyT/hAZ8vM33/uiqHkEqfAPZILkLP9fbjlnef2nCTMRQJsLl6Sn5ecXuYMlcxof2giveQJ4oru5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heol1Mnh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heol1Mnh"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51fc01b6fe7so2207218e87.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 May 2024 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715351312; x=1715956112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIm0d2fhrcmI99FeVnCH2yeCDgq1el/M+i/ISHOXk8s=;
        b=heol1MnhZJ769JEZno2CdJ4lmDGSlcPPrPVAZGJYnkPt+baxWCYCjD+x3RhXk5HZtB
         RYoFFS62m+KEB1SejF3o/rhh0r6M7sEx5fw+D4+6XF4Piaib1o1Q0tuudPUUtjWfDWdM
         0uqB7vLbeEyQHQHl3zhhsLXx5gOD/f9HzDksE8gdwXgfDBjvYN/NEpD5BslHHcNJC6dC
         ZWecSoMXDpVQuhGp2IO0JtJnxK+78uP6tcAYTJHJRf81cHuXkM0J5MoaWYqX5/ZKh2YC
         VnznbdKlY0JoUuF/63sOcQq2PtYqoGcobSySriXzbR/WOoVsZobMKTAG690KRf4tOMd/
         R77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715351312; x=1715956112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIm0d2fhrcmI99FeVnCH2yeCDgq1el/M+i/ISHOXk8s=;
        b=Xshd9y/p3yNlsRt+JHyHvlwtH24MvJ/JbhnVj2l+wON7+fKVg4d3A7XNtejeYbmXyp
         ATATCUJSu/vVEJrTWppMJDes3JYRh7fe89Hw/OIEKS1g19EO2rSPUq+f00UHCN6ZJ7a3
         ScKFdt3EjRWgc+x8QjW5QaLTmPxwMG6w0ju11ETujxH/ztSb2t4VWTbmJ1w9gB3rySNe
         2WRBv9x7fb6CH+bzgQAok9y82jswjj7TAjLkJjwuwJENVzxsxPHm2iYmMEUK6/4SftML
         XDAqSamQByKmErAdnqfcSw9sLxplZxcr+bL+N8WYl9JVt4FdC9awDckvBvQIl2OH4vhK
         EDFA==
X-Forwarded-Encrypted: i=1; AJvYcCXi8UeXXyA4P8VKHhDHRjk0GdYDU83PdfyYY6kZssYjNrYQKBOhneEJngdcjYb2bswS6IhpWRyCGQXPlIKmGdqpdAMIFYwLmxI/6K8=
X-Gm-Message-State: AOJu0YxcKGkrl1SGRgvO4vPQsYcysThq38RegvXFeVqtny6DKZcZtFjt
	SL06YZb5fHjQDIA2Zk6KAIt100TvpxY1Nfs/bB1U7TQr8bLb0JFV
X-Google-Smtp-Source: AGHT+IEFEsZbBQvrHWJISepelambSbZA4QNthKOPuFJQ8VY8rp2+5bHlUV+JubeeyDmnNFgonfsSUw==
X-Received: by 2002:a05:6512:3b07:b0:51b:de3a:33ac with SMTP id 2adb3069b0e04-5221058453amr2139592e87.59.1715351312122;
        Fri, 10 May 2024 07:28:32 -0700 (PDT)
Received: from lpm-pc.appeartv.lan (195-159-183-44.customer.powertech.no. [195.159.183.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba694sm716493e87.73.2024.05.10.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 07:28:31 -0700 (PDT)
From: Lars Petter Mostad <larspm@gmail.com>
X-Google-Original-From: Lars Petter Mostad <lars.petter.mostad@appear.net>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <larspm@gmail.com>
Subject: [PATCH v2.1] hwmon: (emc1403) Add support for EMC1428 and EMC1438.
Date: Fri, 10 May 2024 16:28:24 +0200
Message-ID: <20240510142824.824332-1-lars.petter.mostad@appear.net>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lars Petter Mostad <larspm@gmail.com>

EMC1428 and EMC1438 are similar to EMC14xx, but have eight temperature
channels, as well as signed data and limit registers. Chips currently
supported by this driver have unsigned registers only.

Signed-off-by: Lars Petter Mostad <larspm@gmail.com>
---
 Documentation/hwmon/emc1403.rst |  17 ++++-
 drivers/hwmon/emc1403.c         | 121 +++++++++++++++++++++++++++++---
 2 files changed, 124 insertions(+), 14 deletions(-)

diff --git a/Documentation/hwmon/emc1403.rst b/Documentation/hwmon/emc1403.rst
index 0de9616b24ed..57f833b1a800 100644
--- a/Documentation/hwmon/emc1403.rst
+++ b/Documentation/hwmon/emc1403.rst
@@ -45,6 +45,17 @@ Supported chips:
 
 	- https://ww1.microchip.com/downloads/en/DeviceDoc/1423_1424.pdf
 
+  * SMSC / Microchip EMC1428, EMC1438
+
+    Addresses scanned: I2C 0x18, 0x4c, 0x4d
+
+    Prefix: 'emc1428', 'emc1438'
+
+    Datasheets:
+
+	- https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20005275A.pdf
+	- https://ww1.microchip.com/downloads/en/DeviceDoc/EMC1438%20DS%20Rev.%201.0%20(04-29-10).pdf
+
 Author:
     Kalhan Trisal <kalhan.trisal@intel.com
 
@@ -53,10 +64,10 @@ Description
 -----------
 
 The Standard Microsystems Corporation (SMSC) / Microchip EMC14xx chips
-contain up to four temperature sensors. EMC14x2 support two sensors
+contain up to eight temperature sensors. EMC14x2 support two sensors
 (one internal, one external). EMC14x3 support three sensors (one internal,
-two external), and EMC14x4 support four sensors (one internal, three
-external).
+two external), EMC14x4 support four sensors (one internal, three external),
+and EMC14x8 support eight sensors (one internal, seven external).
 
 The chips implement three limits for each sensor: low (tempX_min), high
 (tempX_max) and critical (tempX_crit.) The chips also implement an
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

