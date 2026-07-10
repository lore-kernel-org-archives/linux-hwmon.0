Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE16C4192F0;
	Fri, 10 Jul 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682237; cv=fail; b=PWVuMQBK/WgWZWWrGDUeVI8xN5c0IXmwm0sdIU53KKW8/6c7v0O2on/csKt+9UuZVUjeuIcmjtR3BjZbJcX/g9wUJXEAGAt9sUj7fSgKmyKTt+NgynDGN4U/R4BknbMuJhzj9xHRYq3p/8f+uciyOuBXQvsCitDywU6o+kfd0j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682237; c=relaxed/simple;
	bh=bKu1AEHITsLf+cxaurmSqg7gfN13lxL4aZc6lfGz514=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bm4M8yikn65aLfzIqaPhdEb3lyhGo6E5iTf91/Qnmn54LfBqxUbL+Y9Xrcf4Q0yjw744JMsN+E1dkrFx4lV0w7v2fVXPuDatiZXrYZfUu56CGoziYlA1Qkelm9YUOo9Dd8rVW5nXd4yBBaDdNYxDyJQUVJ2QtARNTA1yMv2P2As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5YGuuMkx; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5YGuuMkx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=df4x0Zyr+vYOu0kLy4fhNpA33vy5ALAqA2eD0YSZN6I1gylf6VUjMjnYiWBURJZiRlgjBmmq47OjlxK8wK6V93xcHVa6bE5jm69NeQ9Ggxvri1Z3V4eAM6fI08gmlF8KUm/wqwssJBBqJOXfrjUumQ3LKy/KnsLOx2Mv5wihdVXPemNZ0l708BoaBTZonI7ej0NUuvYCtbO9z9AQTyacl6FfluSevp8ynMVbbmDOE8B0FY91HEDwuo7IS5qn+udDoSYnzORTxvE9SbRnwVZvh2BN7aIYMtB73e5TrRTIGVFt8LOhDa0uUmyxZRtwbE4I6vMmhzwQBU2e9C6u4hqv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC9NSvg4bLJSVzUY4H8AC0R8RO7Cwo+mzvnyWPfFT1M=;
 b=awWHfh01mxRA8O3yrnpGJ+QK3MLYByP63FCONY/tNMcDG1eIlSvmNT8AxGUH8TyeUN+UnO0w+nvowsnJfns4vqKrdCz4HmXHp0yfAnl23kjHDgOlO3EzVrARMRFTn63dYMEBt7NjtTsiqmhdlymqphL0h4eDIOdO1FiL/J8NXEVvkK4of4V9gRiM8osT8tgCclM7xX3XK5th9lPK6yWm4iewfWvOHUU4abiYX/ERShP/S9+danwLmqa/9bBfV7jt++yNkXkCOX6JKsGAtCXI/xUhDLdevsvk0wksrWWPPrm4UFkA/eNW0X1frL0Ar1H8IEhNgpDGL4zh6B1qXkMimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC9NSvg4bLJSVzUY4H8AC0R8RO7Cwo+mzvnyWPfFT1M=;
 b=5YGuuMkxsPENyMGtbZPb6UAl9v3uss2t3XXLZEW4iWZH13FaIyUbXlPaYIF/DTJehYzLqcJbxqWybeTW1MSCHwA5n9WtF5NF1vPl6bwZ5UMTIVDEUFkQLRANy7rPT06v2z3TWVFJuAjrUvIxvvqCcwJbgFIgnyGu8Iit+NHxhdE=
Received: from DS7PR03CA0105.namprd03.prod.outlook.com (2603:10b6:5:3b7::20)
 by DS2PR12MB9663.namprd12.prod.outlook.com (2603:10b6:8:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 11:17:07 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::90) by DS7PR03CA0105.outlook.office365.com
 (2603:10b6:5:3b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 11:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:07 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:03 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 1/8] hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc
Date: Fri, 10 Jul 2026 16:46:35 +0530
Message-ID: <20260710111642.850022-2-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710111642.850022-1-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DS2PR12MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: aec6c16d-5192-4dbb-f5e7-08dede74c747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|6133799003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CUvwziXWMhJJ7PBhMVWea4e/Th5QMrrvMnhNSuvtAksYjUTrV6/RCQYpM5Ik36mt2PX5YoeHJimWP28eH5rmlpveRMD8oM0fHCUFBn2Hc0fvcSrr+/T7zt59K8H/vLYGkTBieI/+SX0oIrunyGBjz9/zJVUNudQBzQnW4oElHFa9bCWgcSJV+WTd2id0+8HdcgY6nG0M5xUCEr8vQZscE21kzANJ6huLK+RmaSrP9dWJBsnKhbvB6cfr7j1kuXW/56s/Sica83vIOBi0lofQJ5MAwds2i/HApqqASwaMaylmD/mGhiyrdLX/a95sjpf6HNu0gM1LA5blGQGIaDCiUYYZ00NXwzDuH2eZtGn3HRjigWA0c9Ov6tppciWvNAgWGCT3nSFLTceEc4NQoKI7a/LNOWuIeX9N6n8NljEVBMHCg76uXk+Fe8i1esawZiYjgbJ8w4uAcyFcE+FdioeL2cG9udBcvf7GNspjxIwgc0y8V0pxzrcSFBq1dZgAWIoe8X0+f3CjNcGCWrWtnWoY5CqqAddZisS3dQHtxZixLi40kxADPItnLIwiZLt84Gq8rbIcw2lBg7BnS6KfwRdgw1QpcwXZ+1Uu0Yn1L6jbEN7NdBIvIQZi2Uzw73rhYA51XzljgjirL+FD1Me+u+6nkYmlFSY/H6137NG8x6PAB49lXC7nu+1RgIzRN9GPtK8hsahLZE8paogiWNDHVMhUtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(6133799003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N6cgmC0MEZzojkjkHyYXtugmRGYUN3jXzyDO7tc0S67dKWzq5dR5H7C0l1zbpnOAbsT2xx1yrbMgsanBYpLnnl7cbHuikCSj1usX+OpXL6L9ML+a/TBUQiUW0F//Fv+xkerlsGMb/+UkL8M1+Z8NYK308fDmOrG25zllj+B0Afwf6R//osFF9Hrrd9x6mjaGKRDfWUKY7+cWHgKWS/A5jiPtaXS71FTEeFqNMPCc/Ktb8XRFw8+pd7f3LObT8vtnSJpMxjCYOkx3Wn9nyrssVOUSOek3O1wRfA0AKiCuPeyxo6NULx0ZVHEd++kPS2VbavAO8YskHhdhXBYw7C9RFM4MReANrdpoYHrRHQ2rE/UOjlBVUfd7FQQMkVW8p4+jW8FwRI2EfwmFjOPIIi7vF0cWjYU8Ua4LHz7pgucXys5BI5flz8hCrvEOcoT08xvZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:07.3331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec6c16d-5192-4dbb-f5e7-08dede74c747
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9663

From: Prathima <Prathima.Lk@amd.com>

Move SBTSI(Side-Band Temperature Sensor Interface) core functionality out
of the hwmon-only path and into drivers/misc/amd-sbi so it can be reused
by non-hwmon consumers.

I2C probe parsing is moved from drivers/hwmon/sbtsi_temp.c
into drivers/misc/amd-sbi/tsi.c under CONFIG_AMD_SBTSI. The core driver
stores struct sbtsi_data on the bus device and registers an auxiliary
device amd-sbtsi.temp-sensor.<addr> per target.
The current hwmon temp sensor will now require the CONFIG_AMD_SBTSI
configuration as a new dependency.

This split prepares the driver for additional interfaces while keeping
hwmon support in hwmon subsystem on top of common SBTSI core logic.

Add platform dependencies to clarify this driver is intended to run on
the BMC and not on the managed node.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v3:
- Revised the comment to clarify the client address in a multi-socket system.
- Enhanced the commit message for better clarity on the changes.
- Reverted to using "depends on" instead of "select" to prevent bypassing dependencies.

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
 drivers/misc/amd-sbi/tsi.c    | 135 ++++++++++++++++++++++++++++++++++
 include/linux/misc/tsi.h      |  34 +++++++++
 6 files changed, 199 insertions(+), 59 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi.c
 create mode 100644 include/linux/misc/tsi.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2bfbcc033d59..2b4342abc0a7 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1976,7 +1976,7 @@ config SENSORS_SL28CPLD
 
 config SENSORS_SBTSI
 	tristate "Emulated SB-TSI temperature sensor"
-	depends on I2C
+	depends on AMD_SBTSI
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
index 000000000000..67d08df28429
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -0,0 +1,135 @@
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
+	/* In a multi-socket system, devices that are otherwise identical do not
+	 * share the same static address; each instance resides at a unique I2C
+	 * client address on the same or different bus. Use the I2C client
+	 * address as the auxiliary device instance ID to ensure each socket
+	 * receives a distinct auxiliary device name.
+	 */
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

