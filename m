Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB62155CB3
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 22:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734475937; cv=none; b=E0f57IKEglqNQJxBf3azmUQvhHbYO6QStCNbv52t6ycXV39S7++r1FymrWGn4mlsOKkvbsgKF1Ly45sThiskooLBkanrFLOVvlhP7jcv9mqQ4XCDS7+YNT9/7+vC795SKhYiE4pnV2vqPDI9bLmN/dikNEb8Uj/KrbDInSalYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734475937; c=relaxed/simple;
	bh=tYab6a+YWvzFhE0Y1lI7lG7e/spzDYgEVpc2azaG8fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gClNiXi77OPDFYbsCKkMLf5FVY4JkpK94QVpN29pGeYGh/CrQeBhWKRs5oOdMrbPkAG4sVEHRxwI2FsXiCnLRpBRqn0iXHT+UBMlqm25Ablkn7WsU1bDf3LYiqMFAQXYiEjP0SHNKwIQpQd6mMZOSp9HqaHty1janXtjasy0ozs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQFnEZ2q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQFnEZ2q"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21634338cfdso70276655ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 14:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734475934; x=1735080734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6+skH3dN21+sbBVZ/FQmBiSVCT6KKe+wUrJBa8vfxUw=;
        b=GQFnEZ2ql0NvlmcYQLL0i0uDF9SidRIbi8Ni11KW+frP6kjPfyr2Rb5/acpb+AegFo
         NOBhGTsdp40cKkdDOFnMXOMsEuXAxhz6QCUBN/5yXR61CNC+JWmVKCAF2jpGiYMy9H4C
         GRrSSIyDX6jta/iyJg2+QPfp+MJL3ntWpF8cyoiL0ZEsRv35J9UhYMib9YPEnqh/LxDe
         Kd4rqfKM0ohCVmArebhI7VRG71aQbeGm7SYuobt/Na0aeNSi3LFfvZo7c1WQQ2CBEoSJ
         QRUtPEkuqqUWMcwWPcHF7hhGALfxS8bDHEjtyM8PoCCFBtSD5X1hTsm63c10g1/Jdsxd
         4naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734475934; x=1735080734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+skH3dN21+sbBVZ/FQmBiSVCT6KKe+wUrJBa8vfxUw=;
        b=fA6JlE3qlmd1s4+e98mqug7Rndy9gRuFRmyL6iY081KZHwktN5idbTzjhWsbiPAEUn
         xUNFuEwzpLd0hLiRoshnNvXV6wghbHzpkljhgfv0Gzw0gEPU9c0eWRQiKx11y1M1me3P
         1U0QCMeYTkOodmpyKAZtsYXBgP79Z9UOsgr1Yk5U1ngasO91Ef0Ty843bJhlHYduccFb
         AMxQF1SNwcAPo/WR+hbaIMxt01fTaibDcx9RWWoAj8TYrPH1L9ezmS/VDglcTc6SK1w9
         Y43NkawEz0VEmTFkaH9SI5vMJl9gWoie9EasHWr0GvlQt59M3z05RIWIbiypRbmAgm1W
         FTrw==
X-Gm-Message-State: AOJu0YztioT/1gJd5eGoW457VAmPSDDi2h1WA+YXqxH5/zfqyuUB/s3u
	WtJlg0eurvdqfVpIWKYnYZ4svU8LSDmgFHXFVDq62jvkFK8ZpYim5ArEjg==
X-Gm-Gg: ASbGncs8S2Vail7iXhjQiLx0iUsPVlMaZQr+4SVFBiARBsn5Ic6/2xFz8bOIgkiYvoE
	jwu3IoyxDmPkh8HKsZjO0n4vjHJTWtABduB7nEyl0tK43LF/nAanCQ83TSWvS4lcbk9DogXjxhX
	wz2UCPbtPm36KRdvuH5SG1fGw1dWb7B8otejj7dQbH+6x2UR1lBFgMW9/sHm1Getm5Qla3hlP68
	64RLEG7jXmlYsdzPzewbokNQHvKc8GMybczdZGL/32MGVL2WiPMM1Rr9fdvtVSvhIXUUA==
X-Google-Smtp-Source: AGHT+IE/wjR/SeYban08Vbn1ZX2rYgJoK4xnjg1oiSlfpT8ySVlDppEuPHeAGpHfxhz8QP88/UyyOA==
X-Received: by 2002:a17:902:c94f:b0:216:281f:820d with SMTP id d9443c01a7336-218d6fd4bdamr6539465ad.11.1734475933704;
        Tue, 17 Dec 2024 14:52:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e6476csm64075405ad.219.2024.12.17.14.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 14:52:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT PATCH] hwmon: (lm75) Hide register size differences in regmap access functions
Date: Tue, 17 Dec 2024 14:52:10 -0800
Message-ID: <20241217225210.3298091-1-linux@roeck-us.net>
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

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
This should help with adding I3C support.
Module tested only.

 drivers/hwmon/lm75.c | 99 ++++++++++++++++++++------------------------
 1 file changed, 44 insertions(+), 55 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2c2205aec7d4..23b41e5a5b47 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -343,12 +343,8 @@ static int lm75_write_config(struct lm75_data *data, u16 set_mask,
 
 	if (data->current_conf != value) {
 		s32 err;
-		if (data->params->config_reg_16bits)
-			err = regmap_write(data->regmap, LM75_REG_CONF, value);
-		else
-			err = i2c_smbus_write_byte_data(data->client,
-							LM75_REG_CONF,
-							value);
+
+		err = regmap_write(data->regmap, LM75_REG_CONF, value);
 		if (err)
 			return err;
 		data->current_conf = value;
@@ -356,19 +352,6 @@ static int lm75_write_config(struct lm75_data *data, u16 set_mask,
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
@@ -469,7 +452,6 @@ static int lm75_write_temp(struct device *dev, u32 attr, long temp)
 static int lm75_update_interval(struct device *dev, long val)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
-	unsigned int reg;
 	u8 index;
 	s32 err;
 
@@ -489,19 +471,14 @@ static int lm75_update_interval(struct device *dev, long val)
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
+					 0x00c0, (3 - index) << 6);
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
@@ -598,6 +575,33 @@ static bool lm75_is_volatile_reg(struct device *dev, unsigned int reg)
 	return reg == LM75_REG_TEMP || reg == LM75_REG_CONF;
 }
 
+static int lm75_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct lm75_data *data = context;
+	struct i2c_client *client = data->client;
+	int ret;
+
+	if (reg == LM75_REG_CONF && !data->params->config_reg_16bits)
+		ret = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
+	else
+		ret = i2c_smbus_read_word_swapped(client, reg);
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
+	return i2c_smbus_write_word_swapped(client, reg, val);
+}
+
 static const struct regmap_config lm75_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
@@ -608,6 +612,8 @@ static const struct regmap_config lm75_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
+	.reg_read = lm75_i2c_reg_read,
+	.reg_write = lm75_i2c_reg_write,
 };
 
 static void lm75_disable_regulator(void *data)
@@ -620,9 +626,8 @@ static void lm75_disable_regulator(void *data)
 static void lm75_remove(void *data)
 {
 	struct lm75_data *lm75 = data;
-	struct i2c_client *client = lm75->client;
 
-	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
+	regmap_write(lm75->regmap, LM75_REG_CONF, lm75->orig_conf);
 }
 
 static int lm75_probe(struct i2c_client *client)
@@ -640,6 +645,8 @@ static int lm75_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	dev_set_drvdata(dev, data);
+
 	data->client = client;
 	data->kind = (uintptr_t)i2c_get_match_data(client);
 
@@ -673,11 +680,9 @@ static int lm75_probe(struct i2c_client *client)
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
 	data->current_conf = status;
 
@@ -972,32 +977,16 @@ static int lm75_detect(struct i2c_client *new_client,
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

