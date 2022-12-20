Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55207C001B2
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Dec 2022 00:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbiLTAFy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Dec 2022 19:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbiLTAFt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Dec 2022 19:05:49 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9722195
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Dec 2022 16:05:47 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3c090251d59so149127257b3.4
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Dec 2022 16:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdJqSX2G2zw0Vj3PmkjTC4cwbi3aa13NSHPDTsl1J+I=;
        b=fkXAdZn91R0RYe5eyEr7h0qBxh4XaS9GCJku1R38NQkWi6RyFAybKqhz7bNctPbcuC
         j2+u5vQHsMWhX6dI+EhhTaknK2q0br1LDeNI+0EAVlFI4tCZgUdzZnQjci7axTp6B19D
         WpeEur7Ej6AJjpijR9vhIvQJ/RZ4vTb5/0j1p8LaEhJicoCQsVGGNbUJ8JtDGQJePh0W
         PnO4yfX8wFdrTmM6D3Lwxejk1t4vT1PK/ebIze14pvitG5KKH055VzDpJOn0wUt3EG9t
         UXZfnURZVUqA9m66hEtzvD0Fhf9ckF1RiiMK+1eKv+uA1vpFRcF29bLhm4iv17NnkZj2
         b4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdJqSX2G2zw0Vj3PmkjTC4cwbi3aa13NSHPDTsl1J+I=;
        b=7mPeOIPNudD2cPK2ttv2jMbRY2HSCyC9IC4GUmW6fIIGHBrl5Kxt/n4IK3Amfp0UoY
         BcwBGopjJURJy2mpkibx/DufAjDvqKKPeo+iWTf+dQ6txKYZbJ/0xMl0VL78+y8g9jjf
         Odr1J+ejGfsJMgI0ZgVQJvfxoDQC17aULyrWmGQUKidvCTb8Y9PNiyBgL0Hya9dbHW+f
         DjBlUaic7DTTwgwlpukcb40/jX5YBQGu+V9+FXuWb38TVkt8IQwzUD1ITTSveTpKbu4W
         INkp7g45bUmKxyEDEKBoTPAdkj0HqbaR0ZMazc+sY2VTBnBAFq94jhexu9W5DPjrDv/7
         elTA==
X-Gm-Message-State: ANoB5pmw9bv70l0t3W9o51BjDp6IwfxwKCP5oLEAMT+TzJ8krz5wWiek
        y8TfbV2eS/bA72xNsUcGW0FKCgbgnK7gkfVb
X-Google-Smtp-Source: AA0mqf5LTN8DHah6oM83AyHQOGC75QHe+IZ5VXtogmysJmmTdV3ufndrh4LjCwVdv8r7cs2XDXczSA==
X-Received: by 2002:a05:7500:1d8f:b0:ea:51d4:37a2 with SMTP id dv15-20020a0575001d8f00b000ea51d437a2mr4022846gab.49.1671494745752;
        Mon, 19 Dec 2022 16:05:45 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id o70-20020a374149000000b006e702033b15sm7721430qka.66.2022.12.19.16.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 16:05:45 -0800 (PST)
From:   "Cormier, Jonathan" <jcormier@criticallink.com>
To:     linux-hwmon@vger.kernel.org
Cc:     John Pruitt <jpruitt@criticallink.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        "Cormier, Jonathan" <jcormier@criticallink.com>
Subject: [PATCH v2 3/4] hwmon: ltc2945: Allow setting shunt resistor
Date:   Mon, 19 Dec 2022 19:04:56 -0500
Message-Id: <20221220000457.1163446-4-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221220000457.1163446-1-jcormier@criticallink.com>
References: <20221214220727.1350784-1-jcormier@criticallink.com>
 <20221220000457.1163446-1-jcormier@criticallink.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: John Pruitt <jpruitt@criticallink.com>

Added the ability to specify the value of the shunt resistor in the
device tree instead of assuming it is 1 milliOhm. The value in the
device tree has the name shunt-resistor-micro-ohms and the
default value is 1000 micro-ohms in order to preserve the
current behavior.

Signed-off-by: "Cormier, Jonathan" <jcormier@criticallink.com>
Signed-off-by: John Pruitt <jpruitt@criticallink.com>
---
 drivers/hwmon/ltc2945.c | 80 +++++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
index 9af3e3821152..fc7d399b2c85 100644
--- a/drivers/hwmon/ltc2945.c
+++ b/drivers/hwmon/ltc2945.c
@@ -64,6 +64,16 @@ static const struct of_device_id __maybe_unused ltc2945_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ltc2945_of_match);

+/**
+ * struct ltc2945_data - LTC2945 device data
+ * @regmap: regmap device
+ * @shunt_resistor: shunt resistor value in micro ohms (1000 by default)
+ */
+struct ltc2945_data {
+	struct regmap *regmap;
+	u32 shunt_resistor;
+};
+
 static inline bool is_power_reg(u8 reg)
 {
 	return reg < LTC2945_SENSE_H;
@@ -72,7 +82,9 @@ static inline bool is_power_reg(u8 reg)
 /* Return the value from the given register in uW, mV, or mA */
 static long long ltc2945_reg_to_val(struct device *dev, u8 reg)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 shunt_resistor = data->shunt_resistor;
 	unsigned int control;
 	u8 buf[3];
 	long long val;
@@ -98,9 +110,7 @@ static long long ltc2945_reg_to_val(struct device *dev, u8 reg)
 	case LTC2945_MAX_POWER_THRES_H:
 	case LTC2945_MIN_POWER_THRES_H:
 		/*
-		 * Convert to uW by assuming current is measured with
-		 * an 1mOhm sense resistor, similar to current
-		 * measurements.
+		 * Convert to uW
 		 * Control register bit 0 selects if voltage at SENSE+/VDD
 		 * or voltage at ADIN is used to measure power.
 		 */
@@ -114,6 +124,8 @@ static long long ltc2945_reg_to_val(struct device *dev, u8 reg)
 			/* 0.5 mV * 25 uV = 0.0125 uV resolution. */
 			val = (val * 25LL) >> 1;
 		}
+		val *= 1000;
+		val = DIV_ROUND_CLOSEST_ULL(val, shunt_resistor);
 		break;
 	case LTC2945_VIN_H:
 	case LTC2945_MAX_VIN_H:
@@ -136,14 +148,9 @@ static long long ltc2945_reg_to_val(struct device *dev, u8 reg)
 	case LTC2945_MIN_SENSE_H:
 	case LTC2945_MAX_SENSE_THRES_H:
 	case LTC2945_MIN_SENSE_THRES_H:
-		/*
-		 * 25 uV resolution. Convert to current as measured with
-		 * an 1 mOhm sense resistor, in mA. If a different sense
-		 * resistor is installed, calculate the actual current by
-		 * dividing the reported current by the sense resistor value
-		 * in mOhm.
-		 */
-		val *= 25;
+		/* 25 uV resolution. Convert to mA. */
+		val *= 25 * 1000;
+		val = DIV_ROUND_CLOSEST_ULL(val, shunt_resistor);
 		break;
 	default:
 		return -EINVAL;
@@ -154,7 +161,9 @@ static long long ltc2945_reg_to_val(struct device *dev, u8 reg)
 static int ltc2945_val_to_reg(struct device *dev, u8 reg,
 			      unsigned long val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 shunt_resistor = data->shunt_resistor;
 	unsigned int control;
 	int ret;

@@ -165,9 +174,6 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
 	case LTC2945_MAX_POWER_THRES_H:
 	case LTC2945_MIN_POWER_THRES_H:
 		/*
-		 * Convert to register value by assuming current is measured
-		 * with an 1mOhm sense resistor, similar to current
-		 * measurements.
 		 * Control register bit 0 selects if voltage at SENSE+/VDD
 		 * or voltage at ADIN is used to measure power, which in turn
 		 * determines register calculations.
@@ -177,14 +183,16 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
 			return ret;
 		if (control & CONTROL_MULT_SELECT) {
 			/* 25 mV * 25 uV = 0.625 uV resolution. */
-			val = DIV_ROUND_CLOSEST(val, 625);
+			val *= shunt_resistor;
+			val = DIV_ROUND_CLOSEST(val, 625 * 1000);
 		} else {
 			/*
 			 * 0.5 mV * 25 uV = 0.0125 uV resolution.
 			 * Divide first to avoid overflow;
 			 * accept loss of accuracy.
 			 */
-			val = DIV_ROUND_CLOSEST(val, 25) * 2;
+			val *= shunt_resistor;
+			val = DIV_ROUND_CLOSEST(val, 25 * 1000) * 2;
 		}
 		break;
 	case LTC2945_VIN_H:
@@ -208,14 +216,9 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
 	case LTC2945_MIN_SENSE_H:
 	case LTC2945_MAX_SENSE_THRES_H:
 	case LTC2945_MIN_SENSE_THRES_H:
-		/*
-		 * 25 uV resolution. Convert to current as measured with
-		 * an 1 mOhm sense resistor, in mA. If a different sense
-		 * resistor is installed, calculate the actual current by
-		 * dividing the reported current by the sense resistor value
-		 * in mOhm.
-		 */
-		val = DIV_ROUND_CLOSEST(val, 25);
+		/* 25 uV resolution. Convert to  mA. */
+		val *= shunt_resistor;
+		val = DIV_ROUND_CLOSEST(val, 25 * 1000);
 		break;
 	default:
 		return -EINVAL;
@@ -240,7 +243,8 @@ static ssize_t ltc2945_value_store(struct device *dev,
 				   const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	u8 reg = attr->index;
 	unsigned long val;
 	u8 regbuf[3];
@@ -275,7 +279,8 @@ static ssize_t ltc2945_history_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	u8 reg = attr->index;
 	int num_regs = is_power_reg(reg) ? 3 : 2;
 	u8 buf_min[3] = { 0xff, 0xff, 0xff };
@@ -327,7 +332,8 @@ static ssize_t ltc2945_bool_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	unsigned int fault;
 	int ret;

@@ -456,6 +462,12 @@ static int ltc2945_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct regmap *regmap;
+	struct ltc2945_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	dev_set_drvdata(dev, data);

 	regmap = devm_regmap_init_i2c(client, &ltc2945_regmap_config);
 	if (IS_ERR(regmap)) {
@@ -463,11 +475,19 @@ static int ltc2945_probe(struct i2c_client *client)
 		return PTR_ERR(regmap);
 	}

+	data->regmap = regmap;
+	if (device_property_read_u32(dev, "shunt-resistor-micro-ohms",
+				     &data->shunt_resistor))
+		data->shunt_resistor = 1000;
+
+	if (data->shunt_resistor == 0)
+		return -EINVAL;
+
 	/* Clear faults */
 	regmap_write(regmap, LTC2945_FAULT, 0x00);

 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
-							   regmap,
+							   data,
 							   ltc2945_groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
--
2.25.1
