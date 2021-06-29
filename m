Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095C6C11F66
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 05:16:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E235361DC5
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 05:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhF2FTX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Jun 2021 01:19:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:43609 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhF2FTW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Jun 2021 01:19:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="229710149"
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; 
   d="scan'208";a="229710149"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 22:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; 
   d="scan'208";a="446893279"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jun 2021 22:16:42 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ly670-0008uq-9t; Tue, 29 Jun 2021 05:16:42 +0000
Date:   Tue, 29 Jun 2021 13:16:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 4085a54cef04dbc121b0af7cd06f79df9c9f6a44
Message-ID: <60daac93.SYxwsbjbGstDSKeS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 4085a54cef04dbc121b0af7cd06f79df9c9f6a44  watchdog: bcm2835_wdt: consider system-power-controller property

elapsed time: 728m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
arm                         palmz72_defconfig
powerpc                         wii_defconfig
m68k                        stmark2_defconfig
powerpc                     akebono_defconfig
m68k                       m5249evb_defconfig
powerpc                     sbc8548_defconfig
mips                           ip22_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
m68k                            mac_defconfig
mips                           ci20_defconfig
arm                           sunxi_defconfig
arc                          axs101_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                    gamecube_defconfig
mips                     loongson2k_defconfig
arm                     eseries_pxa_defconfig
powerpc                      obs600_defconfig
mips                           ip27_defconfig
mips                           jazz_defconfig
arm                          pcm027_defconfig
mips                     loongson1c_defconfig
arm                       netwinder_defconfig
arm                        oxnas_v6_defconfig
sh                          urquell_defconfig
powerpc                    socrates_defconfig
powerpc                       ppc64_defconfig
arm                          pxa910_defconfig
arm                         lpc18xx_defconfig
arm                             ezx_defconfig
m68k                          multi_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     tqm8541_defconfig
mips                        omega2p_defconfig
microblaze                      mmu_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                  decstation_64_defconfig
arm                          collie_defconfig
mips                      maltaaprp_defconfig
mips                           ip28_defconfig
nios2                         3c120_defconfig
arm                          moxart_defconfig
arm                        keystone_defconfig
x86_64                            allnoconfig
h8300                    h8300h-sim_defconfig
powerpc                      chrp32_defconfig
mips                         tb0226_defconfig
h8300                            alldefconfig
um                           x86_64_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     sequoia_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      mgcoge_defconfig
sh                            hp6xx_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                         microdev_defconfig
powerpc                      ppc6xx_defconfig
mips                         mpc30x_defconfig
m68k                        mvme147_defconfig
mips                      loongson3_defconfig
arm                         socfpga_defconfig
arm                           h3600_defconfig
s390                             alldefconfig
arm                  colibri_pxa270_defconfig
arm                          lpd270_defconfig
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
i386                 randconfig-a001-20210628
i386                 randconfig-a002-20210628
i386                 randconfig-a003-20210628
i386                 randconfig-a006-20210628
i386                 randconfig-a005-20210628
i386                 randconfig-a004-20210628
x86_64               randconfig-a012-20210628
x86_64               randconfig-a016-20210628
x86_64               randconfig-a015-20210628
x86_64               randconfig-a013-20210628
x86_64               randconfig-a014-20210628
x86_64               randconfig-a011-20210628
i386                 randconfig-a011-20210628
i386                 randconfig-a014-20210628
i386                 randconfig-a013-20210628
i386                 randconfig-a015-20210628
i386                 randconfig-a016-20210628
i386                 randconfig-a012-20210628
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210628
x86_64               randconfig-a002-20210628
x86_64               randconfig-a005-20210628
x86_64               randconfig-a001-20210628
x86_64               randconfig-a003-20210628
x86_64               randconfig-a004-20210628
x86_64               randconfig-a006-20210628

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
