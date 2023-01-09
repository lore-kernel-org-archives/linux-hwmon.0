Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767CFC54EBD
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Jan 2023 23:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237914AbjAIXgM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Jan 2023 18:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237718AbjAIXgG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jan 2023 18:36:06 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBEE8FF3
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Jan 2023 15:36:02 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id l18so6671944qvt.13
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Jan 2023 15:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tt9ZKVvbkRyy+/76a2Ps7Ey7sKYXuH2yhPjmc2T/FY=;
        b=TgyNb8tlCwb8NVJ6ze4x0xBiUvKgpq9zpFpAfS3Ox+7imoYvYLplE4gz6haj1OJMX7
         k7Vg8JWDq3iR6dRmmx5EH1uGSrENw5CBAXxK66Of4yN8zR/pA+yZrQ2vT1716fTcZxb/
         ps0IHaTqlvVBZTc/xlED4EPxQXJ0Y9qr5FuQ0/7Qzo9eufKHOr4UFxwJ8MKDPpgGyCM4
         JyzLYI3UKc4oGIKq5xgEvZPXU4vu1ypcmawZ8FlqIABrxnJMjwLgCc+jFTNs6wbIDcVQ
         Xci/6rZhopDhwAguOa4ZrFWSXURMdEcft5zkAd+o2v/uH1Dm52BUQJEHu7SDfsMqNj7p
         HLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tt9ZKVvbkRyy+/76a2Ps7Ey7sKYXuH2yhPjmc2T/FY=;
        b=GXcjP/hzs2fV2ramCkgSW3nVw/J6HJjAW3mZqIT86zl5uutz3o2kRiMQW8Iu5JE4nw
         qW1Qwiim0VqumfK1eksI8NVy6/of30kMK5Rvsz+H47kYG+DXLv2Oxqt+Yqp0y9pzWSca
         jpAwOhIsSrDd9fwwHviSFOKpXQ6eC39PkhHW/HWH9kMpmGET92FcXJuEt+AsaoVbIA2s
         /ErSOAAfuqbqq5dULRkKXe9a73Vfm3q73x3YFzmxM3kGaZf37mCXsiLxZekwO6/65Xcq
         HLEy6jDDnQW9fy+JB7rwhSJws22qcuzgtO856yL5sGJoYL5ckoyp2oy4OqsnWHqJJKzJ
         OpNg==
X-Gm-Message-State: AFqh2kpk6M6AnH+fnBVKbmPhvWYJIyFHx94d8UEsowIOc11RTjTUlhs5
        xovRB/z7YR5PUROtEMeG5/DczTY2Td0nnBu4
X-Google-Smtp-Source: AMrXdXtIpYNEAmVRY5irkOGxmTOuD++Th6c7QsdR7BFePv/AqMM3LUBJpRN2RkWsTNnGSvM3M7TTyw==
X-Received: by 2002:a0c:fba2:0:b0:531:e436:8e92 with SMTP id m2-20020a0cfba2000000b00531e4368e92mr29324882qvp.22.1673307360861;
        Mon, 09 Jan 2023 15:36:00 -0800 (PST)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a450500b006fa8299b4d5sm6294846qkp.100.2023.01.09.15.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:36:00 -0800 (PST)
From:   Jonathan Cormier <jcormier@criticallink.com>
To:     linux-hwmon@vger.kernel.org
Cc:     John Pruitt <jpruitt@criticallink.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        Jonathan Cormier <jcormier@criticallink.com>
Subject: [PATCH v3 4/5] hwmon: ltc2945: Allow setting shunt resistor
Date:   Mon,  9 Jan 2023 18:35:33 -0500
Message-Id: <20230109233534.1932370-5-jcormier@criticallink.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109233534.1932370-1-jcormier@criticallink.com>
References: <20221214220727.1350784-3-jcormier@criticallink.com>
 <20230109233534.1932370-1-jcormier@criticallink.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: John Pruitt <jpruitt@criticallink.com>

Add the ability to specify the value of the shunt resistor in the
device tree instead of assuming it is 1 milliOhm. The value in the
device tree has the name shunt-resistor-micro-ohms and the
default value is 1000 micro-ohms in order to preserve the
current behavior.

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: John Pruitt <jpruitt@criticallink.com>
---
 drivers/hwmon/ltc2945.c | 85 +++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 32 deletions(-)

diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
index c66acf8d2124..0d743d75459c 100644
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
 static int ltc2945_reg_to_val(struct device *dev, u8 reg, u64 *regval)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 shunt_resistor = data->shunt_resistor;
 	unsigned int control;
 	u8 buf[3];
 	u64 val;
@@ -98,9 +110,7 @@ static int ltc2945_reg_to_val(struct device *dev, u8 reg, u64 *regval)
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
@@ -114,6 +124,9 @@ static int ltc2945_reg_to_val(struct device *dev, u8 reg, u64 *regval)
 			/* 0.5 mV * 25 uV = 0.0125 uV resolution. */
 			val = (val * 25LL) >> 1;
 		}
+		val *= 1000;
+		val = DIV_ROUND_CLOSEST_ULL(val, shunt_resistor);
+
 		break;
 	case LTC2945_VIN_H:
 	case LTC2945_MAX_VIN_H:
@@ -136,14 +149,9 @@ static int ltc2945_reg_to_val(struct device *dev, u8 reg, u64 *regval)
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
@@ -153,9 +161,11 @@ static int ltc2945_reg_to_val(struct device *dev, u8 reg, u64 *regval)
 }
 
 static int ltc2945_val_to_reg(struct device *dev, u8 reg,
-			      unsigned long val, unsigned long *regval)
+			      u64 val, u64 *regval)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u32 shunt_resistor = data->shunt_resistor;
 	unsigned int control;
 	int ret;
 
@@ -166,9 +176,6 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
 	case LTC2945_MAX_POWER_THRES_H:
 	case LTC2945_MIN_POWER_THRES_H:
 		/*
-		 * Convert to register value by assuming current is measured
-		 * with an 1mOhm sense resistor, similar to current
-		 * measurements.
 		 * Control register bit 0 selects if voltage at SENSE+/VDD
 		 * or voltage at ADIN is used to measure power, which in turn
 		 * determines register calculations.
@@ -178,14 +185,16 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
 			return ret;
 		if (control & CONTROL_MULT_SELECT) {
 			/* 25 mV * 25 uV = 0.625 uV resolution. */
-			val = DIV_ROUND_CLOSEST(val, 625);
+			val *= shunt_resistor;
+			val = DIV_ROUND_CLOSEST_ULL(val, 625 * 1000);
 		} else {
 			/*
 			 * 0.5 mV * 25 uV = 0.0125 uV resolution.
 			 * Divide first to avoid overflow;
 			 * accept loss of accuracy.
 			 */
-			val = DIV_ROUND_CLOSEST(val, 25) * 2;
+			val *= shunt_resistor;
+			val = DIV_ROUND_CLOSEST_ULL(val, 25 * 1000) * 2;
 		}
 		break;
 	case LTC2945_VIN_H:
@@ -209,14 +218,9 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
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
+		val = DIV_ROUND_CLOSEST_ULL(val, 25 * 1000);
 		break;
 	default:
 		return -EINVAL;
@@ -243,12 +247,13 @@ static ssize_t ltc2945_value_store(struct device *dev,
 				   const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	u8 reg = attr->index;
 	unsigned long val;
 	u8 regbuf[3];
 	int num_regs;
-	unsigned long regval;
+	u64 regval;
 	int ret;
 
 	ret = kstrtoul(buf, 10, &val);
@@ -281,7 +286,8 @@ static ssize_t ltc2945_history_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	u8 reg = attr->index;
 	int num_regs = is_power_reg(reg) ? 3 : 2;
 	u8 buf_min[3] = { 0xff, 0xff, 0xff };
@@ -333,7 +339,8 @@ static ssize_t ltc2945_bool_show(struct device *dev,
 				 struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct ltc2945_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	unsigned int fault;
 	int ret;
 
@@ -462,6 +469,12 @@ static int ltc2945_probe(struct i2c_client *client)
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
@@ -469,11 +482,19 @@ static int ltc2945_probe(struct i2c_client *client)
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

