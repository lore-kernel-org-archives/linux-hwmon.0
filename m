Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7374C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Oct 2021 02:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A40D460E97
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Oct 2021 02:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhJYCS5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Oct 2021 22:18:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:14773 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231992AbhJYCS4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Oct 2021 22:18:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="216463148"
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; 
   d="scan'208";a="216463148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2021 19:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; 
   d="scan'208";a="663867881"
Received: from lkp-server02.sh.intel.com (HELO 74392981b700) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 24 Oct 2021 19:16:33 -0700
Received: from kbuild by 74392981b700 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mepXM-0001GV-Um; Mon, 25 Oct 2021 02:16:32 +0000
Date:   Mon, 25 Oct 2021 10:16:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 c0d79987a0d82671bff374c07f2201f9bdf4aaa2
Message-ID: <61761364.Y16sTEPzcIlkwdek%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c0d79987a0d82671bff374c07f2201f9bdf4aaa2  hwmon: (dell-smm) Speed up setting of fan speed

elapsed time: 4464m

configs tested: 153
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211025
sh                         ap325rxa_defconfig
powerpc                      pcm030_defconfig
mips                     decstation_defconfig
powerpc                      arches_defconfig
sh                            migor_defconfig
powerpc                      pmac32_defconfig
powerpc                      walnut_defconfig
m68k                         amcore_defconfig
arc                        nsim_700_defconfig
powerpc                        cell_defconfig
s390                          debug_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                           se7751_defconfig
xtensa                          iss_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7705_defconfig
mips                      pic32mzda_defconfig
mips                      bmips_stb_defconfig
arm                           h5000_defconfig
nios2                            alldefconfig
arm                       mainstone_defconfig
mips                          rb532_defconfig
arm                           sunxi_defconfig
arm                         hackkit_defconfig
arc                        vdk_hs38_defconfig
sh                          rsk7269_defconfig
powerpc                      obs600_defconfig
arc                         haps_hs_defconfig
arm                            pleb_defconfig
mips                         bigsur_defconfig
sh                              ul2_defconfig
i386                             alldefconfig
powerpc                 mpc8313_rdb_defconfig
sparc                       sparc32_defconfig
sparc64                          alldefconfig
sh                        sh7785lcr_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc8272_ads_defconfig
arm                            xcep_defconfig
powerpc                     kmeter1_defconfig
openrisc                         alldefconfig
powerpc                     tqm8548_defconfig
arm                       spear13xx_defconfig
mips                 decstation_r4k_defconfig
powerpc                   bluestone_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
arm                          pxa3xx_defconfig
nios2                         3c120_defconfig
powerpc                        warp_defconfig
arm                        mvebu_v7_defconfig
arm                            dove_defconfig
mips                          ath79_defconfig
arm                  colibri_pxa300_defconfig
mips                        omega2p_defconfig
mips                        maltaup_defconfig
powerpc                      ppc6xx_defconfig
arm                         orion5x_defconfig
mips                    maltaup_xpa_defconfig
arm                          ep93xx_defconfig
mips                           ip32_defconfig
arm                  randconfig-c002-20211025
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                              allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                             allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20211024
x86_64               randconfig-a004-20211024
x86_64               randconfig-a005-20211024
x86_64               randconfig-a006-20211024
x86_64               randconfig-a003-20211024
x86_64               randconfig-a001-20211024
i386                 randconfig-a003-20211024
i386                 randconfig-a004-20211024
i386                 randconfig-a002-20211024
i386                 randconfig-a005-20211024
i386                 randconfig-a006-20211024
i386                 randconfig-a001-20211024
i386                 randconfig-a012-20211025
i386                 randconfig-a013-20211025
i386                 randconfig-a011-20211025
i386                 randconfig-a016-20211025
i386                 randconfig-a015-20211025
i386                 randconfig-a014-20211025
x86_64               randconfig-a002-20211022
x86_64               randconfig-a004-20211022
x86_64               randconfig-a005-20211022
x86_64               randconfig-a001-20211022
x86_64               randconfig-a006-20211022
x86_64               randconfig-a003-20211022
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a013-20211022
x86_64               randconfig-a015-20211022
x86_64               randconfig-a011-20211022
x86_64               randconfig-a014-20211022
x86_64               randconfig-a016-20211022
x86_64               randconfig-a012-20211022
hexagon              randconfig-r045-20211025
hexagon              randconfig-r041-20211025
riscv                randconfig-r042-20211022
s390                 randconfig-r044-20211022
hexagon              randconfig-r045-20211022
hexagon              randconfig-r041-20211022

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
