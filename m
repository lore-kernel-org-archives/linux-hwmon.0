Return-Path: <SRS0=GqDx=6P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5116C47253
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 May 2020 17:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A30220857
	for <linux-hwmon@archiver.kernel.org>; Fri,  1 May 2020 17:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="zpFS/q7Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbgEARuZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 1 May 2020 13:50:25 -0400
Received: from mail-bn8nam12on2086.outbound.protection.outlook.com ([40.107.237.86]:44769
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729697AbgEARuY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 1 May 2020 13:50:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHtRUwwAdCdQfI1RUaJRcyilbDna+GRmVC+XqVSbAha9+8A57t+wJs2mHh7L8NvNTZ8ET+upI0X6Jk5DT+GPHFL+okkA1Ybi62TSWa9aW4+c2GBIIeHGdaVFP7EFfsNxD74BDcrnDLgGM6Vczzdy3IucFossl54oUR1R394vhGAvOHuxDGon0K9g1VcwSJ82mNxHrVc2KzzZ2yYjvNUzMEcJOVcmkHqClFAo26G2xM3/vP5kFYpDE6USw/BmR0qIKDrhNFmo9ZHq75tuUX92h/Ki8AsrBhCPFnS2iQPblPqBcQ6OI2V7V7wfftKD/wMpMwAQXKDuezQjjfzTB13n9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIL77c08AXLPRDp0arY1iB6mRLoui1rijl8/x4TfsZU=;
 b=j4T72GTu3GV+CN6+iBlZo0d1mpB1FU5DHY0kCs4YRZ/e62VGZRrH+w6nnof5UoEDA3IEAmogkqBYc2k30+pfol66TsXAd7LsXSEw1RsWTIc5Vv9gy1HnkOPN21j/Y3kR2AupcchlBZG4oudwk50vfWRMR6ZNnj+UBPhfmmySXIwdPJN6cTi42k2VLujMXPpADg4KTppNjQCsyDhC+COzctgB90cMCopg5XW+locEEw2RDwmxGvMIYHHUoHbkH1Vou2QMv3oidDCJNfEAAgCTkpq4AKmSZBZOjVnf05lmnj++oMQwXoNr16zOk+pMYFqrCxR52x/wEhj4c/rWp0VWpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIL77c08AXLPRDp0arY1iB6mRLoui1rijl8/x4TfsZU=;
 b=zpFS/q7Q4X+wbo8Yd4bRIfX/NbRVW60Fk4RrLCsxqG4Sw+OwS9k8Kzkrzr5WuJcFH0919d3ZveHzFSVZjPepv0BkJ5B78uiyRAR7xaXw45NB7jdbPMnp1a5KJjI7oyIxtFnT8JCJy/yMz/Qj7u69OfkHywK0pQmh8gXMFvcMBi8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 17:50:20 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%6]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 17:50:20 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3] hwmon: Add amd_energy driver to report energy counters
Date:   Fri,  1 May 2020 23:20:01 +0530
Message-Id: <20200501175003.28613-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend Transport; Fri, 1 May 2020 17:50:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9ed459c-251c-4974-48a0-08d7edf81dda
X-MS-TrafficTypeDiagnostic: BY5PR12MB4034:|BY5PR12MB4034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB403446591B24EC066F567FBCE8AB0@BY5PR12MB4034.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AUQFI4LpGSs5eUtm87RAkp0K0v2UE4Sozb+ToWXALcsp2N4qBwASkNohAoNJ3ycti7zde5wfJArbSAHqN8sXULkkzadPELxwqwIX5xmU5MG3aeqb4q+US3g2QoiTe/YwY4t+rSI4dW7DJO0dk6Nz/8PWsNUefyFvyC2m/N/ibgs7YqKwmsO1b80nMSSlsB5RprKTTE5Np+ctmW0AMA+pAmGo8LPEgPyPsgvhMwqcQOTzwOlQzjj4LVvNzJUauQAwgjg14Qkeqh3Q3PRFpr1Os610n6SrKAckbY5wiIG459skCfRCPTecenwZYUSAvTJiXlRZM4CaN+TS1nZphClM3z/KnvEahzcidjUj7geaDz1heWUvWVoJtBzvmLANFg8cKbMEBVJO6uQfq2PpPM9rVxhFuJ+tle6T6MeONKAUDw7nXE4NqU/SeuBJXdEe9dPd04bUeoh+DipYU9qQxQ7Zgs8Lq0/Tc5g2oBkfEcy9CczQimHAnnBcWN1WmIaYi9td
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(6916009)(4326008)(6486002)(36756003)(8676002)(52116002)(7696005)(66946007)(66556008)(8936002)(16526019)(186003)(2906002)(66476007)(26005)(956004)(54906003)(316002)(5660300002)(2616005)(478600001)(6666004)(1076003)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 4+HjTiapzYF7zevKxJ/OVtmJtv4SxvkRMsep6FhW/SekjFGP07QCOHsofxi0UEwRUsO+1FYNnaXUiU10YYNcaBnF5/IE84hMgSSd/Y4R5HjLWVLSsJzXj8kJLlSMdRMQyS4O1aqpA7z31OiA79OLHyL0xkU4kfp+PuqRMGxA4+zchNPRp6poHUST6EuTokNAoN3LqnxZeXZSMl4l2iaNtJ5AKS9wnUtQS1g1+/vYQet04pqPWEMLs+EGT5LdqwiJ7/eH4OQ8GMx8scPqH9ZKnSTx4CxucjaAeQghHEStuaYYyPEPgL92AZQWxkxqPBHGeM4eFgk4xDZUfmD4xJo7mNs+U9WKY7AGdZ0OrT2JG+RlfJDIuwRwwyyEDbmcTnkvPezpKx0aKjxVTIE78rLQwi1KRQzXuUqM9Z1syJmtvx2iTXzB3ACtyRardjznKiXqSZipq3dXZ8l8Rx4K6iYI+1yeBLO0o8MKfDP5SARMlOJEChIjC6dx3U7+LMdkGBmjHGf1Ydx2780w9zamPA2LGh0pp7nRqSh749UpHU70CnE7Ajmv02JTi87lnGYdkNgD69ajd7jqXWzi+yt2sdqDfE36FD3sMa5+OvXDK5RPxzpsxl4aNlYeGvgBz+m8vcSpZHfj37o8yWTzlfIyopFkkYwg4Vy9bBO3FNY8I4McqwFu1uRPXnqg+SCkk2vUJEVxXJ4iyhkIVVCKA8QrEsmUglngyNj037hLnNlJGR/wtK+xoNst4mB4ops9OXqjfoeLZQNW8JMwwt6Y2p9pQwy84jZrNwvpbJPJGqh7rdI6uSOwUoLNaOkYf/PndM0lDDCC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ed459c-251c-4974-48a0-08d7edf81dda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 17:50:20.6673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mj/WEfMYb5Oku6c/st+qcTbywRQgLFqpsy6VDiTFh8R2M8ePk0qsHFMJTyyy0HXnrvZzNIztr7XYOaAIGuf7aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034
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
3. To, increase the wrap around time of the socket energy
   counters, a 64bit accumultor is implemented.
4. Reports scaled energy value in Joules.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in v5:
1. To improve wrap around time. A kernel thread is implemented
   to accumulate the socket energy counters into a 64bit.
2. Address other comments from Guenter.

 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/amd_energy.c | 329 +++++++++++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)
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
index 000000000000..16364576f067
--- /dev/null
+++ b/drivers/hwmon/amd_energy.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2020 Advanced Micro Devices, Inc.
+ */
+#include <asm/cpu_device_id.h>
+
+#include <linux/bits.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/processor.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define DRVNAME			"amd_energy"
+
+#define ENERGY_PWR_UNIT_MSR	0xC0010299
+#define ENERGY_CORE_MSR		0xC001029A
+#define ENERGY_PKG_MSR		0xC001029B
+
+#define AMD_ENERGY_UNIT_MASK	0x01F00
+
+struct amd_energy_data {
+	struct hwmon_channel_info energy_info;
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_chip_info chip;
+	/* Lock around the accumulator */
+	struct mutex lock;
+	/* Energy Status Units */
+	u64 energy_units;
+	/* An accumulator for each socket */
+	u64 *energy_ctrs;
+	u64 *prev_value;
+};
+
+/* */
+struct task_struct *wrap_accumulate;
+static int nr_cpus, nr_socks;
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
+static int get_energy_units(struct amd_energy_data *data)
+{
+	u64 rapl_units;
+	int ret;
+
+	ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
+	if (ret)
+		return ret;
+
+	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
+	return 0;
+}
+
+static int read_accumulate(struct amd_energy_data *data)
+{
+	int ret, cu;
+	u64 input = 0;
+
+	for (cu = 0; cu < nr_socks; cu++) {
+		int cpu;
+
+		cpu = cpumask_first_and(cpu_online_mask,
+					cpumask_of_node(cu));
+
+		ret = rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
+		if (ret)
+			return ret;
+
+		if (input > data->prev_value[cu])
+			data->energy_ctrs[cu] +=
+				input - data->prev_value[cu];
+		else
+			data->energy_ctrs[cu] +=
+				UINT_MAX - data->prev_value[cu] + input;
+
+		data->prev_value[cu] = input;
+	}
+		return 0;
+}
+
+static int amd_energy_read(struct device *dev,
+			   enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct amd_energy_data *data = dev_get_drvdata(dev);
+	int ret, cpu;
+	u32 reg;
+	u64 input;
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
+	if (data->energy_units == 0 && get_energy_units(data))
+		return -EAGAIN;
+
+	mutex_lock(&data->lock);
+	ret = rdmsrl_safe_on_cpu(cpu, reg, &input);
+	if (ret)
+		return -EAGAIN;
+
+	/* Accumulation is for sockets only */
+	if (channel >= nr_cpus)
+		input += data->energy_ctrs[channel - nr_cpus];
+
+	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) Joules */
+	*val = (long)input * div64_ul(1000000UL,
+				      BIT(data->energy_units));
+	mutex_unlock(&data->lock);
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
+static int socket_accumulator(void *p)
+{
+	struct amd_energy_data *data = (struct amd_energy_data *)p;
+
+	while (!kthread_should_stop()) {
+		mutex_lock(&data->lock);
+		read_accumulate(data);
+		mutex_unlock(&data->lock);
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (kthread_should_stop())
+			break;
+
+		/*
+		 * On a 240W system, the Socket Energy status
+		 * register may wrap around in
+		 * 2^32*15.3 e-6/240 = 273.8041 secs (~4.5 mins)
+		 *
+		 * let us accumulate for every 100secs
+		 */
+		schedule_timeout(msecs_to_jiffies(100000));
+	}
+	return 0;
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
+
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
+	data->energy_ctrs = devm_kcalloc(dev, nr_socks,
+					 sizeof(u64), GFP_KERNEL);
+	if (!data->energy_ctrs)
+		return -ENOMEM;
+
+	data->prev_value = devm_kcalloc(dev, nr_socks,
+					sizeof(u64), GFP_KERNEL);
+	if (!data->prev_value)
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
+	data = devm_kzalloc(dev,
+			    sizeof(struct amd_energy_data), GFP_KERNEL);
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
+	mutex_init(&data->lock);
+
+	ret = get_energy_units(data);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
+							 data,
+							 &data->chip,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	wrap_accumulate = kthread_run(socket_accumulator, data,
+				      "%s", dev_name(hwmon_dev));
+	if (IS_ERR(wrap_accumulate))
+		return PTR_ERR(wrap_accumulate);
+
+	return 0;
+}
+
+static int amd_energy_remove(struct platform_device *pdev)
+{
+	if (wrap_accumulate)
+		kthread_stop(wrap_accumulate);
+
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
+	X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
+	X86_MATCH_VENDOR_FAM(AMD, 0x19, NULL),
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

