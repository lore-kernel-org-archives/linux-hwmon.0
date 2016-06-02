Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:54290 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751315AbcFBH0e (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 2 Jun 2016 03:26:34 -0400
Date: Thu, 2 Jun 2016 09:26:19 +0200
From: Borislav Petkov <bp@alien8.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ingo Molnar <mingo@kernel.org>, linux-hwmon@vger.kernel.org,
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Message-ID: <20160602072619.GB10803@pd.tnic>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>
 <574EE1B3.9010704@roeck-us.net>
 <20160601134126.GB22373@pd.tnic>
 <20160601181509.GB10954@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160601181509.GB10954@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 01, 2016 at 11:15:09AM -0700, Guenter Roeck wrote:
> It would be great if you can add at least part of the BUG message as well
> as a Fixes: tag into the patch description.

How's that:

---
From: Borislav Petkov <bp@suse.de>
Date: Wed, 1 Jun 2016 11:36:13 +0200
Subject: [PATCH] hwmon: (fam15h_power) Disable preemption when reading registers

We need to read a bunch of registers on each compute unit and possibly
on the current CPU too. Disable preemption around it. Otherwise, you
get:

  BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/327
  caller is read_registers+0x6a/0x110 [fam15h_power]
  CPU: 3 PID: 327 Comm: systemd-udevd Not tainted 4.7.0-rc1+ #4
  Hardware name: HP HP EliteBook 745 G3/807E, BIOS N73 Ver. 01.08 01/28/2016
  ...

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Rui Huang <ray.huang@amd.com>
Cc: Sherry Hurwitz <sherry.hurwitz@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Fixes: fa7943449943 ("hwmon: (fam15h_power) Add compute unit accumulated power")
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

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
