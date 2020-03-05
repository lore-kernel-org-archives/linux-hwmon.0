Return-Path: <SRS0=ilVt=4W=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF038C3F2CD
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Mar 2020 10:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B639F208CD
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Mar 2020 10:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgCEKlD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 5 Mar 2020 05:41:03 -0500
Received: from mga01.intel.com ([192.55.52.88]:54327 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCEKlD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 5 Mar 2020 05:41:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 02:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,517,1574150400"; 
   d="scan'208";a="320169710"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Mar 2020 02:41:00 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j9nw4-0009NO-74; Thu, 05 Mar 2020 18:41:00 +0800
Date:   Thu, 05 Mar 2020 18:40:36 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 44f2f882909fedfc3a56e4b90026910456019743
Message-ID: <5e60d724.HGmRchIX5radBTsZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 44f2f882909fedfc3a56e4b90026910456019743  hwmon: (adt7462) Fix an error return in ADT7462_REG_VOLT()

elapsed time: 2250m

configs tested: 175
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
h8300                     edosk2674_defconfig
mips                              allnoconfig
microblaze                    nommu_defconfig
riscv                             allnoconfig
sparc64                          allyesconfig
sh                          rsk7269_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
arm64                            allmodconfig
arm                              allmodconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
alpha                randconfig-a001-20200304
m68k                 randconfig-a001-20200304
mips                 randconfig-a001-20200304
nds32                randconfig-a001-20200304
parisc               randconfig-a001-20200304
riscv                randconfig-a001-20200304
alpha                randconfig-a001-20200303
m68k                 randconfig-a001-20200303
mips                 randconfig-a001-20200303
nds32                randconfig-a001-20200303
parisc               randconfig-a001-20200303
riscv                randconfig-a001-20200303
sparc64              randconfig-a001-20200303
microblaze           randconfig-a001-20200303
c6x                  randconfig-a001-20200303
nios2                randconfig-a001-20200303
h8300                randconfig-a001-20200303
csky                 randconfig-a001-20200303
openrisc             randconfig-a001-20200303
s390                 randconfig-a001-20200303
sh                   randconfig-a001-20200303
xtensa               randconfig-a001-20200303
csky                 randconfig-a001-20200304
openrisc             randconfig-a001-20200304
s390                 randconfig-a001-20200304
sh                   randconfig-a001-20200304
xtensa               randconfig-a001-20200304
x86_64               randconfig-b001-20200303
x86_64               randconfig-b002-20200303
x86_64               randconfig-b003-20200303
i386                 randconfig-b001-20200303
i386                 randconfig-b002-20200303
i386                 randconfig-b003-20200303
i386                 randconfig-c002-20200303
x86_64               randconfig-c003-20200303
i386                 randconfig-c001-20200303
x86_64               randconfig-c002-20200303
i386                 randconfig-c003-20200303
x86_64               randconfig-c001-20200303
x86_64               randconfig-c001-20200304
x86_64               randconfig-c002-20200304
x86_64               randconfig-c003-20200304
i386                 randconfig-c001-20200304
i386                 randconfig-c002-20200304
i386                 randconfig-c003-20200304
x86_64               randconfig-d001-20200303
x86_64               randconfig-d002-20200303
x86_64               randconfig-d003-20200303
i386                 randconfig-d001-20200303
i386                 randconfig-d002-20200303
i386                 randconfig-d003-20200303
x86_64               randconfig-e001-20200303
x86_64               randconfig-e002-20200303
x86_64               randconfig-e003-20200303
i386                 randconfig-e001-20200303
i386                 randconfig-e002-20200303
i386                 randconfig-e003-20200303
x86_64               randconfig-e001-20200304
x86_64               randconfig-e002-20200304
x86_64               randconfig-e003-20200304
i386                 randconfig-e001-20200304
i386                 randconfig-e002-20200304
i386                 randconfig-e003-20200304
x86_64               randconfig-g001-20200303
x86_64               randconfig-g002-20200303
x86_64               randconfig-g003-20200303
i386                 randconfig-g001-20200303
i386                 randconfig-g002-20200303
i386                 randconfig-g003-20200303
x86_64               randconfig-h001-20200304
x86_64               randconfig-h002-20200304
x86_64               randconfig-h003-20200304
i386                 randconfig-h001-20200304
i386                 randconfig-h002-20200304
i386                 randconfig-h003-20200304
arc                  randconfig-a001-20200303
arm                  randconfig-a001-20200303
arm64                randconfig-a001-20200303
ia64                 randconfig-a001-20200303
powerpc              randconfig-a001-20200303
sparc                randconfig-a001-20200303
riscv                            allmodconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
