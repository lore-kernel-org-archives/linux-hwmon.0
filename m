Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB71C6F51
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772916; cv=none; b=QpONfepROEuiffhoeALVDaNeKLqyVt9XpRQvSB0Oa+Jcijg9hapZM38pVlpeUS8bjVHq1aa60P7QrWfu5jCqCyI4dKZUAo9nXmIi/hvtWFc0Tp2WKQUzq8PoTk6fC3bYJSikFU8L1TiNrqy5mqSq5OKutCF+y2vAfVRnGwQWb1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772916; c=relaxed/simple;
	bh=iAHZ1BPAf8KjIJlNHmXV8NqYSpdu5hb9jOib6LGQjvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSWRN8+j5cZBS8PVltd5CHtpFLaFdpFZVl81mTg/GipzMg7r5w0vAXupZAwCAdulEyIA7njakxhCO/JeOFI/CKnfFjK5ZaTUNUSPhy7lfoRWJC6kLc6fPii/NIx5pSFpuvImtFVGJQdaBuDpTKrZp5cz3ztS486P5VHp06+rQ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd8k4yx+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd8k4yx+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20231aa8908so44793305ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772914; x=1725377714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd+fkygrszA0ON7HMWWV6K7sBHbr7iMeM1Q+zp05ZV8=;
        b=Yd8k4yx+CO4DpdGuSBLmr6UnVelQlv8DX4wkz1A7Ak2Wt+Rs3SuidxQfCaa4iKe1Eu
         LSgo/uEuI6ZDZyEKvf59zoQJJuGnpEsXg16qG/j8J5nvL8uN72OoIpT/Bp/537SxjZYc
         Jc4Di8o8Qv1pWaSLpMQM+PZ2cuDF/9yFlz+RV0xb9apncNixyyzaANWU0E44/xjtIGSc
         Ck6dGI7R0dTEOlMdhqnJ3R/CIZVAteq3XmzpwTFPenNMR1Ogg/8qU9r7pEpkoSCGAdjX
         mIFljvwAXbO3C1SJ67OZKtM4L67TUnyyE3NSgZopS0s5zPfbQABqJ8WkUyaY+ouysfX5
         mZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772914; x=1725377714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sd+fkygrszA0ON7HMWWV6K7sBHbr7iMeM1Q+zp05ZV8=;
        b=WxmxDzl4fpYWd87BWu/sWWSJXwtrNWHX8FDR6HjI6HaoOp6TAr+W1kqcq7O1rzAn12
         g8hIdVA+EHeujq+rZz9jF1I0MldKKrf95Vz2bzId0sL4kQP0/ok9z6MhnrAklkiB5KFs
         2ec6+1LJx50eXVXhIobgQFabs4I8dTX2FQ0etALzXsKZeljR5i9M7HbzcmZXPJ0geA1y
         Md/8Lpx6095ZHWEenvd27D3+/oCweyVhgc3TN6chY+W8uVkX9LmTbFsYhzKhWsURM2ve
         ffN9CF4kc+qHF++5kvGqrLNyut85u4EqA5FJgtgKTH5vzssC31whCN1INxflL/Y2Hpbx
         w1OQ==
X-Gm-Message-State: AOJu0YwK0syetuM1WsJKmrM45WUno83tje97rFZq6uuctjHu+4KmMf7G
	G4agQTp1DKc0P0JuEtxrSsWbZd2jFzPVWe8P80so/xOT7wkSSk6Bp4n4sQ==
X-Google-Smtp-Source: AGHT+IESYxQLi3mc1izfL6UNkPygH+ZumiTByLUPyypBAJFLuluKPeUZFp58D7tFiV5HBWOeTA/prg==
X-Received: by 2002:a17:903:1cd:b0:202:1b1e:c1e6 with SMTP id d9443c01a7336-204df4d3727mr27038585ad.44.1724772914107;
        Tue, 27 Aug 2024 08:35:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038558137csm84501925ad.99.2024.08.27.08.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:35:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/11] hwmon: (ina2xx) Consolidate chip initialization code
Date: Tue, 27 Aug 2024 08:34:53 -0700
Message-ID: <20240827153455.1344529-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827153455.1344529-1-linux@roeck-us.net>
References: <20240827153455.1344529-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all chip initialization code into a single function.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 109 ++++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 68 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index b40fc808bf3d..d1bd998645b6 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -68,9 +68,7 @@
 #define INA226_READ_AVG(reg)		FIELD_GET(INA226_AVG_RD_MASK, reg)
 
 #define INA226_ALERT_LATCH_ENABLE	BIT(0)
-#define INA226_ALERT_POLARITY_MASK	BIT(1)
-#define INA226_ALERT_POL_LOW		0
-#define INA226_ALERT_POL_HIGH		1
+#define INA226_ALERT_POLARITY		BIT(1)
 
 /* bit number of alert functions in Mask/Enable Register */
 #define INA226_SHUNT_OVER_VOLTAGE_MASK	BIT(15)
@@ -140,6 +138,7 @@ struct ina2xx_config {
 
 struct ina2xx_data {
 	const struct ina2xx_config *config;
+	enum ina2xx_ids chip;
 
 	long rshunt;
 	long current_lsb_uA;
@@ -210,39 +209,6 @@ static u16 ina226_interval_to_reg(unsigned long interval)
 	return FIELD_PREP(INA226_AVG_RD_MASK, avg_bits);
 }
 
-static int ina2xx_set_alert_polarity(struct ina2xx_data *data,
-				     unsigned long val)
-{
-	return regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
-				 INA226_ALERT_POLARITY_MASK,
-				 FIELD_PREP(INA226_ALERT_POLARITY_MASK, val));
-}
-
-/*
- * Calibration register is set to the best value, which eliminates
- * truncation errors on calculating current register in hardware.
- * According to datasheet (eq. 3) the best values are 2048 for
- * ina226 and 4096 for ina219. They are hardcoded as calibration_value.
- */
-static int ina2xx_calibrate(struct ina2xx_data *data)
-{
-	return regmap_write(data->regmap, INA2XX_CALIBRATION,
-			    data->config->calibration_value);
-}
-
-/*
- * Initialize the configuration and calibration registers.
- */
-static int ina2xx_init(struct ina2xx_data *data)
-{
-	int ret = regmap_write(data->regmap, INA2XX_CONFIG,
-			       data->config->config_default);
-	if (ret < 0)
-		return ret;
-
-	return ina2xx_calibrate(data);
-}
-
 static int ina2xx_read_reg(struct device *dev, int reg, unsigned int *regval)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
@@ -650,12 +616,46 @@ static const struct attribute_group ina226_group = {
 	.attrs = ina226_attrs,
 };
 
+/*
+ * Initialize chip
+ */
+static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
+{
+	u16 config = data->config->config_default;
+	struct regmap *regmap = data->regmap;
+	u32 shunt;
+	int ret;
+
+	if (device_property_read_u32(dev, "shunt-resistor", &shunt) < 0)
+		shunt = INA2XX_RSHUNT_DEFAULT;
+
+	ret = ina2xx_set_shunt(data, shunt);
+	if (ret < 0)
+		return ret;
+
+	if (data->chip == ina226 &&
+	    device_property_read_bool(dev, "ti,alert-polarity-active-high"))
+		config |= INA226_ALERT_POLARITY;
+
+	ret = regmap_write(regmap, INA2XX_CONFIG, config);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Calibration register is set to the best value, which eliminates
+	 * truncation errors on calculating current register in hardware.
+	 * According to datasheet (eq. 3) the best values are 2048 for
+	 * ina226 and 4096 for ina219. They are hardcoded as calibration_value.
+	 */
+	return regmap_write(regmap, INA2XX_CALIBRATION,
+			    data->config->calibration_value);
+}
+
 static int ina2xx_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ina2xx_data *data;
 	struct device *hwmon_dev;
-	u32 val;
 	int ret, group = 0;
 	enum ina2xx_ids chip;
 
@@ -667,15 +667,9 @@ static int ina2xx_probe(struct i2c_client *client)
 
 	/* set the device type */
 	data->config = &ina2xx_config[chip];
+	data->chip = chip;
 	mutex_init(&data->config_lock);
 
-	if (device_property_read_u32(dev, "shunt-resistor", &val) < 0)
-		val = INA2XX_RSHUNT_DEFAULT;
-
-	ret = ina2xx_set_shunt(data, val);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Invalid shunt resistor value\n");
-
 	data->regmap = devm_regmap_init_i2c(client, &ina2xx_regmap_config);
 	if (IS_ERR(data->regmap)) {
 		dev_err(dev, "failed to allocate register map\n");
@@ -686,30 +680,9 @@ static int ina2xx_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
 
-	if (chip == ina226) {
-		if (device_property_read_bool(dev, "ti,alert-polarity-active-high")) {
-			ret = ina2xx_set_alert_polarity(data,
-							INA226_ALERT_POL_HIGH);
-			if (ret < 0) {
-				return dev_err_probe(dev, ret,
-					"failed to set alert polarity active high\n");
-			}
-		} else {
-			/* Set default value i.e active low */
-			ret = ina2xx_set_alert_polarity(data,
-							INA226_ALERT_POL_LOW);
-			if (ret < 0) {
-				return dev_err_probe(dev, ret,
-					"failed to set alert polarity active low\n");
-			}
-		}
-	}
-
-	ret = ina2xx_init(data);
-	if (ret < 0) {
-		dev_err(dev, "error configuring the device: %d\n", ret);
-		return -ENODEV;
-	}
+	ret = ina2xx_init(dev, data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to configure device\n");
 
 	data->groups[group++] = &ina2xx_group;
 	if (chip == ina226)
-- 
2.45.2

