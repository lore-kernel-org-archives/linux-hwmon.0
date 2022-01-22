Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9237CC433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Jan 2022 03:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbiAVDcR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 22:32:17 -0500
Received: from mga04.intel.com ([192.55.52.120]:44614 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231519AbiAVDcR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 22:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642822337; x=1674358337;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G6V9UWvWksZWnccPEH1FSaSEIK9WEmWAO90tf3Ibb38=;
  b=Zs90/tneNnJhV61K7U8/x/nD3ir0o30V4nwpQsHFpd93XKjMjm8tz5gM
   ORnK2ZzRFb7xUWT9//1M5XftHFqqaQav82LmEMFDRm2ZlSLQfEX7M5y6f
   BAdOYjF5qATiEqwWA8GNa8vesfn3knz/uAS7MFQ4f8+/b6Vwzfa4ZlL5W
   T4atLmQ4C3Hl441o4rbNmX08i0Ak7+1tbLQmoeNeKGYoo9QAasBaGSwSN
   vjFG+i7OtEQkpv+vMslA70ZeuMG6wQeo1NiHXtiM48Z7dzfSGxTVHr7m3
   gsJGibkt/PTJMTaxLLdIMlOlPvLocKPK2rByYQqj/p8HPX3iRWDUBVcLq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="244609234"
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; 
   d="scan'208";a="244609234"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 19:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; 
   d="scan'208";a="562092031"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jan 2022 19:32:15 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nB78Q-000FyP-PN; Sat, 22 Jan 2022 03:32:14 +0000
Date:   Sat, 22 Jan 2022 11:31:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 fd1e38c44d122aeac09598aea05606d61bdb8735
Message-ID: <61eb7a96.EHSTaNEv8SRDZmb4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: fd1e38c44d122aeac09598aea05606d61bdb8735  hwmon: (adt7470) Prevent divide by zero in adt7470_fan_write()

elapsed time: 723m

configs tested: 165
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
mips                 randconfig-c004-20220120
i386                 randconfig-c001-20220117
sh                          polaris_defconfig
nds32                             allnoconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc837x_rdb_defconfig
s390                             allyesconfig
sh                             espt_defconfig
arm                        keystone_defconfig
openrisc                 simple_smp_defconfig
mips                         bigsur_defconfig
arm                           h3600_defconfig
m68k                          multi_defconfig
m68k                            q40_defconfig
powerpc                  storcenter_defconfig
arc                     nsimosci_hs_defconfig
xtensa                  nommu_kc705_defconfig
sh                                  defconfig
sh                          rsk7203_defconfig
mips                          rb532_defconfig
arm                         lpc18xx_defconfig
arm                          exynos_defconfig
mips                         tb0226_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                                defconfig
sh                           se7206_defconfig
ia64                          tiger_defconfig
parisc                           allyesconfig
arm                         nhk8815_defconfig
arm                          pxa3xx_defconfig
sh                 kfr2r09-romimage_defconfig
sh                           se7712_defconfig
m68k                          sun3x_defconfig
m68k                         amcore_defconfig
powerpc                       ppc64_defconfig
xtensa                    xip_kc705_defconfig
arm                           viper_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        multi_v7_defconfig
mips                           gcw0_defconfig
nios2                         10m50_defconfig
mips                             allyesconfig
arm                           h5000_defconfig
sh                           se7751_defconfig
sh                          sdk7780_defconfig
ia64                            zx1_defconfig
mips                         rt305x_defconfig
sh                          r7780mp_defconfig
arm                        oxnas_v6_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
arm                  randconfig-c002-20220121
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220121
arc                  randconfig-r043-20220121
s390                 randconfig-r044-20220121
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
arm                  randconfig-c002-20220122
riscv                randconfig-c006-20220122
powerpc              randconfig-c003-20220122
mips                 randconfig-c004-20220122
i386                          randconfig-c001
arm                  randconfig-c002-20220120
riscv                randconfig-c006-20220120
powerpc              randconfig-c003-20220120
mips                 randconfig-c004-20220120
mips                           rs90_defconfig
powerpc                     tqm8540_defconfig
powerpc                      pmac32_defconfig
powerpc                       ebony_defconfig
riscv                            alldefconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        bcm63xx_defconfig
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220120
hexagon              randconfig-r045-20220120
hexagon              randconfig-r041-20220120
hexagon              randconfig-r045-20220121
hexagon              randconfig-r041-20220121

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
