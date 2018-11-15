Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40792 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728204AbeKOQBV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Nov 2018 11:01:21 -0500
Received: by mail-pl1-f196.google.com with SMTP id b22-v6so3501828pls.7
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Nov 2018 21:54:55 -0800 (PST)
From: Huacai Chen <chenhc@lemote.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>,
        Eric Biederman <ebiederm@xmission.com>
Subject: [PATCH V5 7/8] MIPS: Loongson64: Add kexec/kdump support
Date: Thu, 15 Nov 2018 13:50:56 +0800
Message-Id: <1542261057-6019-8-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
References: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add kexec/kdump support for Loongson64 by:
1, Provide Loongson-specific kexec functions: loongson_kexec_prepare,
   loongson_kexec_shutdown and loongson_crash_shutdown;
2, Provide Loongson-specific code in kexec_smp_wait;
3, Clear mailbox in loongson3_smp_setup() since KEXEC bypass BIOS;
4, KEXEC always run at boot-cpu, but KDUMP may triggered at non-boot-
   cpu. Loongson64 assume boot-cpu is the first possible cpu, so fix
   boot_cpu_id in prom_init_env();

Cc: Eric Biederman <ebiederm@xmission.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/relocate_kernel.S    | 26 ++++++++++
 arch/mips/loongson64/common/env.c     |  7 +++
 arch/mips/loongson64/common/reset.c   | 95 +++++++++++++++++++++++++++++++++++
 arch/mips/loongson64/loongson-3/smp.c |  5 ++
 4 files changed, 133 insertions(+)

diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
index 419c921..da281c5 100644
--- a/arch/mips/kernel/relocate_kernel.S
+++ b/arch/mips/kernel/relocate_kernel.S
@@ -135,6 +135,32 @@ LEAF(kexec_smp_wait)
 #else
 	sync
 #endif
+
+#ifdef CONFIG_CPU_LOONGSON3
+	/* s0:prid s1:initfn */
+	/* t0:base t1:cpuid t2:node t9:count */
+	mfc0  t1, CP0_EBASE
+	andi  t1, MIPS_EBASE_CPUNUM
+	dli   t0, 0x900000003ff01000 /* mailbox base */
+	dins  t0, t1, 8, 2        /* insert core id*/
+	dext  t2, t1, 2, 2
+	dins  t0, t2, 44, 2       /* insert node id */
+	mfc0  s0, CP0_PRID
+	andi  s0, s0, 0xf
+	blt   s0, 0x6, 1f         /* Loongson-3A1000 */
+	bgt   s0, 0x7, 1f         /* Loongson-3A2000/3A3000 */
+	dins  t0, t2, 14, 2       /* Loongson-3B1000/3B1500 need bit 15~14 */
+1:	li    t9, 0x100           /* wait for init loop */
+2:	addiu t9, -1              /* limit mailbox access */
+	bnez  t9, 2b
+	ld    s1, 0x20(t0)        /* get PC via mailbox */
+	beqz  s1, 1b
+	ld    sp, 0x28(t0)        /* get SP via mailbox */
+	ld    gp, 0x30(t0)        /* get GP via mailbox */
+	ld    a1, 0x38(t0)
+	jr    s1                  /* jump to initial PC */
+#endif
+
 	j		s1
 	END(kexec_smp_wait)
 #endif
diff --git a/arch/mips/loongson64/common/env.c b/arch/mips/loongson64/common/env.c
index d4f9979..d325ae6 100644
--- a/arch/mips/loongson64/common/env.c
+++ b/arch/mips/loongson64/common/env.c
@@ -149,6 +149,13 @@ void __init prom_init_env(void)
 	loongson_sysconf.nr_cpus = ecpu->nr_cpus;
 	loongson_sysconf.boot_cpu_id = ecpu->cpu_startup_core_id;
 	loongson_sysconf.reserved_cpus_mask = ecpu->reserved_cores_mask;
+#ifdef CONFIG_KEXEC
+	loongson_sysconf.boot_cpu_id = get_ebase_cpunum();
+	loongson_sysconf.reserved_cpus_mask |=
+		(1 << loongson_sysconf.boot_cpu_id) - 1;
+	pr_info("Boot CPU ID is being fixed from %d to %d\n",
+		ecpu->cpu_startup_core_id, loongson_sysconf.boot_cpu_id);
+#endif
 	if (ecpu->nr_cpus > NR_CPUS || ecpu->nr_cpus == 0)
 		loongson_sysconf.nr_cpus = NR_CPUS;
 	loongson_sysconf.nr_nodes = (loongson_sysconf.nr_cpus +
diff --git a/arch/mips/loongson64/common/reset.c b/arch/mips/loongson64/common/reset.c
index a60715e..58c3926 100644
--- a/arch/mips/loongson64/common/reset.c
+++ b/arch/mips/loongson64/common/reset.c
@@ -9,9 +9,14 @@
  * Copyright (C) 2009 Lemote, Inc.
  * Author: Zhangjin Wu, wuzhangjin@gmail.com
  */
+#include <linux/cpu.h>
+#include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/kexec.h>
 #include <linux/pm.h>
+#include <linux/slab.h>
 
+#include <asm/bootinfo.h>
 #include <asm/idle.h>
 #include <asm/reboot.h>
 
@@ -80,12 +85,102 @@ static void loongson_halt(void)
 	}
 }
 
+#ifdef CONFIG_KEXEC
+
+/* 0X80000000~0X80200000 is safe */
+#define MAX_ARGS	64
+#define KEXEC_CTRL_CODE	0xFFFFFFFF80100000UL
+#define KEXEC_ARGV_ADDR	0xFFFFFFFF80108000UL
+#define KEXEC_ARGV_SIZE	3060
+#define KEXEC_ENVP_SIZE	4500
+
+void *kexec_argv;
+void *kexec_envp;
+
+static int loongson_kexec_prepare(struct kimage *image)
+{
+	int i, argc = 0;
+	unsigned int *argv;
+	char *str, *ptr, *bootloader = "kexec";
+
+	/* argv at offset 0, argv[] at offset KEXEC_ARGV_SIZE/2 */
+	argv = (unsigned int *)kexec_argv;
+	argv[argc++] = (unsigned int)(KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2);
+
+	for (i = 0; i < image->nr_segments; i++) {
+		if (!strncmp(bootloader, (char *)image->segment[i].buf,
+				strlen(bootloader))) {
+			/*
+			 * convert command line string to array
+			 * of parameters (as bootloader does).
+			 */
+			int offt;
+			memcpy(kexec_argv + KEXEC_ARGV_SIZE/2,
+				image->segment[i].buf, KEXEC_ARGV_SIZE/2);
+			str = (char *)kexec_argv + KEXEC_ARGV_SIZE/2;
+			ptr = strchr(str, ' ');
+
+			while (ptr && (argc < MAX_ARGS)) {
+				*ptr = '\0';
+				if (ptr[1] != ' ') {
+					offt = (int)(ptr - str + 1);
+					argv[argc] = KEXEC_ARGV_ADDR +
+						KEXEC_ARGV_SIZE/2 + offt;
+					argc++;
+				}
+				ptr = strchr(ptr + 1, ' ');
+			}
+			break;
+		}
+	}
+
+	kexec_args[0] = argc;
+	kexec_args[1] = fw_arg1;
+	kexec_args[2] = fw_arg2;
+	image->control_code_page = virt_to_page((void *)KEXEC_CTRL_CODE);
+
+	return 0;
+}
+
+static void loongson_kexec_shutdown(void)
+{
+#ifdef CONFIG_SMP
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		if (!cpu_online(cpu))
+			cpu_up(cpu); /* All cpus go to reboot_code_buffer */
+#endif
+	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
+	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
+}
+
+static void loongson_crash_shutdown(struct pt_regs *regs)
+{
+	default_machine_crash_shutdown(regs);
+	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
+	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
+}
+
+#endif
+
 static int __init mips_reboot_setup(void)
 {
 	_machine_restart = loongson_restart;
 	_machine_halt = loongson_halt;
 	pm_power_off = loongson_poweroff;
 
+#ifdef CONFIG_KEXEC
+	kexec_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
+	kexec_envp = kmalloc(KEXEC_ENVP_SIZE, GFP_KERNEL);
+	fw_arg1 = KEXEC_ARGV_ADDR;
+	memcpy(kexec_envp, (void *)fw_arg2, KEXEC_ENVP_SIZE);
+
+	_machine_kexec_prepare = loongson_kexec_prepare;
+	_machine_kexec_shutdown = loongson_kexec_shutdown;
+	_machine_crash_shutdown = loongson_crash_shutdown;
+#endif
+
 	return 0;
 }
 
diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/loongson-3/smp.c
index bfaba5b..49ef958 100644
--- a/arch/mips/loongson64/loongson-3/smp.c
+++ b/arch/mips/loongson64/loongson-3/smp.c
@@ -388,6 +388,11 @@ static void __init loongson3_smp_setup(void)
 	ipi_status0_regs_init();
 	ipi_en0_regs_init();
 	ipi_mailbox_buf_init();
+
+	/* BIOS clear the mailbox, but KEXEC bypass BIOS so clear here */
+	for (i = 0; i < loongson_sysconf.nr_cpus; i++)
+		loongson3_ipi_write64(0, (void *)(ipi_mailbox_buf[i]+0x0));
+
 	cpu_set_core(&cpu_data[0],
 		     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
 	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
-- 
2.7.0
