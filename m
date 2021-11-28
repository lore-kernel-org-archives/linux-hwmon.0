Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884E5C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 28 Nov 2021 17:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358617AbhK1Rxv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 28 Nov 2021 12:53:51 -0500
Received: from mga06.intel.com ([134.134.136.31]:59928 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234143AbhK1Rvv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Nov 2021 12:51:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10181"; a="296649638"
X-IronPort-AV: E=Sophos;i="5.87,271,1631602800"; 
   d="scan'208";a="296649638"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2021 09:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,271,1631602800"; 
   d="scan'208";a="499049792"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 28 Nov 2021 09:48:33 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mrOHx-000Awz-8o; Sun, 28 Nov 2021 17:48:33 +0000
Date:   Mon, 29 Nov 2021 01:47:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 b71c5aeaecf659ae4b83c3d4bdaea2a3b3b44314
Message-ID: <61a3c0c3.xwk8JvcJdFIw8XBr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b71c5aeaecf659ae4b83c3d4bdaea2a3b3b44314  hwmon: (jc42) Add support for ONSEMI N34TS04

elapsed time: 721m

configs tested: 160
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211128
powerpc                      tqm8xx_defconfig
powerpc                      pcm030_defconfig
mips                         cobalt_defconfig
arm                        spear6xx_defconfig
mips                         tb0226_defconfig
sh                         ecovec24_defconfig
arm                        oxnas_v6_defconfig
arc                              allyesconfig
powerpc                        fsp2_defconfig
arc                        nsim_700_defconfig
riscv                               defconfig
powerpc                     tqm8560_defconfig
sh                           se7721_defconfig
powerpc                  mpc866_ads_defconfig
mips                           ip27_defconfig
sh                          rsk7264_defconfig
powerpc                     redwood_defconfig
mips                           rs90_defconfig
powerpc                   currituck_defconfig
mips                     loongson1b_defconfig
mips                            ar7_defconfig
sh                             shx3_defconfig
sh                        sh7757lcr_defconfig
arc                                 defconfig
sh                          kfr2r09_defconfig
arm                         s3c2410_defconfig
powerpc                     stx_gp3_defconfig
arm                         orion5x_defconfig
m68k                             allyesconfig
powerpc                      mgcoge_defconfig
arm                            mmp2_defconfig
mips                            gpr_defconfig
ia64                             alldefconfig
um                                  defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc8540_ads_defconfig
mips                     loongson1c_defconfig
sh                   sh7770_generic_defconfig
xtensa                              defconfig
arm                         hackkit_defconfig
xtensa                generic_kc705_defconfig
arm                          pcm027_defconfig
arm                        mvebu_v5_defconfig
sparc64                          alldefconfig
powerpc                     rainier_defconfig
ia64                          tiger_defconfig
m68k                          sun3x_defconfig
ia64                             allyesconfig
mips                        vocore2_defconfig
nds32                            alldefconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
arm                       aspeed_g4_defconfig
arm                       mainstone_defconfig
sh                         ap325rxa_defconfig
powerpc                      ep88xc_defconfig
arm                     am200epdkit_defconfig
powerpc                     ksi8560_defconfig
arm                        clps711x_defconfig
m68k                         apollo_defconfig
sh                             sh03_defconfig
sh                          lboxre2_defconfig
powerpc                    sam440ep_defconfig
powerpc                      pasemi_defconfig
ia64                                defconfig
powerpc64                        alldefconfig
s390                          debug_defconfig
arm                         axm55xx_defconfig
xtensa                    xip_kc705_defconfig
mips                        jmr3927_defconfig
sh                           se7780_defconfig
arm                         socfpga_defconfig
arm                          gemini_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       spear13xx_defconfig
i386                             allyesconfig
arm                  randconfig-c002-20211128
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211128
x86_64               randconfig-a014-20211128
x86_64               randconfig-a012-20211128
x86_64               randconfig-a016-20211128
x86_64               randconfig-a013-20211128
x86_64               randconfig-a015-20211128
i386                 randconfig-a015-20211128
i386                 randconfig-a016-20211128
i386                 randconfig-a013-20211128
i386                 randconfig-a012-20211128
i386                 randconfig-a014-20211128
i386                 randconfig-a011-20211128
arc                  randconfig-r043-20211128
s390                 randconfig-r044-20211128
riscv                randconfig-r042-20211128
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211128
i386                 randconfig-c001-20211128
riscv                randconfig-c006-20211128
arm                  randconfig-c002-20211128
powerpc              randconfig-c003-20211128
x86_64               randconfig-c007-20211128
mips                 randconfig-c004-20211128
x86_64               randconfig-a001-20211128
x86_64               randconfig-a006-20211128
x86_64               randconfig-a003-20211128
x86_64               randconfig-a005-20211128
x86_64               randconfig-a004-20211128
x86_64               randconfig-a002-20211128
i386                 randconfig-a001-20211128
i386                 randconfig-a002-20211128
i386                 randconfig-a006-20211128
i386                 randconfig-a005-20211128
i386                 randconfig-a004-20211128
i386                 randconfig-a003-20211128
hexagon              randconfig-r045-20211128
hexagon              randconfig-r041-20211128

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
