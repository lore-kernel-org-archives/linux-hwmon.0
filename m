Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9364C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Oct 2021 16:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85A6E60F58
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Oct 2021 16:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhJ3QXS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Oct 2021 12:23:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:27518 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229578AbhJ3QXP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Oct 2021 12:23:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10153"; a="230780976"
X-IronPort-AV: E=Sophos;i="5.87,195,1631602800"; 
   d="scan'208";a="230780976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2021 09:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,195,1631602800"; 
   d="scan'208";a="448817839"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Oct 2021 09:20:43 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mgr62-0001ZK-E5; Sat, 30 Oct 2021 16:20:42 +0000
Date:   Sun, 31 Oct 2021 00:20:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 10f0d2ab9aa672707559d46601fd35544759ff70
Message-ID: <617d70c6.vsGJtto/gL9xoy2E%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 10f0d2ab9aa672707559d46601fd35544759ff70  hwmon: (nct7802) Add of_node_put() before return

elapsed time: 2090m

configs tested: 247
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211028
powerpc              randconfig-c003-20211028
s390                       zfcpdump_defconfig
powerpc                 mpc8272_ads_defconfig
arc                              alldefconfig
sh                            shmin_defconfig
powerpc                 canyonlands_defconfig
mips                        vocore2_defconfig
sh                          landisk_defconfig
um                           x86_64_defconfig
sh                           se7751_defconfig
arm                          exynos_defconfig
m68k                          multi_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                         amcore_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
mips                   sb1250_swarm_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
powerpc                     pseries_defconfig
arm                          ixp4xx_defconfig
arm                        trizeps4_defconfig
arm                         vf610m4_defconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
mips                      maltasmvp_defconfig
h8300                            alldefconfig
arm                            lart_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                      loongson3_defconfig
arm                            mps2_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme16x_defconfig
sh                             shx3_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                       omap2plus_defconfig
powerpc                     redwood_defconfig
m68k                          atari_defconfig
mips                        jmr3927_defconfig
openrisc                         alldefconfig
arm                         bcm2835_defconfig
sh                          kfr2r09_defconfig
parisc                generic-32bit_defconfig
mips                      fuloong2e_defconfig
arm                           h3600_defconfig
arm                         s5pv210_defconfig
s390                             alldefconfig
riscv                    nommu_k210_defconfig
m68k                       m5475evb_defconfig
sh                           se7724_defconfig
powerpc                    mvme5100_defconfig
m68k                        mvme147_defconfig
arm                         socfpga_defconfig
arm                            pleb_defconfig
openrisc                    or1ksim_defconfig
sh                 kfr2r09-romimage_defconfig
sh                         apsh4a3a_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          lboxre2_defconfig
powerpc                      pasemi_defconfig
arc                     haps_hs_smp_defconfig
riscv                            alldefconfig
arm                           sama7_defconfig
powerpc                       maple_defconfig
m68k                       m5249evb_defconfig
arm                            dove_defconfig
arm                          pxa910_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                            mac_defconfig
um                               alldefconfig
arm                             pxa_defconfig
sh                          polaris_defconfig
mips                          rm200_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     rainier_defconfig
arm                             rpc_defconfig
powerpc                      ppc6xx_defconfig
arm                              alldefconfig
arm                         shannon_defconfig
nios2                         10m50_defconfig
arm64                            alldefconfig
powerpc                        warp_defconfig
mips                          ath25_defconfig
powerpc                     tqm8541_defconfig
sh                          rsk7269_defconfig
sh                               j2_defconfig
arm                        multi_v5_defconfig
mips                             allyesconfig
arm                     davinci_all_defconfig
arm                       aspeed_g5_defconfig
arm                           omap1_defconfig
arm                          lpd270_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           stm32_defconfig
microblaze                      mmu_defconfig
openrisc                  or1klitex_defconfig
sh                           sh2007_defconfig
powerpc                  iss476-smp_defconfig
mips                         rt305x_defconfig
mips                         tb0219_defconfig
arm                          ep93xx_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      ppc64e_defconfig
microblaze                          defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          urquell_defconfig
arm                           h5000_defconfig
mips                            gpr_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                    socrates_defconfig
powerpc                      arches_defconfig
powerpc                     tqm8548_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        mvebu_v5_defconfig
arm                   milbeaut_m10v_defconfig
m68k                          amiga_defconfig
sh                        sh7763rdp_defconfig
powerpc                     tqm8560_defconfig
mips                       lemote2f_defconfig
arm                  randconfig-c002-20211028
arm                  randconfig-c002-20211029
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
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
arc                              allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20211028
x86_64               randconfig-a004-20211028
x86_64               randconfig-a005-20211028
x86_64               randconfig-a001-20211028
x86_64               randconfig-a006-20211028
x86_64               randconfig-a003-20211028
i386                 randconfig-a004-20211028
i386                 randconfig-a003-20211028
i386                 randconfig-a002-20211028
i386                 randconfig-a006-20211028
i386                 randconfig-a001-20211028
i386                 randconfig-a005-20211028
x86_64               randconfig-a015-20211029
x86_64               randconfig-a013-20211029
x86_64               randconfig-a011-20211029
x86_64               randconfig-a014-20211029
x86_64               randconfig-a012-20211029
x86_64               randconfig-a016-20211029
i386                 randconfig-a012-20211029
i386                 randconfig-a013-20211029
i386                 randconfig-a011-20211029
i386                 randconfig-a015-20211029
i386                 randconfig-a016-20211029
i386                 randconfig-a014-20211029
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211028
powerpc              randconfig-c003-20211028
riscv                randconfig-c006-20211028
x86_64               randconfig-c007-20211028
mips                 randconfig-c004-20211028
s390                 randconfig-c005-20211028
i386                 randconfig-c001-20211028
arm                  randconfig-c002-20211029
powerpc              randconfig-c003-20211029
riscv                randconfig-c006-20211029
x86_64               randconfig-c007-20211029
mips                 randconfig-c004-20211029
s390                 randconfig-c005-20211029
i386                 randconfig-c001-20211029
x86_64               randconfig-a005-20211030
x86_64               randconfig-a004-20211030
x86_64               randconfig-a002-20211030
x86_64               randconfig-a003-20211030
x86_64               randconfig-a001-20211030
x86_64               randconfig-a006-20211030
x86_64               randconfig-a002-20211029
x86_64               randconfig-a004-20211029
x86_64               randconfig-a005-20211029
x86_64               randconfig-a001-20211029
x86_64               randconfig-a006-20211029
x86_64               randconfig-a003-20211029
i386                 randconfig-a004-20211029
i386                 randconfig-a003-20211029
i386                 randconfig-a002-20211029
i386                 randconfig-a001-20211029
i386                 randconfig-a006-20211029
i386                 randconfig-a005-20211029
x86_64               randconfig-a015-20211028
x86_64               randconfig-a013-20211028
x86_64               randconfig-a011-20211028
x86_64               randconfig-a014-20211028
x86_64               randconfig-a012-20211028
x86_64               randconfig-a016-20211028
i386                 randconfig-a012-20211028
i386                 randconfig-a013-20211028
i386                 randconfig-a011-20211028
i386                 randconfig-a015-20211028
i386                 randconfig-a016-20211028
i386                 randconfig-a014-20211028
hexagon              randconfig-r045-20211028
riscv                randconfig-r042-20211028
s390                 randconfig-r044-20211028
hexagon              randconfig-r041-20211028
hexagon              randconfig-r045-20211029
hexagon              randconfig-r041-20211029

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
