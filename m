Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12679C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 17:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E237160F57
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 17:05:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhHLRFb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Aug 2021 13:05:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:38856 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234042AbhHLRFb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Aug 2021 13:05:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="276436592"
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; 
   d="scan'208";a="276436592"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 10:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; 
   d="scan'208";a="507845711"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Aug 2021 10:04:57 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mEE8X-000MoD-6V; Thu, 12 Aug 2021 17:04:57 +0000
Date:   Fri, 13 Aug 2021 01:04:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 84fdde0385d41f3e7c4911feaecc119ff70bf570
Message-ID: <61155493./KnBvbqfZ7d4P2T9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 84fdde0385d41f3e7c4911feaecc119ff70bf570  hwmon: (pmbus/bpa-rs600) Add workaround for incorrect Pin max

elapsed time: 726m

configs tested: 152
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210812
mips                      pic32mzda_defconfig
nios2                            allyesconfig
riscv                    nommu_virt_defconfig
arm                      footbridge_defconfig
arm                         assabet_defconfig
arm                        mvebu_v5_defconfig
xtensa                       common_defconfig
sh                            hp6xx_defconfig
powerpc                     tqm8560_defconfig
sh                        sh7785lcr_defconfig
m68k                          amiga_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     pseries_defconfig
m68k                         amcore_defconfig
powerpc                        cell_defconfig
mips                        bcm63xx_defconfig
sh                   sh7724_generic_defconfig
powerpc                 mpc8540_ads_defconfig
csky                                defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
m68k                       m5208evb_defconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
arm                   milbeaut_m10v_defconfig
mips                         cobalt_defconfig
s390                          debug_defconfig
openrisc                  or1klitex_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           ip32_defconfig
xtensa                              defconfig
mips                           ip22_defconfig
mips                   sb1250_swarm_defconfig
arm                         nhk8815_defconfig
m68k                         apollo_defconfig
arm                         s3c2410_defconfig
arm                          pxa168_defconfig
arm                  colibri_pxa300_defconfig
arm                           h3600_defconfig
powerpc                 mpc836x_mds_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210812
x86_64               randconfig-a004-20210812
x86_64               randconfig-a003-20210812
x86_64               randconfig-a005-20210812
x86_64               randconfig-a002-20210812
x86_64               randconfig-a001-20210812
i386                 randconfig-a004-20210812
i386                 randconfig-a003-20210812
i386                 randconfig-a002-20210812
i386                 randconfig-a001-20210812
i386                 randconfig-a006-20210812
i386                 randconfig-a005-20210812
i386                 randconfig-a004-20210811
i386                 randconfig-a001-20210811
i386                 randconfig-a002-20210811
i386                 randconfig-a003-20210811
i386                 randconfig-a006-20210811
i386                 randconfig-a005-20210811
x86_64               randconfig-a013-20210811
x86_64               randconfig-a011-20210811
x86_64               randconfig-a012-20210811
x86_64               randconfig-a016-20210811
x86_64               randconfig-a014-20210811
x86_64               randconfig-a015-20210811
i386                 randconfig-a011-20210811
i386                 randconfig-a015-20210811
i386                 randconfig-a014-20210811
i386                 randconfig-a013-20210811
i386                 randconfig-a016-20210811
i386                 randconfig-a012-20210811
i386                 randconfig-a011-20210812
i386                 randconfig-a015-20210812
i386                 randconfig-a013-20210812
i386                 randconfig-a014-20210812
i386                 randconfig-a016-20210812
i386                 randconfig-a012-20210812
x86_64               randconfig-a004-20210810
x86_64               randconfig-a006-20210810
x86_64               randconfig-a003-20210810
x86_64               randconfig-a005-20210810
x86_64               randconfig-a002-20210810
x86_64               randconfig-a001-20210810
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210812
x86_64               randconfig-c001-20210810
x86_64               randconfig-a011-20210812
x86_64               randconfig-a013-20210812
x86_64               randconfig-a012-20210812
x86_64               randconfig-a016-20210812
x86_64               randconfig-a015-20210812
x86_64               randconfig-a014-20210812
x86_64               randconfig-a013-20210810
x86_64               randconfig-a011-20210810
x86_64               randconfig-a012-20210810
x86_64               randconfig-a016-20210810
x86_64               randconfig-a014-20210810
x86_64               randconfig-a015-20210810
x86_64               randconfig-a004-20210811
x86_64               randconfig-a006-20210811
x86_64               randconfig-a003-20210811
x86_64               randconfig-a002-20210811
x86_64               randconfig-a005-20210811
x86_64               randconfig-a001-20210811

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
