Return-Path: <SRS0=sjJb=5Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1BFC2BA2B
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2A122074F
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 15:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="d937UiZb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgDIP3D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Apr 2020 11:29:03 -0400
Received: from mail-mw2nam10on2053.outbound.protection.outlook.com ([40.107.94.53]:43200
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728176AbgDIP3C (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 9 Apr 2020 11:29:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M29mHSb27IHLONOs6LgjnC0idkneGuw7RrULo1mD8fAWDAXstxa3U6Fwem/jUaXoH0C2ZvMCQmp4fvU8csexMwm8TExHjL3uh0z2dy353XKy7JNRaRIlxJsCqcMQfpKGzOA08bdPbmFpWGFSgMulRYt9Wr2SK8LYIwIwCEi2d1n9xRuA5FlhUCvgFZ5SmbgCIyNCzoe7dbPdXJ8barhZh6z4L+g3k3kAWW9tjb/pbrs9fHN/hv4Pq4JdHCL/A3LgrNdxTa7IKeydvgcWE9cLzJNbv6ggcX6ovEycdzsXOaOk7qEjvO6Chjo/P0zIctFRGaEHv6UeUL41Kl7ExwxzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KISnX7mf/x6ioGZ8Dhj1QBttLKWXY5ky1iAqkcqGZ3o=;
 b=a088QlCWLZhp8ygXc2PWe5ERl/BmAOH1muNnkTI1GFWRkIo6Np4dZ+k/yG2OH9AAOZXLMV2INRsnbhAqslQEwLqL5zAnwX9htjBSQtqUgWRyO8tCi9sNK30nWL4XGglrw1b17qaUjGXOkE6xJmv6722XtHFAvVScysZNoHxtrAhfSJEGRqB5NaGzlio1qReX3hqkH3dxJSpkbmo7aWHpV9J6issUBC5pK7OK10JTq2+4tQlPz2Cjlf2xjrS72zK8mnOQwV4G5xOsbMMLuXWmbbzmNO2m4evfi5v/NJ7TuCfX9Az7FdbI8SCOd8yJYxjX0kwHAU7ff3L/M26ScVDSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KISnX7mf/x6ioGZ8Dhj1QBttLKWXY5ky1iAqkcqGZ3o=;
 b=d937UiZbVOISJfxnjZhvhsnB0LuBDnB0+0DARolVshLjykUREurMEnW1xlJdusMNLMUM08QqWbNKsPg/72v1sF/EYaOHBbTq63XQQwDDHhbLToHSKEE0Zgk01oHOIrcA+bEDRnvVtRXsO0/vq/a1lGAWCFSk8FKuOGXLO1bKiBE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 9 Apr
 2020 15:28:47 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::5d3c:938e:1015:8270]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::5d3c:938e:1015:8270%7]) with mapi id 15.20.2878.021; Thu, 9 Apr 2020
 15:28:47 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: Add amd_energy driver to report energy counters
Date:   Thu,  9 Apr 2020 21:09:38 +0530
Message-Id: <20200409153939.38730-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from SLES15.amd.com (165.204.156.251) by MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 15:28:45 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 922d829c-81f8-4bec-8f4d-08d7dc9ab1fe
X-MS-TrafficTypeDiagnostic: BY5PR12MB3922:|BY5PR12MB3922:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3922E76D78305C941669CAA3E8C10@BY5PR12MB3922.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(2906002)(956004)(2616005)(16526019)(186003)(478600001)(81156014)(1076003)(4326008)(6666004)(81166007)(6486002)(26005)(5660300002)(6916009)(54906003)(66946007)(66556008)(316002)(7696005)(52116002)(36756003)(8936002)(8676002)(66476007);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDT1CmwzACenNlEkNQnbVueg602vMFN8r2yL4LspXFe9GYasQ413Y1Y7QQaSQkrwsR9UJSQNPgrHLeuS1XlrzRExGmqsQJxjfO7K31ThjyGMi0U3gMPU4zz+3whJrrsHnnNaj2MxQZiRDsIVZuk0oybCLJfwiw6hS3ma1q1WZ6JeHeIfhOXJpm5USZo+ZcZ88mvxVvQeCX/h5UMbxe+irQEX6zuV0fkqBo3tMwu9uc8qKDIUTUbCNnZ9JO3CCpSICt5UzHnP9zGCrK6fkXMuLTiPuQiQsOu4ENheGYdV+gmVkNv/kSfJ3gbeLml/MSK/Ch+0N8R0TbE/sEz/X8V5FUCq7olhaRBrFT3TgF2CVCchLLpgJsHMOKCWxymJYBSehidoAGaE3SY+oBLScAuSwxrjXLyUuhNcEDnGuJdNlOkHJ39ievPdjAkG+lC2ggTz
X-MS-Exchange-AntiSpam-MessageData: +vDeI8QWhIe+ySEUgpLEjPSdfNg1mnONW9pKkSdoKcrwwC6yciiR3Nb41M3qdw7VjQ0432OVr2oZOch3xoiKmaKQYzVElEjSoi0wD+JlnI1RJ1iOBuOnmrycF0nsm+/8qwykbBHO+6MbYuGgelEk/w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922d829c-81f8-4bec-8f4d-08d7dc9ab1fe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 15:28:46.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwrnsbdBrGUdN9sCISCtDiYViLE8EYLd9C3jd0qI/xV+RrKMLewVGyV6gNkCV+Sz5zb3FAQ3JblQo5bSjDTpWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3922
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds hwmon based amd_energy driver support for
family 17h processors from AMD.

The driver provides following interface to the userspace
1. Reports the per core and per socket energy consumption
   via sysfs entries created per core and per socket respectively.
    * per core energy consumed via "core_energy%d_input"
    * package/socket energy consumed via "sock_energy%d_input".
2. Uses topology_max_packages() to get number of sockets.
3. Uses num_present_cpus() to get the number of CPUs.
4. Reports the energy units via energy_unit sysfs entry

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/amd_energy.c | 273 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 drivers/hwmon/amd_energy.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 05a30832c6ba..d83f1403b429 100644
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
index 000000000000..ddb7073ae39b
--- /dev/null
+++ b/drivers/hwmon/amd_energy.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2019 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/sysfs.h>
+#include <linux/cpu.h>
+#include <linux/list.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/processor.h>
+#include <linux/platform_device.h>
+#include <linux/cpumask.h>
+
+#include <asm/cpu_device_id.h>
+
+#define DRVNAME	"amd_energy"
+
+#define ENERGY_PWR_UNIT_MSR	0xC0010299
+#define ENERGY_CORE_MSR	0xC001029A
+#define ENERGY_PCK_MSR		0xC001029B
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
+static struct device_attribute units_attr;
+
+struct sensor_data {
+	unsigned int scale;
+	union {
+		unsigned int cpu_nr;
+		unsigned int sock_nr;
+	};
+	struct device_attribute dev_attr_input;
+	char input[32];
+};
+
+struct amd_energy_sensors {
+	struct sensor_data *data;
+	struct attribute **attrs;
+	struct attribute_group group;
+	const struct attribute_group *groups[1];
+};
+
+static ssize_t amd_units_u64_show(struct device *dev,
+	struct device_attribute *dev_attr, char *buffer)
+{
+	uint64_t rapl_units;
+	uint64_t energy_unit;
+	int ret = 0;
+
+	ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
+	if (ret)
+		return -EAGAIN;
+
+	energy_unit = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
+
+	return snprintf(buffer, 24, "%llu\n", energy_unit);
+}
+
+static ssize_t amd_core_u64_show(struct device *dev,
+		struct device_attribute *dev_attr, char *buffer)
+{
+	unsigned long long value;
+	struct sensor_data *sensor;
+	int ret = 0;
+
+	sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
+	ret = rdmsrl_safe_on_cpu(sensor->cpu_nr, ENERGY_CORE_MSR, &value);
+	if (ret)
+		return -EAGAIN;
+
+	return snprintf(buffer, 24, "%llu\n", value);
+}
+
+static ssize_t amd_sock_u64_show(struct device *dev,
+		struct device_attribute *dev_attr, char *buffer)
+{
+	unsigned long long value;
+	struct sensor_data *sensor;
+	int ret = 0;
+	int cpu, cpu_nr;
+
+	sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
+
+	for_each_possible_cpu(cpu) {
+		struct cpuinfo_x86 *c = &cpu_data(cpu);
+
+		if (c->initialized && c->logical_die_id == sensor->sock_nr) {
+			cpu_nr = cpu;
+			break;
+		}
+		cpu_nr = 0;
+	}
+
+	ret = rdmsrl_safe_on_cpu(cpu_nr, ENERGY_PCK_MSR, &value);
+	if (ret)
+		return -EAGAIN;
+
+	return snprintf(buffer, 24, "%llu\n", value);
+}
+
+static int amd_energy_probe(struct platform_device *pdev)
+{
+	struct amd_energy_sensors *amd_sensors;
+	struct device *hwdev, *dev = &pdev->dev;
+	int nr_cpus, nr_socks, idx = 0;
+
+	nr_cpus = num_present_cpus();
+	nr_socks = topology_max_packages();
+
+	amd_sensors = devm_kzalloc(dev, sizeof(*amd_sensors), GFP_KERNEL);
+	if (!amd_sensors)
+		return -ENOMEM;
+
+	amd_sensors->data = devm_kcalloc(dev, nr_cpus + nr_socks,
+				sizeof(*amd_sensors->data), GFP_KERNEL);
+	if (!amd_sensors->data)
+		return -ENOMEM;
+
+	amd_sensors->attrs = devm_kcalloc(dev, nr_cpus + nr_socks,
+				sizeof(*amd_sensors->attrs), GFP_KERNEL);
+	if (!amd_sensors->attrs)
+		return -ENOMEM;
+
+	/* populate attributes for number of cpus. */
+	for (idx = 0; idx < ; idx++) {
+		struct sensor_data *sensor = &amd_sensors->data[idx];
+
+		snprintf(sensor->input, sizeof(sensor->input),
+				"core_energy%d_input", idx);
+
+		sensor->dev_attr_input.attr.mode = 0444;
+		sensor->dev_attr_input.attr.name = sensor->input;
+		sensor->dev_attr_input.show = amd_core_u64_show;
+
+		sensor->cpu_nr = idx;
+		amd_sensors->attrs[idx] = &sensor->dev_attr_input.attr;
+
+		sysfs_attr_init(amd_sensors->attrs[idx]);
+	}
+
+	/* populate attributes for number of sockets. */
+	for (idx = 0; idx < nr_socks; idx++) {
+		struct sensor_data *sensor =
+			&amd_sensors->data[nr_cpus + idx];
+
+		snprintf(sensor->input,
+			sizeof(sensor->input), "sock_energy%d_input", idx);
+
+		sensor->dev_attr_input.attr.mode = 0444;
+		sensor->dev_attr_input.attr.name = sensor->input;
+		sensor->dev_attr_input.show = amd_sock_u64_show;
+
+		sensor->sock_nr = idx;
+		amd_sensors->attrs[nr_cpus + idx] =
+			&sensor->dev_attr_input.attr;
+
+		sysfs_attr_init(amd_sensors->attrs[nr_cpus + idx]);
+	}
+
+	amd_sensors->group.attrs = amd_sensors->attrs;
+	amd_sensors->groups[0] = &amd_sensors->group;
+
+	platform_set_drvdata(pdev, amd_sensors);
+
+	hwdev = devm_hwmon_device_register_with_groups(dev,
+			"amd_energy", amd_sensors, amd_sensors->groups);
+	if (!hwdev)
+		return PTR_ERR_OR_ZERO(hwdev);
+
+	/* populate attributes for energy units */
+	units_attr.attr.name = "energy_units";
+	units_attr.attr.mode = 0444;
+	units_attr.show = amd_units_u64_show;
+
+	return sysfs_create_file(&hwdev->kobj, &units_attr.attr);
+}
+
+static int amd_energy_remove(struct platform_device *pdev)
+{
+	sysfs_remove_file(&pdev->dev.kobj, &units_attr.attr);
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
+	const struct x86_cpu_id *id;
+	int ret;
+
+	id = x86_match_cpu(cpu_ids);
+	if (!id) {
+		pr_err("driver does not support CPU family %d model %d\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+
+		return -ENODEV;
+	}
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
2.16.4

