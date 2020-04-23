Return-Path: <SRS0=tzLi=6H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C122C54FD0
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 17:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 036A920857
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 17:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="JWW7lXYi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgDWRu1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 13:50:27 -0400
Received: from mail-co1nam11on2084.outbound.protection.outlook.com ([40.107.220.84]:6180
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730000AbgDWRu1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 13:50:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqD/yC/9lY6qaW9/spfzfIsdr1MvubGDfF+UgR6ju32hgcpZ+ZhbYTbOHx29WWm776Qq5+7c/Ca6nlSuzA4P9Gr407k/U1eWZVNnWy47dmIRR7kjwFWZY+0N5ebiRH0C+Zp5gDNba+EJWa/6B9G4LdUpgz5mR3mARfVrJrEE743EvC/3euK1IO8vj+cIo0vouH1bpIojkiHkKy/anQ8/W2X+OvETQVTq4VinxTn2zB+jbpf6wfdaOUq7pNoP7oijqbErnWR5Mi83R/7hr2PIKZEOQXNKsE7HDoHAW90s3XyiO3iyvR65OxPT8ha3GNcjKNTPH+dcddIedQxrgaX6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EHeKE76OWxVDiFUOP3kFFimZK0gU48bWmxs9DH30HU=;
 b=ejv15zcntCBIFvfKf8kZ9o6AxPW7Q80oBuMurLrngzH6c8BqyswkQ6ahWTcq3KnG7FiqJxl34vpRLcWx8pBHobH4AYIZtmbDeCQJb4nwvHVMSaZ95wVfASxDibKl8bgCTN+CmV3SFfH6lUPdFV6TvU/+0f2U8Az4y9p8jjqZf4z1Z62118EZJCP6/3tSP1biLKgUr9YQDajpaIZuxaIFAzRsej3LF2EKxiH2GN+olld7vumHGFigMYrGSbK9Pf2qWnQTm6tGcknCZsA8bsmI34iK0wX67vTOyMjHFeHwk2LqdOsIvIG3APcTrYwsCTbHAeyadvB77hwcEKo+qMqT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EHeKE76OWxVDiFUOP3kFFimZK0gU48bWmxs9DH30HU=;
 b=JWW7lXYidnu+JGlr+m+oVXgcc7VFG/qH2ti+1TKX6exnmhXP6fE33ly76gKNk4Ej34B5SrHFXWEZoYFqzqu4jVJn/z42IiJsF0zs5dUYJok+hzMBJs389BOctytISu47Tm2KhCEl2L6bxBrN6aHUnZDrnRiill1ENK577VPZOfs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3955.namprd12.prod.outlook.com (2603:10b6:a03:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 17:50:24 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 17:50:24 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 1/3] hwmon: Add amd_energy driver to report energy counters
Date:   Thu, 23 Apr 2020 23:20:03 +0530
Message-Id: <20200423175005.9072-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Thu, 23 Apr 2020 17:50:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b7871133-19d4-4b32-f454-08d7e7aeccaa
X-MS-TrafficTypeDiagnostic: BY5PR12MB3955:|BY5PR12MB3955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB39559A40DFC84BD9B63231EAE8D30@BY5PR12MB3955.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(2616005)(956004)(8676002)(6916009)(66946007)(66476007)(16526019)(1076003)(66556008)(81156014)(8936002)(5660300002)(4326008)(54906003)(2906002)(26005)(186003)(7696005)(36756003)(6666004)(316002)(52116002)(6486002)(478600001)(6606295002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jcGumFXPgYq3UQHTW+3gxQr8JEQHi6plyC7xkKnPRmEoPkIQVgQSgBgoNBQGm4njxjw3HkYLEdLUE39RIzNrxaXYhWylLe2mfaU/SBEsM/QQgglzNmLGdHUzzP5ZWWV9cIpx4UVlSWo3GavDyodf8+ybGbHGZb+jUkEzzzCNk3fA5aGAHut8cMOrbG3/TEevTM1XqDakrovGT2V8coCCUUWlypFdRXM8R7A3I4XloXqlFnTzl60CcqBWIPE1oKRwWjCcWQ3llJfB8CSj3JIe24QNKDU2cAcRHmgxXqxIZiuM8O5lqDk8TJmWTiVy9O/viUK2x8l8qycatSr9c6sq8yEK/4Xur9hL557fwvZNRzp8UqiVveNccxTCRRlA589ac3YKrBjTL4QVZ3BWvBFq/gyW2DJ+5v5AOFeOrEakQFtysbqJg9LyqZ8rBtVM5jNcyxDMAHG2tz2+uxLdnGFRaed9KMIwKK0IBKltjo3T/i/5HTplDcevQh0nZfVClUOv
X-MS-Exchange-AntiSpam-MessageData: 2Yu2IiHBN/C5aj6JlxmcTloesT+oEr5K3hVJ8wtxvrkeFj4vdhgx+ihX2PMbFgLx2eC2gEhVoHTEKvZQGp05Dw144s0rMU8FeuNU7O8eqGkqOF/9DoDAszq+yPaPEEpO96INS4h3jhzKMubwhYulPw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7871133-19d4-4b32-f454-08d7e7aeccaa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 17:50:24.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLucJXkwLct/gqPJdtiqtiSwOhP7una4ezeiFHPecy09OlOE4vyLvX1FdY5Hd0w1RE9/xWsv7GG5+VdtGsyd9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3955
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds hwmon based amd_energy driver support for
family 17h processors from AMD.

The driver provides following interface to the userspace
1. Reports the per core consumption
	* file: "energy%d_input", label: "Ecore%03d"
2. Reports per socket energy consumption
	* file: "energy%d_input", label: "Esocket%d"
2. Reports scaled energy value in Joules.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v3: None

 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/amd_energy.c | 251 +++++++++++++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 drivers/hwmon/amd_energy.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 4c62f900bf7e..e165e10c49ef 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -324,6 +324,16 @@ config SENSORS_FAM15H_POWER
 	  This driver can also be built as a module. If so, the module
 	  will be called fam15h_power.
 
+config SENSORS_AMD_ENERGY
+	tristate "AMD RAPL MSR based Energy driver"
+	depends on X86
+	help
+	  If you say yes here you get support for core and package energy
+	  sensors, based on RAPL MSR for AMD family 17h and above CPUs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called as amd_energy.
+
 config SENSORS_APPLESMC
 	tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
 	depends on INPUT && X86
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b0b9c8e57176..318f89dc7133 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
 obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
 obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
 obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
+obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
new file mode 100644
index 000000000000..7127f1f5f5ee
--- /dev/null
+++ b/drivers/hwmon/amd_energy.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2020 Advanced Micro Devices, Inc.
+ */
+
+#include <asm/cpu_device_id.h>
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/processor.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define DRVNAME			"amd_energy"
+
+#define ENERGY_PWR_UNIT_MSR	0xC0010299
+#define ENERGY_CORE_MSR		0xC001029A
+#define ENERGY_PKG_MSR		0xC001029B
+
+#define AMD_TIME_UNIT_MASK	0xF0000
+#define AMD_ENERGY_UNIT_MASK	0x01F00
+#define AMD_POWER_UNIT_MASK	0x0000F
+
+#define ENERGY_STATUS_MASK	0xffffffff
+
+#define AMD_FAM_17		0x17 /* ZP, SSP */
+
+/* Useful macros */
+#define AMD_CPU_FAM_ANY(_family, _model)	\
+{						\
+	.vendor		= X86_VENDOR_AMD,	\
+	.family		= _family,		\
+	.model		= _model,		\
+	.feature	= X86_FEATURE_ANY,	\
+}
+
+#define AMD_CPU_FAM(_model)			\
+	AMD_CPU_FAM_ANY(AMD_FAM_##_model, X86_MODEL_ANY)
+
+struct amd_energy_data {
+	struct hwmon_channel_info energy_info;
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_chip_info chip;
+};
+
+static int nr_cpus, nr_socks;
+static uint64_t energy_units;
+
+static int amd_energy_read_labels(struct device *dev,
+			       enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	char *buf = devm_kcalloc(dev, 10, sizeof(char), GFP_KERNEL);
+
+	if (channel >= nr_cpus)
+		scnprintf(buf, 9, "Esocket%u", channel - nr_cpus);
+	else
+		scnprintf(buf, 9, "Ecore%03u", channel);
+
+	*str = buf;
+
+	return 0;
+}
+
+static int get_energy_units(void)
+{
+	uint64_t rapl_units;
+	int ret;
+
+	ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
+	if (ret)
+		return -EAGAIN;
+
+	energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
+	return 0;
+}
+
+static int amd_energy_read(struct device *dev,
+			enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	uint64_t value;
+	int cpu = 0, ret;
+	u32 reg;
+
+	if (channel >= nr_cpus) {
+		reg = ENERGY_PKG_MSR;
+		cpu = cpumask_first_and(cpu_online_mask,
+				cpumask_of_node(channel - nr_cpus));
+	} else {
+		reg = ENERGY_CORE_MSR;
+		cpu = channel;
+	}
+
+	if (!cpu_online(cpu))
+		return -ENODEV;
+
+	ret = rdmsrl_safe_on_cpu(cpu, reg, &value);
+	if (ret)
+		return -EAGAIN;
+
+	if ((energy_units == 0) && get_energy_units())
+		return -EAGAIN;
+
+	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) Joules */
+	*val = (long)value * div64_ul(1000000UL, (1 << energy_units));
+
+	return 0;
+}
+
+static umode_t amd_energy_is_visible(const void *_data,
+			enum hwmon_sensor_types type,
+			u32 attr, int channel)
+{
+	return 0444;
+}
+
+static const struct hwmon_ops amd_energy_ops = {
+	.is_visible = amd_energy_is_visible,
+	.read = amd_energy_read,
+	.read_string = amd_energy_read_labels,
+};
+
+static int amd_create_sensor(struct device *dev,
+			struct amd_energy_data *data,
+			u8 type, u32 config)
+{
+	int i;
+	u32 *s_config;
+	struct hwmon_channel_info *info = &data->energy_info;
+
+	nr_socks = num_online_nodes();
+	nr_cpus = num_online_cpus();
+
+	s_config = devm_kcalloc(dev, nr_cpus + nr_socks,
+				sizeof(u32), GFP_KERNEL);
+	if (!s_config)
+		return -ENOMEM;
+
+	info->type = type;
+	info->config = s_config;
+
+	for (i = 0; i < nr_cpus + nr_socks; i++)
+		s_config[i] = config;
+
+	return 0;
+}
+
+static int amd_energy_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev;
+	struct amd_energy_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = get_energy_units();
+
+	data = devm_kzalloc(dev, sizeof(struct amd_energy_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chip.ops = &amd_energy_ops;
+	data->chip.info = data->info;
+
+	/* Populate per-core energy reporting */
+	data->info[0] = &data->energy_info;
+	amd_create_sensor(dev, data,  hwmon_energy,
+				HWMON_E_INPUT | HWMON_E_LABEL);
+
+	data->info[1] = NULL;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
+							 data,
+							 &data->chip,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static int amd_energy_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct platform_device_id amd_energy_ids[] = {
+	{ .name = DRVNAME, },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, amd_energy_ids);
+
+static struct platform_driver amd_energy_driver = {
+	.probe = amd_energy_probe,
+	.remove	= amd_energy_remove,
+	.id_table = amd_energy_ids,
+	.driver = {
+		.name = DRVNAME,
+	},
+};
+
+static struct platform_device *amd_energy_platdev;
+
+static const struct x86_cpu_id cpu_ids[] __initconst = {
+	AMD_CPU_FAM(17),
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
+
+static int __init amd_energy_init(void)
+{
+	int ret;
+
+	if (!x86_match_cpu(cpu_ids))
+		return -ENODEV;
+
+	ret = platform_driver_register(&amd_energy_driver);
+	if (ret < 0)
+		return ret;
+
+	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
+	if (!amd_energy_platdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(amd_energy_platdev);
+	if (ret) {
+		platform_device_unregister(amd_energy_platdev);
+		return ret;
+	}
+
+	return ret;
+}
+
+static void __exit amd_energy_exit(void)
+{
+	platform_device_unregister(amd_energy_platdev);
+	platform_driver_unregister(&amd_energy_driver);
+}
+
+module_init(amd_energy_init);
+module_exit(amd_energy_exit);
+
+MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via HWMON interface");
+MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
+MODULE_LICENSE("GPL");
-- 
2.17.1

