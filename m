Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7CF3D38C
	for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2024 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710515995; cv=none; b=WjAwjujoffNCtgUrEpPhhSl25rrDl6/vHiyvAuuoocPWXt5KDS8+3FwlVwyEIGFI6gtzakE194TVU7pNXIYLNkbTk3guM4NUUOboFXGbDvebCIQGbebebZD08hY51Cy2aB4VetaUioGWc5kDLGdOl9kk70ul6Yqit1gm2igpKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710515995; c=relaxed/simple;
	bh=kN0GubqMmrTCkFQf4Bzu5uwXME6+msgm2kXf52oqQrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnIB0MJuSynjUc3LMPCbcbqEJVYhhgIUh0PFbiq3wy/hmRTQbG0HDlyhkDql55iZaA0uirI/bgrTN833vtjoOR+BMM0MZZsYRZLgMNALUePdw5foQBSbaLQ90O501GhGFLOZOI1mf0U1tVkgvckIy2J/JKcNH8PfaqXwWYd24LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdXQ16BW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdXQ16BW"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513a6416058so3215324e87.1
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Mar 2024 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710515992; x=1711120792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlCg2oplUYpxnOwslAlzYLYJaeoPM0PMtlp5Y70+yQ0=;
        b=bdXQ16BWbFU9mnHjL9oEwK8D0jr0YrkQ4h/sj398GIV+8D32i73SuW9f4IvFwvlmpp
         NxkS4+GgdfVD7MKt8BgdHPwqhhmwFvA1xC2fEUH62dh128BzGOdrcMjKJodu4w1ibmjQ
         oXiXgd6s6LwgU7woeiTfEOfXPKbhVTCb6n/w0h1MeFXu7xSj2yC/KMKkcLIh+El9DGm4
         qIUzszAWasPckFiuF8AWHnR5ELqUjVwM0dbK9HK+aUjVtfkIC3BnlyR+InHGeAsMXvq+
         W61Ghp1u/Yhqj1Lco5Jz1ZRbWltlIdpArKz1luWnBqWzmQSiLXhQ3bueuqeFpmS1qfTZ
         X9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710515992; x=1711120792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlCg2oplUYpxnOwslAlzYLYJaeoPM0PMtlp5Y70+yQ0=;
        b=rgKjQlgJIREjDv0Uzlbp/PCnSQj3DWzegtVeFbQsGxA/fTIv58NrbHJs+aTuB1oDSz
         kKmLYheORhXmQDFzy3oHFGDdSkyy+g2QgNI0rIiDXBZXJZfEQFQ+nfeUkez6t7hPLJ+f
         qBknRdSoaWtzKmAt4fa6Lw6nHNVeaw2t9iGNdGBQiiSsSocYi6FGuF3Lb70GUegEpAq1
         GCURgfUPuN8Z1RLQNTocad8uuCk0TCGaUwqVXnC7y5NJDBk/Y75dPuoBfdHCvn63T7uA
         Ec+W4KLhSgtui2/KxCIcqufGfldQq80mkQgQhh7OMExZ3K7JKZGCC4xZnlYmkA6HFp+2
         HUbw==
X-Forwarded-Encrypted: i=1; AJvYcCUt9vzFaZi841lVE+sOJMNRGOAvFKuKX9iFgSvcVwSVp6Zewm45vSUNRTJBXmFa284cGThZpa1GfrkCyqjzWfdseS3aJ7HTC7j6zJw=
X-Gm-Message-State: AOJu0YzE0RD0MVQ8NQd/B0kf9u1mSf4rfqZhV6f85zrTYGRsHhbuUa7F
	4N21TNQEzKxjQp51wATWVfoW6zslmGJfL8glPTJNb2uT8KLaRHtP
X-Google-Smtp-Source: AGHT+IFpuhnNfNH3K3Tam3vcImQZcMyeUPZEkwK4XhkCLZuXcYnbhXkimvyTAn50/jIsvoxra90UIw==
X-Received: by 2002:a19:740a:0:b0:513:cc23:3b6b with SMTP id v10-20020a19740a000000b00513cc233b6bmr3904565lfe.48.1710515991892;
        Fri, 15 Mar 2024 08:19:51 -0700 (PDT)
Received: from lpm-pc.appeartv.lan (195-159-183-44.customer.powertech.no. [195.159.183.44])
        by smtp.gmail.com with ESMTPSA id x18-20020a056512131200b00513ccce5c04sm672914lfu.227.2024.03.15.08.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 08:19:51 -0700 (PDT)
From: Lars Petter Mostad <larspm@gmail.com>
X-Google-Original-From: Lars Petter Mostad <lars.petter.mostad@appear.net>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: [PATCH 1/1] hwmon: (pmbus_core) Support relative encoding of vout related commands
Date: Fri, 15 Mar 2024 16:18:55 +0100
Message-ID: <20240315151855.377627-2-lars.petter.mostad@appear.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315151855.377627-1-lars.petter.mostad@appear.net>
References: <20240315151855.377627-1-lars.petter.mostad@appear.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PMBus 1.3 allows for relative encoding of voltages in certain output
voltage related commands. These commands are encoded relative to
VOUT_COMMAND. Support this when encoding/decoding commands.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
---
 drivers/hwmon/pmbus/pmbus.c      |  2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 85 +++++++++++++++++++++++++++-----
 2 files changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index ec40c5c59954..c9ad83d8d2ca 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -121,7 +121,7 @@ static int pmbus_identify(struct i2c_client *client,
 
 		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
 		if (vout_mode >= 0 && vout_mode != 0xff) {
-			switch (vout_mode >> 5) {
+			switch ((vout_mode & 0x60) >> 5) {
 			case 0:
 				break;
 			case 1:
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index cb4c65a7f288..4108e1684250 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -87,6 +87,8 @@ struct pmbus_data {
 
 	int exponent[PMBUS_PAGES];
 				/* linear mode: exponent for output voltages */
+	bool vout_mode_relative[PMBUS_PAGES];
+	s64 vout_command[PMBUS_PAGES];
 
 	const struct pmbus_driver_info *info;
 
@@ -644,6 +646,21 @@ static void pmbus_update_sensor_data(struct i2c_client *client, struct pmbus_sen
 						     sensor->phase, sensor->reg);
 }
 
+static bool pmbus_reg_is_vout_command_relative(u16 reg)
+{
+	switch (reg) {
+	case PMBUS_VOUT_MARGIN_HIGH:
+	case PMBUS_VOUT_MARGIN_LOW:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /*
  * Convert ieee754 sensor values to milli- or micro-units
  * depending on sensor type.
@@ -842,6 +859,14 @@ static s64 pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 		val = pmbus_reg2data_linear(data, sensor);
 		break;
 	}
+
+	if (sensor->class == PSC_VOLTAGE_OUT &&
+	    data->vout_mode_relative[sensor->page] &&
+	    pmbus_reg_is_vout_command_relative(sensor->reg)) {
+		/* At this point val is the voltage as a permillage of VOUT_COMMAND */
+		val = DIV_ROUND_CLOSEST_ULL(val * data->vout_command[sensor->page], 1000);
+	}
+
 	return val;
 }
 
@@ -1028,6 +1053,12 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	if (!sensor->convert)
 		return val;
 
+	if (sensor->class == PSC_VOLTAGE_OUT &&
+	    data->vout_mode_relative[sensor->page] &&
+	    pmbus_reg_is_vout_command_relative(sensor->reg)) {
+		val = DIV_ROUND_CLOSEST_ULL(val * 1000, data->vout_command[sensor->page]);
+	}
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		regval = pmbus_data2reg_direct(data, sensor, val);
@@ -2500,6 +2531,20 @@ static int pmbus_init_coefficients(struct i2c_client *client,
 	return 0;
 }
 
+static void pmbus_init_vout_relative(struct pmbus_data *data, int page,
+				     int vout_command_raw)
+{
+	struct pmbus_sensor s = {
+		.page = page,
+		.reg = PMBUS_VOUT_COMMAND,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = vout_command_raw
+	};
+
+	data->vout_command[page] = pmbus_reg2data(data, &s);
+}
+
 /*
  * Identify chip parameters.
  * This function is called for all chips.
@@ -2512,6 +2557,10 @@ static int pmbus_identify_common(struct i2c_client *client,
 	if (pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE))
 		vout_mode = _pmbus_read_byte_data(client, page,
 						  PMBUS_VOUT_MODE);
+	if (vout_mode >= 0 && vout_mode & 0x80) {
+		data->vout_mode_relative[page] = true;
+		vout_mode &= 0x7f;
+	}
 	if (vout_mode >= 0 && vout_mode != 0xff) {
 		/*
 		 * Not all chips support the VOUT_MODE command,
@@ -2676,6 +2725,15 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			return ret;
 	}
 
+	for (page = 0; page < info->pages; page++) {
+		if (data->vout_mode_relative[page]) {
+			ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_COMMAND);
+			if (ret < 0)
+				return ret;
+			pmbus_init_vout_relative(data, page, ret);
+		}
+	}
+
 	if (client->flags & I2C_CLIENT_PEC) {
 		/*
 		 * If I2C_CLIENT_PEC is set here, both the I2C adapter and the
@@ -3070,22 +3128,27 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 
 	*selector = 0;
 
-	low = pmbus_regulator_get_low_margin(client, s.page);
-	if (low < 0)
-		return low;
+	if (!data->vout_mode_relative[s.page]) {
+		low = pmbus_regulator_get_low_margin(client, s.page);
+		if (low < 0)
+			return low;
 
-	high = pmbus_regulator_get_high_margin(client, s.page);
-	if (high < 0)
-		return high;
+		high = pmbus_regulator_get_high_margin(client, s.page);
+		if (high < 0)
+			return high;
 
-	/* Make sure we are within margins */
-	if (low > val)
-		val = low;
-	if (high < val)
-		val = high;
+		/* Make sure we are within margins */
+		if (low > val)
+			val = low;
+		if (high < val)
+			val = high;
+	}
 
 	val = pmbus_data2reg(data, &s, val);
 
+	if (data->vout_mode_relative[s.page])
+		pmbus_init_vout_relative(data, s.page, val);
+
 	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
 }
 
-- 
2.44.0

