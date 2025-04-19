Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53821DE4D5
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079249; cv=none; b=c4hVajWrIudq4BoAx1A/gb0zGV0kBZ06IqnuJAdcYpjXmRjEqZY6HPQ29mHsr3q1tIdGlHc9pqri+cnIXTsvPrhvINDCFwC6nS14DiPs5wBiid/I2nN0nMLpGlRKFXeFLr4NdaUT+VZKmuLRjQr1Wvkb0YlEcPaleJJGdAZSt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079249; c=relaxed/simple;
	bh=O4kAPBpe7Ep3sNUAjTDLMfADVCj8nLAYhgaQP9ZV6xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1GrCxwjHN9/orfOceGVE0IXGMWVkfdlQLzltU36NtLxdGXFCCjHB/FvpMwuFr9VdnUhMsSxk6Whw1+C6zv4cxyNFUxCrwwnahUOXsBvEO0eTZiXMKXodcj5Fo3TUpAdcf0wR3Oto0sNcYDsQdowavQVMkN1EnmithA18iyBhc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4veX64G; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4veX64G"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739525d4e12so2329503b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745079246; x=1745684046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVn0swgGvpndDvpidY8Rgs2m25rVKykbQWLaRXTM6TE=;
        b=F4veX64G9/fZKMFME0lIt0EfN11EY4CgNvB5/DR6Dupzs3f1BE9hpdS4grbAE8F2pI
         IMD5zufT8KzTRv2PpTzLTEegslshQyMpb/Mp/Xfm4dS4bNBK0MFga/g0G5U+Fbro9o7z
         zKLOSBbALNuegZh+h2TGW5eWyFyLh5xXwBVCiuCR2p14jvVnS+emB4aUwMQspo8gQ9We
         Y/madPBBcB1Kd4HhKrriWFYyUdRXY2FapQwIoDj4RTOyeRis49nbRUW92lVi6aE/G5Gy
         1XBeuSFc9R+7pVk9/BNtWi0E8AaEM7eaO7wmZ5BXD/olU9STnySKeF40Y18qmxRTZvW8
         xJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745079246; x=1745684046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVn0swgGvpndDvpidY8Rgs2m25rVKykbQWLaRXTM6TE=;
        b=ZRBzhTYDaz6Ty3uoooD+tqv7IYunmDYoudG7+p3BY+AwdVCswLmkqD5aMRNdqdR2qA
         twgRR5UtHEtcep/16ghb7Xr/XX+UDrP5Mkjt8RXDvOwfXNiVXIeHyyI1xQKUjEfOoY3r
         njgAPxxX0FXnNwrrOOmGYYP6fBPRwpXOyQEHZsYhtKTooGmkfwO24LgQJFXmtpmKFpPH
         nTZxlvMf1MWWtHcVedX35iA9EFetqAYin6QUpEo5cN3igypLeVq320sgk8DhrhR5vsXm
         3LTK29k/9AY5BqDkGmEe6Yn1NebQLD50oPwm3PuAfSQ7B3LxBWY3JeoJGI6CBQ87C77A
         nowg==
X-Gm-Message-State: AOJu0YwwJs0Q3wyNIrtc3vqbbPSuV8kYEqrczUMtFBI+gjEp0+SuL1W6
	aRwLzPsCvbE50TZvFTnpNVjqXsen7Jnq0pTyhKrq7MT9XJk8e+qGib5orA==
X-Gm-Gg: ASbGncvLPYNVR1lPfTX7tIUfcnklyFAWYyhdC9duD64Jog9BA7VNyrAgYswp4MGJtUh
	cICTEk6Wwk4xg6TjaREbueYNtBpfVU7BkUgvHnFYUsGp+ARXamI9LjR9DEvIiEEhHSk0LrVnN2W
	X/8UCqu5O7Hdt7rWnH6Cc9S4YZyheHvKJQlAm2OhJBlK4PqSNNujL55hkOF+mQYzzB8N/PywbUl
	6yvKaU3wQAdoeH+Pch3wwMAaiV8d15NL5sArP5YRh1Z2MA/pQJRRLCL+U6IHEhsCiLJs9LsFptM
	kVgftwP123CM0Zxr6BHKD5kW5WQLx2oQycGlRJAhPB5KkYoFAn2cF3BAxxOHb6q7
X-Google-Smtp-Source: AGHT+IHFCLP5Ery9hRTy82Una21GmzeYdsMkowVAxTxBmG6nuB7scbcWSRfAHe6F4ss10h5wgYy3Yg==
X-Received: by 2002:a17:90a:d00f:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-3087bbbb7admr10017642a91.33.1745079246574;
        Sat, 19 Apr 2025 09:14:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e0feac1sm3261581a91.33.2025.04.19.09.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:14:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yo-Jung Lin <leo.lin@canonical.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] hwmon: (spd5118) Split into common and I2C specific code
Date: Sat, 19 Apr 2025 09:13:51 -0700
Message-ID: <20250419161356.2528986-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250419161356.2528986-1-linux@roeck-us.net>
References: <20250419161356.2528986-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split spd5118 driver into common and I2C specific code to enable
adding support for I3C.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/spd5118.c | 305 +++++++++++++++++++++-------------------
 1 file changed, 157 insertions(+), 148 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 358152868d96..02eb21684c3a 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -305,51 +305,6 @@ static bool spd5118_vendor_valid(u8 bank, u8 id)
 	return id && id != 0x7f;
 }
 
-/* Return 0 if detection is successful, -ENODEV otherwise */
-static int spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
-{
-	struct i2c_adapter *adapter = client->adapter;
-	int regval;
-
-	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
-				     I2C_FUNC_SMBUS_WORD_DATA))
-		return -ENODEV;
-
-	regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
-	if (regval != 0x5118)
-		return -ENODEV;
-
-	regval = i2c_smbus_read_word_data(client, SPD5118_REG_VENDOR);
-	if (regval < 0 || !spd5118_vendor_valid(regval & 0xff, regval >> 8))
-		return -ENODEV;
-
-	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_CAPABILITY);
-	if (regval < 0)
-		return -ENODEV;
-	if (!(regval & SPD5118_CAP_TS_SUPPORT) || (regval & 0xfc))
-		return -ENODEV;
-
-	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CLR);
-	if (regval)
-		return -ENODEV;
-	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_ERROR_CLR);
-	if (regval)
-		return -ENODEV;
-
-	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_REVISION);
-	if (regval < 0 || (regval & 0xc1))
-		return -ENODEV;
-
-	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CONFIG);
-	if (regval < 0)
-		return -ENODEV;
-	if (regval & ~SPD5118_TS_DISABLE)
-		return -ENODEV;
-
-	strscpy(info->type, "spd5118", I2C_NAME_SIZE);
-	return 0;
-}
-
 static const struct hwmon_channel_info *spd5118_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
@@ -483,7 +438,7 @@ static bool spd5118_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_range_cfg spd5118_regmap_range_cfg[] = {
+static const struct regmap_range_cfg spd5118_i2c_regmap_range_cfg[] = {
 	{
 	.selector_reg   = SPD5118_REG_I2C_LEGACY_MODE,
 	.selector_mask  = SPD5118_LEGACY_PAGE_MASK,
@@ -495,7 +450,7 @@ static const struct regmap_range_cfg spd5118_regmap_range_cfg[] = {
 	},
 };
 
-static const struct regmap_config spd5118_regmap_config = {
+static const struct regmap_config spd5118_i2c_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x7ff,
@@ -503,11 +458,153 @@ static const struct regmap_config spd5118_regmap_config = {
 	.volatile_reg = spd5118_volatile_reg,
 	.cache_type = REGCACHE_MAPLE,
 
-	.ranges = spd5118_regmap_range_cfg,
-	.num_ranges = ARRAY_SIZE(spd5118_regmap_range_cfg),
+	.ranges = spd5118_i2c_regmap_range_cfg,
+	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
 };
 
-static int spd5118_init(struct i2c_client *client)
+static int spd5118_suspend(struct device *dev)
+{
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 regval;
+	int err;
+
+	/*
+	 * Make sure the configuration register in the regmap cache is current
+	 * before bypassing it.
+	 */
+	err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
+	if (err < 0)
+		return err;
+
+	regcache_cache_bypass(regmap, true);
+	regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
+			   SPD5118_TS_DISABLE);
+	regcache_cache_bypass(regmap, false);
+
+	regcache_cache_only(regmap, true);
+	regcache_mark_dirty(regmap);
+
+	return 0;
+}
+
+static int spd5118_resume(struct device *dev)
+{
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+
+	regcache_cache_only(regmap, false);
+	return regcache_sync(regmap);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
+
+static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
+{
+	unsigned int capability, revision, vendor, bank;
+	struct spd5118_data *data;
+	struct device *hwmon_dev;
+	int err;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	err = regmap_read(regmap, SPD5118_REG_CAPABILITY, &capability);
+	if (err)
+		return err;
+	if (!(capability & SPD5118_CAP_TS_SUPPORT))
+		return -ENODEV;
+
+	err = regmap_read(regmap, SPD5118_REG_REVISION, &revision);
+	if (err)
+		return err;
+
+	err = regmap_read(regmap, SPD5118_REG_VENDOR, &bank);
+	if (err)
+		return err;
+	err = regmap_read(regmap, SPD5118_REG_VENDOR + 1, &vendor);
+	if (err)
+		return err;
+	if (!spd5118_vendor_valid(bank, vendor))
+		return -ENODEV;
+
+	data->regmap = regmap;
+	mutex_init(&data->nvmem_lock);
+	dev_set_drvdata(dev, data);
+
+	err = spd5118_nvmem_init(dev, data);
+	/* Ignore if NVMEM support is disabled */
+	if (err && err != -EOPNOTSUPP) {
+		dev_err_probe(dev, err, "failed to register nvmem\n");
+		return err;
+	}
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "spd5118",
+							 regmap, &spd5118_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	/*
+	 * From JESD300-5B
+	 *   MR2 bits [5:4]: Major revision, 1..4
+	 *   MR2 bits [3:1]: Minor revision, 0..8? Probably a typo, assume 1..8
+	 */
+	dev_info(dev, "DDR5 temperature sensor: vendor 0x%02x:0x%02x revision %d.%d\n",
+		 bank & 0x7f, vendor, ((revision >> 4) & 0x03) + 1, ((revision >> 1) & 0x07) + 1);
+
+	return 0;
+}
+
+/* I2C */
+
+/* Return 0 if detection is successful, -ENODEV otherwise */
+static int spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	int regval;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
+	if (regval != 0x5118)
+		return -ENODEV;
+
+	regval = i2c_smbus_read_word_data(client, SPD5118_REG_VENDOR);
+	if (regval < 0 || !spd5118_vendor_valid(regval & 0xff, regval >> 8))
+		return -ENODEV;
+
+	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_CAPABILITY);
+	if (regval < 0)
+		return -ENODEV;
+	if (!(regval & SPD5118_CAP_TS_SUPPORT) || (regval & 0xfc))
+		return -ENODEV;
+
+	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CLR);
+	if (regval)
+		return -ENODEV;
+	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_ERROR_CLR);
+	if (regval)
+		return -ENODEV;
+
+	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_REVISION);
+	if (regval < 0 || (regval & 0xc1))
+		return -ENODEV;
+
+	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CONFIG);
+	if (regval < 0)
+		return -ENODEV;
+	if (regval & ~SPD5118_TS_DISABLE)
+		return -ENODEV;
+
+	strscpy(info->type, "spd5118", I2C_NAME_SIZE);
+	return 0;
+}
+
+static int spd5118_i2c_init(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	int err, regval, mode;
@@ -559,116 +656,28 @@ static int spd5118_init(struct i2c_client *client)
 	return 0;
 }
 
-static int spd5118_probe(struct i2c_client *client)
+static int spd5118_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	unsigned int regval, revision, vendor, bank;
-	struct spd5118_data *data;
-	struct device *hwmon_dev;
 	struct regmap *regmap;
 	int err;
 
-	err = spd5118_init(client);
+	err = spd5118_i2c_init(client);
 	if (err)
 		return err;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	regmap = devm_regmap_init_i2c(client, &spd5118_regmap_config);
+	regmap = devm_regmap_init_i2c(client, &spd5118_i2c_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
 
-	err = regmap_read(regmap, SPD5118_REG_CAPABILITY, &regval);
-	if (err)
-		return err;
-	if (!(regval & SPD5118_CAP_TS_SUPPORT))
-		return -ENODEV;
-
-	err = regmap_read(regmap, SPD5118_REG_REVISION, &revision);
-	if (err)
-		return err;
-
-	err = regmap_read(regmap, SPD5118_REG_VENDOR, &bank);
-	if (err)
-		return err;
-	err = regmap_read(regmap, SPD5118_REG_VENDOR + 1, &vendor);
-	if (err)
-		return err;
-	if (!spd5118_vendor_valid(bank, vendor))
-		return -ENODEV;
-
-	data->regmap = regmap;
-	mutex_init(&data->nvmem_lock);
-	dev_set_drvdata(dev, data);
-
-	err = spd5118_nvmem_init(dev, data);
-	/* Ignore if NVMEM support is disabled */
-	if (err && err != -EOPNOTSUPP) {
-		dev_err_probe(dev, err, "failed to register nvmem\n");
-		return err;
-	}
-
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, "spd5118",
-							 regmap, &spd5118_chip_info,
-							 NULL);
-	if (IS_ERR(hwmon_dev))
-		return PTR_ERR(hwmon_dev);
-
-	/*
-	 * From JESD300-5B
-	 *   MR2 bits [5:4]: Major revision, 1..4
-	 *   MR2 bits [3:1]: Minor revision, 0..8? Probably a typo, assume 1..8
-	 */
-	dev_info(dev, "DDR5 temperature sensor: vendor 0x%02x:0x%02x revision %d.%d\n",
-		 bank & 0x7f, vendor, ((revision >> 4) & 0x03) + 1, ((revision >> 1) & 0x07) + 1);
-
-	return 0;
+	return spd5118_common_probe(dev, regmap);
 }
 
-static int spd5118_suspend(struct device *dev)
-{
-	struct spd5118_data *data = dev_get_drvdata(dev);
-	struct regmap *regmap = data->regmap;
-	u32 regval;
-	int err;
-
-	/*
-	 * Make sure the configuration register in the regmap cache is current
-	 * before bypassing it.
-	 */
-	err = regmap_read(regmap, SPD5118_REG_TEMP_CONFIG, &regval);
-	if (err < 0)
-		return err;
-
-	regcache_cache_bypass(regmap, true);
-	regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
-			   SPD5118_TS_DISABLE);
-	regcache_cache_bypass(regmap, false);
-
-	regcache_cache_only(regmap, true);
-	regcache_mark_dirty(regmap);
-
-	return 0;
-}
-
-static int spd5118_resume(struct device *dev)
-{
-	struct spd5118_data *data = dev_get_drvdata(dev);
-	struct regmap *regmap = data->regmap;
-
-	regcache_cache_only(regmap, false);
-	return regcache_sync(regmap);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
-
-static const struct i2c_device_id spd5118_id[] = {
+static const struct i2c_device_id spd5118_i2c_id[] = {
 	{ "spd5118" },
 	{ }
 };
-MODULE_DEVICE_TABLE(i2c, spd5118_id);
+MODULE_DEVICE_TABLE(i2c, spd5118_i2c_id);
 
 static const struct of_device_id spd5118_of_ids[] = {
 	{ .compatible = "jedec,spd5118", },
@@ -676,20 +685,20 @@ static const struct of_device_id spd5118_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, spd5118_of_ids);
 
-static struct i2c_driver spd5118_driver = {
+static struct i2c_driver spd5118_i2c_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "spd5118",
 		.of_match_table = spd5118_of_ids,
 		.pm = pm_sleep_ptr(&spd5118_pm_ops),
 	},
-	.probe		= spd5118_probe,
-	.id_table	= spd5118_id,
+	.probe		= spd5118_i2c_probe,
+	.id_table	= spd5118_i2c_id,
 	.detect		= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? spd5118_detect : NULL,
 	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
 };
 
-module_i2c_driver(spd5118_driver);
+module_i2c_driver(spd5118_i2c_driver);
 
 MODULE_AUTHOR("René Rebe <rene@exactcode.de>");
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
-- 
2.45.2

