Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84002C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Dec 2021 17:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhLKRru (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Dec 2021 12:47:50 -0500
Received: from mga02.intel.com ([134.134.136.20]:42141 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhLKRrt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Dec 2021 12:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639244869; x=1670780869;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Hv7sLYUNL5JJ05c/Rcwy2T2qSaMxl7J16V/JgL4UvW4=;
  b=UYizah/s/UN/sSPNqr1dw4w7Q0dQluDvZlsIZlPWXOu0sBjzo9/RcPS8
   D2qLJB7JKyeT+BTteT/5kItcv8/xvXkolffWHVCYUsTC6C7kSC17YlgzG
   zMwFbz4xl0EoXcUiwrsZJrT4TquSsn8khvtLMVmo3bEKPPqk0gGlOFn/Z
   wt39ychF8rm+Z22NKctO3TRPS56mDEObCZ2FvzMaHPAhHHaX06wrYIxBm
   GKRdBaD15PsE2Uoq40bOx6vW4FbYAPW5rNSXZsn/MirrX3+2Hddpaacck
   fo5hAY3/qTPYx5rcuRnv/+FZKA1mtqPUFTvPs4/VOBak6C+fXr/66fNp1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="225823312"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; 
   d="scan'208";a="225823312"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2021 09:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; 
   d="scan'208";a="613298996"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Dec 2021 09:47:48 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mw6TL-0004tk-JJ; Sat, 11 Dec 2021 17:47:47 +0000
Date:   Sun, 12 Dec 2021 01:47:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 30a0b1e08c6a4f1c6d7a962fe809bcc24b691d87
Message-ID: <61b4e429.A6aARsax8gLx445D%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 30a0b1e08c6a4f1c6d7a962fe809bcc24b691d87  hwmon: (ntc_thermistor) Move DT matches to the driver block

elapsed time: 722m

configs tested: 191
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211210
sh                          r7780mp_defconfig
powerpc                          g5_defconfig
arm                  colibri_pxa270_defconfig
m68k                                defconfig
m68k                        m5307c3_defconfig
arm                        spear6xx_defconfig
sh                             sh03_defconfig
riscv                            alldefconfig
powerpc                        cell_defconfig
mips                      bmips_stb_defconfig
mips                         tb0287_defconfig
openrisc                         alldefconfig
powerpc                       ebony_defconfig
mips                  decstation_64_defconfig
arm                           h5000_defconfig
sh                      rts7751r2d1_defconfig
arm                       aspeed_g5_defconfig
sparc64                             defconfig
arm                          ixp4xx_defconfig
sh                           se7780_defconfig
mips                     cu1830-neo_defconfig
powerpc                 xes_mpc85xx_defconfig
ia64                        generic_defconfig
arm                           sama7_defconfig
powerpc                       holly_defconfig
arc                      axs103_smp_defconfig
sh                         apsh4a3a_defconfig
powerpc                      katmai_defconfig
powerpc                       eiger_defconfig
h8300                       h8s-sim_defconfig
i386                             alldefconfig
arc                    vdk_hs38_smp_defconfig
mips                        bcm63xx_defconfig
xtensa                generic_kc705_defconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
arc                     nsimosci_hs_defconfig
mips                       bmips_be_defconfig
nios2                         3c120_defconfig
arm                       multi_v4t_defconfig
sh                           se7619_defconfig
arm                      integrator_defconfig
um                             i386_defconfig
powerpc                     sequoia_defconfig
arm                         lpc32xx_defconfig
microblaze                      mmu_defconfig
sh                        edosk7705_defconfig
powerpc                   motionpro_defconfig
m68k                         amcore_defconfig
parisc                generic-32bit_defconfig
powerpc                     kmeter1_defconfig
arm                        trizeps4_defconfig
sh                               j2_defconfig
arm                            hisi_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      ppc40x_defconfig
arm                       imx_v4_v5_defconfig
powerpc                  mpc866_ads_defconfig
m68k                          amiga_defconfig
m68k                          sun3x_defconfig
parisc                           allyesconfig
arm                     eseries_pxa_defconfig
mips                        bcm47xx_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc837x_mds_defconfig
arc                          axs103_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       bvme6000_defconfig
arm                  colibri_pxa300_defconfig
arm                         socfpga_defconfig
x86_64                           allyesconfig
sparc                       sparc64_defconfig
mips                  cavium_octeon_defconfig
powerpc                      chrp32_defconfig
m68k                        m5407c3_defconfig
arc                            hsdk_defconfig
csky                             alldefconfig
riscv                    nommu_virt_defconfig
arm                        neponset_defconfig
mips                      maltasmvp_defconfig
openrisc                  or1klitex_defconfig
powerpc                     pq2fads_defconfig
alpha                            alldefconfig
arm                       netwinder_defconfig
powerpc                     tqm8541_defconfig
arm                          pxa3xx_defconfig
powerpc                    mvme5100_defconfig
m68k                       m5275evb_defconfig
xtensa                          iss_defconfig
s390                          debug_defconfig
arm                        mvebu_v7_defconfig
arm                          pxa168_defconfig
arm                  randconfig-c002-20211210
arm                  randconfig-c002-20211211
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211210
i386                 randconfig-a002-20211210
i386                 randconfig-a005-20211210
i386                 randconfig-a003-20211210
i386                 randconfig-a006-20211210
i386                 randconfig-a004-20211210
x86_64               randconfig-a006-20211210
x86_64               randconfig-a005-20211210
x86_64               randconfig-a001-20211210
x86_64               randconfig-a002-20211210
x86_64               randconfig-a003-20211210
x86_64               randconfig-a004-20211210
i386                 randconfig-a013-20211211
i386                 randconfig-a011-20211211
i386                 randconfig-a016-20211211
i386                 randconfig-a014-20211211
i386                 randconfig-a015-20211211
i386                 randconfig-a012-20211211
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211210
x86_64               randconfig-c007-20211210
riscv                randconfig-c006-20211210
mips                 randconfig-c004-20211210
i386                 randconfig-c001-20211210
s390                 randconfig-c005-20211210
powerpc              randconfig-c003-20211210
i386                 randconfig-a001-20211211
i386                 randconfig-a002-20211211
i386                 randconfig-a005-20211211
i386                 randconfig-a003-20211211
i386                 randconfig-a006-20211211
i386                 randconfig-a004-20211211
x86_64               randconfig-a011-20211210
x86_64               randconfig-a012-20211210
x86_64               randconfig-a014-20211210
x86_64               randconfig-a013-20211210
x86_64               randconfig-a016-20211210
x86_64               randconfig-a015-20211210
i386                 randconfig-a013-20211210
i386                 randconfig-a011-20211210
i386                 randconfig-a016-20211210
i386                 randconfig-a014-20211210
i386                 randconfig-a015-20211210
i386                 randconfig-a012-20211210
hexagon              randconfig-r045-20211210
riscv                randconfig-r042-20211210
s390                 randconfig-r044-20211210
hexagon              randconfig-r041-20211210
hexagon              randconfig-r045-20211211
hexagon              randconfig-r041-20211211

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
