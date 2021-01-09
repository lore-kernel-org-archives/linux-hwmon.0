Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20503C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Jan 2021 16:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE2A623884
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Jan 2021 16:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbhAIQqA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 9 Jan 2021 11:46:00 -0500
Received: from mga01.intel.com ([192.55.52.88]:6934 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbhAIQqA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 9 Jan 2021 11:46:00 -0500
IronPort-SDR: S5eLBnK0eono6XP3kCCU5O7zGjleSJhEotruBO+vd1on5FxMIkaBN29ibsbXJyxklMRJA80J+L
 M42Fyyqxdakg==
X-IronPort-AV: E=McAfee;i="6000,8403,9859"; a="196289433"
X-IronPort-AV: E=Sophos;i="5.79,334,1602572400"; 
   d="scan'208";a="196289433"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2021 08:45:19 -0800
IronPort-SDR: 6kBrGmAWmsAOsiF/ZXcwi1c+i4NPyDgClfHnNpk9+nILK2spk2AIS50oAJSTmquK65Yjbha8hu
 tLBQlzo2unUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,334,1602572400"; 
   d="scan'208";a="403656583"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jan 2021 08:45:18 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kyHMc-000187-92; Sat, 09 Jan 2021 16:45:18 +0000
Date:   Sun, 10 Jan 2021 00:44:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 d1f7b079ce5b69c88c813439eea6a9c133f0846b
Message-ID: <5ff9dd6b.YycfAObNiaLenmlV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: d1f7b079ce5b69c88c813439eea6a9c133f0846b  hwmon: (aspeed-pwm-tacho) Switch to using the new API kobj_to_dev()

elapsed time: 829m

configs tested: 135
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
openrisc                            defconfig
powerpc                      arches_defconfig
mips                        qi_lb60_defconfig
powerpc                     sbc8548_defconfig
openrisc                 simple_smp_defconfig
sh                           se7780_defconfig
powerpc                      mgcoge_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme16x_defconfig
powerpc                         wii_defconfig
riscv                          rv32_defconfig
mips                           ip28_defconfig
riscv                            alldefconfig
mips                        jmr3927_defconfig
arm                           spitz_defconfig
arm                        magician_defconfig
sh                            migor_defconfig
arm                           efm32_defconfig
powerpc                     redwood_defconfig
h8300                               defconfig
m68k                        stmark2_defconfig
powerpc                    sam440ep_defconfig
mips                         tb0219_defconfig
mips                      bmips_stb_defconfig
powerpc                      ppc6xx_defconfig
mips                  decstation_64_defconfig
arm                         lpc18xx_defconfig
arm                        mvebu_v7_defconfig
microblaze                          defconfig
arm                        oxnas_v6_defconfig
m68k                                defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
arm                       cns3420vb_defconfig
m68k                        mvme147_defconfig
sh                            shmin_defconfig
powerpc                  iss476-smp_defconfig
sh                      rts7751r2d1_defconfig
arm                       omap2plus_defconfig
mips                     cu1830-neo_defconfig
alpha                            alldefconfig
mips                           ci20_defconfig
arm                          pxa3xx_defconfig
riscv                    nommu_virt_defconfig
sh                           se7619_defconfig
riscv                            allmodconfig
mips                           ip22_defconfig
ia64                                defconfig
powerpc                     pseries_defconfig
arm                         lpc32xx_defconfig
powerpc                     kilauea_defconfig
m68k                             allyesconfig
arm                       aspeed_g5_defconfig
m68k                       m5249evb_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
powerpc                      acadia_defconfig
riscv                            allyesconfig
arc                          axs101_defconfig
mips                           gcw0_defconfig
mips                      pic32mzda_defconfig
parisc                generic-32bit_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                      pistachio_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210108
x86_64               randconfig-a006-20210108
x86_64               randconfig-a001-20210108
x86_64               randconfig-a002-20210108
x86_64               randconfig-a003-20210108
x86_64               randconfig-a005-20210108
i386                 randconfig-a005-20210108
i386                 randconfig-a002-20210108
i386                 randconfig-a001-20210108
i386                 randconfig-a003-20210108
i386                 randconfig-a006-20210108
i386                 randconfig-a004-20210108
i386                 randconfig-a016-20210108
i386                 randconfig-a011-20210108
i386                 randconfig-a014-20210108
i386                 randconfig-a015-20210108
i386                 randconfig-a013-20210108
i386                 randconfig-a012-20210108
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210108
x86_64               randconfig-a011-20210108
x86_64               randconfig-a012-20210108
x86_64               randconfig-a016-20210108
x86_64               randconfig-a014-20210108
x86_64               randconfig-a015-20210108

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
