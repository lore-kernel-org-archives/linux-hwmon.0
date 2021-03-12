Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E451C433DB
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Mar 2021 17:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FEFD64DF2
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Mar 2021 17:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhCLRW5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Mar 2021 12:22:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:7155 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231679AbhCLRWb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Mar 2021 12:22:31 -0500
IronPort-SDR: DxEIYd9aF1JtTw399zdx9oupDdC36ViVXDLbmx0gWwq6aouZ4FU20Q7uMj527QT1SQv4g4pK6A
 hbp1zH5dR+gQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="250228687"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="250228687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 09:22:31 -0800
IronPort-SDR: Nx0r3ZZc09k6MDJimpg/kRjq/+XwnyJ3dxrpBiFvcM51nSoWlYtEvrrqRc5MlWhWlOsDw5cxPf
 Z+grf80qfhMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="372729322"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Mar 2021 09:22:30 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKlUb-0001TW-Bs; Fri, 12 Mar 2021 17:22:29 +0000
Date:   Sat, 13 Mar 2021 01:21:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 d8a08585259268e7b5305d04422a59d713719ccb
Message-ID: <604ba32f.o7nuamesOP8ADUzg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: d8a08585259268e7b5305d04422a59d713719ccb  hwmon: (pmbus/stpddc60) Add ST STPDDC60 pmbus driver

elapsed time: 720m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                               defconfig
sh                          urquell_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                       m5249evb_defconfig
mips                           rs90_defconfig
sparc64                             defconfig
arc                     haps_hs_smp_defconfig
arm                            mps2_defconfig
arm                          pxa910_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                           allyesconfig
ia64                          tiger_defconfig
arm                       netwinder_defconfig
arm                        magician_defconfig
mips                        bcm63xx_defconfig
arm                         cm_x300_defconfig
mips                         db1xxx_defconfig
arm                       aspeed_g5_defconfig
sh                            titan_defconfig
powerpc                      bamboo_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210312
i386                 randconfig-a005-20210312
i386                 randconfig-a002-20210312
i386                 randconfig-a003-20210312
i386                 randconfig-a004-20210312
i386                 randconfig-a006-20210312
x86_64               randconfig-a011-20210312
x86_64               randconfig-a016-20210312
x86_64               randconfig-a013-20210312
x86_64               randconfig-a014-20210312
x86_64               randconfig-a015-20210312
x86_64               randconfig-a012-20210312
i386                 randconfig-a013-20210312
i386                 randconfig-a016-20210312
i386                 randconfig-a011-20210312
i386                 randconfig-a015-20210312
i386                 randconfig-a014-20210312
i386                 randconfig-a012-20210312
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210312
x86_64               randconfig-a001-20210312
x86_64               randconfig-a005-20210312
x86_64               randconfig-a003-20210312
x86_64               randconfig-a002-20210312
x86_64               randconfig-a004-20210312

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
