Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CD63DDDB9
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177403; cv=none; b=DdIQnhreWLnxuXgf0z0fgeWYSVlItxQ0PqeSxcmUnxzV+zYm06h5PVUySCEu7GthBa6Mv47ZII/Zpq+tZqLa2rxajx2sjg4u7PF4myRDBsQT+AQwKZcsONCghHcAa2AMApfUHYEgEGOGCZoKzTIvg6xp7W5lqPYxJ+oULKmrF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177403; c=relaxed/simple;
	bh=YFHIyBCbkoipWr8pOPaL1cRAnYFClHJp7Ak19HwPlN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s63drUtdRKGg0wCgMkGfCJ5mOMlzn7sAlyzxj7I9FAqDDtL46JdCsZiFhgII0ymt/zvvWrQiWshSMoLFazoa1U9iX762vig70SvZ64qpE7R5pqFu7kK6lvbVrj9RzCGJjVpy2UG6pCbFl0hfVT/sk73GHbHNqWvvYYwqAxkPHVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oT2z5aND; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oT2z5aND"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3698e34a567so2689676a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177401; x=1779782201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM8k0k4jPYJGsPP6m3WPD8KZ7gtWl7MjfDoqmbWTodA=;
        b=oT2z5aNDTRiDpNCjPhYEzwMydvVSIXItQqOYAjaRsNEqTtUx5t4ww9HfJCJFx2ZQr6
         YPAc7RZNlHWqYaB+CozMVUSDumoiuACcSOxWtSmcQgF+Rc4ODEDfHzYWhGnSieN4kgBM
         GLkvnCfrAWvcAhPcpBxzR/imm51U9VuWDutRzs1xqvlcuzzohxyjm4iKhVNs4gyVREpn
         68YFwDf07j3BeiQsNj8Arv66MphJEbQ49DBckJ8bexKOS1zWtsBqzD5n3X0x8b7j9WmD
         tUgMQAiPWvIMWeXNMM2wLY6IptwikhFXCg58yKaf9tUSLurKxBIBxIETPQVVrhJhRdaW
         2YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177401; x=1779782201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KM8k0k4jPYJGsPP6m3WPD8KZ7gtWl7MjfDoqmbWTodA=;
        b=ocqSow1gpk0Mv1zGmsSuLn3ET3mhSi+lDMbRGWN6C4YnJGZx46eetp0xZ3ed9t1JMT
         oi+1jFH84DIPjEYE5c2ypA4m3Ee8BU+LZ5m4Vb6Ayb6AfS+uJWZPhzRNTbsD64hKgu63
         ehMQhMH/Sqry5FuVjbgCBKyF9WALAMHJP7ebiQf8D+rW1QrDvrsnq1I2Hh1HnnYIrXT3
         rPf430L5i81D9Jn/NtRJOdcTK7YL06t9SfnVyXDWVQxJDkLP3bOR0h1oml6tKF9uJyQM
         FWRH1EV/lBoHXlVpeOsn6joYhfzknuQDUl5P5hRJxKRlKAENvdjq27D0bcHfNDSOj089
         fIgQ==
X-Gm-Message-State: AOJu0Yzq+MyPIMFJVC0JOLtmXHxx64MASZMmqhX3Qp8u7Ve1deP/kcvU
	MK1RRjFWuhqx0VUQIv9OFLmt7W055iFiYY8MNSMsVkbK8nGPr/kRsoIX
X-Gm-Gg: Acq92OG8q5ItZjynlh4Wz+INhhof/0Zmi35B3scy8Qa/xM2cA7VVrN7oE+uoJ1clVaA
	qXUio1c0UWYu+uDHVUdMgNYUIdLBmg9MJTmfIxYljIxs4TGugklyTa5HMHPUtbLoX/IqtuVep8K
	0UvD91L9A+pWM1omkiAgXGJ3XivfAw4Tqpf+UFOkTCehxyREhD03kQ97s1xiRqwvjHuNs0No1CT
	c3VxBQzy1GO636La7J+E5x+BNl6gvkDk4dRgnzwXTS1i1C9fu3zfYKGDdKw3UIib/CPcR5lkaa9
	TkkJ8rO4uADu6eKR7x5veBdHQOMo4KLsx/zP5T+Um0O5SP+Er64ze+eKX9/6pkwUn4Slq7ckDtH
	unzdIPDlqbOQP9l2CNHsB6z5ZG8Xaf/HrqAKnLL7oiD2aNZNeG4sEoeZBQ5mnMhDQW6Buyznt7l
	avzy0Wc9e0ROiMD0aMSrzOlzR0agzwIWNXy0OHQSmahXla
X-Received: by 2002:a17:90b:3c4a:b0:361:45df:f5 with SMTP id 98e67ed59e1d1-36951b87f9cmr17777386a91.16.1779177400947;
        Tue, 19 May 2026 00:56:40 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:630b:f287:3279:f420:ef8:5c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm17116652a91.5.2026.05.19.00.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:56:40 -0700 (PDT)
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
Subject: [PATCH 2/2] hwmon:(pmbus/xdp730) Add support for efuse xdp730
Date: Tue, 19 May 2026 13:25:58 +0530
Message-Id: <20260519075558.91466-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add the pmbus driver for Infineon XDP730 Digital eFuse Controller.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
XDP730 Digital eFuse Controller provides accurate system telemetry
(V, I, P, T) and reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 4.4.2 and 4.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf

The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.
---
 drivers/hwmon/pmbus/Kconfig  |   9 +++
 drivers/hwmon/pmbus/Makefile |   1 +
 drivers/hwmon/pmbus/xdp730.c | 128 +++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/xdp730.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 8f4bff375ecb..11c26a495e31 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -720,6 +720,15 @@ config SENSORS_XDP720
 	  This driver can also be built as a module. If so, the module will
 	  be called xdp720.
 
+config SENSORS_XDP730
+	tristate "Infineon XDP730 family"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDP730.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdp730.
+
 config SENSORS_XDPE152
 	tristate "Infineon XDPE152 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 7129b62bc00f..32061c2ed29c 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
 obj-$(CONFIG_SENSORS_XDP720)	+= xdp720.o
+obj-$(CONFIG_SENSORS_XDP730)	+= xdp730.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
diff --git a/drivers/hwmon/pmbus/xdp730.c b/drivers/hwmon/pmbus/xdp730.c
new file mode 100644
index 000000000000..ea8968de9f26
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp730.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon XDP730 Digital eFuse Controller
+ *
+ * Copyright (c) 2026 Infineon Technologies. All rights reserved.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/of_device.h>
+#include <linux/bitops.h>
+#include <linux/math64.h>
+#include "pmbus.h"
+
+/*
+ * The IMON resistor required to generate the system overcurrent protection.
+ * Arbitrary default Rimon value: 2k Ohm
+ */
+#define XDP730_DEFAULT_RIMON 2000000000 /* 2k ohm */
+#define XDP730_TELEMETRY_AVG 0xE9
+
+static struct pmbus_driver_info xdp730_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 4653,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.m[PSC_VOLTAGE_OUT] = 4653,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	/*
+	 * Current and Power measurement depends on the RIMON (kOhm) and
+	 * GIMON(microA/A) values.
+	 */
+	.m[PSC_CURRENT_OUT] = 24668,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -4,
+	.m[PSC_POWER] = 4486,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -1,
+	.m[PSC_TEMPERATURE] = 54,
+	.b[PSC_TEMPERATURE] = 22521,
+	.R[PSC_TEMPERATURE] = -1,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int xdp730_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	int ret;
+	u32 rimon;
+	int gimon;
+
+	info = devm_kmemdup(&client->dev, &xdp730_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+			"failed to enable vdd-vin supply\n");
+
+	ret = i2c_smbus_read_word_data(client, XDP730_TELEMETRY_AVG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
+		return ret;
+	}
+
+	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
+	ret &= GENMASK(0, 0);
+	if (ret == 1)
+		gimon = 20000; /* output gain 20 microA/A */
+	else
+		gimon = 10000; /* output gain 10 microA/A */
+
+	if (of_property_read_u32(client->dev.of_node,
+				 "infineon,rimon-micro-ohms", &rimon))
+		rimon = XDP730_DEFAULT_RIMON; /* Default if not set via DT */
+	if (rimon == 0)
+		return -EINVAL;
+
+	/* Adapt the current and power scale for each instance */
+	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
+		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
+	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
+		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id xdp730_of_match[] = {
+	{ .compatible = "infineon,xdp730" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, xdp730_of_match);
+
+static const struct i2c_device_id xdp730_id[] = {
+	{ "xdp730" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, xdp730_id);
+
+static struct i2c_driver xdp730_driver = {
+	.driver = {
+		   .name = "xdp730",
+		   .of_match_table = xdp730_of_match,
+	},
+	.probe = xdp730_probe,
+	.id_table = xdp730_id,
+};
+
+module_i2c_driver(xdp730_driver);
+
+MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDP730 Digital eFuse Controller");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

