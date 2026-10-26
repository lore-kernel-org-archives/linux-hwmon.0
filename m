Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975394;
	b=PwDhJKnhXMa8sLZa3Cp8lr2K3OCy+AE42bPld2QaFLUmTXSCaw02iZjCfqTNOe91qsEj
	 foUCMTSa4Ww0gZltvaoxAKJqJQat7pro6cHVr23iZtX4yTI9FIKnYafI/qRMqLeYSQPj5
	 2++OPPGHdDgbpXKkzYgsM+8E4+tWQh+CAqd4amlowPFQkmOC5h0jgXH0Pm+N4HCsyWAZA
	 P3L1ztISIo6+Lsu409yR7Hx4EwGdcHsVsEC3M6X7nbSldlIxWIwLELJPKYj+NQz5XB8Ar
	 XG03OB3Hoog1/8BMKfldWQBxn0fOx+7VvLi2fVfuYHqNAAHHbks/R3IoFL2KhWzUtkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sUMIJmos47K/ON/JXzczpaI6QwrXCf8XYNqYo34Qadc=;
	b=Q81th2X/j0e1dTJdog2FIr+/sRiAXDXmVL1cjBBqlQ5rCSmDSTKzWCKUupx84b6EXqiw
	 ZHG0XW2nN2UCnwfTlln+algL5XRnTc4ahPi1gvf7TIxcHmVGIr4uYeZ1SwyH5ZqBYdtz2
	 bDr2bwyCNikU4fQhvbJCOtWvt/Ni0mEJnAwSnkGuCgNXjOJ/HCj6R6DHXFPelFi7AvW9a
	 s9ru+ieEgiZ90jArF0GdEPdSzsBTPMVUxGMMky8f0NIjMEGXLHFCqotnh/b+bU0buL7sg
	 9K5HJz+OdM46vbISpgdfJsFbM/Ih2g2R8WfWbEHC3JZEMNUBvX7oq2UP3jT0A+IKhMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gIoC5v76;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E95606A327
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E95606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gIoC5v76
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8807555e9.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975392; x=1793580192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUMIJmos47K/ON/JXzczpaI6QwrXCf8XYNqYo34Qadc=;
        b=gIoC5v76xFBgDne7Rw7gSw4DEaFfXjM+65ZOvGewZpQiPK1RStixSglSD5uEDaLILO
         GUEYaeTpLakmzFwToD6H7noPL+3jZvvpZSA9R1rwm7LM1b7MGNulZtnCMy02kkRfiBG/
         rUT0ikf/RahBTrGrY1JtAKP2++M/O+FLQVlF3ZFq2NHA0rHNlgBjSXTHp6tztdH+0yU1
         j/2MA1BIRXUGwXIc+WDP4eE1emRMTo5eCc/OpWBlsar/zy9ihvpWVZl929tcKT97hK32
         m6M6t2CuGXznV3ap82dHCeRUzZz2UAOsyEZHSzSDmaOEGF9XVHPWCUeYDgfzrvU5klrJ
         r+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975392; x=1793580192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUMIJmos47K/ON/JXzczpaI6QwrXCf8XYNqYo34Qadc=;
        b=V51SuQlcIyy6GYoFJkDaospi3paEXgwdhqNIoWuzWDMk92a5rOmOkZiPRSi3+O1VNL
         II6Bw29xE0gymBeVRsdtY3a4HVF/qLVGKRf5TzCT0bYfhgcQSxF/4RNMQqu3li0AmQ6b
         ly9MhqOORUqSu/tidfXyFrKAIrn5J1n2GOF9GAGeADtsJwqIzlOgIblh45BoQOaAoNBA
         UWedz5qOvO/mZUvd+tNOoIWXMCeHJ92d4X4CRgTkW34Y3gJgDjIQnGyhyKFaGZ06hTri
         8xKB/tgBWyME6Sgzob6ZB0b6+XqV1vD04I5EEsM706Fe0PwxIzMiTfPxl6m1IiKFrh3+
         h33g==
X-Forwarded-Encrypted: i=1; AKwUvBw6wNIn0+LgeUviqxsYfFLFN0R1h4J333qLUrgkLBZd+S+0Z3/GQuanplEjyfUREFpuB7BGzlyMBn4F5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpvYZp4+avGhO8LOstHv0+02k1UCAT3AFHEzVPvS7SBM/Ekhj3
	sztlRqIJduxS2XT9LTehTnbrM6nV6YA/NXjYF7qUHD2d7Yi78QC9nbhi
X-Gm-Gg: AYBFou2jlxvQ7IIpa0yCTYOqPezbJjwztHCUi1+4y4TZIqd7IjWUleqZhRY7G7BCR+q
	A6puBn9VN6JrifOYHtOgRJOlH7ZMp4SCrtChrYpmlqACJmfuZC5GG72Aq6wfw09MdLN77eqf00m
	7vyTCkZ8aFsLbRwcnZBKudzwFd2unnpawJXw5PAR/udumz9hhS0e7Uf7JBAGGGfzJlTZwH8fwuc
	x7ZEK/NuH/dPtcaCtE8CEbZl+oV832xzVqCx6R2NuZpj8f2vdVfHWNvp/MkDzOPFUYD2txT/tZj
	3akvayrSjRjV5hFUXja6m7aSjte1gDaOD0umcs7tqEHaphz6Q2irWCPOffJiADOfId5tLJ8Sprg
	daVkdeHIUBQp8GuHbyD/BxZxSRKHRoZ3oKU3YGYpQoyeK8TCYNaWAFBSHwTW9P07f2hoh1Ahb2A
	FuuPsZ2NsC5LyMmt+zQ86z4UAug+A9nFZqLhBYlkMZbdXeV/M+SHT14wpOLHVZkryySoDnsZx63
	oKqgJd/pSJzPSPSUg+w1RaIsxF4Ss4Uk5XRSb3gnTZUXs5Yk21JjvdnRrLhooKROAGcGTeLxf4J
	ow6w0aRoWIdVMw==
X-Received: by 2002:a05:600c:4f55:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a35ac9a6d5mr107733175e9.8.1792975392082;
        Sun, 25 Oct 2026 17:43:12 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:43:11 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] regulator: sy7636a: report the temperature
Date: Mon, 26 Oct 2026 00:39:16 +0000
Message-ID: <20261026003918.155321-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The separate hwmon cell enables VCOM at probe. Report the temperature
from here, as the TPS65185 and FP9931 drivers do, and under the chip
name as they do: read it while the rails are on and return -ENODATA
otherwise. Boards that need the rails on mark VCOM always-on. Drop the
hwmon driver.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/hwmon/index.rst         |   1 -
 Documentation/hwmon/sy7636a-hwmon.rst |  26 -------
 drivers/hwmon/Kconfig                 |  10 ---
 drivers/hwmon/Makefile                |   1 -
 drivers/hwmon/sy7636a-hwmon.c         | 102 --------------------------
 drivers/mfd/simple-mfd-i2c.c          |   1 -
 drivers/regulator/Kconfig             |   1 +
 drivers/regulator/sy7636a-regulator.c |  56 ++++++++++++++
 8 files changed, 57 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 delete mode 100644 drivers/hwmon/sy7636a-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..43aecc4e49cd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -265,7 +265,6 @@ Hardware Monitoring Kernel Drivers
    sq24860
    stpddc60
    surface_fan
-   sy7636a-hwmon
    tc654
    tc74
    tda38740
diff --git a/Documentation/hwmon/sy7636a-hwmon.rst b/Documentation/hwmon/sy7636a-hwmon.rst
deleted file mode 100644
index 03d866aba6e8..000000000000
--- a/Documentation/hwmon/sy7636a-hwmon.rst
+++ /dev/null
@@ -1,26 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0-or-later
-
-Kernel driver sy7636a-hwmon
-===========================
-
-Supported chips:
-
- * Silergy SY7636A PMIC
-
-
-Description
------------
-
-This driver adds hardware temperature reading support for
-the Silergy SY7636A PMIC.
-
-The following sensors are supported
-
-  * Temperature
-      - Temperature of external NTC in milli-degree C
-
-sysfs-Interface
----------------
-
-temp1_input
-	- Temperature of external NTC (milli-degree C)
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..36e08c333e01 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2104,16 +2104,6 @@ config SENSORS_SIS5595
 	  This driver can also be built as a module. If so, the module
 	  will be called sis5595.
 
-config SENSORS_SY7636A
-	tristate "Silergy SY7636A"
-	depends on MFD_SY7636A
-	help
-	  If you say yes here you get support for the thermistor readout of
-	  the Silergy SY7636A PMIC.
-
-	  This driver can also be built as a module.  If so, the module
-	  will be called sy7636a-hwmon.
-
 config SENSORS_DME1737
 	tristate "SMSC DME1737, SCH311x and compatibles"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..537fb0bc1778 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -234,7 +234,6 @@ obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
 obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
 obj-$(CONFIG_SENSORS_SURFACE_TEMP)+= surface_temp.o
-obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
 obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
 obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
 obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
deleted file mode 100644
index d51daaf63d63..000000000000
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ /dev/null
@@ -1,102 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Functions to access SY3686A power management chip temperature
- *
- * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
- *
- * Authors: Lars Ivar Miljeteig <lars.ivar.miljeteig@remarkable.com>
- *          Alistair Francis <alistair@alistair23.me>
- */
-
-#include <linux/err.h>
-#include <linux/hwmon.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/regulator/machine.h>
-
-#include <linux/mfd/sy7636a.h>
-
-static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
-			u32 attr, int channel, long *temp)
-{
-	struct regmap *regmap = dev_get_drvdata(dev);
-	int ret, reg_val;
-
-	ret = regmap_read(regmap,
-			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
-	if (ret)
-		return ret;
-
-	*temp = reg_val * 1000;
-
-	return 0;
-}
-
-static umode_t sy7636a_is_visible(const void *data,
-				  enum hwmon_sensor_types type,
-				  u32 attr, int channel)
-{
-	if (type != hwmon_temp)
-		return 0;
-
-	if (attr != hwmon_temp_input)
-		return 0;
-
-	return 0444;
-}
-
-static const struct hwmon_ops sy7636a_hwmon_ops = {
-	.is_visible = sy7636a_is_visible,
-	.read = sy7636a_read,
-};
-
-static const struct hwmon_channel_info * const sy7636a_info[] = {
-	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
-	NULL
-};
-
-static const struct hwmon_chip_info sy7636a_chip_info = {
-	.ops = &sy7636a_hwmon_ops,
-	.info = sy7636a_info,
-};
-
-static int sy7636a_sensor_probe(struct platform_device *pdev)
-{
-	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	struct device *hwmon_dev;
-	int err;
-
-	if (!regmap)
-		return -EPROBE_DEFER;
-
-	err = devm_regulator_get_enable(&pdev->dev, "vcom");
-	if (err)
-		return err;
-
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "sy7636a_temperature", regmap,
-							 &sy7636a_chip_info, NULL);
-
-	if (IS_ERR(hwmon_dev)) {
-		err = PTR_ERR(hwmon_dev);
-		dev_err(&pdev->dev, "Unable to register hwmon device, returned %d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
-static struct platform_driver sy7636a_sensor_driver = {
-	.probe = sy7636a_sensor_probe,
-	.driver = {
-		.name = "sy7636a-temperature",
-	},
-};
-module_platform_driver(sy7636a_sensor_driver);
-
-MODULE_DESCRIPTION("SY7636A sensor driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:sy7636a-temperature");
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index ef3ce4bdf98b..168b4cf49b8c 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -69,7 +69,6 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 static const struct mfd_cell sy7636a_cells[] = {
 	{ .name = "sy7636a-regulator", },
-	{ .name = "sy7636a-temperature", },
 };
 
 static const struct simple_mfd_data silergy_sy7636a = {
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 88ba2770e378..f0d8d1319a1b 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1624,6 +1624,7 @@ config REGULATOR_SY7636A
 	depends on MFD_SY7636A
 	help
 	  This driver supports Silergy SY7636A voltage regulator.
+	  If HWMON is enabled, it also provides temperature measurement.
 
 config REGULATOR_SY8106A
 	tristate "Silergy SY8106A regulator"
diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 5705599d1b55..816df7716c0e 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -9,6 +9,7 @@
 
 #include <linux/completion.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/sy7636a.h>
@@ -147,6 +148,52 @@ static const struct regulator_desc desc = {
 	.of_match = of_match_ptr("vcom"),
 };
 
+static int sy7636a_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *temp)
+{
+	struct sy7636a_data *data = dev_get_drvdata(dev);
+	unsigned int mode, val;
+	int ret;
+
+	ret = regmap_read(data->regmap, SY7636A_REG_OPERATION_MODE_CRL, &mode);
+	if (ret)
+		return ret;
+
+	/* the thermistor is only sampled while the rails are on */
+	if (!(mode & SY7636A_OPERATION_MODE_CRL_ONOFF))
+		return -ENODATA;
+
+	ret = regmap_read(data->regmap, SY7636A_REG_TERMISTOR_READOUT, &val);
+	if (ret)
+		return ret;
+
+	*temp = (s8)val * 1000;
+
+	return 0;
+}
+
+static umode_t sy7636a_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	return 0444;
+}
+
+static const struct hwmon_channel_info * const sy7636a_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops sy7636a_hwmon_ops = {
+	.is_visible = sy7636a_hwmon_is_visible,
+	.read = sy7636a_hwmon_read,
+};
+
+static const struct hwmon_chip_info sy7636a_hwmon_chip_info = {
+	.ops = &sy7636a_hwmon_ops,
+	.info = sy7636a_hwmon_info,
+};
+
 static int sy7636a_regulator_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
@@ -235,6 +282,15 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 		return PTR_ERR(rdev);
 	}
 
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon_dev;
+
+		hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "sy7636a", data,
+								 &sy7636a_hwmon_chip_info, NULL);
+		if (IS_ERR(hwmon_dev))
+			dev_notice(&pdev->dev, "failed to register hwmon\n");
+	}
+
 	return 0;
 }
 
-- 
2.52.0

