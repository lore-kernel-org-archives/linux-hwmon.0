Return-Path: <SRS0=LqIa=7B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36579C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 May 2020 15:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E32CD20708
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 May 2020 15:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="WBrNARdC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgESPue (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 May 2020 11:50:34 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:1957
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728534AbgESPue (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 May 2020 11:50:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3KvrEvNxhGakb+xUrh3SmXHbz3eS15bb4R8pU/c5VteR/5ZmTsMh62Se47usxYnc6DHJxFFs3o90/dLhLqk9XEVoi/jYZ1vUT0AkpkjwneTI8ZZvrL/8jSW5kbcne6UqE1wkjVtTHI3qqX3CBcWCEkGjMCiLA6TtTO19XNWd8XWMoYKkNXXtB4+eNcJGb84RXMsL5b3qn/iKwwX6KEoW2369xJyUPCNzpURZrp824ckxazodfdiyvImeRALACgVAMYYOEnG3r+kLmNXuJVDaWO2D4Oy8BdxlgntOEy/01peOm0OaochEl2qQvMw24I3m7LopeAxXBdRU0o/aeEObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjS+DdiUtUm4QhHaYpEXZsYsGGt4lSCj1oVBFk+4MlU=;
 b=nRsBvjGXE6dpicSOmrPCnfbwwPfBFO4SSMNItK6Ripq5V/QGYF2v0owAuYc8F7i98uTzxhsCTialKbGZIkfB3tZwfdFu+wWHzHYkCFSv23g5HbsgJmWgKykjLmm/GdDpP/0K/2XtjmSz8Bhz3oVxpAWjqEFEw1buCsFE7MYgarcDRFnj/4SWS9bdtaXwfeb7Y/EyPKtPp+SVdJ+FxF43skgaNu4NBkadxLXbvctuLmMeipXX8OGqswRHhlLt5Q2D/sIsfPRT3xYf3Dy4pz1wBO1J0weL+7cHptoY7YLALzpk4JI7fxCDHfhTdJ75IX43rTiLzoNtY1lsMKMhR/SGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjS+DdiUtUm4QhHaYpEXZsYsGGt4lSCj1oVBFk+4MlU=;
 b=WBrNARdCK3G7DHsW7PMwb3gMvtvVp+mBl8FzAhMiFmMyOGDD3f1AgzymoD6yHAk64zF0er3Saqx0kL2G0ZTt56KEADjDSvDOU5u5PWE1FOB7uY7sCimxJEoWyNKK64pbtfZAuPtWqiFy30WahdwUp01a5EsZnkuUDZpaY4GEhFI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Tue, 19 May
 2020 15:50:29 +0000
Received: from BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2]) by BY5PR12MB4212.namprd12.prod.outlook.com
 ([fe80::9ce:3ab2:f0ee:47b2%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 15:50:29 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy counters
Date:   Tue, 19 May 2020 21:20:09 +0530
Message-Id: <20200519155011.56184-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::12) To BY5PR12MB4212.namprd12.prod.outlook.com
 (2603:10b6:a03:202::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Tue, 19 May 2020 15:50:27 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3893cfb3-f4d2-4348-9351-08d7fc0c5ae0
X-MS-TrafficTypeDiagnostic: BY5PR12MB4051:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB405161665DF2F5EBC6BB0370E8B90@BY5PR12MB4051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HcS68USLqhcSwXZM5o+heMp6yQAA23FfvGgGB8VobCxmWSdTAVcAQwDCSpeDFfBhyjDMpe6wAgQqu1VLURNrWwMzqe5q1tETeeA8Csk5vDGUl9I6WMB3aP9zgnKNeoHDwolxKxczSvaUk3ASJXlb9pyjqHeQOgVRvxbDycnHafhWDJ0fYcgZtRQx/5fYnVC0rYZTA/mfYGEGQZXPewrCgsjf+a4Ov25ivn2RU6ht3+xEzIM/+GJRkNMfPQBwijT0rLcdnDT+T6lwB0dvUTJalDukxJ3s8/p0nUUKYpEMXDrvzFDtpFOhTs1sap5iBgH2qKadrjW8+MI7zaB5xZXmDN66QJzocVT/yxtegO5Jl89e1b2kS3KnV3VI7QiIPl86H2CIrkv6U/VFHryzF7CSVzZD4rb9ARkORGP/i5q3supiVs//T+lYIrQtoaouMPlezH8QSLsQ0CXUDLBacz8lvTG2FxlR4KAVQR9VynkU6+mUKwJTzn7P84Q//8qUZ/M+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(16526019)(316002)(186003)(2616005)(956004)(26005)(52116002)(36756003)(1076003)(6916009)(54906003)(4326008)(8936002)(7696005)(5660300002)(30864003)(66476007)(66946007)(66556008)(2906002)(6486002)(8676002)(6666004)(478600001)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: l66+a815+jRESE9fKbr9i6HfB9QbJ8JXbSnhfnHEIBYmm0LC7OYFMYFjVjr9se8fV+D5RYpawZ6BJSEjATtuAGzxYTd5LlWYOJLkxBmypzyEItYAoNJbcKQ0mh9Z/dOFuRe1MhSnNNJns4vXSeLrz1U+MEcgpu70V4gvfONXyoFtQxgazF6tIauKpnjogOYeF/qcUaZykiDAyQXG/82FHi+iV5X721oMj2vCzxycUMmlYyZi8HFMOWg49pfIwii5EJWNqHCk5Vz05t5B0WNqfjBan7Sf/TfJhbyym4Q5Uhc6I4fNJ9V9qflbu2Q/nAzgIyg1VJu1gA5dSUiRTBO0as3Gt6aGBdRTeoYAHLh5+NSVfxK0y6V4tNSq2LWhROIpDmnX1MXklHFEyJNwbCBfBgpAHKovHqAIHs30zFoT4GUu/gRGCBlM+Sh1Ff2ZNsHEQqLyqySB4xVkuJMHv+EXuyNDe2gG5L8triR7sA+KA/DM1ByUHVdPd6nT4FktZh5O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3893cfb3-f4d2-4348-9351-08d7fc0c5ae0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 15:50:29.3387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeU/Yjn+v3U3X4AEnawkazjP4MXqoQ92KnJ5SkX3h7ii7Zsx2iC2F+f2QFbwRPumDuNdt9Uv8IE5K5mOxvEc/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
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
Changes in v7:
1. Move all static variables into the data structure
2. Move the read-update code under the mutex lock

 drivers/hwmon/Kconfig      |  10 +
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/amd_energy.c | 406 +++++++++++++++++++++++++++++++++++++
 3 files changed, 417 insertions(+)
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
index 000000000000..bc8b643a37d5
--- /dev/null
+++ b/drivers/hwmon/amd_energy.c
@@ -0,0 +1,406 @@
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
+struct sensor_accumulator {
+	u64 energy_ctr;
+	u64 prev_value;
+	char label[10];
+};
+
+struct amd_energy_data {
+	struct hwmon_channel_info energy_info;
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_chip_info chip;
+	struct task_struct *wrap_accumulate;
+	/* Lock around the accumulator */
+	struct mutex lock;
+	/* An accumulator for each core and socket */
+	struct sensor_accumulator *accums;
+	/* Energy Status Units */
+	u64 energy_units;
+	int nr_cpus;
+	int nr_socks;
+	int core_id;
+};
+
+static int amd_energy_read_labels(struct device *dev,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel,
+				  const char **str)
+{
+	struct amd_energy_data *data = dev_get_drvdata(dev);
+
+	*str = data->accums[channel].label;
+	return 0;
+}
+
+static void get_energy_units(struct amd_energy_data *data)
+{
+	u64 rapl_units;
+
+	rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
+	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
+}
+
+static void accumulate_socket_delta(struct amd_energy_data *data,
+				    int sock, int cpu)
+{
+	struct sensor_accumulator *s_accum;
+	u64 input;
+
+	mutex_lock(&data->lock);
+	rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
+	input &= AMD_ENERGY_MASK;
+
+	s_accum = &data->accums[data->nr_cpus + sock];
+	if (input >= s_accum->prev_value)
+		s_accum->energy_ctr +=
+			input - s_accum->prev_value;
+	else
+		s_accum->energy_ctr += UINT_MAX -
+			s_accum->prev_value + input;
+
+	s_accum->prev_value = input;
+	mutex_unlock(&data->lock);
+}
+
+static void accumulate_core_delta(struct amd_energy_data *data)
+{
+	struct sensor_accumulator *c_accum;
+	u64 input;
+	int cpu;
+
+	mutex_lock(&data->lock);
+	if (data->core_id >= data->nr_cpus)
+		data->core_id = 0;
+
+	cpu = data->core_id;
+
+	if (!cpu_online(cpu))
+		goto out;
+
+	rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
+	input &= AMD_ENERGY_MASK;
+
+	c_accum = &data->accums[cpu];
+
+	if (input >= c_accum->prev_value)
+		c_accum->energy_ctr +=
+			input - c_accum->prev_value;
+	else
+		c_accum->energy_ctr += UINT_MAX -
+			c_accum->prev_value + input;
+
+	c_accum->prev_value = input;
+
+out:
+	data->core_id++;
+	mutex_unlock(&data->lock);
+}
+
+static void read_accumulate(struct amd_energy_data *data)
+{
+	int sock;
+
+	for (sock = 0; sock < data->nr_socks; sock++) {
+		int cpu;
+
+		cpu = cpumask_first_and(cpu_online_mask,
+					cpumask_of_node(sock));
+
+		accumulate_socket_delta(data, sock, cpu);
+	}
+
+	accumulate_core_delta(data);
+}
+
+static void amd_add_delta(struct amd_energy_data *data, int ch,
+			  int cpu, long *val, bool is_core)
+{
+	struct sensor_accumulator *s_accum, *c_accum;
+	u64 input;
+
+	mutex_lock(&data->lock);
+	if (!is_core) {
+		rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
+		input &= AMD_ENERGY_MASK;
+
+		s_accum = &data->accums[ch];
+		if (input >= s_accum->prev_value)
+			input += s_accum->energy_ctr -
+				  s_accum->prev_value;
+		else
+			input += UINT_MAX - s_accum->prev_value +
+				  s_accum->energy_ctr;
+	} else {
+		rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
+		input &= AMD_ENERGY_MASK;
+
+		c_accum = &data->accums[ch];
+		if (input >= c_accum->prev_value)
+			input += c_accum->energy_ctr -
+				 c_accum->prev_value;
+		else
+			input += UINT_MAX - c_accum->prev_value +
+				 c_accum->energy_ctr;
+	}
+
+	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
+	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
+
+	mutex_unlock(&data->lock);
+}
+
+static int amd_energy_read(struct device *dev,
+			   enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct amd_energy_data *data = dev_get_drvdata(dev);
+	int cpu;
+
+	if (channel >= data->nr_cpus) {
+		cpu = cpumask_first_and(cpu_online_mask,
+					cpumask_of_node
+					(channel - data->nr_cpus));
+		amd_add_delta(data, channel, cpu, val, false);
+	} else {
+		cpu = channel;
+		if (!cpu_online(cpu))
+			return -ENODEV;
+
+		amd_add_delta(data, channel, cpu, val, true);
+	}
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
+	struct hwmon_channel_info *info = &data->energy_info;
+	struct sensor_accumulator *accums;
+	int i, num_siblings, cpus, sockets;
+	u32 *s_config;
+
+	/* Identify the number of siblings per core */
+	num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
+
+	sockets = num_possible_nodes();
+
+	/*
+	 * Energy counter register is accessed at core level.
+	 * Hence, filterout the siblings.
+	 */
+	cpus = num_present_cpus() / num_siblings;
+
+	s_config = devm_kcalloc(dev, cpus + sockets,
+				sizeof(u32), GFP_KERNEL);
+	if (!s_config)
+		return -ENOMEM;
+
+	accums = devm_kcalloc(dev, cpus + sockets,
+			      sizeof(struct sensor_accumulator),
+			      GFP_KERNEL);
+	if (!accums)
+		return -ENOMEM;
+
+	info->type = type;
+	info->config = s_config;
+
+	data->nr_cpus = cpus;
+	data->nr_socks = sockets;
+	data->accums = accums;
+
+	for (i = 0; i < cpus + sockets; i++) {
+		s_config[i] = config;
+		if (i < cpus)
+			scnprintf(accums[i].label, 10,
+				  "Ecore%03u", i);
+		else
+			scnprintf(accums[i].label, 10,
+				  "Esocket%u", (i - cpus));
+	}
+
+	return 0;
+}
+
+static int amd_energy_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev;
+	struct amd_energy_data *data;
+	struct device *dev = &pdev->dev;
+
+	data = devm_kzalloc(dev,
+			    sizeof(struct amd_energy_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chip.ops = &amd_energy_ops;
+	data->chip.info = data->info;
+
+	dev_set_drvdata(dev, data);
+	/* Populate per-core energy reporting */
+	data->info[0] = &data->energy_info;
+	amd_create_sensor(dev, data, hwmon_energy,
+			  HWMON_E_INPUT | HWMON_E_LABEL);
+
+	mutex_init(&data->lock);
+	get_energy_units(data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
+							 data,
+							 &data->chip,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	data->wrap_accumulate = kthread_run(energy_accumulator, data,
+					    "%s", dev_name(hwmon_dev));
+	if (IS_ERR(data->wrap_accumulate))
+		return PTR_ERR(data->wrap_accumulate);
+
+	return PTR_ERR_OR_ZERO(data->wrap_accumulate);
+}
+
+static int amd_energy_remove(struct platform_device *pdev)
+{
+	struct amd_energy_data *data = dev_get_drvdata(&pdev->dev);
+
+	if (data && data->wrap_accumulate)
+		kthread_stop(data->wrap_accumulate);
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

