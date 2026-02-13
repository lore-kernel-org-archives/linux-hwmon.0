Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5B1509AB
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 00:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941720; cv=none; b=IFFsq2YlQDyCZdFtePSwzweV/FrNLCms+v1e7EEdfKa0Wl+Va18UZhA+xCNAUOG+JVSYXU89vuV8tQW1P2U1r+MxjPEIAmNFlpqjha9n2HvUimzOR2KbwwMMwZfvuYaAsQEwl0OZlnt11SZjkRYYOR1AMlvpbNF+0CojKszYW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941720; c=relaxed/simple;
	bh=MBxXvm9SN85wIbPQozevHNwhIzjPtliVSJlxB+6iP8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jV9yp9O4xIVDHxQWgxWKpoX0TJMY4yaiIPYEYZNVXf4U3iRcyyl1TeeIY8HsbCp25FT1wWiEWhWJ6qyP2sRfnSicjHeMtp+M2uBNAmhyK83EAIQ2xV7dykULrCIIvxnDoIstinh+cEQIFQZ+Diw9mtsolw1IMpTHQZqgMNqd0mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DZ67Pj5r; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DZ67Pj5r"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so2757395e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 16:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770941718; x=1771546518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkpDAlBYfnDGxcVrWynzmo5K/OoXZi98TxFwnjNQDvI=;
        b=DZ67Pj5r2NRtJDLbAF9tPO3yboADCvKntmnCV3l2o5HoXxZ75Uj4Fd7+7+V/muCkwJ
         +v+6ssbzcnMjx3XharQrFOl6hhsYACYZCgUk0LY2QodGaIJe+clwHGOMnzo54k0zXHYQ
         pDYbOo9g+X+n3ArPujQ95PcaVVrAp23FnUMEBmXc5LoIEV01uapMz/hc1eWZl9S9DWzO
         ddcYq+yv9UcHEa1j1yuenQCglpBp5DV+5sIu0BZfKEzW0aAL76HKlPPcEsxdm/XAWc9B
         4hXLKDfpid/OCcSH4seyE3WiMz4W+TjKnt+4nM9opoFKm8sEFAgwJ+ixbgvH2KnfhaOh
         Xr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770941718; x=1771546518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nkpDAlBYfnDGxcVrWynzmo5K/OoXZi98TxFwnjNQDvI=;
        b=nSu5XLlCmxN0qzoIxtGUaNvYZ0R/+IfPfVxoo/wunpuN6Aj0XIZhZvVnNPDliomrGT
         qxXmeKlNI7/R5pW1Mt7CxOPiP1cBvCZYhnhCKyusq1pHojpeRzQjAI8jnMjgpv3521hk
         Icu+86VrKVylNqgqX/Vf5OjPdIs3KBHhPMnl9wxW75w74k433BYDYxmfuXhROqvPenRy
         LyhSgiTKWAuwrE5jalGEr6n/HsJI0vOM2hI6Oe9j6LPkJDY0Jru7bY3LOPWgBKn1/fBE
         m7ZBPmk16RPtv5aOuSW2WRCgsIhjeDNqAxIclAXiUK0dHOOR7EfFknmQvVn5HB378Ur/
         SyUw==
X-Gm-Message-State: AOJu0Yw9nCmyjWFHlT2F5KqWyYycyPqlYytjaTZTQEc2QCDYzmzU7SWW
	/kEA5hnt81iDh43YABKMg7K8hF47b5GjZb3p8X1K0szAuANthFZ4++DeLhyGsdKdQdA=
X-Gm-Gg: AZuq6aKPlzbCUpT02x//XISoSEYDJUB0Z76SrRgEB2Ckl5sXl4SdjSXeOEXSku86kIp
	dKBfgI+zYL5pMISwwf35bUEtY2SIhklsmhCpADcWH8HPyNQwpabm8wHVJGg3Xnko4jsJboWt4iY
	kNYxr8KFIPJWt0jXYomH/ZERT/mCXQ90qrC2zjVjYomAMBihTfcnN4yxw5DlSJ8AxccsR/jcZS6
	+j5VmU9Ysk2HiVl/y2PdRQOJ/1C71vZ7Ubh3wY0MdvjneahoMAlAh/qNDQeMYo+jqUVDvSjWAfG
	9P/spVamGST0I0GDoCveUO2MzoGuePqoFbDN2Cvn0iQu4jFRMGqJvRb9HQKVOSMDvf9KLe5AF29
	JNqr1BI9WwgOT24rVDWptzIW2bsmbtfaIUotT1Nyt0iyExYD4ykRPL8M2YBb+Lp4bCX7GB0bV4v
	kNHDl2GlzXNQ03P3EgB/N/IDAcd5UTNH1V1ZoVSt4fZldTKjqjQVKU/YVL+4q2zKEi+E6+aK+3s
	Y5Y//qaIg==
X-Received: by 2002:a05:600c:1381:b0:483:ea6:8767 with SMTP id 5b1f17b1804b1-48371098c8dmr12349945e9.36.1770941717627;
        Thu, 12 Feb 2026 16:15:17 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm234440945e9.6.2026.02.12.16.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:15:17 -0800 (PST)
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
Subject: [PATCH v2 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct conversion
Date: Fri, 13 Feb 2026 02:14:06 +0200
Message-Id: <20260213001408.2454567-2-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213001408.2454567-1-sbogdanov@baylibre.com>
References: <20260213001408.2454567-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework existing implementation for calculation of direct
format conversion for TPS25990. With this implamentation
is leveraged code reusability for non standard parameters.
 - Add enum for parameter
 - Add m, b, R structure to hold value per device
 - Add data structure to hold for pmbus_driver_info and
   local_direct_values
 - Conversion functions are implemented according to formula from
   TPS25990 datasheet
 - Remove previously used defines replace with structure

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 drivers/hwmon/pmbus/tps25990.c | 115 +++++++++++++++++++++++++--------
 1 file changed, 88 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index c13edd7e1abf..33f6367f797c 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -36,17 +36,58 @@
 #define  TPS25990_UNLOCKED		BIT(7)
 
 #define TPS25990_8B_SHIFT		2
-#define TPS25990_VIN_OVF_NUM		525100
-#define TPS25990_VIN_OVF_DIV		10163
-#define TPS25990_VIN_OVF_OFF		155
-#define TPS25990_IIN_OCF_NUM		953800
-#define TPS25990_IIN_OCF_DIV		129278
-#define TPS25990_IIN_OCF_OFF		157
 
 #define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
 					 PK_MIN_AVG_RST_AVG  | \
 					 PK_MIN_AVG_RST_MIN)
 
+enum tps25990_parameters {
+	TPS25990_VIN_OVF = 0, /* VIN over volatage fault */
+	TPS25990_IIN_OCF, /* IIN Over currect fault */
+	TPS25590_DIRECT_VALUES_MAX, /* Max value ensure there enough space */
+};
+
+struct local_direct_value {
+	int m[TPS25590_DIRECT_VALUES_MAX]; /* mantissa for direct data format */
+	int b[TPS25590_DIRECT_VALUES_MAX]; /* offset */
+	int R[TPS25590_DIRECT_VALUES_MAX]; /* exponent */
+};
+
+struct tps25990_data {
+	struct pmbus_driver_info *info;
+	struct local_direct_value *info_local;
+};
+
+static int tps25990_raw_to_value(struct i2c_client *client, int param, int raw)
+{
+	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
+	struct local_direct_value *info_local = data->info_local;
+
+	/* Formula : X = (Y / 10^R - b) / m */
+	if (info_local->R[param] >= 0)
+		raw /= int_pow(10, info_local->R[param]);
+	else
+		raw *= int_pow(10, -info_local->R[param]);
+
+	return DIV_ROUND_CLOSEST(raw - info_local->b[param], info_local->m[param]);
+}
+
+static unsigned int tps25990_value_to_raw(struct i2c_client *client, int param, int val)
+{
+	struct tps25990_data *data = (struct tps25990_data *)of_device_get_match_data(&client->dev);
+	struct local_direct_value *info_local = data->info_local;
+
+	/* Formula : Y = ( m * X + b) * 10^R */
+	val = (long)val * info_local->m[param] + info_local->b[param];
+
+	if (info_local->R[param] >= 0)
+		val *= int_pow(10, info_local->R[param]);
+	else
+		val = DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R[param]));
+
+	return val;
+}
+
 /*
  * Arbitrary default Rimon value: 1kOhm
  * This correspond to an overcurrent limit of 55A, close to the specified limit
@@ -184,9 +225,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_word_data(client, page, phase, reg);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
-					TPS25990_VIN_OVF_DIV);
-		ret += TPS25990_VIN_OVF_OFF;
+		ret = tps25990_raw_to_value(client, TPS25990_VIN_OVF, ret);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
@@ -198,9 +237,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
-					TPS25990_IIN_OCF_DIV);
-		ret += TPS25990_IIN_OCF_OFF;
+		ret = tps25990_raw_to_value(client, TPS25990_IIN_OCF, ret);
 		break;
 
 	case PMBUS_VIRT_SAMPLES:
@@ -246,17 +283,13 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		break;
 
 	case PMBUS_VIN_OV_FAULT_LIMIT:
-		value -= TPS25990_VIN_OVF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
-					  TPS25990_VIN_OVF_NUM);
+		value = tps25990_value_to_raw(client, TPS25990_VIN_OVF, value);
 		value = clamp_val(value, 0, 0xf);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
-		value -= TPS25990_IIN_OCF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
-					  TPS25990_IIN_OCF_NUM);
+		value = tps25990_value_to_raw(client, TPS25990_IIN_OCF, value);
 		value = clamp_val(value, 0, 0x3f);
 		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
 		break;
@@ -337,7 +370,16 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
-static const struct pmbus_driver_info tps25990_base_info = {
+struct local_direct_value tps25590_local_info = {
+	.m[TPS25990_VIN_OVF] = 10163,
+	.b[TPS25990_VIN_OVF] = -30081,
+	.R[TPS25990_VIN_OVF] = -4,
+	.m[TPS25990_IIN_OCF] = 9538,
+	.b[TPS25990_IIN_OCF] = 0,
+	.R[TPS25990_IIN_OCF] = -6,
+};
+
+static struct pmbus_driver_info tps25990_base_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
 	.m[PSC_VOLTAGE_IN] = 5251,
@@ -386,14 +428,19 @@ static const struct pmbus_driver_info tps25990_base_info = {
 #endif
 };
 
+struct tps25990_data data_tps25990 = {
+	.info = &tps25990_base_info,
+	.info_local = &tps25590_local_info,
+};
+
 static const struct i2c_device_id tps25990_i2c_id[] = {
-	{ "tps25990" },
+	{ .name = "tps25990", .driver_data = (kernel_ulong_t)&data_tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
-	{ .compatible = "ti,tps25990" },
+	{ .compatible = "ti,tps25990", .data = &data_tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps25990_of_match);
@@ -401,23 +448,37 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
 static int tps25990_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct pmbus_driver_info *info;
+	struct tps25990_data *data;
 	u32 rimon = TPS25990_DEFAULT_RIMON;
+	struct pmbus_driver_info *info_get;
+	struct local_direct_value *info_local_get;
 	int ret;
 
 	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
 	if (ret < 0 && ret != -EINVAL)
 		return dev_err_probe(dev, ret, "failed to get rimon\n");
 
-	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
-	if (!info)
+	data = (struct tps25990_data *)of_device_get_match_data(dev);
+	if (!data)
+		return -EOPNOTSUPP;
+
+	info_get = data->info;
+	/* Make copy of pmbus_info and replace it to preserve original values */
+	data->info = devm_kmemdup(dev, info_get, sizeof(*info_get), GFP_KERNEL);
+	if (!data->info)
+		return -ENOMEM;
+
+	info_local_get = data->info_local;
+	/* Make copy of pmbus_info and replace it to preserve original values */
+	data->info_local = devm_kmemdup(dev, info_local_get, sizeof(*info_local_get), GFP_KERNEL);
+	if (!data->info_local)
 		return -ENOMEM;
 
 	/* Adapt the current and power scale for each instance */
-	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
-	tps25990_set_m(&info->m[PSC_POWER], rimon);
+	tps25990_set_m(&data->info->m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&data->info->m[PSC_POWER], rimon);
 
-	return pmbus_do_probe(client, info);
+	return pmbus_do_probe(client, data->info);
 }
 
 static struct i2c_driver tps25990_driver = {
-- 
2.34.1

