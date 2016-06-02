Return-path: <bp@alien8.de>
Date: Thu, 2 Jun 2016 10:14:39 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>,
	linux-hwmon@vger.kernel.org, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers
Message-ID: <20160602081439.GD10803@pd.tnic>
References: <1464775486-23446-1-git-send-email-bp@alien8.de>
 <574EE1B3.9010704@roeck-us.net>
 <20160601134126.GB22373@pd.tnic>
 <20160601181509.GB10954@roeck-us.net>
 <20160602072619.GB10803@pd.tnic>
 <alpine.DEB.2.11.1606020946430.3629@nanos>
 <20160602075830.GC10803@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160602075830.GC10803@pd.tnic>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Jun 02, 2016 at 09:58:30AM +0200, Borislav Petkov wrote:
> Ha, very nice! Let me try it.

Yap, much better than opencoding on_each_cpu_mask() :-)

---
From: Borislav Petkov <bp@suse.de>
Date: Wed, 1 Jun 2016 11:36:13 +0200
Subject: [PATCH] hwmon: (fam15h_power) Disable preemption when reading
 registers

We need to read a bunch of registers on each compute unit and possibly
on the current CPU too. Disable preemption around it. Otherwise, you
get:

  BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/327
  caller is read_registers+0x6a/0x110 [fam15h_power]
  CPU: 3 PID: 327 Comm: systemd-udevd Not tainted 4.7.0-rc1+ #4
  Hardware name: HP HP EliteBook 745 G3/807E, BIOS N73 Ver. 01.08 01/28/2016
  ...

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Rui Huang <ray.huang@amd.com>
Cc: Sherry Hurwitz <sherry.hurwitz@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Fixes: fa7943449943 ("hwmon: (fam15h_power) Add compute unit accumulated power")
---
 drivers/hwmon/fam15h_power.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index eb97a9241d17..15aa49d082c4 100644
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
@@ -205,12 +204,9 @@ static int read_registers(struct fam15h_power_data *data)
 		cpumask_set_cpu(cpumask_any(topology_sibling_cpumask(cpu)), mask);
 	}
 
-	if (cpumask_test_cpu(this_cpu, mask))
-		do_read_registers_on_cu(data);
+	on_each_cpu_mask(mask, do_read_registers_on_cu, data, true);
 
-	smp_call_function_many(mask, do_read_registers_on_cu, data, true);
 	put_online_cpus();
-
 	free_cpumask_var(mask);
 
 	return 0;
-- 
2.7.3


-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
