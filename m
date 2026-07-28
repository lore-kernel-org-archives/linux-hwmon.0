Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0533C2609FD
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 01:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203955; cv=none; b=Ve/b4xxH8cNWBZp+8F6mwOqugZM6m+PJm8T1fX2FbFpuozaKY69Uh5e6/vLl9fsEzYl/DQftpbTPQIxvOmnsUKWk485Gu5fnRyM+EaYW8IP8yfcMIHxVVhQHYOFGGr39zGjfSz5hqywcIRwukqhBBxP07XybDwftQrG4ZcqzoBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203955; c=relaxed/simple;
	bh=FEC0rKzwmLUQ/orvcXtfoZYdSjj9hpDU7A6Seo0HC48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II8UeXNZJ2yWK3Ks7f6cpb9PJLRhy1+FjJjOf4QEQSFL/g4gQ1RF1m6mLgE1hqDHKmFM0J/a5Q7U49KGoQt62lpU4jsUv/qhsoQKKZhrm7xlQULKfqDym0TqISJQVaBR5soT0w5q0nci3Um9GLL3EOYmJqGhhnYFhUanT10eOS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QARdIHAz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QARdIHAz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1977345f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203948; x=1785808748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rV6KeBm1ayj5wr3qIujHsDgsty2nYjcbwF0ZIeud6k=;
        b=QARdIHAzjEM4+0D5n3M/HgoWCgYoiT73MJ1FxxbI/RrFeIdVi+l/BkaZXXzO01m0Yo
         NjlEP/KD6ckyLTY7FlmuTvgiC1gG0/dd95nLxO+rdcPQaQfL6xMXv5p7YixBZjOzCk/L
         MrYreksCSLxOz6WwBkCKEiiNdkNyfxDUXjeuILHBVDt48X+iuHnc3x2yy3pqvlRElf2+
         wAsb66PhYiwFBnhJBm9sZ2zE6MSDUm5US/lsI6/WyCTsGklmxXWiVCtw2sRnZQNDuIRk
         cRqxQ+qDYwJNBr6ZaUOozD8/fRRthzsM0ojLMf2q/Wuah13kW4ncZDmjJHqcUsl7PtLh
         uDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203948; x=1785808748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rV6KeBm1ayj5wr3qIujHsDgsty2nYjcbwF0ZIeud6k=;
        b=c3bicGo9XccFhX3GpjlsAv/EWHa23oLY2r+HTo+lEEX+88+lO/SwLGSxI/VEi2Crc/
         9bF6XtQx84y2LzC8anIowH8+/zS3ScI3VqVF5UzSoiL3ukARVyp/hKNm9GZ+EWHPKUvT
         RrPNU4yuX1Z8mUJdIcWjhTxKDv1/SC/yuEjAI7N6t9hB367e+lJdRhL7lDX3wsSRgp0O
         qhZTyT+Fav/pkGBXiuLci08ydYVtK3QcDsJLcIV8BJ5GyxlVzJTSQznus1bW2h8vNn47
         JTtG9410RkPCJ7WZusi8RG0HC4XTbMuSSvOqhoHOVskS0zQMJ+cw0MUi6r+OrnZhF7jM
         xCVA==
X-Gm-Message-State: AOJu0YwOrdO9aKk8u6gvyYzrOdzMBmEJwRD1IYmPyrJrjNkpsIFfuikp
	bPAxT/iJfdSeq4Vch6EDSPC5RH5EbUIY0Mx9ZBZFso2Ij+sXuGxI74G7WJJDlA1JjiA=
X-Gm-Gg: AR+sD10POSqoS3g4SZu/c/1lt3UjXX6QtbKaJF2kq1pwGbHoQWqHybz6GBNgoBV5in+
	SXN3w8MVwK39DLsYbpYPRMVVvmufTSGp8RKM6L6HajB4NLq23mwPjXiKMfPC9TJjPJ2b7a9rdPv
	t3zSgFdb5oAQ5ls17n6LzEBFnZRhoOkZ1E6XcwPVwKpg/wRkHS1QqQ4HnSt5XW2VCxI3np3dMFN
	+oiffa6b3fzqjOHIHF+vjWgdQCXZTuw6fKqhLP5u/EN7AdVAO5JCbhrJdPZjs4detogXsGQiOfd
	LCQjrbKYM4E7++y8lRNxM7OXHGx6W9LoCcMQZDNIv9KeR3BzWRS7w1n9MuOKiFbA1qvLzdh0jBh
	4+iFjjvjCthIiRx4A/Ja2kYCha+7W71M2Y0WGC00hQOCVLWKv8ovC89CJQ6lL6lJy6kbgeXLdaX
	V9/T7iB8p2NDEHjGElKRkf3nCNWI14FWahbnXa9WAsGeINYd7R/Kg7CO7Itl3Uf3qa+JYXz27RG
	vXlrKJrSxyw+qHkd2WtKK3ZZC1buolcBDTcXeE8XCFQtYU=
X-Received: by 2002:a05:6000:2c02:b0:47f:943a:a7f4 with SMTP id ffacd0b85a97d-47fb1f394f0mr277406f8f.61.1785203948210;
        Mon, 27 Jul 2026 18:59:08 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:07 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v5 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Date: Tue, 28 Jul 2026 04:58:48 +0300
Message-ID: <20260728015857.193890-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728015857.193890-1-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the existing TPS25990 driver to support the TPS1689 eFuse,
as both devices share the same command interface and functionality.

Update the documentation to include TPS1689 support.

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 Documentation/hwmon/tps25990.rst | 15 +++--
 drivers/hwmon/pmbus/tps25990.c   | 98 ++++++++++++++++++++++++++------
 2 files changed, 92 insertions(+), 21 deletions(-)

diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
index 04faec780d26..e8bc9a550bda 100644
--- a/Documentation/hwmon/tps25990.rst
+++ b/Documentation/hwmon/tps25990.rst
@@ -9,26 +9,31 @@ Supported chips:
 
     Prefix: 'tps25990'
 
-  * Datasheet
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
 
-    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+  * TI TPS1689
+
+    Prefix: 'tps1689'
+
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
 
 Author:
 
 	Jerome Brunet <jbrunet@baylibre.com>
+	Stoyan Bogdanov <sbogdanov@baylibre.com>
 
 Description
 -----------
 
-This driver implements support for TI TPS25990 eFuse.
+This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
 This is an integrated, high-current circuit protection and power
 management device with PMBUS interface
 
-Device compliant with:
+Devices are compliant with:
 
 - PMBus rev 1.3 interface.
 
-Device supports direct format for reading input voltages,
+Devices supports direct format for reading input voltages,
 output voltage, input current, input power and temperature.
 
 Due to the specificities of the chip, all history reset attributes
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 490dcd2a5fa5..7e2991a85da1 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -48,6 +48,7 @@
 					 PK_MIN_AVG_RST_MIN)
 
 enum chips {
+	tps1689,
 	tps25990,
 };
 
@@ -105,6 +106,8 @@ static int tps25990_mfr_write_protect_get(struct i2c_client *client)
 static int tps25990_read_word_data(struct i2c_client *client,
 				   int page, int phase, int reg)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
 	int ret;
 
 	switch (reg) {
@@ -193,9 +196,11 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_word_data(client, page, phase, reg);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
-					TPS25990_VIN_OVF_DIV);
-		ret += TPS25990_VIN_OVF_OFF;
+		if (data->chip_id == tps25990) {
+			ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
+						TPS25990_VIN_OVF_DIV);
+			ret += TPS25990_VIN_OVF_OFF;
+		}
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
@@ -207,9 +212,11 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
-					TPS25990_IIN_OCF_DIV);
-		ret += TPS25990_IIN_OCF_OFF;
+		if (data->chip_id == tps25990) {
+			ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
+						TPS25990_IIN_OCF_DIV);
+			ret += TPS25990_IIN_OCF_OFF;
+		}
 		break;
 
 	case PMBUS_VIRT_SAMPLES:
@@ -238,6 +245,8 @@ static int tps25990_read_word_data(struct i2c_client *client,
 static int tps25990_write_word_data(struct i2c_client *client,
 				    int page, int reg, u16 value)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
 	int ret;
 
 	switch (reg) {
@@ -253,20 +262,23 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		value = clamp_val(value, 0, 0xff);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
-
 	case PMBUS_VIN_OV_FAULT_LIMIT:
-		value -= TPS25990_VIN_OVF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
-					  TPS25990_VIN_OVF_NUM);
-		value = clamp_val(value, 0, 0xf);
+		if (data->chip_id == tps25990) {
+			value -= TPS25990_VIN_OVF_OFF;
+			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
+						  TPS25990_VIN_OVF_NUM);
+			value = clamp_val(value, 0, 0xf);
+		}
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
-		value -= TPS25990_IIN_OCF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
-					  TPS25990_IIN_OCF_NUM);
-		value = clamp_val(value, 0, 0x3f);
+		if (data->chip_id == tps25990) {
+			value -= TPS25990_IIN_OCF_OFF;
+			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
+						  TPS25990_IIN_OCF_NUM);
+			value = clamp_val(value, 0, 0x3f);
+		}
 		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
 		break;
 
@@ -347,6 +359,59 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 #endif
 
 static struct pmbus_driver_info tps25990_base_info[] = {
+	[tps1689] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 1166,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 1166,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = -2,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 140,
+		.b[PSC_TEMPERATURE] = 32103,
+		.R[PSC_TEMPERATURE] = -2,
+		/*
+		 * Current and Power measurement depends on the ohm value
+		 * of Rimon. m is multiplied by 1000 below to have an integer
+		 * and -3 is added to R to compensate.
+		 */
+		.format[PSC_CURRENT_IN] = direct,
+		.m[PSC_CURRENT_IN] = 9548,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -6,
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_CURRENT_OUT] = 24347,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = -3,
+		.format[PSC_POWER] = direct,
+		.m[PSC_POWER] = 2775,
+		.b[PSC_POWER] = 0,
+		.R[PSC_POWER] = -4,
+		.func[0] = (PMBUS_HAVE_VIN |
+			    PMBUS_HAVE_VOUT |
+			    PMBUS_HAVE_VMON |
+			    PMBUS_HAVE_IIN |
+			    PMBUS_HAVE_PIN |
+			    PMBUS_HAVE_TEMP |
+			    PMBUS_HAVE_STATUS_VOUT |
+			    PMBUS_HAVE_STATUS_IOUT |
+			    PMBUS_HAVE_STATUS_INPUT |
+			    PMBUS_HAVE_STATUS_TEMP |
+			    PMBUS_HAVE_SAMPLES),
+
+		.read_word_data = tps25990_read_word_data,
+		.write_word_data = tps25990_write_word_data,
+		.read_byte_data = tps25990_read_byte_data,
+		.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+		.reg_desc = tps25990_reg_desc,
+		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+		},
 	[tps25990] = {
 		.pages = 1,
 		.format[PSC_VOLTAGE_IN] = direct,
@@ -389,7 +454,6 @@ static struct pmbus_driver_info tps25990_base_info[] = {
 		.write_word_data = tps25990_write_word_data,
 		.read_byte_data = tps25990_read_byte_data,
 		.write_byte_data = tps25990_write_byte_data,
-
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
 		.reg_desc = tps25990_reg_desc,
 		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
@@ -398,12 +462,14 @@ static struct pmbus_driver_info tps25990_base_info[] = {
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ "tps1689", tps1689 },
 	{ "tps25990", tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps1689", .data = (void *)tps1689 },
 	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
-- 
2.43.0

