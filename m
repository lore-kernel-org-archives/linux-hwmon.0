Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37907C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Feb 2022 07:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbiBOHYu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Feb 2022 02:24:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiBOHYt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Feb 2022 02:24:49 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26222F1EBD
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Feb 2022 23:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644909880; x=1676445880;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GG8Y9zdErvTC045pKFR8ckD1IgW2WLR0g2nwZ9Iu9vQ=;
  b=SqdBbpI6LqAEPUfEy/YnC3egBpX/289UnyK7kywfkeBnoCfEXoPtjiNL
   Vs4pySsiYwLC9KO8OL2OR5vDpJ+zFWIRQtOP6NLzm53zcVI76y3Gc7dBG
   44zJbgtoGnXkhEgvQMXDFjNPKuqSMq8j3O7YTSMqJKGGj9frG4F5orlnY
   dyUF+ayjE9OWL+xSmGWQoVdsv2uOaoGZoisFTknFg5rH5DUFNbm5dJ28d
   v/J/qkDugTjBhKgyMdSZ7scO3kiQozuRdJJSil5S5SCyTMm3aRiOpDUGo
   IEkbVCJuoEWxxKWeGzjFepijP9jXcNGbTJQN747WixueLn1nhvixNJU8U
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250475496"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="250475496"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 23:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="603653191"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2022 23:24:38 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nJsCU-0009NH-6J; Tue, 15 Feb 2022 07:24:38 +0000
Date:   Tue, 15 Feb 2022 15:23:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD REGRESSION
 3a4d707b2fb55435c5380dcc2b3a75c168804464
Message-ID: <620b54f8.BhzHbdPqyRC5sueL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 3a4d707b2fb55435c5380dcc2b3a75c168804464  watchdog: ixp4xx: Implement restart

possible Error/Warning in current branch (please contact us if interested):

drivers/watchdog/max77620_wdt.c:18:10: fatal error: 'linux/mfd/max77714.h' file not found
drivers/watchdog/max77620_wdt.c:18:10: fatal error: linux/mfd/max77714.h: No such file or directory

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- m68k-randconfig-r021-20220214
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory
`-- nios2-randconfig-r004-20220214
    `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h:No-such-file-or-directory

clang_recent_errors
|-- hexagon-randconfig-r022-20220214
|   `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h-file-not-found
`-- i386-randconfig-a005-20220214
    `-- drivers-watchdog-max77620_wdt.c:fatal-error:linux-mfd-max77714.h-file-not-found

elapsed time: 737m

configs tested: 131
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220214
mips                 randconfig-c004-20220214
nios2                            alldefconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
ia64                         bigsur_defconfig
powerpc                   motionpro_defconfig
powerpc                     asp8347_defconfig
arm                          lpd270_defconfig
xtensa                         virt_defconfig
arc                     haps_hs_smp_defconfig
xtensa                              defconfig
mips                          rb532_defconfig
sh                           se7751_defconfig
powerpc                       maple_defconfig
parisc                           alldefconfig
microblaze                          defconfig
m68k                          hp300_defconfig
arm                     eseries_pxa_defconfig
arm                            pleb_defconfig
sh                           se7721_defconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
arm                        mvebu_v7_defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20220214
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
i386                 randconfig-a013-20220214
i386                 randconfig-a016-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
riscv                randconfig-r042-20220214
arc                  randconfig-r043-20220214
s390                 randconfig-r044-20220214
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
riscv                randconfig-c006-20220214
i386                 randconfig-c001-20220214
powerpc              randconfig-c003-20220214
arm                  randconfig-c002-20220214
mips                 randconfig-c004-20220214
arm                         lpc32xx_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
powerpc                     ppa8548_defconfig
powerpc                     mpc5200_defconfig
arm                  colibri_pxa300_defconfig
arm                         bcm2835_defconfig
mips                     cu1830-neo_defconfig
arm                       spear13xx_defconfig
arm                       aspeed_g4_defconfig
arm                          pcm027_defconfig
mips                         tb0287_defconfig
arm                          moxart_defconfig
powerpc                    gamecube_defconfig
mips                     loongson2k_defconfig
arm                       netwinder_defconfig
arm                       versatile_defconfig
powerpc                      ppc44x_defconfig
x86_64               randconfig-a002-20220214
x86_64               randconfig-a006-20220214
x86_64               randconfig-a005-20220214
x86_64               randconfig-a004-20220214
x86_64               randconfig-a003-20220214
x86_64               randconfig-a001-20220214
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
i386                 randconfig-a002-20220214
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
