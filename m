Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C12C4743D
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jun 2021 01:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 281A561090
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Jun 2021 01:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhFGB2j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Jun 2021 21:28:39 -0400
Received: from mga11.intel.com ([192.55.52.93]:28816 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229932AbhFGB2j (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 6 Jun 2021 21:28:39 -0400
IronPort-SDR: 0OSZsC0fadyDOUQJaAYiyVpDweBBE5IJF6tDvEu+KJTSpehMm5lDdvYT9Dyv46T/s7F9WFiohr
 DeoguiUFCVyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="201524868"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="201524868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2021 18:26:48 -0700
IronPort-SDR: ZpdRlpijPjCUvIdoC4L07SDXWiFjuzu59wHyBjAs0FSaJxjrEyKPrj81osiNBkNB3gRX8T2pcV
 3cjmLafa6ubQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="634557292"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2021 18:26:47 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lq42Q-00088L-U5; Mon, 07 Jun 2021 01:26:46 +0000
Date:   Mon, 07 Jun 2021 09:26:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 8a5823454b8674c149534a45dff508f162fdd2c9
Message-ID: <60bd75c2.r2y7UI0NvvD98cvd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8a5823454b8674c149534a45dff508f162fdd2c9  docs: hwmon: adm1177.rst: avoid using ReSt :doc:`foo` markup

elapsed time: 726m

configs tested: 176
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
powerpc                      pcm030_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
arm                           sunxi_defconfig
arm                         shannon_defconfig
arm                            lart_defconfig
sh                        sh7785lcr_defconfig
powerpc                       maple_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc64e_defconfig
arm                         mv78xx0_defconfig
xtensa                          iss_defconfig
m68k                                defconfig
powerpc                      chrp32_defconfig
nds32                             allnoconfig
mips                      fuloong2e_defconfig
xtensa                    smp_lx200_defconfig
arm                       netwinder_defconfig
ia64                             allyesconfig
powerpc                  mpc866_ads_defconfig
sh                          polaris_defconfig
mips                  maltasmvp_eva_defconfig
sh                        dreamcast_defconfig
i386                             allyesconfig
mips                        jmr3927_defconfig
arm                           spitz_defconfig
arm                        vexpress_defconfig
arm                        neponset_defconfig
sh                            shmin_defconfig
h8300                    h8300h-sim_defconfig
mips                      pic32mzda_defconfig
sh                ecovec24-romimage_defconfig
mips                             allmodconfig
powerpc                     stx_gp3_defconfig
m68k                          multi_defconfig
powerpc                    ge_imp3a_defconfig
arm                           corgi_defconfig
powerpc                      cm5200_defconfig
arc                            hsdk_defconfig
x86_64                              defconfig
arm                        cerfcube_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     kmeter1_defconfig
arm                       aspeed_g4_defconfig
s390                             allyesconfig
arc                        nsim_700_defconfig
mips                            e55_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     tqm8541_defconfig
mips                     decstation_defconfig
sh                          kfr2r09_defconfig
powerpc                      pmac32_defconfig
arm                        spear3xx_defconfig
sh                          lboxre2_defconfig
powerpc                     mpc5200_defconfig
arm                         hackkit_defconfig
arm                         at91_dt_defconfig
sh                               allmodconfig
mips                           ip32_defconfig
arm                       cns3420vb_defconfig
mips                        maltaup_defconfig
powerpc                     sbc8548_defconfig
powerpc                      ppc40x_defconfig
sh                         ap325rxa_defconfig
openrisc                         alldefconfig
powerpc                      mgcoge_defconfig
powerpc                   currituck_defconfig
powerpc                     ep8248e_defconfig
openrisc                            defconfig
powerpc                        cell_defconfig
arm                          simpad_defconfig
powerpc                      makalu_defconfig
powerpc                     tqm5200_defconfig
arm                           stm32_defconfig
mips                          malta_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                        multi_v7_defconfig
s390                          debug_defconfig
sh                           se7206_defconfig
alpha                            alldefconfig
mips                        bcm47xx_defconfig
riscv                          rv32_defconfig
riscv             nommu_k210_sdcard_defconfig
x86_64                            allnoconfig
riscv                            allyesconfig
ia64                        generic_defconfig
arm                     am200epdkit_defconfig
openrisc                    or1ksim_defconfig
powerpc                    klondike_defconfig
powerpc                     sequoia_defconfig
mips                       bmips_be_defconfig
arm                          exynos_defconfig
powerpc                          allyesconfig
m68k                        mvme16x_defconfig
xtensa                              defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
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
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210606
x86_64               randconfig-a004-20210606
x86_64               randconfig-a003-20210606
x86_64               randconfig-a006-20210606
x86_64               randconfig-a005-20210606
x86_64               randconfig-a001-20210606
i386                 randconfig-a003-20210606
i386                 randconfig-a006-20210606
i386                 randconfig-a004-20210606
i386                 randconfig-a001-20210606
i386                 randconfig-a005-20210606
i386                 randconfig-a002-20210606
i386                 randconfig-a015-20210606
i386                 randconfig-a013-20210606
i386                 randconfig-a016-20210606
i386                 randconfig-a011-20210606
i386                 randconfig-a014-20210606
i386                 randconfig-a012-20210606
i386                 randconfig-a015-20210607
i386                 randconfig-a013-20210607
i386                 randconfig-a011-20210607
i386                 randconfig-a016-20210607
i386                 randconfig-a014-20210607
i386                 randconfig-a012-20210607
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210607
x86_64               randconfig-b001-20210606
x86_64               randconfig-a015-20210606
x86_64               randconfig-a011-20210606
x86_64               randconfig-a014-20210606
x86_64               randconfig-a012-20210606
x86_64               randconfig-a016-20210606
x86_64               randconfig-a013-20210606
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
