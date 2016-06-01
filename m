Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:39555 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757713AbcFAKE6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 1 Jun 2016 06:04:58 -0400
From: Borislav Petkov <bp@alien8.de>
To: linux-hwmon@vger.kernel.org
Cc: X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (fam15h_power) Disable preemption when reading registers
Date: Wed,  1 Jun 2016 12:04:46 +0200
Message-Id: <1464775486-23446-1-git-send-email-bp@alien8.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

We need to read a bunch of registers on each compute unit and possibly
on the current CPU too. Disable preemption around it.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Rui Huang <ray.huang@amd.com>
Cc: Sherry Hurwitz <sherry.hurwitz@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/fam15h_power.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index eb97a9241d17..69bb810f528b 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -172,9 +172,9 @@ static void do_read_registers_on_cu(void *_data)
  */
 static int read_registers(struct fam15h_power_data *data)
 {
-	int this_cpu, ret, cpu;
 	int core, this_core;
 	cpumask_var_t mask;
+	int ret, cpu;
 
 	ret = zalloc_cpumask_var(&mask, GFP_KERNEL);
 	if (!ret)
@@ -183,7 +183,6 @@ static int read_registers(struct fam15h_power_data *data)
 	memset(data->cu_on, 0, sizeof(int) * MAX_CUS);
 
 	get_online_cpus();
-	this_cpu = smp_processor_id();
 
 	/*
 	 * Choose the first online core of each compute unit, and then
@@ -205,10 +204,13 @@ static int read_registers(struct fam15h_power_data *data)
 		cpumask_set_cpu(cpumask_any(topology_sibling_cpumask(cpu)), mask);
 	}
 
-	if (cpumask_test_cpu(this_cpu, mask))
+	preempt_disable();
+	smp_call_function_many(mask, do_read_registers_on_cu, data, true);
+
+	if (cpumask_test_cpu(smp_processor_id(), mask))
 		do_read_registers_on_cu(data);
 
-	smp_call_function_many(mask, do_read_registers_on_cu, data, true);
+	preempt_enable();
 	put_online_cpus();
 
 	free_cpumask_var(mask);
-- 
2.7.3

