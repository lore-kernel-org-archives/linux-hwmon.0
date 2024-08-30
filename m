Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3941B4A32
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979974; cv=none; b=FAVMwt13q2K/1/asqXpb7/XDQEgSMuR9blgqX7TaoqRkstq1IlClfbwZaYY66sIsRFChD3kTsC+YyJaRg7i6nh9sluVHh5rx4MNnFcFIdk+qGr+0J8HDTUzZGHWQeM5ZevH3UYR4jq//OZpRiuQz2I04UPb6frQySOQZxxEJlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979974; c=relaxed/simple;
	bh=//a16qw0qKZwj5bciI/phzfvjM7UNcjAv18SeoL6lyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkXbq1vhWl6+8KN0n8x2lPD87sX9S3DhMabiy8j2Q1/F8+zgh2qjo0Zh1CmMvX7rhlkTGqCrxqPcymVPorS7s+y+HziQ0NGnMx0zu+EV8UZG6jK+zHY9oZ85Zfegtvvlg7SAHIj8jUb976Wluoo+IaKcwFMMNKXkgifRQm4SEhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOJcSryY; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOJcSryY"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-715cdc7a153so1035433b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979972; x=1725584772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy83zOHw45KxLT2Qgddfv6YZl5J11G26RIVAbezO1u0=;
        b=OOJcSryYRmI0eEFv/Z6RgBkwegPAXdMz1TDMa5AWJAQBCZi0FJCN6S/74Vc3p+IV5n
         Woiuui3aukecw+lqm8MoaSkEQsJ16HQpSzWvy6fj8F1eE9NTgMgGxb6LkfCPV0hMHJ42
         7Sw3c1bAA/5fwLuCtLB/+jW5IiBGq27bHq2alqIfK6B7VvGJMaT6UHUHy8CpimxWvbTY
         g/Nxkasgo8OZ58c7Ky6CeK2e8viYY7+lSh0I5t54svRtm+jOVEBUPw2E9Iif5Rzd0Dyg
         xfqSZR/ogeL2LJ+DstL6+3msBvW8s2cjL7EoyHJj7eB5vU/pVEFmi1KWSj+omFVpNH4m
         OJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979972; x=1725584772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oy83zOHw45KxLT2Qgddfv6YZl5J11G26RIVAbezO1u0=;
        b=a6cZWllnVob8Nych1JNMH7QlfDm4ybsH23OsqxC5vEqlb6O/9MNXL3qnRDEZCMtscj
         DgV0TozkDSJJS6WneDpl/RjmHzh4DLg/r1vFTeiGBahLBiyyFDHj39dHT3Fldcwbs8ED
         tWUZ/97rYNXsAKTsMTT11cuoZEHC11NrBFuKs62FW+VRSQiCIMUHkchsaKO24oUkExq0
         0O5fDdVNmX0BTdOdXgXU1VGcqcXzYk+Q9HmlwAeJw6Upz5p44vnQq+2bsn3Y+P2yK3yL
         19xRMhD8zzQnVyRYQQoS2QPgQ37Fc8M9uhYDrTQSuU4kTgzluApg6LA8he0jXbPXBQh4
         C/4Q==
X-Gm-Message-State: AOJu0YzG8suwOe42x4YKD2bg1CuRZvmRnsgIwcF00mYLRGGte5e0zx6g
	u/QEWyhWbKKjYqZiUcxLd+R3A3Zhhy2Lh+xzYjpabbLuBbFRw44axyndvw==
X-Google-Smtp-Source: AGHT+IEBJ9gEQwE9Iv3xI6P8pRJOJCizDu7QhkE83bHL+SejwFfdLgB7pqwdgRJLV1A23Ym0Xur0dg==
X-Received: by 2002:a05:6a00:3a21:b0:706:aa39:d5c1 with SMTP id d2e1a72fcca58-7170676dfddmr1093103b3a.8.1724979972099;
        Thu, 29 Aug 2024 18:06:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569dccesm1730442b3a.136.2024.08.29.18.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:06:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 08/14] hwmon: (ina2xx) Consolidate chip initialization code
Date: Thu, 29 Aug 2024 18:05:48 -0700
Message-ID: <20240830010554.1462861-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830010554.1462861-1-linux@roeck-us.net>
References: <20240830010554.1462861-1-linux@roeck-us.net>
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
v2: Fixed setting alert polarity

 drivers/hwmon/ina2xx.c | 111 ++++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 68 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 2aea461b8c6d..a9e3b23445b4 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -67,9 +67,7 @@
 
 #define INA226_READ_AVG(reg)		FIELD_GET(INA226_AVG_RD_MASK, reg)
 
-#define INA226_ALERT_POLARITY_MASK	BIT(1)
-#define INA226_ALERT_POL_LOW		0
-#define INA226_ALERT_POL_HIGH		1
+#define INA226_ALERT_POLARITY		BIT(1)
 
 /* bit number of alert functions in Mask/Enable Register */
 #define INA226_SHUNT_OVER_VOLTAGE_MASK	BIT(15)
@@ -141,6 +139,7 @@ struct ina2xx_config {
 
 struct ina2xx_data {
 	const struct ina2xx_config *config;
+	enum ina2xx_ids chip;
 
 	long rshunt;
 	long current_lsb_uA;
@@ -211,39 +210,6 @@ static u16 ina226_interval_to_reg(unsigned long interval)
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
@@ -651,12 +617,48 @@ static const struct attribute_group ina226_group = {
 	.attrs = ina226_attrs,
 };
 
+/*
+ * Initialize chip
+ */
+static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
+{
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
+	ret = regmap_write(regmap, INA2XX_CONFIG, data->config->config_default);
+	if (ret < 0)
+		return ret;
+
+	if (data->chip == ina226) {
+		bool active_high = device_property_read_bool(dev, "ti,alert-polarity-active-high");
+
+		regmap_update_bits(regmap, INA226_MASK_ENABLE, INA226_ALERT_POLARITY,
+				   FIELD_PREP(INA226_ALERT_POLARITY, active_high));
+	}
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
 
@@ -668,15 +670,9 @@ static int ina2xx_probe(struct i2c_client *client)
 
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
@@ -687,30 +683,9 @@ static int ina2xx_probe(struct i2c_client *client)
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

