Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0EA4EDCCB;
	Fri, 18 Sep 2026 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727072; cv=fail; b=d0furuKO072hkRRjgJo6DPMccGOAGJDnXR8qC5KYLUK1I5pJ20dV9K9Nf8ueSR+wzEsbVcF9SaH1epOFXSFeRXbJCRa0GUYD0wTctQXFyPP6MB2FymTBOOjqcS3YQVx0R+UMQdL+H8cmJOXI3zVhDjvkuQ+/ZrWKob2UB4zH1xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727072; c=relaxed/simple;
	bh=DqpXaGbKKKQu8hLpPFxvTaWiH3P0UaNPgxIFh1tPHiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=azWQ1I3rTWtWsiPBikcYQ7h0+wohpTiqmHef4U04MW8JgHLkxCr7GemtYPNS24fV4R0KEPutFk7QCdqlk4EaA1OkzlP7pMoKqP+MmIi7lU0VNkSeTlRbnAwnzUNtMm6fXxOcSAeGCxUAWh+FAKujbcGQlIG09KZv/b4CQXf8SJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com; dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b=FQlnjfbz; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="FQlnjfbz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qs93Pj+Q2D9feyyOw2VsnzgVx9h90HrDfiHWWeMmk+XShUIkJcU+0fwr/VBCDPLbWen9Px+rJwdnvj02QIWXdP+YiV65xHRQCSWfO7jTu6DCz6eEn7US+t84oNlUBaIdb6TRhfUzRuZ4WGwrgK5xCST849MIHveiGegF6/AmwvX9OUOqgqNVKm3vO4zH/E5a2Cj+o57B1hsHFR3iT+/550B0dXUT0Fwz/UaCSyx2lQ8INsGE/xc5x45RIaN3rpaYzbz++AspWGggGYXUWvK0thScA0a/GJ+FF6qJui0EzVcs5XJ6JaKKkxWt1CPccq71aJ0vqr9OaRxfM20ZxneJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6Vt0HxfH5E2+MCrUrAQ//xW7ALkEc09+etY+U3avsQ=;
 b=IPgeu0DCs0F1MN96dMceIt8yHsMHpUnrcZ5c9YGbfClnPoti/EC7ZuWYgOYKGF7yFzawm5MTuNqa0BkppAN7S8Z+1E6xDf+ozikqWK1pOm22ZnWzk9V5TxHjKEmYkL2gQHwiEfeF4M3PhxMlNmqTm2MCAPRt3zhwC8VSACZK+ok0H/0gZVDLeVqog+XMoe7fhCDOIXOKS+omT8mkDUyNbfLdadbWzXyimIuGUhe1CCnNm7AfTaaSQqnAOV8A1DzAr1qVf2PC4xivIRsXH3/GTTI/F1rGOXKT3mj3M6aRd1ZkYDddbjLpYRtGaPmRLI3HCYx9u6+fflrGKRkWOuI1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6Vt0HxfH5E2+MCrUrAQ//xW7ALkEc09+etY+U3avsQ=;
 b=FQlnjfbzmVBvJAV7gyMD8hmHZ4WIztmWPqSFtJ5EUDvu0SH/oblLd9CxfkPwpZ+hOFt4FSauDOs/6K4YJTatzm9yrZb+/lAhquO9v2WflijMRPsGEnoz7SE5TThja4iBqvtuQFSR5QLzhXJ2uRlUW/0aacmCmRjw6ft2tm6Nympv+KqY82b2gto3zcCDmf/cC6Ld2kymHZ0Nrqu6DYhLY9f8jOabNRfk6JKAcpurXX/wqOgAj2bHUdJlJz6HJ6NX+mGWrFSzLn+BlaRbMxaUA+7asGzqVGCzOhylp+AT8fOoCeZVGdowLEncxXxK4plXY4vo30aIn2W25oYjBSzSRg==
Received: from SA1P222CA0137.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::6)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 10:24:23 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::55) by SA1P222CA0137.outlook.office365.com
 (2603:10b6:806:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Fri,
 18 Sep 2026 10:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 10:24:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 05:24:20 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 05:24:18 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 18 Sep 2026 18:23:55 +0800
Subject: [PATCH v6 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727051; l=6177;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=DqpXaGbKKKQu8hLpPFxvTaWiH3P0UaNPgxIFh1tPHiU=;
 b=93AEEQGFwXAg5XubjWClEg1+KDv1rVjzYvwcj4OTrtJEZElwhxR2aptfem6qiZsL3TuFHHdd3
 BjFCScD23d0D32P/o8hyg8l+Hgdr6BbfKZC+e3ez91R6LmP/Tzf9W3z
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 47455215-0933-4be0-ddf7-08df156f01e6
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35950700016|48200799018|376014|7416014|61400799027|7093399015|82310400026|13003099007|10067099003|6133799003|3023799007|18002099003|56012099006|11063799006|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	a4oy0qJDtk0RyiJm8SjL3QfQubK08u4f3fs7ai/bHUWrg9sAotq2vkGdXjjDh5VSVzaAYxeC7nHhsxfq09R2omCnfFwipAIXb5kVgxRoS83HygijZaTepqkCGBjmZ9Yk+V5uKLrCGZEm04GhD1p1mgLauctmK8SXejpX0kWZww4YOlvsbUffT1WOG0Q9ylzh8u2SfA0kOblAfYypNwwphNws8Isfmn5+oSskA10rVFgsy/tnsKZmXYWZE2oYLlt8CNSmDMnHGesNpvo9wuZyPqD5NwbNQjX8xraIR+a2fPriCLp3mRG6e0mwxzKxt+2SFAdRWpBQoZjq5nx8/a4VyGLh7rvRfTEZ19Qx0c52MFFp93jUhioJm3Qwi+tcQuDGP4fbiiDOT0mSpNsq6C+Fn7n8a6gJuTU58RouRDWFJim8UoADhup+eGBu83g7snsfN2oEC/Yhskd4/PrZixMW0H/wK5fVuxHySsFxmUylYfvqXDQT6kEMjV7cQi5jJMo+dLIW7YSi0/KZN0kChMzQmlTTsci1lUopAQokFKpqBpCNg0ylRYGFdbktpIXMJJ5XED1yAQkIrLQMMV03qx+yYE+AsMvDXcUazck1vl7LDixzYzOl0WZYdGdsCU6Fw5dx5NakTQMAGxtQhCOGDu2f5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(48200799018)(376014)(7416014)(61400799027)(7093399015)(82310400026)(13003099007)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006)(11063799006)(22082099003)(16102099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TCe/MwaGqxsdf5XZ6SbZgvxQupHK9VMhX8WuWt1CSeoKwOEJ8plLIAvEibY0yvA/VbrOqlbgZoGB7Lftf8ymcXaBFRq4E1413Ux7oyzNmhGvMyLvQFJUvHtO+BvaSSlyCSjnkvi/zlioIJYDeE+yE8mfwPh9tVpGqrKvnCf1rH4cbLSsLvXAseL9OzYL+uCMxrbRN+y2Rmhv8BM6eBm/GETJ4gFDx7Uxe4ZfLW6jMpUwTY1x3Rwng56JJn+FIrxbfc9/xnU0PjK24jWlP+4+5o5A9Y7K4MBwGkKcrb9KcSxI5D5HDixoKMLQCSamyJRx6LYKSTnGlWgrZrY+89TCBH4MZQCJFWOnIAw/WV9u1d9GjngmUbvowmcbNfdV80j+CnTtBVMIA5tpMWZ7mHwY/X8KWTKJ7hnQtoqnWLL282NSuEPbtfNoWVCaujn/VBsR
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:24:22.6699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47455215-0933-4be0-ddf7-08df156f01e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891

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
index 000000000000..067de07ba9fb
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
+static const struct of_device_id tda38740_of_match[] = {
+	{ .compatible = "infineon,tda38725"},
+	{ .compatible = "infineon,tda38740"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, tda38740_of_match);
+
+static struct i2c_driver tda38740_driver = {
+	.driver = {
+		.name = "tda38740",
+		.of_match_table = tda38740_of_match,
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

