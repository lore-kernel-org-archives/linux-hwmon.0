Return-Path: <SRS0=OFCL=6I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41204C55186
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 03:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 122952075A
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 03:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="sTfXuk4Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDXDVT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 23:21:19 -0400
Received: from mail-dm6nam11on2071.outbound.protection.outlook.com ([40.107.223.71]:20801
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbgDXDVT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 23:21:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKKFs59VCJnkMHGvuVLnPrrU5PgTJLvvFLjrfHbO9fmhpbENvNCy8DuoPmZ6MfZarrF8XBDQoG1KdiImz1Kz0mmZ6xFL3pkY3DuzeeihOoY+qBA1aJpvIgR6pAh3r9QpJPp+xuLL1FeZFxCgr3/INsPDk+39IPGHk8zNaBoEVIKktO1uUMjRPWzDor7mokJ3UJEP4Uy6HJom3JkZhQ1c2zVuBySgBA6pTH0JpY0GDcf1YvwAPFJ7M8NLlpqrJ2SrmiSxyIcAVOO/qSHBA1dx1T71pdkUnrvh+55j5HE0i2iYHUkynE6y8mdgE8DVfpZpqCurygwiZXwEeR0C1IgLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnNkfG0kuMTAV8XgMDs+7CtU/KT8ovce5K50uBKz1f0=;
 b=Z7E8I+LhdjfQDxktSFZjuu9vUsSKFZ5KBG3n2saWCrJ4p1ze+gtfDAC33aFWpxZIh67fthA/qj9fKMDIahcBa47teJcxiOPR/IKxpTwuwi+SF+KkrxwdvCXzwBvTz+JBsSk7a5fdNCXZ1ujbISxHihZl5kSdeKlQKjrk8gGtPn31Ry0X4Zn5ZctB5CLb6k7MkG6dPGsPgdDz0hH7QEFuByHtS9CMUeJQGMTcGLnTKXCGV8xAUTlNMiECCP/p7IVxEpNDcVPRNu/hvU1i9lSweGcKfEXCwc0bSHSbppdqJFCY8VxBXXtrZFTkkbsGnbXHSeyMXOnGaVbryM49hROahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnNkfG0kuMTAV8XgMDs+7CtU/KT8ovce5K50uBKz1f0=;
 b=sTfXuk4YV0tL7iKj8MXWSL75EanSwJpQnZTHVzmizpP4dJj8P9XrvgsVqrNvvY2l2z+gli72DSxrL9VJ85If2hKpbLEwxiDQ6gfdL1L9rxaTS3sOyQLAHwGrRL5X4cp93qbZGxm85G5Cg2KTVGtQ0pWW+k5lw1gI65foJCSX6/c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3955.namprd12.prod.outlook.com (2603:10b6:a03:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 03:21:15 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 03:21:15 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 1/3] hwmon: Add amd_energy driver to report energy counters
Date:   Fri, 24 Apr 2020 08:50:54 +0530
Message-Id: <20200424032056.16287-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::23) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 03:21:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0828a835-307f-4963-e019-08d7e7fe8bbf
X-MS-TrafficTypeDiagnostic: BY5PR12MB3955:|BY5PR12MB3955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3955B41D6F35E0D7ADF200D2E8D00@BY5PR12MB3955.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(81156014)(956004)(6916009)(66476007)(16526019)(66556008)(1076003)(66946007)(8936002)(8676002)(4326008)(5660300002)(54906003)(2616005)(186003)(26005)(2906002)(36756003)(7696005)(316002)(6666004)(6486002)(52116002)(478600001)(6606295002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D97G1zdYjv52den3hmvt0sx3hKP7TLBTHzdoE9Tkmt6crC1+h/g0U6ZPKmBPjHRs5z8lvNRLu2occPIvDCCCZa16Eyy57GEHCOF9s57d/9rh4LVwes1PqkijZLrZXVY7Gd9RE4o2T1vwHLOwypH1l/ED03+64DeXE8X3dE1Gvad9y+lQnCrjri5G94g5izcZVrBnxjU0xCjqVNk2t00Kl7mTwG8rrIjxMDBFBHSYsJzelLA8ZG0uoLrFh3c/n7AfFgkpU9JcXham7tBeo+ZoMx4TOmcbu1eNqoE8v8anpcThxEbRD5WAJYXoQzuiQCgKsAyDBSDytwxj3JFjSOQ0xcodIt7Kon/C9tRV7Ob+GDV6BjIfrXv5AeYXDBkLwEOvsUZ7hkxuIygvjO3uZ98n+j/pxBsxaupbcK+F2rh3FmUwWC9ByuVIjrWF9ko/KM+TxmN5lCu27gFfv3X65fUpTRe1gqgaNX8kpcTvfVxRG+bHAI/mY2GXgvYErg+ZunFh
X-MS-Exchange-AntiSpam-MessageData: JTU+neMD4vP/jMHny5xqyOtO5oN/prViMz7pLb0dDLbqFzqJPYlguFZaRrnOATOQWcd2liEhGl4YlA9ZFf1wH/V4Lz4efpsqcryG8bKhYuAcZB7ITY+AqXy6zUaQAGc0N8huMCkGjmNM7fgkUedyKQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0828a835-307f-4963-e019-08d7e7fe8bbf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 03:21:15.0831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQu25WpPIV8bkcy9uSx0nPY3lKXP6pog/PxBtMqpaak4yLwDk+sf2t7cVN4WM50urwRyWfFcROjAD9qR2fsrpQ==
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
Changes in v4:
1. Use num_present_cpus() instead num_online_cpu(), as the latter does
   not take offline cpus into account.
2. run checkpatch.pl --strict and fix alignment issues
3. Fixed other comments from Guenter Roeck

 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/amd_energy.c | 250 +++++++++++++++++++++++++++++++++++++
 3 files changed, 261 insertions(+)
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
index 000000000000..7162c80edd10
--- /dev/null
+++ b/drivers/hwmon/amd_energy.c
@@ -0,0 +1,250 @@
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
+static u64 energy_units;
+
+static int amd_energy_read_labels(struct device *dev,
+				  enum hwmon_sensor_types type,
+				 u32 attr, int channel,
+				 const char **str)
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
+	u64 rapl_units;
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
+			   enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	u64 value;
+	int cpu, ret;
+	u32 reg;
+
+	if (channel >= nr_cpus) {
+		reg = ENERGY_PKG_MSR;
+		cpu = cpumask_first_and(cpu_online_mask,
+					cpumask_of_node
+					(channel - nr_cpus));
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
+	if (energy_units == 0 && get_energy_units())
+		return -EAGAIN;
+
+	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) Joules */
+	*val = (long)value * div64_ul(1000000UL, BIT(energy_units));
+
+	return 0;
+}
+
+static umode_t amd_energy_is_visible(const void *_data,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel)
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
+			     struct amd_energy_data *data,
+			     u8 type, u32 config)
+{
+	int i;
+	u32 *s_config;
+	struct hwmon_channel_info *info = &data->energy_info;
+
+	nr_socks = num_possible_nodes();
+	nr_cpus = num_present_cpus();
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
+			  HWMON_E_INPUT | HWMON_E_LABEL);
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

