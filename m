Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4444C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jan 2022 04:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346501AbiASEIc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jan 2022 23:08:32 -0500
Received: from mga14.intel.com ([192.55.52.115]:13583 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351549AbiASEIU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jan 2022 23:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642565300; x=1674101300;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rcxrHez4U9owUq2bD1klESSrOncsXK/Syks8hRt7g/g=;
  b=W1nbBYaUxS48Rbs+sONCz6JRkV9vGhWKk4wmR4Hr6JX0t//CBvsvcaOb
   IvWeR4Ujt3mhty65aPtzH6DHnaU7Xd1aqOtu+KBhJCnYfX+v5Yp3rYSX3
   8+QOTRbTJZsHnOsnTWHDpzMEq+3a/twUOTD/jI+f5XfKA3nrrm+YrHDEQ
   bmbuCigY5T2uwnGMhnGnZ62bjP2f7c9NY7R39N/o/tm+jFzaVlgNptVAo
   aGztYHu2xaI8gpKZaQAojWumTMdYJctVQCczJ4gokQlztT1apCZnF8LWB
   +fkjhQ3VkHVAz36vX95+lujFNxK32HdTsh77qk74x/n4oActG9IDrOB6n
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245173746"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="245173746"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 20:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="578687210"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2022 20:08:18 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nA2Gf-000DEW-Sl; Wed, 19 Jan 2022 04:08:17 +0000
Date:   Wed, 19 Jan 2022 12:07:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 125081a6261631269181a27f941437162d414012
Message-ID: <61e78e84.jmJXU4vPz4tKQ8ND%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 125081a6261631269181a27f941437162d414012  hwmon: (pmbus/ir38064) Mark ir38064_of_match as __maybe_unused

elapsed time: 723m

configs tested: 155
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220117
mips                 randconfig-c004-20220117
sh                          kfr2r09_defconfig
arm                           stm32_defconfig
arm                        mvebu_v7_defconfig
xtensa                  cadence_csp_defconfig
mips                         db1xxx_defconfig
arm64                            alldefconfig
sh                        dreamcast_defconfig
arc                        vdk_hs38_defconfig
ia64                                defconfig
arm                            lart_defconfig
m68k                          sun3x_defconfig
arm                          simpad_defconfig
arm                        trizeps4_defconfig
openrisc                            defconfig
sh                   sh7770_generic_defconfig
arc                           tb10x_defconfig
arm                        oxnas_v6_defconfig
m68k                          hp300_defconfig
powerpc                      chrp32_defconfig
xtensa                         virt_defconfig
powerpc                        cell_defconfig
sh                      rts7751r2d1_defconfig
arm                         vf610m4_defconfig
alpha                            allyesconfig
nios2                         3c120_defconfig
sh                           se7721_defconfig
powerpc                     rainier_defconfig
powerpc                       ppc64_defconfig
arm                       imx_v6_v7_defconfig
arm                           tegra_defconfig
m68k                       m5275evb_defconfig
i386                                defconfig
sh                           se7750_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                 randconfig-a012-20220117
i386                 randconfig-a016-20220117
i386                 randconfig-a014-20220117
i386                 randconfig-a015-20220117
i386                 randconfig-a011-20220117
i386                 randconfig-a013-20220117
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
s390                 randconfig-r044-20220117
arc                  randconfig-r043-20220118
riscv                randconfig-r042-20220119
s390                 randconfig-r044-20220119
arc                  randconfig-r043-20220119
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
arm                  randconfig-c002-20220118
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
s390                 randconfig-c005-20220118
mips                 randconfig-c004-20220118
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
arm                  randconfig-c002-20220119
riscv                randconfig-c006-20220119
powerpc              randconfig-c003-20220119
s390                 randconfig-c005-20220119
mips                 randconfig-c004-20220119
arm                                 defconfig
riscv                            alldefconfig
arm                            mmp2_defconfig
powerpc                     kilauea_defconfig
i386                             allyesconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      ppc64e_defconfig
x86_64               randconfig-a001-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a006-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220116
hexagon              randconfig-r045-20220117
hexagon              randconfig-r045-20220118
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220118
s390                 randconfig-r044-20220118
s390                 randconfig-r044-20220116
hexagon              randconfig-r041-20220116
hexagon              randconfig-r041-20220117
riscv                randconfig-r042-20220118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
