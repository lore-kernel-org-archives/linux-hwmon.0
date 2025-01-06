Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2261D61A1;
	Mon,  6 Jan 2025 07:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147866; cv=none; b=I/MOt7J/Kg6w/4CxMKkPrMDkGUkwSemn6kQoP9R/R4qw4RDf0kPv5xMdeD4Ze+2uM6yPRlT6/rDH4SWbFEkOtG639YVZJCZKqk/YmtPI99te8i0olCGbm0l/wbZAOS7MedQTxril2EsUKSgy2iJyzfOtjo5TrVU5s7UhyYUJ5o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147866; c=relaxed/simple;
	bh=TR+yWMCdoofurOA8E07Q0gDT+AA7vF3WFdQELjAWiQo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hKIzQePWNV19DQRqVx1Vvj7Le69eml3SR4pvxlk21ePhOKMMvgHn6sMAYhs+T8NYOVK6xAF+0aes6McLZh6+Cc+4gtrmf51vXqz5ojXrW+Iz50sy6J7SgHveg8Bm1zWwrS/VBYie6RH1zyeJqrJ43XPQINXGrUong501NrQbk3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UicIj8qh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UicIj8qh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216728b1836so180934755ad.0;
        Sun, 05 Jan 2025 23:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147864; x=1736752664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDLmM9lb+FUakaU0Llb/ezDDZckvJA3TM589cRBwyS4=;
        b=UicIj8qhyUyH09tBTh1tm2v6qsVa0mKEM2iFaxzDT7W0WS0b+L20bg5s+Id/QQenS2
         Yy/+UgPoL/XDDH/7P8AaoE5WtiSxaXc9rP/qVyjE5S+NF9Hfsiy3plmXNQ0fHWDAwPJU
         DBb27FECa7jWfBjYs+oC7KHpP45O/RU6HZgrz1F8Re3jJl8OWuYpSjBbX7W8uAS7bgC5
         EfeIVUHVgbr+ipreUnYDIZhmGny16LH/kEbXG7w6vWOJZOobSZJALFZ2JDYhuwCAvXoa
         601B7rBs5UECe2oBX/BvMgPDwZEwX2E7+QYRs8gQ128IOaOpEC3/2XlkPVAWaMig/nOI
         jsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147864; x=1736752664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDLmM9lb+FUakaU0Llb/ezDDZckvJA3TM589cRBwyS4=;
        b=Thvy8NZuNNAyFEGuo4xdJqM9m3jUn2M7wN5jmnm0OPvs2+4fApZQ8VLSM5smd9nFkc
         psGtW74STxPUQ2m5DNo6/fzjPs+0MOeC1xs7ScdTTjOLvS67f3tQyUHGjJxZq5mg8XRb
         xncYqkKlRpCTSlRw6KrXLFoe0b5Kcl3x4KvfP+tzeTAxIizJcAsD0sgx+xlHlhUlnFfr
         kBPCitcDMQtCJiT7eUzwHRTv5x/DcSDS56A1AtS2YwWUzuyG/RH+ony47PCrxF28ZADe
         XH6HduKoxQQUh7WPnjvrxveb3R2eGQEK2QYmflzw0ZmCTDOiWw5HdbvW7M64OLrMR5oN
         muew==
X-Forwarded-Encrypted: i=1; AJvYcCU+8Z3rCvrAV42dVxCq/3X/5TXAw/xE/IVIue/yQusuG4bb8lViagJs99aqlrqxE+c8HRey0cz16UvHVuAN@vger.kernel.org, AJvYcCUk0A5GYK36K9mNTsOXZVrowsBUdHJBX37ytDGikq+6/SLhCqU1nagFc9fwrtJT0lHCNEB2riHgpzqe@vger.kernel.org, AJvYcCVC1NKL7EItnFWB00kkdKZno6SPXiijNPq7vgZSC7Wy1qxh7D36To1JxluNJ1Of3rMHuD6GC/Gudeg8@vger.kernel.org, AJvYcCWiYBXAZ7VWbEkAUUj3dcc5mB8Je/JwxxYqPckywPPthD3h4XHMdCVjt2gVJ/UF7Dg4/miroXt2cLuwD+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzObNZbLst9Cn1fTVpKHHiBLo2ZipnaDI0wAnOI1CUlbNhzKZb8
	xelGbhG1NLEYWADKkPvg23s6IKH8xN6fzgMSFnNiQdTYutFUU3nc
X-Gm-Gg: ASbGncsuybxBcMFVWkg9iLxIao5NYdYwWilDJGlVmqEKeEpoxP56S+rC1bdGuo/z8iF
	h4zhPCTRI27mBJuv2scYWFbMhtECoCjQtuVDp7j8r5HknkteCdBnKeIqwojT5ZJ2v2DodUs2H28
	ntIdOOzKhS58SCEEd7h1gR1Y3mJQR/0E05TE9HuLnVt3IjDBiqxLM7+kE3/weufPadfvn+d27be
	9Kh9WtbmZSr0yBQ0jy+JWM50Xt6sq8uOtkj7ecDWm+poifdaqb3hrA3ktowrxIk7j6KrwldRv18
	61d5Tgm9o5DuN4XNFyyL7n7IikHIN8UtVW5u
X-Google-Smtp-Source: AGHT+IHd91VoeWA8EBnDmc86o8ORaY13tH4cwnUlgWMaBs6+sF+muNSXD/uFo+ObFYosq21kuuZ7IA==
X-Received: by 2002:a05:6a21:3989:b0:1dc:e8d:c8f0 with SMTP id adf61e73a8af0-1e5e07f884cmr85848208637.29.1736147863933;
        Sun, 05 Jan 2025 23:17:43 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816222sm30630566b3a.37.2025.01.05.23.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:17:43 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
Date: Mon,  6 Jan 2025 15:13:37 +0800
Message-Id: <20250106071337.3017926-3-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support ina233 driver for Meta Yosemite V4.

Driver for Texas Instruments INA233 Current and Power Monitor
With I2C-, SMBus-, and PMBus-Compatible Interface

According to the mail
https://lore.kernel.org/all/
20230920054739.1561080-1-Delphine_CC_Chiu@wiwynn.com
maintainer's suggested rewrite driver

Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
---
 Documentation/hwmon/ina233.rst |  77 +++++++++++++
 Documentation/hwmon/index.rst  |   1 +
 MAINTAINERS                    |   9 ++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/ina233.c   | 200 +++++++++++++++++++++++++++++++++
 6 files changed, 297 insertions(+)
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

diff --git a/Documentation/hwmon/ina233.rst b/Documentation/hwmon/ina233.rst
new file mode 100644
index 000000000000..5c9e5ed2d6d5
--- /dev/null
+++ b/Documentation/hwmon/ina233.rst
@@ -0,0 +1,77 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver ina233
+====================
+
+Supported chips:
+
+  * TI INA233
+
+    Prefix: 'ina233'
+
+  * Datasheet
+
+    Publicly available at the TI website : https://www.ti.com/lit/ds/symlink/ina233.pdf
+
+Author:
+
+	Leo Yang <Leo-Yang@quantatw.com>
+
+Usage Notes
+-----------
+
+The shunt resistor value can be configured by a device tree property;
+see Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml for details.
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for TI INA233.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+The driver provides the following attributes for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for shunt voltage:
+
+**in2_input**
+
+**in2_label**
+
+The driver provides the following attributes for output voltage:
+
+**in3_input**
+
+**in3_label**
+
+**in3_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
\ No newline at end of file
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 55f1111594b2..f280fa6e7d95 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -89,6 +89,7 @@ Hardware Monitoring Kernel Drivers
    ibmpowernv
    ina209
    ina2xx
+   ina233
    ina238
    ina3221
    inspur-ipsps1
diff --git a/MAINTAINERS b/MAINTAINERS
index c575de4903db..061da798536d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11226,6 +11226,15 @@ L:	linux-fbdev@vger.kernel.org
 S:	Orphan
 F:	drivers/video/fbdev/imsttfb.c
 
+INA233 HARDWARE MONITOR DRIVER
+M:	Leo Yang <Leo-Yang@quantatw.com>
+M:	Leo Yang <leo.yang.sy0@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/hwmon/ina233.txt
+F:	Documentation/hwmon/ina233.rst
+F:	drivers/hwmon/pmbus/ina233.c
+
 INDEX OF FURTHER KERNEL DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
 S:	Maintained
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f6d352841953..55db0ddc94ed 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -124,6 +124,15 @@ config SENSORS_DPS920AB
 	  This driver can also be built as a module. If so, the module will
 	  be called dps920ab.
 
+config SENSORS_INA233
+	tristate "Texas Instruments INA233 and compatibles"
+	help
+	  If you say yes here you get hardware monitoring support for Texas
+	  Instruments INA233.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ina233.
+
 config SENSORS_INSPUR_IPSPS
 	tristate "INSPUR Power System Power Supply"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d00bcc758b97..3c4b06fb939e 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
+obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_IR36021)	+= ir36021.o
diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
new file mode 100644
index 000000000000..1f7be600dea4
--- /dev/null
+++ b/drivers/hwmon/pmbus/ina233.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for ina233
+ *
+ * Copyright (c) 2024 Leo Yang
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include "pmbus.h"
+
+#define MFR_READ_VSHUNT 0xd1
+#define MFR_CALIBRATION 0xd4
+
+#define INA233_RSHUNT_DEFAULT		2000 /* uOhm */
+#define INA233_CURRENT_LSB_DEFAULT	1000 /* uA/bit */
+
+#define MAX_M_VAL 32767
+#define MIN_M_VAL -32768
+
+static int calculate_coef(int *m, int *R, bool power)
+{
+	s64 scaled_m;
+	int scale_factor = 0;
+	int scale_coef = 1;
+	int power_coef = 1;
+	bool is_integer = false;
+
+	if (*m == 0) {
+		*R = 0;
+		return -1;
+	}
+
+	if (power)
+		power_coef = 25;
+
+	if (1000000 % *m) {
+		/* Default value, Scaling to keep integer precision,
+		 * Change it if you need
+		 */
+		scale_factor = -3;
+		scale_coef = 1000;
+	} else {
+		is_integer = true;
+	}
+
+	/*
+	 * Unit Conversion (Current_LSB A->uA) and use scaling(scale_factor)
+	 * to keep integer precision.
+	 * Formulae referenced from spec.
+	 */
+	scaled_m = div_s64(1000000 * scale_coef, *m * power_coef);
+
+	/* Maximize while keeping it bounded.*/
+	while (scaled_m > MAX_M_VAL || scaled_m < MIN_M_VAL) {
+		scaled_m /= 10;
+		scale_factor++;
+	}
+	/* Scale up only if fractional part exists. */
+	while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && !is_integer) {
+		scaled_m *= 10;
+		scale_factor--;
+	}
+
+	*m = scaled_m;
+	*R = scale_factor;
+	return 0;
+}
+
+static int ina233_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_VMON:
+		ret = pmbus_read_word_data(client, 0, 0xff, MFR_READ_VSHUNT);
+
+		/* Adjust returned value to match VIN coefficients */
+		/* VIN: 1.25 mV VSHUNT: 2.5 uV LSB */
+		ret = DIV_ROUND_CLOSEST(ret * 25, 12500);
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+	return ret;
+}
+
+struct pmbus_driver_info ina233_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_POUT
+		| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON,
+	.m[PSC_VOLTAGE_IN] = 8,
+	.R[PSC_VOLTAGE_IN] = 2,
+	.m[PSC_VOLTAGE_OUT] = 8,
+	.R[PSC_VOLTAGE_OUT] = 2,
+	.read_word_data = ina233_read_word_data,
+};
+
+static int ina233_probe(struct i2c_client *client)
+{
+	int ret, m, R;
+	u32 rshunt;
+	u16 current_lsb;
+	u16 calibration;
+
+	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
+
+	/* read rshunt value (uOhm) */
+	ret = of_property_read_u32(client->dev.of_node, "shunt-resistor", &rshunt);
+	if (ret < 0 || !rshunt) {
+		dev_err(&client->dev, "Unable to read shunt-resistor or value is 0, default value %d uOhm is used.\n",
+			INA233_RSHUNT_DEFAULT);
+		rshunt = INA233_RSHUNT_DEFAULT;
+	}
+
+	/* read current_lsb value (uA/bit) */
+	ret = of_property_read_u16(client->dev.of_node, "current-lsb", &current_lsb);
+	if (ret < 0 || !current_lsb) {
+		dev_err(&client->dev, "Unable to read current_lsb or value is 0, default value %d uA/bit is used.\n",
+			INA233_CURRENT_LSB_DEFAULT);
+		current_lsb = INA233_CURRENT_LSB_DEFAULT;
+	}
+
+	/* calculate current coefficient */
+	m = current_lsb;
+	ret = calculate_coef(&m, &R, false);
+	if (ret < 0) {
+		dev_err(&client->dev, "Calculate_coef error\n");
+	} else {
+		ina233_info.m[PSC_CURRENT_OUT] = m;
+		ina233_info.R[PSC_CURRENT_OUT] = R;
+	}
+
+	/* calculate power coefficient */
+	m = current_lsb;
+	ret = calculate_coef(&m, &R, true);
+	if (ret < 0) {
+		dev_err(&client->dev, "Calculate_coef error\n");
+	} else {
+		ina233_info.m[PSC_POWER] = m;
+		ina233_info.R[PSC_POWER] = R;
+	}
+
+	/* write MFR_CALIBRATION register, Apply formula from spec with unit scaling. */
+	calibration = div_u64((u64)5120000000, (u64)rshunt * current_lsb);
+	if (calibration <= 0) {
+		dev_err(&client->dev, "Calibration error\n");
+		return -1;
+	}
+	ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, calibration);
+	if (ret < 0) {
+		dev_err(&client->dev, "Unable to write calibration\n");
+		return ret;
+	}
+
+	dev_info(&client->dev, "power monitor %s (Rshunt = %u uOhm, Current_LSB = %u uA/bit)\n",
+		 client->name, rshunt, current_lsb);
+
+	return pmbus_do_probe(client, &ina233_info);
+}
+
+static const struct i2c_device_id ina233_id[] = {
+	{"ina233", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ina233_id);
+
+static const struct of_device_id __maybe_unused ina233_of_match[] = {
+	{ .compatible = "ti,ina233" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ina233_of_match);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver ina233_driver = {
+	.driver = {
+		   .name = "ina233",
+		   .of_match_table = of_match_ptr(ina233_of_match),
+	},
+	.probe = ina233_probe,
+	.id_table = ina233_id,
+};
+
+module_i2c_driver(ina233_driver);
+
+MODULE_AUTHOR("Leo Yang <Leo-Yang@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for INA233 and compatible chips");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.2

