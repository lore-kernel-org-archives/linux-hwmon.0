Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A0640B0E6;
	Mon,  7 Sep 2026 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763971; cv=fail; b=q2q62QVUhfry2/G+AknG0wAd4BBjb5l6FM8ihHcUZbfJD7DYobsrNJjWkk/+luXwMZIEs+t66ZYtDRjfYGqbuSZCB/h7DcXy4dWigrNVBy8r14q/vC+oRK+vrn8xTfDzSbmkvrDhGX+GeJvr++w+fRqNHGHakBSBoX+dNK2s5T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763971; c=relaxed/simple;
	bh=JgfVIyl7mjqngBwIENiuTuEYh/MHvv7+etnYgqYRado=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TwVWHhhgFAzTaZ+2Hy/inCTK19EWmAfnPocLjqexc5emcVNuWE5NnHGsmB6+jB52cMvDMRybArXs4WnTqiSe3yTcXu0cM61r3d1pr9j7lxGwgggEzGOt9JDQPNFdBSvkWpl21Ps0Bv9H3d4A1K9VDtg55u4rxEG7nIdwU+6K244=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GdxDp943; arc=fail smtp.client-ip=52.101.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GdxDp943"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s78g/66rTO/i6obNHdHqOWbA567HM/HYK2VKbv9VDzt57HuDZ/hIHjdzDEN8sTzbkdAXW8JDmf97+twgMOkQQdN/fqX39ERN0OL00SKvevMc2EcxGQF2jN8tnHYlzNidcyMPQUlr7wN4ViXsHZ9TXsC/gLt1TbSkfJ1+HYi4+ACSRuWhxg6BGTRPislA8Aer/jxfat+TCz+s9IWEmeT3ivJrI50vZPhnsHOeEO11/ud4BJs9accK+xxG1XMKkZLM255v6x4YofvEDAo6xsypIyqcTd6psHDwHRUR2h2AAxolZlbRbuekP426ZmcN/R+L4ZY75Ql72EgVNAlUBEwHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0nsuFNYiUnHFm8QCGx6itYrVSd2S52ssyx2VyBB4hA=;
 b=d7kiIDLZw7EP5TKfGvJLtY/25wOvrPi3/UZco0FjvHBehRY2EyHTlSsYvkni9LsUYX07g2U0MU1rOesU2hXtfvrMnofdwSsbw57HEMYL2cZKFAZF5ORd+ZKFMOqYKHpTP3msy67Ewx9lFtKjtqFBBEknGYF3s0pDF58Xou5QwSaZT/UTvkTsFwXOqFwEu2DgLdhn646uOFKkOHkKUOI8hzSqDFO1gWFxW8K+vPy3E0KLQ4RqrxnhVsDS49hMspDreNDMiIZsIMII+9xaD4LyyFoAoBFpnoxnQjnIu9DMUuCHDPJeOBnOIYy3DjJUUig9hyt6xlQVYt/apA5S74nfpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0nsuFNYiUnHFm8QCGx6itYrVSd2S52ssyx2VyBB4hA=;
 b=GdxDp943ogcOlD0OhSvAZ5RF77laKsWLTbdvDujYoMmsxhchLUVZjivYTaXxjTApvwCv6B2DS2D3IlzWn2FYi7QtseuDgmzJY6nvYhl37cLZ/CEmHz/Re1TAfrrgWZQXB1sA3SAMnn8NcE9HCKKB1ar2BQxR3Zq9n1DLEMn90Zs=
Received: from BN9PR03CA0203.namprd03.prod.outlook.com (2603:10b6:408:f9::28)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 06:52:45 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::21) by BN9PR03CA0203.outlook.office365.com
 (2603:10b6:408:f9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 06:52:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 06:52:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 01:52:44 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 01:52:44 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 01:52:42 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Mon, 7 Sep 2026 14:52:30 +0800
Subject: [PATCH v2 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260907-add-tda38740-and-tda38725-v2-2-1d051d63aa01@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
In-Reply-To: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788763951; l=4526;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=FRHchz2P4X0jfKHjWfuTnDJE7rCtTwHQUBDDYQ6P3Yc=;
 b=hjxNFSShjjqDpFu+HKP3xTNV9elnUBH4bMPGyfbD8Gd/JRiDap6TVJvH6LaAJt7OneDLM4uS7
 6J8AFN2QYdDBPqBx4MS1aJSZyy2Hc6NPE9NiAwD+A+mClnfdeHkp4lB
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: d5381854-9821-4c10-2d81-08df0cac9ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	dg+N9MclQ9jk4FLLWtWs64ygOjukrIIbao8dAb3eRCagSN+CW/QOpTcUtfyXKpq6JTZfIh8/86PDH4mAgeVs/hFYO+CENk+rKHqPZ1ZIM5q5TcpTOMp1VqXhHw/+U3kPdpKg40pFJbmRtApNPIjvUOvzCcCsJbtepRY/RZgKZfzS6x1bNWQP9eRuprGZevo15XyKW4gtAPAu68w+Pb6Xh49BIZRcBYl5aVRUWQkB/svb7vocf0uGlVdRCBx0ZLTmIBHAfYDf58CIPcY4PUat84aU1x1T9nN2HEi0qzMznMjMYjNMj/5x2rx1H65YNUAGEMD0Hko/6oPwbTTbTo8bQhyXosieMFGY4Lj0VCAmDdKmuTAUfAte1GQDF3/ivFcmAbsLzcjxjd1TfzvyM0ztCxQm/FYlZCQJWcmOPWb9DDHEUWBkFP8sva8gYXubt5FalkkSs5OhVnOlsksv5i7DzLdjvH/ZiTOJNp6pwKSxx0MsCzaI/XKuocSAvSGyRJvpnUXGj0UHkrQjLYqDTu/h7Xec+z610wWqQofqGyNJf5kRRIZ17jKKAGBcTTbxcpWI57SFX07wEhQFTsVsROGfEjT/aQXBfMBPZd0ZKlwZE53pacyNC3wFgD1vMsnuhryZkM+sQ+7rJpSBbLJCvpApGhkjqpbS6F/ib9TmfhfRty+M/+nAWc+X2PPT3r3D74L+CvMbPWRjp9M9xT+65r6CrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PWub0N+2ENY84wl2KfXJDsu4fIjw5Go73CYDJXYCNeWeRnD1icMbHHDixITampd9gioYq3cmcJ81v5a+5++0olM/c5Cg7mG0gT7oVjWxu8vKcfI8PNQ70J6GIh+UIRHiV4aMpw4MYPh5lKakEljvJ2lr7PgfQBG178ZkEENFD4KPStsNOXIX2nh4A6cJmOlvQr6cog3LW3AD8awhx1n0HLUReXE1ZRcEMJzzXEAVvaA55x2W5Bo5HvIJ6PIepYcweLXdo4qfC2xPYCHL9URyeT/MmRNRT7YUkxX0LfEfpbbtM/FMWYUHmYKcDsQJ+d9YwLVnan/vxxC0YyrWSQeNARTkHZqXh+FmvJKvOQ41J5iqxMbM3TmxhkcoTAUaqlsMBDpkBYUYqBi4dundJY9VHKCDNGpip3JJZ+QS5uQTGxHSnHzGvbQmFpsPuKwAAdJW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 06:52:45.0319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5381854-9821-4c10-2d81-08df0cac9ef6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596

From: Colin Huang <u8813345@gmail.com>

Add a PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/tda38740.c | 98 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)

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
index 000000000000..4cf9a81b276c
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740.c
@@ -0,0 +1,98 @@
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
+struct tda38740_data {
+	struct pmbus_driver_info info;
+};
+
+/*
+ * TDA38725/TDA38740 only support Linear format for VOUT related commands,
+ * with exponents in the range of -8 to -12 (see datasheet VOUT_MODE
+ * description). Direct format is not supported by this device.
+ */
+static int tda38740_identify(struct i2c_client *client,
+			     struct pmbus_driver_info *info)
+{
+	int vout_mode;
+
+	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
+	if (vout_mode < 0 || vout_mode == 0xff)
+		return vout_mode < 0 ? vout_mode : -ENODEV;
+
+	if ((vout_mode >> 5) != 0)
+		return -ENODEV;
+
+	info->format[PSC_VOLTAGE_OUT] = linear;
+
+	return 0;
+}
+
+static struct pmbus_driver_info tda38740_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
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
+	.identify = tda38740_identify,
+};
+
+static int tda38740_probe(struct i2c_client *client)
+{
+	struct tda38740_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
+
+	return pmbus_do_probe(client, &data->info);
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
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tda38740_of_match);
+
+/* This is the driver that will be inserted */
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

