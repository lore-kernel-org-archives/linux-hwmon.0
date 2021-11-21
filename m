Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F17C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Nov 2021 09:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhKUJb4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Nov 2021 04:31:56 -0500
Received: from mga05.intel.com ([192.55.52.43]:11508 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230459AbhKUJb4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Nov 2021 04:31:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10174"; a="320870871"
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; 
   d="scan'208";a="320870871"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2021 01:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; 
   d="scan'208";a="496475364"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2021 01:28:50 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1moj9V-0006kA-CW; Sun, 21 Nov 2021 09:28:49 +0000
Date:   Sun, 21 Nov 2021 17:28:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 5c9a4cc5516e30ac2e0586e315e0806ae766321b
Message-ID: <619a114d.QUsXUR0rWJWNEklw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 5c9a4cc5516e30ac2e0586e315e0806ae766321b  watchdog: Remove BCM63XX_WDT

elapsed time: 725m

configs tested: 152
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
parisc                generic-32bit_defconfig
sh                           se7619_defconfig
sh                        edosk7705_defconfig
arm                         at91_dt_defconfig
mips                        omega2p_defconfig
powerpc                     tqm8555_defconfig
powerpc                   microwatt_defconfig
arm                              alldefconfig
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
sh                         microdev_defconfig
ia64                          tiger_defconfig
arm                       netwinder_defconfig
sh                   sh7770_generic_defconfig
arm                        vexpress_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc832x_mds_defconfig
riscv                    nommu_virt_defconfig
arm                            dove_defconfig
mips                      loongson3_defconfig
mips                      maltasmvp_defconfig
powerpc                      obs600_defconfig
arm                          iop32x_defconfig
xtensa                       common_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ep88xc_defconfig
sh                        dreamcast_defconfig
arm                          pxa168_defconfig
arm                        trizeps4_defconfig
mips                   sb1250_swarm_defconfig
sh                          urquell_defconfig
powerpc                      pcm030_defconfig
sh                          r7785rp_defconfig
riscv                            allyesconfig
nios2                            alldefconfig
sh                             espt_defconfig
powerpc                     taishan_defconfig
mips                        bcm47xx_defconfig
arm                       spear13xx_defconfig
arm                          lpd270_defconfig
arc                        nsimosci_defconfig
h8300                            allyesconfig
mips                           gcw0_defconfig
arm                     eseries_pxa_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                    maltaup_xpa_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20211121
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                 randconfig-a003-20211121
i386                 randconfig-a005-20211121
i386                 randconfig-a006-20211121
i386                 randconfig-a004-20211121
arc                  randconfig-r043-20211121
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
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
i386                 randconfig-a016-20211121
i386                 randconfig-a015-20211121
i386                 randconfig-a012-20211121
i386                 randconfig-a013-20211121
i386                 randconfig-a014-20211121
i386                 randconfig-a011-20211121
hexagon              randconfig-r045-20211121
s390                 randconfig-r044-20211121
hexagon              randconfig-r041-20211121
riscv                randconfig-r042-20211121

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
