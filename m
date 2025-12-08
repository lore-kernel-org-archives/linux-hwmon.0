Received: from mail.monolithicpower.com (unknown [12.33.0.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE67314D2E;
	Mon,  8 Dec 2025 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=12.33.0.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765178299; cv=none; b=VlR76hjLR+4CjO087kqap1cvG2PvY5U2uHKiGwHdxvT8Apgw5Vzl0Q/uHDH4AR0Iun0iZgElLvKnZolY0k6ZQ7eb+3MlnvOrXy10AOAClS4qOWRvrBxepooq1P/KP2Z+QS7ES53XHOXBQ9Oe0ZcfN9YdhPxnoxgNwamURCCm5fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765178299; c=relaxed/simple;
	bh=MQhlEnqF4537fWEQPNYU2Ofmi3CAyZ5dRWqJKxwTv58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4dyMlKrtz9JtAYYlhZ3SHZ+a0+bWROkT8DFoKJIeC7Z4g/G29WdtnGNKEUxQkRv3EceqUaL/BNNimxzNQpuprBBiERSzwYGWBCaFWkCyrxCLDa7khaED1aIhIEXMeBddz5WamimzalmMVtUX8vGgd8YfwEoU1oi1jUE0IR7WWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; arc=none smtp.client-ip=12.33.0.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 MPS-MSH04.monolithicpower.com (10.10.10.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 7 Dec 2025 23:18:15 -0800
Received: from HZ-200D-C0727.monolithicpower.com (10.53.66.137) by
 CD-MSH04.monolithicpower.com (10.10.70.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 8 Dec 2025 15:18:13 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <wyx137120466@gmail.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH 2/2] hwmon: add mp5926 driver
Date: Mon, 8 Dec 2025 15:16:59 +0800
Message-ID: <20251208071659.1157-3-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251208071659.1157-1-Yuxi.Wang@monolithicpower.com>
References: <20251208071659.1157-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CD-MSLBN02.monolithicpower.com (192.168.86.32) To
 CD-MSH04.monolithicpower.com (10.10.70.213)

Add support for MPS mp5926.
Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp5926.rst |  92 ++++++++++++++++
 MAINTAINERS                    |   7 ++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp5926.c   | 192 +++++++++++++++++++++++++++++++++
 6 files changed, 302 insertions(+)
 create mode 100644 Documentation/hwmon/mp5926.rst
 create mode 100644 drivers/hwmon/pmbus/mp5926.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..6181c3f62177 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -185,6 +185,7 @@ Hardware Monitoring Kernel Drivers
    mp2993
    mp5023
    mp5920
+   mp5926
    mp5990
    mp9941
    mp9945
diff --git a/Documentation/hwmon/mp5926.rst b/Documentation/hwmon/mp5926.rst
new file mode 100644
index 000000000000..4b64a7e24ae6
--- /dev/null
+++ b/Documentation/hwmon/mp5926.rst
@@ -0,0 +1,92 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5926
+====================
+
+Supported chips:
+
+  * MPS mp5926
+
+    Prefix: 'mp5926'
+
+  * Datasheet
+    https://www.monolithicpower.com/en/
+
+Author:
+
+	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5926 Hot-Swap Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+**in2_rated_max**
+
+**in2_rated_min**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr2_input**
+
+**curr2_label**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+The driver provides the following attributes for output power:
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_max**
+
+**temp1_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index d701a4d5b00e..fea710aab535 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17708,6 +17708,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp2993.rst
 F:	drivers/hwmon/pmbus/mp2993.c
 
+MPS MP5926 DRIVER
+M:	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp5926.rst
+F:	drivers/hwmon/pmbus/mp5926.c
+
 MPS MP9941 DRIVER
 M:	Noah Wang <noahwang.wang@outlook.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f3fb94cebf1a..0a6699fa976a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -472,6 +472,15 @@ config SENSORS_MP5920
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5920.
 
+config SENSORS_MP5926
+	tristate "MPS MP5926"
+	help
+	  If you say yes here you get hardware monitoring support for Monolithic
+	  MP5926.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called MP5926.
+
 config SENSORS_MP5990
 	tristate "MPS MP5990"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 349a89b6d92e..75ec4956ca8d 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
+obj-$(CONFIG_SENSORS_MP5926)	+= mp5926.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
 obj-$(CONFIG_SENSORS_MP9945)	+= mp9945.o
diff --git a/drivers/hwmon/pmbus/mp5926.c b/drivers/hwmon/pmbus/mp5926.c
new file mode 100644
index 000000000000..e86ec1ec0584
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5926.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// mp5926.c  - pmbus driver for mps mp5926
+//
+// Copyright 2025 Monolithic Power Systems, Inc
+//
+// Author: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+/*Common Register*/
+#define PAGE	0x01
+#define EFUSE_CFG 0xCF
+#define I_SCALE_SEL 0xC6
+#define MP5926_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN | \
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_INPUT | \
+			PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_VOUT)
+static int mp5926_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	int ret;
+	s16 exponent;
+	s32 mantissa;
+	s64 val;
+
+	switch (reg) {
+	case PMBUS_READ_VIN...PMBUS_READ_VCAP:
+	case PMBUS_READ_IOUT...PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_READ_PIN:
+	case PMBUS_STATUS_WORD:
+		ret = -ENODATA;
+	break;
+	case PMBUS_READ_VOUT:
+	// The Vout format used by the chip is linear11 and not linear16.
+	// So we transform the value into the direct format defined by PMBus.
+	ret = i2c_smbus_read_word_data(client, EFUSE_CFG);
+	if (ret < 0)
+		return ret;
+	if (ret & BIT(12)) {
+		ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
+		if (ret < 0)
+			return ret;
+		exponent = ((s16)ret) >> 11;
+		mantissa = ((s16)((ret & 0x7ff) << 5)) >> 5;
+		val = mantissa * 1000;
+		if (exponent >= 0)
+			val <<= exponent;
+		else
+			val >>= -exponent;
+		val = div_s64(val * 10 + 313L, 625L);
+		return val;
+	}
+	ret = -ENODATA;
+	break;
+	default:
+		ret = -EINVAL;
+	break;
+	}
+
+	return ret;
+}
+
+static int mp5926_read_byte_data(struct i2c_client *client, int page,
+				 int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_VOUT:
+	case PMBUS_STATUS_INPUT:
+	case PMBUS_STATUS_TEMPERATURE:
+	case PMBUS_STATUS_CML:
+	case PMBUS_STATUS_MFR_SPECIFIC:
+	   ret = -ENODATA;
+	break;
+	default:
+		ret = -EINVAL;
+	break;
+	}
+	return ret;
+}
+
+static struct pmbus_driver_info mp5926_info_linear = {
+	.pages = PAGE,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_POWER] = linear,
+
+	.m[PSC_VOLTAGE_OUT] = 16,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+
+	.read_word_data = mp5926_read_word_data,
+	.read_byte_data = mp5926_read_byte_data,
+	.func[0] = MP5926_FUNC,
+};
+
+static struct pmbus_driver_info mp5926_info_direct = {
+	.pages = PAGE,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_POWER] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 16,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+
+	.m[PSC_CURRENT_IN] = 16,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 0,
+
+	.m[PSC_VOLTAGE_OUT] = 16,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+
+	.m[PSC_TEMPERATURE] = 4,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 3,
+
+	.m[PSC_POWER] = 25,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -2,
+
+	.read_word_data = mp5926_read_word_data,
+	.read_byte_data = mp5926_read_byte_data,
+	.func[0] = MP5926_FUNC,
+};
+
+static int mp5926_probe(struct i2c_client *client)
+{
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA
+				     | I2C_FUNC_SMBUS_BLOCK_DATA))
+		return -ENODEV;
+	ret = i2c_smbus_read_word_data(client, EFUSE_CFG);
+	if (ret < 0)
+		return ret;
+	if (ret & BIT(12)) {
+		ret = pmbus_do_probe(client, &mp5926_info_linear);
+	} else {
+		ret = i2c_smbus_read_word_data(client, I_SCALE_SEL);
+		if (ret < 0)
+			return ret;
+		if (ret & BIT(6))
+			mp5926_info_direct.m[PSC_CURRENT_IN] = 4;
+		ret = pmbus_do_probe(client, &mp5926_info_direct);
+	}
+	if (!ret)
+		dev_info(&client->dev, "%s chip found\n", client->name);
+	return ret;
+}
+
+static const struct i2c_device_id mp5926_id[] = {
+	{ "mp5926", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp5926_id);
+
+static const struct of_device_id mp5926_of_match[] = {
+	{ .compatible = "mps,mp5926" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp5926_of_match);
+
+static struct i2c_driver mp5926_driver = {
+	.probe = mp5926_probe,
+	.driver = {
+		.name = "mp5926",
+		.of_match_table = mp5926_of_match,
+	},
+	.id_table = mp5926_id,
+};
+
+module_i2c_driver(mp5926_driver);
+MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
+MODULE_DESCRIPTION("MPS MP5926 HWMON driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.39.2

