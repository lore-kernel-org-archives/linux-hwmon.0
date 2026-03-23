Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09CF396568;
	Mon, 23 Mar 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264144; cv=fail; b=mQ4xA/5a+FaSdOtyKgvmR7BdePUzYH8qDh47DPcSjqk2/6Hg1uhaibQfFI0YRTbzFAuIENeY4PXnSJz7zJTsrrxXdnMCfaWlbS4lwm5zH+LIsHu3kOIjk4LpzxlDHfCJnI7JTBS/QjGpW+r1KELL34BmW+yJKSZVz0QJ3adhp0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264144; c=relaxed/simple;
	bh=QMaPIQEaOOxFi4xjMJvxiHIZr30urCajlCOKaoq4Rok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=If/e3tolQpg7gEWBv9BumFQyo3DXKRvxEHtf4vNB+QtR6nN44+D0gSECqsvUHc0cBqCIvfA2Km3pdbNNMzcToWpn07qOUNwbs/HRCXX72d22yXlmIwQUrM0J04xhn10sCcg2AXhNpOTtVaVzzHe0MqZwIJg9TGFrKa2fHhDmOyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xqN8uDEm; arc=fail smtp.client-ip=52.101.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xqN8uDEm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOdu/FVyOBJFkBLq++O46pmuBJ07HJu5c/CofPmhKHL6CE2UcPzOFNo8/ZB1F6r1DYXMOsvCXay6lK3d329BgFog87guSpM6VOXqQSO2HchETOSiyhGlK6yAztY8yKiz5gZxLrE2o3fWfKwrFR0tdEIl58Q4C2ihWo55WKdQq8tKwkQHrUTUT9/L+M/bUIvU17zAY+E6YaegKLGJHb8uzXIP7h1e9aGdAFg/b3sLcnUtBmO5GldYZL3MIz9X29fpYkiM/kQIm6iV8uXYRrKxOjMtaGKDQmCq1Q/QRCXj8BOp+VEVIp/LyUBKA/y2eAnkFzK2PGjM721vqj9fZiD0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xKmA69JC+imOYzhM8Hf7CSBB0o8ErLWj0YmTEMMKnI=;
 b=nVZbNcxbKRjZaMh98rAJwSGSM3lErjewHFy59qhcDsWE5yxhHXoQ4Utvu2SWeX5+hY7cgrHG9EZ5ara1fufDskEuEXossYwbasWlrEjYSMHkSsmULC5C+/T3P1VDXbmRs+BQQNguISHZoehNNQPiyvf2FTvO6+AAWzNF/jKLL5F4rPJi0wEtYqmcKVnnCpQqCcgrgIpzqtPc1KsoHhH5yF6G2kbTO20Fl0qIjrIdZhXvEr6jPJ54BSFhurx6VhINWzKa0cXcbBBY/EYjaYPE3CVszZbTKbLXK05x7yyfdbthSL1eFwCyoeXsX9PDeskUE8jYUXhDUxduBW9dA9DP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xKmA69JC+imOYzhM8Hf7CSBB0o8ErLWj0YmTEMMKnI=;
 b=xqN8uDEmf2yL3xV0IZEO2tBdFdzL6UMUOYsTg3jN+527lMpgVtBnHNreGMItT0+Li1fLLjq2H8cnkAi6vgl5XoxNGQm8Xq0rta3sT4zPm8DZnRzZWjUmKWpSe9DaKsIJMusnCnr2Gr2bf8zlRGnI5FStxpZrZm420LPcwgJ8VUI=
Received: from MN2PR08CA0004.namprd08.prod.outlook.com (2603:10b6:208:239::9)
 by CH1PPFC908D89D1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::623) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 23 Mar
 2026 11:08:57 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::ea) by MN2PR08CA0004.outlook.office365.com
 (2603:10b6:208:239::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:08:57 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 06:08:53 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<Prathima.Lk@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<Anand.Umarji@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <kunyi@google.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 4/6] misc: amd-sbi: Add support for SB-TSI over I3C
Date: Mon, 23 Mar 2026 16:38:09 +0530
Message-ID: <20260323110811.2898997-5-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb08.amd.com
 (10.181.42.217)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ee5c28-e027-4282-8543-08de88cc9431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XGhNo5Z8QOB5amHQ+1yvVaIDiua7yC1UusjZqqciamsNqjYoOaT9gyzZFYI801+VVWrdYK1DpV0fiEkSyCuqjT8mE08Q65BpngwWDvlWO+5uCTh73r1hD5x/QXUO8OCTXWnuf+GB0dnuceXyjimHp2b7Bb9Qr4GxNgmx/Vq+3iDLgk+WwZL3GAVi0GG5o9WSYpQbJ2PPpUEq3KWlpzz7n7fuHQ9Bmid1hF16z10cO1tOLYDh1yBIAy6CsqciCawJxKeelicPj+ts3K0Tbb4SPeDu1s1v48z5rohVS4DiCzGsnR/8Qys2tbeA+jm5NFtqcxz+UYzOrb9yP4zXTyDvodqXyL8LXlVU4FzHYg+Endn83dlPyArZGOmT6Xzg3f5LjNgIx7OU46QVXbeS9rY2IOVpG543J/5nsyZZmSOuGeQAFWgoBK9CC6RdjxF08L75Y8TQuzpQ2b/rsAxqBmTuRE83hwSPmyX10La6zjfucpt7WjCipU54i35G9B3ouMgipNMPzqNb5MDkxK4lrhfrwRRoYNKjYgZmgdGiCRF8eezK6pE/B/3zok5h3qQ15izokS0K89PEUcBc88up0/jGTiUnGn6QkqF1zg6iosUx7RCdFZS+XIorNzd0iwU1zTDkC4L9YiUGfaMUofyL0qD5T9PZyv8ZPERXfSI28qwaTsFYahbx0iqAx6KX8aJ/ogQW7UwB+aDks1B+XQ0gQr7/FjwS7ayBVOn22pnLiqXgriFUQhF7ucxYQEPgg5+nW+WmAHlRBHkCVxyqncnHElHXoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vGhFI+00vzuYTp2fUFildlCDHPOCckmG8YrOazfD4lFvONMXbuL706u5cj7CXLKtec3B1OK+UNNF2+UHPpEPk4GnPNNOymRC3+MJfYQgbzzvbL2zTEYWazdc0R/uxqjXMLhUnv5kcTHXgHOaX37cw17rpccZ04dl2an8MolOKVeYjg7PoHsODtt24LZ7s8OiB0JmHC5LLPoz62p13xXwLaqW3Um1d5ghK2RqKOLSijEA/pGdFu7cJiSMoFUPk57wcQ3V+16Pz3W4uvoW14RKEIx1/92E/28qNe19ReYGO003azmkGLH0quz3hYbbH3K6kuB/0fEVUcfZ5NkLiFHTRhaqbA2gS5MAJDRe+Ir9F3dDry0Fvme8ZCS3+P8K338Skb9kaRif+ZcXzmr19OFXzd0lDKjbhR1kbdSM8RepsKlp4+/mTwE9G2yF27O2TjSe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:08:57.3747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ee5c28-e027-4282-8543-08de88cc9431
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1

From: Prathima <Prathima.Lk@amd.com>

- Extend the SB-TSI driver to support both I2C and I3C bus interfaces.
- The driver maintains backward compatibility with existing I2C
deployments while enabling support for systems using the I3C bus.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
 drivers/misc/amd-sbi/Kconfig     |  5 ++-
 drivers/misc/amd-sbi/Makefile    |  2 +-
 drivers/misc/amd-sbi/tsi-core.c  | 64 ++++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/tsi-core.h  | 11 +++++-
 drivers/misc/amd-sbi/tsi-hwmon.c | 50 ++++++++++++++++++-------
 drivers/misc/amd-sbi/tsi.c       | 62 +++++++++++++++++++++++++++++--
 6 files changed, 173 insertions(+), 21 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.c

diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index 2710860a86c7..d18652537788 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -23,11 +23,12 @@ config AMD_SBRMI_HWMON
 
 config SENSORS_SBTSI
 	tristate "Emulated SB-TSI temperature sensor"
-	depends on I2C
+	depends on I3C_OR_I2C
 	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  If you say yes here you get support for emulated temperature
-	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
+	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device
+	  over I2C and I3C.
 	  This driver is intended to run on the BMC, not the managed node.
 
 	  This driver can also be built as a module. If so, the module will
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index a874136e438f..e87c8e618dcc 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -3,6 +3,6 @@ sbrmi-i2c-objs  		+= rmi-i2c.o rmi-core.o
 sbrmi-i2c-$(CONFIG_AMD_SBRMI_HWMON)	+= rmi-hwmon.o
 obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
 # SBTSI Configuration
-sbtsi-objs	+= tsi.o
+sbtsi-objs	+= tsi.o tsi-core.o
 sbtsi-$(CONFIG_AMD_SBTSI_HWMON)	+= tsi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi.o
diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
new file mode 100644
index 000000000000..fcb7fcf87a55
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * tsi-core.c - file defining SB-TSI protocols compliant
+ *              AMD SoC device.
+ * Copyright (c) 2020, Google Inc.
+ * Copyright (c) 2020, Kun Yi <kunyi@google.com>
+ */
+
+#include "tsi-core.h"
+
+/* I3C read transfer function */
+static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
+{
+	struct i3c_xfer xfers[2];
+
+	/* Send register address */
+	xfers[0].rnw = false;
+	xfers[0].len = 1;
+	xfers[0].data.out = &reg;
+
+	/* Read data */
+	xfers[1].rnw = true;
+	xfers[1].len = 1;
+	xfers[1].data.in = val;
+
+	return i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);
+}
+
+/* I3C write transfer function */
+static int sbtsi_i3c_write(struct sbtsi_data *data, u8 reg, u8 *val)
+{
+	u8 buf[2] = { reg, *val };
+	struct i3c_xfer xfers = {
+		.rnw = false,
+		.len = 2,
+		.data.out = buf,
+	};
+
+	return i3c_device_do_xfers(data->i3cdev, &xfers, 1, I3C_SDR);
+}
+
+/* I2C transfer function */
+static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
+{
+	if (is_read) {
+		int ret = i2c_smbus_read_byte_data(data->client, reg);
+
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		return 0;
+	}
+	return i2c_smbus_write_byte_data(data->client, reg, *val);
+}
+
+/* Unified transfer function for I2C and I3C access */
+int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
+{
+	if (data->is_i3c)
+		return is_read ? sbtsi_i3c_read(data, reg, val)
+			: sbtsi_i3c_write(data, reg, val);
+
+	return sbtsi_i2c_xfer(data, reg, val, is_read);
+}
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
index e60cf25fda7a..a4ded17942c9 100644
--- a/drivers/misc/amd-sbi/tsi-core.h
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -11,14 +11,23 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/types.h>
+#include <linux/i3c/device.h>
+#include <linux/i3c/master.h>
 
 /* Each client has this additional data */
 struct sbtsi_data {
-	struct i2c_client *client;
+	union {
+		struct i2c_client *client;
+		struct i3c_device *i3cdev;
+	};
 	bool ext_range_mode;
 	bool read_order;
+	bool is_i3c;
 };
 
+int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read);
+
 #ifdef CONFIG_AMD_SBTSI_HWMON
 int create_sbtsi_hwmon_sensor_device(struct device *dev, struct sbtsi_data *data);
 #else
diff --git a/drivers/misc/amd-sbi/tsi-hwmon.c b/drivers/misc/amd-sbi/tsi-hwmon.c
index efd450a85d34..9b447042d4aa 100644
--- a/drivers/misc/amd-sbi/tsi-hwmon.c
+++ b/drivers/misc/amd-sbi/tsi-hwmon.c
@@ -27,8 +27,7 @@
 #define SBTSI_TEMP_MIN 0
 #define SBTSI_TEMP_MAX 255875
 
-/*
- * From SB-TSI spec: CPU temperature readings and limit registers encode the
+/* From SB-TSI spec: CPU temperature readings and limit registers encode the
  * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
  * register encodes the base-2 of the integer portion, and the upper 3 bits of
  * the "low byte" encode in base-2 the decimal portion.
@@ -61,24 +60,50 @@ static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct sbtsi_data *data = dev_get_drvdata(dev);
 	s32 temp_int, temp_dec;
+	u8 reg_val;
+	int err;
 
 	switch (attr) {
 	case hwmon_temp_input:
 		if (data->read_order) {
-			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
-			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
+			err = sbtsi_xfer(data, SBTSI_REG_TEMP_DEC, &reg_val, true);
+			if (err < 0)
+				return err;
+			temp_dec = reg_val;
+			err = sbtsi_xfer(data, SBTSI_REG_TEMP_INT, &reg_val, true);
+			if (err < 0)
+				return err;
+			temp_int = reg_val;
 		} else {
-			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
-			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
+			err = sbtsi_xfer(data, SBTSI_REG_TEMP_INT, &reg_val, true);
+			if (err < 0)
+				return err;
+			temp_int = reg_val;
+			err = sbtsi_xfer(data, SBTSI_REG_TEMP_DEC, &reg_val, true);
+			if (err < 0)
+				return err;
+			temp_dec = reg_val;
 		}
 		break;
 	case hwmon_temp_max:
-		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_INT);
-		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_DEC);
+		err = sbtsi_xfer(data, SBTSI_REG_TEMP_HIGH_INT, &reg_val, true);
+		if (err < 0)
+			return err;
+		temp_int = reg_val;
+		err = sbtsi_xfer(data, SBTSI_REG_TEMP_HIGH_DEC, &reg_val, true);
+		if (err < 0)
+			return err;
+		temp_dec = reg_val;
 		break;
 	case hwmon_temp_min:
-		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_INT);
-		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_DEC);
+		err = sbtsi_xfer(data, SBTSI_REG_TEMP_LOW_INT, &reg_val, true);
+		if (err < 0)
+			return err;
+		temp_int = reg_val;
+		err = sbtsi_xfer(data, SBTSI_REG_TEMP_LOW_DEC, &reg_val, true);
+		if (err < 0)
+			return err;
+		temp_dec = reg_val;
 		break;
 	default:
 		return -EINVAL;
@@ -115,12 +140,11 @@ static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
 		val += SBTSI_TEMP_EXT_RANGE_ADJ;
 	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
 	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
-
-	err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
+	err = sbtsi_xfer(data, reg_int, &temp_int, false);
 	if (err)
 		return err;
 
-	err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
+	err = sbtsi_xfer(data, reg_dec, &temp_dec, false);
 	if (err)
 		return err;
 	return 0;
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index df754e60d84b..d7a8237fc4fd 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * tsi.c - Side band TSI over I2C support for AMD out of band management.
+ * tsi.c - Side band TSI over I2C/I3C support for AMD out of band management.
  *
  * Copyright (c) 2020-2026, Google Inc.
  * Copyright (c) 2020-2026, Kun Yi <kunyi@google.com>
@@ -26,7 +26,7 @@
 
 #define SBTSI_CONFIG_READ_ORDER_SHIFT  5
 
-static int sbtsi_probe(struct i2c_client *client)
+static int sbtsi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct sbtsi_data *data;
@@ -36,6 +36,7 @@ static int sbtsi_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->is_i3c = false;
 	data->client = client;
 	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
 	if (err < 0)
@@ -66,11 +67,64 @@ static struct i2c_driver sbtsi_driver = {
 		.name = "sbtsi",
 		.of_match_table = of_match_ptr(sbtsi_of_match),
 	},
-	.probe = sbtsi_probe,
+	.probe = sbtsi_i2c_probe,
 	.id_table = sbtsi_id,
 };
 
-module_i2c_driver(sbtsi_driver);
+static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct sbtsi_data *data;
+	int err;
+	u8 val;
+	/*
+	 * AMD OOB devices differ on basis of Instance ID,
+	 * for SBTSI, instance ID is 0.
+	 * As the device Id match is not on basis of Instance ID,
+	 * add the below check to probe the SBTSI device only and
+	 * not other OOB devices.
+	 */
+	if (I3C_PID_INSTANCE_ID(i3cdev->desc->info.pid) != 0)
+		return -ENXIO;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->i3cdev = i3cdev;
+	data->is_i3c = true;
+
+	err = sbtsi_xfer(data, SBTSI_REG_CONFIG, &val, true);
+	if (err)
+		return err;
+
+	data->ext_range_mode = FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), val);
+	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
+
+	dev_set_drvdata(dev, data);
+	return create_sbtsi_hwmon_sensor_device(dev, data);
+}
+
+static const struct i3c_device_id sbtsi_i3c_id[] = {
+	/* PID for AMD SBTSI device */
+	I3C_DEVICE_EXTRA_INFO(0x112, 0x0, 0x1, NULL),
+	I3C_DEVICE_EXTRA_INFO(0x0, 0x0, 0x118, NULL), /* Socket:0, Venice A0 */
+	I3C_DEVICE_EXTRA_INFO(0x0, 0x100, 0x118, NULL), /* Socket:1, Venice A0 */
+	I3C_DEVICE_EXTRA_INFO(0x112, 0x0, 0x119, NULL), /* Socket:0, Venice B0 */
+	I3C_DEVICE_EXTRA_INFO(0x112, 0x100, 0x119, NULL), /* Socket:1, Venice B0 */
+	{}
+};
+MODULE_DEVICE_TABLE(i3c, sbtsi_i3c_id);
+
+static struct i3c_driver sbtsi_i3c_driver = {
+	.driver = {
+		.name = "sbtsi-i3c",
+	},
+	.probe = sbtsi_i3c_probe,
+	.id_table = sbtsi_i3c_id,
+};
+
+module_i3c_i2c_driver(sbtsi_i3c_driver, &sbtsi_driver);
 
 MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
 MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
-- 
2.34.1

