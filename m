Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D199C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Nov 2021 11:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhKULzA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Nov 2021 06:55:00 -0500
Received: from mga14.intel.com ([192.55.52.115]:43446 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233571AbhKULzA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Nov 2021 06:55:00 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10174"; a="234894321"
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; 
   d="scan'208";a="234894321"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2021 03:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; 
   d="scan'208";a="496501124"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2021 03:51:52 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1molNw-0006qa-8g; Sun, 21 Nov 2021 11:51:52 +0000
Date:   Sun, 21 Nov 2021 19:51:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 0e4190d762ef2609111507e1b9553a166436f556
Message-ID: <619a32c2.mhLwVNfL2IJ+UwVY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 0e4190d762ef2609111507e1b9553a166436f556  hwmon: (sht4x) Fix EREMOTEIO errors

elapsed time: 720m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
mips                     cu1830-neo_defconfig
parisc                generic-32bit_defconfig
sh                           se7619_defconfig
sh                        edosk7705_defconfig
sh                           se7722_defconfig
sh                          rsk7264_defconfig
sh                               alldefconfig
mips                      fuloong2e_defconfig
mips                     loongson1b_defconfig
arm                          simpad_defconfig
csky                                defconfig
arm                        mvebu_v7_defconfig
powerpc                     kmeter1_defconfig
powerpc                     ppa8548_defconfig
arm                          pxa3xx_defconfig
m68k                             alldefconfig
powerpc                     skiroot_defconfig
sh                        sh7785lcr_defconfig
sh                          lboxre2_defconfig
arm                      tct_hammer_defconfig
sparc                            alldefconfig
powerpc                       holly_defconfig
sh                        apsh4ad0a_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc832x_mds_defconfig
riscv                    nommu_virt_defconfig
arm                            dove_defconfig
mips                      loongson3_defconfig
mips                      maltasmvp_defconfig
powerpc                      ep88xc_defconfig
sh                        dreamcast_defconfig
arm                          pxa168_defconfig
arm                        trizeps4_defconfig
mips                   sb1250_swarm_defconfig
sh                          urquell_defconfig
powerpc                      pcm030_defconfig
riscv                            allyesconfig
sh                          r7785rp_defconfig
powerpc                     mpc5200_defconfig
sh                      rts7751r2d1_defconfig
mips                         tb0219_defconfig
openrisc                 simple_smp_defconfig
arm                         orion5x_defconfig
m68k                             allyesconfig
sh                             espt_defconfig
powerpc                     taishan_defconfig
mips                        bcm47xx_defconfig
arm                       spear13xx_defconfig
arm                          lpd270_defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20211121
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211121
x86_64               randconfig-a006-20211121
x86_64               randconfig-a003-20211121
x86_64               randconfig-a004-20211121
x86_64               randconfig-a005-20211121
x86_64               randconfig-a002-20211121
i386                 randconfig-a001-20211121
i386                 randconfig-a002-20211121
i386                 randconfig-a005-20211121
i386                 randconfig-a006-20211121
i386                 randconfig-a004-20211121
i386                 randconfig-a003-20211121
arc                  randconfig-r043-20211121
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211121
i386                 randconfig-c001-20211121
powerpc              randconfig-c003-20211121
arm                  randconfig-c002-20211121
riscv                randconfig-c006-20211121
x86_64               randconfig-c007-20211121
mips                 randconfig-c004-20211121
x86_64               randconfig-a011-20211121
x86_64               randconfig-a014-20211121
x86_64               randconfig-a012-20211121
x86_64               randconfig-a016-20211121
x86_64               randconfig-a013-20211121
x86_64               randconfig-a015-20211121
i386                 randconfig-a012-20211121
i386                 randconfig-a013-20211121
i386                 randconfig-a014-20211121
i386                 randconfig-a011-20211121
i386                 randconfig-a015-20211121
i386                 randconfig-a016-20211121
hexagon              randconfig-r045-20211121
s390                 randconfig-r044-20211121
hexagon              randconfig-r041-20211121
riscv                randconfig-r042-20211121

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
