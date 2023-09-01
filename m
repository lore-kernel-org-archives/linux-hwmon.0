Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3E2CA0FE6
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 Sep 2023 09:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbjIAJfH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 1 Sep 2023 05:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjIAJfG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Sep 2023 05:35:06 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD3A10DE
        for <linux-hwmon@vger.kernel.org>; Fri,  1 Sep 2023 02:35:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31977ace1c8so1516401f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 Sep 2023 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693560902; x=1694165702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fuPQlScTuJqfDJqYPrpJqekrgXve8vQ/IZ3dM9TYMWI=;
        b=LzGRZMqhOECtfxvVdiNTUhmTlvEebZeh5BnRRVuc9RsByLrAUdeviW76W/+RfoD7Hf
         UoaMNMFbOo5HXA4r2hvM3IvePNIx49Tbb1wu0B1ymmRB7W2e3aARxDw8PhCLDJDs8jFv
         6kUIQVpdNeUO3RblDwvnCV3PvbHvaT/RkZUSD8vJMlSTMYP2kVG3w9wvNpZrVBr4ZXr2
         YME0FDdsYt/7Lcw183oJ4BPogwR3/Yck0FAD7+mKX2AKybhYJH9E8eQJ1bNfSLc5kejK
         2u1qCwgg2xC10JCbWP9lg/M45hEabFrOS7pc2rqI8mAXTDNXxzUZGK/r8gXZRW22Yfa0
         av6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693560902; x=1694165702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuPQlScTuJqfDJqYPrpJqekrgXve8vQ/IZ3dM9TYMWI=;
        b=LAEP6yZga41AJNP8Ise+dEyS3cLgAnD1uHAtlrQwrHLU0VmWlOHBEq7CiCjHlUTncG
         rKbkyFUk8hlXxq0UbufDGzS6LojstzNtN6LqXFhVUIw9mytAtv1YzpWrfVxjl6JhxhBI
         JUJOrVJmZ90JPk/Y9Sb9yN6JSc3Lx0+fgDOeodEfM5k5w3z/HCP+2xpkyrfxx0/jAbzK
         qPXetP605zaznK65jlG60m8fXDJ1y85RxzQDDz0jjVlYsVs5QgM76NQo3IUEjbhYuDhZ
         +TPIZ9QJzhsiJkzfmKfqvbYOt1brY7zS1Htv9i4UL1dT8LegxrcYQFIJ7Aw9M78P348L
         PFKw==
X-Gm-Message-State: AOJu0YxhjooyhbMh37vT9f0FK3Tw4NMmYDR8Sa4S8Zs2u6F3r5oq+Hju
        p/z4L2D95aREmXswfyTkpG00Ew==
X-Google-Smtp-Source: AGHT+IFz9Z+jV3l7pctsBjzHCKbmNCVxVTZggwdVbbAhjn1NAlkpcJ4NMfDZ492fbSnUtxd5+G5FZg==
X-Received: by 2002:adf:e7cc:0:b0:30e:3caa:971b with SMTP id e12-20020adfe7cc000000b0030e3caa971bmr1453781wrn.51.1693560901984;
        Fri, 01 Sep 2023 02:35:01 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b0031ad5fb5a0fsm4643331wro.58.2023.09.01.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 02:35:01 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     broonie@kernel.org, zev@bewilderbeest.net,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v2] regulator (max5970): Add hwmon support
Date:   Fri,  1 Sep 2023 11:34:48 +0200
Message-ID: <20230901093449.838414-1-Naresh.Solanki@9elements.com>
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
Changes in V2:
- default case added for switch statement
- Add dependency on HWMON
---
 drivers/regulator/Kconfig             |   1 +
 drivers/regulator/max5970-regulator.c | 123 ++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 965d4f0c18a6..ab245893033d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -559,6 +559,7 @@ config REGULATOR_MAX5970
 	depends on I2C
 	depends on OF
 	depends on MFD_MAX5970
+	depends on HWMON
 	help
 	  This driver controls a Maxim 5970/5978 switch via I2C bus.
 	  The MAX5970/5978 is a smart switch with no output regulation, but
diff --git a/drivers/regulator/max5970-regulator.c b/drivers/regulator/max5970-regulator.c
index b56a174cde3d..c337044e1523 100644
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
@@ -32,6 +33,120 @@ enum max597x_regulator_id {
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
+		default:
+			break;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			/* Current measurement requires knowledge of the shunt resistor value. */
+			if (ddata->shunt_micro_ohms[channel])
+				return 0444;
+		default:
+			break;
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
@@ -432,6 +547,7 @@ static int max597x_regulator_probe(struct platform_device *pdev)
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 	struct regulator_dev *rdevs[MAX5970_NUM_SWITCHES];
+	struct device *hwmon_dev;
 	int num_switches;
 	int ret, i;
 
@@ -485,6 +601,13 @@ static int max597x_regulator_probe(struct platform_device *pdev)
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

