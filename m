Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABA2E03F2
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315936; cv=none; b=oP4ocuP8FqucxqlpJGwccnDzd53dprRUugK2XY3g6blWsG3DFTLOV427tH/bxg7nAklFBlW2R4lOkZhnzTLjLHPT8mbj7RKFGNrdol5tMiCb35fdGYM8oLxpoMrbQvQDh1QbjIOnsXGEhhK/yMIM7KKXJYpHuR7kHIT8Ed2F/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315936; c=relaxed/simple;
	bh=S8Cd2E8SKugiVyOxMAARAlFbe35TOZ5k+jrtw5MSFHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nu4S25cNViXomCgvK6VIwPAOH1VUH6acIuC4vh0oKycgfxfCWT/b1BkNp2wOYKR/2e/MD372gixKWmJcexU1hH0RbYmJTkiWx+wN9CY6r8wlx++P+8hEGQa8aXUbLBMbZ9azAQ8PSbu2pJARKz0dOdUDOtCrOTE8ugLiBYSRWUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cgUBJ5MB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cgUBJ5MB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-435f177a8f7so4251727f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 00:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771315933; x=1771920733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f64XWOiLeopfzc8m0vbWs3v53yiP6RzpjdTcY0IqlPk=;
        b=cgUBJ5MBzOnccyxBEGrchpD5ZArfBjNucd/kJXMUWTIcFLFBASq/YNtUT6EvzQd0hP
         5xGN6HeQz2xJBmL2au7pE0fVqjjCsT7YR7JdRqngQMa86+27+jhPyxDEejwTNhBuXiaG
         1Bn7TDolS7l/X4E3xSDL4+JJ2PQ5riULtSPK4PSTumbuJmMaodWyoT/iETDz28qS3QOM
         cybm4MbOy1dxXYrTLlmfGMNPcQlTZMmPF5Bo8ybP95Mu92gPWWnZjpZpDy9w7eKWkh45
         O9MBcy2NtfOAbtC7YLVXdji8pRIDAff9FIyguA83GMXfTlLJ3zgXtlb0/Q96Ney7t+m3
         s/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315933; x=1771920733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f64XWOiLeopfzc8m0vbWs3v53yiP6RzpjdTcY0IqlPk=;
        b=LwiJs0j7eN7BJZFgAuyIjEfKgqQSARXVwDNETPKor/zxvT9dESgODvpzBufXbqXyQQ
         txHROPUWpQSrHABKj5nS+zIXP0eljltAahjWXj20ctIchJ2sR9jAz9UOTfQjeSMgM6lB
         uLK1HJkIDadhWaTVsjbq68CMPaUnPnWRkGsTpV8Y53g50hyyNvYQ5A83U/DFCh9h/OwP
         g16AUGpQ4xRUoKP87gf6tnX0YdT1mq02qsJ0OvBBA4Es8f2Xn5ipbwESa+y+1p7bOcVi
         EsHWRM3AKqCeOZxcGZk+AbPec0lNxEZR+/lwNL7nfh6D63dhELUfHWne/Jn2dkMKhN4x
         xnXA==
X-Gm-Message-State: AOJu0YyHf18D+8uktdb2PHdx32otsmmWg5/eYel5ZSvErtCwD2tQYn8c
	kSz0elJM0eK+DOoByfwOJzl+hj01w/DLgQRiU5Rjz5eFAdHqdR+OQCqz0arEfrsDx+G+M1Td3ks
	AyX84Sy0=
X-Gm-Gg: AZuq6aLC4x5ecUF5o3vQH5bFOVm4s/BMTCcIxx270rJszfSzcLqREncjhaqP44fAYFG
	24Uft1bHp3NeZASKUcIzuZ5QxB0rGqTYM8PIADM3RaHgtuguncprWeuJ5RQxYUg6co7g4f29AkH
	aV+8DVbYX4GeF3kKH0cNpsxEp3haVNS2s/qc88YhFFrwX9qGlA3Getyu4bUlMMSkUiFEAsqwoKD
	nPFwbDR7OgalVpho09OmP5nLUU4VVXgq92l6yCIUdXvTB8yoWf+yn2W5I6FdI1FHgJBLXT01G8c
	iQTzBtuG2RtU9tEs/Ek7u5EYsb+KHPSq9FO2F7GQWfOg5d3PH6BZI68V5UZUHLj2Ih1w97fXijW
	N0cYjtlpAcnN1kgcq5bgSd2N+E8wzhwZHHmG0pWpxgaYf+xQm6PUv4gDxYjaqTOtNLSrPAnL/aE
	8L64aTUv8Q1Eqrjhq5y+dtb64Vn42BpgU3FFgC3WaOuLOzCQEQMIBaGi5yZ0TFY17NovWl9ABkr
	luum7im2Q==
X-Received: by 2002:a05:6000:2001:b0:435:96ec:679e with SMTP id ffacd0b85a97d-4379db61cccmr19577529f8f.23.1771315932698;
        Tue, 17 Feb 2026 00:12:12 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm35757690f8f.5.2026.02.17.00.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:12:12 -0800 (PST)
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
Subject: [PATCH v3 3/3] hwmon: (pmbus/tps1689): Add TPS1689 support
Date: Tue, 17 Feb 2026 10:12:03 +0200
Message-Id: <20260217081203.1792025-4-sbogdanov@baylibre.com>
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

Extend tps25990 existing driver to support tps1689 eFuse,
since they are sharing command interface and functionality
Update documentation for tps1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 Documentation/hwmon/tps25990.rst | 15 ++++--
 drivers/hwmon/pmbus/tps25990.c   | 91 ++++++++++++++++++++++++++++----
 2 files changed, 92 insertions(+), 14 deletions(-)

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
index 33f6367f797c..f9ff4edadf53 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -58,34 +58,38 @@ struct tps25990_data {
 	struct local_direct_value *info_local;
 };
 
-static int tps25990_raw_to_value(struct i2c_client *client, int param, int raw)
+static int tps25990_raw_to_value(struct i2c_client *client, int param, u32 raw)
 {
 	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
 	struct local_direct_value *info_local = data->info_local;
+	int val;
 
 	/* Formula : X = (Y / 10^R - b) / m */
 	if (info_local->R[param] >= 0)
-		raw /= int_pow(10, info_local->R[param]);
+		val = DIV_ROUND_CLOSEST_ULL(raw, int_pow(10, info_local->R[param]));
 	else
-		raw *= int_pow(10, -info_local->R[param]);
+		val = raw * int_pow(10, -info_local->R[param]);
 
-	return DIV_ROUND_CLOSEST(raw - info_local->b[param], info_local->m[param]);
+	val = DIV_ROUND_CLOSEST(val - info_local->b[param], info_local->m[param]);
+
+	return val;
 }
 
 static unsigned int tps25990_value_to_raw(struct i2c_client *client, int param, int val)
 {
 	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
 	struct local_direct_value *info_local = data->info_local;
+	u32 raw; // return raw up to u16 -> u32
 
 	/* Formula : Y = ( m * X + b) * 10^R */
-	val = (long)val * info_local->m[param] + info_local->b[param];
+	raw = ((long)val * info_local->m[param]) + info_local->b[param];
 
 	if (info_local->R[param] >= 0)
-		val *= int_pow(10, info_local->R[param]);
+		raw *= int_pow(10, info_local->R[param]);
 	else
-		val = DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R[param]));
+		raw = DIV_ROUND_CLOSEST_ULL(raw, int_pow(10, -info_local->R[param]));
 
-	return val;
+	return raw;
 }
 
 /*
@@ -281,7 +285,6 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		value = clamp_val(value, 0, 0xff);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
-
 	case PMBUS_VIN_OV_FAULT_LIMIT:
 		value = tps25990_value_to_raw(client, TPS25990_VIN_OVF, value);
 		value = clamp_val(value, 0, 0xf);
@@ -370,6 +373,15 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
+struct local_direct_value tps1689_local_info = {
+	.m[TPS25990_VIN_OVF] = 3984,
+	.b[TPS25990_VIN_OVF] = -63750,
+	.R[TPS25990_VIN_OVF] = -3,
+	.m[TPS25990_IIN_OCF] = 7111,
+	.b[TPS25990_IIN_OCF] = -2133,
+	.R[TPS25990_IIN_OCF] = -2,
+};
+
 struct local_direct_value tps25590_local_info = {
 	.m[TPS25990_VIN_OVF] = 10163,
 	.b[TPS25990_VIN_OVF] = -30081,
@@ -379,6 +391,60 @@ struct local_direct_value tps25590_local_info = {
 	.R[TPS25990_IIN_OCF] = -6,
 };
 
+static struct pmbus_driver_info tps1689_base_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.m[PSC_VOLTAGE_IN] = 1166,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.m[PSC_VOLTAGE_OUT] = 1166,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_TEMPERATURE] = 140,
+	.b[PSC_TEMPERATURE] = 32103,
+	.R[PSC_TEMPERATURE] = -2,
+	/*
+	 * Current and Power measurement depends on the ohm value
+	 * of Rimon. m is multiplied by 1000 below to have an integer
+	 * and -3 is added to R to compensate.
+	 */
+	.format[PSC_CURRENT_IN] = direct,
+	.m[PSC_CURRENT_IN] = 9548,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = -6,
+	.format[PSC_CURRENT_OUT] = direct,
+	.m[PSC_CURRENT_OUT] = 24347,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -3,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 2775,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -4,
+	.func[0] = (PMBUS_HAVE_VIN |
+		    PMBUS_HAVE_VOUT |
+		    PMBUS_HAVE_VMON |
+		    PMBUS_HAVE_IIN |
+		    PMBUS_HAVE_PIN |
+		    PMBUS_HAVE_TEMP |
+		    PMBUS_HAVE_STATUS_VOUT |
+		    PMBUS_HAVE_STATUS_IOUT |
+		    PMBUS_HAVE_STATUS_INPUT |
+		    PMBUS_HAVE_STATUS_TEMP |
+		    PMBUS_HAVE_SAMPLES),
+
+	.read_word_data = tps25990_read_word_data,
+	.write_word_data = tps25990_write_word_data,
+	.read_byte_data = tps25990_read_byte_data,
+	.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+	.reg_desc = tps25990_reg_desc,
+	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+};
+
 static struct pmbus_driver_info tps25990_base_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -428,18 +494,25 @@ static struct pmbus_driver_info tps25990_base_info = {
 #endif
 };
 
+struct tps25990_data data_tps1689 = {
+	.info = &tps1689_base_info,
+	.info_local = &tps1689_local_info,
+};
+
 struct tps25990_data data_tps25990 = {
 	.info = &tps25990_base_info,
 	.info_local = &tps25590_local_info,
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ .name = "tps1689", .driver_data = (kernel_ulong_t)&data_tps1689 },
 	{ .name = "tps25990", .driver_data = (kernel_ulong_t)&data_tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps1689", .data = &data_tps1689 },
 	{ .compatible = "ti,tps25990", .data = &data_tps25990 },
 	{}
 };
-- 
2.34.1

