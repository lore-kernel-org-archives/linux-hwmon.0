Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB62DEA75;
	Mon,  8 Jun 2026 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923872; cv=none; b=p0oRfxL/LQ9q3U+2rMeruL683Ki9ePvyBS/cO5SonPyIYCuNVu/Xy3WxNmDtD53lf3rGGHLROqMGbym3dBWXFtHEFSI95hT1PhRVoTU+u42NMLydoQlSdlE/snu+RypKgdZbUN5WdpJxVSggqsJp0m8Jb0xyWpQZkL8MO7OdAzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923872; c=relaxed/simple;
	bh=N2GpXClWnmywsixyiZdLwsWFvLjFwFiaefiQwRzSfM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHNvT+7qABCTxIfEhEQyOYqDZFi2TODBubkw8DxI8OriipxzsrwwpsmJ7PWIRKt8/NnK/dU23u4RTnKlaI30l6YgyLO3/z/X7NuF2A/Fz2s7CPzNnyJVa5TTnR7XZjO9aLdKv89C8EaORuBfKuMRTVpd3ieYJd/fF9AoF1Q7s2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pO9jSUfz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pO9jSUfz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 391CFC4AF10;
	Mon,  8 Jun 2026 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780923872;
	bh=N2GpXClWnmywsixyiZdLwsWFvLjFwFiaefiQwRzSfM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pO9jSUfzSC8eIQUCQeyJ5+c87dMJJNBkM/8V4ew7a2sWvavP8mG0BEmrtBESel2HC
	 vebdkk0dqnHKEXkX4CNKHsFp52ng2Sgz2KGGYAqQBgpXkxZC31qoCYQ3NmOQ1UN58/
	 85ZG4cLsye2s8qk2ytZAaVLNHWeTCMn5FCPGX5ed1sJBaIIHVR0vtkHkQc95f9eEKF
	 wB2b+1kMlO29iuPF0FqiWBNtc9rhpoKkqYAQtxNK59k782p0vUgtsgBYW7p4OFXH5h
	 ySu4Og2Erg7/iPSQK8Un4p+kdq8CTNSNyTxI3aAc96VibPtm+1jUalf6zOYhlsupOL
	 6tu8HdbO59t/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9AFCD8CAB;
	Mon,  8 Jun 2026 13:04:32 +0000 (UTC)
From: Ferdinand Schwenk via B4 Relay <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Date: Mon, 08 Jun 2026 15:03:56 +0200
Subject: [PATCH v2 3/3] hwmon: ina238: add update_interval_us attribute
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hwmon-ina238-update-interval-us-v2-v2-3-2d939fbb2ea1@advastore.com>
References: <20260608-hwmon-ina238-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com>
In-Reply-To: <20260608-hwmon-ina238-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, richard.leitner@linux.dev, 
 ferdinand.schwenk@advastore.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780923870; l=5999;
 i=ferdinand.schwenk@advastore.com; h=from:subject:message-id;
 bh=btfKxLdghkS0Gr3Xmr9ZOUHSnU+96it9VMLy0kvKN4k=;
 b=gOqdQIqgHB3aC5M6cHXNxPlFOrVYgDzpkRToM9rkQl7ZERkJIC+pjDvmt7rFOAwmje9FHczWG
 LsR3XXO+QM6Dhnkc2/ngA/UVWyOCWbAt07lp5BJjKeXpoOe7w1tW198
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
---
 Documentation/hwmon/ina238.rst |  4 +++
 drivers/hwmon/ina238.c         | 68 ++++++++++++++++++++++++++----------------
 2 files changed, 46 insertions(+), 26 deletions(-)

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
index 667f78d43a6a..068a9fb422f2 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -316,19 +316,37 @@ static inline u32 ina238_samples(struct ina238_data *data)
 				  INA238_ADC_CONFIG_AVG_SHIFT];
 }
 
-/* Converting update_interval in msec to a single conversion time in usec */
-static inline u32 ina238_interval_ms_to_conv_time(long interval, u32 samples)
+/* Converting update_interval(_us) to a per-field conversion time in usec.
+ * interval_us is the total ADC cycle time including averaging in microseconds.
+ * All three conversion fields (VBUSCT, VSHCT, VTCT) are set equal, so the
+ * per-field time is interval_us / (samples * 3).
+ */
+static inline u32 ina238_interval_us_to_conv_time(long interval_us, u32 samples)
 {
-	u64 interval_us;
+	interval_us = clamp_val(interval_us, 0, LONG_MAX);
+	return DIV_ROUND_CLOSEST_ULL((u64)interval_us, samples * 3);
+}
 
-	interval = clamp_val(interval, 0, LONG_MAX / 1000);
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
@@ -344,6 +362,10 @@ static int ina238_read_chip(struct device *dev, u32 attr, long *val)
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
@@ -367,21 +389,13 @@ static int ina238_write_chip(struct device *dev, u32 attr, long val)
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
+		val = clamp_val(val, 0, LONG_MAX / 1000) * 1000;
+		return ina238_write_conv_time(data,
+			ina238_interval_us_to_conv_time(val, ina238_samples(data)));
+	case hwmon_chip_update_interval_us:
+		return ina238_write_conv_time(data,
+			ina238_interval_us_to_conv_time(val, ina238_samples(data)));
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -763,6 +777,7 @@ static umode_t ina238_is_visible(const void *drvdata,
 		switch (attr) {
 		case hwmon_chip_samples:
 		case hwmon_chip_update_interval:
+		case hwmon_chip_update_interval_us:
 			return 0644;
 		default:
 			return 0;
@@ -831,7 +846,8 @@ static umode_t ina238_is_visible(const void *drvdata,
 
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


