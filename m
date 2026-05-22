Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142A38AC75;
	Fri, 22 May 2026 07:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433389; cv=none; b=NUpvxdSUlcWMJmjWtopl6pz07CW5Ye3k8nbldaHZdXN1kD9K6YumEwhm+sDlHAD1NOdad7FeltC3tmiIDr89zcrqd+Po/NVMYuLFR3ISrEbhhUzpZa+tkrhph083PpGCgEcXbt56ZpBxy0czoBE0OR4fuAWDe12hcZ9M5LV9Z+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433389; c=relaxed/simple;
	bh=H36JfpufFMHguvvVvERm/Q6MLHijFXaHhlkriMQbcqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVjMHDz2wKjGn6MDJAYJgfi6CJaLLwNlx3yFB+9xUWk1RO9odoDO9x6II2E+ty7fJrDgLn4Ztt8oUAwcv0T//70W170W4K6eoh13Gm7JTLAesy4Fc+Bx0LvaJlbdPzp6kBOjz4acLlxeW7AEu117ectcRCqBu9vpIFRu0/2R6cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6pJzy5i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6pJzy5i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 995B0C2BCB8;
	Fri, 22 May 2026 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779433388;
	bh=H36JfpufFMHguvvVvERm/Q6MLHijFXaHhlkriMQbcqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b6pJzy5iBMzsRC+khrRAwjN3Xn/DT8Ed3CCq/2Tw+mAmHONsvFwxYxKmEDuH3QdHw
	 7FAYcR5ryHDNcD7NXdX+Q1RnvXq8l953fsczBpHnsGCtlVq+lf2K3DAq1PKvzv1JZI
	 kFFlIUGP9splJqGPeODYV8Z2U08eVlvMTDQmTHNLw/Z5NjhPYxCUnFcUIFYgLDfdHq
	 9ruvvrcqU8MZB06fq/XzHahZkmv5j+ZOePfrXnJjaum7a++vV5XZVeCwWowjLJoGky
	 Z3CHsAB2JASJoT6CzG3SwfUhCDqzn8SebJI9aRviybogiuPTJJOTlB15o6AOCwZqI2
	 D+ndFMaUR8xAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C02ACD4F5B;
	Fri, 22 May 2026 07:03:08 +0000 (UTC)
From: Ferdinand Schwenk via B4 Relay <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Date: Fri, 22 May 2026 09:03:04 +0200
Subject: [PATCH 2/2] hwmon: ina238: use microseconds for update_interval
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-hwmon-ina238-add-samples-update-interval-v1-2-e1acfceb447e@advastore.com>
References: <20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com>
In-Reply-To: <20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ferdinand Schwenk <ferdinand.schwenk@advastore.com>, 
 richard.leitner@linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779433387; l=2579;
 i=ferdinand.schwenk@advastore.com; h=from:subject:message-id;
 bh=KeLuR0DMJGXjRXZhPZZdfG5JTrn6BSTR1NGiLJba5h0=;
 b=58JhpNE8ZcsEFAY2pQ2npS/aRIX7Nz5LWfQ7pjRbRXeVJQLAqAPz03EMPSDzGnTB1f3CcQ7UO
 mTcfZpza7sMBZUaMfc/1EGT0cYey6sj08ATGffT/fqt1a54h+nhYCLQ
X-Developer-Key: i=ferdinand.schwenk@advastore.com; a=ed25519;
 pk=HyA9NdHJ7NystP+1SyuWJeyXNH2EO4A09FXli9mfs9Q=
X-Endpoint-Received: by B4 Relay for
 ferdinand.schwenk@advastore.com/default with auth_id=788
X-Original-From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Reply-To: ferdinand.schwenk@advastore.com

From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

The INA238 family supports conversion times as low as 50 us.  The
standard hwmon sysfs ABI unit for update_interval is milliseconds,
which causes sub-millisecond conversion times to round to zero and
makes fine-grained control impossible.

Change the unit of chip/update_interval from milliseconds to
microseconds so that all eight conversion-time steps (50, 84, 150,
280, 540, 1052, 2074, 4120 us for INA238 and 66, 118, 310, 566,
1070, 2090, 4140, 8230 us for SQ52206) are accessible without loss
of precision.

Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
---
 drivers/hwmon/ina238.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 7bc18e5445b2..db0c0b5344d6 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -310,11 +310,14 @@ static inline u32 ina238_reg_to_interval_us(struct ina238_data *data)
 	return vbusct + vshct + vtct;
 }
 
-/* Converting update_interval in msec to a single conversion time in usec */
-static inline u32 ina238_interval_ms_to_conv_time(long interval)
+/* Converting update_interval in usec to a single conversion time in usec.
+ * update_interval represents the raw ADC cycle time (VBUSCT + VSHCT + VTCT),
+ * independent of averaging.  Since all three fields are always set equal,
+ * the target per-field conversion time is simply interval / 3.
+ */
+static inline u32 ina238_interval_us_to_conv_time(long interval)
 {
-	/* 3 equal conversion times (VBUSCT, VSHCT, VTCT) cover all measurement types */
-	return DIV_ROUND_CLOSEST(interval * 1000, 3);
+	return DIV_ROUND_CLOSEST(interval, 3);
 }
 
 static int ina238_read_chip(struct device *dev, u32 attr, long *val)
@@ -327,8 +330,8 @@ static int ina238_read_chip(struct device *dev, u32 attr, long *val)
 					  INA238_ADC_CONFIG_AVG_SHIFT];
 		return 0;
 	case hwmon_chip_update_interval:
-		/* Return in msec */
-		*val = DIV_ROUND_CLOSEST(ina238_reg_to_interval_us(data), 1000);
+		/* Return in usec */
+		*val = ina238_reg_to_interval_us(data);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -353,7 +356,7 @@ static int ina238_write_chip(struct device *dev, u32 attr, long val)
 		data->adc_config = adc_config;
 		return 0;
 	case hwmon_chip_update_interval:
-		val = ina238_interval_ms_to_conv_time(val);
+		val = ina238_interval_us_to_conv_time(val);
 		idx = find_closest(val, data->config->conv_time,
 				   ARRAY_SIZE(ina238_conv_time));
 		adc_config = (data->adc_config &

-- 
2.54.0


