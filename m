Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543322DFA0;
	Wed, 15 Jan 2025 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736906210; cv=none; b=e2QvcAZJJVr5S6ME86f+vSsqhzvOoQcJO1rkuDdSeHcteu0vggOlhUpjW+nPChx3thrDPj/PPcVXqfFoouIqpsXoZqgiGYH1fwVb0X1guZG7KpxmLQHwbtPBIMbzCmkkOHHGGnzLSSSC3epVRdiz6LgLkDfcn+Y1W7lRnT0FxEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736906210; c=relaxed/simple;
	bh=8aoAzNVnd5BV/AhVDbHGalEuzVo2Fbas7lrdgao+wF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=joDGUX2NTrVIWyv3/J10AtiJ6/UFxOZJGDZVN85RhQflI2Xp2jw9S4EhyQulrdxSV4xj8t+oM+By7OqHcww/5zre2qQpq6tWav6/LExvccvGGOr8blvW+pR7r7qQ/jNhjInT2gqMbUqql5XIqi/LldVCJAIi9lzPEZDFPii1WKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1lMOXKB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1lMOXKB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21669fd5c7cso112877705ad.3;
        Tue, 14 Jan 2025 17:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736906208; x=1737511008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY1CLDp33o2HmnHvQtHs31GWLcuZZZ4/slTkdA3W64A=;
        b=a1lMOXKBDBABxLtWjpuGsE4xgY8sR/D2D5wXZJvTEen7T4HzrrkLS4QK0y9tOPln5m
         85rEvgig9XS7+3b4tZR9AT5S4B3W961OJI5aarGth9XTIOvhCeEqWYE8xrFJj70cqYYm
         L/0PULGMh9GgDfxVb08nHaNpUmXST3EKBfz/TC0DcWNrQlONaTW+QsnBAqD5pDfWdynI
         qNpA1eWjHYa2UfU6YtjeUlZ43Z4oxBCokFJhgZhT+obrWtkxDPAYl0NHVyqfbVhLvQ2t
         5wQuz0ImtmKGZvS/c1+6Jh8+wc9dgkQS6oodO4ZlTbsb+Koa+gW36TkVmEf7tiF1wEeP
         tFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736906208; x=1737511008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GY1CLDp33o2HmnHvQtHs31GWLcuZZZ4/slTkdA3W64A=;
        b=M8ulBQVa1dInlvNpzhU7hHynAAW/tFhwgOHRssOrgGbNhlm0b7wsuLgXV9N6oq/8Na
         AUvzx8B+r6sSiEI5SvMny3IGmCZZFZD1m97oC6z0zAfD2NO5xXGLTfRpU1eDyT8KY34p
         WoX0LF9I7r+OJmz2C4GVOrJFA5Z5RWgyYLqdVu3Vc22m25UoJomn/gIvLWY1xd3qVKdm
         XC/0XorBfKf1UwwR2I++PA1uba1hJKUm1ccAextJ0e5Rn8F1DHsaoQ6QwUgbqNzLYsGX
         rrNO5xg3jTXqvlCx5RqVb6LI5JrdzfhcYzwsGP6gOSuaRPIoCM5ugnEVeSqzXgQBUMx0
         U2CA==
X-Forwarded-Encrypted: i=1; AJvYcCUN3tTkQGM9FZGEvIr6g/IJ6Zuso2mkG2OEeNDZU0y5tXOb7BiER0niX4p/hAASNoei/BOWG7xVK6tiaho=@vger.kernel.org, AJvYcCWHCHEz9y0XQ0p0Gb9DCIva50+Ev8jGTCTaY14FV0NNMDNYQRzOaKkVeB1OuiMQ4hwJ7RK04RlXksqdR+qB@vger.kernel.org, AJvYcCWoCmPI/ko9NDlu62yDy3a4DCZVGRZ2/3SfNzkOiwK8h0oGbxugnU+SSzP0zOApiZ0snDquCv+DWJJ7@vger.kernel.org, AJvYcCXmFbVe4QKF34esf0KhZHpfwXO7ELPJ2KE4iJvqit2fwWvtYwfSYBHm8kxt52WXmbCLaOIyV+BEt/ZG@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5G2Bzap3MCSfwSL3ECH9jYk/kQMpgFLIMHe/QNc9vgsU76xe
	QeYPa5PrDsEPbgrEZNPEnY3tJGggyd5w2pR28BMx1S2MItRwHX26
X-Gm-Gg: ASbGnctkNhK/ObaWrnSE+E2j7+zGCuot42p7piLp8eLeQC5e18Oo7Iv/8/6eycvDiQo
	utlfpBAucLcx2Z2aJ+JFQIWn+wn/rpzNUpWW/wqNkT7PaZdHQzLSH+W/e1FOftpj/Tm9eRxuQuj
	9WV570SrtPDH0TXeUfzk4h2IuovX8+IsTOCFvZLQMxoC9D8pRZ5UGCRroBULHznt4l9rEfUsjvF
	ECuYF4j0nnFUZoHqin9661ymG3HQEQ3KbvWtM4rpxvSp9u8Hj+3WSLjOqaaIlMD6ORZyNE+SWrA
	UR+Mfu4lx5jujR/PboW0W5nqZNAYtWqntbyJEQ==
X-Google-Smtp-Source: AGHT+IEp7VYiGnrRDi0sqMwTSOzWB5BUMIB4SoeIdaA4my0KWgyLQZM/uq8PMgEqBqQpZbJTPiu8Rg==
X-Received: by 2002:a05:6a21:998f:b0:1e0:e027:2eaf with SMTP id adf61e73a8af0-1e88cfd3c74mr38176362637.19.1736906207645;
        Tue, 14 Jan 2025 17:56:47 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d402cec11sm7943328b3a.0.2025.01.14.17.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:56:47 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
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
Cc: Leo Yang <leo.yang.sy0@gmail.com>
Subject: [PATCH v3 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
Date: Wed, 15 Jan 2025 09:55:21 +0800
Message-Id: <20250115015519.950795-3-leo.yang.sy0@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250115015519.950795-1-leo.yang.sy0@gmail.com>
References: <20250115015519.950795-1-leo.yang.sy0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver for Texas Instruments INA233 Current and Power Monitor
With I2C-, SMBus-, and PMBus-Compatible Interface

Signed-off-by: Leo Yang <leo.yang.sy0@gmail.com>
---
 Documentation/hwmon/ina233.rst |  77 ++++++++++++++
 MAINTAINERS                    |   7 ++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/ina233.c   | 184 +++++++++++++++++++++++++++++++++
 5 files changed, 278 insertions(+)
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

diff --git a/Documentation/hwmon/ina233.rst b/Documentation/hwmon/ina233.rst
new file mode 100644
index 000000000000..3b8fe76adc20
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
+see Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for details.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index c575de4903db..ae67eeebd80e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11226,6 +11226,13 @@ L:	linux-fbdev@vger.kernel.org
 S:	Orphan
 F:	drivers/video/fbdev/imsttfb.c
 
+INA233 HARDWARE MONITOR DRIVERS
+M:	Leo Yang <leo.yang.sy0@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
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
index 000000000000..56fc226958a6
--- /dev/null
+++ b/drivers/hwmon/pmbus/ina233.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for ina233
+ *
+ * Copyright (c) 2025 Leo Yang
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define MFR_READ_VSHUNT 0xd1
+#define MFR_CALIBRATION 0xd4
+
+#define INA233_CURRENT_LSB_DEFAULT	1000 /* uA */
+#define INA233_RSHUNT_DEFAULT		2000 /* uOhm */
+
+#define MAX_M_VAL 32767
+
+static void calculate_coef(int *m, int *R, u32 current_lsb, int power_coef)
+{
+	u64 scaled_m;
+	int scale_factor = 0;
+	int scale_coef = 1;
+
+	/*
+	 * 1000000 from Current_LSB A->uA .
+	 * scale_coef is for scaling up to minimize rounding errors,
+	 * If there is no decimal information, no need to scale.
+	 */
+	if (1000000 % current_lsb) {
+		/* Scaling to keep integer precision */
+		scale_factor = -3;
+		scale_coef = 1000;
+	}
+
+	/*
+	 * Unit Conversion (Current_LSB A->uA) and use scaling(scale_factor)
+	 * to keep integer precision.
+	 * Formulae referenced from spec.
+	 */
+	scaled_m = div64_u64(1000000 * scale_coef, (u64)current_lsb * power_coef);
+
+	/* Maximize while keeping it bounded.*/
+	while (scaled_m > MAX_M_VAL) {
+		scaled_m = div_u64(scaled_m, 10);
+		scale_factor++;
+	}
+	/* Scale up only if fractional part exists. */
+	while (scaled_m * 10 < MAX_M_VAL && scale_coef != 1) {
+		scaled_m *= 10;
+		scale_factor--;
+	}
+
+	*m = scaled_m;
+	*R = scale_factor;
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
+static int ina233_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	int ret, m, R;
+	u32 rshunt;
+	u32 current_lsb;
+	u16 calibration;
+	struct pmbus_driver_info *info;
+
+	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->pages = 1;
+	info->format[PSC_VOLTAGE_IN] = direct;
+	info->format[PSC_VOLTAGE_OUT] = direct;
+	info->format[PSC_CURRENT_OUT] = direct;
+	info->format[PSC_POWER] = direct;
+	info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_POUT
+		| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON;
+	info->m[PSC_VOLTAGE_IN] = 8;
+	info->R[PSC_VOLTAGE_IN] = 2;
+	info->m[PSC_VOLTAGE_OUT] = 8;
+	info->R[PSC_VOLTAGE_OUT] = 2;
+	info->read_word_data = ina233_read_word_data;
+
+	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
+	/* read rshunt value (uOhm) */
+	ret = device_property_read_u32(dev, "shunt-resistor", &rshunt);
+	if (ret) {
+		if (ret != -EINVAL)
+			return dev_err_probe(dev, ret, "Shunt resistor property read fail.\n");
+		rshunt = INA233_RSHUNT_DEFAULT;
+	}
+
+	/* read current_lsb value (uA) */
+	ret = device_property_read_u32(dev, "ti,current-lsb-microamp", &current_lsb);
+	if (ret) {
+		if (ret != -EINVAL)
+			return dev_err_probe(dev, ret, "Current_LSB property read fail.\n");
+		current_lsb = INA233_CURRENT_LSB_DEFAULT;
+	}
+
+	if (!rshunt || !current_lsb)
+		return dev_err_probe(dev, -EINVAL,
+				     "Shunt resistor and Current_LSB cannot be zero.\n");
+
+	/* calculate current coefficient */
+	calculate_coef(&m, &R, current_lsb, 1);
+	info->m[PSC_CURRENT_OUT] = m;
+	info->R[PSC_CURRENT_OUT] = R;
+
+	/* calculate power coefficient */
+	calculate_coef(&m, &R, current_lsb, 25);
+	info->m[PSC_POWER] = m;
+	info->R[PSC_POWER] = R;
+
+	/* write MFR_CALIBRATION register, Apply formula from spec with unit scaling. */
+	calibration = div64_u64(5120000000ULL, (u64)rshunt * current_lsb);
+	if (calibration > 0x7FFF)
+		return dev_err_probe(dev, -EINVAL,
+				     "The product of Current_LSB %lu and shunt resistor %lu exceed MFR_CALIBRATION register limit.\n",
+				     current_lsb, rshunt);
+	ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, calibration);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to write calibration.\n");
+
+	dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
+		client->name, rshunt, current_lsb);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id ina233_id[] = {
+	{"ina233", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ina233_id);
+
+static const struct of_device_id __maybe_unused ina233_of_match[] = {
+	{ .compatible = "ti,ina233" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ina233_of_match);
+
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
+MODULE_AUTHOR("Leo Yang <leo.yang.sy0@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for INA233 and compatible chips");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.2

