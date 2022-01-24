Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3316FC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 15:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbiAXPx4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 10:53:56 -0500
Received: from mga01.intel.com ([192.55.52.88]:5415 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233066AbiAXPxz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 10:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643039635; x=1674575635;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RHLaopbbNKhNH9XO8ed4sWwveMBbtS/ib7HvQSvl5fs=;
  b=P6YBpJDpPmxmYzKcXomkOaey/ETxD9WgLmi4y/Mj9kIgS/SH3/De9id7
   hQ9QTIzibJLiGT1iDdd5rrpYppbXvnSqiS5rLAtIDhdF6Qi3hGeniuxng
   fkVocClIU0MuGa4fX0h2FWxqWWkqdfVSjIiAuLad7xUJN2CieWxldEogP
   tSYZ7eCwqeGoK5HyMLU5tQESsPsRV9vU65DEohhFfHnhsPxRJzcgIh4OH
   GJyMq+TfB2XLd/iDhdP87Nj+0W8QiiL3KC8o9q0XGxiJbp66SduPLf/05
   w3PpbFyC5UUq536fM3zsUzVLnFdPzImGSw7emOHrzKG6faILcxzkFHmvi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270509840"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="270509840"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="627538293"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2022 07:53:53 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nC1fF-000IZJ-9I; Mon, 24 Jan 2022 15:53:53 +0000
Date:   Mon, 24 Jan 2022 23:53:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 9b9f1e670d2c61c676039474fd2d98ca0a54ff75
Message-ID: <61eecb75.kGgc0Jf/PxS36rl0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9b9f1e670d2c61c676039474fd2d98ca0a54ff75  hwmon: (powr1220) Add support for Lattice's POWR1014 power manager IC

Error/Warning reports:

https://lore.kernel.org/linux-hwmon/202201241606.4m6075np-lkp@intel.com
https://lore.kernel.org/linux-hwmon/202201241714.m6MHXXnD-lkp@intel.com
https://lore.kernel.org/llvm/202201241605.pf50OsUm-lkp@intel.com

Error/Warning in current branch:

drivers/hwmon/lm83.c:159:21: error: variable 'lm83_regmap_config' has initializer but incomplete type
drivers/hwmon/lm83.c:159:35: error: storage size of 'lm83_regmap_config' isn't known
drivers/hwmon/lm83.c:160:10: error: 'const struct regmap_config' has no member named 'reg_bits'
drivers/hwmon/lm83.c:160:21: warning: excess elements in struct initializer
drivers/hwmon/lm83.c:161:10: error: 'const struct regmap_config' has no member named 'val_bits'
drivers/hwmon/lm83.c:162:10: error: 'const struct regmap_config' has no member named 'cache_type'
drivers/hwmon/lm83.c:163:10: error: 'const struct regmap_config' has no member named 'volatile_reg'
drivers/hwmon/lm83.c:164:10: error: 'const struct regmap_config' has no member named 'reg_read'
drivers/hwmon/lm83.c:165:10: error: 'const struct regmap_config' has no member named 'reg_write'
drivers/hwmon/lm83.c:383:22: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/hwmon/lm83.c:383:24: error: implicit declaration of function 'devm_regmap_init' [-Werror=implicit-function-declaration]
drivers/hwmon/powr1220.c:185:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]

possible Error/Warning in current branch (please contact us if interested):

drivers/hwmon/powr1220.c:193:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- mips-gpr_defconfig
    |-- drivers-hwmon-lm83.c:error:const-struct-regmap_config-has-no-member-named-cache_type
    |-- drivers-hwmon-lm83.c:error:const-struct-regmap_config-has-no-member-named-reg_bits
    |-- drivers-hwmon-lm83.c:error:const-struct-regmap_config-has-no-member-named-reg_read
    |-- drivers-hwmon-lm83.c:error:const-struct-regmap_config-has-no-member-named-reg_write
    |-- drivers-hwmon-lm83.c:error:const-struct-regmap_config-has-no-member-named-val_bits
    |-- drivers-hwmon-lm83.c:error:const-struct-regmap_config-has-no-member-named-volatile_reg
    |-- drivers-hwmon-lm83.c:error:implicit-declaration-of-function-devm_regmap_init
    |-- drivers-hwmon-lm83.c:error:storage-size-of-lm83_regmap_config-isn-t-known
    |-- drivers-hwmon-lm83.c:error:variable-lm83_regmap_config-has-initializer-but-incomplete-type
    |-- drivers-hwmon-lm83.c:warning:assignment-to-struct-regmap-from-int-makes-pointer-from-integer-without-a-cast
    `-- drivers-hwmon-lm83.c:warning:excess-elements-in-struct-initializer

clang_recent_errors
|-- hexagon-randconfig-r032-20220123
|   `-- drivers-hwmon-powr1220.c:warning:unannotated-fall-through-between-switch-labels
|-- x86_64-randconfig-a012-20220124
|   `-- drivers-hwmon-powr1220.c:warning:unannotated-fall-through-between-switch-labels
|-- x86_64-randconfig-a013-20220124
|   `-- drivers-hwmon-powr1220.c:warning:unannotated-fall-through-between-switch-labels
`-- x86_64-randconfig-a016-20220124
    `-- drivers-hwmon-powr1220.c:warning:unannotated-fall-through-between-switch-labels

elapsed time: 724m

configs tested: 119
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
arc                 nsimosci_hs_smp_defconfig
arm                       imx_v6_v7_defconfig
i386                                defconfig
xtensa                       common_defconfig
m68k                          multi_defconfig
sh                          landisk_defconfig
sh                          r7780mp_defconfig
parisc                              defconfig
powerpc                       eiger_defconfig
arm                         cm_x300_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc837x_mds_defconfig
sh                          rsk7269_defconfig
arm                         vf610m4_defconfig
sh                            shmin_defconfig
sparc                       sparc32_defconfig
xtensa                           allyesconfig
mips                     loongson1b_defconfig
i386                             alldefconfig
arc                        vdk_hs38_defconfig
sh                           se7780_defconfig
sh                         ap325rxa_defconfig
arc                         haps_hs_defconfig
powerpc                     mpc83xx_defconfig
h8300                            alldefconfig
powerpc                     tqm8541_defconfig
sh                          sdk7780_defconfig
mips                            gpr_defconfig
microblaze                      mmu_defconfig
mips                         cobalt_defconfig
arm                  randconfig-c002-20220123
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
powerpc                 mpc832x_rdb_defconfig
arm                   milbeaut_m10v_defconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220123
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
