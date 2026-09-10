Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759131E82E;
	Thu, 10 Sep 2026 06:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021176; cv=fail; b=ErLPKxMjBSM0/EmhOQTpHZq6UrdSVcx1B9zGQdWZtW7Evm7Cq9Q0MI3cm4kDfuBV2Z/I21mwwj9Exl46ewdlboy5Se0lfT2ZaBfNR+yUhEkIZH1vKvf6FDdJBD+INkQ7ExKgfXhPRH9pSUrhDaZIxDpBII8vS0QeBiErt+5JQ3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021176; c=relaxed/simple;
	bh=UU4kGJdlqQz3Av9tJZPyXUZayP0nDr+Wqid/CzWqtAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FA7RTH/y6zMIyx8FF9zLQSDoCqTTF/WGe13N4HhgKSgIjqIo+hmwufNePhNvbp02qGxqPPhd1mkIxRdNxSsCdl0RH3sFnn0n11t4XzujDt0Yb6oG9oZuBrbx3zSeCz0iiY705NznMD2p8HhVI6h3DfQs4tBS1CnU3+UMzan0z4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AnloXddZ; arc=fail smtp.client-ip=52.101.56.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AnloXddZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpbGKwI/gbQVJdYNDNUix0e3C51V+kpGbcZxQk4akPDrLuC7vt2ct2vBZwkd8PJHVFhL7XUQjdUn8cS0JqQ/4c8OBNGEaePgGUENMVZVV4GmyE8BMSYWbyfO0XlpcrFPFyHt+6+MKwxNOdzu1Zh/twqhmdtw+KsUuUfjtY5X1FBD/XoLgOSGZAPnnevflvjn5+u1T/xSwNJuRn7nRcVeUosOQGpEOLYAkgw7HJhhfFA7KXJH6t9YKqSwQ0LOHCptbEdy8/XJ20cSaCSq/C5AmOkp/rVmvD2KnFLpHe+IJ9uilXyPOyAhhJ+wdIGh6ZDOS78mhvdry1aqZ/rK4dgzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y0NMEtxBmoJ6tC1bgq7cu3GpAcQHKWKfDPO01w4B8c=;
 b=NqXq6BgdAWY/vqDc/acPm032Hs9+2qTvJluRPSV3k4CFNWt2exjHzEUsvoeJ30LDvWcog+/gnedKtumERCwKK0b+LY9eeAu/Q7Uy8tTICgVmPPVJiIbPTbEkvdLE+pVqIFQxVNj1Yutdk5lnlID4ysSR0RKLs/vqVMnaXiIHLEwbamE18GA86SiAoosr6xOB8UHVa9//CxN4oKoaitHOPkoIDcF/QCNoxhQrqTHatZsJfW7j8OxnfMxKasJVnl7LeXyFGAyta/PPJlIQfMSvP8M8aNPE9zsjmUf81Ji3H0sUdAKKRo0iSX4yYNSXRToToOaseoTulPjj0vuChaYEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y0NMEtxBmoJ6tC1bgq7cu3GpAcQHKWKfDPO01w4B8c=;
 b=AnloXddZDKA1mzirO7O5jCnB4unbxsgVvykJbSL5qYNVb66T51zyGgdPeZfJ55xhWJkVFX+++lBMXmQGmEvWEaorCFH7G/N3viIGNQjHQBcYQ13T8DWKgMwyBNHsAJ/H4U65CXSBuB/k0Df0ea0D0U5csg6dlFQM7RQDh9cfARw=
Received: from BN9PR03CA0765.namprd03.prod.outlook.com (2603:10b6:408:13a::20)
 by SA1PR12MB6846.namprd12.prod.outlook.com (2603:10b6:806:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 06:19:16 +0000
Received: from BN1PEPF00018071.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::4e) by BN9PR03CA0765.outlook.office365.com
 (2603:10b6:408:13a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 06:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018071.mail.protection.outlook.com (10.167.245.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 06:19:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:19:15 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 01:19:13 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Thu, 10 Sep 2026 14:18:56 +0800
Subject: [PATCH v3 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-add-tda38740-and-tda38725-v3-2-3e87637da3d6@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
In-Reply-To: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021144; l=6027;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=tGmgNWPbrOgEwq/hyJSGK2A0E4LAtco3aimV9WfyijI=;
 b=YP//aZ5V0v1ME54b1Bmrv0b0E1iWmYtrKgLvGoUHEPpL7CmD/fn+CClwbheQJ5K81GlJKDNdv
 Z9bSHEG7CPqC4+EV038HZrWauSNTd7Ibbj6GFJPHeBdbfHOOc6qc87k
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018071:EE_|SA1PR12MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 058b9455-fc76-42db-aa69-08df0f0370cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dsh7lyMjBuQy+fIJ+A9y5aZetTgaBLyLIxiUVHz9xsFaqI6UwHaSBoS25f/Jfx/LYJ/BVltmb7VW8qel+X8Bz4glnfGp2tp2TjvUM1B9D5MTqrg2Ipke3nQOqoJJPQistFfTemZQ6gWY13vh7o6QlcuYzEIPh6u7b69Otz8VRI0LhzGq2/7qbxKHOip7Dp+/6F7iQlQkbtoBUj1iI34RL+2LBR5VEStC1Rx4lGskXymLb0IdNJ6hU5S8Ob1kHfjZ3zUO+iBoNgQF8xy1SlXasccMBb9I0WOO1D/Ffvnx5Z+UK9XubXX0sxN1Pf0HLpHN27NCfQcnDI+8f5ZCKCeN32D5n2MzPhL/CUFsfRkPrVMacjeoTol02vTFLear99tIT9mW1ub/ABVHUxzWp3i+7hurfOWVQzdrniJCThVZKY5Xf7GAOFyTfmU+DJQNvZiQjMkOnpVaz9RU/AFFr8tszIHTShAFkJVHRvAMPfnWRbCyfUzAupXAi7T+MrXY259/OPmK3ZnXXmYRfylHv6mfZB0ZLlqKr/qlxVnR6yijnZWTpHLMDFMvb+8EP6mv1YKaKs4EoHMvvrAWeMEQlonSnyI5KiFnjgO5IFH+pZzzD2byv+8vuJu1ibJ8w8UKUN4einobWD+cJRx4Mt6lM0ojVQxxa0kfnd0tLhkbK5d0W7vlLNyyOvulGv6IF+uS1b8a11HlbtYnZoKkU1t6FrCjog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EjY1u9Eudq76pUaYMab6kstxnTK3fJwhiN2ASVwI1l7BO5dShGc/B5DmT6XScoxx1lAxfhmP6MbvSh07cTniTKmoWFZC4Uai8nOQuQCERcD1oTKjDw8bsiJXYGaXvsWEWAt9FB0AtV+Wj5ArHeVmLF9pk7PEDoD5/iHMYp9o3QdFeWrKyRgbEACWLH4Es0+Wof9PANPziTr0LnOnJyLf9sxg2xHfUlcUwdB+5EpWx63otxh2qGCav+wjACnY/bsM0GgTEuY61K8hc1dpClaSWhvcJQ1vpyaPfgy+/NDP36QA5H7Zc4cWiEq65myhcK6Une9xFOcOso5BJplleCipXIRPccTyneQA16L8LtP2Kktjry3+B4+SKDtny6o1/Tho8+m2mA0CHiu/DsiWpNLfZAshzMtTDsrMQtxr/0WeQT2KZcHoafCBELBkrx4w2rZX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:19:16.1183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 058b9455-fc76-42db-aa69-08df0f0370cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846

From: Colin Huang <u8813345@gmail.com>

Add a PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/Kconfig    |   9 +++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/tda38740.c | 150 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+)

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
index 000000000000..df5173d8da0c
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740.c
@@ -0,0 +1,150 @@
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
+#include <linux/property.h>
+#include "pmbus.h"
+
+#define TDA38740_VOUT_SCALE_DEFAULT_MICRO	1000000
+#define TDA38740_VOUT_SCALE_MIN_MICRO		100000
+#define TDA38740_VOUT_SCALE_MAX_MICRO		2000000
+
+struct tda38740_data {
+	struct pmbus_driver_info info;
+	u32 vout_scale_micro;
+};
+
+static int tda38740_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	const struct tda38740_data *data;
+	int ret;
+	u64 scaled;
+
+	if (reg != PMBUS_READ_VOUT)
+		return -ENODATA;
+
+	ret = pmbus_read_word_data(client, page, phase, reg);
+	if (ret < 0)
+		return ret;
+
+	data = container_of(pmbus_get_driver_info(client), struct tda38740_data,
+			    info);
+
+	scaled = (u64)ret * data->vout_scale_micro;
+	scaled = DIV_ROUND_CLOSEST_ULL(scaled,
+				       TDA38740_VOUT_SCALE_DEFAULT_MICRO);
+
+	return clamp_val(scaled, 0, U16_MAX);
+}
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
+	struct device *dev = &client->dev;
+	struct tda38740_data *data;
+	const char *propname;
+	u32 vout_scale_micro;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	propname = "infineon,vout-scale-micro";
+	if (device_property_present(dev, propname)) {
+		ret = device_property_read_u32(dev, propname, &vout_scale_micro);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "%s property read fail.\n",
+					     propname);
+	} else {
+		vout_scale_micro = TDA38740_VOUT_SCALE_DEFAULT_MICRO;
+	}
+
+	if (vout_scale_micro < TDA38740_VOUT_SCALE_MIN_MICRO ||
+	    vout_scale_micro > TDA38740_VOUT_SCALE_MAX_MICRO)
+		return -EINVAL;
+
+	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
+	data->vout_scale_micro = vout_scale_micro;
+	data->info.read_word_data = tda38740_read_word_data;
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

