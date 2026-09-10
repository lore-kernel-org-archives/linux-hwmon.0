Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E448820E;
	Thu, 10 Sep 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043779; cv=fail; b=B0rIiLvgDpX5MhOA6xAZH7/p0OQk3DpGolMs5lvNBnfGKHTiAaKm6Ia7adGD7Dz/8Dd/p06sFrS/xcWkoAHE1CrGc1O5vrKFcubGKecN1/vmnDzBWvrhqW3/yfP9MT9zoPYtUGCQSpla5MrSQwyNIYGbIJlGd3htPOvw5ZO+SYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043779; c=relaxed/simple;
	bh=oRFMSpPqRcLgsBZ80nkfKmNucpdxmYvS3Xzk257XfZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=o/LziHaYuywPt4b7KpLSPm95Xw2HxI7NBMjIFTpwsjFnoT/s3IPbLDNEZ7SlObg0vqh3eRGCLSEWrnXtGzvNGdW14GQt5Zr8gvzfsXKMm82xsDLatYB5/McFuWoiehjXAKPGS6H1ujAnznCw559c36stjsylYIg7qpqiLjkMQIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Hpi1n0EH; arc=fail smtp.client-ip=52.101.56.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hpi1n0EH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzWJJdCJ/josH4cBY7l5FHCHeFNZ7Anj8oWr9cYUoqu3X+5rTQ63S3JdvLxtmIXwuMD7OxVOL83rQk3NaHtlublsvtklNo5vR41IIJtEhRVdgdgmZVDVuVzfP19MosiEET+/9RawzMIRtesdjyiWbco0SabuXlfD08LnxlrtDxyzR9AjbEPYG4ZWD6lCNh15evGQkdZLl0784Fj0BLzceIekLXVI+jOcDOeJzmqWsvN0WLN/rkLRs+eeuknKWguezR7PWIHTWEkALZ8Y6NlV3pOHXhD9pbFsWfBsrf0y8Y4Xxd7VFaUgQbA0D+zrHKn1xEJ6r9gUs3i7Wi1Q/cKyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbfVm7w2PzPSuEGWLTy2H6Kj7yOP3IftQ8pSIAVfmaw=;
 b=s+COV6AD+Wk49sDEy4ov41alohTao0jTBPVlt6d19MlNImoeoAuTjvG/iKiSZT5OJ0TqZLpKzmk6K81rIpk4IWwfx9zxiCP0O7t1y2WFCbF3qr/f5alFyVuKgqp68q0jOLHhrpDzjBfd28uddT08/lAiCEFdRpxQYEr2vagbTdToR7g+wDEiatYOld/zzXKkjBIiowUsSHyxCyoLm4qgiI8hzPnRUm789FqFQBo0U5riiqk5FWvRktHSVA6Rs6Pn/hdRpr/oUgo8qP61phnu4ekQ0DldaqIAjk6JSfTRH1dgPkoU7vIBa03LcWgonjfz0gLnkRoE354PT33/HDRXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbfVm7w2PzPSuEGWLTy2H6Kj7yOP3IftQ8pSIAVfmaw=;
 b=Hpi1n0EHo3ePV1ZimlQR09Fz00xKm4UQOj0oc9yX9tnTfToda7eaEvi6wgvGpHL7cRNmYc0xiRp4UiWTmOzEZyXqaROShGP9Eu4Q1ZHiOstMnpKJnN642pPUi1Il3mxJJs/zzGDItGUoya0VVxhNcCnEgT7UYg7DnKlP6xenq40=
Received: from BN0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:e8::17)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 12:36:10 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::37) by BN0PR04CA0042.outlook.office365.com
 (2603:10b6:408:e8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 12:36:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 12:36:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 07:36:08 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 07:36:05 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Thu, 10 Sep 2026 20:35:51 +0800
Subject: [PATCH v4 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-add-tda38740-and-tda38725-v4-2-dbae7fabce09@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
In-Reply-To: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789043754; l=7015;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=4Oh+uM9E8qqZCyx67UPiS/rQwb5ngx7AFKSGdV2gPr4=;
 b=N7ZHHUN+ro0CouZ6DD1m8ngW0yRAG+n7p3C2naGfLGeEXyIHEefq5daDpvu9FW7gU4/4kdbvu
 Zu7siguXLDLBNs6Qh+D+p6VyY4+kEVIqPyasgFdmkpKJ9KOhwHRKA25
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb460a4-5fcb-49ae-26e7-08df0f3817e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|23010399003|82310400026|3023799007|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a2/loXoHex07h2o8N8Q/8UtLzrVBz1/TAKvAKuFw/d+SbjeeWq/DtK7JUVXuItXAZTXQm6AZjjkHE6Jnmtnl3dxktC9tQWnE0xbSyekkL/imodUlcG4Udv7IFppmr/IeteOcAK2M3V6/ObAUe5tbRLqY7iJd2f/caqp+QVWVioYikOMKNn3gfEMV9NjXthhsJjny9KFeFCMnwMfDe7n+H87ZD4kD4I/zClcQsbGFt3IfxrKJ7YHiS2Gn5X2O+N12qGAugmNAvMb8suQKbzN5Vj+5Moz8zwJ9wirzR0D9dmKzZ8/Ol6Uiw+PMJLmrm33BwiCDXQvklnIP0O4g/uiP0pCtmkjv9kHHRYQMhjIi5YfJ6T3uY3ttgueadN1ZM6hxFERiM6mszUuBhLS3+/519B70dzS0mkoIfI41tU+41peA93++h8kMxTQn/i9Z1cc20gr9u17Qw5ewkyaHA7UfsjXo9bEuITbBNr9nsEA+DN+sdOdRbAhWoUIB3YBgJROCt3SqlHDcifZib7Zk6wS6INlgC+UdmKgYWYibTuQ+AL2rLF6+j3kxgT2NUD7CVqrIYxNk0N5ImUC0pz1McoPP78Q/1cW2klKjhpYNV/8ptiqmtgxFTSofqY9J4bc6hR7cmzHqHmtwtoVs07laHoG8SzSZocwzEHF6RpkXRiUcyfA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(3023799007)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qEm5WSnfb0QRjqvxRErCiLRqt6ryWquxDnFPioVF84A3I69O0R3EZ6x9uDaWkqbxvLeW2koPpbRfP/abC/ekDT6Zwkxmu22JNdeUEld+rJAKsjleWmN2k0cguqmzJ4Gaa9lm3hDPpwd/yRjZUqWfXX69SIlI9Ujy7zY6EDAbQR+SUAj9TKB1YPw+0UpN1rOu6cyx31UPpP1wunWpe31ykeUFM7AdIydw9DoVWwU2x3tbXLVHKm4Mv+Up980V9K2wnzQccCii00j6EkScEr7TBL0f+bHEg6zy4vG8N69jqSITC505uAT8Yw+8B2lPs0LOw/hQkjGiJO4F7nF9g/FyNb5oB6NkxuYkfgrtA3fGty/+y6r6p8vnqskGkVXIWEGcYZmZmtvfyWsAO1v3cTEsoIPXbakyQ/6yRISAGDN/hBWrVmQkr/62hGhXdLwdSiyv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 12:36:10.2853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb460a4-5fcb-49ae-26e7-08df0f3817e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121

From: Colin Huang <u8813345@gmail.com>

Add a PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/hwmon/index.rst    |  1 +
 Documentation/hwmon/tda38740.rst | 65 +++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig      |  9 ++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/tda38740.c   | 94 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 170 insertions(+)

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
index 000000000000..6d3e9884f733
--- /dev/null
+++ b/drivers/hwmon/pmbus/tda38740.c
@@ -0,0 +1,94 @@
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
+
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

