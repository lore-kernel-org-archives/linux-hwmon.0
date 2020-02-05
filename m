Return-Path: <SRS0=vXYV=3Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E72C35247
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Feb 2020 21:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD10F2072B
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Feb 2020 21:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgBEVfP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Feb 2020 16:35:15 -0500
Received: from mga17.intel.com ([192.55.52.151]:9927 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727170AbgBEVfP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 5 Feb 2020 16:35:15 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 13:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; 
   d="scan'208";a="225954085"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2020 13:35:13 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1izSKG-000GFF-GH; Thu, 06 Feb 2020 05:35:12 +0800
Date:   Thu, 06 Feb 2020 05:34:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-playground] BUILD SUCCESS
 e87b2885cdc10d48e83be8b4f169a09a9f760593
Message-ID: <5e3b3501.U6HluggeeaRyjKTs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-playground
branch HEAD: e87b2885cdc10d48e83be8b4f169a09a9f760593  Merge branch 'hwmon-pmbus-phases' into hwmon-playground

elapsed time: 2880m

configs tested: 299
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
um                                  defconfig
nds32                               defconfig
sh                          rsk7269_defconfig
sparc64                          allmodconfig
i386                              allnoconfig
h8300                    h8300h-sim_defconfig
sparc                               defconfig
arc                                 defconfig
parisc                            allnoconfig
um                           x86_64_defconfig
s390                                defconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
ia64                             alldefconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
h8300                     edosk2674_defconfig
m68k                           sun3_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64               randconfig-a001-20200204
x86_64               randconfig-a002-20200204
x86_64               randconfig-a003-20200204
i386                 randconfig-a001-20200204
i386                 randconfig-a002-20200204
i386                 randconfig-a003-20200204
i386                 randconfig-a003-20200202
i386                 randconfig-a002-20200202
x86_64               randconfig-a003-20200202
i386                 randconfig-a001-20200202
x86_64               randconfig-a002-20200202
x86_64               randconfig-a001-20200202
riscv                randconfig-a001-20200204
alpha                randconfig-a001-20200205
m68k                 randconfig-a001-20200205
mips                 randconfig-a001-20200205
nds32                randconfig-a001-20200205
parisc               randconfig-a001-20200205
riscv                randconfig-a001-20200205
alpha                randconfig-a001-20200204
m68k                 randconfig-a001-20200204
mips                 randconfig-a001-20200204
nds32                randconfig-a001-20200204
parisc               randconfig-a001-20200204
alpha                randconfig-a001-20200203
m68k                 randconfig-a001-20200203
mips                 randconfig-a001-20200203
nds32                randconfig-a001-20200203
parisc               randconfig-a001-20200203
riscv                randconfig-a001-20200203
c6x                  randconfig-a001-20200204
h8300                randconfig-a001-20200204
microblaze           randconfig-a001-20200204
nios2                randconfig-a001-20200204
sparc64              randconfig-a001-20200204
c6x                  randconfig-a001-20200203
h8300                randconfig-a001-20200203
microblaze           randconfig-a001-20200203
nios2                randconfig-a001-20200203
sparc64              randconfig-a001-20200203
c6x                  randconfig-a001-20200205
h8300                randconfig-a001-20200205
microblaze           randconfig-a001-20200205
nios2                randconfig-a001-20200205
sparc64              randconfig-a001-20200205
csky                 randconfig-a001-20200202
openrisc             randconfig-a001-20200202
s390                 randconfig-a001-20200202
sh                   randconfig-a001-20200202
xtensa               randconfig-a001-20200202
sh                   randconfig-a001-20200203
s390                 randconfig-a001-20200203
csky                 randconfig-a001-20200203
xtensa               randconfig-a001-20200203
openrisc             randconfig-a001-20200203
x86_64               randconfig-b001-20200204
x86_64               randconfig-b002-20200204
x86_64               randconfig-b003-20200204
i386                 randconfig-b001-20200204
i386                 randconfig-b002-20200204
i386                 randconfig-b003-20200204
x86_64               randconfig-b001-20200202
x86_64               randconfig-b002-20200202
x86_64               randconfig-b003-20200202
i386                 randconfig-b001-20200202
i386                 randconfig-b002-20200202
i386                 randconfig-b003-20200202
x86_64               randconfig-b001-20200205
x86_64               randconfig-b002-20200205
x86_64               randconfig-b003-20200205
i386                 randconfig-b001-20200205
i386                 randconfig-b002-20200205
i386                 randconfig-b003-20200205
x86_64               randconfig-c001-20200204
x86_64               randconfig-c002-20200204
x86_64               randconfig-c003-20200204
i386                 randconfig-c001-20200204
i386                 randconfig-c002-20200204
i386                 randconfig-c003-20200204
x86_64               randconfig-c001-20200202
x86_64               randconfig-c002-20200202
x86_64               randconfig-c003-20200202
i386                 randconfig-c001-20200202
i386                 randconfig-c002-20200202
i386                 randconfig-c003-20200202
x86_64               randconfig-c001-20200206
x86_64               randconfig-c002-20200206
x86_64               randconfig-c003-20200206
i386                 randconfig-c001-20200206
i386                 randconfig-c002-20200206
i386                 randconfig-c003-20200206
x86_64               randconfig-c001-20200205
x86_64               randconfig-c002-20200205
x86_64               randconfig-c003-20200205
i386                 randconfig-c001-20200205
i386                 randconfig-c002-20200205
i386                 randconfig-c003-20200205
x86_64               randconfig-d003-20200202
i386                 randconfig-d001-20200202
x86_64               randconfig-d002-20200202
x86_64               randconfig-d001-20200202
i386                 randconfig-d003-20200202
i386                 randconfig-d002-20200202
x86_64               randconfig-d001-20200205
x86_64               randconfig-d002-20200205
x86_64               randconfig-d003-20200205
i386                 randconfig-d001-20200205
i386                 randconfig-d002-20200205
i386                 randconfig-d003-20200205
x86_64               randconfig-d001-20200204
x86_64               randconfig-d002-20200204
x86_64               randconfig-d003-20200204
i386                 randconfig-d001-20200204
i386                 randconfig-d002-20200204
i386                 randconfig-d003-20200204
x86_64               randconfig-e001-20200204
x86_64               randconfig-e002-20200204
x86_64               randconfig-e003-20200204
i386                 randconfig-e001-20200204
i386                 randconfig-e002-20200204
i386                 randconfig-e003-20200204
i386                 randconfig-e003-20200202
i386                 randconfig-e002-20200202
x86_64               randconfig-e001-20200202
x86_64               randconfig-e003-20200202
i386                 randconfig-e001-20200202
x86_64               randconfig-e002-20200202
x86_64               randconfig-e001-20200205
x86_64               randconfig-e002-20200205
x86_64               randconfig-e003-20200205
i386                 randconfig-e001-20200205
i386                 randconfig-e002-20200205
i386                 randconfig-e003-20200205
x86_64               randconfig-f001-20200204
x86_64               randconfig-f002-20200204
x86_64               randconfig-f003-20200204
i386                 randconfig-f001-20200204
i386                 randconfig-f002-20200204
i386                 randconfig-f003-20200204
i386                 randconfig-f002-20200202
i386                 randconfig-f003-20200202
x86_64               randconfig-f002-20200202
i386                 randconfig-f001-20200202
x86_64               randconfig-f001-20200202
x86_64               randconfig-f003-20200202
x86_64               randconfig-f001-20200205
x86_64               randconfig-f002-20200205
x86_64               randconfig-f003-20200205
i386                 randconfig-f001-20200205
i386                 randconfig-f002-20200205
i386                 randconfig-f003-20200205
x86_64               randconfig-g001-20200204
x86_64               randconfig-g002-20200204
x86_64               randconfig-g003-20200204
i386                 randconfig-g001-20200204
i386                 randconfig-g002-20200204
i386                 randconfig-g003-20200204
x86_64               randconfig-g001-20200205
x86_64               randconfig-g002-20200205
x86_64               randconfig-g003-20200205
i386                 randconfig-g001-20200205
i386                 randconfig-g002-20200205
i386                 randconfig-g003-20200205
x86_64               randconfig-g003-20200202
x86_64               randconfig-g001-20200202
i386                 randconfig-g001-20200202
x86_64               randconfig-g002-20200202
i386                 randconfig-g002-20200202
i386                 randconfig-g003-20200202
x86_64               randconfig-h001-20200204
x86_64               randconfig-h002-20200204
x86_64               randconfig-h003-20200204
i386                 randconfig-h001-20200204
i386                 randconfig-h002-20200204
i386                 randconfig-h003-20200204
x86_64               randconfig-h001-20200202
x86_64               randconfig-h002-20200202
x86_64               randconfig-h003-20200202
i386                 randconfig-h001-20200202
i386                 randconfig-h002-20200202
i386                 randconfig-h003-20200202
arc                  randconfig-a001-20200204
arm                  randconfig-a001-20200204
arm64                randconfig-a001-20200204
ia64                 randconfig-a001-20200204
powerpc              randconfig-a001-20200204
sparc                randconfig-a001-20200204
arc                  randconfig-a001-20200205
arm                  randconfig-a001-20200205
arm64                randconfig-a001-20200205
ia64                 randconfig-a001-20200205
powerpc              randconfig-a001-20200205
sparc                randconfig-a001-20200205
arc                  randconfig-a001-20200203
arm                  randconfig-a001-20200203
arm64                randconfig-a001-20200203
ia64                 randconfig-a001-20200203
powerpc              randconfig-a001-20200203
sparc                randconfig-a001-20200203
arc                  randconfig-a001-20200202
ia64                 randconfig-a001-20200202
sparc                randconfig-a001-20200202
arm64                randconfig-a001-20200202
arm                  randconfig-a001-20200202
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                             i386_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
