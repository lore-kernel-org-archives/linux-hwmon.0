Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2278D367B93
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 05:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033374; cv=none; b=qIrGXNIPEn27WD65JEB2IJSWGT+aY3FnArEtSCJRqyOTzBdsNgq5lDAgJCkojXWjwzZe611QUBD+ZH08PZ75IPJwxgry46id5W7034xEyaGp1Pami7lcS7Hmt8IhMllL8QDo8TNYv+LVHZ13sUz1z2qhxgMF4W6aakoTD87WX/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033374; c=relaxed/simple;
	bh=PJA1y4g/7GObBLE5JbdPoFYtJQzjLeZFtE0L2K+RhHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=An6dKAMSG+L7PaPNm/eJqdZZVKuBAu7L4Jula8Nf/LV1LLKUpS3S7Y+H88Qbs2EApgy8ruEdBF4aUFqZIYgQwwGDYPDK2dFJ6iCWATRUmTpmbcWoHkcDrRB1cETwPVV3UQ8kTRbg28Y8qj0+K6Ql9V31R9g8Rhaxan0dxzhwxEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoH9pwP5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoH9pwP5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b903567fdso1231112a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2026 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033372; x=1780638172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUiGTew/XqQaUao6a+AVrAz8djQBUFcvos6GNk5mPEA=;
        b=RoH9pwP5kETBkqTnqu9uhhq2X4raVB/ciMbsH20CY+BM/f/xxfMdtul+Iv7qYNMC8b
         obGxeqkaFcMIMzMU8jzHYcs/wclZzMzb3Rh9/448dUXGZWTsZGpffjhlFUpFT+45ANKd
         uW/oRI2IvNGUzuYKJ4G9XeK0S/eOxlaMX7H+rPzZREYwk/wa6l3yg5rzHxKM5X0By2zC
         /SE2W00BckuaIqUW6LQYwX+7LZ5r+4oIGRBowlfQprjWuWs2IHaNgGwZUUIYt55BVRyI
         SnEGdMKVbiNnwppx/SxJmzz98o5dDXiHXU1J/WqvMcJxoNz9xZNt7KqwUMCq2UCAsgTC
         QG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033372; x=1780638172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iUiGTew/XqQaUao6a+AVrAz8djQBUFcvos6GNk5mPEA=;
        b=JfQdXPm3kF1rFfiavQc3Yn5B936Tg/3W1qhTF0CxX2YATTpZ5I8pviiNZZGDCP/sk2
         Brqwa3c+juHt+CT+o+yK7wN+4nLbXhUU4nIT6oVO8/NHplcU1kVK44xXd5OBPe8S9MwJ
         1IpgiRlBbk44TSvMOtKp5GB7T3F0JgN4ODbHfHzfYc59zcdKJoGwRobBw3cEnY93B2AQ
         z3dBJkeny4hr2GZQUwFBY4ia0auNuiOFaljuoborsyJrst5+lKYlNVwGANOmNyrhuh3m
         xRpKJrcPttS8FS3S+htqddvqPkc0W/bB4WrzP8gSUcfagiha/kzjxZ+KjsHfJyjplces
         T6cQ==
X-Gm-Message-State: AOJu0YySW0pCPGrruT41udtFUuqD4m3vBRxgdbmshB8ZDLO0JElVNTP/
	xM1154+PncdY8C5ac5kUd8EJXKVBhSwu1u34WzT58jg3dcFJShKEj9EO
X-Gm-Gg: Acq92OFOHxiaP9f9LQlUDVGBYOlCwOEp1Nmcu9fBPFKEdQ0tzZ7GrTYGrDlC/JdcHL8
	MTpWC7dq2WehUdJa5lJQMfp9OMgdZuAhy+JB0griJWciQZ7UyeHKB4yaOHt12jfmrjgejkdJB2e
	+5VKg7e4EN7ST3z7COKc6mE4vrB05AkJc0W62nPiaSPmLeLMawBKTbFfct7N8LsUsk7uEOd7+lq
	STszyDLjPFbt7Y0GxVxrAFuG0l8sSvB4kL6WmFj9szMFdEoAR/fBH0jRw7BN7uvk8eoNQhaZGY8
	2Q3lF+Mh/wl+8MtFJGRKYdBngI9l5sLYEePcScCJDOO5XRX2nm3osh+uuJfuv9JJuyAC+Zcs4Mf
	BdhLL3HPnKecvmoP/C6qwgDmmtzAIhPbaFi+xUBcxEjNFTjiW/Vv+gZwyxqfy6K5JrYMn1Dnfs1
	3YKcYTNPjoT5TaopaZLqbWZZldaSOpM59EriIPSLXbIgfsvpsnjpxdrGWZ
X-Received: by 2002:a17:90b:3f85:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-36bbcfd8fb3mr1904011a91.14.1780033372316;
        Thu, 28 May 2026 22:42:52 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93ae:ce9d:fecf:bae0:f194:40fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6bc0b2fsm578157a91.17.2026.05.28.22.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:42:51 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v2 2/2] hwmon:(pmbus/xdp730) Add support for efuse xdp720/xdp730
Date: Fri, 29 May 2026 11:12:18 +0530
Message-Id: <20260529054218.5184-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
References: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add the pmbus driver for Infineon XDP720/XDP730 Digital eFuse
Controllers.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
XDP720/XDP730 Digital eFuse Controllers provides accurate system telemetry
(V, I, P, T) and reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.
---
 drivers/hwmon/pmbus/Kconfig  |   8 +-
 drivers/hwmon/pmbus/Makefile |   2 +-
 drivers/hwmon/pmbus/xdp720.c | 128 ----------------------------
 drivers/hwmon/pmbus/xdp730.c | 159 +++++++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+), 133 deletions(-)
 delete mode 100644 drivers/hwmon/pmbus/xdp720.c
 create mode 100644 drivers/hwmon/pmbus/xdp730.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..eb3ed41c6fdc 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -711,14 +711,14 @@ config SENSORS_XDP710
 	  This driver can also be built as a module. If so, the module will
 	  be called xdp710.
 
-config SENSORS_XDP720
-	tristate "Infineon XDP720 family"
+config SENSORS_XDP730
+	tristate "Infineon XDP730 family"
 	help
 	  If you say yes here you get hardware monitoring support for Infineon
-	  XDP720.
+	  XDP720 and XDP730 Digital eFuse Controllers.
 
 	  This driver can also be built as a module. If so, the module will
-	  be called xdp720.
+	  be called xdp730.
 
 config SENSORS_XDPE152
 	tristate "Infineon XDPE152 family"
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 7129b62bc00f..6d31082aa91f 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -69,7 +69,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
-obj-$(CONFIG_SENSORS_XDP720)	+= xdp720.o
+obj-$(CONFIG_SENSORS_XDP730)	+= xdp730.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
deleted file mode 100644
index 8729a771f216..000000000000
--- a/drivers/hwmon/pmbus/xdp720.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
- *
- * Copyright (c) 2026 Infineon Technologies. All rights reserved.
- */
-
-#include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/of_device.h>
-#include <linux/bitops.h>
-#include <linux/math64.h>
-#include "pmbus.h"
-
-/*
- * The IMON resistor required to generate the system overcurrent protection.
- * Arbitrary default Rimon value: 2k Ohm
- */
-#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
-#define XDP720_TELEMETRY_AVG 0xE9
-
-static struct pmbus_driver_info xdp720_info = {
-	.pages = 1,
-	.format[PSC_VOLTAGE_IN] = direct,
-	.format[PSC_VOLTAGE_OUT] = direct,
-	.format[PSC_CURRENT_OUT] = direct,
-	.format[PSC_POWER] = direct,
-	.format[PSC_TEMPERATURE] = direct,
-
-	.m[PSC_VOLTAGE_IN] = 4653,
-	.b[PSC_VOLTAGE_IN] = 0,
-	.R[PSC_VOLTAGE_IN] = -2,
-	.m[PSC_VOLTAGE_OUT] = 4653,
-	.b[PSC_VOLTAGE_OUT] = 0,
-	.R[PSC_VOLTAGE_OUT] = -2,
-	/*
-	 * Current and Power measurement depends on the RIMON (kOhm) and
-	 * GIMON(microA/A) values.
-	 */
-	.m[PSC_CURRENT_OUT] = 24668,
-	.b[PSC_CURRENT_OUT] = 0,
-	.R[PSC_CURRENT_OUT] = -4,
-	.m[PSC_POWER] = 4486,
-	.b[PSC_POWER] = 0,
-	.R[PSC_POWER] = -1,
-	.m[PSC_TEMPERATURE] = 54,
-	.b[PSC_TEMPERATURE] = 22521,
-	.R[PSC_TEMPERATURE] = -1,
-
-	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
-		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
-		   PMBUS_HAVE_STATUS_TEMP,
-};
-
-static int xdp720_probe(struct i2c_client *client)
-{
-	struct pmbus_driver_info *info;
-	int ret;
-	u32 rimon;
-	int gimon;
-
-	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
-			    GFP_KERNEL);
-	if (!info)
-		return -ENOMEM;
-
-	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
-	if (ret)
-		return dev_err_probe(&client->dev, ret,
-			"failed to enable vdd-vin supply\n");
-
-	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
-		return ret;
-	}
-
-	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
-	ret &= GENMASK(0, 0);
-	if (ret == 1)
-		gimon = 18200; /* output gain 18.2 microA/A */
-	else
-		gimon = 9100; /* output gain 9.1 microA/A */
-
-	if (of_property_read_u32(client->dev.of_node,
-				 "infineon,rimon-micro-ohms", &rimon))
-		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
-	if (rimon == 0)
-		return -EINVAL;
-
-	/* Adapt the current and power scale for each instance */
-	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
-	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
-		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
-
-	return pmbus_do_probe(client, info);
-}
-
-static const struct of_device_id xdp720_of_match[] = {
-	{ .compatible = "infineon,xdp720" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, xdp720_of_match);
-
-static const struct i2c_device_id xdp720_id[] = {
-	{ "xdp720" },
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, xdp720_id);
-
-static struct i2c_driver xdp720_driver = {
-	.driver = {
-		   .name = "xdp720",
-		   .of_match_table = xdp720_of_match,
-	},
-	.probe = xdp720_probe,
-	.id_table = xdp720_id,
-};
-
-module_i2c_driver(xdp720_driver);
-
-MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
-MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
-MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/xdp730.c b/drivers/hwmon/pmbus/xdp730.c
new file mode 100644
index 000000000000..3d6cb0614fe7
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp730.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon XDP720 / XDP730 Digital
+ * eFuse Controllers.
+ *
+ * Both parts share the same PMBus register map and direct-format
+ * coefficients; they differ in the GIMON gain step exposed via
+ * the TELEMETRY_AVG register and in the VDD_VIN pin number.
+ *
+ * Copyright (c) 2026 Infineon Technologies. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include "pmbus.h"
+
+/*
+ * The IMON resistor required to generate the system overcurrent
+ * protection.  Arbitrary default Rimon value: 2 kOhm (in micro-ohms).
+ */
+#define XDP730_DEFAULT_RIMON		2000000000U	/* 2 kohm */
+#define XDP730_TELEMETRY_AVG		0xE9
+#define XDP730_TELEMETRY_AVG_GIMON	BIT(10)		/* high/low GIMON select */
+
+/* Chip identifiers carried in OF match-data and i2c_device_id->driver_data. */
+enum xdp730_chip_id {
+	CHIP_XDP720 = 0,
+	CHIP_XDP730,
+};
+
+struct xdp730_data {
+	enum xdp730_chip_id	 id;
+	struct pmbus_driver_info info;
+};
+
+static const struct pmbus_driver_info xdp730_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN]		= direct,
+	.format[PSC_VOLTAGE_OUT]	= direct,
+	.format[PSC_CURRENT_OUT]	= direct,
+	.format[PSC_POWER]		= direct,
+	.format[PSC_TEMPERATURE]	= direct,
+
+	.m[PSC_VOLTAGE_IN]	= 4653,
+	.b[PSC_VOLTAGE_IN]	= 0,
+	.R[PSC_VOLTAGE_IN]	= -2,
+	.m[PSC_VOLTAGE_OUT]	= 4653,
+	.b[PSC_VOLTAGE_OUT]	= 0,
+	.R[PSC_VOLTAGE_OUT]	= -2,
+	/*
+	 * Current and Power measurement depend on the RIMON (micro-ohm)
+	 * and GIMON (microA/A) values; scaled per-instance in probe().
+	 */
+	.m[PSC_CURRENT_OUT]	= 24668,
+	.b[PSC_CURRENT_OUT]	= 0,
+	.R[PSC_CURRENT_OUT]	= -4,
+	.m[PSC_POWER]		= 4486,
+	.b[PSC_POWER]		= 0,
+	.R[PSC_POWER]		= -1,
+	.m[PSC_TEMPERATURE]	= 54,
+	.b[PSC_TEMPERATURE]	= 22521,
+	.R[PSC_TEMPERATURE]	= -1,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int xdp730_probe(struct i2c_client *client)
+{
+	struct xdp730_data *data;
+	int ret;
+	int gimon;
+	u32 rimon;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->id = (enum xdp730_chip_id)(uintptr_t)i2c_get_match_data(client);
+	data->info = xdp730_info;
+
+	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to enable vdd-vin supply\n");
+
+	ret = i2c_smbus_read_word_data(client, XDP730_TELEMETRY_AVG);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read TELEMETRY_AVG\n");
+
+	/* Bit 10 of TELEMETRY_AVG selects the GIMON gain step in microA/A */
+	switch (data->id) {
+	case CHIP_XDP720:
+		gimon = (ret & XDP730_TELEMETRY_AVG_GIMON) ? 18200 : 9100;
+		dev_info(&client->dev, "Initialised XDP720 instance\n");
+		break;
+	case CHIP_XDP730:
+		gimon = (ret & XDP730_TELEMETRY_AVG_GIMON) ? 20000 : 10000;
+		dev_info(&client->dev, "Initialised XDP730 instance\n");
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (device_property_read_u32(&client->dev,
+				     "infineon,rimon-micro-ohms", &rimon))
+		rimon = XDP730_DEFAULT_RIMON;	/* Default if not in FW */
+	if (rimon == 0)
+		return -EINVAL;
+
+	/* Adapt the current and power scale for each instance. */
+	data->info.m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_CURRENT_OUT] * rimon * gimon,
+		1000000000000ULL);
+	data->info.m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
+		data->info.m[PSC_POWER] * rimon * gimon,
+		1000000000000000ULL);
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct of_device_id xdp730_of_match[] = {
+	{ .compatible = "infineon,xdp720", .data = (void *)CHIP_XDP720 },
+	{ .compatible = "infineon,xdp730", .data = (void *)CHIP_XDP730 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, xdp730_of_match);
+
+static const struct i2c_device_id xdp730_id[] = {
+	{ "xdp720", CHIP_XDP720 },
+	{ "xdp730", CHIP_XDP730 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, xdp730_id);
+
+static struct i2c_driver xdp730_driver = {
+	.driver = {
+		.name		= "xdp730",
+		.of_match_table	= xdp730_of_match,
+	},
+	.probe		= xdp730_probe,
+	.id_table	= xdp730_id,
+};
+
+module_i2c_driver(xdp730_driver);
+
+MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDP720/XDP730 Digital eFuse Controllers");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

