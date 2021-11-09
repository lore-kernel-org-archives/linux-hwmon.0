Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDE6C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1804C6103C
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhKIXvW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Nov 2021 18:51:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhKIXvV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Nov 2021 18:51:21 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8CEC061764
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Nov 2021 15:48:33 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so1182746otj.5
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Nov 2021 15:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7MkS88Tn/uFQA2bStmo+qswsvBrkenPa+VQz/DIJnAc=;
        b=EX89bNJ6nJyBqqkyC6r0asmezjgWbOwvEL795dX7CexS/pLxrf28EDwhNREWsWRHBs
         ggokHgDO89l6jAJ7cRPgJr7bose9jreNGvAGx+ISb58hzJMXAw+RZi/hMhnR1T++J5LD
         nVi0r5qvd4t1OwD4Ddr71cPqBBcoSvSvO5iqOEBPOK6L2sTrbDyPh/RqvZvaLnrjgXcd
         lwX6CDzXSLVYthJxEqy+7SpNwaafCwAbgUJWcyj2P8dRZQcKy2W9m6BGJcSyBTdYuRI0
         JTpL+yKupOSEq4Af1b4UbWJawbg4j/WcONzRXNNw8Db56iNvIGkUEK27Mr+6nLy5AgDa
         7Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=7MkS88Tn/uFQA2bStmo+qswsvBrkenPa+VQz/DIJnAc=;
        b=3aJI2m0W/E0M9UVua8G19N9b/AaBj+S0txhd2Jb1UbE8NDPggZAAh7vd5RgY+DkTNL
         3FEOeNZx+aJMUL2w4I5eR8O8tff02TCWSoMFzX2VHGDvpftG0l3CYo9ns6SEjy+EZ7ji
         8KsdlH85kBA8eClKFASio56grr0fBKe0qMnwz07w+yvzq7W/EccMbPrEDCwUH/U52l5j
         oEWY68Xxy8Z2tKjPdBMhN2Hh12i9oe5uIx9w/srM4t9ogu8PSFt/jdapp1PF9Io9YK/g
         jvAa1d7KbPrTz6j4MyJwegWab3TeXtG94BXa0FLf8C+uJ+T6H+fv6EJhKM81WD7lirPL
         YucA==
X-Gm-Message-State: AOAM531WiHHpWZU3CxIEMgRa56sY2ZK3noLouiRjNvKxcb6CCG3JxLxl
        RLzRV1spD6X9HZmZ7GUqC9DDIS8Kugk=
X-Google-Smtp-Source: ABdhPJwvgpwOFnLsyCQ59eVghrmZTG1I1vnz2D99VTK/2K5V2ZJRSgDySHTjXE9mr8K92hbSjOX0Cw==
X-Received: by 2002:a9d:12f2:: with SMTP id g105mr4160785otg.301.1636501712416;
        Tue, 09 Nov 2021 15:48:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w71sm2271029oiw.6.2021.11.09.15.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 15:48:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (tmp401) Hide register write address differences in regmap code
Date:   Tue,  9 Nov 2021 15:48:14 -0800
Message-Id: <20211109234814.3724798-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109234814.3724798-1-linux@roeck-us.net>
References: <20211109234814.3724798-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since we are using regmap access functions to write into chip registers,
we can hide the difference in register write addresses within regmap
code. By doing this we do not need to clear the regmap cache on register
writes, and the high level code does not need to bother about different
read/write register addresses.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp401.c | 69 +++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 0b1f31b02344..f7b6a2c4fbcf 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -39,15 +39,13 @@ enum chips { tmp401, tmp411, tmp431, tmp432, tmp435 };
  * reading and writing
  */
 #define TMP401_STATUS				0x02
-#define TMP401_CONFIG_READ			0x03
-#define TMP401_CONFIG_WRITE			0x09
-#define TMP401_CONVERSION_RATE_READ		0x04
-#define TMP401_CONVERSION_RATE_WRITE		0x0A
+#define TMP401_CONFIG				0x03
+#define TMP401_CONVERSION_RATE			0x04
 #define TMP401_TEMP_CRIT_HYST			0x21
 #define TMP401_MANUFACTURER_ID_REG		0xFE
 #define TMP401_DEVICE_ID_REG			0xFF
 
-static const u8 TMP401_TEMP_MSB_READ[7][3] = {
+static const u8 TMP401_TEMP_MSB[7][3] = {
 	{ 0x00, 0x01, 0x23 },	/* temp */
 	{ 0x06, 0x08, 0x16 },	/* low limit */
 	{ 0x05, 0x07, 0x15 },	/* high limit */
@@ -56,15 +54,6 @@ static const u8 TMP401_TEMP_MSB_READ[7][3] = {
 	{ 0x32, 0xf6, 0x00 },	/* highest */
 };
 
-static const u8 TMP401_TEMP_MSB_WRITE[7][3] = {
-	{ 0x00, 0x00, 0x00 },	/* temp (unused) */
-	{ 0x0C, 0x0E, 0x16 },	/* low limit */
-	{ 0x0B, 0x0D, 0x15 },	/* high limit */
-	{ 0x20, 0x19, 0x1a },	/* therm (crit) limit */
-	{ 0x30, 0x34, 0x00 },	/* lowest */
-	{ 0x32, 0xf6, 0x00 },	/* highest */
-};
-
 /* [0] = fault, [1] = low, [2] = high, [3] = therm/crit */
 static const u8 TMP432_STATUS_REG[] = {
 	0x1b, 0x36, 0x35, 0x37 };
@@ -240,10 +229,12 @@ static int tmp401_reg_write(void *context, unsigned int reg, unsigned int val)
 	struct i2c_client *client = data->client;
 
 	switch (reg) {
-	case 0x0b:		/* local temp high limit msb */
-	case 0x0c:		/* local temp low limit msb */
-	case 0x0d:		/* remote temp ligh limit msb */
-	case 0x0e:		/* remote temp low limit msb */
+	case 0x05:		/* local temp high limit msb */
+	case 0x06:		/* local temp low limit msb */
+	case 0x07:		/* remote temp ligh limit msb */
+	case 0x08:		/* remote temp low limit msb */
+		reg += 6;	/* adjust for register write address */
+		fallthrough;
 	case 0x15:		/* remote temp 2 high limit msb */
 	case 0x16:		/* remote temp 2 low limit msb */
 		return i2c_smbus_write_word_swapped(client, reg, val);
@@ -251,6 +242,10 @@ static int tmp401_reg_write(void *context, unsigned int reg, unsigned int val)
 	case 0x1a:
 	case 0x20:
 		return i2c_smbus_write_byte_data(client, reg, val >> 8);
+	case TMP401_CONVERSION_RATE:
+	case TMP401_CONFIG:
+		reg += 6;	/* adjust for register write address */
+		fallthrough;
 	default:
 		return i2c_smbus_write_byte_data(client, reg, val);
 	}
@@ -321,7 +316,7 @@ static int tmp401_temp_read(struct device *dev, u32 attr, int channel, long *val
 	case hwmon_temp_crit:
 	case hwmon_temp_lowest:
 	case hwmon_temp_highest:
-		reg = TMP401_TEMP_MSB_READ[tmp401_temp_reg_index[attr]][channel];
+		reg = TMP401_TEMP_MSB[tmp401_temp_reg_index[attr]][channel];
 		ret = regmap_read(regmap, reg, &regval);
 		if (ret < 0)
 			return ret;
@@ -329,7 +324,7 @@ static int tmp401_temp_read(struct device *dev, u32 attr, int channel, long *val
 		break;
 	case hwmon_temp_crit_hyst:
 		mutex_lock(&data->update_lock);
-		reg = TMP401_TEMP_MSB_READ[3][channel];
+		reg = TMP401_TEMP_MSB[3][channel];
 		ret = regmap_read(regmap, reg, &regval);
 		if (ret < 0)
 			goto unlock;
@@ -372,17 +367,10 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 	case hwmon_temp_min:
 	case hwmon_temp_max:
 	case hwmon_temp_crit:
-		reg = TMP401_TEMP_MSB_WRITE[tmp401_temp_reg_index[attr]][channel];
+		reg = TMP401_TEMP_MSB[tmp401_temp_reg_index[attr]][channel];
 		regval = tmp401_temp_to_register(val, data->extended_range,
 						 attr == hwmon_temp_crit ? 8 : 4);
 		ret = regmap_write(regmap, reg, regval);
-		if (ret)
-			break;
-		/*
-		 * Read and write limit registers are different, so we need to
-		 * reinitialize the cache.
-		 */
-		ret = regmap_reinit_cache(regmap, &tmp401_regmap_config);
 		break;
 	case hwmon_temp_crit_hyst:
 		if (data->extended_range)
@@ -390,7 +378,7 @@ static int tmp401_temp_write(struct device *dev, u32 attr, int channel,
 		else
 			val = clamp_val(val, 0, 127000);
 
-		reg = TMP401_TEMP_MSB_READ[3][channel];
+		reg = TMP401_TEMP_MSB[3][channel];
 		ret = regmap_read(regmap, reg, &regval);
 		if (ret < 0)
 			break;
@@ -415,7 +403,7 @@ static int tmp401_chip_read(struct device *dev, u32 attr, int channel, long *val
 
 	switch (attr) {
 	case hwmon_chip_update_interval:
-		ret = regmap_read(data->regmap, TMP401_CONVERSION_RATE_READ, &regval);
+		ret = regmap_read(data->regmap, TMP401_CONVERSION_RATE, &regval);
 		if (ret < 0)
 			return ret;
 		*val = (1 << (7 - regval)) * 125;
@@ -432,7 +420,7 @@ static int tmp401_chip_read(struct device *dev, u32 attr, int channel, long *val
 
 static int tmp401_set_convrate(struct regmap *regmap, long val)
 {
-	int err, rate;
+	int rate;
 
 	/*
 	 * For valid rates, interval can be calculated as
@@ -444,14 +432,7 @@ static int tmp401_set_convrate(struct regmap *regmap, long val)
 	 */
 	val = clamp_val(val, 125, 16000);
 	rate = 7 - __fls(val * 4 / (125 * 3));
-	err = regmap_write(regmap, TMP401_CONVERSION_RATE_WRITE, rate);
-	if (err)
-		return err;
-	/*
-	 * Read and write conversion rate registers are different, so we need to
-	 * reinitialize the cache.
-	 */
-	return regmap_reinit_cache(regmap, &tmp401_regmap_config);
+	return regmap_write(regmap, TMP401_CONVERSION_RATE, rate);
 }
 
 static int tmp401_chip_write(struct device *dev, u32 attr, int channel, long val)
@@ -563,12 +544,12 @@ static int tmp401_init_client(struct tmp401_data *data)
 	int ret;
 
 	/* Set conversion rate to 2 Hz */
-	ret = regmap_write(regmap, TMP401_CONVERSION_RATE_WRITE, 5);
+	ret = regmap_write(regmap, TMP401_CONVERSION_RATE, 5);
 	if (ret < 0)
 		return ret;
 
 	/* Start conversions (disable shutdown if necessary) */
-	ret = regmap_read(regmap, TMP401_CONFIG_READ, &config);
+	ret = regmap_read(regmap, TMP401_CONFIG, &config);
 	if (ret < 0)
 		return ret;
 
@@ -578,7 +559,7 @@ static int tmp401_init_client(struct tmp401_data *data)
 	data->extended_range = !!(config & TMP401_CONFIG_RANGE);
 
 	if (config != config_orig)
-		ret = regmap_write(regmap, TMP401_CONFIG_WRITE, config);
+		ret = regmap_write(regmap, TMP401_CONFIG, config);
 
 	return ret;
 }
@@ -638,11 +619,11 @@ static int tmp401_detect(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	reg = i2c_smbus_read_byte_data(client, TMP401_CONFIG_READ);
+	reg = i2c_smbus_read_byte_data(client, TMP401_CONFIG);
 	if (reg & 0x1b)
 		return -ENODEV;
 
-	reg = i2c_smbus_read_byte_data(client, TMP401_CONVERSION_RATE_READ);
+	reg = i2c_smbus_read_byte_data(client, TMP401_CONVERSION_RATE);
 	/* Datasheet says: 0x1-0x6 */
 	if (reg > 15)
 		return -ENODEV;
-- 
2.33.0

