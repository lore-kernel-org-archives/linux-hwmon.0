Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9193AC83F1D
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243250AbjH3SrR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243612AbjH3LPR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 07:15:17 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F7FFF
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 04:15:14 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso588815166b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693394113; x=1693998913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FxLU3sUT4YHt2ZakuwGrcuhK+/MYBD6jt+HylqfbPq4=;
        b=a/GvIrv7738zoH5ncPEXeoX5acFOJrKCEapFXS9p49moo2Ub87eJd9bMbHJ4RBSo03
         K6asXPhaU7uA8J4DKKZrh4VMhBguxGuuuLTpYyaO85RhuyigU9MfKuCNh2IxE0pqWSVt
         fqhV/w2IkKGknuX3JIaTqZ812qiDuwbxSNQYzPNVmZ2pEc69Q6i7kMi9oBj1xL5E7vKg
         OipKn+RPlXkXmONxB2NuNBVDTLwyfHVmpBokC/kJAQnepYACUv/I0pbotyWHTPqzX6Kd
         S6HGKZvL4KIs5eNVSkNfbRU8aSQwtSdD7oKBFw3BOB9WAESG9ZMshKyY12SfQGvoo0T7
         VZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693394113; x=1693998913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxLU3sUT4YHt2ZakuwGrcuhK+/MYBD6jt+HylqfbPq4=;
        b=c/2OXIAtmKoJeN3LBS7OkcpI+CRJDa+92BucHDKf7UtnwZIpVCgxp9mJz37HLugesG
         P+lnNMFwWx3uGVzX5WI38mLbvpHYJZ1pRz87XOhz+BGeZcvmI44JlCPkCkFDaNbzmeYZ
         u8IPBtC4HGkzBTvWTaY8st0xESZt6DkTLZL2oAu6YfyrBrJWZ5kmWNnSGXwqoJbTx888
         FDBPpS1QRLXQdS4ZOGpv7nXizlGqPfePjqcZRN2oL/rtVumr+mqMZ+DePrnkOhowtLFD
         PI+9uoH9yOACodZbgvXHHBZSmoIUhn3NOq3+Jimk94G2rWDgIon5Oz7deTwF2K54rL4Q
         8RLg==
X-Gm-Message-State: AOJu0YyVdsprdGosKxGZk2PdyB3kvfbvizM53q+eB92o5x837JMsSFcU
        pYn8CS07jkqYXpOx/v4FTbkoqQ==
X-Google-Smtp-Source: AGHT+IEdH71V483HWsP7p1xsd/kL6r428EIDWnjNqqWJwHFwS4W4DpRNpyO/YeSEweuh2kH6hKkIUg==
X-Received: by 2002:a17:906:8a58:b0:9a2:1d09:4eee with SMTP id gx24-20020a1709068a5800b009a21d094eeemr1427527ejc.49.1693394112905;
        Wed, 30 Aug 2023 04:15:12 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id e19-20020a1709067e1300b0099cbfee34e3sm7129345ejr.196.2023.08.30.04.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 04:15:12 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     zev@bewilderbeest.net,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH] regulator (max5970): Add hwmon support
Date:   Wed, 30 Aug 2023 13:13:18 +0200
Message-ID: <20230830111319.3882281-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Utilize the integrated 10-bit ADC in Max5970/Max5978 to enable voltage
and current monitoring. This feature is seamlessly integrated through
the hwmon subsystem.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/regulator/max5970-regulator.c | 119 ++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/regulator/max5970-regulator.c b/drivers/regulator/max5970-regulator.c
index b56a174cde3d..3a6f7c293526 100644
--- a/drivers/regulator/max5970-regulator.c
+++ b/drivers/regulator/max5970-regulator.c
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -32,6 +33,116 @@ enum max597x_regulator_id {
 	MAX597X_SW1,
 };
 
+static int max5970_read_adc(struct regmap *regmap, int reg, long *val)
+{
+	u8 reg_data[2];
+	int ret;
+
+	ret = regmap_bulk_read(regmap, reg, &reg_data[0], 2);
+	if (ret < 0)
+		return ret;
+
+	*val = (reg_data[0] << 2) | (reg_data[1] & 3);
+
+	return 0;
+}
+
+static int max5970_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct max5970_data *ddata = dev_get_drvdata(dev);
+	struct regmap *regmap = dev_get_regmap(dev->parent, NULL);
+	int ret;
+
+	switch (type) {
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			ret = max5970_read_adc(regmap, MAX5970_REG_CURRENT_H(channel), val);
+			/*
+			 * Calculate current from ADC value, IRNG range & shunt resistor value.
+			 * ddata->irng holds the voltage corresponding to the maximum value the
+			 * 10-bit ADC can measure.
+			 * To obtain the output, multiply the ADC value by the IRNG range (in
+			 * millivolts) and then divide it by the maximum value of the 10-bit ADC.
+			 */
+			*val = (*val * ddata->irng[channel]) >> 10;
+			/* Convert the voltage meansurement across shunt resistor to current */
+			*val = (*val * 1000) / ddata->shunt_micro_ohms[channel];
+			return ret;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			ret = max5970_read_adc(regmap, MAX5970_REG_VOLTAGE_H(channel), val);
+			/*
+			 * Calculate voltage from ADC value and MON range.
+			 * ddata->mon_rng holds the voltage corresponding to the maximum value the
+			 * 10-bit ADC can measure.
+			 * To obtain the output, multiply the ADC value by the MON range (in
+			 * microvolts) and then divide it by the maximum value of the 10-bit ADC.
+			 */
+			*val = mul_u64_u32_shr(*val, ddata->mon_rng[channel], 10);
+			/* uV to mV */
+			*val = *val / 1000;
+			return ret;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t max5970_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	struct max5970_data *ddata = (struct max5970_data *)data;
+
+	if (channel >= ddata->num_switches)
+		return 0;
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return 0444;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			/* Current measurement requires knowledge of the shunt resistor value. */
+			if (ddata->shunt_micro_ohms[channel])
+				return 0444;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_ops max5970_hwmon_ops = {
+	.is_visible = max5970_is_visible,
+	.read = max5970_read,
+};
+
+static const struct hwmon_channel_info *max5970_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT, HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT, HWMON_C_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info max5970_chip_info = {
+	.ops = &max5970_hwmon_ops,
+	.info = max5970_info,
+};
+
 static int max597x_uvp_ovp_check_mode(struct regulator_dev *rdev, int severity)
 {
 	int ret, reg;
@@ -432,6 +543,7 @@ static int max597x_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 	struct regulator_dev *rdevs[MAX5970_NUM_SWITCHES];
+	struct device *hwmon_dev;
 	int num_switches;
 	int ret, i;
 
@@ -485,6 +597,13 @@ static int max597x_regulator_probe(struct platform_device *pdev)
 		max597x->shunt_micro_ohms[i] = data->shunt_micro_ohms;
 	}
 
+	hwmon_dev = devm_hwmon_device_register_with_info(&i2c->dev, "max5970_hwmon", max597x,
+							 &max5970_chip_info, NULL);
+	if (IS_ERR(hwmon_dev)) {
+		return dev_err_probe(&i2c->dev, PTR_ERR(hwmon_dev), \
+				     "Unable to register hwmon device\n");
+	}
+
 	if (i2c->irq) {
 		ret =
 		    max597x_setup_irq(&i2c->dev, i2c->irq, rdevs, num_switches,

base-commit: 35d0d2350d774fecf596cfb2fb050559fe5e1850
-- 
2.41.0

