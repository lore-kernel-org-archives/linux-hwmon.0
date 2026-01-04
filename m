Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C48B25BF13
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Jan 2026 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767524044; cv=none; b=iNBQQl9sIobdiMWDnLkX5sJ5kO70QWhRBgGYT37tPjCpjHwUC/Q0fw/fDKzWiLYj+A8T4jW5+McvQGhqKq9UhaIJJEUIFHMLt3lQROC7uzwF2rZsa+x3FO8mvW/R8/YNyfipB7fLDlLysPP0BGzSJUDDXBXmkAZIqMTUBRgCtxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767524044; c=relaxed/simple;
	bh=XDE92S73VJ7Qz2c2ybdWsb0kbGLxpTy2//ANlPrcAjM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=EjT0o67PZOj6NcTwLwFMBR813Pv//c4KGNFj7L2xw5weH6YOlUZfABAdhnhkofWqrgrL0QcgkOrAdifM3jOS462iKNQNUK7FqYHnIpeuDDGFnxzfkKn0Sz4AZE+g+21Uvh6enwXVncs6T6AUkLOEI9qXtAB3qqG2/pN7F42//eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHMjEgy8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHMjEgy8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0eaf55d58so5827075ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Jan 2026 02:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767524042; x=1768128842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNqTq9FC6nqzzp741yskfGw+wvY5tvgW4KEWfcZH79I=;
        b=nHMjEgy8wKIUQXEWHlwt2gY+RpwgJ9Wvm2LsVYK9qHwszJ4dXyiavcdbc7Xi4o3sFZ
         A4U1hTn3LJfq1Gd6MWlqy57VAckjWJBQx9y+czpHDulr7DhjHyiatwzxrcZU71eysfZq
         VO+YBgrKLSkRGTBeBT4LjupDTk7H/ZHHO+8LIifE6yvWtavobFGtvj2kY9r6ycG4lghD
         OueQLR/yc4QHWtqXBNBxyGMoB0FD2FID8VWOVKj4th4warZLfIpl17RrufPf+BZcbzUJ
         w8JLrmODiYkR/23HPIrr+DN3xE+mPS6WOS2F5iqI7jAH3q5fc1vN/DavD5p7z1I+cBx6
         JOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767524042; x=1768128842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNqTq9FC6nqzzp741yskfGw+wvY5tvgW4KEWfcZH79I=;
        b=qnnZOiNS+6dgpLuqYUbqiZHXJUiYN6zAfoCMESaxZj7VZdJRysGYCEZrIhu2+PlNnO
         CBDl/wIXIqjPYYKl7UhOP+sgrz+YUkFmkynZymqmaQxFivmERmMsiwMWJhRWU1xnjQ34
         tg/kqob/AfBP6wvA4eOec3IqhIenlQgnV3M899/fVUjn4MttlEpDhMEgWXLcwlz+OIBW
         v9aQARWkW1PbhlrwCap+WSFpuKPtBCIlllJkDTwBxlGjj8w+26J+QDI2m5T+ZYUm6oQp
         ortemPhAj3W4ufN2b2lkkdscz8HX6/EneTj/ODTJQ2EYOOu96fGAyQSLcch4Y7lNP60V
         XJwA==
X-Forwarded-Encrypted: i=1; AJvYcCVEg3oo/VrAejQX+OU2pBNUxSrzci4lOBmGcnAXgDCjafdHMqfTfN6YeIhNreqn4m92oXLUxl+WMH6xAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzmp3mGZRmINNiVYU6+/2j6K6VXQiT+E/CbCI46Q6+jmGGZNCN
	OZgCK4VhDRlvkxHwlQQMXhOFwnPXebwIzahG/ho62NsnrqvUUhUVROg3
X-Gm-Gg: AY/fxX55rcAiNAj+uMaNjiSshjERNXb84Ck85tDTJ83WY07/eZ3bHN3mkXPEcpbVDYW
	YPx04BES4Nak8Yfl0xc5++7s6fqtt6ZU7S2J8kRLvrQ3aYsgOJ+ZkPF2UcB20JCZHbAT8KQDu09
	5c8FTTREZ9280BKcNkcGJMSpgiTdzXv5I89J/v40lmDL5X02Rd9GOebUhVr+8ojmRuplShIMhdM
	VBg5DN8veODrugtE/GgZ67Ig4ny+1TP4Wf/QTzqauXP3l/8mKhpdSfU4PicVedZJZZh3y6TUhsS
	TuH/a/p7UPYzpjl85WKnrj4dV7bpqEEf9tCSUMUImG7CvTMNvwQPtcTyBTXoT+LQbhgMHbKhKeX
	oWLxdYlCTPBi4pmbuUbjgbXFghbcz9UHBVSWHZbS+ZsjyEe3NdnuvU1WD1kxDlHrNK74ACcVl7j
	Ad+Um3SVzWWSnhIVz55G4xHPGFOJLpKAZIxQ==
X-Google-Smtp-Source: AGHT+IF+1v14b0X72TbzbuASHRGXAZSbxmAjEOxZ8NntOFt6LwRfX4V9ya5ZlIuVdmbzDSMfgAtRZQ==
X-Received: by 2002:a17:90b:3e85:b0:343:cfa1:c458 with SMTP id 98e67ed59e1d1-34f453bde00mr4182056a91.18.1767524041788;
        Sun, 04 Jan 2026 02:54:01 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d025:c012:f249:6c16:3004:d03d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm3592558a91.12.2026.01.04.02.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 02:54:01 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Subject: [PATCH] hwmon:(pmbus/tda38740a) TDA38740A Voltage Regulator Driver
Date: Sun,  4 Jan 2026 16:23:51 +0530
Message-Id: <20260104105351.68907-1-Ashish.Yadav@infineon.com>
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
      DC-DC voltage regulator.

Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
---
 drivers/hwmon/pmbus/Kconfig     |  16 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/tda38740a.c | 182 ++++++++++++++++++++++++++++++++
 3 files changed, 199 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/tda38740a.c

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
index 000000000000..3402bbf2cc47
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740a.c
@@ -0,0 +1,182 @@
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
+#define TDA38725A_IC_DEVICE_ID "\xA9"
+#define TDA38740A_IC_DEVICE_ID "\xA8"
+
+static const struct i2c_device_id tda38740a_id[];
+
+enum chips { tda38725a, tda38740a };
+
+struct tda38740a_data {
+	enum chips id;
+	struct pmbus_driver_info info;
+	u32 vout_multiplier[2];
+};
+
+#define to_tda38740a_data(x) container_of(x, struct tda38740a_data, info)
+
+static const struct regulator_desc __maybe_unused tda38740a_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+};
+
+static int tda38740a_read_word_data(struct i2c_client *client, int page,
+				    int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	const struct tda38740a_data *data = to_tda38740a_data(info);
+	int ret;
+
+	/* Virtual PMBUS Command not supported */
+	if (reg >= PMBUS_VIRT_BASE)
+		return -ENXIO;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		ret = ((ret * data->vout_multiplier[0]) /
+		       data->vout_multiplier[1]);
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
+	u8 device_id[I2C_SMBUS_BLOCK_MAX + 1];
+	enum chips id;
+	int status;
+
+	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
+					   device_id);
+	if (status < 0 || status > 1) {
+		dev_err(&client->dev, "Failed to read Device Id %x\n", status);
+		return -ENODEV;
+	}
+
+	if (!memcmp(TDA38725A_IC_DEVICE_ID, device_id, strlen(device_id))) {
+		id = tda38725a;
+	} else if (!memcmp(TDA38740A_IC_DEVICE_ID, device_id,
+			   strlen(device_id))) {
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
+	int chip_id;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE |
+					     I2C_FUNC_SMBUS_BYTE_DATA |
+					     I2C_FUNC_SMBUS_WORD_DATA |
+					     I2C_FUNC_SMBUS_BLOCK_DATA))
+		return -ENODEV;
+
+	chip_id = tda38740a_get_device_id(client);
+	if (chip_id < 0)
+		return chip_id;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	data->id = chip_id;
+	memcpy(&data->info, &tda38740a_info[chip_id], sizeof(data->info));
+
+	if (!of_property_read_u32_array(client->dev.of_node, "vout_multiplier",
+					data->vout_multiplier,
+					ARRAY_SIZE(data->vout_multiplier))) {
+		dev_info(&client->dev,
+			 "vout_multiplier from Device Tree:%d %d\n",
+			 data->vout_multiplier[0], data->vout_multiplier[1]);
+	} else {
+		dev_info(&client->dev,
+			 "vout_multiplier not available from Device Tree");
+		data->vout_multiplier[0] = 0x01;
+		data->vout_multiplier[1] = 0x01;
+		dev_info(&client->dev, "vout_multiplier default value:%d %d\n",
+			 data->vout_multiplier[0], data->vout_multiplier[1]);
+	}
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct i2c_device_id tda38740a_id[] = { { "tda38725a", tda38725a },
+						     { "tda38740a", tda38740a },
+						     {} };
+
+MODULE_DEVICE_TABLE(i2c, tda38740a_id);
+
+static const struct of_device_id __maybe_unused tda38740a_of_match[] = {
+	{ .compatible = "infineon,tda38725a", .data = (void *)tda38725a },
+	{ .compatible = "infineon,tda38740a", .data = (void *)tda38740a },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, tda38740a_of_match);
+
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

