Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8023749EC;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034239; cv=none; b=mIHKJBwWTle0ymVyUkogyzWCP5GmLvAiI9Om17x9ThybIMxRwHIVX4zL/BFdBqW9kEg3h4Wmn5rtouttRKKAg6BXNxPBlbBq/G230G1srgPN/fBA5Cgyf4lulK8KJz9fSdtMoGlEQ1B+2ooY/YeRJhjwU+4zxzb1eBLbRMvpRy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034239; c=relaxed/simple;
	bh=TxzCz3ZYghENudthA1L+y52SCDq5lFoJdHa1xyg/kyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4HlnnwWBhgtmJ8ecNOBiyaI+8s7Gquw1xm4mYzSIHSNHCLFu3pI+364NVD1KQW4aBDMLhdg70ySIVUYBKlrVdCmTfm44Ew5iak0cSLABoo+fH7USOvO0pOat0R/tY7F1QmeMlBg5sNsUAN2HlgvrsM7UH6PoQNADsNO8r4a0hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx+gSmUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cx+gSmUr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72E2FC4AF0F;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781034239;
	bh=TxzCz3ZYghENudthA1L+y52SCDq5lFoJdHa1xyg/kyI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Cx+gSmUrd7HASEkpvTUEGTZOpq2NgudhAPv2mpM1pO36v4BVe5KsquF+VDjgU77Ou
	 iFsqY3+0D50lTpaa3Mlr4wnpxK3VLSkNbxNcycuqAt2gn1kBSBgnzRgAEgaPzgQRE8
	 mrdaUVJdgzAYsZMbDesAwqBuFjrGxafssGZGxs3UFFbVebx9vrxQGcip4R8PIQ6EYu
	 Amkc00JA47gse87llB0lr5JsEHzTKJCjuuhfZZuEt+nKaGcNJQt6RWtr1vxP7MjlQn
	 /sb96Ibr0z416NJT5ppK/DjfTnrXAZrqwsmY6eXhRHuJiGlZXeHqrYEMofrOWcQ2nW
	 caS8UYvi6ZTOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B12ACD8CA8;
	Tue,  9 Jun 2026 19:43:59 +0000 (UTC)
From: Ferdinand Schwenk via B4 Relay <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Date: Tue, 09 Jun 2026 21:43:12 +0200
Subject: [PATCH v3 3/3] hwmon: ina238: add update_interval_us attribute
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-hwmon-ina238-update-interval-us-v2-v3-3-016b55567950@advastore.com>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, richard.leitner@linux.dev, 
 Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781034237; l=6071;
 i=ferdinand.schwenk@advastore.com; h=from:subject:message-id;
 bh=8av3VXFsfmbe10Pa7bNJeLNXGw8azgybiEdonRhk8Jg=;
 b=mBCiEEamwEDC7/4cv0XMJbNCqzdHx7xy3WTarNcUiLnfHRIqIBx/sv1GV7M2wE2QN/LdAnZtc
 E5ARccgYmgWD7lLt5ZDnIvKL6BsD/SNaM387VGC28ZznQjX+k4EBqce
X-Developer-Key: i=ferdinand.schwenk@advastore.com; a=ed25519;
 pk=HyA9NdHJ7NystP+1SyuWJeyXNH2EO4A09FXli9mfs9Q=
X-Endpoint-Received: by B4 Relay for
 ferdinand.schwenk@advastore.com/default with auth_id=788
X-Original-From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Reply-To: ferdinand.schwenk@advastore.com

From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

The INA238 family supports eight conversion time steps from 50 us to
4120 us (SQ52206: 66 us to 8230 us). At the millisecond granularity of
update_interval, the four shortest steps (50, 84, 150, 280 us) all
round to the same value and cannot be individually selected.

Add support for the generic update_interval_us attribute, which reports
and programs the same ADC cycle time as update_interval but in
microseconds, giving userspace full access to all conversion time steps.

Both attributes reflect the total cycle time including the active
averaging count: the reported value is the raw conversion time
multiplied by the number of averaged samples, and writes apply the
inverse mapping.

Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
---
 Documentation/hwmon/ina238.rst |  4 +++
 drivers/hwmon/ina238.c         | 70 ++++++++++++++++++++++++++----------------
 2 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index 43950d1ec551..a75b79e17d9d 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -106,4 +106,8 @@ energy1_input		Energy measurement (uJ)
 temp1_input		Die temperature measurement (mC)
 temp1_max		Maximum die temperature threshold (mC)
 temp1_max_alarm		Maximum die temperature alarm
+
+samples			ADC averaging count (1, 4, 16, 64, 128, 256, 512, 1024)
+update_interval		Total ADC conversion cycle time including averaging (ms)
+update_interval_us	Total ADC conversion cycle time including averaging (us)
 ======================= =======================================================
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index dc5dd3ad2557..080a93fcc9f7 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -316,19 +316,36 @@ static inline u32 ina238_samples(struct ina238_data *data)
 				  INA238_ADC_CONFIG_AVG_SHIFT];
 }
 
-/* Converting update_interval in msec to a single conversion time in usec */
-static inline u32 ina238_interval_ms_to_conv_time(long interval, u32 samples)
+/* Converting update_interval(_us) to a per-field conversion time in usec.
+ * interval_us is the total ADC cycle time including averaging in microseconds.
+ * All three conversion fields (VBUSCT, VSHCT, VTCT) are set equal, so the
+ * per-field time is interval_us / (samples * 3).
+ */
+static inline u32 ina238_interval_us_to_conv_time(u32 interval_us, u32 samples)
 {
-	u64 interval_us;
+	return DIV_ROUND_CLOSEST_ULL(interval_us, samples * 3);
+}
 
-	interval = clamp_val(interval, 0, INT_MAX / 1000);
-	interval_us = (u64)interval * 1000;
+/* Write a per-field conversion time (in usec) to the ADC_CONFIG register */
+static int ina238_write_conv_time(struct ina238_data *data, u32 conv_time_us)
+{
+	u16 adc_config;
+	int idx, ret;
 
-	/*
-	 * update_interval reports the ADC cycle time including averaging.
-	 * The target per-field conversion time is interval_us / (samples * 3).
-	 */
-	return DIV_ROUND_CLOSEST_ULL(interval_us, samples * 3);
+	idx = find_closest(conv_time_us, data->config->conv_time,
+			   ARRAY_SIZE(ina238_conv_time));
+	adc_config = (data->adc_config &
+		      ~(INA238_ADC_CONFIG_VBUSCT_MASK |
+			INA238_ADC_CONFIG_VSHCT_MASK |
+			INA238_ADC_CONFIG_VTCT_MASK)) |
+		     ((u16)idx << INA238_ADC_CONFIG_VBUSCT_SHIFT) |
+		     ((u16)idx << INA238_ADC_CONFIG_VSHCT_SHIFT) |
+		     ((u16)idx << INA238_ADC_CONFIG_VTCT_SHIFT);
+	ret = regmap_write(data->regmap, INA238_ADC_CONFIG, adc_config);
+	if (ret)
+		return ret;
+	data->adc_config = adc_config;
+	return 0;
 }
 
 static int ina238_read_chip(struct device *dev, u32 attr, long *val)
@@ -344,6 +361,10 @@ static int ina238_read_chip(struct device *dev, u32 attr, long *val)
 		*val = DIV_ROUND_CLOSEST(ina238_reg_to_interval_us(data) *
 					ina238_samples(data), 1000);
 		return 0;
+	case hwmon_chip_update_interval_us:
+		/* Return in usec */
+		*val = ina238_reg_to_interval_us(data) * ina238_samples(data);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -367,21 +388,16 @@ static int ina238_write_chip(struct device *dev, u32 attr, long val)
 		data->adc_config = adc_config;
 		return 0;
 	case hwmon_chip_update_interval:
-		val = ina238_interval_ms_to_conv_time(val, ina238_samples(data));
-		idx = find_closest(val, data->config->conv_time,
-				   ARRAY_SIZE(ina238_conv_time));
-		adc_config = (data->adc_config &
-			      ~(INA238_ADC_CONFIG_VBUSCT_MASK |
-				INA238_ADC_CONFIG_VSHCT_MASK |
-				INA238_ADC_CONFIG_VTCT_MASK)) |
-			     ((u16)idx << INA238_ADC_CONFIG_VBUSCT_SHIFT) |
-			     ((u16)idx << INA238_ADC_CONFIG_VSHCT_SHIFT) |
-			     ((u16)idx << INA238_ADC_CONFIG_VTCT_SHIFT);
-		ret = regmap_write(data->regmap, INA238_ADC_CONFIG, adc_config);
-		if (ret)
-			return ret;
-		data->adc_config = adc_config;
-		return 0;
+		/* Convert ms to us before passing to the shared helper */
+		val = clamp_val(val, 0, INT_MAX / 1000) * 1000;
+		return ina238_write_conv_time(data,
+			ina238_interval_us_to_conv_time((u32)val,
+						ina238_samples(data)));
+	case hwmon_chip_update_interval_us:
+		val = clamp_val(val, 0, INT_MAX);
+		return ina238_write_conv_time(data,
+			ina238_interval_us_to_conv_time((u32)val,
+						ina238_samples(data)));
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -763,6 +779,7 @@ static umode_t ina238_is_visible(const void *drvdata,
 		switch (attr) {
 		case hwmon_chip_samples:
 		case hwmon_chip_update_interval:
+		case hwmon_chip_update_interval_us:
 			return 0644;
 		default:
 			return 0;
@@ -831,7 +848,8 @@ static umode_t ina238_is_visible(const void *drvdata,
 
 static const struct hwmon_channel_info * const ina238_info[] = {
 	HWMON_CHANNEL_INFO(chip,
-			   HWMON_C_SAMPLES | HWMON_C_UPDATE_INTERVAL),
+			   HWMON_C_SAMPLES | HWMON_C_UPDATE_INTERVAL |
+			   HWMON_C_UPDATE_INTERVAL_US),
 	HWMON_CHANNEL_INFO(in,
 			   /* 0: shunt voltage */
 			   INA238_HWMON_IN_CONFIG,

-- 
2.54.0


