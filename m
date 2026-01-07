Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0FE34F261
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Jan 2026 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797119; cv=none; b=K15Zl7QruIWU1FjqNptuEn4OSx+HXI5VDZoqJbfnAfY/umPt8eRCv7ADksc2ixJbetx4lF/xFF59Zd3i4HaXxIRIB0IjhCH2MCmERdH6ESWtTWPewW8lccXmNFj0V1+IvSWreW7Tk9y+14OgibnBgn3CPBzu7P06SUUiVPngTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797119; c=relaxed/simple;
	bh=IUGq/1+VXnR2GEXiep9r8uAPOkFSv4SioKcheDL4I2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=P+kdSUlcmlbqiHukce3YQhClfLLIWQRUhYIOqz4TifzaHw7UhaN5Tmk/WtkWfYR2IglebgRVRGMs4Sjlypfp2ecfGyCJ0wltK0/gYVrzIXeJqt1tmtWZP9YAaTmasObA+vVWASBWe+Q+lUBTwvx+DCjYqH9+qwO7B6D/FqBf3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6PHkyBw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6PHkyBw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7f1243792f2so1202880b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jan 2026 06:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767797117; x=1768401917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dV/a/pp4xRUIdbFUUAc/+1UXs1BCTsDVl+sSU1yxVxg=;
        b=b6PHkyBwqCclfcW13iZaGDupcWJ1uXUhzDdAQxo4OGzPEMlFBpCYKO+XOiobpKjHaM
         4QHLBiTMW6jq0f52xxsUazlvgMFoTWTg+DLTuOLnYmXTcsabBsSBvJ0cagdHA/GHRpds
         MGfr2kQxiHFT7pON8zCwHiQoM2wdjDSsS/eYUYhGZrNwRTNoKTD/nRWHxVoF4Jlksuxq
         tYzEk2GpUJR+6JeOcwOTua1I21JAqDv8eaIaXDN2whxyTzrwS2Dkt/GGrPCF3PZbud8i
         LZ2F/Wvzb98OzGcVHtWbH3hd2r6SdjxRnEWIrG+uM1vA2HE8iMjfjBpghjj6PsjDHQa2
         ek+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797117; x=1768401917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV/a/pp4xRUIdbFUUAc/+1UXs1BCTsDVl+sSU1yxVxg=;
        b=d6e2W1w+E82bUc+9WIUY54RMBxXtVAZNx8O4L5B5qc+qtrEYobKqLFYhPQqwqRwvbX
         eQeJvwTFC4MibxOfo4urT752Z2l4L7DDrnfy7SPdW3OptYu3lrkkVBzZvaLSLw7MtbHk
         QauPjEs4BADOj8ZSGT8pZ76tVul7o8FUdC8N4DKVFYkV53SlvcKYUl1OoHvxMo9iZpoD
         +h/vcK6mekSWS3YiRHlG9lNsjjc0qIhBL1mCV5D3DBbI0LHHEK1ECNiML+NXCF4XD7Y/
         OOKGTuSgSyHwYNvOfS7AI9od/m9Mo+TLucRoYhJ3nUAXXMOa6mz+3/ixIuHlgsICZEsI
         VZjQ==
X-Gm-Message-State: AOJu0YwcTE4h5uqT5WCWA4UiusNMbXsKPD6QrTEjJ8ZAVmsf42PNuyuN
	bc3PeV4iDzecg5VwZq9Yr545NmYuSk9HCyzpicjg9D9xoSXAjB2RiM0Jqwp+bfXM
X-Gm-Gg: AY/fxX7TNUBC0G1Gq5cWVU6/C9XPjiMFdKOOmRSnjMB76tgOBulTTq5SyhCTEF+NhYn
	FZiXKdcg62UKj3JqGcfoDXu2F1Gt3svMmMpEd4X/XEzZep+s8l39r1jaujvNylq5pu5hs38lahf
	0/yhTcx4kGyUv0XVQb1bgBmuVq7gooa8jFHev/kVVU01hz/ZDhIFt1ry1uvqv9Zlwqnxuc5ycFe
	M5sYrTvL90bFre0IQRoCqCsKkvBEBdayAI+TsxRiQNx/CiB9sFaL+AOl4vYqAL7IWEliAONQbsR
	a4WMaB2asw+2aeC5ahVgZZl2QocxAwhybvKNGyBWc+qkVP1ECCFBT3mjgobjV/TJdwlX4mz5U8b
	3Ra6sKsvFQgc6Pu/AKLcXu5mTgpGcu1mGTMNYuT0u2RzMxRzx8i2OuilVILdUq6gp0JnCZXrbcw
	r1BM+htgKAD0+x7NZ1laInxG7+PhjXYwLN9A==
X-Google-Smtp-Source: AGHT+IFGm+TF2ste0FwDnK/G0O+ElpjdeNQDncy2l4pcsL40Mv/9/XxjGZD2pwJwie7K50msEmhv2g==
X-Received: by 2002:a05:6a00:f0d:b0:7f1:d5ae:c388 with SMTP id d2e1a72fcca58-81b7f6e0bd4mr2400500b3a.41.1767797116484;
        Wed, 07 Jan 2026 06:45:16 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d025:c012:f249:6c16:3004:d03d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm5283720b3a.0.2026.01.07.06.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:45:16 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Subject: [PATCH v2 1/2] hwmon:(pmbus/tda38740a) TDA38740A Voltage Regulator Driver
Date: Wed,  7 Jan 2026 20:15:06 +0530
Message-Id: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
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
Changes in v2:
 - Review comments address.
 - Another Patch for Devicetree binding submitted for Driver
   Documentation.
---
 drivers/hwmon/pmbus/Kconfig     |  16 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/tda38740a.c | 203 ++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)
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
index 000000000000..b31e1b5c6916
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740a.c
@@ -0,0 +1,203 @@
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
+	u32 vout_voltage_multiplier[2];
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
+		ret = ((ret * data->vout_voltage_multiplier[0]) /
+		       data->vout_voltage_multiplier[1]);
+		break;
+	case PMBUS_VOUT_COMMAND:
+	case PMBUS_VOUT_MAX:
+	case PMBUS_VOUT_MARGIN_HIGH:
+	case PMBUS_VOUT_MARGIN_LOW:
+	case PMBUS_VOUT_TRANSITION_RATE:
+	case PMBUS_VOUT_DROOP:
+	case PMBUS_VOUT_SCALE_LOOP:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_STATUS_WORD:
+	case PMBUS_READ_VIN:
+	case PMBUS_READ_IIN:
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_PIN:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
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
+		dev_err(&client->dev,
+			"Failed to read Device ID or unexpected/unsupported Device\n");
+		return -ENODEV;
+	}
+
+	if (!memcmp(TDA38725A_IC_DEVICE_ID, device_id, 1)) {
+		id = tda38725a;
+	} else if (!memcmp(TDA38740A_IC_DEVICE_ID, device_id, 1)) {
+		id = tda38740a;
+	} else {
+		dev_err(&client->dev, "Unsupported device with ID:%s\n",
+			device_id);
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
+	if (!of_property_read_u32_array(client->dev.of_node, "infineon,vout-voltage-multiplier",
+					data->vout_voltage_multiplier,
+		    ARRAY_SIZE(data->vout_voltage_multiplier))) {
+		dev_info(&client->dev,
+			 "vout-voltage-multiplier from Device Tree:%d %d\n",
+			 data->vout_voltage_multiplier[0],
+			 data->vout_voltage_multiplier[1]);
+	} else {
+		dev_info(&client->dev,
+			 "vout-voltage-multiplier not available from Device Tree,using default values");
+		data->vout_voltage_multiplier[0] = 0x01;
+		data->vout_voltage_multiplier[1] = 0x01;
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
+MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725A/40A IPOL");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5

