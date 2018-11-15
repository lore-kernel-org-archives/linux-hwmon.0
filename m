Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:53489 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbeKOSPU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Nov 2018 13:15:20 -0500
Received: by mail-it1-f194.google.com with SMTP id r12-v6so28122624ita.3
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Nov 2018 00:08:33 -0800 (PST)
MIME-Version: 1.0
References: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542261057-6019-1-git-send-email-chenhc@lemote.com>
From: Huacai Chen <chenhc@lemote.com>
Date: Thu, 15 Nov 2018 16:14:27 +0800
Message-ID: <CAAhV-H5J6grR7gvDXNKH_0beWFF5TG4ab3yS0Uic-nm1PBjMhQ@mail.gmail.com>
Subject: Re: [PATCH V5 0/8] MIPS: Loongson: new features and improvements
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        zhangfx <zhangfx@lemote.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

I'm sorry that I send this series to a wrong place, please ignore.

Huacai
On Thu, Nov 15, 2018 at 1:51 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> This patchset is prepared for the next 4.21 release for Linux/MIPS. It
> add Loongson-3A R2.1 basic support, adds "model name" and "CPU MHz"
> knobs in /proc/cpuinfo which is needed by some userspace tools, adds
> Loongson-3 kexec/kdump support, and introduces WAR_LLSC_MB to improve
> stability.
>
> V1 -> V2:
> 1, Add Loongson-3A R3.1 basic support.
> 2, Fix CPU UART irq delivery problem.
> 3, Improve code and descriptions (Thank James Hogan).
> 4, Sync the code to upstream.
>
> V2 -> V3:
> 1, Remove merged patches.
> 2, Improve code and descriptions (Thank James Hogan).
> 3, Sync the code to upstream.
>
> V3 -> V4:
> 1, Remove merged patches.
> 2, Improve kdump support.
> 3, Sync the code to upstream.
>
> V4 -> V5:
> 1, Remove merged patches.
> 2, Add Loongson-3A R2.1 support.
> 3, Improve kexec/kdump support.
> 4, Sync the code to upstream.
>
> Huacai Chen(8):
>  MIPS: Loongson: Add Loongson-3A R2.1 basic support.
>  MIPS: c-r4k: Add r4k_blast_scache_node for Loongson-3.
>  MIPS: Ensure pmd_present() returns false after pmd_mknotpresent().
>  MIPS: Add __cpu_full_name[] to make CPU names more human-readable.
>  MIPS: Align kernel load address to 64KB.
>  MIPS: Reserve extra memory for crash dump.
>  MIPS: Loongson: Add kexec/kdump support.
>  MIPS: Loongson: Introduce and use WAR_LLSC_MB.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/boot/compressed/calc_vmlinuz_load_addr.c |  7 +-
>  arch/mips/include/asm/atomic.h                     | 36 ++++++--
>  arch/mips/include/asm/barrier.h                    |  6 ++
>  arch/mips/include/asm/bitops.h                     | 15 ++++
>  arch/mips/include/asm/cmpxchg.h                    |  9 +-
>  arch/mips/include/asm/cpu-info.h                   |  2 +
>  arch/mips/include/asm/cpu.h                        |  3 +-
>  arch/mips/include/asm/edac.h                       |  5 +-
>  arch/mips/include/asm/futex.h                      | 18 ++--
>  arch/mips/include/asm/local.h                      | 10 ++-
>  arch/mips/include/asm/mach-loongson64/boot_param.h |  1 +
>  .../asm/mach-loongson64/kernel-entry-init.h        |  4 +-
>  arch/mips/include/asm/mach-loongson64/mmzone.h     |  1 +
>  arch/mips/include/asm/mmzone.h                     |  8 ++
>  arch/mips/include/asm/pgtable-64.h                 |  5 ++
>  arch/mips/include/asm/pgtable.h                    |  5 +-
>  arch/mips/include/asm/r4kcache.h                   | 21 +++++
>  arch/mips/include/asm/time.h                       |  2 +
>  arch/mips/kernel/cpu-probe.c                       | 28 +++++--
>  arch/mips/kernel/idle.c                            |  2 +-
>  arch/mips/kernel/proc.c                            |  6 ++
>  arch/mips/kernel/relocate_kernel.S                 | 26 ++++++
>  arch/mips/kernel/setup.c                           | 51 ++++++++++++
>  arch/mips/kernel/syscall.c                         |  2 +
>  arch/mips/kernel/time.c                            |  2 +
>  arch/mips/loongson64/Platform                      |  3 +
>  arch/mips/loongson64/common/env.c                  | 23 +++++-
>  arch/mips/loongson64/common/reset.c                | 95 ++++++++++++++++++++++
>  arch/mips/loongson64/loongson-3/smp.c              |  9 +-
>  arch/mips/loongson64/loongson-3/smp.h              |  1 +
>  arch/mips/mm/c-r4k.c                               | 46 +++++++++--
>  arch/mips/mm/tlbex.c                               | 11 +++
>  drivers/platform/mips/cpu_hwmon.c                  |  3 +-
>  33 files changed, 421 insertions(+), 45 deletions(-)
> --
> 2.7.0
