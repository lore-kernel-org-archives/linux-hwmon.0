Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D398C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 20:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E1C761037
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 20:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhJUU4A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 16:56:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:33426 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230272AbhJUU4A (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 16:56:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="289982393"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="289982393"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 13:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="444964159"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2021 13:53:42 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mdf4H-000Enw-Ss; Thu, 21 Oct 2021 20:53:41 +0000
Date:   Fri, 22 Oct 2021 04:53:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:master] BUILD SUCCESS
 913a01cff4fae9115e2bcbb6c888b3fe29890029
Message-ID: <6171d348.POVYwSIWSxxLwrM7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git master
branch HEAD: 913a01cff4fae9115e2bcbb6c888b3fe29890029  Merge tag 'sound-5.15-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound

elapsed time: 1238m

configs tested: 166
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211021
sh                         microdev_defconfig
arm                        mvebu_v5_defconfig
powerpc                       eiger_defconfig
ia64                      gensparse_defconfig
arm                         shannon_defconfig
arm                             pxa_defconfig
m68k                        mvme16x_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     asp8347_defconfig
m68k                         apollo_defconfig
arm                            mmp2_defconfig
arm                         vf610m4_defconfig
powerpc                    gamecube_defconfig
h8300                            alldefconfig
powerpc                    amigaone_defconfig
mips                        maltaup_defconfig
arm                      pxa255-idp_defconfig
arm                            hisi_defconfig
s390                             alldefconfig
sh                           se7780_defconfig
powerpc                      mgcoge_defconfig
arm                         lubbock_defconfig
sh                             shx3_defconfig
x86_64                           allyesconfig
m68k                          sun3x_defconfig
arm                         mv78xx0_defconfig
sh                            hp6xx_defconfig
powerpc                      ppc44x_defconfig
arm                  colibri_pxa300_defconfig
powerpc                   bluestone_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     sequoia_defconfig
arm                        magician_defconfig
xtensa                  cadence_csp_defconfig
sh                 kfr2r09-romimage_defconfig
csky                             alldefconfig
powerpc                      ppc40x_defconfig
parisc                           alldefconfig
powerpc                    klondike_defconfig
mips                        bcm47xx_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    adder875_defconfig
mips                malta_qemu_32r6_defconfig
arc                            hsdk_defconfig
xtensa                       common_defconfig
mips                        omega2p_defconfig
mips                         mpc30x_defconfig
um                                  defconfig
arm                         orion5x_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        cerfcube_defconfig
arm                          exynos_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                          g5_defconfig
sparc                       sparc64_defconfig
arm                           viper_defconfig
nios2                         3c120_defconfig
sparc                       sparc32_defconfig
arm                  colibri_pxa270_defconfig
powerpc                      pmac32_defconfig
arm                          gemini_defconfig
arm                        spear6xx_defconfig
powerpc                      ppc6xx_defconfig
arm                        trizeps4_defconfig
parisc                              defconfig
m68k                          atari_defconfig
mips                        qi_lb60_defconfig
m68k                                defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                            zx1_defconfig
powerpc                      obs600_defconfig
sh                          kfr2r09_defconfig
powerpc                         wii_defconfig
powerpc                          allmodconfig
arm                        multi_v5_defconfig
mips                          ath79_defconfig
nios2                               defconfig
mips                       capcella_defconfig
arm                         s5pv210_defconfig
sh                          rsk7201_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rm200_defconfig
ia64                             alldefconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20211021
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20211021
x86_64               randconfig-a015-20211021
x86_64               randconfig-a011-20211021
x86_64               randconfig-a014-20211021
x86_64               randconfig-a016-20211021
x86_64               randconfig-a012-20211021
i386                 randconfig-a012-20211021
i386                 randconfig-a013-20211021
i386                 randconfig-a011-20211021
i386                 randconfig-a016-20211021
i386                 randconfig-a015-20211021
i386                 randconfig-a014-20211021
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20211021
riscv                randconfig-c006-20211021
arm                  randconfig-c002-20211021
x86_64               randconfig-c007-20211021
mips                 randconfig-c004-20211021
s390                 randconfig-c005-20211021
i386                 randconfig-c001-20211021
x86_64               randconfig-a002-20211021
x86_64               randconfig-a004-20211021
x86_64               randconfig-a005-20211021
x86_64               randconfig-a001-20211021
x86_64               randconfig-a006-20211021
x86_64               randconfig-a003-20211021
i386                 randconfig-a004-20211021
i386                 randconfig-a003-20211021
i386                 randconfig-a002-20211021
i386                 randconfig-a005-20211021
i386                 randconfig-a001-20211021
i386                 randconfig-a006-20211021
hexagon              randconfig-r045-20211021
hexagon              randconfig-r041-20211021

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
