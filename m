Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2DFC4338F
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 06:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DA9860F4F
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 06:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbhG0Ga6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jul 2021 02:30:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:25116 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234226AbhG0Ga6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jul 2021 02:30:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="234243679"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="234243679"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 23:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="664981000"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2021 23:30:57 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m8GcC-0006ZG-7F; Tue, 27 Jul 2021 06:30:56 +0000
Date:   Tue, 27 Jul 2021 14:29:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 ac48f3b2773e7725ae9f41a068725ea56882df44
Message-ID: <60ffa7e6.p2qs4Ta4zzf8PeBq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: ac48f3b2773e7725ae9f41a068725ea56882df44  watchdog: iTCO_wdt: Fix detection of SMI-off case

elapsed time: 726m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210726
i386                 randconfig-c001-20210727
arm                         lpc18xx_defconfig
powerpc                    socrates_defconfig
powerpc                       holly_defconfig
xtensa                          iss_defconfig
sh                        dreamcast_defconfig
xtensa                              defconfig
sh                           se7722_defconfig
arm                            qcom_defconfig
powerpc                   lite5200b_defconfig
arm                          pcm027_defconfig
mips                            gpr_defconfig
arm                            mps2_defconfig
mips                     loongson2k_defconfig
m68k                          atari_defconfig
sh                         microdev_defconfig
powerpc                          g5_defconfig
mips                             allmodconfig
arm                        oxnas_v6_defconfig
arm64                            alldefconfig
parisc                generic-64bit_defconfig
arm                           omap1_defconfig
arm                             ezx_defconfig
arc                          axs103_defconfig
arc                        vdk_hs38_defconfig
m68k                       m5249evb_defconfig
sh                          sdk7786_defconfig
arm                         mv78xx0_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                           rs90_defconfig
riscv                    nommu_virt_defconfig
m68k                        mvme147_defconfig
sh                     magicpanelr2_defconfig
powerpc                 linkstation_defconfig
sparc                               defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
arm                           spitz_defconfig
ia64                             alldefconfig
parisc                              defconfig
mips                      pic32mzda_defconfig
xtensa                  audio_kc705_defconfig
mips                           ci20_defconfig
arm                      jornada720_defconfig
mips                     cu1830-neo_defconfig
sh                          urquell_defconfig
mips                        bcm47xx_defconfig
arm                          exynos_defconfig
powerpc                     stx_gp3_defconfig
um                             i386_defconfig
sh                   sh7770_generic_defconfig
sh                              ul2_defconfig
openrisc                  or1klitex_defconfig
sh                             espt_defconfig
mips                        nlm_xlp_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
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
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210726
i386                 randconfig-a003-20210726
i386                 randconfig-a004-20210726
i386                 randconfig-a002-20210726
i386                 randconfig-a001-20210726
i386                 randconfig-a006-20210726
i386                 randconfig-a005-20210727
i386                 randconfig-a003-20210727
i386                 randconfig-a004-20210727
i386                 randconfig-a002-20210727
i386                 randconfig-a001-20210727
i386                 randconfig-a006-20210727
x86_64               randconfig-a011-20210727
x86_64               randconfig-a016-20210727
x86_64               randconfig-a013-20210727
x86_64               randconfig-a014-20210727
x86_64               randconfig-a012-20210727
x86_64               randconfig-a015-20210727
i386                 randconfig-a016-20210727
i386                 randconfig-a013-20210727
i386                 randconfig-a012-20210727
i386                 randconfig-a011-20210727
i386                 randconfig-a014-20210727
i386                 randconfig-a015-20210727
i386                 randconfig-a016-20210726
i386                 randconfig-a013-20210726
i386                 randconfig-a012-20210726
i386                 randconfig-a011-20210726
i386                 randconfig-a014-20210726
i386                 randconfig-a015-20210726
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210726
x86_64               randconfig-a003-20210725
x86_64               randconfig-a006-20210725
x86_64               randconfig-a001-20210725
x86_64               randconfig-a005-20210725
x86_64               randconfig-a004-20210725
x86_64               randconfig-a002-20210725
x86_64               randconfig-a003-20210727
x86_64               randconfig-a006-20210727
x86_64               randconfig-a001-20210727
x86_64               randconfig-a005-20210727
x86_64               randconfig-a004-20210727
x86_64               randconfig-a002-20210727
x86_64               randconfig-a011-20210726
x86_64               randconfig-a016-20210726
x86_64               randconfig-a013-20210726
x86_64               randconfig-a014-20210726
x86_64               randconfig-a012-20210726
x86_64               randconfig-a015-20210726

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
