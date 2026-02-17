Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137D2DBF40
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315933; cv=none; b=OF7ChYf+U9JmX1i5xY9achn9irm2ATAQhZFJB5VdKpHI3pzkFTAZOEkjJWysv1dNzDgi8O0BJHC4fnagLuN4O5w9RopVe5HhKzfi3RWCWqWhXQCOpuihGiT0P2pNhBzYwagLSIsE9AHmRV9qaKXcdDKozEcGdW+meCyX1QQXnWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315933; c=relaxed/simple;
	bh=MBxXvm9SN85wIbPQozevHNwhIzjPtliVSJlxB+6iP8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VbH0w/SKswxyIDoNder8jHzqGU7/8DDbQERLWK0IJE2uEgYLCdLx78Mavli+A1RRckkUIOdX+hHt3cxXdowuJHSN6uT17cWBekRsSP00kzyy29YL/5zwFoLDTNFFjyQZiNgJIio6OqxKAMQdj8B4ltNHREf1nx9auG1AfC4QLLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CGEhoovy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CGEhoovy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43638a33157so3795445f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 00:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771315931; x=1771920731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkpDAlBYfnDGxcVrWynzmo5K/OoXZi98TxFwnjNQDvI=;
        b=CGEhoovyrTXMH3AGZk2ioO/R21qCAlzaHC+2A16Mf4inI7GtLktrKRTdTA/ayTqeVz
         vmUzKjuG845s16Fest5iKf7P8To540+UB8NLWZ8sdSTMgnMxtV8kCd+5oTQQtiLJQVIp
         xGsC874JgyTizIek/XIQryT5M9rX6KNE96LvS72Jfj10UC7NxCsExUVvSCv+tCu7VDI5
         govp1pXa8oyj1aL06273xXk2KBU2XnSYuEwfoYSlGjO/1E+LiZpwB/h3SBWPrd6PA4Eh
         BN+UN283Z49PBY4uIlasQHhCMXB4Qe4d4KKRwA8doiwPTMxcPAFMtXylRDo6ii7cIPUW
         hldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315931; x=1771920731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nkpDAlBYfnDGxcVrWynzmo5K/OoXZi98TxFwnjNQDvI=;
        b=io8fVyIrNJoHr6K32bTKzAIDMMDxlk5MAqurGCDGEB/JK4e7NGCoTHtqOnvNZw13aC
         A1WyoRF/7naF5HbwDXNlm8LH+XB1fU45B1otClh77JevH5pvAxKyA135WEsnw3N++J1J
         CbcK92dRZZbu7sT6qswFble6TQYiK2vA+x85BcYzrmEZMk9Gsy5H39tAvqZL3JLtxBCp
         atx6tdPP4NHaIjKEUPuH7bBVQWo88vbML+8IlsF8N6mINv32RluX6tf2V95iYGeQdqPb
         EJyCiXS2epL/bNVC7Ve502l0KLT7g5a69sHW4WDE9gNrkcNMkZ4OrJMBJTEtm4zZIUYJ
         yMcw==
X-Gm-Message-State: AOJu0Yy1U3Z26ELaqEB1RsNn1MIxTV+LJ8t0i6y0nB/ll7j9qXSaaI29
	I3rQAGumyq1+YRrfjcD/oQHdNeUzD6CePvxYi8R9pdGtsd3mG7QH3YgLU7M9g8wt860=
X-Gm-Gg: AZuq6aJGGxzJXy4VU0ZadUoFB+xVivn/vgZukeVmHBEYlvWHIH3O4bgGggXf2EiU6R0
	g3X7rbezJBb3IAS5/a98yTe4pjWy2xV9ipjAKSWiQ6D9V9/YiMhOxBwUxwvd/tdQvsQlSVqisOg
	E4QJmTjfAVz8qXJW18xFzteGrIVG5PBVFcsiB6rtjt4xvDgBmVspVxeeXNQeeqdFnf8I+e6HHQg
	Fu/Ot7YETqYBwEOxVfaxyQ6BuspQVkkgWja7KFvECy//9pqh3RnzPmQKrK7QfmJhaFgViQS7KLL
	Hi8KzkEkZTFBtekNHOaO5N1nOPpu1Mli8g7qJlDewbGYxmINtrlfvPDhNgAAoYz5G/xDCOgnmLN
	q+g0XuBOd9nLiNFo4Wq8GJ0KNSq8o/Qv2rBexyfDTCchYtlt+GAapsW4GGMwj6RK5NhYi8DDI0U
	MC9z9qBKaqRBtRmESLCNGadAaJCKlrmP67O8OysPHG+baqzYxg9juptyyUr/TDer/79PdZSeqXl
	8fGPZ15cZK8398NhI9B
X-Received: by 2002:a05:6000:4203:b0:437:8fc0:8802 with SMTP id ffacd0b85a97d-4379793d751mr24549679f8f.48.1771315930539;
        Tue, 17 Feb 2026 00:12:10 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm35757690f8f.5.2026.02.17.00.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:12:10 -0800 (PST)
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
Subject: [PATCH v3 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct conversion
Date: Tue, 17 Feb 2026 10:12:01 +0200
Message-Id: <20260217081203.1792025-2-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217081203.1792025-1-sbogdanov@baylibre.com>
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework existing implementation for calculation of direct
format conversion for TPS25990. With this implamentation
is leveraged code reusability for non standard parameters.
 - Add enum for parameter
 - Add m, b, R structure to hold value per device
 - Add data structure to hold for pmbus_driver_info and
   local_direct_values
 - Conversion functions are implemented according to formula from
   TPS25990 datasheet
 - Remove previously used defines replace with structure

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 drivers/hwmon/pmbus/tps25990.c | 115 +++++++++++++++++++++++++--------
 1 file changed, 88 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index c13edd7e1abf..33f6367f797c 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -36,17 +36,58 @@
 #define  TPS25990_UNLOCKED		BIT(7)
 
 #define TPS25990_8B_SHIFT		2
-#define TPS25990_VIN_OVF_NUM		525100
-#define TPS25990_VIN_OVF_DIV		10163
-#define TPS25990_VIN_OVF_OFF		155
-#define TPS25990_IIN_OCF_NUM		953800
-#define TPS25990_IIN_OCF_DIV		129278
-#define TPS25990_IIN_OCF_OFF		157
 
 #define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
 					 PK_MIN_AVG_RST_AVG  | \
 					 PK_MIN_AVG_RST_MIN)
 
+enum tps25990_parameters {
+	TPS25990_VIN_OVF = 0, /* VIN over volatage fault */
+	TPS25990_IIN_OCF, /* IIN Over currect fault */
+	TPS25590_DIRECT_VALUES_MAX, /* Max value ensure there enough space */
+};
+
+struct local_direct_value {
+	int m[TPS25590_DIRECT_VALUES_MAX]; /* mantissa for direct data format */
+	int b[TPS25590_DIRECT_VALUES_MAX]; /* offset */
+	int R[TPS25590_DIRECT_VALUES_MAX]; /* exponent */
+};
+
+struct tps25990_data {
+	struct pmbus_driver_info *info;
+	struct local_direct_value *info_local;
+};
+
+static int tps25990_raw_to_value(struct i2c_client *client, int param, int raw)
+{
+	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
+	struct local_direct_value *info_local = data->info_local;
+
+	/* Formula : X = (Y / 10^R - b) / m */
+	if (info_local->R[param] >= 0)
+		raw /= int_pow(10, info_local->R[param]);
+	else
+		raw *= int_pow(10, -info_local->R[param]);
+
+	return DIV_ROUND_CLOSEST(raw - info_local->b[param], info_local->m[param]);
+}
+
+static unsigned int tps25990_value_to_raw(struct i2c_client *client, int param, int val)
+{
+	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
+	struct local_direct_value *info_local = data->info_local;
+
+	/* Formula : Y = ( m * X + b) * 10^R */
+	val = (long)val * info_local->m[param] + info_local->b[param];
+
+	if (info_local->R[param] >= 0)
+		val *= int_pow(10, info_local->R[param]);
+	else
+		val = DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R[param]));
+
+	return val;
+}
+
 /*
  * Arbitrary default Rimon value: 1kOhm
  * This correspond to an overcurrent limit of 55A, close to the specified limit
@@ -184,9 +225,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_word_data(client, page, phase, reg);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
-					TPS25990_VIN_OVF_DIV);
-		ret += TPS25990_VIN_OVF_OFF;
+		ret = tps25990_raw_to_value(client, TPS25990_VIN_OVF, ret);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
@@ -198,9 +237,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
-					TPS25990_IIN_OCF_DIV);
-		ret += TPS25990_IIN_OCF_OFF;
+		ret = tps25990_raw_to_value(client, TPS25990_IIN_OCF, ret);
 		break;
 
 	case PMBUS_VIRT_SAMPLES:
@@ -246,17 +283,13 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		break;
 
 	case PMBUS_VIN_OV_FAULT_LIMIT:
-		value -= TPS25990_VIN_OVF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
-					  TPS25990_VIN_OVF_NUM);
+		value = tps25990_value_to_raw(client, TPS25990_VIN_OVF, value);
 		value = clamp_val(value, 0, 0xf);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
-		value -= TPS25990_IIN_OCF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
-					  TPS25990_IIN_OCF_NUM);
+		value = tps25990_value_to_raw(client, TPS25990_IIN_OCF, value);
 		value = clamp_val(value, 0, 0x3f);
 		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
 		break;
@@ -337,7 +370,16 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
-static const struct pmbus_driver_info tps25990_base_info = {
+struct local_direct_value tps25590_local_info = {
+	.m[TPS25990_VIN_OVF] = 10163,
+	.b[TPS25990_VIN_OVF] = -30081,
+	.R[TPS25990_VIN_OVF] = -4,
+	.m[TPS25990_IIN_OCF] = 9538,
+	.b[TPS25990_IIN_OCF] = 0,
+	.R[TPS25990_IIN_OCF] = -6,
+};
+
+static struct pmbus_driver_info tps25990_base_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
 	.m[PSC_VOLTAGE_IN] = 5251,
@@ -386,14 +428,19 @@ static const struct pmbus_driver_info tps25990_base_info = {
 #endif
 };
 
+struct tps25990_data data_tps25990 = {
+	.info = &tps25990_base_info,
+	.info_local = &tps25590_local_info,
+};
+
 static const struct i2c_device_id tps25990_i2c_id[] = {
-	{ "tps25990" },
+	{ .name = "tps25990", .driver_data = (kernel_ulong_t)&data_tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
-	{ .compatible = "ti,tps25990" },
+	{ .compatible = "ti,tps25990", .data = &data_tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps25990_of_match);
@@ -401,23 +448,37 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
 static int tps25990_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct pmbus_driver_info *info;
+	struct tps25990_data *data;
 	u32 rimon = TPS25990_DEFAULT_RIMON;
+	struct pmbus_driver_info *info_get;
+	struct local_direct_value *info_local_get;
 	int ret;
 
 	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
 	if (ret < 0 && ret != -EINVAL)
 		return dev_err_probe(dev, ret, "failed to get rimon\n");
 
-	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
-	if (!info)
+	data = (struct tps25990_data *)of_device_get_match_data(dev);
+	if (!data)
+		return -EOPNOTSUPP;
+
+	info_get = data->info;
+	/* Make copy of pmbus_info and replace it to preserve original values */
+	data->info = devm_kmemdup(dev, info_get, sizeof(*info_get), GFP_KERNEL);
+	if (!data->info)
+		return -ENOMEM;
+
+	info_local_get = data->info_local;
+	/* Make copy of pmbus_info and replace it to preserve original values */
+	data->info_local = devm_kmemdup(dev, info_local_get, sizeof(*info_local_get), GFP_KERNEL);
+	if (!data->info_local)
 		return -ENOMEM;
 
 	/* Adapt the current and power scale for each instance */
-	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
-	tps25990_set_m(&info->m[PSC_POWER], rimon);
+	tps25990_set_m(&data->info->m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&data->info->m[PSC_POWER], rimon);
 
-	return pmbus_do_probe(client, info);
+	return pmbus_do_probe(client, data->info);
 }
 
 static struct i2c_driver tps25990_driver = {
-- 
2.34.1

