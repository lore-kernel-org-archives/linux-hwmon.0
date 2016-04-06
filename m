Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-bl2on0099.outbound.protection.outlook.com ([65.55.169.99]:63515
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754735AbcDFHnh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Apr 2016 03:43:37 -0400
From: Huang Rui <ray.huang@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Borislav Petkov" <bp@alien8.de>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 0/6] hwmon: (fam15h_power) Introduce an accumulated power reporting algorithm
Date: Wed, 6 Apr 2016 15:44:09 +0800
Message-ID: <1459928655-6071-1-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


Hi Guenter,

This serial of patches introduces an accumulated power reporting
algorithm. It will calculate the average power consumption for the
processor. The cpu feature flag is CPUID.8000_0007H:EDX[12].

This algorithm is used to test the comparison of processor power
consumption with between MWAITX delay and TSC delay on AMD Carrizo
platforms.

Reference:
https://lkml.kernel.org/r/1438744732-1459-1-git-send-email-ray.huang@amd.com

Commit f96756 at tip ("x86/asm: Add MONITORX/MWAITX instruction support")
Commit b466bd at tip ("x86/asm/delay: Introduce an MWAITX-based delay with a configurable timer")

V1: https://lkml.kernel.org/r/1440662866-28716-1-git-send-email-ray.huang@amd.com
V2: https://lkml.kernel.org/r/1445308109-17970-1-git-send-email-ray.huang@amd.com
V3: https://lkml.kernel.org/r/1446199024-1896-1-git-send-email-ray.huang@amd.com
V4: https://lkml.kernel.org/r/1457662670-3354-1-git-send-email-ray.huang@amd.com
V5: https://lkml.kernel.org/r/1459143136-2412-1-git-send-email-ray.huang@amd.com

On V5, I used the new x86 topology with compute unit id (cpu_core_id)
and compute unit numbers (x86_max_cores) for AMD processors. The
change and documentation will go to master soon as below link. And
This way is better to use smp_num_siblings which is un-defined
variable out of CONFIG_SMP.

On V6, Guenter, I suggest that you merge the v4.6-rc2 into your
hwmon-next branch. Because there are two commits (ee6825, 8196da)
which are the dependences of this patch set to fix the AMD compute
unit and max cores things. And you can see the new topology info at
Documentation/x86/topology.txt.

Changes from v1 -> v2:
- Move fam15h_power_groups and fam15h_power_group into fam15h_power_data to
  avoid overwrite on multi-CPU system.
- Rename FAM15H_MIN_NUM_ATTRS macro and fix return error code.
- Remove unnecessary warning print.
- Adds do_read_registers_on_cu to do all the read to all MSRs and run it on one
  of the online cores on each compute unit with smp_call_function_many().
- Use power1_average and power1_average_interval standard entry
  instread of power1_acc
- Fix the CPU-hotplug case.

Changes from v2 -> v3:
- As Guenter's suggestion, remove typecast, use &data->groups[0].
- Remove all "fam15_power_*" prefix at data.
- Remove unnecessary ( ).
- Fix the issue that is reported by build test robot, and add
  CPU_SUP_AMD as the dependence of fam15h_power
- Remove the WARN_ON at do_read_registers_on_cu, because it must be
  behind CPUID check. The MSR must be available since
  CPUID.8000_0007H:EDX[12] is set 
- Add get_online_cpus()/put_online_cpus() functions.
- Refine commments and the method which generate cpumask for cu.
- Add the interval scope to make the value suitable for user
  experience
- Remove the useless mutex.

Changes from v3 -> v4:
- Rebase the patches to latest groeck/hwmon-next.
- Use smp_num_siblings instead of cores_per_cu accessor.
- Refine the cpumask method which is inspired by perf solution.
- Fix some typo and errors.

Changes from v4 -> v5:
- Rebase patches to v4.6-rc1.
- Use new x86 topology with compute id (cpu_core_id) and compute unit
  number (x86_max_cores) instead of smp_num_siblings.

Changes from v5 -> v6:
- Remove unuse get_cpu/put_cpu.
- Update cpumask handling method with new topology.
- Use X86_FEATURE_ACC_POWER flag instead cpuid
- Add comments to explain default interval value and add documentation
  to explain how to modify the interval.

A simple example:

ray@hr-ub:~/tip$ sensors
fam15h_power-pci-00c4
Adapter: PCI adapter
power1:       19.58 mW (avg =   2.55 mW, interval =   0.01 s)
                       (crit =  15.00 W)

...

These patches are rebased on v4.6-rc2.

Thanks,
Rui


Huang Rui (6):
  hwmon: (fam15h_power) Add CPU_SUP_AMD as the dependence
  hwmon: (fam15h_power) Add compute unit accumulated power
  hwmon: (fam15h_power) Add ptsc counter value for accumulated power
  hwmon: (fam15h_power) Introduce a cpu accumulated power reporting
    algorithm
  hwmon: (fam15h_power) Add documentation for TDP and accumulated power
    algorithm
  hwmon: (fam15h_power) Add platform check function

 Documentation/hwmon/fam15h_power |  65 +++++++++++-
 drivers/hwmon/Kconfig            |   2 +-
 drivers/hwmon/fam15h_power.c     | 215 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 272 insertions(+), 10 deletions(-)

-- 
1.9.1

