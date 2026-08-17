Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72963F7AA8
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961715; cv=none; b=AXORiyA1PVl6NEZIcR0aP96bOsmYJCwpM7eSzEIsmlfK4aT4Tnna7bx1XW1xhO56vZXRw4fQgwk82mDcAuPGg/ntwcJjNApW13DS5juHyHQjN6yD+3QPksXA04GY2IHHYeHIPNmFOyzL0G6YrlyPQRx+r4vgl9SWcuNf8mYcDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961715; c=relaxed/simple;
	bh=cl6IXKUS593kRSvJMvuLwkLWuyMba6O4c1F1EXzKBvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWtaAza5USYTob85K4As9KfqQViovYPEmo6cRbNF0EOTBS64RtP3e2NagA4//1IGnzPGFyqG0G319p/44/PcSq9/2j5djIJjNOMNpxNlEKeh1f5jssLzLDErEl4WDvvJ/Esfy3n1+G2W5QUqK68UoNVikGYdaxza/JGS/ILo22o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lrqnWAYO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lrqnWAYO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980dc26022so32116865e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786961707; x=1787566507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOxzGmMal27EeaJMwS+enIkrJ4wpyBeUYl/DuJWKH74=;
        b=lrqnWAYOtzPOD7nJWFCrIn690t3Jgz0WtUASxW/GtjcKMaLHSz2LzlcBn5wdjU0Y5f
         7+uvGUdtPldnVmiMdPz9I1HL5auiclBGkmxGRbAnVDU87hgK3r28B/muhgbhCogIp8XE
         ucun7GY5KDRnmMi9Ajae4ATcuflKd/ZUwGXWyayVIYwV/50l3ay0nnvJ4Y/fDDmco0OE
         fqx+0mVAcp27yZ4gv9vSkkUJcTdH9QCT8cn0JP3ZMfsDLIMqhcUQm3dfKRmxq3EoM1fx
         +FB3s/zcQUKo7i4jARtsjX8idtdHJLveDWM2RLaIQEnr4aH8FymOEK+uqPTIL2WZVhYA
         8LBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961707; x=1787566507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOxzGmMal27EeaJMwS+enIkrJ4wpyBeUYl/DuJWKH74=;
        b=A2ohjgnNjJfocBys215hhIxgaqo/ITQuKlVrJ0hUfB+cX6HWNY6fljyCoXGPFYr4LM
         7CY5jQAiTnaDGKAex7qFHbYUSiG0qT5HxkAvl/zDU0AUw9lB3EWW6VepCrpDT+Y7mrHG
         R1pqEGUjrl1w6kKavtddh7sIjHcccw3AF+qtDFqye3P8oI416Ud12pAjjD348euJXArx
         VPQ0B3kvyREfyF11dWb/ALG2PbBD528ZYdPs8Mvbcr0WU4Lqui6GH+YD13lMXos5kPAP
         mgfRl7ecPwLQ4Nb45mVRlpZ1lNZl6t0M2XURglTezd0O6IFtxYDYjyi1w80nX9+0w2Vy
         dJUw==
X-Gm-Message-State: AOJu0YwT0yeVApvjfyS91HOIOWKlitijoeFml8TR/1ltGAVvG9YrzwyX
	tayDMo2mw103vHMAp57Znfq+ggggpHaZ9GX1vD38BEeUMfUsc07xsXkT65nxyKLtArI=
X-Gm-Gg: AR+sD12r9Gp+Llg1DlEtsAgPpBPTvgvpQ+Vl3t0D3iR1BSAWLTAnwtIJXZjT5wGF1lJ
	NgdYuQl5BmAtuS2H0JZr3+YqziHkDRpbI53wFalPhClgT5bPmb5lIL2wBoqv0Q/yGK5A51SNXF3
	suS3ckQHxLy9eIYhBm/VrmcaLl+fzmZgj3EVPAx0riGRNPK2O/Pk9ydPNvCmJB/yCQNFVpKkTvn
	BmIUYHMXDMGhsUZOqRbDukadtoHJm5g3CUKGPpsx6v3/GjqfD7d3A/gJ2bBdGWZMJfwEb9drA+N
	T4iNoW1Y1jodrGExqG9X3NU/85TZgVTawFXv86toci5fqMlsIlvnjBQHZDCRY5N+woIh7NJjQeq
	KlXxeS6OAemaThJTwvG3jLMdzQ4zW7JREax5LJSlvq3DZ32oOmF25POjYeOBXaevIIyBp6mD55w
	PoQwO0vvTxrzwyqCJmRcD6r592JMNSOUHkjhiwZImtge0dOZ3QhvJOJnCrG9upBYPpuBW/uLoEL
	jgBFCXBfNXGg+M2/N0rBwoI6Vr0s8NXZ3JW1zOJBsMp5cesEbDr4ivdcAcpmUZJ2vuskr+yKkX6
	b+EtNnqMAUTkyq8vziiivQ9u/S4ZwCrUdWzrar8Z
X-Received: by 2002:a05:600c:5299:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4998d7aeb77mr283748675e9.2.1786961706896;
        Mon, 17 Aug 2026 03:15:06 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d06167csm29542255e9.3.2026.08.17.03.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:15:06 -0700 (PDT)
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
Subject: [PATCH v7 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Date: Mon, 17 Aug 2026 13:14:45 +0300
Message-ID: <20260817101455.3526260-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817101455.3526260-1-sbogdanov@baylibre.com>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
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
 Documentation/hwmon/tps25990.rst |  15 ++--
 drivers/hwmon/pmbus/tps25990.c   | 126 ++++++++++++++++++++++++++++---
 2 files changed, 124 insertions(+), 17 deletions(-)

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
index 7634ac743025..0d5c99053f23 100644
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
+			int rng = (FIELD_GET(TPS1689_VIN_OV_RANGE_SEL_MASK, ret) + 1) *
+				   TPS1689_VIN_RANGE_SPAN_MV;
+			int vov = FIELD_GET(TPS1689_VIN_VOV_MASK, ret) * TPS1689_VIN_VOV_STEP_MV;
+
+			ret = DIV_ROUND_CLOSEST(rng + vov - TPS1689_VIN_RANGE_SPAN_MV,
+						TPS1689_VIN_SCALING);
+		}
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
@@ -238,6 +256,8 @@ static int tps25990_read_word_data(struct i2c_client *client,
 static int tps25990_write_word_data(struct i2c_client *client,
 				    int page, int reg, u16 value)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
 	int ret;
 
 	switch (reg) {
@@ -249,26 +269,52 @@ static int tps25990_write_word_data(struct i2c_client *client,
 	case PMBUS_OT_WARN_LIMIT:
 	case PMBUS_OT_FAULT_LIMIT:
 	case PMBUS_PIN_OP_WARN_LIMIT:
-		value >>= TPS25990_8B_SHIFT;
+		value = clamp_val((s16)value, 0, S16_MAX) >> TPS25990_8B_SHIFT;
 		value = clamp_val(value, 0, 0xff);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
 	case PMBUS_VIN_OV_FAULT_LIMIT:
-		value -= TPS25990_VIN_OVF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
-					  TPS25990_VIN_OVF_NUM);
-		value = clamp_val(value, 0, 0xf);
+		if ((s16)value < 0)
+			return -EINVAL;
+
+		if (data->chip_id == tps25990) {
+			int tmp = (int)value - TPS25990_VIN_OVF_OFF;
+
+			tmp = clamp_val(tmp, 0, INT_MAX);
+			value = DIV_ROUND_CLOSEST((unsigned int)tmp * TPS25990_VIN_OVF_DIV,
+						  TPS25990_VIN_OVF_NUM);
+			value = clamp_val(value, 0, 0xf);
+		} else if (data->chip_id == tps1689) {
+			u32 scaled_value = value * TPS1689_VIN_SCALING + TPS1689_VIN_RANGE_SPAN_MV;
+			u32 rng_idx = scaled_value / TPS1689_VIN_RANGE_SPAN_MV;
+			u32 ov_set;
+
+			rng_idx = clamp_val(rng_idx, 1,
+					    FIELD_MAX(TPS1689_VIN_OV_RANGE_SEL_MASK) + 1);
+			ov_set = scaled_value - (TPS1689_VIN_RANGE_SPAN_MV * rng_idx);
+			ov_set = min_t(u32, ov_set / TPS1689_VIN_VOV_STEP_MV,
+				       FIELD_MAX(TPS1689_VIN_VOV_MASK));
+			value = FIELD_PREP(TPS1689_VIN_OV_RANGE_SEL_MASK, rng_idx - 1) |
+						FIELD_PREP(TPS1689_VIN_VOV_MASK, ov_set);
+		}
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
-	case PMBUS_IIN_OC_FAULT_LIMIT:
-		value -= TPS25990_IIN_OCF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
+	case PMBUS_IIN_OC_FAULT_LIMIT: {
+		int tmp;
+
+		if ((s16)value < 0)
+			return -EINVAL;
+
+		tmp = (int)value - TPS25990_IIN_OCF_OFF;
+		tmp = clamp_val(tmp, 0, INT_MAX);
+		value = DIV_ROUND_CLOSEST((unsigned int)tmp * TPS25990_IIN_OCF_DIV,
 					  TPS25990_IIN_OCF_NUM);
 		value = clamp_val(value, 0, 0x3f);
 		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
 		break;
+	}
 
 	case PMBUS_VIRT_SAMPLES:
 		value = clamp_val(value, 1, 1 << PK_MIN_AVG_AVG_CNT);
@@ -347,6 +393,60 @@ static const struct regulator_desc tps25990_reg_desc[] = {
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
@@ -389,7 +489,6 @@ static const struct pmbus_driver_info tps25990_base_info[] = {
 		.write_word_data = tps25990_write_word_data,
 		.read_byte_data = tps25990_read_byte_data,
 		.write_byte_data = tps25990_write_byte_data,
-
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
 		.reg_desc = tps25990_reg_desc,
 		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
@@ -398,12 +497,14 @@ static const struct pmbus_driver_info tps25990_base_info[] = {
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
@@ -438,6 +539,7 @@ static int tps25990_probe(struct i2c_client *client)
 
 	/* Adapt the current and power scale for each instance */
 	tps25990_set_m(&data->info.m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&data->info.m[PSC_CURRENT_OUT], rimon);
 	tps25990_set_m(&data->info.m[PSC_POWER], rimon);
 
 	return pmbus_do_probe(client, &data->info);
-- 
2.43.0

