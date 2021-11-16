Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AD3C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Nov 2021 12:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 727DA61414
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Nov 2021 12:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbhKPMHW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Nov 2021 07:07:22 -0500
Received: from mga14.intel.com ([192.55.52.115]:59274 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235953AbhKPMFN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Nov 2021 07:05:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233919106"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="233919106"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 04:02:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="494432986"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Nov 2021 04:02:11 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mmxAA-0000Po-S7; Tue, 16 Nov 2021 12:02:10 +0000
Date:   Tue, 16 Nov 2021 20:02:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 82b520da9134a594eb9816759ed66ba6ef44888e
Message-ID: <61939dba.k9UXbyzFe7lZHHAy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 82b520da9134a594eb9816759ed66ba6ef44888e  hwmon: (adm1021) Improve detection of LM84, MAX1617, and MAX1617A

elapsed time: 723m

configs tested: 175
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211115
i386                 randconfig-c001-20211116
m68k                             alldefconfig
powerpc                 linkstation_defconfig
ia64                                defconfig
mips                         db1xxx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                        cell_defconfig
arm                         lubbock_defconfig
sh                             shx3_defconfig
sh                          lboxre2_defconfig
arc                                 defconfig
arm                       netwinder_defconfig
arm                        mini2440_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
powerpc                      arches_defconfig
m68k                            mac_defconfig
powerpc                     tqm8560_defconfig
m68k                          multi_defconfig
m68k                        m5307c3_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         cm_x300_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
arm                        vexpress_defconfig
h8300                    h8300h-sim_defconfig
sh                               j2_defconfig
powerpc                      ppc6xx_defconfig
mips                          ath25_defconfig
openrisc                 simple_smp_defconfig
sh                         ecovec24_defconfig
sh                      rts7751r2d1_defconfig
mips                           gcw0_defconfig
m68k                       m5208evb_defconfig
mips                      bmips_stb_defconfig
powerpc                     ppa8548_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
sparc64                             defconfig
powerpc                    klondike_defconfig
m68k                          amiga_defconfig
arm                       versatile_defconfig
m68k                        mvme147_defconfig
arm                       aspeed_g4_defconfig
m68k                       m5275evb_defconfig
arm                        magician_defconfig
mips                           ip22_defconfig
arm                          badge4_defconfig
sh                           sh2007_defconfig
powerpc                     ksi8560_defconfig
powerpc                     kilauea_defconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
powerpc                      cm5200_defconfig
powerpc                   microwatt_defconfig
mips                       bmips_be_defconfig
um                               alldefconfig
sh                          rsk7203_defconfig
m68k                        m5407c3_defconfig
mips                           xway_defconfig
riscv                             allnoconfig
arm                  colibri_pxa270_defconfig
arm                         at91_dt_defconfig
m68k                         amcore_defconfig
sh                   sh7770_generic_defconfig
mips                      malta_kvm_defconfig
sparc                               defconfig
um                             i386_defconfig
s390                             alldefconfig
s390                                defconfig
powerpc                    ge_imp3a_defconfig
sh                        sh7763rdp_defconfig
mips                         mpc30x_defconfig
sh                     sh7710voipgw_defconfig
nds32                            alldefconfig
m68k                       bvme6000_defconfig
xtensa                  audio_kc705_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                            e55_defconfig
arm                  randconfig-c002-20211116
arm                  randconfig-c002-20211115
ia64                             allmodconfig
ia64                             allyesconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                              debian-10.3
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20211115
i386                 randconfig-a003-20211115
i386                 randconfig-a005-20211115
i386                 randconfig-a001-20211115
i386                 randconfig-a004-20211115
i386                 randconfig-a002-20211115
x86_64               randconfig-a015-20211116
x86_64               randconfig-a013-20211116
x86_64               randconfig-a012-20211116
x86_64               randconfig-a011-20211116
x86_64               randconfig-a016-20211116
x86_64               randconfig-a014-20211116
i386                 randconfig-a014-20211116
i386                 randconfig-a016-20211116
i386                 randconfig-a012-20211116
i386                 randconfig-a013-20211116
i386                 randconfig-a011-20211116
i386                 randconfig-a015-20211116
x86_64               randconfig-a005-20211115
x86_64               randconfig-a003-20211115
x86_64               randconfig-a002-20211115
x86_64               randconfig-a001-20211115
x86_64               randconfig-a006-20211115
x86_64               randconfig-a004-20211115
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-c007-20211116
i386                 randconfig-c001-20211116
arm                  randconfig-c002-20211116
riscv                randconfig-c006-20211116
powerpc              randconfig-c003-20211116
s390                 randconfig-c005-20211116
mips                 randconfig-c004-20211116
x86_64               randconfig-a005-20211116
x86_64               randconfig-a003-20211116
x86_64               randconfig-a001-20211116
x86_64               randconfig-a002-20211116
x86_64               randconfig-a006-20211116
x86_64               randconfig-a004-20211116
i386                 randconfig-a014-20211115
i386                 randconfig-a016-20211115
i386                 randconfig-a012-20211115
i386                 randconfig-a013-20211115
i386                 randconfig-a011-20211115
i386                 randconfig-a015-20211115
hexagon              randconfig-r045-20211115
hexagon              randconfig-r041-20211115
s390                 randconfig-r044-20211115
riscv                randconfig-r042-20211115

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
