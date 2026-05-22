Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F423A874F
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438257; cv=none; b=c3KLgZXNMTVJHKSInZifmTextXwpT+IHiRmKjz93wLmR/YUIzeK0Rl1BWXWJNP1ttHCy3juoQkC5IfuYlJlQ9h72bqxJ8ZZlBoL3N7JcpHutwAQYNv45WO6+PeLHh0kCy52LFvrH8ec3ntDSLrFJTVWTL1l0cb6Z6StKh24RW+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438257; c=relaxed/simple;
	bh=F6h6fV01hp9PJV8gFlqtWxLuKwFUN4erj6TBZARNopo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sL3sqeg2zrrSr+yt3JKLDLjB/qH9/9T3FloM9THIOEpKjj4mbI/Rvpdsl7nqNUOAWwThOcsk6PS/OVPc/NoDR3C1iSarya8ujxZ1cFRod8pyuWWoc3ubYgFfnAj63DuhNXJDrruxfCyZb/BHUjdVydxu7f/drd0qzcRtYxbs99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AcbTH99/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AcbTH99/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd11a3729e8so1105334266b.0
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438253; x=1780043053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pc7v6T04K7etDmA+oCn6BtDAzikOAUdVkaaMS5hlOw=;
        b=AcbTH99/6iHgE/7yxgvQ3HDm+AbCOYLO28ysFxgAYY1s0L1+RSGMklYI4hBxsH2Kkt
         P7k0DUgTRjC2/fJcm4I98nPmhR34GpqXQhT5uzE1fHvwINDAxTQOgvmrsIJnusBlmyzh
         aYluIAhUCUBiYm0j2Qe9LgPb+nq0T2qeqeHv9bOi2S10IvXPN/8fk0T5Pn6bb+cP7z2U
         5eEvjl6LTSgUDWhmZ2msFaMjHUWMkiq7yOLqc03HTqJmEKm6arF84Ace0JMNpaZ0hpPT
         rlbtoJkrAfkTyJlK4xSp5sIfb49SpReAmPe9JKsUcryWOl5IdeA690Q8lFNz4q0UUXMB
         xbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438253; x=1780043053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Pc7v6T04K7etDmA+oCn6BtDAzikOAUdVkaaMS5hlOw=;
        b=bjXEVguqkxo9NqFklwMLZ90m550oHIzsXw0J7GQtgqQ1vW1yddYPptMxFMprQz4Bgo
         b1rfzIaC0NoH+Y1vLVUYj/k/UNWTfdpxWjlHhNyn7mv5LsRAqNNFzp8K04TA806nxJ61
         uCo/ROUP+DMgxG3EiGi7UrG7vqcecboVggQj4YPk35i8kzaNVjD+DI7SO+ArgnsWsF0l
         p7pXyWVdqUegnsizalcgs5poKrpieiRVRs0JSW32UHmjz+AAliFtxiUq9stUhmUgYqPn
         cxTHyCzK2ziIG1ZAsc4D207Bn8LDvnr3l4qadMKOWY5B618S4Cb7eoqp/oU+lyPZld8j
         VEEA==
X-Gm-Message-State: AOJu0Yx/t47QrQXUGOphtinU89icUanjpstmGbhP3ukQl4O1VabVG5Jp
	EZyJAQCjeM7eK3Sci+A2/ARi5LMG1h8ciyudLF8N8SivBc0cgR4BB904bg4AzYm2X2s=
X-Gm-Gg: Acq92OF/OZVNs4O8wNk4dOrPyzOxBC9Eo6LmbpYj+qJUX/Lo35iD2JZ4oCmZs3aCRRj
	Y/CQNHA994EdI5l+n2yD/VfvjFK35QKBxmc7CsLBHy5onedCd2VjlKtinNStEGhKEYEKdOvFQdn
	zcC6dyXKFvrpT7se2kkFmmzxX7S7JC0vaLwx9SqCqmUd72tC3Dw7Ic1+/x0JIGmEiKgjVhJKrx8
	ZX83QmMdTm1ioWg3DFXJaKWiaWaTNRjPz74ekkujNw5jCj2+35NObAoCd+t0M9LWHw2p6X5rqWx
	yPWZJnx7s9nWq+s63Tq9+zaf24wrFunegFWIiT23eVAWIzjt8BN8ZFpV4Ydu1tCmqi/40692AS8
	ULiDNDVDLSz3gxnJvyEU9fjldm2K38GcI7ltoOp42sAT8DxUbnEH2kQlRf03i7Rikc7EmQOIxxw
	DgUgFRAaiqlZrULIJjbO1UzhlglX+YV8eNLvpYCtWeQEL2+nooRgb/FGTfyeuX6xVK3e55WPOfQ
	U+FtRnGzNI=
X-Received: by 2002:a17:907:60cb:b0:bda:e47:70c6 with SMTP id a640c23a62f3a-bdd22944feamr174206766b.1.1779438252846;
        Fri, 22 May 2026 01:24:12 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:12 -0700 (PDT)
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
Subject: [PATCH v4 2/4] hwmon: (pmbus/tps25990): Rework TPS25990 direct conversion handling
Date: Fri, 22 May 2026 11:23:37 +0300
Message-ID: <20260522082349.2749970-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082349.2749970-1-sbogdanov@baylibre.com>
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the existing implementation of direct format conversion for
TPS25990 non-standard parameters to improve code reusability and
integration with the PMBus direct conversion helpers.

Changes include:
 - Add an enum describing the supported parameters
 - Add structure to hold m, b, R per-device coefficients
 - Add data structures for pmbus_driver_info and local direct values
 - Use the generic PMBus conversion helpers:
     pmbus_reg2data_direct_calc()
     pmbus_data2reg_direct_calc()
 - Replace previously used defines with structured data

This reduces duplicated conversion logic and makes handling of
non-standard parameters more maintainable.

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 drivers/hwmon/pmbus/tps25990.c | 197 +++++++++++++++++++++------------
 1 file changed, 127 insertions(+), 70 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 05c6288ecafc..1e252844217b 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -36,17 +36,63 @@
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
 
+enum chips {
+	tps25990,
+};
+
+enum tps25990_parameters {
+	TPS25990_VIN_OVF = 0, /* VIN over volatage fault */
+	TPS25990_IIN_OCF, /* IIN Over currect fault */
+	TPS25990_DIRECT_VALUES_COUNT,
+};
+
+struct tps25990_local_direct_value {
+	int m[TPS25990_DIRECT_VALUES_COUNT]; /* mantissa */
+	int b[TPS25990_DIRECT_VALUES_COUNT]; /* offset */
+	int R[TPS25990_DIRECT_VALUES_COUNT]; /* exponent */
+};
+
+struct tps25990_data {
+	struct pmbus_driver_info info;
+	struct tps25990_local_direct_value info_local;
+};
+
+static s64 tps25990_reg2data_direct(struct i2c_client *client, int param, s32 raw)
+{
+	struct pmbus_driver_info *info = i2c_get_clientdata(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
+	struct tps25990_local_direct_value *info_local = &data->info_local;
+	s64 b, val;
+	s32 m, R;
+
+	val = (s16)raw;
+	m = info_local->m[param];
+	b = info_local->b[param];
+	R = info_local->R[param];
+
+	return pmbus_reg2data_direct_calc(val, b, m, R);
+}
+
+static u16 tps25990_data2reg_direct(struct i2c_client *client, int param, s64 val)
+{
+	struct pmbus_driver_info *info = i2c_get_clientdata(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
+	struct tps25990_local_direct_value *info_local = &data->info_local;
+	s32 m, R;
+	s64 b;
+
+	m = info_local->m[param];
+	b = info_local->b[param];
+	R = info_local->R[param];
+
+	return pmbus_data2reg_direct_calc(val, b, m, R);
+}
+
 /*
  * Arbitrary default Rimon value: 1kOhm
  * This correspond to an overcurrent limit of 55A, close to the specified limit
@@ -184,9 +230,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_word_data(client, page, phase, reg);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
-					TPS25990_VIN_OVF_DIV);
-		ret += TPS25990_VIN_OVF_OFF;
+		ret = tps25990_reg2data_direct(client, TPS25990_VIN_OVF, ret);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
@@ -198,9 +242,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
-					TPS25990_IIN_OCF_DIV);
-		ret += TPS25990_IIN_OCF_OFF;
+		ret = tps25990_reg2data_direct(client, TPS25990_IIN_OCF, ret);
 		break;
 
 	case PMBUS_VIRT_SAMPLES:
@@ -246,17 +288,13 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		break;
 
 	case PMBUS_VIN_OV_FAULT_LIMIT:
-		value -= TPS25990_VIN_OVF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
-					  TPS25990_VIN_OVF_NUM);
+		value = tps25990_data2reg_direct(client, TPS25990_VIN_OVF, value);
 		value = clamp_val(value, 0, 0xf);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
-		value -= TPS25990_IIN_OCF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
-					  TPS25990_IIN_OCF_NUM);
+		value = tps25990_data2reg_direct(client, TPS25990_IIN_OCF, value);
 		value = clamp_val(value, 0, 0x3f);
 		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
 		break;
@@ -337,63 +375,76 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
-static const struct pmbus_driver_info tps25990_base_info = {
-	.pages = 1,
-	.format[PSC_VOLTAGE_IN] = direct,
-	.m[PSC_VOLTAGE_IN] = 5251,
-	.b[PSC_VOLTAGE_IN] = 0,
-	.R[PSC_VOLTAGE_IN] = -2,
-	.format[PSC_VOLTAGE_OUT] = direct,
-	.m[PSC_VOLTAGE_OUT] = 5251,
-	.b[PSC_VOLTAGE_OUT] = 0,
-	.R[PSC_VOLTAGE_OUT] = -2,
-	.format[PSC_TEMPERATURE] = direct,
-	.m[PSC_TEMPERATURE] = 140,
-	.b[PSC_TEMPERATURE] = 32100,
-	.R[PSC_TEMPERATURE] = -2,
-	/*
-	 * Current and Power measurement depends on the ohm value
-	 * of Rimon. m is multiplied by 1000 below to have an integer
-	 * and -3 is added to R to compensate.
-	 */
-	.format[PSC_CURRENT_IN] = direct,
-	.m[PSC_CURRENT_IN] = 9538,
-	.b[PSC_CURRENT_IN] = 0,
-	.R[PSC_CURRENT_IN] = -6,
-	.format[PSC_POWER] = direct,
-	.m[PSC_POWER] = 4901,
-	.b[PSC_POWER] = 0,
-	.R[PSC_POWER] = -7,
-	.func[0] = (PMBUS_HAVE_VIN |
-		    PMBUS_HAVE_VOUT |
-		    PMBUS_HAVE_VMON |
-		    PMBUS_HAVE_IIN |
-		    PMBUS_HAVE_PIN |
-		    PMBUS_HAVE_TEMP |
-		    PMBUS_HAVE_STATUS_VOUT |
-		    PMBUS_HAVE_STATUS_IOUT |
-		    PMBUS_HAVE_STATUS_INPUT |
-		    PMBUS_HAVE_STATUS_TEMP |
-		    PMBUS_HAVE_SAMPLES),
-	.read_word_data = tps25990_read_word_data,
-	.write_word_data = tps25990_write_word_data,
-	.read_byte_data = tps25990_read_byte_data,
-	.write_byte_data = tps25990_write_byte_data,
+static struct tps25990_local_direct_value tps25990_local_info[] = {
+	[tps25990] = {
+		.m[TPS25990_VIN_OVF] = 10163,
+		.b[TPS25990_VIN_OVF] = -30081,
+		.R[TPS25990_VIN_OVF] = -4,
+		.m[TPS25990_IIN_OCF] = 9538,
+		.b[TPS25990_IIN_OCF] = 0,
+		.R[TPS25990_IIN_OCF] = -6,
+	},
+};
+
+static struct pmbus_driver_info tps25990_base_info[] = {
+	[tps25990] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 5251,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 5251,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = -2,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 140,
+		.b[PSC_TEMPERATURE] = 32100,
+		.R[PSC_TEMPERATURE] = -2,
+		/*
+		 * Current and Power measurement depends on the ohm value
+		 * of Rimon. m is multiplied by 1000 below to have an integer
+		 * and -3 is added to R to compensate.
+		 */
+		.format[PSC_CURRENT_IN] = direct,
+		.m[PSC_CURRENT_IN] = 9538,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -6,
+		.format[PSC_POWER] = direct,
+		.m[PSC_POWER] = 4901,
+		.b[PSC_POWER] = 0,
+		.R[PSC_POWER] = -7,
+		.func[0] = (PMBUS_HAVE_VIN |
+			    PMBUS_HAVE_VOUT |
+			    PMBUS_HAVE_VMON |
+			    PMBUS_HAVE_IIN |
+			    PMBUS_HAVE_PIN |
+			    PMBUS_HAVE_TEMP |
+			    PMBUS_HAVE_STATUS_VOUT |
+			    PMBUS_HAVE_STATUS_IOUT |
+			    PMBUS_HAVE_STATUS_INPUT |
+			    PMBUS_HAVE_STATUS_TEMP |
+			    PMBUS_HAVE_SAMPLES),
+		.read_word_data = tps25990_read_word_data,
+		.write_word_data = tps25990_write_word_data,
+		.read_byte_data = tps25990_read_byte_data,
+		.write_byte_data = tps25990_write_byte_data,
 
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
-	.reg_desc = tps25990_reg_desc,
-	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+		.reg_desc = tps25990_reg_desc,
+		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
 #endif
+	},
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
-	{ "tps25990" },
+	{ "tps25990", tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
-	{ .compatible = "ti,tps25990" },
+	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps25990_of_match);
@@ -401,8 +452,9 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
 static int tps25990_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct pmbus_driver_info *info;
+	struct tps25990_data *data;
 	const char *propname;
+	enum chips chip_id;
 	u32 rimon;
 	int ret;
 
@@ -415,15 +467,20 @@ static int tps25990_probe(struct i2c_client *client)
 		rimon = TPS25990_DEFAULT_RIMON;
 	}
 
-	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
-	if (!info)
+	chip_id = (enum chips)(unsigned long)i2c_get_match_data(client);
+
+	data = devm_kzalloc(dev, sizeof(struct tps25990_data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
+	data->info = tps25990_base_info[chip_id];
+	data->info_local = tps25990_local_info[chip_id];
+
 	/* Adapt the current and power scale for each instance */
-	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
-	tps25990_set_m(&info->m[PSC_POWER], rimon);
+	tps25990_set_m(&data->info.m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&data->info.m[PSC_POWER], rimon);
 
-	return pmbus_do_probe(client, info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static struct i2c_driver tps25990_driver = {
-- 
2.43.0

