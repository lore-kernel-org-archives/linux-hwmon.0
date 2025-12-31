Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9EC279DC2
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Dec 2025 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178521; cv=none; b=TxhjcSRrhpcAopW/dO3UlenYM+bXbnk1SzJb3QPxC5xCp/aUug8jXBib+veAI0zwpZtLo8RNMCqYm1p8LVMwpCp6B1iLrLtPp1euH4ymTiR/y0rJce+ls3DJ0XHaEjo70PSZhDox69Tolg1c0NJJfRdkrou2n6A8NWqbZMHJDG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178521; c=relaxed/simple;
	bh=qCSrrIt139kJGiQL0amuRKI7V5tkOWVMB/Vbxmf02Ic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pRkZS6p+tkjb+QBtxJPfAlNvh8Y5eofDq3wBaM8QFGoD8OaJb5HDN98BnYSpoiBO4AcwSiTOesJgnQGdbNxhQj8onN57nJNfcJY5JvBCNyGWHLKBHsGK4jgz0b+eqGHs+GpjF01U12r9rOPVvs10dtdY16RS8hqQkcIcz/AfE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwXwQDQX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwXwQDQX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so6585707b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Dec 2025 02:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767178518; x=1767783318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkdtMG/3+pFUouTkDmwOB9wgLd0W0G9xcW+86ei1dKc=;
        b=KwXwQDQXL8ugtpXrO0wSoBqa+TWGlic7oXHvHMW4DZta1bfuslVZmGWYJbGRJc9wyT
         3btwWKL63LM8s4+WiRVIFBZHiAVlV2n37OtMjkSdnQaTJa1lM+xXhnQGs3xV1/vreKbQ
         N7ZX+C0K+a3+mm6boqyH+Jr88HYsJ+ciSg9kg7Gt6RbNEnEI+PgIdiJ12/Kfj590Y4s/
         4tLSq917K1DiZ+tbbPihZK1W5k/8N1WZ9GxmjKdlqPuIg0xJ4I+iwXC4srbhjloa7YOu
         Vqbcgsvsc6qIAJWFSnePwMpMvslGl+rquG9QuDrStGsN0qmjqvD7tPzsyGhg9Zz7al8x
         xTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178518; x=1767783318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkdtMG/3+pFUouTkDmwOB9wgLd0W0G9xcW+86ei1dKc=;
        b=V+pwtbJsqwvJnKL0wmUY+pweSlmir58MB8kt4QEcxxp4F/awvVoddewCt6YCWO38Ob
         BhNe8O3hUkIfk9vUUKZxIwvTaLw2/bBcJfP4uDnSfLnlHnbZVcA7Gyl7DmEuqctq0OE5
         wCWjLUVW54qvit5PCNN7Qgror4I1Pakf/S5TmJAmvuoKUwgsJX/8Y87avT/xSFKCVqAw
         MqnsCGCO6FfMWwe2GELqSt/jUWxBtRi4bM55YVN+b8KwATXuEKvZwIzW9lK3YjefAQ6y
         DhP6sEu+enjVwo11renDUUfdQmxDKDR23+P14TKR9LEzkm+6L2S3a6mU+gIOhVqacLQe
         SgtA==
X-Gm-Message-State: AOJu0YxF6fyOOn0osWf3JlwqX/v1vAxyJRdL9We/j/4ost08X4ZW74sn
	nzuAo2jKv6xCOwGITKW6Im0EtShQ8dWYNfdPGsVxNz+VnvBqQ4HC+qK5a0UEdESI
X-Gm-Gg: AY/fxX5inxEiPKYGUQN3pC/e3xZ/mmRkPUdmdFIgc8EtHS9bQhj/5HudAZxTn8jdsq8
	kHYci+nSrSsZ6M4Y2rcVZQhso7x60KFHtn3bGGZwQTLYvsRhNzqTpzovxaft2B5TobeIOg3ISzH
	raQlv2xEObCzuOTZfMKDpvgwUEpq2gFvitDDPoE2E6YvTk8bp9hMyQ6U/nTtoJq9ZKl5dV5+Sbd
	UsqF3ofnBC8xuWxgnySevDeooD2R402nGALCoWNT9DR02jeA0elmnwJT7QMA3BLGCWeIF4OkmvR
	9gmdt7JchCll5K7Y9fE+iMD4QM2nCfTl0+6Nw/LidYWAGIOWSAvRd+1JkziGsai5M7M6wwH/gwQ
	Bg2pcFLidfxzh7mQHFoCXNgcqPLtuGN0S9DRrSloX8iudMb6dFDImCEao+y+HE28vleApB01VlS
	ey3nyL3nYujo3ydGeHyPwfWnZ7OK43Yeeg3Q==
X-Google-Smtp-Source: AGHT+IGfgmIb8JvANGrhNOwcZucfchhSj55TZ9EneuLRsXQtMZBt/RchNJg2d8OiAxaR9XYXnLWMhw==
X-Received: by 2002:a05:6a00:4308:b0:7ab:242b:95d0 with SMTP id d2e1a72fcca58-7ff648e54b3mr32709578b3a.18.1767178518271;
        Wed, 31 Dec 2025 02:55:18 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d025:c012:f249:6c16:3004:d03d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm34961747b3a.59.2025.12.31.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:55:17 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Subject: [PATCH]  hwmon:(pmbus/tda38740a) Add driver for Infineon TDA38740A/TDA38725A Voltage Regulator
Date: Wed, 31 Dec 2025 16:25:03 +0530
Message-Id: <20251231105503.77881-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Add the pmbus driver for the Infineon TDA38740A/TDA38725A
       voltage regulator.

Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
---
 .../hwmon/pmbus/infineon,tda38740a.yaml       |  73 ++++++
 drivers/hwmon/pmbus/Kconfig                   |  16 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/tda38740a.c               | 223 ++++++++++++++++++
 4 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
 create mode 100644 drivers/hwmon/pmbus/tda38740a.c

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
new file mode 100644
index 000000000000..07c8eb94807e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TDA38740A and TDA38725A Synchronous Buck Regulator with I2C
+
+maintainers:
+  - ASHISH YADAV <Ashish.Yadav@infineon.com>
+
+description: |
+  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchronous Buck Regulator with
+  I2C designed for Industrial use.
+
+  Datasheet:
+  https://www.infineon.com/assets/row/public/documents/24/49/infineon-tda38740a-tda38725a-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,tda38725a
+      - infineon,tda38740a
+
+  reg:
+    maxItems: 1
+
+  vout_multiplier:
+    description: |
+      If voltage multiplier present at vout, the voltage at voltage sensor pin
+      will be scaled. The properties will convert the raw reading to a more
+      meaningful number if voltage multiplier present. It has two numbers,
+      numerator ie vout_multiplier[0] and denominator ie vout_multiplier[1].
+      Therefore, the adjusted vout is equal to
+      Vout = (Vout * vout_multiplier[0]) / vout_multiplier[1].
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+  regulators:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tda38740a@40 {
+            compatible = "infineon,tda38740a";
+            reg = <0x40>;
+            vout_multiplier = <75 70>;
+        };
+    };
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..e7d7ff1b57df 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -602,6 +602,22 @@ config SENSORS_TDA38640_REGULATOR
 	  If you say yes here you get regulator support for Infineon
 	  TDA38640 as regulator.
 
+config SENSORS_TDA38740A
+	tristate "Infineon TDA38740A"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  TDA38740A/25A.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called tda38740a.
+
+config SENSORS_TDA38740A_REGULATOR
+	bool "Regulator support for TDA38740A and compatibles"
+	depends on SENSORS_TDA38740A && REGULATOR
+	help
+	  If you say yes here you get regulator support for Infineon
+	  TDA38740A/25A as regulator.
+
 config SENSORS_TPS25990
 	tristate "TI TPS25990"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..f422c80cf3d8 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
+obj-$(CONFIG_SENSORS_TDA38740A)  += tda38740a.o
 obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
diff --git a/drivers/hwmon/pmbus/tda38740a.c b/drivers/hwmon/pmbus/tda38740a.c
new file mode 100644
index 000000000000..4a51b773dcc4
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740a.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0+
+/**
+ * Hardware monitoring driver for Infineon Integrated-pol-voltage-regulators
+ * Driver for TDA38725A and TDA38740A
+ *
+ * Copyright (c) 2025 Infineon Technologies
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regulator/driver.h>
+#include "pmbus.h"
+
+#define TDA38725A_IC_DEVICE_ID	"\xA9"
+#define TDA38740A_IC_DEVICE_ID	"\xA8"
+
+static const struct i2c_device_id tda38740a_id[];
+
+enum chips {
+	tda38725a,
+	tda38740a
+};
+
+struct tda38740a_data {
+	enum chips id;
+	struct pmbus_driver_info info;
+	u32 vout_multiplier[2];
+};
+
+#define to_tda38740a_data(x)  container_of(x, struct tda38740a_data, info)
+
+static const struct regulator_desc __maybe_unused tda38740a_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+};
+
+static int tda38740a_read_word_data(struct i2c_client *client, int page,
+					int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct tda38740a_data *data = to_tda38740a_data(info);
+	int ret = 0;
+
+	/* Virtual PMBUS Command not supported */
+	if (reg >= PMBUS_VIRT_BASE) {
+		ret = -ENXIO;
+		return ret;
+	}
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		pr_info("READ_VOUT Value:%d %d %d\n", ret, data->vout_multiplier[0],
+					data->vout_multiplier[1]);
+		ret = ((ret * data->vout_multiplier[0])/data->vout_multiplier[1]);
+		break;
+	default:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		break;
+	}
+
+	return ret;
+}
+
+static struct pmbus_driver_info tda38740a_info[] = {
+	[tda38725a] = {
+		.pages = 1,
+		.read_word_data = tda38740a_read_word_data,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+		.format[PSC_CURRENT_IN] = linear,
+		.format[PSC_POWER] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+			| PMBUS_HAVE_IIN
+			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+			| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+			| PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
+#if IS_ENABLED(CONFIG_SENSORS_TDA38740A_REGULATOR)
+		.num_regulators = 1,
+		.reg_desc = tda38740a_reg_desc,
+#endif
+	},
+	[tda38740a] = {
+		.pages = 1,
+		.read_word_data = tda38740a_read_word_data,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+		.format[PSC_CURRENT_IN] = linear,
+		.format[PSC_POWER] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+			| PMBUS_HAVE_IIN
+			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+			| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+			| PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
+#if IS_ENABLED(CONFIG_SENSORS_TDA38740A_REGULATOR)
+		.num_regulators = 1,
+		.reg_desc = tda38740a_reg_desc,
+#endif
+	},
+};
+
+static int tda38740a_get_device_id(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
+	enum chips id;
+	int status;
+
+	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, device_id);
+	if (status < 0) {
+		dev_err(dev, "Failed to read Device Id\n");
+		return status;
+	}
+
+	pr_info("PMBUS IC DEVICE_ID:%s\n", device_id);
+
+	if (!strncasecmp(TDA38725A_IC_DEVICE_ID, device_id, strlen(device_id))) {
+		id = tda38725a;
+	} else if (!strncasecmp(TDA38740A_IC_DEVICE_ID, device_id, strlen(device_id))) {
+		id = tda38740a;
+	} else {
+		dev_err(&client->dev, "Unsupported device\n");
+		return -ENODEV;
+	}
+
+	return id;
+}
+
+static int tda38740a_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct tda38740a_data *data;
+	enum chips id;
+	int chip_id;
+
+	/* FUNC for I2C SMBUS */
+	if (!i2c_check_functionality(client->adapter,
+			I2C_FUNC_SMBUS_BYTE |
+			I2C_FUNC_SMBUS_BYTE_DATA |
+			I2C_FUNC_SMBUS_WORD_DATA |
+			I2C_FUNC_SMBUS_BLOCK_DATA |
+			I2C_FUNC_SMBUS_PEC))
+		dev_warn(&client->dev, "One of the required Func not supported by I2C adapter.\n");
+
+	chip_id = tda38740a_get_device_id(client);
+	if (chip_id < 0)
+		return chip_id;
+
+	if (dev->of_node)
+		id = (uintptr_t)of_device_get_match_data(dev);
+	else
+		id = i2c_match_id(tda38740a_id, client)->driver_data;
+
+	if (chip_id != id)
+		dev_warn(&client->dev, "Device mismatch: %d %d\n", id, chip_id);
+	else
+		pr_info("Device Match %d %d\n", id, chip_id);
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->id = chip_id;
+	memcpy(&data->info, &tda38740a_info[chip_id], sizeof(data->info));
+
+	if (!of_property_read_u32_array(client->dev.of_node, "vout_multiplier",
+				data->vout_multiplier, ARRAY_SIZE(data->vout_multiplier))) {
+		pr_info("vout_multiplier from Device Tree:%d %d\n",
+				data->vout_multiplier[0], data->vout_multiplier[1]);
+	} else {
+		pr_info("vout_multiplier not available from Device Tree");
+		data->vout_multiplier[0] = 0x01;
+		data->vout_multiplier[1] = 0x01;
+		pr_info("vout_multiplier default value:%d %d\n",
+				data->vout_multiplier[0], data->vout_multiplier[1]);
+	}
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct i2c_device_id tda38740a_id[] = {
+	{"tda38725a",  tda38725a},
+	{"tda38740a",  tda38740a},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, tda38740a_id);
+
+static const struct of_device_id __maybe_unused tda38740a_of_match[] = {
+	{.compatible = "infineon,tda38725a", .data = (void *)tda38725a },
+	{.compatible = "infineon,tda38740a", .data = (void *)tda38740a },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, tda38740a_of_match);
+
+/**
+ *  This is the driver that will be inserted
+ */
+static struct i2c_driver tda38740a_driver = {
+	.driver = {
+		.name = "tda38740a",
+		.of_match_table = of_match_ptr(tda38740a_of_match),
+	},
+	.probe = tda38740a_probe,
+	.id_table = tda38740a_id,
+};
+
+module_i2c_driver(tda38740a_driver);
+
+MODULE_AUTHOR("Ashish Yadav <Ashish.Yadav@infineon.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon IPOL");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

