Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3A21B425F
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534251; cv=none; b=uGjWtgKxPF11yPYOiIWjy89b2DxOhaGn0iB5GnC6PqvCEdE7i0E7JXbllYulQVoX4RLmhyM0q2sw+3okhdBtg/faupWG9b9rFzv6L69pc9p3FnxWZS8E4omutrgd2jrzLo40Q2ERjBysHsEzvgADMLZOo1SL9NnnLYpMYfvVzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534251; c=relaxed/simple;
	bh=8ZRWJXFIuNKnAe/Gim44QJC4wP4MylIjzaYCQKINcgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHH9dHZyqRFbTWo+g6fM1oRzFcYsh17N33jHfA1k889L87RqmbkuZPyDpC/xia6i/s1e9gxXdBfbeBb5yolpRqynD6PlW1cyvzOiS18cmARy10dbtLyuTmPNmQh+86sSrZl10NbG73Qy+P4AlcpUAo4iXry+Gm4VLr8ZHjzjLac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFeyhwz1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFeyhwz1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-728eccf836bso5878611b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 07:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534248; x=1735139048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ/oT8+N9IfAzRmBwmiNU/I+85a5NMdCJU6anwzGbwQ=;
        b=eFeyhwz1LyvmKt59A8eiRmdjUh5ap2XnL8l7CTd8yf0KQDTFEijQLnbxY0Y/ajuhj0
         c1HDhs0AYIFXLJO4JL1aKZqKloi1ac1oMgPddkxAK8AcMXaRyj03/rdyeqINSOcVK4/n
         nfpxJ/UGM/nh06NV4/GF3/vGHhUB3uzVbFf7usSV9aFIuVcmSaHiDx2y0n9+HS97JjSz
         M0BgEvn6lKFDETB3o1siFaqgWWqZx01Pt5bgsU/aBxu1jyYraAZbsXu91GupVokPvyWv
         3BsHO6e33nn4yuvhyRNG0175Q8QFd2rWlitjvbVrid9vP6mc3HVZidh1aVfDxHG8H95l
         Dcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534248; x=1735139048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ/oT8+N9IfAzRmBwmiNU/I+85a5NMdCJU6anwzGbwQ=;
        b=iREiFEL90wrnTn73dy+j3I1qgDLRECIRZdpo75754IfwDNxr+qRXBnKGaiFlTrdm/v
         XZhkjU2ftdymPDBex5KtGSDxmlwghFHamCmyxTQlMBoiYaqv2K8SSuuZirpG4E5pPg4h
         UsttTL+vNFh+UzT6fZUIEdvqRKLroZZ7bQ1weI5k2ZnV/mbm6qu4OKcN1LnVHsNR1HNr
         o/8gx25cwqVt0apZoSUTB+Y6V1vB+X2SmluxPS9sVoJpspt0ERrPaZ7iJvpzlZLn72ww
         B9+L73F01krrUzoLAPZgYSj781UaVjHFv5AGIWIBfGrDXfgn+Xrlrqn+tvUcjT9xhUHg
         xO4w==
X-Gm-Message-State: AOJu0Yzpjrtuafcf3FPR5IKvhY6YLW0H7Ogc49ceCG6iRiDu1oJ3pMaz
	Qb2yEjJcZlmbh9Eyt4/70V5Am/C1roJlvtvec0Pc7N+b40P9haMFfUKDVw==
X-Gm-Gg: ASbGncteuNlZApqGAoo/9VhAdo1hUycbYMD692bGVxo19Y+5qHRC+E6EKpbZDw66zxN
	UUmQgLf/gTm6NH9OPooQdgqrqoRqXuepcmkl4Or/of4pLjpk8Oiqtt97E1X8jb97qXOzb38nOK1
	upx3ht3xpFFPqAYJA3uRByJWUCj2ZNH8qCdOGvEtO654zhKigIGskSSm29qkojZ3EoHEu+nm+r8
	OsqbKXbf1irh/8eJjC/sKnYVPYsDyn78km0bpolZuXHubhsIT4VDEEBcVpA7hWLi93LBw==
X-Google-Smtp-Source: AGHT+IEcSxyLzhp7mVh7JTaClPUx1o78T9T1Wkb9szkYKnvgvF+fI6FFpTWi2c8Whdb0q+7cjk66rg==
X-Received: by 2002:a05:6a00:4c0a:b0:725:4109:5b5f with SMTP id d2e1a72fcca58-72a8d2461b4mr5953594b3a.8.1734534247707;
        Wed, 18 Dec 2024 07:04:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bce343sm8938988b3a.185.2024.12.18.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:04:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences in regmap access functions
Date: Wed, 18 Dec 2024 07:04:04 -0800
Message-ID: <20241218150404.2713377-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hide register size differences in regmap access functions to simplify
runtime code and to simplify adding support for I3C devices. Also
use regmap API functions for bit operations where possible.

For this to work, the 16-bit and 8-bit configuration register has to be
mapped to a 16-bit value. Unlike other registers, this register is a
low-byte-first register, presumably for compatibility with chips with
8-bit wide configuration registers. Hide the differences in the regmap
access code.

While at it, enable alarm attribute support for TMP112.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Fix accesses to 16-bit configuration register.
    Use regmap access functions for all operations on config register.
    Declare regmap bus and use devm_regmap_init().
    Drop local configuration register copy; let regmap handle bit updates.

    Note: The driver could use additional cleanup, such as using bit macros
    and using devm_regulator_get_enable(). That is left for another day.

 drivers/hwmon/lm75.c | 131 ++++++++++++++++++++-----------------------
 1 file changed, 62 insertions(+), 69 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2c2205aec7d4..d3eb5c9c25b1 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -110,7 +110,6 @@ struct lm75_data {
 	struct regmap			*regmap;
 	struct regulator		*vs;
 	u16				orig_conf;
-	u16				current_conf;
 	u8				resolution;	/* In bits, 9 to 16 */
 	unsigned int			sample_time;	/* In ms */
 	enum lm75_type			kind;
@@ -276,6 +275,7 @@ static const struct lm75_params device_params[] = {
 		.default_sample_time = 125,
 		.num_sample_times = 4,
 		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+		.alarm = true,
 	},
 	[tmp175] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
@@ -335,40 +335,16 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 static int lm75_write_config(struct lm75_data *data, u16 set_mask,
 			     u16 clr_mask)
 {
-	unsigned int value;
+	int err;
 
-	clr_mask |= LM75_SHUTDOWN << (8 * data->params->config_reg_16bits);
-	value = data->current_conf & ~clr_mask;
-	value |= set_mask;
+	err = regmap_update_bits(data->regmap, LM75_REG_CONF,
+				 clr_mask | LM75_SHUTDOWN, set_mask);
+	if (err)
+		return err;
 
-	if (data->current_conf != value) {
-		s32 err;
-		if (data->params->config_reg_16bits)
-			err = regmap_write(data->regmap, LM75_REG_CONF, value);
-		else
-			err = i2c_smbus_write_byte_data(data->client,
-							LM75_REG_CONF,
-							value);
-		if (err)
-			return err;
-		data->current_conf = value;
-	}
 	return 0;
 }
 
-static int lm75_read_config(struct lm75_data *data)
-{
-	int ret;
-	unsigned int status;
-
-	if (data->params->config_reg_16bits) {
-		ret = regmap_read(data->regmap, LM75_REG_CONF, &status);
-		return ret ? ret : status;
-	}
-
-	return i2c_smbus_read_byte_data(data->client, LM75_REG_CONF);
-}
-
 static irqreturn_t lm75_alarm_handler(int irq, void *private)
 {
 	struct device *hwmon_dev = private;
@@ -418,7 +394,8 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_temp_alarm) {
 			switch (data->kind) {
 			case as6200:
-				*val = (regval >> 5) & 0x1;
+			case tmp112:
+				*val = (regval >> 13) & 0x1;
 				break;
 			default:
 				return -EINVAL;
@@ -469,7 +446,6 @@ static int lm75_write_temp(struct device *dev, u32 attr, long temp)
 static int lm75_update_interval(struct device *dev, long val)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
-	unsigned int reg;
 	u8 index;
 	s32 err;
 
@@ -489,19 +465,14 @@ static int lm75_update_interval(struct device *dev, long val)
 		break;
 	case tmp112:
 	case as6200:
-		err = regmap_read(data->regmap, LM75_REG_CONF, &reg);
-		if (err < 0)
-			return err;
-		reg &= ~0x00c0;
-		reg |= (3 - index) << 6;
-		err = regmap_write(data->regmap, LM75_REG_CONF, reg);
+		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
+					 0xc000, (3 - index) << 14);
 		if (err < 0)
 			return err;
 		data->sample_time = data->params->sample_times[index];
 		break;
 	case pct2075:
-		err = i2c_smbus_write_byte_data(data->client, PCT2075_REG_IDLE,
-						index + 1);
+		err = regmap_write(data->regmap, PCT2075_REG_IDLE, index + 1);
 		if (err)
 			return err;
 		data->sample_time = data->params->sample_times[index];
@@ -598,6 +569,39 @@ static bool lm75_is_volatile_reg(struct device *dev, unsigned int reg)
 	return reg == LM75_REG_TEMP || reg == LM75_REG_CONF;
 }
 
+static int lm75_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct lm75_data *data = context;
+	struct i2c_client *client = data->client;
+	int ret;
+
+	if (reg == LM75_REG_CONF) {
+		if (!data->params->config_reg_16bits)
+			ret = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
+		else
+			ret = i2c_smbus_read_word_data(client, LM75_REG_CONF);
+	} else {
+		ret = i2c_smbus_read_word_swapped(client, reg);
+	}
+	if (ret < 0)
+		return ret;
+	*val = ret;
+	return 0;
+}
+
+static int lm75_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct lm75_data *data = context;
+	struct i2c_client *client = data->client;
+
+	if (reg == PCT2075_REG_IDLE ||
+	    (reg == LM75_REG_CONF && !data->params->config_reg_16bits))
+		return i2c_smbus_write_byte_data(client, reg, val);
+	else if (reg == LM75_REG_CONF)
+		return i2c_smbus_write_word_data(client, reg, val);
+	return i2c_smbus_write_word_swapped(client, reg, val);
+}
+
 static const struct regmap_config lm75_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
@@ -610,6 +614,11 @@ static const struct regmap_config lm75_regmap_config = {
 	.use_single_write = true,
 };
 
+static const struct regmap_bus lm75_i2c_regmap_bus = {
+	.reg_read = lm75_i2c_reg_read,
+	.reg_write = lm75_i2c_reg_write,
+};
+
 static void lm75_disable_regulator(void *data)
 {
 	struct lm75_data *lm75 = data;
@@ -620,9 +629,8 @@ static void lm75_disable_regulator(void *data)
 static void lm75_remove(void *data)
 {
 	struct lm75_data *lm75 = data;
-	struct i2c_client *client = lm75->client;
 
-	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
+	regmap_write(lm75->regmap, LM75_REG_CONF, lm75->orig_conf);
 }
 
 static int lm75_probe(struct i2c_client *client)
@@ -640,6 +648,9 @@ static int lm75_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	/* needed by custom regmap callbacks */
+	dev_set_drvdata(dev, data);
+
 	data->client = client;
 	data->kind = (uintptr_t)i2c_get_match_data(client);
 
@@ -647,7 +658,8 @@ static int lm75_probe(struct i2c_client *client)
 	if (IS_ERR(data->vs))
 		return PTR_ERR(data->vs);
 
-	data->regmap = devm_regmap_init_i2c(client, &lm75_regmap_config);
+	data->regmap = devm_regmap_init(dev, &lm75_i2c_regmap_bus, data,
+					&lm75_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
@@ -673,13 +685,10 @@ static int lm75_probe(struct i2c_client *client)
 		return err;
 
 	/* Cache original configuration */
-	status = lm75_read_config(data);
-	if (status < 0) {
-		dev_dbg(dev, "Can't read config? %d\n", status);
-		return status;
-	}
+	err = regmap_read(data->regmap, LM75_REG_CONF, &status);
+	if (err)
+		return err;
 	data->orig_conf = status;
-	data->current_conf = status;
 
 	err = lm75_write_config(data, data->params->set_mask,
 				data->params->clr_mask);
@@ -972,32 +981,16 @@ static int lm75_detect(struct i2c_client *new_client,
 #ifdef CONFIG_PM
 static int lm75_suspend(struct device *dev)
 {
-	int status;
-	struct i2c_client *client = to_i2c_client(dev);
+	struct lm75_data *data = dev_get_drvdata(dev);
 
-	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
-	if (status < 0) {
-		dev_dbg(&client->dev, "Can't read config? %d\n", status);
-		return status;
-	}
-	status = status | LM75_SHUTDOWN;
-	i2c_smbus_write_byte_data(client, LM75_REG_CONF, status);
-	return 0;
+	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, LM75_SHUTDOWN);
 }
 
 static int lm75_resume(struct device *dev)
 {
-	int status;
-	struct i2c_client *client = to_i2c_client(dev);
+	struct lm75_data *data = dev_get_drvdata(dev);
 
-	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
-	if (status < 0) {
-		dev_dbg(&client->dev, "Can't read config? %d\n", status);
-		return status;
-	}
-	status = status & ~LM75_SHUTDOWN;
-	i2c_smbus_write_byte_data(client, LM75_REG_CONF, status);
-	return 0;
+	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, 0);
 }
 
 static const struct dev_pm_ops lm75_dev_pm_ops = {
-- 
2.45.2

