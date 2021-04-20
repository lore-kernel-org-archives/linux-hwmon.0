Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE472C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 11:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A11A1613AE
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Apr 2021 11:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhDTLUw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Apr 2021 07:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhDTLUv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Apr 2021 07:20:51 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48DCC06174A
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Apr 2021 04:20:15 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id u80so5007424oia.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Apr 2021 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0kaFm7WGB2MgXgMmoW8oG2Fo0EYSNymuO+zvk2mXq2E=;
        b=rocaEDC5t57djeCVHxUIDnu36RO7PMtriVwpPPjnyz8zO01qWZFB0G7S9v5qObnawI
         92ZbrlUmpWiPRjp+24EKFTKuIUZxueb8dI0320hkfdW4AQoOHgodJCcBHbXf1gThOy+r
         H8cFE8s5+CQC0HE92rzW8hUY/Mlw5VMnkax0SJkCRsTj8p8b4ahkaby9XoGvI8VRo6uR
         mLvNExW/sPHh74aW1+AzHcqn4e1DwYfVL2rWopXSDJTdoWsVjzMy6mxJ5MzEOwfWNcSg
         qhCMN/W7QOmaSOTAw5IrmCKXd1WXA/7jN6CFTpx7BC1wliAB/hA7qA9sPJ4qb+Zoyf57
         CZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=0kaFm7WGB2MgXgMmoW8oG2Fo0EYSNymuO+zvk2mXq2E=;
        b=sj2TDfpYcBP5i+z9DpQaixXe498vCrXNhp3Xai4So4Cdt6yJwDN0DluQ6SqV7hJ0CA
         AHMuxTx6UXiUupsjWLswtiV/ckAGAfcwBHlsXUwHhOH6Qe74kmNb2m0sBFb1Z5VBR/a3
         C1OLxJr6pPxeFKdyeKB/xDrrYuEIeycyUoqnJKcDdXj3hDEMqDVNK404o2zzAsH/n1Xi
         X0bElcIGt3Q1gSi9DoZhrj1EJzR+u8rziTOBXJAe8VyE9AzP0k+/LcVICWhQlpSybh5o
         51mHXEma80D0ZzvK5aLBr4/GzQf2dgL6fjKiyHmDH2SgXRTdb0NQ5rmUIWQfH5l6dH7T
         Udcw==
X-Gm-Message-State: AOAM5321hmjBrlPd8iqLmSkOtKs53B+ZU1LoqhD0hYFW7iWgM5L0MtrQ
        pcvudN/52Bf9QiizCM/Yrc1q6xbgsBk=
X-Google-Smtp-Source: ABdhPJxrN/8vsU7TYWvOPTnTzfci5nfJ5HocYZLXgqfH2DuPBK1bAQETu0Y3CdYdy9xkPVpoHekTTA==
X-Received: by 2002:a05:6808:bcc:: with SMTP id o12mr2717692oik.93.1618917614583;
        Tue, 20 Apr 2021 04:20:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a73sm2243801oib.23.2021.04.20.04.20.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 04:20:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] hwmon: Remove amd_energy driver
Date:   Tue, 20 Apr 2021 04:20:11 -0700
Message-Id: <20210420112011.158160-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit 60268b0e8258 ("hwmon: (amd_energy) modify the visibility of
the counters") restricted visibility of AMD energy counters to work
around a side-channel attack using energy data to determine which
instructions are executed. The attack is described in 'PLATYPUS:
Software-based Power Side-Channel Attacks on x86'. It relies on quick
and accurate energy readings.

This change made the counters provided by the amd_energy driver
effectively unusable for non-provileged users. However, unprivileged
read access is the whole point of hardware monitoring attributes.

An attempt to remedy the situation by limiting and randomizing access
to chip registers was rejected by AMD. Since the driver is for all
practical purposes unusable, remove it.

Cc: Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Note:
    This submission supersedes the set of patches which was
    limiting and randomizing RAPL register access.

 Documentation/hwmon/amd_energy.rst | 119 ---------
 Documentation/hwmon/index.rst      |   1 -
 MAINTAINERS                        |   7 -
 drivers/hwmon/Kconfig              |  10 -
 drivers/hwmon/amd_energy.c         | 379 -----------------------------
 5 files changed, 516 deletions(-)
 delete mode 100644 Documentation/hwmon/amd_energy.rst
 delete mode 100644 drivers/hwmon/amd_energy.c

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
deleted file mode 100644
index 9d58cd5ee3da..000000000000
--- a/Documentation/hwmon/amd_energy.rst
+++ /dev/null
@@ -1,119 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Kernel driver amd_energy
-==========================
-
-Supported chips:
-
-* AMD Family 17h Processors: Model 30h
-
-* AMD Family 19h Processors: Model 01h
-
-  Prefix: 'amd_energy'
-
-  Addresses used:  RAPL MSRs
-
-  Datasheets:
-
-  - Processor Programming Reference (PPR) for AMD Family 17h Model 01h, Revision B1 Processors
-
-	https://developer.amd.com/wp-content/resources/55570-B1_PUB.zip
-
-  - Preliminary Processor Programming Reference (PPR) for AMD Family 17h Model 31h, Revision B0 Processors
-
-	https://developer.amd.com/wp-content/resources/56176_ppr_Family_17h_Model_71h_B0_pub_Rev_3.06.zip
-
-Author: Naveen Krishna Chatradhi <nchatrad@amd.com>
-
-Description
------------
-
-The Energy driver exposes the energy counters that are
-reported via the Running Average Power Limit (RAPL)
-Model-specific Registers (MSRs) via the hardware monitor
-(HWMON) sysfs interface.
-
-1. Power, Energy and Time Units
-   MSR_RAPL_POWER_UNIT/ C001_0299:
-   shared with all cores in the socket
-
-2. Energy consumed by each Core
-   MSR_CORE_ENERGY_STATUS/ C001_029A:
-   32-bitRO, Accumulator, core-level power reporting
-
-3. Energy consumed by Socket
-   MSR_PACKAGE_ENERGY_STATUS/ C001_029B:
-   32-bitRO, Accumulator, socket-level power reporting,
-   shared with all cores in socket
-
-These registers are updated every 1ms and cleared on
-reset of the system.
-
-Note: If SMT is enabled, Linux enumerates all threads as cpus.
-Since, the energy status registers are accessed at core level,
-reading those registers from the sibling threads would result
-in duplicate values. Hence, energy counter entries are not
-populated for the siblings.
-
-Energy Caluclation
-------------------
-
-Energy information (in Joules) is based on the multiplier,
-1/2^ESU; where ESU is an unsigned integer read from
-MSR_RAPL_POWER_UNIT register. Default value is 10000b,
-indicating energy status unit is 15.3 micro-Joules increment.
-
-Reported values are scaled as per the formula
-
-scaled value = ((1/2^ESU) * (Raw value) * 1000000UL) in uJoules
-
-Users calculate power for a given domain by calculating
-	dEnergy/dTime for that domain.
-
-Energy accumulation
---------------------------
-
-Current, Socket energy status register is 32bit, assuming a 240W
-2P system, the register would wrap around in
-
-	2^32*15.3 e-6/240 * 2 = 547.60833024 secs to wrap(~9 mins)
-
-The Core energy register may wrap around after several days.
-
-To improve the wrap around time, a kernel thread is implemented
-to accumulate the socket energy counters and one core energy counter
-per run to a respective 64-bit counter. The kernel thread starts
-running during probe, wakes up every 100secs and stops running
-when driver is removed.
-
-Frequency of the accumulator thread is set during the probe
-based on the chosen energy unit resolution. For example
-A. fine grain (1.625 micro J)
-B. course grain (0.125 milli J)
-
-A socket and core energy read would return the current register
-value added to the respective energy accumulator.
-
-Sysfs attributes
-----------------
-
-=============== ========  =====================================
-Attribute	Label	  Description
-===============	========  =====================================
-
-* For index N between [1] and [nr_cpus]
-
-===============	========  ======================================
-energy[N]_input EcoreX	  Core Energy   X = [0] to [nr_cpus - 1]
-			  Measured input core energy
-===============	========  ======================================
-
-* For N between [nr_cpus] and [nr_cpus + nr_socks]
-
-===============	========  ======================================
-energy[N]_input EsocketX  Socket Energy X = [0] to [nr_socks -1]
-			  Measured input socket energy
-=============== ========  ======================================
-
-Note: To address CVE-2020-12912, the visibility of the energy[N]_input
-attributes is restricted to owner and groups only.
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8d5a2df1ecb6..57e8c13a7e39 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -39,7 +39,6 @@ Hardware Monitoring Kernel Drivers
    adt7475
    aht10
    amc6821
-   amd_energy
    asb100
    asc7621
    aspeed-pwm-tacho
diff --git a/MAINTAINERS b/MAINTAINERS
index 9450e052f1b1..56a7c7518c18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -870,13 +870,6 @@ S:	Supported
 T:	git git://people.freedesktop.org/~agd5f/linux
 F:	drivers/gpu/drm/amd/display/
 
-AMD ENERGY DRIVER
-M:	Naveen Krishna Chatradhi <nchatrad@amd.com>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/amd_energy.rst
-F:	drivers/hwmon/amd_energy.c
-
 AMD FAM15H PROCESSOR POWER MONITORING DRIVER
 M:	Huang Rui <ray.huang@amd.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 54f04e61fb83..270dd8ff6965 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -321,16 +321,6 @@ config SENSORS_FAM15H_POWER
 	  This driver can also be built as a module. If so, the module
 	  will be called fam15h_power.
 
-config SENSORS_AMD_ENERGY
-	tristate "AMD RAPL MSR based Energy driver"
-	depends on X86
-	help
-	  If you say yes here you get support for core and package energy
-	  sensors, based on RAPL MSR for AMD family 17h and above CPUs.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called as amd_energy.
-
 config SENSORS_APPLESMC
 	tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
 	depends on INPUT && X86
diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
deleted file mode 100644
index a86cc8d6d93d..000000000000
--- a/drivers/hwmon/amd_energy.c
+++ /dev/null
@@ -1,379 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-/*
- * Copyright (C) 2020 Advanced Micro Devices, Inc.
- */
-#include <asm/cpu_device_id.h>
-
-#include <linux/bits.h>
-#include <linux/cpu.h>
-#include <linux/cpumask.h>
-#include <linux/delay.h>
-#include <linux/device.h>
-#include <linux/hwmon.h>
-#include <linux/kernel.h>
-#include <linux/kthread.h>
-#include <linux/list.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/processor.h>
-#include <linux/platform_device.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
-#include <linux/topology.h>
-#include <linux/types.h>
-
-#define DRVNAME			"amd_energy"
-
-#define ENERGY_PWR_UNIT_MSR	0xC0010299
-#define ENERGY_CORE_MSR		0xC001029A
-#define ENERGY_PKG_MSR		0xC001029B
-
-#define AMD_ENERGY_UNIT_MASK	0x01F00
-#define AMD_ENERGY_MASK		0xFFFFFFFF
-
-struct sensor_accumulator {
-	u64 energy_ctr;
-	u64 prev_value;
-};
-
-struct amd_energy_data {
-	struct hwmon_channel_info energy_info;
-	const struct hwmon_channel_info *info[2];
-	struct hwmon_chip_info chip;
-	struct task_struct *wrap_accumulate;
-	/* Lock around the accumulator */
-	struct mutex lock;
-	/* An accumulator for each core and socket */
-	struct sensor_accumulator *accums;
-	unsigned int timeout_ms;
-	/* Energy Status Units */
-	int energy_units;
-	int nr_cpus;
-	int nr_socks;
-	int core_id;
-	char (*label)[10];
-};
-
-static int amd_energy_read_labels(struct device *dev,
-				  enum hwmon_sensor_types type,
-				  u32 attr, int channel,
-				  const char **str)
-{
-	struct amd_energy_data *data = dev_get_drvdata(dev);
-
-	*str = data->label[channel];
-	return 0;
-}
-
-static void get_energy_units(struct amd_energy_data *data)
-{
-	u64 rapl_units;
-
-	rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
-	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
-}
-
-static void accumulate_delta(struct amd_energy_data *data,
-			     int channel, int cpu, u32 reg)
-{
-	struct sensor_accumulator *accum;
-	u64 input;
-
-	mutex_lock(&data->lock);
-	rdmsrl_safe_on_cpu(cpu, reg, &input);
-	input &= AMD_ENERGY_MASK;
-
-	accum = &data->accums[channel];
-	if (input >= accum->prev_value)
-		accum->energy_ctr +=
-			input - accum->prev_value;
-	else
-		accum->energy_ctr += UINT_MAX -
-			accum->prev_value + input;
-
-	accum->prev_value = input;
-	mutex_unlock(&data->lock);
-}
-
-static void read_accumulate(struct amd_energy_data *data)
-{
-	int sock, scpu, cpu;
-
-	for (sock = 0; sock < data->nr_socks; sock++) {
-		scpu = cpumask_first_and(cpu_online_mask,
-					 cpumask_of_node(sock));
-
-		accumulate_delta(data, data->nr_cpus + sock,
-				 scpu, ENERGY_PKG_MSR);
-	}
-
-	if (data->core_id >= data->nr_cpus)
-		data->core_id = 0;
-
-	cpu = data->core_id;
-	if (cpu_online(cpu))
-		accumulate_delta(data, cpu, cpu, ENERGY_CORE_MSR);
-
-	data->core_id++;
-}
-
-static void amd_add_delta(struct amd_energy_data *data, int ch,
-			  int cpu, long *val, u32 reg)
-{
-	struct sensor_accumulator *accum;
-	u64 input;
-
-	mutex_lock(&data->lock);
-	rdmsrl_safe_on_cpu(cpu, reg, &input);
-	input &= AMD_ENERGY_MASK;
-
-	accum = &data->accums[ch];
-	if (input >= accum->prev_value)
-		input += accum->energy_ctr -
-				accum->prev_value;
-	else
-		input += UINT_MAX - accum->prev_value +
-				accum->energy_ctr;
-
-	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
-	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
-
-	mutex_unlock(&data->lock);
-}
-
-static int amd_energy_read(struct device *dev,
-			   enum hwmon_sensor_types type,
-			   u32 attr, int channel, long *val)
-{
-	struct amd_energy_data *data = dev_get_drvdata(dev);
-	u32 reg;
-	int cpu;
-
-	if (channel >= data->nr_cpus) {
-		cpu = cpumask_first_and(cpu_online_mask,
-					cpumask_of_node
-					(channel - data->nr_cpus));
-		reg = ENERGY_PKG_MSR;
-	} else {
-		cpu = channel;
-		if (!cpu_online(cpu))
-			return -ENODEV;
-
-		reg = ENERGY_CORE_MSR;
-	}
-	amd_add_delta(data, channel, cpu, val, reg);
-
-	return 0;
-}
-
-static umode_t amd_energy_is_visible(const void *_data,
-				     enum hwmon_sensor_types type,
-				     u32 attr, int channel)
-{
-	return 0440;
-}
-
-static int energy_accumulator(void *p)
-{
-	struct amd_energy_data *data = (struct amd_energy_data *)p;
-	unsigned int timeout = data->timeout_ms;
-
-	while (!kthread_should_stop()) {
-		/*
-		 * Ignoring the conditions such as
-		 * cpu being offline or rdmsr failure
-		 */
-		read_accumulate(data);
-
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (kthread_should_stop())
-			break;
-
-		schedule_timeout(msecs_to_jiffies(timeout));
-	}
-	return 0;
-}
-
-static const struct hwmon_ops amd_energy_ops = {
-	.is_visible = amd_energy_is_visible,
-	.read = amd_energy_read,
-	.read_string = amd_energy_read_labels,
-};
-
-static int amd_create_sensor(struct device *dev,
-			     struct amd_energy_data *data,
-			     enum hwmon_sensor_types type, u32 config)
-{
-	struct hwmon_channel_info *info = &data->energy_info;
-	struct sensor_accumulator *accums;
-	int i, num_siblings, cpus, sockets;
-	u32 *s_config;
-	char (*label_l)[10];
-
-	/* Identify the number of siblings per core */
-	num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
-
-	sockets = num_possible_nodes();
-
-	/*
-	 * Energy counter register is accessed at core level.
-	 * Hence, filterout the siblings.
-	 */
-	cpus = num_present_cpus() / num_siblings;
-
-	s_config = devm_kcalloc(dev, cpus + sockets + 1,
-				sizeof(u32), GFP_KERNEL);
-	if (!s_config)
-		return -ENOMEM;
-
-	accums = devm_kcalloc(dev, cpus + sockets,
-			      sizeof(struct sensor_accumulator),
-			      GFP_KERNEL);
-	if (!accums)
-		return -ENOMEM;
-
-	label_l = devm_kcalloc(dev, cpus + sockets,
-			       sizeof(*label_l), GFP_KERNEL);
-	if (!label_l)
-		return -ENOMEM;
-
-	info->type = type;
-	info->config = s_config;
-
-	data->nr_cpus = cpus;
-	data->nr_socks = sockets;
-	data->accums = accums;
-	data->label = label_l;
-
-	for (i = 0; i < cpus + sockets; i++) {
-		s_config[i] = config;
-		if (i < cpus)
-			scnprintf(label_l[i], 10, "Ecore%03u", i);
-		else
-			scnprintf(label_l[i], 10, "Esocket%u", (i - cpus));
-	}
-
-	s_config[i] = 0;
-	return 0;
-}
-
-static int amd_energy_probe(struct platform_device *pdev)
-{
-	struct device *hwmon_dev;
-	struct amd_energy_data *data;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	data = devm_kzalloc(dev,
-			    sizeof(struct amd_energy_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->chip.ops = &amd_energy_ops;
-	data->chip.info = data->info;
-
-	dev_set_drvdata(dev, data);
-	/* Populate per-core energy reporting */
-	data->info[0] = &data->energy_info;
-	ret = amd_create_sensor(dev, data, hwmon_energy,
-				HWMON_E_INPUT | HWMON_E_LABEL);
-	if (ret)
-		return ret;
-
-	mutex_init(&data->lock);
-	get_energy_units(data);
-
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
-							 data,
-							 &data->chip,
-							 NULL);
-	if (IS_ERR(hwmon_dev))
-		return PTR_ERR(hwmon_dev);
-
-	/*
-	 * On a system with peak wattage of 250W
-	 * timeout = 2 ^ 32 / 2 ^ energy_units / 250 secs
-	 */
-	data->timeout_ms = 1000 *
-			   BIT(min(28, 31 - data->energy_units)) / 250;
-
-	data->wrap_accumulate = kthread_run(energy_accumulator, data,
-					    "%s", dev_name(hwmon_dev));
-	return PTR_ERR_OR_ZERO(data->wrap_accumulate);
-}
-
-static int amd_energy_remove(struct platform_device *pdev)
-{
-	struct amd_energy_data *data = dev_get_drvdata(&pdev->dev);
-
-	if (data && data->wrap_accumulate)
-		kthread_stop(data->wrap_accumulate);
-
-	return 0;
-}
-
-static const struct platform_device_id amd_energy_ids[] = {
-	{ .name = DRVNAME, },
-	{}
-};
-MODULE_DEVICE_TABLE(platform, amd_energy_ids);
-
-static struct platform_driver amd_energy_driver = {
-	.probe = amd_energy_probe,
-	.remove	= amd_energy_remove,
-	.id_table = amd_energy_ids,
-	.driver = {
-		.name = DRVNAME,
-	},
-};
-
-static struct platform_device *amd_energy_platdev;
-
-static const struct x86_cpu_id cpu_ids[] __initconst = {
-	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
-	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x01, NULL),
-	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x30, NULL),
-	{}
-};
-MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
-
-static int __init amd_energy_init(void)
-{
-	int ret;
-
-	if (!x86_match_cpu(cpu_ids))
-		return -ENODEV;
-
-	ret = platform_driver_register(&amd_energy_driver);
-	if (ret)
-		return ret;
-
-	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
-	if (!amd_energy_platdev) {
-		platform_driver_unregister(&amd_energy_driver);
-		return -ENOMEM;
-	}
-
-	ret = platform_device_add(amd_energy_platdev);
-	if (ret) {
-		platform_device_put(amd_energy_platdev);
-		platform_driver_unregister(&amd_energy_driver);
-		return ret;
-	}
-
-	return ret;
-}
-
-static void __exit amd_energy_exit(void)
-{
-	platform_device_unregister(amd_energy_platdev);
-	platform_driver_unregister(&amd_energy_driver);
-}
-
-module_init(amd_energy_init);
-module_exit(amd_energy_exit);
-
-MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via HWMON interface");
-MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
-MODULE_LICENSE("GPL");
-- 
2.17.1

