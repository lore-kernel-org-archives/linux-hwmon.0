Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C4B3EC813;
	Mon,  7 Sep 2026 03:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751718; cv=fail; b=tbTXC9Ow1CpCWi65dpKjZIXN8/w/WGDDugEZyhqECGIYYJeMBSGxMQWh1WAdRHBCRKvHErzlcCfLGBfoUoQuQ8+Id924FB1ihy0b9N3F9RlInG3C27Wx2s4gnyBNWxfcV/OUzBT9+xIPmIA7X3GqoHJQM5Q9yNxYZxJ0X1+WBiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751718; c=relaxed/simple;
	bh=JRxSHxy52HEBlzVIBeNsdZERiTWx6+DDHjuVKmtCq78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Rn+CoAmMQncrrTcmq7tS8UQMCbR/sxoPC4CxipkD2NRvIfYSeN8Nwmj68NT5II5rnxfLLYrryExFcaZZ374ObZp7SY5y3EaRO3k6J/wMRk3iXwp45X4e17WtGl12un1WSy5rcRs3954GnSPvhCXsUwMnUaqgiPEL/YkrqzO/hqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AyYstI2g; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AyYstI2g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeEKn7YYywcvDfhUawa/p5tBxch47PEfW7EwzEMExR5BcU6riOMybTfF1wh3mL216EToyX4ALl8OBBBBSD7sojl/DmxbBJlM8Jhbs+mB+z8SRwUUFw6BKEwYm4pgaVBl9eCL+cWbFkJqSbo/K7w+8P4uP+B4aMpQsCJ8vdENjn1AOZj6gwKmUjWrCEx8kePmEi9NHJe2Rp5stnWg6J3P2oochprsBGng0SUVgFx7uxiG5D73UFUc5Et7lKPV8FlqwsALEg/FVv0gFl+44RUODEsh2BYvUqUCkE9hyvJbOc84weV3JhV5HHsW9iH9LQ+FqqVJ4VGQGG6ccoie4qQ+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3u+UkgV7Ej6QEkAcK0HXDcbH7FphTpnUmOpVn7ZfWzk=;
 b=DoRDObTIPzytsb4deSdkZlsLz9woKouZhnl7Cxz59UWWbx76nMf5Fy70vEpt8liKu+y8T39Qz3QP0RG0PA6boTiS4xHwiNdMoKx88iLwkfDD8odFVo49BvETSft4BgIAEaTevxuPL3bMxhT8gYfrHgBebWRladaaBfFHL8mbyIE4Ht1yqrxFWl02L9J3Q8Lr8szmeN6Zd99tM+aPZXbuOFZ5dr20zOUa9MKpNc4pP7DoWP7Zh+IoqFvoBNXg8b+f9OZGVYmubMefUiJZgYnTtZGuGBY8SqjUlgmi1/RXYuqjH05u74/uyhfUzhbNSTK4DuCuqfF71e8hT2lOG96RLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3u+UkgV7Ej6QEkAcK0HXDcbH7FphTpnUmOpVn7ZfWzk=;
 b=AyYstI2gOjETlhVJNxvyrDJnCrWsC86H/DkTLvTcAC7uapM/f+zIizB00WFPVfPNjdQkcjEdvyohPTtt0CWJucj56PFOSwe7tpSPkVOa3MMBqcQPhNG393lvSri3GKDLqZWDU6/PIOCpj5+bOGvRkNIpFw9GAU8l7rZCEnume4k=
Received: from BY5PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:1d0::22)
 by CY8PR12MB7707.namprd12.prod.outlook.com (2603:10b6:930:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:28:31 +0000
Received: from SJ1PEPF000037AB.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::87) by BY5PR04CA0012.outlook.office365.com
 (2603:10b6:a03:1d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037AB.mail.protection.outlook.com (10.167.244.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:28:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 22:28:29 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 22:28:29 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 6 Sep 2026 22:28:27 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Mon, 7 Sep 2026 11:28:04 +0800
Subject: [PATCH 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260907-add-tda38740-and-tda38725-v1-2-e2db1b2566b1@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com>
In-Reply-To: <20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788751696; l=4508;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=ZpZFnDSSwc2CKmHEDPByPnMVFwqtnBl7P89a2vgAGeU=;
 b=ImpqUpiPB1HrISGAuVzobFjF1YPsq0nTvPeWRs+t//b2+UMskBHWM+dWcNZMNw8/1FMhII49I
 t+KtnyMW850BeAYs8A2UKgjgpXhfOAJsMWukanYm95ZjFl3Sn4+Xgnq
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AB:EE_|CY8PR12MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 38982570-150d-435c-5634-08df0c9016da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	weggUmNSQQRVkHqFXZn7Dagklily+Pp47GQutlYquSrH8mJfHbmJw3DdMu4mCsC4/RVYKWB0dVnCvAILK46EFBTvzvq3eCzvVV2wb/RDoBjkO5iyUk4ZK6T4HF2vizUZyHBdVmMAMa9b/N4pIldf9gCg6BcssT0gOvZyxJIZTVjoUhQO8aQoo6Ya75ukRrhQeu4F60UvFOVQnTrqusdQcQWl6RNnmZv9ToROp1y/zlKyke/Cm67AagR4zzwq0G/2ph96BqhDkhUh9X4SBjOz3wiCl+AclEAZPP1pEzi9X4k5p5KUvnKDSA388keFNwEMF8e4e0mqC/Al1NdRl9/n5G1l3eN2hvH7S388Y+C0L+QcPAUldYr9B+4nLnNd2gcntTuf7jw8k+9DJ1uXAFrvA8mA04SLFWJa7O4hcnXoWvKNGIwDv+n3S0ZSwYTzgqsVk1aleXp6EGrjJ7vowwOFGGCrlc5/7ge6aRjcjQefpDiyjshDdoJuqGBd8WVRX+/Zic6pPwQxIUYVnriYQ0BV+9sL4tpr7wO62lFcxY8lIzCZX5y1XOQYpa9CHcoQytK5BIDTYfKNm6gqQouMHmkl7HPwyBvFn87FhsETb08P2fZTio+qBQ7tXwpHq2tckErL4DB4yw7p5XfORs132kLpzEYwddCBMT+tSwqRxIEjfyCbIf8EkUsBWP9Av3ZjRU62tL3vgmEDgDFu7nrqwnT2RQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CMP9mMn3dRpSZs5lvUdQNPQ2wxl277BeVziwrDd7+8gr3vM/uQ0nBoAsLhrjjOEgaVqIxFiZNUFIdrCkrkRunakAYMH+si3KGEP1uc9UmC6TuRJKCMVPQDMcYlIQIS0G1ZAE9Iuv+lM4ejyoHE1P5sg9N4OtDE0uY7oFXY5eAEzspJxuJqR86ue3gHUJYQkVfYIR66RWICPmSTC7/FmQaRePhNFSASgsY2yS1FCld1Ih5y8Myq29IkERem42uvEIJya7pvgGlazBiFPZUU2vxjPbuzybT5sDFgyFb3KLr5oY1+jPyLsTJyUtbEVcoNKNnFWeL9x2ubtB2zZwOOPoaEqQ2Tcl2qAelViEl59eRhV06hjIBrPB1bxzYQbuzF78bRssb7v8OIT0+5P27qH+s3ba+DRHDpM3RT74T0qPBmPj+aJ7NoXIxj6ptEmT/flW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:28:30.6844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38982570-150d-435c-5634-08df0c9016da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7707

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
index 000000000000..4217a5a9ee66
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
+	{"tda38725"},
+	{"tda38740"},
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

