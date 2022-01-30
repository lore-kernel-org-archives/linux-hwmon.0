Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD54C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jan 2022 14:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238286AbiA3Ohm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Jan 2022 09:37:42 -0500
Received: from mga05.intel.com ([192.55.52.43]:46148 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239166AbiA3Ohl (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Jan 2022 09:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643553461; x=1675089461;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ashMO1JnH7E14uT7cojwXJid0hwTAJPlpuKA9zCGU6w=;
  b=PTZgzW8DZwiwI2Ng5fWunq6rLs5l37zDNZfp0CPi5sIaBd4lfp8oXChX
   kpABHRbE7l+8BwSVh6ula4QP1EdVNQK3jSXqxnwFMJt/wnlYBLqH4EFlw
   W6AY7CcyATnwMDDqQKAz7nKx9Bce7/EKJeoVvjpAvXzAa8A6H1ttg82at
   9zZFZbVSXPz3B/OoKJ1kfMe4xc0PjyzF+U7WtRe8BS60koIExBZQUns8T
   RrYLALGZog6C4OaPgIkUrEvA0o6gqe1f6uyrsYWv/+MDEJfxvyK1YcbJS
   sr/o5rSZOzMKGfAMOzEKVniw+yr0RinZzgEXzk6rMS+I6+h3qF9dNWIM6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="333708646"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="333708646"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 06:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="564688419"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Jan 2022 06:37:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEBKk-000Qc3-KF; Sun, 30 Jan 2022 14:37:38 +0000
Date:   Sun, 30 Jan 2022 22:36:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD REGRESSION
 c00ed93a33886a91023b17f2503d72de49303063
Message-ID: <61f6a279.Uu8SL0hHG5fTzuGn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: c00ed93a33886a91023b17f2503d72de49303063  watchdog: rti-wdt: Add missing pm_runtime_disable() in probe function

Error/Warning reports:

https://lore.kernel.org/linux-hwmon/202201301352.Ip59nzT8-lkp@intel.com
https://lore.kernel.org/llvm/202201301330.qrjqfMhi-lkp@intel.com

Error/Warning in current branch:

drivers/watchdog/max77620_wdt.c:18:10: fatal error: 'linux/mfd/max77714.h' file not found
drivers/watchdog/max77620_wdt.c:18:10: fatal error: linux/mfd/max77714.h: No such file or directory

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- arc-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- arm-allmodconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- arm-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- arm64-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- arm64-randconfig-c024-20220130
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- csky-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- csky-randconfig-r036-20220130
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- h8300-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- i386-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- ia64-allmodconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- ia64-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- m68k-allmodconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- m68k-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- microblaze-buildonly-randconfig-r001-20220130
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- mips-allmodconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- mips-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- nios2-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- parisc-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- powerpc-allmodconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- powerpc-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- riscv-allmodconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- riscv-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- s390-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- sh-allmodconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- sparc-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- sparc-randconfig-r031-20220130
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- x86_64-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- x86_64-randconfig-a011
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
|-- xtensa-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
`-- xtensa-buildonly-randconfig-r004-20220130
    `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory

clang_recent_errors
|-- hexagon-allyesconfig
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h-file-not-found
|-- hexagon-randconfig-r041-20220130
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h-file-not-found
|-- i386-randconfig-a002
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h-file-not-found
`-- i386-randconfig-a015
    `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h-file-not-found

elapsed time: 722m

configs tested: 109
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                 mpc8540_ads_defconfig
m68k                          amiga_defconfig
arm                           u8500_defconfig
sparc64                             defconfig
powerpc                        cell_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           sama5_defconfig
parisc                generic-32bit_defconfig
powerpc                     tqm8541_defconfig
arm                        spear6xx_defconfig
xtensa                           alldefconfig
m68k                                defconfig
i386                             alldefconfig
arm                             rpc_defconfig
powerpc                       eiger_defconfig
powerpc                      pcm030_defconfig
sh                               allmodconfig
sh                      rts7751r2d1_defconfig
arm                         lpc18xx_defconfig
powerpc                      ep88xc_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     ep8248e_defconfig
riscv                    nommu_k210_defconfig
sh                           se7206_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          rsk7264_defconfig
sh                             espt_defconfig
sh                           se7712_defconfig
m68k                             allmodconfig
i386                                defconfig
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
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
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
hexagon                             defconfig
powerpc                 mpc8315_rdb_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
