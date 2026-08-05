Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1868A3EFFD7
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920660; cv=none; b=a11MPKkoAqKdDCJB9vMwBnvFZ+jIW+mwxgVCVtBvR2VGAINh6T8h7kSm47pJUlFEwi5ssQ/xfNaubfkgRJtUYN8NJ9O04A8ohsA6Tzpqj4vh93O8d/Tqbx8BeqXsR6BdzR0Af8qSKTMfaFjjhuYahsAxPq8zTP+yI3hQa5SAusg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920660; c=relaxed/simple;
	bh=szaMRTU+Zc37ZMSKJAfhvlWzAFBia28AJQiOz4Mp840=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/kIVb4UzeRCPgPzr3SYEBqjdG/1iY5XQgmai6BbCa2MuMb+miuwYJ5loyNpcO9GRQcKz/AuXaHHRW0K6qnXxL5H/2rw5Y/G5mGxbMy/HC3aLmbHUg3nE8S8hBzztBdo8s4yaPvACrvh4UQZSIOgXTR09ico8EECltHwD9zUyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ABQjrXAK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ABQjrXAK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so8263845e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785920653; x=1786525453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4tn8Gp0RSKaHrUjo2zWoNmBQth+dfFwqaEytCzyX04=;
        b=ABQjrXAKN/nYS84ske6BvRE5NouubEX/t9mlwXP7IDcpNFsU94wa+XtgF1qACtV8QB
         pV5ZAnPoqWqvh/8kDk9Q29gF72KQs38xS2KCf1WU+tlDDrOBnBtwXdSNJ6zM62WFG1s9
         XUt4l/nBiw/6JQ41+FM7eMfy/kpa8GUQPC0zP7+70Wtf2BluTz8dY6ld6mBX5LV8dF/Z
         XBF2U3FG+1zoDypuQf/CzMIV6d5Y+8DoM9JqpwoR9F/+VR9JLgzBU/6h7QYIpHdDsBoU
         HRuRRHrz//c29wAZ6qQQ8hnpiMu5/mBX4BMebwVEvjoBeqqPn+3D0bm9dGqy29IUzoDO
         HPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920653; x=1786525453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4tn8Gp0RSKaHrUjo2zWoNmBQth+dfFwqaEytCzyX04=;
        b=A9rePHpHSXLTe30fjmchh81TsycYpRNd52lNrGbrc9ppxC5WbkV1tkjzokU9mobpA6
         chA3lbS7JyEqUHtG6TEVpUIZl06jOW2ElGLvXzASl3qsej+r/dlouu6mD42jaul/iNtk
         rqgs4m8Kfi5VQw9Wd0ngtJ0WCGFZMpKRTUj0vAIZf7gBD3BcE8bXZwlYMCS1XsvwA7AJ
         5bu7lN2usJLAFS5PHSNq0Qz2q2elHh5ec4axP5PGG0gWQ7GzQqUDbgLtJDx2zF1CpUFA
         +CChcG0gI5rF/mxvY7TnYt4kGfQnxczksBZIySehNADdsuaTgCV9B0mkrntuRhSCypMW
         Ur3g==
X-Gm-Message-State: AOJu0YxThbwq4FyCNRGlJouvhPkS010ILl4hCZXglCalVgK/uUccgbY0
	dRjyc2R2yHraJNwWOOfylxLvnJjG+p7gmd0n5EAt1vFJiotzNwJgD54viKMURIOhoEM=
X-Gm-Gg: AR+sD11vt88Ww5qm1VDIVYGyChv3B2nSQVRcqKaJ/aXXtBJ6X2FsDQfMd9oEVFkWqfn
	iJOCHoEmI2JEEtQb442IqANHla2lp5vhlNc8MBDJd0sX6lArVncYX96UGE30+l3Ygp3BA92O4ED
	6R6Kq+tv/rPm28f0cTdgMt8q1sQJQpZFbz4O3wdVVBR2I+MaULbbi6Y5tY/cfkRPnTuISF/sL+V
	RTsn63RoJn+XZZG+sGiQrhg4KIF2udE4rLhoi+AFk1jxDQef45mwRCIMD9AZjviBzQramfu65bn
	vL6hyFEJiaO5dx/aiyDXas5mtYf+pyuclxGIXyLbhN7IKK5XBMYyN4N42SiXBR/QFPYbfdeRodA
	9ITD0wRxIcCXV0mCy2s0oJRgJ7y8GxuMwC/fgAjdCVnmtf0nbWKzgZ3Y5bvR+dr5w3hRp9YHpv4
	vRnXBMnOKG6959MjyVDiC9a3gBASkDMHFyC8kjScPdpfhtZBEXIbqoEV0josgUZrItenaY2kYLU
	1JafT7SyVCTrXEWM5LjljYmJNbHAV4djqpiHsSI5tMpmSAfbDpMseyipDz3YHbBa47em9gvAWP4
	drao8EoBUfeNz0MXGWH/7IVlTHBqrQ==
X-Received: by 2002:a05:600c:4692:b0:498:162a:dbda with SMTP id 5b1f17b1804b1-4994e714b73mr45253615e9.5.1785920652804;
        Wed, 05 Aug 2026 02:04:12 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm34082105e9.3.2026.08.05.02.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:12 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v6 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Date: Wed,  5 Aug 2026 12:03:57 +0300
Message-ID: <20260805090400.2059006-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805090400.2059006-1-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the existing TPS25990 driver to support the TPS1689 eFuse,
as both devices share the same command interface and functionality.

Update the documentation to include TPS1689 support.

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 Documentation/hwmon/tps25990.rst |  15 +++--
 drivers/hwmon/pmbus/tps25990.c   | 106 ++++++++++++++++++++++++++++---
 2 files changed, 107 insertions(+), 14 deletions(-)

diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
index 04faec780d26..e8bc9a550bda 100644
--- a/Documentation/hwmon/tps25990.rst
+++ b/Documentation/hwmon/tps25990.rst
@@ -9,26 +9,31 @@ Supported chips:
 
     Prefix: 'tps25990'
 
-  * Datasheet
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
 
-    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+  * TI TPS1689
+
+    Prefix: 'tps1689'
+
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
 
 Author:
 
 	Jerome Brunet <jbrunet@baylibre.com>
+	Stoyan Bogdanov <sbogdanov@baylibre.com>
 
 Description
 -----------
 
-This driver implements support for TI TPS25990 eFuse.
+This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
 This is an integrated, high-current circuit protection and power
 management device with PMBUS interface
 
-Device compliant with:
+Devices are compliant with:
 
 - PMBus rev 1.3 interface.
 
-Device supports direct format for reading input voltages,
+Devices supports direct format for reading input voltages,
 output voltage, input current, input power and temperature.
 
 Due to the specificities of the chip, all history reset attributes
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 7634ac743025..a91ea8f33b29 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -47,7 +47,14 @@
 					 PK_MIN_AVG_RST_AVG  | \
 					 PK_MIN_AVG_RST_MIN)
 
+#define TPS1689_VIN_OV_RANGE_SEL_MASK	GENMASK(7, 6)
+#define TPS1689_VIN_VOV_MASK		GENMASK(5, 0)
+#define TPS1689_VIN_SCALING		251
+#define TPS1689_VIN_VOV_STEP_MV		250
+#define TPS1689_VIN_RANGE_SPAN_MV	16000
+
 enum chips {
+	tps1689,
 	tps25990,
 };
 
@@ -105,6 +112,8 @@ static int tps25990_mfr_write_protect_get(struct i2c_client *client)
 static int tps25990_read_word_data(struct i2c_client *client,
 				   int page, int phase, int reg)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
 	int ret;
 
 	switch (reg) {
@@ -193,9 +202,18 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_word_data(client, page, phase, reg);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
-					TPS25990_VIN_OVF_DIV);
-		ret += TPS25990_VIN_OVF_OFF;
+		if (data->chip_id == tps25990) {
+			ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
+						TPS25990_VIN_OVF_DIV);
+			ret += TPS25990_VIN_OVF_OFF;
+		} else if (data->chip_id == tps1689) {
+			ret = DIV_ROUND_CLOSEST(
+				((FIELD_GET(TPS1689_VIN_OV_RANGE_SEL_MASK, ret) + 1) *
+				TPS1689_VIN_RANGE_SPAN_MV) +
+				(FIELD_GET(TPS1689_VIN_VOV_MASK, ret) *
+				TPS1689_VIN_VOV_STEP_MV - TPS1689_VIN_RANGE_SPAN_MV),
+				TPS1689_VIN_SCALING);
+		}
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
@@ -208,7 +226,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		if (ret < 0)
 			break;
 		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
-					TPS25990_IIN_OCF_DIV);
+						TPS25990_IIN_OCF_DIV);
 		ret += TPS25990_IIN_OCF_OFF;
 		break;
 
@@ -238,6 +256,8 @@ static int tps25990_read_word_data(struct i2c_client *client,
 static int tps25990_write_word_data(struct i2c_client *client,
 				    int page, int reg, u16 value)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
 	int ret;
 
 	switch (reg) {
@@ -255,10 +275,23 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		break;
 
 	case PMBUS_VIN_OV_FAULT_LIMIT:
-		value -= TPS25990_VIN_OVF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
-					  TPS25990_VIN_OVF_NUM);
-		value = clamp_val(value, 0, 0xf);
+		if (data->chip_id == tps25990) {
+			value -= TPS25990_VIN_OVF_OFF;
+			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
+						  TPS25990_VIN_OVF_NUM);
+			value = clamp_val(value, 0, 0xf);
+		} else if (data->chip_id == tps1689) {
+			u32 scaled_value = value * TPS1689_VIN_SCALING + TPS1689_VIN_RANGE_SPAN_MV;
+			u32 tmp_scaled_value = scaled_value;
+			u8 ov_rng_sel = 0;
+			u32 ov_set = 0;
+
+			ov_rng_sel = tmp_scaled_value / TPS1689_VIN_RANGE_SPAN_MV;
+			ov_set = tmp_scaled_value - (TPS1689_VIN_RANGE_SPAN_MV * ov_rng_sel);
+			value = FIELD_PREP(TPS1689_VIN_OV_RANGE_SEL_MASK, ov_rng_sel - 1) |
+						FIELD_PREP(TPS1689_VIN_VOV_MASK,
+						(ov_set / TPS1689_VIN_VOV_STEP_MV));
+		}
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
@@ -347,6 +380,60 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 #endif
 
 static const struct pmbus_driver_info tps25990_base_info[] = {
+	[tps1689] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 3984,
+		.b[PSC_VOLTAGE_IN] = -63750,
+		.R[PSC_VOLTAGE_IN] = -3,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 1166,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = -2,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 140,
+		.b[PSC_TEMPERATURE] = 32103,
+		.R[PSC_TEMPERATURE] = -2,
+		/*
+		 * Current and Power measurement depends on the ohm value
+		 * of Rimon. m is multiplied by 1000 below to have an integer
+		 * and -3 is added to R to compensate.
+		 */
+		.format[PSC_CURRENT_IN] = direct,
+		.m[PSC_CURRENT_IN] = 9548,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -6,
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_CURRENT_OUT] = 24347,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = -3,
+		.format[PSC_POWER] = direct,
+		.m[PSC_POWER] = 2775,
+		.b[PSC_POWER] = 0,
+		.R[PSC_POWER] = -4,
+		.func[0] = (PMBUS_HAVE_VIN |
+			    PMBUS_HAVE_VOUT |
+			    PMBUS_HAVE_VMON |
+			    PMBUS_HAVE_IIN |
+			    PMBUS_HAVE_IOUT |
+			    PMBUS_HAVE_PIN |
+			    PMBUS_HAVE_TEMP |
+			    PMBUS_HAVE_STATUS_VOUT |
+			    PMBUS_HAVE_STATUS_IOUT |
+			    PMBUS_HAVE_STATUS_INPUT |
+			    PMBUS_HAVE_STATUS_TEMP |
+			    PMBUS_HAVE_SAMPLES),
+
+		.read_word_data = tps25990_read_word_data,
+		.write_word_data = tps25990_write_word_data,
+		.read_byte_data = tps25990_read_byte_data,
+		.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+		.reg_desc = tps25990_reg_desc,
+		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+		},
 	[tps25990] = {
 		.pages = 1,
 		.format[PSC_VOLTAGE_IN] = direct,
@@ -389,7 +476,6 @@ static const struct pmbus_driver_info tps25990_base_info[] = {
 		.write_word_data = tps25990_write_word_data,
 		.read_byte_data = tps25990_read_byte_data,
 		.write_byte_data = tps25990_write_byte_data,
-
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
 		.reg_desc = tps25990_reg_desc,
 		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
@@ -398,12 +484,14 @@ static const struct pmbus_driver_info tps25990_base_info[] = {
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ .name = "tps1689", .driver_data = tps1689 },
 	{ .name = "tps25990", .driver_data = tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps1689", .data = (void *)tps1689 },
 	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
-- 
2.43.0

