Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABD2C3248;
	Fri,  5 Sep 2025 20:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104944; cv=none; b=eF3dYp+GAZdQHEbQudjzbwlIpbu1nv98Nk8AUEdOXen9K2wDBh9BvuhaRmrbHip7+KEY8u4PcBU1f3dAwNaKv7xzC/wfcivXdvqblDCB4wEyp36CINJHzOwx+ZHjFzDeoGhyMQWQqfrtYWWJ59hCil3ihG1tyIbIszrPyUphp2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104944; c=relaxed/simple;
	bh=RcBc0a6SelTOZNGzvGQMp6eortanJaJJGSmf7Dr1xJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0bzBr1bWUyk9DG2vptRj93ZVMIE5dO5WoomHQN8rFj0lniu9iajlPtgc+hcP8YUjSrHmSaaWQKdOs0rIoRQu/a0A/fsyVUf5k1RMwIk62SAOGCacjym7Bcp/ikQmmFPDlYh1U02bclZYbTkp212rj/3SBNe0M+pBSDyy2rmkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl+PpQH0; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl+PpQH0"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7724cacc32bso2083260b3a.0;
        Fri, 05 Sep 2025 13:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104942; x=1757709742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d6K1GOLThRL9peUUzkUS6o7cAEeOqDTrSw33MPrVfw=;
        b=Nl+PpQH0OYccuucnzbW5rNE1KzDDI6zw25ckdZfzn0PXUEqWnSBYTvchClZePukdVo
         U5c9M7fZ4D4b3XBSWGfVMTbZeWdDXWLZCocEtpR7O+ULwaCGN+Y4LoYrOiL9BvmKc8MS
         CEy/YrJhx8rJH1owys1cZG0zOe6G0ty8OqQ1d1f7cIKZJ+KIz3glFVlOP89Q7Bnvb4GN
         94SJh3gV8NiX2QERHXtaFJlqPeMxaZ65y9mqO4Ybwy2/Mtm2peSU9cmU1+nUIV/foVt/
         SJ5BxhRBS/pZlRRb3uMqbds96b8hXHEctK5FZCQrOqaQCmoEmhNxx8JYBDzf6skn/1WD
         Qw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104942; x=1757709742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4d6K1GOLThRL9peUUzkUS6o7cAEeOqDTrSw33MPrVfw=;
        b=lPeUBH5pEJ2VqsWUdgJ3ArDy22zRN84v/uEyZiN0kLYX7cpoCjTZ5scVPLNAKZD1bo
         Klk6W7PKtZ9kD+pD7HFzpi7uyol9xWVthZ/U/zrNXsN7PAqVEfe9nJ73v/DThRPmzY9E
         Nw6CsfYAZl1bWs6Rte5R6L1llR5fwv1GcjXelKu31Kgaq7xGh81Vwxq6Fp+oaWfBd/wh
         PIV7dXAiJSnMncTQX2tcxDKwfr6dde2jwjkWeWCo4WhispDrJuNuKOlqygx+eMXLfKP4
         Kaxcc6lUJcuLwVJt3K3M0eLgIcRxbZlRRgOhdhGT86EMrJit8uZcChwUEw8+vu9wsiYY
         a2og==
X-Forwarded-Encrypted: i=1; AJvYcCUMeTIovWmzIdc0Ez2NYb8BSi9l0MPWQcLR7GXyLfFrSU4PZ2mGbnyEc70qDrKLNT6XupWybmnFOc8U@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+T/o7owk/0q9LYzoNCDLNEcP7s5+0LfjnYiWuwb7YGEaMC7k
	QAKBu4oQEChFtM0jbkwl24FYuKNb5U1k0kA6Tx+CBk+oP8Ey+vzvtK45aYc7ovNx
X-Gm-Gg: ASbGnct9NJM7Mfr8hE0Rye4Wjzy0kW7+wDwsK4gLIyXA0fQDFAYKtLvshbsf3eTvgOf
	60nvzJJYxtyhKXrCS7seSs0qNhhm8lWr+KwS6pEORGbb37NIvefV7GQf0Bl2eVJsc1qXSbqby6c
	D6Kk5ElLWx/GH9RTLATwYA+HQlMmr9IxlwdVzRqCYlRmAiH9OBNcs1Biwwo+qBkvnHVzH7Xipds
	QVD49Qy4je5v2cqm/UPXxVdhN/UzAEO2fViKFTe8AJ31z1Y+75gAXoINU/ZXpDqYxGRqOcdL0cJ
	fHPRqhzP+8p5tfkOOWRgE/qkyX19D17NKHKc/LfBRwhs5pK9mKyVjHUe6E5bmp1qs7CRmooxuVc
	Aj4mp5Ec6WAFPJdr4JHbmIuLIjRqOfTAypz4=
X-Google-Smtp-Source: AGHT+IHNToj+mlhww/WLi3771uVIPWS/iK4QxwdXiphfvFDsIdTPsTIp6Po1U5pbRxAPx8RqWcSRzw==
X-Received: by 2002:a05:6a00:1ad4:b0:772:871c:1e49 with SMTP id d2e1a72fcca58-7742de6f49bmr99660b3a.29.1757104941980;
        Fri, 05 Sep 2025 13:42:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26abdesm22389279b3a.1.2025.09.05.13.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/17] hwmon: (ina238) Only configure calibration and shunt registers if needed
Date: Fri,  5 Sep 2025 13:41:56 -0700
Message-ID: <20250905204159.2618403-15-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for supporting chips with internal shunt resistor by only setting
calibration and shunt resistor registers if no current LSB is configured.

Do not display a log message during probe if a chip does not have shunt
and gain registers since those would otherwise display 0, and a message
just indicating that the driver was loaded would be just noise.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 82 +++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 40 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 24e396c69ae2..da5b43184dd1 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -745,32 +745,48 @@ static int ina238_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 	}
 
-	/* load shunt value */
-	if (device_property_read_u32(dev, "shunt-resistor", &data->rshunt) < 0)
-		data->rshunt = INA238_RSHUNT_DEFAULT;
-	if (data->rshunt == 0) {
-		dev_err(dev, "invalid shunt resister value %u\n", data->rshunt);
-		return -EINVAL;
-	}
-
-	/* load shunt gain value */
-	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
-		data->gain = 4; /* Default of ADCRANGE = 0 */
-	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
-		dev_err(dev, "invalid shunt gain value %u\n", data->gain);
-		return -EINVAL;
-	}
-
 	/* Setup CONFIG register */
 	config = data->config->config_default;
-	if (chip == sq52206) {
-		if (data->gain == 1)
-			config |= SQ52206_CONFIG_ADCRANGE_HIGH; /* ADCRANGE = 10/11 is /1 */
-		else if (data->gain == 2)
-			config |= SQ52206_CONFIG_ADCRANGE_LOW; /* ADCRANGE = 01 is /2 */
-	} else if (data->gain == 1) {
-		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
+	if (data->config->current_lsb) {
+		data->voltage_lsb[0] = INA238_SHUNT_VOLTAGE_LSB;
+		data->current_lsb = data->config->current_lsb;
+	} else {
+		/* load shunt value */
+		if (device_property_read_u32(dev, "shunt-resistor", &data->rshunt) < 0)
+			data->rshunt = INA238_RSHUNT_DEFAULT;
+		if (data->rshunt == 0) {
+			dev_err(dev, "invalid shunt resister value %u\n", data->rshunt);
+			return -EINVAL;
+		}
+
+		/* load shunt gain value */
+		if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
+			data->gain = 4;	/* Default of ADCRANGE = 0 */
+		if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
+			dev_err(dev, "invalid shunt gain value %u\n", data->gain);
+			return -EINVAL;
+		}
+
+		/* Setup SHUNT_CALIBRATION register with fixed value */
+		ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
+				   INA238_CALIBRATION_VALUE);
+		if (ret < 0) {
+			dev_err(dev, "error configuring the device: %d\n", ret);
+			return -ENODEV;
+		}
+		if (chip == sq52206) {
+			if (data->gain == 1)		/* ADCRANGE = 10/11 is /1 */
+				config |= SQ52206_CONFIG_ADCRANGE_HIGH;
+			else if (data->gain == 2)	/* ADCRANGE = 01 is /2 */
+				config |= SQ52206_CONFIG_ADCRANGE_LOW;
+		} else if (data->gain == 1) {		/* ADCRANGE = 1 is /1 */
+			config |= INA238_CONFIG_ADCRANGE;
+		}
+		data->voltage_lsb[0] = INA238_SHUNT_VOLTAGE_LSB * data->gain / 4;
+		data->current_lsb = DIV_U64_ROUND_CLOSEST(250ULL * INA238_FIXED_SHUNT * data->gain,
+							  data->rshunt);
 	}
+
 	ret = regmap_write(data->regmap, INA238_CONFIG, config);
 	if (ret < 0) {
 		dev_err(dev, "error configuring the device: %d\n", ret);
@@ -785,14 +801,6 @@ static int ina238_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	/* Setup SHUNT_CALIBRATION register with fixed value */
-	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
-			   INA238_CALIBRATION_VALUE);
-	if (ret < 0) {
-		dev_err(dev, "error configuring the device: %d\n", ret);
-		return -ENODEV;
-	}
-
 	/* Setup alert/alarm configuration */
 	config = INA238_DIAG_ALERT_DEFAULT;
 	if (device_property_read_bool(dev, "ti,alert-polarity-active-high"))
@@ -804,15 +812,8 @@ static int ina238_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	data->voltage_lsb[0] = INA238_SHUNT_VOLTAGE_LSB * data->gain / 4;
 	data->voltage_lsb[1] = data->config->bus_voltage_lsb;
 
-	if (data->config->current_lsb)
-		data->current_lsb = data->config->current_lsb;
-	else
-		data->current_lsb = DIV_U64_ROUND_CLOSEST(250ULL * INA238_FIXED_SHUNT * data->gain,
-							  data->rshunt);
-
 	data->power_lsb = DIV_ROUND_CLOSEST(data->current_lsb *
 					    data->config->power_calculate_factor,
 					    100);
@@ -824,8 +825,9 @@ static int ina238_probe(struct i2c_client *client)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-	dev_info(dev, "power monitor %s (Rshunt = %u uOhm, gain = %u)\n",
-		 client->name, data->rshunt, data->gain);
+	if (data->rshunt)
+		dev_info(dev, "power monitor %s (Rshunt = %u uOhm, gain = %u)\n",
+			 client->name, data->rshunt, data->gain);
 
 	return 0;
 }
-- 
2.45.2

