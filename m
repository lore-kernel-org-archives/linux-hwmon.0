Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95824280CF6
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 06:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409566; cv=none; b=Cfl5OOztIp7BaW5UMAbtIuBzNRh1fb4TIlXrlVVbHFwrTNMT0u+RWOIBv2B7zJ3SGbQM+fYFsl1beesDVNpxjpoRp2sghmu7SUIPbnb9yW+MiznT2DkHL4BQE3G49J0yLsB1RLzYJ+9tx1jAe+hJ/sH+nLhA8xMWgKTeY/jHkTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409566; c=relaxed/simple;
	bh=kQOWTit4hY9/g1OCMVC5bNxMt8O3SLl2mKxQQW5PuTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=es5ixmAClVZwXs0wYmsMz5tY+G+0zE8zFMbJcHjfrAXh7F/MN81hjP+JEq8WRrUoYrPcDJ39v6LcDFyFJN5PQCa0DHu593wObldRnCWPMK85d8Q5upyNqXvPMni2+TKXch3/BerRnH491o3D/pVX6jhhqtv0gQv5rxVmHrMO50M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9xchaLF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9xchaLF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34abc7da414so2257999a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jan 2026 22:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769409564; x=1770014364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLEzTphToCpcuUXfc1sPBp3v83OVKMUCj04wW6iPsE4=;
        b=g9xchaLFE7TdpcisHtkjMHwzsfBXMV5doPru86HoxSN+HiOe26jUL1GOJH5RPg2okB
         GB1kNLJQLaAYo+4tEoVUWT+kvOcefEZYk+r6TBLZWVez2TQ0cHOT3HL+yZtSJ9ySjt1H
         o7pM57nQLfgVv/lUJGt5bGlcEROEP4VixfBxvu6k5jKuYNOqnmAjlrrNpaDThnwgc0uN
         VOqxbEZxyUrTUhQeLmpr3kndw6GdtkNnf21C9GqZHEgXlr1ePOfHsTTHUC4ctlgUMdto
         6gCYlAQSlqR89jMVHnGPSC9txBB4RkkBGglfcAzCdhFs0ZnVhzamx5eaCvHGY3Bedg9V
         mLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769409564; x=1770014364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RLEzTphToCpcuUXfc1sPBp3v83OVKMUCj04wW6iPsE4=;
        b=jgMk9/3qkKXDSt2hRwBRLCl+P4U4kpYF5aLwOQPE5rwE/IOTavRl/FwJincTliU1qT
         5j+8rpTN52FuhwUIQDBUc/GY6UVRdMaXGmh5qz+Zh/e+MaFezRdEqPZdP9DZBZ0wgRgl
         6r5Ei9f98RTf7wj4D+dRRGDYq+ey3AkqzfOrczwX3i4DRY1nWwjnJS3ytNiHF4SMOZB1
         D2X9jZEppWfanudd33KRkoEK8Md6DRCaRl8uI5Njbna6GuazrlNGxc9msr+O25A09gui
         BCmNjF4GxCk9o7EXW49uxZDbT+1anDw7Gk9VTL9SXEyQFxztedTy2WSEtEuaSFXYoHUE
         krjA==
X-Forwarded-Encrypted: i=1; AJvYcCUcr3jA2OCiTTmJx+slzvivxO8ivFku/h9FC8rFblg70PIaBsvPhUCJdk2mSbmv8ejnzjLLSQYJEy5TAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjVln16frV7XikHcLEIU3zBgbjl4eSc/qoAvKaxUPOgWVQR/tu
	usd8WYMRycfDtRztK90ozRldmeVcYmZ3MhjNWkWHQGOcvK9gyuzflVpj
X-Gm-Gg: AZuq6aJQlzfLhwV7ojoMe4cYyxqzFyrNX01/j4P33B0UOlpPkWe4siW1a9cRLFTe+Q4
	yq588qxtQW+QF52lg3/8WGwIszWJLEnw84nsRNXMIluHst8ESA2zHIZAcz4L+FiiV4dadJrk4j6
	NR6L2qtVI8dce/kQ3GOD7qJArhvkAD7F1rLrbzZ05KyuvBDH8FV8ZN4/mMwcuVfx+J0FqyVUacX
	eoLHqeKkz6l6+n1UrM4pwZIh2TAcTIBD3w7d59imgQCLZjdrZdSJMWiOO+qqV6vhlz4TfInCYTK
	4V+ISUhDFq0PnI5sAb1Be5jqI58VTTU32iJPehsPfx1hJGXsfJtePimjzkAEXKg3eXyBGmbXzgG
	NG6n31SsSHI2wXKToS+bHP5q3KfUql/IbdEW4j4/I+0HyOn/Y/ygKr5YctJ8MhOvn0XlylR+jkp
	TwNsQrjgFNawWrRcv5Nrk+t+ReCnTP8qP66GethR4oUIfcqGZWzieEvnYdIR+DiRI+X8eAm7/N0
	S6KnL2R8P7sHFl7eoPuV68uW+vaYC4=
X-Received: by 2002:a17:90b:4d09:b0:349:7f0a:381b with SMTP id 98e67ed59e1d1-353c40bc0c5mr2754761a91.8.1769409563863;
        Sun, 25 Jan 2026 22:39:23 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536d8b8f7bsm7865000a91.6.2026.01.25.22.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:39:23 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v7 2/2] hwmon: pmbus: add support for STEF48H28
Date: Mon, 26 Jan 2026 14:37:12 +0800
Message-Id: <20260126063712.1049025-2-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
References: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for STEF48H28 hot-swap controller.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
 Documentation/hwmon/index.rst     |  1 +
 Documentation/hwmon/stef48h28.rst | 73 ++++++++++++++++++++++++++++++
 MAINTAINERS                       |  7 +++
 drivers/hwmon/pmbus/Kconfig       |  9 ++++
 drivers/hwmon/pmbus/Makefile      |  1 +
 drivers/hwmon/pmbus/stef48h28.c   | 75 +++++++++++++++++++++++++++++++
 6 files changed, 166 insertions(+)
 create mode 100644 Documentation/hwmon/stef48h28.rst
 create mode 100644 drivers/hwmon/pmbus/stef48h28.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..c682751a1fe3 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -233,6 +233,7 @@ Hardware Monitoring Kernel Drivers
    shtc1
    sis5595
    sl28cpld
+   stef48h28
    smpro-hwmon
    smsc47b397
    smsc47m192
diff --git a/Documentation/hwmon/stef48h28.rst b/Documentation/hwmon/stef48h28.rst
new file mode 100644
index 000000000000..00bef9e55651
--- /dev/null
+++ b/Documentation/hwmon/stef48h28.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver stef48h28
+=======================
+
+Supported chips:
+
+  * Analog Devices STEF48H28
+
+    Prefix: 'stef48h28'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.st.com/resource/en/data_brief/stef48h28.pdf
+
+Author:
+
+  - Charles Hsu <hsu.yungteng@gmail.com>
+
+
+Description
+-----------
+
+The STEF48H28 is a 30 A integrated e-fuse for 9-80 V DC power rails.
+It provides inrush control, undervoltage/overvoltage lockout and
+overcurrent protection using an adaptive (I x t) scheme that permits
+short high-current pulses typical of CPU/GPU loads.
+
+The device offers an analog current-monitor output and an on-chip
+temperature-monitor signal for system supervision. Startup behavior is
+programmable through insertion-delay and soft-start settings.
+
+Additional features include power-good indication, self-diagnostics,
+thermal shutdown and a PMBus interface for telemetry and status
+reporting.
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data.
+
+Sysfs entries
+-------------
+
+=========================================================
+in1_label		"vin".
+in1_input		Measured voltage. From READ_VIN register.
+in1_min			Minimum Voltage. From VIN_UV_WARN_LIMIT register.
+in1_max			Maximum voltage. From VIN_OV_WARN_LIMIT register.
+
+in2_label		"vout1".
+in2_input		Measured voltage. From READ_VOUT register.
+in2_min			Minimum Voltage. From VOUT_UV_WARN_LIMIT register.
+in2_max			Maximum voltage. From VOUT_OV_WARN_LIMIT register.
+
+curr1_label "iin".
+curr1_input Measured current. From READ_IIN register.
+
+curr2_label "iout1".
+curr2_input Measured current. From READ_IOUT register.
+
+power1_label		"pin"
+power1_input		Measured input power. From READ_PIN register.
+
+power2_label		"pout1"
+power2_input		Measured output power. From READ_POUT register.
+
+temp1_input		Measured temperature. From READ_TEMPERATURE_1 register.
+temp1_max		Maximum temperature. From OT_WARN_LIMIT register.
+temp1_crit		Critical high temperature. From OT_FAULT_LIMIT register.
+
+temp2_input		Measured temperature. From READ_TEMPERATURE_2 register.
+=========================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index d701a4d5b00e..be6b6e9ee79b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24665,6 +24665,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/st,stc3117.yaml
 F:	drivers/power/supply/stc3117_fuel_gauge.c

+ST STEF48H28 DRIVER
+M:	Charles Hsu	<hsu.yungteng@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/stef48h28.rst
+F:	drivers/hwmon/pmbus/stef48h28.c
+
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..5a18e2a37009 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -576,6 +576,15 @@ config SENSORS_Q54SJ108A2
 	  This driver can also be built as a module. If so, the module will
 	  be called q54sj108a2.

+config SENSORS_STEF48H28
+	tristate "ST STEF48H28"
+	help
+	  If you say yes here you get hardware monitoring support for ST
+	  STEF48H28.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called stef48h28.
+
 config SENSORS_STPDDC60
 	tristate "ST STPDDC60"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..b2497f1d7bd9 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
+obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
 obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
diff --git a/drivers/hwmon/pmbus/stef48h28.c b/drivers/hwmon/pmbus/stef48h28.c
new file mode 100644
index 000000000000..4bde2215697c
--- /dev/null
+++ b/drivers/hwmon/pmbus/stef48h28.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for STMicroelectronics digital controller stef48h28
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+#include "pmbus.h"
+
+static struct pmbus_driver_info stef48h28_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 50,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 50,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_IN] = 100,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 0,
+	.m[PSC_CURRENT_OUT] = 100,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 9765,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -3,
+	.m[PSC_TEMPERATURE] = 25,
+	.b[PSC_TEMPERATURE] = 500,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
+		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+		| PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT
+};
+
+static int stef48h28_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &stef48h28_info);
+}
+
+static const struct i2c_device_id stef48h28_id[] = {
+	{"stef48h28"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, stef48h28_id);
+
+static const struct of_device_id __maybe_unused stef48h28_of_match[] = {
+	{.compatible = "st,stef48h28"},
+	{}
+};
+
+static struct i2c_driver stef48h28_driver = {
+	.driver = {
+			.name = "stef48h28",
+			.of_match_table = of_match_ptr(stef48h28_of_match),
+			},
+	.probe = stef48h28_probe,
+	.id_table = stef48h28_id,
+};
+
+module_i2c_driver(stef48h28_driver);
+
+MODULE_AUTHOR("Charles Hsu <hsu.yungteng@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for ST stef48h28");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
--
2.34.1
