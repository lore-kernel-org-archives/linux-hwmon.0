Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC2047ECF4;
	Fri, 15 May 2026 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852739; cv=fail; b=DwASgc8aBPMnidjzrXxAoNpg1NOLI994fEu0Tjah7smtvb3dvrpKbnP9fX0VgXQtVNvjKLuw1l/BmJNp48lwXYdPG1Xg5fZUx2ntwEiTmTxJ10k4T5e8YwX6jmv+KrL4RNfLik8CzclKgM6apUWK66FTICes51nc/dnUEFgK8QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852739; c=relaxed/simple;
	bh=Bbtf7uIrwsbW4fvt/seohQXhRdC1jddATrWrHRDXa5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMcA5BTueenzyQz4A3FKK+ipuYV4DIubT6KsbkPW6sQW28ewcUBFwM1sDdAFkL9ogMUNHHuaPsZTOI0sQ60FFAB9CH0QEyRDsgAEeByTYFoC7FjPBxhNlPhrN+YrbCcdfaZW3r8BFV/a7NGPeBe1UxkcD5a2vmkWQ5Sfa63EUUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=teh2TR5x; arc=fail smtp.client-ip=52.101.46.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="teh2TR5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1CXfshfwsBRflIVZcj+cfZqPTZcPCldIytrIVqY18tmBSjFj4SBa6179H1Fft7mqbgVORIDl0+bglBHpH0Ot4l6E5XOuYPC1e78Vp5nVE7d/xka5H4BZS3gvK8GfVvA0V5PUNifgSohYZJB/QOpnGSbL0PFt/UGjshYoO83eoGxpD+EZqA8V5d8U1j3QzvhwgeX8dIOegZcoG2lQwDyNjFZxp1lzthxKxReR7i9pH9FPHd8BdOX2MosHaDRLbLT4ADTETBDxQ3D4XGruWw6WaulD2gcwVmfv0WJAnLFi2kd06eerHIno/U/0tialX8pWKc+UIhigHqOz7oLgjSPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+oQt9AKhsRO90RxsiwgnlUk5JwGwqq1duf/pfU9zvI=;
 b=UsHasNG+K8WKwzDjuPEGPmSn9LPnbalSWXYZ2wCXpTwhnWHqgNQ5r1dp5RyAUyNAmTES6YMk4+Nz1V8pPM1BdEOglS1t6AcSWzidAySm62wS9GtgnshyAg81Fz7HckVz7SZqhWxsLwmHeLbPWDOsU61hSyHZEwaqxNh9RRQk1bND2/UXCKsdgGfkMeJzYLjJtSoPG0enXa5MbHCgIIK1C0enhaArYoWki3EDczcfNNIsTl7r2VoaWAQQsgLsjQm2h1YrgFPEVIXCx9aVelj4psf8f2jI+eiSSS3BsbnCmKgL2E9eSAoEQaJb2PlFmHux4BYeqQXPzJSOa50t9vE3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+oQt9AKhsRO90RxsiwgnlUk5JwGwqq1duf/pfU9zvI=;
 b=teh2TR5x0FGomN4zU6+bs6tz7uD1YcAViLFcBNmnPr7P3+R3Ix6ZaIaLtl8Z4sMlbY90+i/LIZ+tBzAh9Po4/BwpLSK8w1wOAwMmAfnZrlmxE9mYJJ9ywAZ+BOSxUqlVBzkbgBB4tnSS5UKSSX+Mzoso+0bB6USdp6guwcT5+iw=
Received: from BL1P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::25)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 13:45:34 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::f9) by BL1P222CA0020.outlook.office365.com
 (2603:10b6:208:2c7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Fri,
 15 May 2026 13:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:45:33 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 15 May
 2026 08:45:29 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <Prathima.Lk@amd.com>,
	<Anand.Umarji@amd.com>, <Kevin.Tung@quantatw.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v2 1/6] hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc
Date: Fri, 15 May 2026 19:15:01 +0530
Message-ID: <20260515134506.397649-2-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515134506.397649-1-Akshay.Gupta@amd.com>
References: <20260515134506.397649-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 681d37dc-8a6e-40ac-1321-08deb2883cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	J/XXsRq5gvuzvGJLfZ3cW1wANoLRp7Nbx+ggJCwp1aHBVDBu8nknZY2j3P6PjdP5RHZGx4McF9709zaLT/YN9ltSMKbKPVVT16wuXBvk3T6AT5nNQeHEvHFxH0z67n8NlSxAmhADFUgS/Kg3M+/UMiPeyuL3usTMuNwAzJJ54gTrfqmkACHGsaQL6kZHUjRrc3BjOYOHR5+F9zZ5YIf80fAJ+QPvjxb4Gob1osC3NtgnBynqu20+WZuMBsxOb23IIgT0paDsHe6UnPUvA7NiOTTxvdCQa8EPMk8gSC/A/MLDqRuxWH2ePJo+AaED3lojNur1mb8J9ujlSWIEaATRkEpqShpTSkRINmgWONrc6ucz67nN4/G2dO28dJvVAkn/csTTHAgOchVyd6eKlGFnWEfjJ9FMidDsZ7GhfyeFMP3IIoztOTnjRVvRXQFF3g4V2/SOAWeXuT4kpbieOLRJlUw9lJQbXgMPnwizbFxU7FUFR8IkShC9Z13Z+HfHB4p5Lh9EVpx5vTIULgLzrPQe9MYtYzZ7H9MxAjR65VX6IDLIwKhvktO102EVOetcKj43PfpJ2C/ANajjXmlKc6uY4XDKDIhfsqrd6pbCucI+IL0h91RisxhrRsuJ6Y2gpmMPA2I+3EUxoaElWYbAoKhWKvHi3EyafT8txgR4gsXK1zgD728D4/kz5ODinq9mEGvasXMAgxlFsDbN1Ies1xb75SguYd8qieeBo315/b/+PFo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H/SdSl5v2xlJOHZvJ6CoKqM0z9+NJt63hderXmgoz0qT2BMeCAGsYHCnxnAmuguoC0UlZiSUlxQdIPh8QNFSCC7lz/ZV+DBS9HG2SGt+DHzw6J4qmHkwYgMZQ4XQzNc6fVzoctK5VIEuFzE7kqAdYMvz+px8qQu5xEbk2/mKz1wyvaJ0Uo3JfLK6jT7W0gZNNAwwrpR1WMsRVLLJoItR+l36N7T+J0f7B+igoP2oIJOJTcAOOe42qGzHXLHZofwJwWdcLJVVMAxvEb8j0ii7xvkxU+VGkapHgf1ce42WNvVHoxukQ9NuhSOsFD95e+8nWSZ71s0ztsh7yCIOW5hajMjmNHJ74+HuM5G01aujiV1aA43H8HqXFxpztZvrwrNjxLbkDn/CDx+S3wypW8StdEN5cAtTSsaFUzoigf6JBzsR45/o3IKkP7kJDl54ScPp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:45:33.6837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681d37dc-8a6e-40ac-1321-08deb2883cb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937

From: Prathima <Prathima.Lk@amd.com>

Move SBTSI(Side-Band Temperature Sensor Interface) core functionality out
of the hwmon-only path and into drivers/misc/amd-sbi so it can be reused
by non-hwmon consumers.

I2C probe parsing is moved from drivers/hwmon/sbtsi_temp.c
into drivers/misc/amd-sbi/tsi.c under CONFIG_AMD_SBTSI. The core driver
stores struct sbtsi_data on the bus device and registers an auxiliary
device amd-sbtsi.temp-sensor.<addr> per target.

This split prepares the driver for additional interfaces while keeping
hwmon support in hwmon subsystem on top of common SBTSI core logic.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v1:
- Use auxiliary device to probe hwmon sensor instead of moving
  the hwmon functionality to misc subsystem. This change is as
  per feedback.

 drivers/hwmon/Kconfig         |   2 +-
 drivers/hwmon/sbtsi_temp.c    |  73 ++++---------------
 drivers/misc/amd-sbi/Kconfig  |  13 ++++
 drivers/misc/amd-sbi/Makefile |   3 +
 drivers/misc/amd-sbi/tsi.c    | 129 ++++++++++++++++++++++++++++++++++
 include/linux/misc/tsi.h      |  34 +++++++++
 6 files changed, 194 insertions(+), 60 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi.c
 create mode 100644 include/linux/misc/tsi.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 14e4cea48acc..6fa51e6ef6ff 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1939,7 +1939,7 @@ config SENSORS_SL28CPLD
 
 config SENSORS_SBTSI
 	tristate "Emulated SB-TSI temperature sensor"
-	depends on I2C
+	depends on AMD_SBTSI
 	help
 	  If you say yes here you get support for emulated temperature
 	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index c5b2488c4c7f..28258bf49922 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -7,13 +7,12 @@
  * Copyright (c) 2020, Kun Yi <kunyi@google.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/err.h>
-#include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/hwmon.h>
+#include <linux/init.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/bitfield.h>
+#include <linux/misc/tsi.h>
 
 /*
  * SB-TSI registers only support SMBus byte data access. "_INT" registers are
@@ -22,39 +21,17 @@
  */
 #define SBTSI_REG_TEMP_INT		0x01 /* RO */
 #define SBTSI_REG_STATUS		0x02 /* RO */
-#define SBTSI_REG_CONFIG		0x03 /* RO */
 #define SBTSI_REG_TEMP_HIGH_INT		0x07 /* RW */
 #define SBTSI_REG_TEMP_LOW_INT		0x08 /* RW */
 #define SBTSI_REG_TEMP_DEC		0x10 /* RW */
 #define SBTSI_REG_TEMP_HIGH_DEC		0x13 /* RW */
 #define SBTSI_REG_TEMP_LOW_DEC		0x14 /* RW */
 
-/*
- * Bit for reporting value with temperature measurement range.
- * bit == 0: Use default temperature range (0C to 255.875C).
- * bit == 1: Use extended temperature range (-49C to +206.875C).
- */
-#define SBTSI_CONFIG_EXT_RANGE_SHIFT	2
-/*
- * ReadOrder bit specifies the reading order of integer and decimal part of
- * CPU temperature for atomic reads. If bit == 0, reading integer part triggers
- * latching of the decimal part, so integer part should be read first.
- * If bit == 1, read order should be reversed.
- */
-#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
-
 #define SBTSI_TEMP_EXT_RANGE_ADJ	49000
 
 #define SBTSI_TEMP_MIN	0
 #define SBTSI_TEMP_MAX	255875
 
-/* Each client has this additional data */
-struct sbtsi_data {
-	struct i2c_client *client;
-	bool ext_range_mode;
-	bool read_order;
-};
-
 /*
  * From SB-TSI spec: CPU temperature readings and limit registers encode the
  * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
@@ -195,55 +172,33 @@ static const struct hwmon_chip_info sbtsi_chip_info = {
 	.info = sbtsi_info,
 };
 
-static int sbtsi_probe(struct i2c_client *client)
+static int sbtsi_probe(struct auxiliary_device *adev,
+		       const struct auxiliary_device_id *id)
 {
-	struct device *dev = &client->dev;
+	struct sbtsi_data *data = dev_get_drvdata(adev->dev.parent);
+	struct device *dev = &adev->dev;
 	struct device *hwmon_dev;
-	struct sbtsi_data *data;
-	int err;
 
-	data = devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->client = client;
-
-	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
-	if (err < 0)
-		return err;
-	data->ext_range_mode = FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), err);
-	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), err);
-
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbtsi", data,
 							 &sbtsi_chip_info, NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-static const struct i2c_device_id sbtsi_id[] = {
-	{"sbtsi"},
-	{}
+static const struct auxiliary_device_id sbtsi_id[] = {
+	{ .name = AMD_SBTSI_ADEV "." AMD_SBTSI_AUX_HWMON },
+	{ }
 };
-MODULE_DEVICE_TABLE(i2c, sbtsi_id);
+MODULE_DEVICE_TABLE(auxiliary, sbtsi_id);
 
-static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
-	{
-		.compatible = "amd,sbtsi",
-	},
-	{ },
-};
-MODULE_DEVICE_TABLE(of, sbtsi_of_match);
-
-static struct i2c_driver sbtsi_driver = {
+static struct auxiliary_driver sbtsi_driver = {
 	.driver = {
 		.name = "sbtsi",
-		.of_match_table = of_match_ptr(sbtsi_of_match),
 	},
 	.probe = sbtsi_probe,
 	.id_table = sbtsi_id,
 };
-
-module_i2c_driver(sbtsi_driver);
+module_auxiliary_driver(sbtsi_driver);
 
 MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
 MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index 30e7fad7356c..512251690e0e 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -20,3 +20,16 @@ config AMD_SBRMI_HWMON
 	  This provides support for RMI device hardware monitoring. If enabled,
 	  a hardware monitoring device will be created for each socket in
 	  the system.
+
+config AMD_SBTSI
+	tristate "AMD side band TSI support"
+	depends on I2C
+	depends on ARM || ARM64 || COMPILE_TEST
+	select AUXILIARY_BUS
+	help
+	  Enables support for the AMD SB-TSI (Side Band Temperature Sensor
+	  Interface) driver, which provides access to emulated CPU temperature
+	  sensors on AMD SoCs via an I2C connected BMC device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sbtsi.
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index 38eaaa651fd9..28f95b9e204f 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -2,3 +2,6 @@
 sbrmi-i2c-objs  		+= rmi-i2c.o rmi-core.o
 sbrmi-i2c-$(CONFIG_AMD_SBRMI_HWMON)	+= rmi-hwmon.o
 obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
+# SBTSI Configuration
+sbtsi-objs	+= tsi.o
+obj-$(CONFIG_AMD_SBTSI)	+= sbtsi.o
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
new file mode 100644
index 000000000000..ee2216785550
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * tsi.c - AMD SBTSI I2C core driver. Probes the SBTSI device over I2C
+ *         and publishes an auxiliary device on the auxiliary bus.
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/misc/tsi.h>
+#include <linux/slab.h>
+
+#define SBTSI_REG_CONFIG		0x03 /* RO */
+
+/*
+ * Bit for reporting value with temperature measurement range.
+ * bit == 0: Use default temperature range (0C to 255.875C).
+ * bit == 1: Use extended temperature range (-49C to +206.875C).
+ */
+#define SBTSI_CONFIG_EXT_RANGE_SHIFT	2
+
+/*
+ * ReadOrder bit specifies the reading order of integer and decimal part of
+ * CPU temperature for atomic reads. If bit == 0, reading integer part triggers
+ * latching of the decimal part, so integer part should be read first.
+ */
+#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
+
+static void sbtsi_adev_release(struct device *dev)
+{
+	kfree(to_auxiliary_dev(dev));
+}
+
+static void sbtsi_unregister_hwmon_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+/*
+ * Create and publish an auxiliary device. The hwmon driver in
+ * drivers/hwmon/sbtsi_temp.c binds to this device.
+ *
+ * @dev:      I2C device (parent of the auxiliary device)
+ * @dev_addr: I2C address — used as the auxiliary device instance ID so that
+ *            each socket gets a unique name.
+ */
+static int sbtsi_create_hwmon_adev(struct device *dev, u8 dev_addr)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = AMD_SBTSI_AUX_HWMON;
+	adev->id = dev_addr;
+	adev->dev.parent = dev;
+	adev->dev.release = sbtsi_adev_release;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
+	}
+
+	ret = __auxiliary_device_add(adev, AMD_SBTSI_ADEV);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, sbtsi_unregister_hwmon_adev, adev);
+}
+
+static int sbtsi_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct sbtsi_data *data;
+	int err;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
+	if (err < 0)
+		return err;
+	data->ext_range_mode = FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), err);
+	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), err);
+
+	dev_set_drvdata(dev, data);
+	return sbtsi_create_hwmon_adev(dev, client->addr);
+}
+
+static const struct i2c_device_id sbtsi_id[] = {
+	{"sbtsi"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sbtsi_id);
+
+static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
+	{
+		.compatible = "amd,sbtsi",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sbtsi_of_match);
+
+static struct i2c_driver sbtsi_driver = {
+	.driver = {
+		.name = "sbtsi-i2c",
+		.of_match_table = of_match_ptr(sbtsi_of_match),
+	},
+	.probe = sbtsi_i2c_probe,
+	.id_table = sbtsi_id,
+};
+
+module_i2c_driver(sbtsi_driver);
+
+MODULE_DESCRIPTION("AMD SB-TSI I2C core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
new file mode 100644
index 000000000000..6f7177edbcf5
--- /dev/null
+++ b/include/linux/misc/tsi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AMD SBTSI shared data structure and auxiliary bus definitions.
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _LINUX_TSI_H_
+#define _LINUX_TSI_H_
+
+#include <linux/i2c.h>
+#include <linux/types.h>
+
+/**
+ * struct sbtsi_data - driver private data for an AMD SB-TSI device
+ * @client:	underlying I2C client
+ * @ext_range_mode:	sensor uses extended temperature range
+ * @read_order:	if set, decimal part must be read before integer part
+ */
+struct sbtsi_data {
+	struct i2c_client *client;
+	bool ext_range_mode;
+	bool read_order;
+};
+
+/*
+ * Name of the auxiliary device published on the auxiliary bus by the core
+ * driver.  The full device name is "amd-sbtsi.temp-sensor.<id>". where
+ * <id> is the auxiliary device instance id.
+ */
+#define AMD_SBTSI_ADEV		"amd-sbtsi"
+#define AMD_SBTSI_AUX_HWMON	"temp-sensor"
+
+#endif /* _LINUX_TSI_H_ */
-- 
2.34.1

