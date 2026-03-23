Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094C39902F;
	Mon, 23 Mar 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264147; cv=fail; b=GnWYjvzNhPke0yPlEIM5rCtu4BCkw40a2mVq84YabfUlPY/gFxK2sGjZ4ZsDSFP7NWEv5OS5tABBsZysgZlDwJQIhOY9F/TW75hlH4lhbndZKTJiK2m+yBB2PNH/S6ZIlgtyHMEsJLyIvP4MaJRJfAWL27dnTBjriJ8cTEhKkJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264147; c=relaxed/simple;
	bh=GsGBqP+ILO1mrt27TU5E3qMjDXeg2LRBasgVEHFENz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qei5dm7SQ1QYN5Dl3l7Vp4N8Q5Abh7Fwm+rWfVuMikPk6v/Vgqegk+6qkk98b8Kd/kl4iCStToLoUictia2wb6pm9CyQoLUUgGdq98mOTwaOEe2Rd2bKd/h0DZrXRsIOTN3LjKT9spoT8N1h48F8Xhmk7kFkwIxBnms9sYjDf7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zq33D95z; arc=fail smtp.client-ip=52.101.56.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zq33D95z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoN2wyiBpYZShswaaX3vQsMmMYd8D3ViNb12gLi6lC7MbQaorPO/9WcfAKDWbvYZPZNG/vfRPivbU95hsP3g28al0ZqFfTQD6ueUOh5U6AeR+Eg3UA8sKEkzH6dnGfUQxMx15di+L57IhxZlczyevpnDDKd6FGWwafMOlGcdzBalFVpiguyb+LzdOOwmdUaateaER1G7E5LkYY1Lr+OsKxekgyDrzIQXpkvW40gZy8+NJYR1uvIKN+OQDNSnHGd0mLQmBXrBNWmWsuqFpMCqLv4DGCJUZIpqvlafPqXA/HYtKDTQPeLLofYFpPtIeT3qRfbxmy8dT6SonYpCmWIJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftMTX7Tu2yaZn3VgneEeWCrE8vnN/2ePEUvI390eBNE=;
 b=DOkKgzKc+/Z9xiILuKdcu24ntNW1f/1j4deywz7k5voUPpOrqPFpcBs9TuZla97DFVvJGuub2/sQjeb2vEAd6y6Ki0zAcHKxl4qNsycP+TL2wY1d1Q7GPk1ugr75WNAK/TSyioJ6yL8x0U6WZHU9V3Q4j58nXS4mavCFVFE5dObl5HEN8aHpAMHNxtdHWUUaKhABhVz5CVHK5xSaBzOn2X8X+LCq5uHGAU9Ul2GSNpkZJ9q1xWVv8wn5M9O5U69k5FULlli15Gse/Eih+d7j152XHMTixPjnxtgtBHgAyyqshxlVULllMSeCuz18TZALvk0ND85dBYWBWx9EXM4+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftMTX7Tu2yaZn3VgneEeWCrE8vnN/2ePEUvI390eBNE=;
 b=zq33D95zW9AchB8rBE/+abEwsUVE4I0OWNlf8EG0iopdE4g3+V/7vGkCnKR7rwhNwnSqLxvc2/1Em5yWLJAA68pIpBnLNlvQzmsVxd7bFJ3QL4PWps35iHMW+BCXTX0HXjaGh0OoSq4PocmqiR9peYBejIQ7Cr/f0fnWeJcKx7Y=
Received: from BN0PR08CA0020.namprd08.prod.outlook.com (2603:10b6:408:142::8)
 by IA0PPF73BED5E32.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 23 Mar
 2026 11:08:52 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::ff) by BN0PR08CA0020.outlook.office365.com
 (2603:10b6:408:142::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:08:52 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 06:08:48 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<Prathima.Lk@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<Anand.Umarji@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <kunyi@google.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 3/6] misc: amd-sbi: Split SBTSI hwmon sensor handling into a separate entity
Date: Mon, 23 Mar 2026 16:38:08 +0530
Message-ID: <20260323110811.2898997-4-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|IA0PPF73BED5E32:EE_
X-MS-Office365-Filtering-Correlation-Id: e81e730e-eeef-46b1-91f5-08de88cc9148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NbQwRtQzhDBYKLaEM1CeXVyb1xGWg24WuvqtxXv1yS6DMWX/xBLayxb6qog51Tlww+I6rGZpb4VwVMQP771kuA12H445c18pHBdgVP63fxRaqj0Cz4jvxPQv6kOi81kCbgnxAI7fQc/O3DoTa1sAAaEuZD8q0S+AuC+crPuUUzrZFtcw+cxnXKzah5Syw3SOxkAMd8nn/t3RtHPjW178Dg9w8zwQwlxpY3e5eptFKGWWpTu0dPDf7O4z/Um8NrWXrINIsPqFPGH4xbq0kWHh7LPt9qwhbCjtZU9ddTgBWHENXPQ4R5BJmXwf73lIdoktXav4pGtYnMWyhXYYPK7QnOxDryKhLhfcnV/7yK9t4gqGgQEjimsoQ9JUOhTzJzH8U/GLM0c5qw3ykhx6Xl6hmp5WVpEu00KrlxY4ElZdxrhXtxags7KunmDqGUVtMH8d7czZ4a3ASySn0knNJ3PrAHIOlRYyJ+o1zzR0G+BEP1hl+iW8RfRRmO2L5W/GzHGNliJ8sBDi8UjvLk37WK1IfaFaFSeAPBMgyF4Sxp+JipqN7r6bUks0AIpMA3oyidDF7L5514Lr1z/DzKtdvL85/92GAvP01dbuG7tGIi0dG9PQsnMwZ+8oJU+muG+1SchUHXkzcuUrUwXX2YTiJyyu6v1rlVcriMAe/yvmargKwFjKhOe9Wiwf1cpStc7SNQf//mQZDmovKiKAZespJaeXmVXFIvzpHL5+jpAkV8l5uZCf0rq/85C+31QLtN+Ic6NTx0IPK+8zK+02fklCncgvUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bNBjKqM8QDMCltPYG5mLJd4g7gKYUjXIchra9kNAt3IxRPt2SXqu3E2WqQ1MyS7Nea2WMtLXGj6h/rO5Vmbms3XC6zeRH3n//4pPm2XnDJvyqZl1kvLIDxlEDBVP01/X+sFnFxXM7u7eZUoKl6O9kRORHWaTT1PQl6aSc0SFURf27DMAXDuKWT0X27ILgtTbHWHgB5clHmES0wDYdxe6Nx3Pw5+mc9c2IpoqEW8cAaDAG4ZW2N4C8Sy3upp5q0U+zoHI3nwKGXLUJYmeFAvbEjhVVPrshbopHYF7MaYOg3IzOkp1bYYL5Jvx/855EyDM66dh+i7LvAsYx509/tPqoUAh1fd5oMuYBkZo+VmUlCmLwco2/FBAzv1ZyLAn+u51ZVTaua5lbKbVeVlir9xLSThXIK/8oQv4Hd+T6MJ4Jm6QCBF3FE6IwRLCndTpCknN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:08:52.4920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e81e730e-eeef-46b1-91f5-08de88cc9148
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF73BED5E32

From: Prathima <Prathima.Lk@amd.com>

Separate SBTSI hwmon sensor handling from the core path to improve
code organization and maintainability.

This keeps core transport/register access independent while preserving
existing hwmon functionality through a dedicated hwmon component.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
 drivers/misc/amd-sbi/Kconfig                  |  12 +-
 drivers/misc/amd-sbi/Makefile                 |   2 +
 drivers/misc/amd-sbi/tsi-core.h               |  30 +++++
 drivers/misc/amd-sbi/{sbtsi.c => tsi-hwmon.c} | 120 ++++--------------
 drivers/misc/amd-sbi/tsi.c                    |  77 +++++++++++
 5 files changed, 142 insertions(+), 99 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.h
 rename drivers/misc/amd-sbi/{sbtsi.c => tsi-hwmon.c} (57%)
 create mode 100644 drivers/misc/amd-sbi/tsi.c

diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index 19a8d596e8f5..2710860a86c7 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -25,7 +25,6 @@ config SENSORS_SBTSI
 	tristate "Emulated SB-TSI temperature sensor"
 	depends on I2C
 	depends on ARM || ARM64 || COMPILE_TEST
-	depends on HWMON
 	help
 	  If you say yes here you get support for emulated temperature
 	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
@@ -33,3 +32,14 @@ config SENSORS_SBTSI
 
 	  This driver can also be built as a module. If so, the module will
 	  be called sbtsi.
+
+config AMD_SBTSI_HWMON
+	bool "SBTSI hardware monitoring for AMD platforms"
+	depends on SENSORS_SBTSI && HWMON
+	depends on !(SENSORS_SBTSI=y && HWMON=m)
+	default y
+	help
+	  This provides support for TSI device hardware monitoring.
+	  When enabled, a hwmon device is created for each socket to expose
+	  temperature monitoring data through the standard Linux
+	  hwmon interface.
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index f04273c0d3ad..a874136e438f 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -3,4 +3,6 @@ sbrmi-i2c-objs  		+= rmi-i2c.o rmi-core.o
 sbrmi-i2c-$(CONFIG_AMD_SBRMI_HWMON)	+= rmi-hwmon.o
 obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
 # SBTSI Configuration
+sbtsi-objs	+= tsi.o
+sbtsi-$(CONFIG_AMD_SBTSI_HWMON)	+= tsi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi.o
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
new file mode 100644
index 000000000000..e60cf25fda7a
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _TSI_CORE_H_
+#define _TSI_CORE_H_
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+/* Each client has this additional data */
+struct sbtsi_data {
+	struct i2c_client *client;
+	bool ext_range_mode;
+	bool read_order;
+};
+
+#ifdef CONFIG_AMD_SBTSI_HWMON
+int create_sbtsi_hwmon_sensor_device(struct device *dev, struct sbtsi_data *data);
+#else
+static inline int create_sbtsi_hwmon_sensor_device(struct device *dev, struct sbtsi_data *data)
+{
+	return 0;
+}
+#endif
+#endif /*_TSI_CORE_H_*/
diff --git a/drivers/misc/amd-sbi/sbtsi.c b/drivers/misc/amd-sbi/tsi-hwmon.c
similarity index 57%
rename from drivers/misc/amd-sbi/sbtsi.c
rename to drivers/misc/amd-sbi/tsi-hwmon.c
index e09b10c17771..efd450a85d34 100644
--- a/drivers/misc/amd-sbi/sbtsi.c
+++ b/drivers/misc/amd-sbi/tsi-hwmon.c
@@ -1,59 +1,31 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * sbtsi.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
- *                compliant AMD SoC temperature device.
+ * tsi-hwmon.c - hwmon sensor support for side band TSI
  *
  * Copyright (c) 2020, Google Inc.
  * Copyright (c) 2020, Kun Yi <kunyi@google.com>
  */
 
-#include <linux/err.h>
-#include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/hwmon.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/bitfield.h>
+#include "tsi-core.h"
 
 /*
  * SB-TSI registers only support SMBus byte data access. "_INT" registers are
  * the integer part of a temperature value or limit, and "_DEC" registers are
  * corresponding decimal parts.
  */
-#define SBTSI_REG_TEMP_INT		0x01 /* RO */
-#define SBTSI_REG_STATUS		0x02 /* RO */
-#define SBTSI_REG_CONFIG		0x03 /* RO */
-#define SBTSI_REG_TEMP_HIGH_INT		0x07 /* RW */
-#define SBTSI_REG_TEMP_LOW_INT		0x08 /* RW */
-#define SBTSI_REG_TEMP_DEC		0x10 /* RW */
-#define SBTSI_REG_TEMP_HIGH_DEC		0x13 /* RW */
-#define SBTSI_REG_TEMP_LOW_DEC		0x14 /* RW */
+#define SBTSI_REG_TEMP_INT             0x01 /* RO */
+#define SBTSI_REG_STATUS               0x02 /* RO */
+#define SBTSI_REG_TEMP_HIGH_INT                0x07 /* RW */
+#define SBTSI_REG_TEMP_LOW_INT         0x08 /* RW */
+#define SBTSI_REG_TEMP_DEC             0x10 /* RW */
+#define SBTSI_REG_TEMP_HIGH_DEC                0x13 /* RW */
+#define SBTSI_REG_TEMP_LOW_DEC         0x14 /* RW */
 
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
-#define SBTSI_TEMP_EXT_RANGE_ADJ	49000
-
-#define SBTSI_TEMP_MIN	0
-#define SBTSI_TEMP_MAX	255875
+#define SBTSI_TEMP_EXT_RANGE_ADJ       49000
 
-/* Each client has this additional data */
-struct sbtsi_data {
-	struct i2c_client *client;
-	bool ext_range_mode;
-	bool read_order;
-};
+#define SBTSI_TEMP_MIN 0
+#define SBTSI_TEMP_MAX 255875
 
 /*
  * From SB-TSI spec: CPU temperature readings and limit registers encode the
@@ -85,7 +57,7 @@ static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
 }
 
 static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
-		      u32 attr, int channel, long *val)
+		u32 attr, int channel, long *val)
 {
 	struct sbtsi_data *data = dev_get_drvdata(dev);
 	s32 temp_int, temp_dec;
@@ -112,12 +84,6 @@ static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
 		return -EINVAL;
 	}
 
-
-	if (temp_int < 0)
-		return temp_int;
-	if (temp_dec < 0)
-		return temp_dec;
-
 	*val = sbtsi_reg_to_mc(temp_int, temp_dec);
 	if (data->ext_range_mode)
 		*val -= SBTSI_TEMP_EXT_RANGE_ADJ;
@@ -126,7 +92,7 @@ static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
-		       u32 attr, int channel, long val)
+		u32 attr, int channel, long val)
 {
 	struct sbtsi_data *data = dev_get_drvdata(dev);
 	int reg_int, reg_dec, err;
@@ -154,12 +120,15 @@ static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
 	if (err)
 		return err;
 
-	return i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
+	err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
+	if (err)
+		return err;
+	return 0;
 }
 
 static umode_t sbtsi_is_visible(const void *data,
-				enum hwmon_sensor_types type,
-				u32 attr, int channel)
+		enum hwmon_sensor_types type,
+		u32 attr, int channel)
 {
 	switch (type) {
 	case hwmon_temp:
@@ -195,56 +164,11 @@ static const struct hwmon_chip_info sbtsi_chip_info = {
 	.info = sbtsi_info,
 };
 
-static int sbtsi_probe(struct i2c_client *client)
+int create_sbtsi_hwmon_sensor_device(struct device *dev, struct sbtsi_data *data)
 {
-	struct device *dev = &client->dev;
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
-
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-
-static const struct i2c_device_id sbtsi_id[] = {
-	{"sbtsi"},
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, sbtsi_id);
-
-static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
-	{
-		.compatible = "amd,sbtsi",
-	},
-	{ },
-};
-MODULE_DEVICE_TABLE(of, sbtsi_of_match);
-
-static struct i2c_driver sbtsi_driver = {
-	.driver = {
-		.name = "sbtsi",
-		.of_match_table = of_match_ptr(sbtsi_of_match),
-	},
-	.probe = sbtsi_probe,
-	.id_table = sbtsi_id,
-};
-
-module_i2c_driver(sbtsi_driver);
-
-MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
-MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
-MODULE_LICENSE("GPL");
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
new file mode 100644
index 000000000000..df754e60d84b
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * tsi.c - Side band TSI over I2C support for AMD out of band management.
+ *
+ * Copyright (c) 2020-2026, Google Inc.
+ * Copyright (c) 2020-2026, Kun Yi <kunyi@google.com>
+ */
+
+#include <linux/bitfield.h>
+#include "tsi-core.h"
+
+#define SBTSI_REG_CONFIG		0x03 /* RO */
+
+/*
+ * Bit for reporting value with temperature measurement range.
+ * bit == 0: Use default temperature range (0C to 255.875C).
+ * bit == 1: Use extended temperature range (-49C to +206.875C).
+ */
+#define SBTSI_CONFIG_EXT_RANGE_SHIFT   2
+
+/*
+ * ReadOrder bit specifies the reading order of integer and decimal part of
+ * CPU temperature for atomic reads. If bit == 0, reading integer part triggers
+ * latching of the decimal part, so integer part should be read first.
+ */
+
+#define SBTSI_CONFIG_READ_ORDER_SHIFT  5
+
+static int sbtsi_probe(struct i2c_client *client)
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
+	return create_sbtsi_hwmon_sensor_device(dev, data);
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
+		.name = "sbtsi",
+		.of_match_table = of_match_ptr(sbtsi_of_match),
+	},
+	.probe = sbtsi_probe,
+	.id_table = sbtsi_id,
+};
+
+module_i2c_driver(sbtsi_driver);
+
+MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
+MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
+MODULE_LICENSE("GPL");
-- 
2.34.1

