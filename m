Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78759C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 14:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B2C461073
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 14:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbhJPOkH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Oct 2021 10:40:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:61694 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235150AbhJPOkG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Oct 2021 10:40:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="208164725"
X-IronPort-AV: E=Sophos;i="5.85,378,1624345200"; 
   d="scan'208";a="208164725"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2021 07:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,378,1624345200"; 
   d="scan'208";a="593252711"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Oct 2021 07:37:57 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mbkou-0009Op-SK; Sat, 16 Oct 2021 14:37:56 +0000
Date:   Sat, 16 Oct 2021 22:37:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 51369c0f05347c1f4762cb05e9775e81eec04262
Message-ID: <616ae3ba./PR6JzSoYkI4HbFo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 51369c0f05347c1f4762cb05e9775e81eec04262  dt-bindings: hwmon: allow specifying channels for tmp421

elapsed time: 890m

configs tested: 185
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211016
sh                      rts7751r2d1_defconfig
arm                         at91_dt_defconfig
mips                      pic32mzda_defconfig
arm                           u8500_defconfig
arm                           viper_defconfig
powerpc                      ep88xc_defconfig
powerpc                      pasemi_defconfig
powerpc                     sequoia_defconfig
xtensa                          iss_defconfig
mips                            gpr_defconfig
powerpc                       maple_defconfig
powerpc                      obs600_defconfig
arm                          pcm027_defconfig
powerpc64                        alldefconfig
arm                           sama7_defconfig
powerpc                     kmeter1_defconfig
ia64                             alldefconfig
powerpc                  iss476-smp_defconfig
powerpc                     mpc5200_defconfig
h8300                       h8s-sim_defconfig
powerpc                     powernv_defconfig
sh                             sh03_defconfig
sh                         apsh4a3a_defconfig
arm                         s3c2410_defconfig
powerpc                      chrp32_defconfig
m68k                       m5249evb_defconfig
sparc64                             defconfig
arm                          iop32x_defconfig
nds32                            alldefconfig
arm                       mainstone_defconfig
mips                      maltasmvp_defconfig
mips                        nlm_xlp_defconfig
sh                 kfr2r09-romimage_defconfig
sh                        apsh4ad0a_defconfig
sparc                       sparc32_defconfig
ia64                             allyesconfig
m68k                        stmark2_defconfig
arm                       omap2plus_defconfig
mips                       lemote2f_defconfig
riscv                          rv32_defconfig
sh                        edosk7705_defconfig
i386                                defconfig
arm                  colibri_pxa300_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7264_defconfig
arm                         hackkit_defconfig
sh                          rsk7269_defconfig
powerpc                  storcenter_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            mps2_defconfig
xtensa                  nommu_kc705_defconfig
ia64                        generic_defconfig
powerpc                      acadia_defconfig
powerpc                     ksi8560_defconfig
arm                      integrator_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
arm                       versatile_defconfig
arm                         cm_x300_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc837x_mds_defconfig
mips                   sb1250_swarm_defconfig
arm                            xcep_defconfig
mips                       capcella_defconfig
arm                        vexpress_defconfig
arm                         mv78xx0_defconfig
powerpc                     skiroot_defconfig
mips                         cobalt_defconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
powerpc                      walnut_defconfig
arm                        keystone_defconfig
powerpc                   microwatt_defconfig
sh                        sh7757lcr_defconfig
openrisc                            defconfig
arm                      pxa255-idp_defconfig
s390                                defconfig
powerpc                      tqm8xx_defconfig
mips                     loongson1b_defconfig
sh                          sdk7786_defconfig
powerpc                      bamboo_defconfig
arm                          badge4_defconfig
arm                       imx_v6_v7_defconfig
powerpc                        cell_defconfig
powerpc                          allmodconfig
arm                             rpc_defconfig
arm                            hisi_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc64                           defconfig
arm                        mvebu_v7_defconfig
sh                            shmin_defconfig
sh                        dreamcast_defconfig
arm                  randconfig-c002-20211016
x86_64               randconfig-c001-20211016
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
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
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20211016
x86_64               randconfig-a004-20211016
x86_64               randconfig-a001-20211016
x86_64               randconfig-a005-20211016
x86_64               randconfig-a002-20211016
x86_64               randconfig-a003-20211016
i386                 randconfig-a003-20211016
i386                 randconfig-a001-20211016
i386                 randconfig-a005-20211016
i386                 randconfig-a004-20211016
i386                 randconfig-a002-20211016
i386                 randconfig-a006-20211016
i386                 randconfig-a016-20211015
i386                 randconfig-a014-20211015
i386                 randconfig-a011-20211015
i386                 randconfig-a015-20211015
i386                 randconfig-a012-20211015
i386                 randconfig-a013-20211015
arc                  randconfig-r043-20211015
s390                 randconfig-r044-20211015
riscv                randconfig-r042-20211015
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20211016
arm                  randconfig-c002-20211016
i386                 randconfig-c001-20211016
s390                 randconfig-c005-20211016
x86_64               randconfig-c007-20211016
powerpc              randconfig-c003-20211016
riscv                randconfig-c006-20211016
x86_64               randconfig-a012-20211016
x86_64               randconfig-a015-20211016
x86_64               randconfig-a016-20211016
x86_64               randconfig-a014-20211016
x86_64               randconfig-a011-20211016
x86_64               randconfig-a013-20211016
i386                 randconfig-a016-20211016
i386                 randconfig-a014-20211016
i386                 randconfig-a011-20211016
i386                 randconfig-a015-20211016
i386                 randconfig-a012-20211016
i386                 randconfig-a013-20211016
hexagon              randconfig-r041-20211016
s390                 randconfig-r044-20211016
riscv                randconfig-r042-20211016
hexagon              randconfig-r045-20211016
hexagon              randconfig-r041-20211015
hexagon              randconfig-r045-20211015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
