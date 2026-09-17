Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB143264D8;
	Thu, 17 Sep 2026 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644844; cv=fail; b=bjtLbw8fdAICJjBSzwZdZqsVnlME8hXvSpphHbikZbmxMo9t9Kic4TTvApriyM6PT2MnWG1X/r5h+89PlIbggCReyeFj7mVc156Cb0ZVWT2JOEQaoo/uk9oZTfeX7xCWyNaqwfj5gi55OIjkTBPxnzYKSXIHCBYRsM1nGA1D0+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644844; c=relaxed/simple;
	bh=1Pw2/crpJXi+MRWRSSogjOkA8fwSJ5TzhGwBAfmCkaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cSHZBGFypxLg0kwpTaMoSRgUoM8taRVbq2afZzBAi2gXCWZqI4Jmf9TRWYNYt/rxLRIkxrcM9unJM5bD7gsmgQhCXlrs7f4Ik9u8io3adwVJI2v35KmcY2RInfxpC0DaA+VzUp+VsdYcBgsR6IPoO3dTkZQ91/XUwAg6IjGRiAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LwgU+72O; arc=fail smtp.client-ip=40.93.194.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LwgU+72O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8rzhrU1h1gRhuIF9xcHCCkowGASPDr6hWYbAeez7QotHCaxqke1C3GhgMSay868Qock96lOdiKReoEGgzdUwVOW0c9wDo9aaOSV1FrzpXr+PY7HlnnKcdMjR68W/smscWifeEQ3zHHKoI3sgHbboFmpJT36D5oNqiDLZju00bG46ZoGz60mhOfa5G4iu4Em3m9geYyvLX1colo+wJu0+3F1qvbPJshTYz8GLBkI0dOFS4s9kMU8qIbxPT6txJoG/ity02taKwiMp+rFdOg4/eUn8EUMUmbROSEi/HarEate7K3+J+aUg5ffYL4nQTGgZVg3VQhqxXE1H94QOx6Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI4RovsK2Dixb4YXjxJQVVAgUntFieT/TR+75tB/pO4=;
 b=ViJveymoi0aoTvx9zoDbSlqOUjWkUdefVuDi2mw6MtkQXNp7QT62iZAhSrc1wWkw+pvi7IStfCnlShLxg2jBrAMm77k2F9m8MvyULKzwMiRiUnKhYRwqM3kjHeyPpzD5PSXORICpjnz4yuD9fp5xuRd6o9uJLyhmJIANpx2+udY4aY9a1sGztawJwWDHJsP4Wy+GIGoGXT5l2a6tGVkgtq9fjVGR3sqQ+AZHfak/4aqp8+cQpCVe1hRvRvkdfxsVxTAWeOJrEALJrEIVOOHkJbDNJSFqot3o0l9oBiu1+Qt30WCiPSUR0YpVFGfYEyJFKfKCp9NkEeB+E5FXRR2d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI4RovsK2Dixb4YXjxJQVVAgUntFieT/TR+75tB/pO4=;
 b=LwgU+72OPnVBdqEgEmQkE6EGUy+HjwTaSx4Km1hGFJRSBKpIGrTaGEFTD6rycXWiKqSvwo5T/IQiIF7ate1LIaUQCm0rh4i1kxY1MEEw6Nse6nxUOFpbQJT8uFW1TzHvK9zfmOGm2iXUA4dZ0uLOQXBFcYjCDynBNb75Pnspcr4=
Received: from MW4PR03CA0214.namprd03.prod.outlook.com (2603:10b6:303:b9::9)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 11:33:58 +0000
Received: from BN3PEPF00022BC5.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::8c) by MW4PR03CA0214.outlook.office365.com
 (2603:10b6:303:b9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 11:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC5.mail.protection.outlook.com (10.167.248.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 11:33:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 06:33:55 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 06:33:55 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 06:33:53 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Thu, 17 Sep 2026 19:33:40 +0800
Subject: [PATCH v5 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260917-add-tda38740-and-tda38725-v5-2-7fc19668ada4@gmail.com>
References: <20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com>
In-Reply-To: <20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789644825; l=6206;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=rxlnB87G3pqUtceMBMzYvNHqeXA1vzQwDUv+8M+hzgw=;
 b=59Xm0xdLNmA3h9IVqNtz4zWnRcJ+4gTbDN5dS7e2pGbvbc37xFifoU5nJVC9IwX30ZPOCzpyc
 FX18fNRU0wZBt+Hbz5i0V9SXb/y7BWObAc56aR0hzB8Ux/imMJxtBAZ
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC5:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 999eb8d1-db5b-42d6-14a2-08df14af8f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|82310400026|36860700016|13003099007|3023799007|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DMSZYJAuL8DZ28sGjWRT/7me6uqB3FXTb0S9mVpSsDjzkukauoWjlHD+kQ3TFXRj7jaYO8uPBENuv3o29xmq8SzLKdnoCSkPV+g5fZiunemLqCFmqCP39Z7BT892bG7YrPqXWS7Pwj00UbzJEmY8sQoAfzHZkxRhqSf9Zc89tmZrUU5ehsmzBHXHtIUAtxo5XiNrYpTSwjNfrniV5M6JqfGBmOIWEvNRQOHkNkK5QIUSBMzi5cBopIUlRXx/ag7tx6dvF1jDNC7ZetVpyOyFf98lUkrkuDfwB2GeSEvbPgIAGLqkpF7BsEYAuEwrWRFE9SzJrejpAz2bbZdmC849mW1kL+Yufw+YQwcKEBFJx0FPjN1CQdSHBKZrxlqVbcj5buepYc+MKYC4S8wizjCbSix/+ONP6W7i5w5BR6B897C7fnDx16BTjc8Acnm8msoah+82s0eXsO1wTujaaotgvD+IiZYxd+3A5ebPtG9WjPpgu3Lb4lTeND8N9adSThISy/r5SAhAbGnD3n32RNvRflH3SQYATDzi9vw48BX7fDVRG7Ud2ZGjI/QzsxqkLpnuWtfI8syKl7no4G2FV9wUttmMxDaXLtpjVcbtmfGVB99DqZPhT5zm5rEKxPYfcGy+Mi7XzPUfrr7vGoOEA+SVng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(13003099007)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DJPJWn7fwCRNXz1awc2NMJKDWAyvPDs8Muc54qGTaAOg0xo2D+lXcTqU9xLqSdBZtFIEhqVWq7wiqZM/aR6eLGqUa/fyO0jh6h0ctGsS1PL5Wuvsfocq0uB9jPh1awNGBleVUdyCOWflbdw/i8BpO0PVEFCHunqedyd54e6y5f+idF155ATZ2oz+Kn/tb/htJIe4oTZZs1B3tSAXFAF5W5ekg+pr0/A9NFhYA9w90s2hEi8Kl+sOfJZqpDNEwXPqExVWH2x8U7Gsc7K/RsYftacAXHIU6xe0abvEEXutmy6+4JVnntm9XnX4AcX4JBBgHFn4Z5lfDOdzZFiDJiTaVNfO0DoWbTP9kApAV4BmIGwOJktPherDCT+P+TPHiuuPaWfjsURU+m7/mJZai6pGhFJUqcwVdlu/GPVKC74clbMlPq2Ya7pUegIdyoa/Fo8O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:33:56.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 999eb8d1-db5b-42d6-14a2-08df14af8f75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761

From: Colin Huang <u8813345@gmail.com>

Add a PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/hwmon/index.rst    |  1 +
 Documentation/hwmon/tda38740.rst | 65 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig      |  9 ++++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/tda38740.c   | 64 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 140 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f07977a20271..aeff87b3d46d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -265,6 +265,7 @@ Hardware Monitoring Kernel Drivers
    sy7636a-hwmon
    tc654
    tc74
+   tda38740
    thmc50
    tmp102
    tmp103
diff --git a/Documentation/hwmon/tda38740.rst b/Documentation/hwmon/tda38740.rst
new file mode 100644
index 000000000000..55ce12f14914
--- /dev/null
+++ b/Documentation/hwmon/tda38740.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================================
+Kernel driver tda38740
+====================================
+
+Supported chips:
+  * Infineon TDA38740
+  * Infineon TDA38725
+
+    Prefix: 'tda38740'
+
+    Addresses scanned: -
+
+    Datasheet:
+      https://www.infineon.com/row/public/documents/24/49/infineon-tda38740-tda38725-datasheet-en.pdf
+
+Author: Colin Huang <u8813345@gmail.com>
+
+Description
+-----------
+
+The TDA38740 and TDA38725 are single-output synchronous buck regulators with a
+PMBus interface. They expose basic voltage, current, power and temperature
+telemetry through the standard PMBus hwmon interfaces.
+
+Sysfs entries
+-------------
+
+======================= =======================================================
+curr1_alarm		Input current alarm
+curr1_input		Measured input current
+curr1_label		"iin"
+
+curr2_crit		Critical maximum output current
+curr2_crit_alarm	Output current critical high alarm
+curr2_input		Measured output current
+curr2_label		"iout"
+
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+in1_input		Measured input voltage
+in1_label		"vin"
+
+in2_crit		Critical maximum output voltage
+in2_crit_alarm		Output voltage critical high alarm
+in2_input		Measured output voltage
+in2_label		"vout"
+in2_lcrit		Critical minimum output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+
+power1_alarm		Input power alarm
+power1_input		Measured input power
+power1_label		"pin"
+
+power2_input		Measured output power
+power2_label		"pout"
+
+temp1_crit		Critical high temperature
+temp1_crit_alarm	Chip temperature critical high alarm
+temp1_input		Measured temperature
+temp1_max		Maximum temperature
+temp1_max_alarm		Chip temperature high alarm
+======================= =======================================================
+
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index bcfdc4ce4c10..e4ca80dd0574 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
 	  If you say yes here you get regulator support for Infineon
 	  TDA38640 as regulator.
 
+config SENSORS_TDA38740
+	tristate "Infineon TDA38725/TDA38740"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  TDA38725 and TDA38740.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called tda38740.
+
 config SENSORS_TPS25990
 	tristate "TI TPS25990"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index e288fe72a437..eb06d47816fd 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
 obj-$(CONFIG_SENSORS_SQ24860)	+= sq24860.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
+obj-$(CONFIG_SENSORS_TDA38740)	+= tda38740.o
 obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda38740.c
new file mode 100644
index 000000000000..1b981c768645
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon TDA38725/TDA38740
+ *
+ * Copyright (c) 2023 9elements GmbH
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info tda38740_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_IIN
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
+};
+
+static int tda38740_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &tda38740_info);
+}
+
+static const struct i2c_device_id tda38740_id[] = {
+	{ .name = "tda38725"},
+	{ .name = "tda38740"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tda38740_id);
+
+static const struct of_device_id __maybe_unused tda38740_of_match[] = {
+	{ .compatible = "infineon,tda38725"},
+	{ .compatible = "infineon,tda38740"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, tda38740_of_match);
+
+static struct i2c_driver tda38740_driver = {
+	.driver = {
+		.name = "tda38740",
+		.of_match_table = of_match_ptr(tda38740_of_match),
+	},
+	.probe = tda38740_probe,
+	.id_table = tda38740_id,
+};
+
+module_i2c_driver(tda38740_driver);
+
+MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.34.1

