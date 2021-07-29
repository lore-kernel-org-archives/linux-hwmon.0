Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C38C4320A
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 16:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 412B060F0F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 16:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhG2Qeh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jul 2021 12:34:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:49963 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhG2Qeh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jul 2021 12:34:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="276704515"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; 
   d="scan'208";a="276704515"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2021 09:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; 
   d="scan'208";a="581401161"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2021 09:34:30 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m98zN-0009EY-Dt; Thu, 29 Jul 2021 16:34:29 +0000
Date:   Fri, 30 Jul 2021 00:33:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 2b250702df1bea678c2135e5aa309698d59d867c
Message-ID: <6102d86f.Gzb4TDrdtJ/4MK4z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 2b250702df1bea678c2135e5aa309698d59d867c  watchdog: max63xx_wdt: Add device tree probing

elapsed time: 722m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210728
powerpc                         ps3_defconfig
powerpc                      chrp32_defconfig
sparc64                          alldefconfig
mips                       rbtx49xx_defconfig
m68k                            mac_defconfig
sh                     sh7710voipgw_defconfig
nds32                             allnoconfig
powerpc                     kilauea_defconfig
m68k                          multi_defconfig
sh                          polaris_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                       holly_defconfig
x86_64                              defconfig
arm                       spear13xx_defconfig
mips                     cu1830-neo_defconfig
sh                          rsk7264_defconfig
sh                           se7751_defconfig
openrisc                            defconfig
powerpc                     mpc5200_defconfig
powerpc                    adder875_defconfig
sh                          r7780mp_defconfig
mips                           mtx1_defconfig
arm                        vexpress_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210728
x86_64               randconfig-a003-20210728
x86_64               randconfig-a001-20210728
x86_64               randconfig-a004-20210728
x86_64               randconfig-a005-20210728
x86_64               randconfig-a002-20210728
i386                 randconfig-a005-20210728
i386                 randconfig-a003-20210728
i386                 randconfig-a004-20210728
i386                 randconfig-a002-20210728
i386                 randconfig-a001-20210728
i386                 randconfig-a006-20210728
x86_64               randconfig-a016-20210729
x86_64               randconfig-a011-20210729
x86_64               randconfig-a014-20210729
x86_64               randconfig-a013-20210729
x86_64               randconfig-a012-20210729
x86_64               randconfig-a015-20210729
i386                 randconfig-a016-20210728
i386                 randconfig-a012-20210728
i386                 randconfig-a013-20210728
i386                 randconfig-a014-20210728
i386                 randconfig-a011-20210728
i386                 randconfig-a015-20210728
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
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210728
x86_64               randconfig-a016-20210728
x86_64               randconfig-a011-20210728
x86_64               randconfig-a014-20210728
x86_64               randconfig-a013-20210728
x86_64               randconfig-a012-20210728
x86_64               randconfig-a015-20210728

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
