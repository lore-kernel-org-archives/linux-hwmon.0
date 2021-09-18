Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0A9C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Sep 2021 21:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 197BA6103B
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Sep 2021 21:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239177AbhIRVUL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Sep 2021 17:20:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:52803 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239062AbhIRVUL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Sep 2021 17:20:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10111"; a="223020258"
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; 
   d="scan'208";a="223020258"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2021 14:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; 
   d="scan'208";a="531770592"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2021 14:18:45 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mRhjQ-00057x-QO; Sat, 18 Sep 2021 21:18:44 +0000
Date:   Sun, 19 Sep 2021 05:18:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 cd0b8e410937d43a7b2c2e04cd39b5e48ed252fc
Message-ID: <6146578f.8/fmo8I1AotBmWTX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: cd0b8e410937d43a7b2c2e04cd39b5e48ed252fc  hwmon: (nct6775) Support access via Asus WMI

elapsed time: 1328m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      mgcoge_defconfig
arm                         mv78xx0_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ppc44x_defconfig
powerpc                 linkstation_defconfig
arm                          exynos_defconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
mips                       lemote2f_defconfig
arm                         at91_dt_defconfig
powerpc                      obs600_defconfig
powerpc                      walnut_defconfig
sh                        dreamcast_defconfig
um                                  defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7269_defconfig
arm                            mmp2_defconfig
powerpc                     tqm8560_defconfig
microblaze                          defconfig
powerpc                     mpc5200_defconfig
mips                           ip28_defconfig
sh                           se7712_defconfig
arm                      footbridge_defconfig
arm                        vexpress_defconfig
sh                           se7721_defconfig
powerpc                      tqm8xx_defconfig
sh                          kfr2r09_defconfig
arm                       multi_v4t_defconfig
mips                          ath79_defconfig
x86_64               randconfig-c001-20210919
i386                 randconfig-c001-20210919
arm                  randconfig-c002-20210919
ia64                             allmodconfig
ia64                                defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a013-20210918
x86_64               randconfig-a016-20210918
x86_64               randconfig-a012-20210918
x86_64               randconfig-a011-20210918
x86_64               randconfig-a014-20210918
x86_64               randconfig-a015-20210918
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
i386                 randconfig-a016-20210918
i386                 randconfig-a012-20210918
i386                 randconfig-a011-20210918
i386                 randconfig-a015-20210918
i386                 randconfig-a013-20210918
i386                 randconfig-a014-20210918
riscv                randconfig-r042-20210918
s390                 randconfig-r044-20210918
arc                  randconfig-r043-20210918
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210918
x86_64               randconfig-a004-20210918
x86_64               randconfig-a006-20210918
x86_64               randconfig-a003-20210918
x86_64               randconfig-a001-20210918
x86_64               randconfig-a005-20210918
i386                 randconfig-a004-20210918
i386                 randconfig-a005-20210918
i386                 randconfig-a002-20210918
i386                 randconfig-a006-20210918
i386                 randconfig-a001-20210918
i386                 randconfig-a003-20210918
hexagon              randconfig-r045-20210918
hexagon              randconfig-r041-20210918
riscv                randconfig-r042-20210919
hexagon              randconfig-r045-20210919
s390                 randconfig-r044-20210919
hexagon              randconfig-r041-20210919

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
