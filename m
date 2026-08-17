Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435C3F6C2A
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961708; cv=none; b=KwJtQgp+oVKBx3Q1BXzCme/U8deyabEQwy7HhsUYd2t4ZB3zpaXgt6htkVtjgQibEypvS7ihCd6wKMrRURt5jTgt3UC+cX+6gC4RlGpQEncx9yRP4b9wpo/DTwdnR2c0kzD4/Ne29dmb/S9xHOvGMSmIfX3iV+rVIh9/hXn9rGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961708; c=relaxed/simple;
	bh=f5l2YBiHkReBw6mWMyjaq6Gvj9uLpAZQHQ7JL9lOPpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=quhGwcmD+zfdMyVJ0iJ1QGwGZZL3c2uTBOeeEec2IzHeDnU9sqUk0QXm2JrfepM8aCQiR+xAHEa4S0nlMYiJcoJ+uv04WkCBlEQCjKD56jJQOEf3fL9sEgPr+kdTwk+1zCXoRSjp2RfHN/Efq6YqUHMbJuGXTdaqu5noB56R+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Qxqtvd7r; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Qxqtvd7r"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4957eefd361so24410625e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786961703; x=1787566503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsOh5BrhIIUs/llyHwp9VM8wWS+EomkE8Zt9vFaD5xw=;
        b=Qxqtvd7rT81y/Y0ZH0wCx1SqG12II1z7nkNE5YwiVTFiutRPLCbVbNIFy+xfZKwhF0
         RUU/PivdVAvv60LgQdBI7pPuDJQTbIMyjoNoaTGpTMj7Qm/wColgA7UlO4DrFZE+5IeJ
         tFpmg75DCah+k9xhJG30AYANlAB3LlrqtFBPUHd8Y9psZx/9mdkF3UbFNB6Wxki4v4ya
         25jaWp6f+Bg4Nhqy1UFEW2iDkaXXOSHn1s3yxm8QbMgYUCehZ8ItY4ircR34Hs5X/Htp
         Eq09VrOuZOXVx6urMarjS6YlKQrE+Pq9Vliks3NJKaNprPIurc4FNyikYg/gGyDmuPkE
         3Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961703; x=1787566503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsOh5BrhIIUs/llyHwp9VM8wWS+EomkE8Zt9vFaD5xw=;
        b=ALLTbVVwfji4KgatEimv42z6ckE00oNNnXKECClrVKAMKBI7IYb9Uw5Y4TOlX/Pc6I
         Glx0ZRMZBB4bTzgcOUqQkOCQldvzKSb+YhwOYnWeOvKc8sitOWWRfFVhLXenazY7ZSqp
         /der5+/ZB/lVJz/toLbJ7LpSOs+xmf/umkNH8KTvF3rMtTFBaVZLfTKGlQktjsrEZ8l0
         ejTq671V5MAEq0vLAGamD3+IcDNm+qWndmBv0nbvGDiwBUrd0s84j9qJ6J5V9dQuYUCM
         ImGERs+aHQFjcpc7ENRBTifJ3jXPbWPEje/AUOBuqkZjw5s9YP5Po1SyVNEVLByEd7lv
         9oJg==
X-Gm-Message-State: AOJu0YyxbXIVX4OtcBn+gzpU1J88RAmBjVlz9kO9ZPVwpniaHxfcL86F
	PBYTosXsrU0o45rAiW6R4cDKT611NioA0RLSxk1/XZCu0EcHOBqIWocaNqLEOnvhsNU=
X-Gm-Gg: AR+sD10nACJnKRjAslJYDhd9Omeik+q1glbmG0DZ+6G8ujS8RUNDrrHoXuUUdS5twSu
	t2fhMRV1mJvWFEe4nNBDYd7iRXkbc2VwFjuk5B5KN4fS0NhLfyTAf7SAHRNTw4Fb+gJpTOIMOmU
	uufNyh2GuuFIX3mfHP0L+iuOJdlCg3hl0qnIt84uGuNKF3zZM1QDlMoq1AycB9VX0Al7Atcs3VJ
	pwQAAllFLy4J68ZMbw5e3mx1bUcu5rNR/yhKggkGhJXYOZU014hUekOga3koQGY6K/OQZjCnXsT
	se9RstS1ZEhi31PohARghd6DK2ff4AtkJkzdYhUdiLvwKMf28cuLrDAamdnwF5fs8Ag/DsAKjiC
	cMw2va5/mmxrjV3rNgvm4TB9+nyWW8sXSzhKnkq30VWnV2WYZpkDJ5ZFxC6HRLN6FcTznPvEOyk
	tkflQPCUSohj3P7MGeeYu1qL+aHYOruWbJSx1OiF4vOaxiR1XAxH9VLegK5+8lrnIPTAch+eT/Y
	iO1DnSJgK198hmk6JviCNlesrnW9Vgr7gsIbb1PJ74f988tBWVWeh+mFhsnLXfiSAKSrYmNo+Gb
	qO/ER2lfz1gEfPgSNzN14MJ1JDsbLh2byfr6Ys4W
X-Received: by 2002:a7b:c015:0:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-49987927ebfmr303753805e9.4.1786961703220;
        Mon, 17 Aug 2026 03:15:03 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d06167csm29542255e9.3.2026.08.17.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:15:02 -0700 (PDT)
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
Subject: [PATCH v7 1/3] hwmon: (pmbus/tps25990): Rework driver for multi-device support
Date: Mon, 17 Aug 2026 13:14:43 +0300
Message-ID: <20260817101455.3526260-2-sbogdanov@baylibre.com>
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

Rework existing implementation to allow adding support for new
devices to the existing driver. chip_id is used to identify the
current device and differentiate logic where needed.

Changes include:
 - Add an enum listing supported chips
 - Add a structure to hold per-device m, b, R coefficients

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 drivers/hwmon/pmbus/tps25990.c | 123 +++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 53 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 9d318e6509ab..7634ac743025 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -47,6 +47,15 @@
 					 PK_MIN_AVG_RST_AVG  | \
 					 PK_MIN_AVG_RST_MIN)
 
+enum chips {
+	tps25990,
+};
+
+struct tps25990_data {
+	struct pmbus_driver_info info;
+	enum chips chip_id;
+};
+
 /*
  * Arbitrary default Rimon value: 1kOhm
  * This correspond to an overcurrent limit of 55A, close to the specified limit
@@ -337,63 +346,65 @@ static const struct regulator_desc tps25990_reg_desc[] = {
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
+static const struct pmbus_driver_info tps25990_base_info[] = {
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
-	{ .name = "tps25990" },
-	{ }
+	{ .name = "tps25990", .driver_data = tps25990 },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
-	{ .compatible = "ti,tps25990" },
+	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps25990_of_match);
@@ -401,8 +412,9 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
 static int tps25990_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct pmbus_driver_info *info;
+	struct tps25990_data *data;
 	const char *propname;
+	enum chips chip_id;
 	u32 rimon;
 	int ret;
 
@@ -415,15 +427,20 @@ static int tps25990_probe(struct i2c_client *client)
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
+	data->chip_id = chip_id;
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

