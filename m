Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C053B71B4;
	Mon, 22 Jun 2026 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136739; cv=fail; b=RI3qKvjzR3Eqd3qwndZcngf5AJQv8yXE1AEyrREJQF2bTGIrSad9R8fQsqRaednQTJf/S2R7ZfhNTXNvxODWlUauTFG3tdzjEXsBLnHwaCaXdq8bAQ6htsAQDEOPccN4KMIezDCcuDd0opefwmtqHBlpkzuG2abE3PnnYyTHGRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136739; c=relaxed/simple;
	bh=+oMvg2s2QmJYo//9QZWWAfzKJLhhnMJzfDRnwlOfruk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhH/AoSb6Vf2Kx2J8Vpg2lrZBJtLCcu/LEisnJhRFu+kF9JAeTen95DfOLhYMpKwIi9UG3PTq/xpkF10a4kYgm0B8hVNFHAMsSxheJQg1jMGkf58oC9zL9VaueRoCvyH+JSwW5t3dCS9qL4YnvB6m7w5yhtw14gv8iAS8WpMeVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bZPxOOr3; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bZPxOOr3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JP+Z3QGky3Gyx0c/+38u/LZZVLUPEpc246LNCZfzLjySXwkcuylygDGpXkdAux0r1TFH6VItIx6Wtbbsh55HLUqMbDw4pubtPsfnin+8FaWTZ9348lqH0La7jZz0+o8tmOYdAlB4rFHZLLlyghzww2zZQCkg5UaG+HLdzR6HzZy1CUX7NrPrK3eOka4uNClUYphDqG/WJZr/G8q9g8pgwEpMaketecWTJcep3hftvqOQI7OZ5nGA9ujVcX6XFlwsENCsEMa6w97MyNzrYCC1sZRKkjoNKDFDqYwjwMpbocDc8AhWqUxs1C2mZCEWOxgy/7sChgsull/JsDj6KuRhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp2GAyOgCDUcYJ6yIyHCt2G9er76lPN+188NNWd81Cc=;
 b=HOfMzHYFKdkptrre5deQzduspMIbXu0Zvg8/dq6NxrfhdRUFfO5NvO5E1ipKpBaMd/syUwnU8b035WJDjop2zWQoYMcw8gxvRfc6iT77QBFiS+XJUN3G4rDvvCgRTPiNmV0tmFqMS3EOe4ZGxiCsaOD4s6QHXXuFLskHRXGUD2uAxwj//KQTr0PITzmjpz8QC+ww8GpeTq/huyjn9LjrmLC2+XFvuxqt4hdTtm0gdgu1m7SAmC63mKfHwtWT2Dg3boN7sh/jnkINLMgUE9kLA9BLNykIG1gW7JumMcnCS02/hivfLhvU2pIYSU1pgA7BnLt3ERcz9YIQQ3PLGSaXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sp2GAyOgCDUcYJ6yIyHCt2G9er76lPN+188NNWd81Cc=;
 b=bZPxOOr3tFjRJlvSaJ4c8FIh5xlSP6PNl5FXqvsr1C0dilTTFHt85U5s8Nds+FJgPypHzgjS2IBGx4ZJqb/3YZn6VVTURVOoaDYI/D5sC7PqcOaagEJySU5NTXTnj3CH8AQwa1fmpWE47vgpeZWczydAi+ZKRi8xUVe9X8gpyuI=
Received: from SJ0PR03CA0111.namprd03.prod.outlook.com (2603:10b6:a03:333::26)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 13:58:48 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::16) by SJ0PR03CA0111.outlook.office365.com
 (2603:10b6:a03:333::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 22 Jun 2026 13:58:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:58:47 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:58:43 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 1/8] hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc
Date: Mon, 22 Jun 2026 19:28:14 +0530
Message-ID: <20260622135821.2190260-2-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|SN7PR12MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2d75bf-13fe-438b-2493-08ded0666197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gKc8U+8y7X4Zs4X6+yMvyOPMP0AJxZcB4ksF9bkoAyWPTUOmeRIebOU3sonCuVMu3aITq9eIu1FmFVIVXhTYT6RR05j+c9zPjRhkfSGVN4aIrhKg1Q8NtqdlrdCZqoCvwOvSRJIPb9SIREH0vS+lpmKCfEtMMlaWcXtRYsCXqsHouX2D6JpxpeBMukiPzs0nwgG7DDGj8SUN8qg3uozmaWV58aKQUGkyaYg6OTxOI1ULD3FbJIfXYD6SkQRRATo1hKYlN+0u229tNXOpTI0dZuWrrB12Q2B+iGs5+G3SvWdsgwVq0J3ERE6QFLhaQvOahBskIYbyZcQVmev7zfnwt6caN5ZAOW1EVTygaQGRj30WX3eL6JYg1xlLsEqzDWT0HcTKmyrnkWQVD1n3008oxRDRutZh7j36VP5IsygpsqiJrcmsy6TuT6X8zFrQDA1FfU4xMS8AmBJZm9SOfaelnuG5ytiEa6l6wrhw9JYK6g8IFWKnXTWryOOICcRsQ4NRjr8og4/gMQtkA/poWlEFK/P9fq6fTyhD4YQAlRw1olSlxBRG56VMpAY6SxXivPoHts1XYX0kVW4Cql3/2Cx+s3Y0RdUjwlz9NGDT8L6eHdf3YwI25FtAcjjw8+68Z1RZNN0Mcs55ULajSOtq0brrW33sL4+uOiYhXWrog6Aw3eJilD3B/WvhMXEwSwgp2P8zsKRUkqv7VZSPMcw9DCBOTQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uh0KqKjL0ZSAyVcgKemZpCWNu5J6Wgly8A5wXhlYn0x5AXdt6i0nVmbS/E0WC8aBEONk+ytOPHwF1ei6W6RI2wXSFaO8EK7R2zq2ItiYbkbQq3CbYurla1Yubf87UKVGhF9pk/+W9iRUZaxlJOBjtd9VCbVAwpBNmfYJHkiNdNCAf3ZGV7yZOnWH+jXWvUdiJ5c7C4yySbnKkum7CcVhay7/klsxWPUd9PBIJxXNkcbzRDKNXlZHkQl8NC9qJfZZHAacYABi9/r0DQTeUHarMVmL1Bd4k5azJCTzcjLHDqTBBwKEAinzWcqkrcXVGbjxqcuDxyEEfz4VLFCCembhdNhAOAsRjwtTgZU8tMwfat1skn4chRSjWlJq8SkdQxk9naKqpqwNWb/Fq74xr5F81IX0dbMjfYCJnVek9puMYQMV6rpet2MyhlT88wkpJ83+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:58:47.4370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2d75bf-13fe-438b-2493-08ded0666197
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322

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
Changes since v2:
- Change hwmon config symbol dependency, "depends on" to "select"
  as "depends on" could silently disable the hwmon driver
 
Changes since v1:
- Use auxiliary device to probe hwmon sensor instead of moving
  the hwmon functionality to misc subsystem. This change is as
  per feedback.

 drivers/hwmon/Kconfig         |   2 +-
 drivers/hwmon/sbtsi_temp.c    |  71 ++++--------------
 drivers/misc/amd-sbi/Kconfig  |  13 ++++
 drivers/misc/amd-sbi/Makefile |   3 +
 drivers/misc/amd-sbi/tsi.c    | 134 ++++++++++++++++++++++++++++++++++
 include/linux/misc/tsi.h      |  34 +++++++++
 6 files changed, 198 insertions(+), 59 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi.c
 create mode 100644 include/linux/misc/tsi.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e4c4f2b09732..8f204cf49b6e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1963,7 +1963,7 @@ config SENSORS_SL28CPLD
 
 config SENSORS_SBTSI
 	tristate "Emulated SB-TSI temperature sensor"
-	depends on I2C
+	select AMD_SBTSI
 	help
 	  If you say yes here you get support for emulated temperature
 	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index c28f8625cd3a..28258bf49922 100644
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
-	{ .name = "sbtsi" },
+static const struct auxiliary_device_id sbtsi_id[] = {
+	{ .name = AMD_SBTSI_ADEV "." AMD_SBTSI_AUX_HWMON },
 	{ }
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
index 000000000000..dfdd730b906a
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -0,0 +1,134 @@
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
+	/*
+	 * In a multi-socket system, otherwise identical devices do not
+	 * share the same static address; each instance has its own address,
+	 * which must be supplied via the device tree (DTS).
+	 */
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
+	{ .name = "sbtsi" },
+	{ }
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
index 000000000000..befdc2d14160
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
+#ifndef _LINUX_MISC_TSI_H_
+#define _LINUX_MISC_TSI_H_
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
+#endif /* _LINUX_MISC_TSI_H_ */
-- 
2.34.1

