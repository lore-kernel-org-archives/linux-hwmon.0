Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F568C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Aug 2021 07:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3811760187
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Aug 2021 07:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235983AbhHDHwf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Aug 2021 03:52:35 -0400
Received: from mga14.intel.com ([192.55.52.115]:64094 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235977AbhHDHwf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 4 Aug 2021 03:52:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="213601947"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="213601947"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 00:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="670851511"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2021 00:52:21 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mBBhM-000Eh4-Oh; Wed, 04 Aug 2021 07:52:20 +0000
Date:   Wed, 04 Aug 2021 15:51:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 ae832e297be7d8cc9b4417058d1de57a9af35eff
Message-ID: <610a470d.M/Bf2gdxbtAdAfzD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: ae832e297be7d8cc9b4417058d1de57a9af35eff  hwmon: (w83781d) Match on device tree compatibles

elapsed time: 726m

configs tested: 89
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210803
mips                           ip28_defconfig
arm                        cerfcube_defconfig
arm                        neponset_defconfig
arc                        nsimosci_defconfig
arm                         socfpga_defconfig
sh                           se7724_defconfig
powerpc                    mvme5100_defconfig
mips                      bmips_stb_defconfig
m68k                                defconfig
powerpc                 mpc832x_mds_defconfig
mips                        qi_lb60_defconfig
arm                           u8500_defconfig
arm                     am200epdkit_defconfig
mips                        nlm_xlr_defconfig
mips                      fuloong2e_defconfig
x86_64                           alldefconfig
arm                            xcep_defconfig
arm                          ep93xx_defconfig
mips                       rbtx49xx_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210803
x86_64               randconfig-a004-20210803
x86_64               randconfig-a006-20210803
x86_64               randconfig-a003-20210803
x86_64               randconfig-a001-20210803
x86_64               randconfig-a005-20210803
i386                 randconfig-a005-20210804
i386                 randconfig-a004-20210804
i386                 randconfig-a002-20210804
i386                 randconfig-a006-20210804
i386                 randconfig-a003-20210804
i386                 randconfig-a001-20210804
x86_64               randconfig-a012-20210804
x86_64               randconfig-a016-20210804
x86_64               randconfig-a011-20210804
x86_64               randconfig-a013-20210804
x86_64               randconfig-a014-20210804
x86_64               randconfig-a015-20210804
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
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
