Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B83C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Jan 2022 02:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiAMCuc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jan 2022 21:50:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:21669 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231812AbiAMCub (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jan 2022 21:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642042231; x=1673578231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CjGIAnPErPoqCWx24UZNSUZoXpJ44eoH7yZTYnHRTGM=;
  b=RQexFpuOXNNH+/XQO5lAF/omJUrNAUiVabAQNxwX6J4V7yPNWkOcOAZf
   v5e/bhjYdJsW5fhWLRST5rl4rKQTSwFMchY5ZyysnvHAvvsuMqWzGb9Yi
   DbQI2XE0jsbfjOKoeQ7g3uTigoOV2UD64vJyWjBj6jtL4viGxwiNKGlN5
   ZjmEIm9lBXLVXUj94Q9NVxRF96U3H+w3ISzYU2xH2PmyemWaEF/Pt5RfS
   lOzteGM6eSNk1bEE6YjvHpKIIM+jPLqI3E+W3rzy/uZxNoz2OdtZXtUuc
   xo0DZZ81nIrI9APPS+JPhzRMmBiHWKUG1uzKRs4yP6kUcoKo/c1D3DW/e
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="304649772"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="304649772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 18:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="475147390"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 18:50:30 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7qC4-0006kh-Rk; Thu, 13 Jan 2022 02:50:28 +0000
Date:   Thu, 13 Jan 2022 10:50:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 a7e54735ac4398285215ee263638cea0435c80ee
Message-ID: <61df9362.uKQkzpzq4dxxDKwP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: a7e54735ac4398285215ee263638cea0435c80ee  hwmon: (lm90) Fix sysfs and udev notifications

elapsed time: 1503m

configs tested: 197
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220111
arm                         cm_x300_defconfig
csky                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                         wii_defconfig
nds32                               defconfig
arm                           u8500_defconfig
h8300                     edosk2674_defconfig
sh                           se7724_defconfig
m68k                           sun3_defconfig
m68k                             alldefconfig
sh                          sdk7780_defconfig
ia64                        generic_defconfig
ia64                         bigsur_defconfig
sh                     magicpanelr2_defconfig
arm                            pleb_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
sh                          r7785rp_defconfig
arc                     haps_hs_smp_defconfig
sh                         microdev_defconfig
powerpc                     rainier_defconfig
sparc                            alldefconfig
mips                  maltasmvp_eva_defconfig
powerpc                      mgcoge_defconfig
powerpc                    klondike_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
m68k                       m5275evb_defconfig
sh                        edosk7705_defconfig
sh                          rsk7203_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       bvme6000_defconfig
sh                        apsh4ad0a_defconfig
sh                              ul2_defconfig
arm                        realview_defconfig
powerpc                       holly_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
sh                          rsk7269_defconfig
um                           x86_64_defconfig
sh                               j2_defconfig
powerpc64                        alldefconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
ia64                             alldefconfig
mips                     decstation_defconfig
csky                                defconfig
powerpc                        warp_defconfig
h8300                       h8s-sim_defconfig
sh                           se7751_defconfig
microblaze                          defconfig
arm                       omap2plus_defconfig
sparc64                             defconfig
mips                          rb532_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          landisk_defconfig
sh                           se7722_defconfig
sh                           se7712_defconfig
powerpc                    adder875_defconfig
ia64                                defconfig
sh                     sh7710voipgw_defconfig
arm                      integrator_defconfig
powerpc                  iss476-smp_defconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
arm64                            alldefconfig
m68k                        m5272c3_defconfig
powerpc                 mpc834x_mds_defconfig
sh                             shx3_defconfig
m68k                        stmark2_defconfig
arm                        trizeps4_defconfig
microblaze                      mmu_defconfig
sh                           se7721_defconfig
sh                   rts7751r2dplus_defconfig
sh                        sh7763rdp_defconfig
powerpc                       ppc64_defconfig
powerpc                      pasemi_defconfig
arm                            hisi_defconfig
xtensa                generic_kc705_defconfig
nios2                            allyesconfig
mips                           ip32_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
xtensa                  nommu_kc705_defconfig
m68k                            q40_defconfig
sh                        edosk7760_defconfig
mips                        jmr3927_defconfig
xtensa                           alldefconfig
h8300                            alldefconfig
mips                     loongson1b_defconfig
powerpc                      cm5200_defconfig
arm                  randconfig-c002-20220112
arm                  randconfig-c002-20220111
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220111
arc                  randconfig-r043-20220112
arc                  randconfig-r043-20220111
s390                 randconfig-r044-20220111
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220112
x86_64                        randconfig-c007
riscv                randconfig-c006-20220112
powerpc              randconfig-c003-20220112
i386                          randconfig-c001
mips                 randconfig-c004-20220112
powerpc                     akebono_defconfig
mips                   sb1250_swarm_defconfig
mips                        workpad_defconfig
mips                          ath79_defconfig
arm                          pcm027_defconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
arm                          imote2_defconfig
arm                             mxs_defconfig
arm                          pxa168_defconfig
powerpc                      katmai_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pic32mzda_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc836x_mds_defconfig
mips                        bcm63xx_defconfig
powerpc                      pmac32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220112
riscv                randconfig-r042-20220112
hexagon              randconfig-r041-20220112
s390                 randconfig-r044-20220112
hexagon              randconfig-r045-20220111
hexagon              randconfig-r041-20220111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
