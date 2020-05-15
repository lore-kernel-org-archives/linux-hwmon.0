Return-Path: <SRS0=MVeP=65=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6DCC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 18:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE5D320728
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 May 2020 18:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="k+CvVpGd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgEOSwz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 May 2020 14:52:55 -0400
Received: from mail-co1nam11on2083.outbound.protection.outlook.com ([40.107.220.83]:58624
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726144AbgEOSwy (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 May 2020 14:52:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRDXF1zxbRn4RQgURAF+8s/13stEfjwplPsia8CdF9zoK7etndTtuIS+5u4YJgbtL3zY5YyJEJwxug5actThfILnR/RHjroDaGp5KMoyc9bRPbfMmItX9aHSWUgoc+3m7SWOZqx6mliD+wINBGqEoEIRndXlARZM9G4rIELdrxN38rLMaY8Uh9addKLlVFXKcmHDzBRQQjgnhMEFdJTqgaJefo/VybMjxnNKCuLBDXUfbYtDS5i9QJUhyEI4G4IGlPq/za/JNYnl3wAWN5IaXNwFS+ka6dFXMKrC3TmhanO7KabpjGn2DzqoemNhvZMrAs55B79VqaVyJFXfjQAgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy+rbwKbDpfBhGh3/LBKLt84hueo9PL2UoD11571M3E=;
 b=gbd9br+qzYtLGdfqI0W66+eZZm+kgLvq/CmNXa/B7LipT/qB+yGhPVmYoJToSqSRHRr4uTP+7Ao31i8dF4FF8NGMRyLAijIFoEuEWyCxo9yOLn7cvh9Az9GvMOsgVBqI/3SICZUdUjjRbQDQSoJR5Ta+tNDZohL1Ue54ZyaPqC/oQZ700N+uKTFYe90B3z34nlHeMqmtlVzbZnlHkTk2FNwvlDVLVV4UClUKgejMIn+1pb5Qv6Q3f7EkHIkqCcAxF7ckJUTo5x1aNOgIMgruw+No2YM2Ihc0jIEwK2Pr7R4VhsRgnKZW0ZDOl9nUo41EaP3EqyiUI3NSMzoc3eC01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy+rbwKbDpfBhGh3/LBKLt84hueo9PL2UoD11571M3E=;
 b=k+CvVpGdHjakD0jwGXDeosfxeTEmVzkBCiyM/jGW5+WJqr6qW7t1laGB3tKuz5HW767oLAIBXbr7SKHdtGOK/hZyq1amoZKMuSa6BiWLucFwQRTuRx/5Tqr885zmyHgTflkXeJG8dxz16fSjSpVKGHlhVrT5FStB3zLHxZZbKFE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB3891.namprd12.prod.outlook.com (2603:10b6:a03:1a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Fri, 15 May
 2020 18:52:50 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 18:52:50 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3 v6] hwmon: Add amd_energy driver to report energy counters
Date:   Sat, 16 May 2020 00:22:32 +0530
Message-Id: <20200515185234.30687-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::20) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 18:52:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3156ab32-0fc4-46b5-1705-08d7f9012aaa
X-MS-TrafficTypeDiagnostic: BY5PR12MB3891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB38914100F7E7C660DCF7DFB4E8BD0@BY5PR12MB3891.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1Qmit3aK9Wght5AtCV+qEpGoYLqcFj93R5+x/PKlZ1aInXS9jIFPBKxeT9er+b4SKdabWO9/nfp4NsFj3yCPnmcPwY3L9nIlKQ3ytiR/DUDD++R7/7Aw9Sn6V72wLU7B4wS7tWeYuh1amTR2WoNONdNPnWXup6sRVRkGCVfhZjldK2ctG1flnlZt9uCmRxClQZOxqRl7fCkYh/MtjjW+Oxq4eCbJ09tZt/O/hNJyjqohweUT7vtZYoNHK4A9XRCeJBXkMtOX9BNmjLphRWh2wPY2VaUMzVXE08WaIoFhCgSVgvyO96golje7XKvwi2Bo2rriKnPlTu1IarTA3lCfG+bWNrA6avk06bDEjJ+XuIrrpSHI2wt6vMt4J1jvFWvuOJ9rYs0w/8ca39MvVbQUxNBpc/GmXDyReHb4b+v7tHvNR+RnMZu9ZQ4A++tfvlxuzawPv+WhFPlJlAA9F5n4l3qKJSa40/Z2Rj1g84ksnHyfTKUGBpu6AhH3OwcZ4NG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(6486002)(52116002)(7696005)(8676002)(8936002)(36756003)(478600001)(5660300002)(26005)(30864003)(316002)(2616005)(66556008)(66476007)(16526019)(2906002)(6916009)(956004)(54906003)(1076003)(66946007)(6666004)(186003)(4326008)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: tUhssKCxSXs18g+tbNQyhFVYV/f4YbLo0vzbdYDwFY2g5mIVCpWFTFWt61Dq2nLpKNPAD+jjuBJBsDEa7FgqSOMcsTts8iZgq067vTR7krx9ZRyZkNVVWEccb6feOAF3lq6JT8RD8zL219+rrsUUEqe0u1ePmUvl9GgHDO1SVnIngqSzKqfQr+V15QttUilGwG6153gNSJJULvtyX2kCINQC8Fcqgbo43Axm9LQGPNWF83GpE5pj/oZL2qehQboAzjURgEIe4yhwrvyURs6HjyHvZQ7A2YX2lgYtoADEvbeXZY2JtzL5Rc+8PFR0V4KdRibl5AYG61nPJ9/Mf/y5QGlcVZcLA3Lw1vt9K6HPAP2BopeeDOzyPozNHLD0mQFindPGcSxFTIB6J57z9lCkp9WPa7Y1TcZZtBrGAPHaLevPfSVlZtur3VgxYgusVAL/4lK1oB+eEVrUWLh8IcxDDyOyqlprdYmx5zHSsP3hKZhEXZgq13YPPNb5yAlTIfvr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3156ab32-0fc4-46b5-1705-08d7f9012aaa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 18:52:50.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lChcxw+LhPtY8adlt6hOVa6KG0RG8iKMu+YJ2QRE6WKFuDuvCrFOtTGGqsmaKUZtfUIjdhmfFXH5FizYqx6og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3891
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
Changes in v6:
1. Implement core accumulation
2. Remove enumurating sibling threads
3. Fix bug in accumulation
4. Few other minor comments addressed

 drivers/hwmon/Kconfig      |  10 +
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/amd_energy.c | 413 +++++++++++++++++++++++++++++++++++++
 3 files changed, 424 insertions(+)
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
index 000000000000..f2cd5e2e1339
--- /dev/null
+++ b/drivers/hwmon/amd_energy.c
@@ -0,0 +1,413 @@
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
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/processor.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/topology.h>
+#include <linux/types.h>
+
+#define DRVNAME			"amd_energy"
+
+#define ENERGY_PWR_UNIT_MSR	0xC0010299
+#define ENERGY_CORE_MSR		0xC001029A
+#define ENERGY_PKG_MSR		0xC001029B
+
+#define AMD_ENERGY_UNIT_MASK	0x01F00
+#define AMD_ENERGY_MASK		0xFFFFFFFF
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
+	u64 *sock_energy_ctrs;
+	u64 *core_energy_ctrs;
+	u64 *sock_prev_value;
+	u64 *core_prev_value;
+};
+
+static struct task_struct *wrap_accumulate;
+static int nr_cpus, nr_socks;
+static char buf[10];
+
+static int amd_energy_read_labels(struct device *dev,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel,
+				  const char **str)
+{
+	if (channel >= nr_cpus)
+		scnprintf(buf, 10, "Esocket%u", channel - nr_cpus);
+	else
+		scnprintf(buf, 10, "Ecore%03u", channel);
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
+static void amd_accumulate_delta(struct amd_energy_data *data,
+				 u64 input, int cu, bool is_core)
+{
+	input &= AMD_ENERGY_MASK;
+
+	mutex_lock(&data->lock);
+	if (!is_core) {
+		if (input >= data->sock_prev_value[cu])
+			data->sock_energy_ctrs[cu] +=
+				input - data->sock_prev_value[cu];
+		else
+			data->sock_energy_ctrs[cu] += UINT_MAX -
+				data->sock_prev_value[cu] + input;
+
+		data->sock_prev_value[cu] = input;
+	} else {
+		if (input >= data->core_prev_value[cu])
+			data->core_energy_ctrs[cu] +=
+				input - data->core_prev_value[cu];
+		else
+			data->core_energy_ctrs[cu] += UINT_MAX -
+				data->core_prev_value[cu] + input;
+
+		data->core_prev_value[cu] = input;
+	}
+	mutex_unlock(&data->lock);
+}
+
+static int read_accumulate(struct amd_energy_data *data)
+{
+	int ret, cu;
+	u64 input = 0, core_input = 0;
+	static int core_id;
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
+		amd_accumulate_delta(data, input, cu, false);
+	}
+
+	if (core_id >= nr_cpus)
+		core_id = 0;
+
+	if (!cpu_online(core_id)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	ret = rdmsrl_safe_on_cpu(core_id, ENERGY_CORE_MSR, &core_input);
+	if (ret)
+		goto out;
+
+	amd_accumulate_delta(data, core_input, core_id, true);
+
+out:
+	core_id++;
+	return ret;
+}
+
+static void amd_add_delta(struct amd_energy_data *data,
+			  u64 *input, int ch, bool is_core)
+{
+	mutex_lock(&data->lock);
+	if (!is_core) {
+		if (*input >= data->sock_prev_value[ch])
+			*input += data->sock_energy_ctrs[ch] -
+				  data->sock_prev_value[ch];
+		else
+			*input += UINT_MAX - data->sock_prev_value[ch] +
+				  data->sock_energy_ctrs[ch];
+	} else {
+		if (*input >= data->core_prev_value[ch])
+			*input += data->core_energy_ctrs[ch] -
+				 data->core_prev_value[ch];
+		else
+			*input += UINT_MAX - data->core_prev_value[ch] +
+				 data->core_energy_ctrs[ch];
+	}
+	mutex_unlock(&data->lock);
+}
+
+static int amd_energy_read(struct device *dev,
+			   enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct amd_energy_data *data = dev_get_drvdata(dev);
+	int ret, cpu;
+	u64 input;
+	bool is_core;
+
+	if (channel >= nr_cpus) {
+		is_core = false;
+		channel = channel - nr_cpus;
+		cpu = cpumask_first_and(cpu_online_mask,
+					cpumask_of_node
+					(channel));
+		ret = rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
+		if (ret)
+			return -EAGAIN;
+	} else {
+		is_core = true;
+		cpu = channel;
+		if (!cpu_online(cpu))
+			return -ENODEV;
+
+		ret = rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
+		if (ret)
+			return -EAGAIN;
+	}
+
+	input &= AMD_ENERGY_MASK;
+	amd_add_delta(data, &input, channel, is_core);
+
+	if (data->energy_units == 0 && get_energy_units(data))
+		return -EAGAIN;
+
+	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
+	*val = (long)div64_ul(input * 1000000UL,
+				      BIT(data->energy_units));
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
+static int energy_accumulator(void *p)
+{
+	struct amd_energy_data *data = (struct amd_energy_data *)p;
+
+	while (!kthread_should_stop()) {
+		/*
+		 * Ignoring the conditions such as
+		 * cpu being offline or rdmsr failure
+		 */
+		read_accumulate(data);
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (kthread_should_stop())
+			break;
+
+		/*
+		 * On a 240W system, with default resolution the
+		 * Socket Energy status register may wrap around in
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
+	int i, num_siblings;
+	u32 *s_config;
+	struct hwmon_channel_info *info = &data->energy_info;
+
+	/* Identify the number of siblings per core */
+	num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
+
+	nr_socks = num_possible_nodes();
+
+	/*
+	 * Energy counter register is accessed at core level.
+	 * Hence, filterout the siblings.
+	 */
+	nr_cpus = num_present_cpus()/num_siblings;
+
+	s_config = devm_kcalloc(dev, nr_cpus + nr_socks,
+				sizeof(u32), GFP_KERNEL);
+	if (!s_config)
+		return -ENOMEM;
+
+	data->sock_energy_ctrs = devm_kcalloc(dev, nr_socks,
+				sizeof(u64), GFP_KERNEL);
+	if (!data->sock_energy_ctrs)
+		return -ENOMEM;
+
+	data->core_energy_ctrs = devm_kcalloc(dev, nr_cpus,
+				sizeof(u64), GFP_KERNEL);
+	if (!data->core_energy_ctrs)
+		return -ENOMEM;
+
+	data->sock_prev_value = devm_kcalloc(dev, nr_socks,
+				sizeof(u64), GFP_KERNEL);
+	if (!data->sock_prev_value)
+		return -ENOMEM;
+
+	data->core_prev_value = devm_kcalloc(dev, nr_cpus,
+				sizeof(u64), GFP_KERNEL);
+	if (!data->core_prev_value)
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
+	wrap_accumulate = kthread_run(energy_accumulator, data,
+				      "%s", dev_name(hwmon_dev));
+	if (IS_ERR(wrap_accumulate))
+		return PTR_ERR(wrap_accumulate);
+
+	return PTR_ERR_OR_ZERO(wrap_accumulate);
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
+	if (ret)
+		return ret;
+
+	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
+	if (!amd_energy_platdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(amd_energy_platdev);
+	if (ret) {
+		platform_device_put(amd_energy_platdev);
+		platform_driver_unregister(&amd_energy_driver);
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

