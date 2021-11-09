Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF75C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2693D611CA
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhKIXvO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Nov 2021 18:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhKIXvN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Nov 2021 18:51:13 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1C3C061764
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Nov 2021 15:48:26 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so1182439otj.5
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Nov 2021 15:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LhljZlod3798uwVnTPNTE5tiRnw9ylMmxIMZbI9snj4=;
        b=qTK1rde3tA3MCVvcoqCG4hV7WME/lte2zE+5YebE1kJkTCS8CCnPWp8x1mq5eiBZR1
         uecsCWM0sFUxVrRsXX3XAU2CbrATAtvXZDeUfIwEd+NtduKzPRT+/h47M+hpRqzttxmJ
         0fw6FBC70T+RZFWslCCxHnctnJoOwydnNKGk5I0fJvOvkUCZitjlogU7ReoVk8KXLfK7
         GpYmp1+JDz311bW/G9ligNVR8fXvvuxo2bewIE3fW8IBxFBlwMzxD/W5Hi1mD+QdXuCZ
         A3osOClSz9x4EbNpcXYv6TCGHDB9x67ABbwMS5pk2Cily46DC7NvDXCwLmsfaHYP+0nI
         54LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LhljZlod3798uwVnTPNTE5tiRnw9ylMmxIMZbI9snj4=;
        b=jm1/Eis4R4cFm9/xcLNvuVUddMbuPKTSZuDC0GXIHTBRZ1UZrT2MggylsHF+aufmyt
         gujuNwI0amUalPQtQtFMdEaIP3QwLM/j7CELpC7odpA1R0fhdvrVV2FZksZoMOoKSWMY
         gaCFa6W4ls2FN6DRwJLvu6karN5t++Fnk3WL8wjUL0P8oWaPAcXpV3Chw4k1tF12YDca
         oMYsqmsp38y2Eg9YBK2Jrf/y1qravDVUSPv2CdwhwnVFh7NGYaKDPAsUOg78hf8O8CqD
         qljaAQrVUWFlI/ASxz77kF2YsRxqFpypxE/XlELW71ljHHz/mAR0MFw8N3+65sswKQFU
         ns7Q==
X-Gm-Message-State: AOAM531Rh+d53a5NLs1WY8lFjeVVZhfWJTWV8RpoZWLCRDsXSHdSs+ls
        gos716HTI6K3JNoXRRRhZJbSjx2jEm4=
X-Google-Smtp-Source: ABdhPJxozARG2nAyFB7CzALZBv2dh7+BaappEUWd3DH3jzww03lZst3h/uKW6JsMy2CvqflWnx7ssQ==
X-Received: by 2002:a05:6830:1514:: with SMTP id k20mr9079156otp.147.1636501705719;
        Tue, 09 Nov 2021 15:48:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg38sm4843004oib.40.2021.11.09.15.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 15:48:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (tmp401) Use regmap
Date:   Tue,  9 Nov 2021 15:48:13 -0800
Message-Id: <20211109234814.3724798-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109234814.3724798-1-linux@roeck-us.net>
References: <20211109234814.3724798-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use regmap for register accesses to be able to utilize its caching
functionality. This also lets us hide register access differences
in regmap code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig  |   1 +
 drivers/hwmon/tmp401.c | 225 +++++++++++++++++++++++++++--------------
 2 files changed, 150 insertions(+), 76 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 64bd3dfba2c4..e0e6e5889591 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1939,6 +1939,7 @@ config SENSORS_TMP108
 config SENSORS_TMP401
 	tristate "Texas Instruments TMP401 and compatibles"
 	depends on I2C
+	select REGMAP
 	help
 	  If you say yes here you get support for Texas Instruments TMP401,
 	  TMP411, TMP431, TMP432, and TMP435 temperature sensor chips.
diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index f595d8555370..0b1f31b02344 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -25,6 +25,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 /* Addresses to scan */
@@ -114,6 +115,7 @@ MODULE_DEVICE_TABLE(i2c, tmp401_id);
 
 struct tmp401_data {
 	struct i2c_client *client;
+	struct regmap *regmap;
 	struct mutex update_lock;
 	enum chips kind;
 
@@ -128,32 +130,30 @@ struct tmp401_data {
 	struct hwmon_chip_info chip;
 };
 
-static int tmp401_register_to_temp(u16 reg, bool extended)
-{
-	int temp = reg;
-
-	if (extended)
-		temp -= 64 * 256;
+/* regmap */
 
-	return DIV_ROUND_CLOSEST(temp * 125, 32);
-}
-
-static u16 tmp401_temp_to_register(long temp, bool extended, int zbits)
+static bool tmp401_regmap_is_volatile(struct device *dev, unsigned int reg)
 {
-	if (extended) {
-		temp = clamp_val(temp, -64000, 191000);
-		temp += 64000;
-	} else {
-		temp = clamp_val(temp, 0, 127000);
+	switch (reg) {
+	case 0:			/* local temp msb */
+	case 1:			/* remote temp msb */
+	case 2:			/* status */
+	case 0x10:		/* remote temp lsb */
+	case 0x15:		/* local temp lsb */
+	case 0x1b:		/* status (tmp432) */
+	case 0x23 ... 0x24:	/* remote temp 2 msb / lsb */
+	case 0x30 ... 0x37:	/* lowest/highest temp; status (tmp432) */
+		return true;
+	default:
+		return false;
 	}
-
-	return DIV_ROUND_CLOSEST(temp * (1 << (8 - zbits)), 1000) << zbits;
 }
 
-static int tmp401_reg_read(struct tmp401_data *data, unsigned int reg)
+static int tmp401_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
+	struct tmp401_data *data = context;
 	struct i2c_client *client = data->client;
-	int val, regval;
+	int regval;
 
 	switch (reg) {
 	case 0:			/* local temp msb */
@@ -172,55 +172,71 @@ static int tmp401_reg_read(struct tmp401_data *data, unsigned int reg)
 		/* work around register overlap between TMP411 and TMP432 */
 		if (reg == 0xf6)
 			reg = 0x36;
-		return i2c_smbus_read_word_swapped(client, reg);
+		regval = i2c_smbus_read_word_swapped(client, reg);
+		if (regval < 0)
+			return regval;
+		*val = regval;
+		break;
 	case 0x19:		/* critical limits, 8-bit registers */
 	case 0x1a:
 	case 0x20:
 		regval = i2c_smbus_read_byte_data(client, reg);
 		if (regval < 0)
 			return regval;
-		return regval << 8;
+		*val = regval << 8;
+		break;
 	case 0x1b:
 	case 0x35 ... 0x37:
-		if (data->kind == tmp432)
-			return i2c_smbus_read_byte_data(client, reg);
+		if (data->kind == tmp432) {
+			regval = i2c_smbus_read_byte_data(client, reg);
+			if (regval < 0)
+				return regval;
+			*val = regval;
+			break;
+		}
 		/* simulate TMP432 status registers */
 		regval = i2c_smbus_read_byte_data(client, TMP401_STATUS);
 		if (regval < 0)
 			return regval;
-		val = 0;
+		*val = 0;
 		switch (reg) {
 		case 0x1b:	/* open / fault */
 			if (regval & TMP401_STATUS_REMOTE_OPEN)
-				val |= BIT(1);
+				*val |= BIT(1);
 			break;
 		case 0x35:	/* high limit */
 			if (regval & TMP401_STATUS_LOCAL_HIGH)
-				val |= BIT(0);
+				*val |= BIT(0);
 			if (regval & TMP401_STATUS_REMOTE_HIGH)
-				val |= BIT(1);
+				*val |= BIT(1);
 			break;
 		case 0x36:	/* low limit */
 			if (regval & TMP401_STATUS_LOCAL_LOW)
-				val |= BIT(0);
+				*val |= BIT(0);
 			if (regval & TMP401_STATUS_REMOTE_LOW)
-				val |= BIT(1);
+				*val |= BIT(1);
 			break;
 		case 0x37:	/* therm / crit limit */
 			if (regval & TMP401_STATUS_LOCAL_CRIT)
-				val |= BIT(0);
+				*val |= BIT(0);
 			if (regval & TMP401_STATUS_REMOTE_CRIT)
-				val |= BIT(1);
+				*val |= BIT(1);
 			break;
 		}
-		return val;
+		break;
 	default:
-		return i2c_smbus_read_byte_data(client, reg);
+		regval = i2c_smbus_read_byte_data(client, reg);
+		if (regval < 0)
+			return regval;
+		*val = regval;
+		break;
 	}
+	return 0;
 }
 
-static int tmp401_reg_write(struct tmp401_data *data, unsigned int reg, unsigned int val)
+static int tmp401_reg_write(void *context, unsigned int reg, unsigned int val)
 {
+	struct tmp401_data *data = context;
 	struct i2c_client *client = data->client;
 
 	switch (reg) {
@@ -240,6 +256,41 @@ static int tmp401_reg_write(struct tmp401_data *data, unsigned int reg, unsigned
 	}
 }
 
+static const struct regmap_config tmp401_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_reg = tmp401_regmap_is_volatile,
+	.reg_read = tmp401_reg_read,
+	.reg_write = tmp401_reg_write,
+};
+
+/* temperature conversion */
+
+static int tmp401_register_to_temp(u16 reg, bool extended)
+{
+	int temp = reg;
+
+	if (extended)
+		temp -= 64 * 256;
+
+	return DIV_ROUND_CLOSEST(temp * 125, 32);
+}
+
+static u16 tmp401_temp_to_register(long temp, bool extended, int zbits)
+{
+	if (extended) {
+		temp = clamp_val(temp, -64000, 191000);
+		temp += 64000;
+	} else {
+		temp = clamp_val(temp, 0, 127000);
+	}
+
+	return DIV_ROUND_CLOSEST(temp * (1 << (8 - zbits)), 1000) << zbits;
+}
+
+/* hwmon API functions */
+
 static const u8 tmp401_temp_reg_index[] = {
 	[hwmon_temp_input] = 0,
 	[hwmon_temp_min] = 1,
@@ -259,7 +310,9 @@ static const u8 tmp401_status_reg_index[] = {
 static int tmp401_temp_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
-	int reg, regval;
+	struct regmap *regmap = data->regmap;
+	unsigned int regval;
+	int reg, ret;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -269,36 +322,35 @@ static int tmp401_temp_read(struct device *dev, u32 attr, int channel, long *val
 	case hwmon_temp_lowest:
 	case hwmon_temp_highest:
 		reg = TMP401_TEMP_MSB_READ[tmp401_temp_reg_index[attr]][channel];
-		regval = tmp401_reg_read(data, reg);
-		if (regval < 0)
-			return regval;
+		ret = regmap_read(regmap, reg, &regval);
+		if (ret < 0)
+			return ret;
 		*val = tmp401_register_to_temp(regval, data->extended_range);
 		break;
 	case hwmon_temp_crit_hyst:
 		mutex_lock(&data->update_lock);
 		reg = TMP401_TEMP_MSB_READ[3][channel];
-		regval = tmp401_reg_read(data, reg);
-		if (regval < 0)
+		ret = regmap_read(regmap, reg, &regval);
+		if (ret < 0)
 			goto unlock;
 		*val = tmp401_register_to_temp(regval, data->extended_range);
-		regval = tmp401_reg_read(data, TMP401_TEMP_CRIT_HYST);
-		if (regval < 0)
+		ret = regmap_read(regmap, TMP401_TEMP_CRIT_HYST, &regval);
+		if (ret < 0)
 			goto unlock;
 		*val -= regval * 1000;
-		regval = 0;
 unlock:
 		mutex_unlock(&data->update_lock);
-		if (regval < 0)
-			return regval;
+		if (ret < 0)
+			return ret;
 		break;
 	case hwmon_temp_fault:
 	case hwmon_temp_min_alarm:
 	case hwmon_temp_max_alarm:
 	case hwmon_temp_crit_alarm:
 		reg = TMP432_STATUS_REG[tmp401_status_reg_index[attr]];
-		regval = tmp401_reg_read(data, reg);
-		if (regval < 0)
-			return regval;
+		ret = regmap_read(regmap, reg, &regval);
+		if (ret < 0)
+			return ret;
 		*val = !!(regval & BIT(channel));
 		break;
 	default:
@@ -311,7 +363,9 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 			     long val)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
-	int reg, regval, ret, temp;
+	struct regmap *regmap = data->regmap;
+	unsigned int regval;
+	int reg, ret, temp;
 
 	mutex_lock(&data->update_lock);
 	switch (attr) {
@@ -321,7 +375,14 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 		reg = TMP401_TEMP_MSB_WRITE[tmp401_temp_reg_index[attr]][channel];
 		regval = tmp401_temp_to_register(val, data->extended_range,
 						 attr == hwmon_temp_crit ? 8 : 4);
-		ret = tmp401_reg_write(data, reg, regval);
+		ret = regmap_write(regmap, reg, regval);
+		if (ret)
+			break;
+		/*
+		 * Read and write limit registers are different, so we need to
+		 * reinitialize the cache.
+		 */
+		ret = regmap_reinit_cache(regmap, &tmp401_regmap_config);
 		break;
 	case hwmon_temp_crit_hyst:
 		if (data->extended_range)
@@ -330,13 +391,13 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 			val = clamp_val(val, 0, 127000);
 
 		reg = TMP401_TEMP_MSB_READ[3][channel];
-		ret = tmp401_reg_read(data, reg);
+		ret = regmap_read(regmap, reg, &regval);
 		if (ret < 0)
 			break;
-		temp = tmp401_register_to_temp(ret, data->extended_range);
+		temp = tmp401_register_to_temp(regval, data->extended_range);
 		val = clamp_val(val, temp - 255000, temp);
 		regval = ((temp - val) + 500) / 1000;
-		ret = tmp401_reg_write(data, TMP401_TEMP_CRIT_HYST, regval);
+		ret = regmap_write(regmap, TMP401_TEMP_CRIT_HYST, regval);
 		break;
 	default:
 		ret = -EOPNOTSUPP;
@@ -349,13 +410,14 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 static int tmp401_chip_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
-	int regval;
+	u32 regval;
+	int ret;
 
 	switch (attr) {
 	case hwmon_chip_update_interval:
-		regval = tmp401_reg_read(data, TMP401_CONVERSION_RATE_READ);
-		if (regval < 0)
-			return regval;
+		ret = regmap_read(data->regmap, TMP401_CONVERSION_RATE_READ, &regval);
+		if (ret < 0)
+			return ret;
 		*val = (1 << (7 - regval)) * 125;
 		break;
 	case hwmon_chip_temp_reset_history:
@@ -368,7 +430,7 @@ static int tmp401_chip_read(struct device *dev, u32 attr, int channel, long *val
 	return 0;
 }
 
-static int tmp401_set_convrate(struct i2c_client *client, struct tmp401_data *data, long val)
+static int tmp401_set_convrate(struct regmap *regmap, long val)
 {
 	int err, rate;
 
@@ -382,22 +444,26 @@ static int tmp401_set_convrate(struct i2c_client *client, struct tmp401_data *da
 	 */
 	val = clamp_val(val, 125, 16000);
 	rate = 7 - __fls(val * 4 / (125 * 3));
-	err = i2c_smbus_write_byte_data(client, TMP401_CONVERSION_RATE_WRITE, rate);
+	err = regmap_write(regmap, TMP401_CONVERSION_RATE_WRITE, rate);
 	if (err)
 		return err;
-	return 0;
+	/*
+	 * Read and write conversion rate registers are different, so we need to
+	 * reinitialize the cache.
+	 */
+	return regmap_reinit_cache(regmap, &tmp401_regmap_config);
 }
 
 static int tmp401_chip_write(struct device *dev, u32 attr, int channel, long val)
 {
 	struct tmp401_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
+	struct regmap *regmap = data->regmap;
 	int err;
 
 	mutex_lock(&data->update_lock);
 	switch (attr) {
 	case hwmon_chip_update_interval:
-		err = tmp401_set_convrate(client, data, val);
+		err = tmp401_set_convrate(regmap, val);
 		break;
 	case hwmon_chip_temp_reset_history:
 		if (val != 1) {
@@ -408,7 +474,7 @@ static int tmp401_chip_write(struct device *dev, u32 attr, int channel, long val
 		 * Reset history by writing any value to any of the
 		 * minimum/maximum registers (0x30-0x37).
 		 */
-		err = i2c_smbus_write_byte_data(client, 0x30, 0);
+		err = regmap_write(regmap, 0x30, 0);
 		break;
 	default:
 		err = -EOPNOTSUPP;
@@ -488,18 +554,23 @@ static const struct hwmon_ops tmp401_ops = {
 	.write = tmp401_write,
 };
 
-static int tmp401_init_client(struct tmp401_data *data,
-			      struct i2c_client *client)
+/* chip initialization, detect, probe */
+
+static int tmp401_init_client(struct tmp401_data *data)
 {
-	int config, config_orig, status = 0;
+	struct regmap *regmap = data->regmap;
+	u32 config, config_orig;
+	int ret;
 
-	/* Set the conversion rate to 2 Hz */
-	i2c_smbus_write_byte_data(client, TMP401_CONVERSION_RATE_WRITE, 5);
+	/* Set conversion rate to 2 Hz */
+	ret = regmap_write(regmap, TMP401_CONVERSION_RATE_WRITE, 5);
+	if (ret < 0)
+		return ret;
 
 	/* Start conversions (disable shutdown if necessary) */
-	config = i2c_smbus_read_byte_data(client, TMP401_CONFIG_READ);
-	if (config < 0)
-		return config;
+	ret = regmap_read(regmap, TMP401_CONFIG_READ, &config);
+	if (ret < 0)
+		return ret;
 
 	config_orig = config;
 	config &= ~TMP401_CONFIG_SHUTDOWN;
@@ -507,11 +578,9 @@ static int tmp401_init_client(struct tmp401_data *data,
 	data->extended_range = !!(config & TMP401_CONFIG_RANGE);
 
 	if (config != config_orig)
-		status = i2c_smbus_write_byte_data(client,
-						   TMP401_CONFIG_WRITE,
-						   config);
+		ret = regmap_write(regmap, TMP401_CONFIG_WRITE, config);
 
-	return status;
+	return ret;
 }
 
 static int tmp401_detect(struct i2c_client *client,
@@ -602,6 +671,10 @@ static int tmp401_probe(struct i2c_client *client)
 	mutex_init(&data->update_lock);
 	data->kind = i2c_match_id(tmp401_id, client)->driver_data;
 
+	data->regmap = devm_regmap_init(dev, NULL, data, &tmp401_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
 	/* initialize configuration data */
 	data->chip.ops = &tmp401_ops;
 	data->chip.info = data->info;
@@ -639,7 +712,7 @@ static int tmp401_probe(struct i2c_client *client)
 	}
 
 	/* Initialize the TMP401 chip */
-	status = tmp401_init_client(data, client);
+	status = tmp401_init_client(data);
 	if (status < 0)
 		return status;
 
-- 
2.33.0

