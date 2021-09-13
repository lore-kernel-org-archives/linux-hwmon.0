Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCABC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Sep 2021 20:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D143561106
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Sep 2021 20:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241270AbhIMUI1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Sep 2021 16:08:27 -0400
Received: from mga11.intel.com ([192.55.52.93]:36155 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243949AbhIMUIY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Sep 2021 16:08:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="218606473"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; 
   d="scan'208";a="218606473"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 13:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; 
   d="scan'208";a="528246277"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2021 13:06:42 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mPsDy-0007rB-1p; Mon, 13 Sep 2021 20:06:42 +0000
Date:   Tue, 14 Sep 2021 04:06:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 21fd745d6045898489ea7ded8906309b941e5fcd
Message-ID: <613faf2f.r/5xI41+GPmfujXx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 21fd745d6045898489ea7ded8906309b941e5fcd  watchdog: mlx-wdt: Use regmap_write_bits()

elapsed time: 722m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210913
s390                          debug_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8560_ads_defconfig
mips                           rs90_defconfig
arm                          pxa168_defconfig
powerpc                     skiroot_defconfig
arm                       omap2plus_defconfig
arm                          moxart_defconfig
arc                     haps_hs_smp_defconfig
arm                          pcm027_defconfig
arm                             ezx_defconfig
um                                  defconfig
powerpc                   motionpro_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5307c3_defconfig
powerpc                      ppc6xx_defconfig
arm                         lpc18xx_defconfig
powerpc                      obs600_defconfig
m68k                       m5249evb_defconfig
s390                             alldefconfig
sh                              ul2_defconfig
arm                       aspeed_g4_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 canyonlands_defconfig
mips                            e55_defconfig
powerpc                       maple_defconfig
sh                         apsh4a3a_defconfig
arm                           omap1_defconfig
mips                       bmips_be_defconfig
arm                           corgi_defconfig
powerpc                      cm5200_defconfig
ia64                         bigsur_defconfig
xtensa                           alldefconfig
arm                     davinci_all_defconfig
powerpc                     redwood_defconfig
arm                       netwinder_defconfig
powerpc                        cell_defconfig
mips                      maltasmvp_defconfig
arm                  colibri_pxa300_defconfig
mips                           ip27_defconfig
sparc64                             defconfig
powerpc                   microwatt_defconfig
sh                          polaris_defconfig
arm                             rpc_defconfig
arm                     am200epdkit_defconfig
mips                        nlm_xlr_defconfig
xtensa                  nommu_kc705_defconfig
nds32                            alldefconfig
powerpc                      bamboo_defconfig
mips                        jmr3927_defconfig
mips                      loongson3_defconfig
riscv                    nommu_k210_defconfig
mips                        maltaup_defconfig
powerpc                  storcenter_defconfig
arm                            qcom_defconfig
um                           x86_64_defconfig
csky                             alldefconfig
arc                        nsim_700_defconfig
arm                          simpad_defconfig
arm                         bcm2835_defconfig
m68k                          atari_defconfig
sh                   secureedge5410_defconfig
sh                           se7721_defconfig
sh                      rts7751r2d1_defconfig
openrisc                         alldefconfig
m68k                        mvme16x_defconfig
powerpc                     ep8248e_defconfig
powerpc                      arches_defconfig
riscv                               defconfig
h8300                       h8s-sim_defconfig
sh                          landisk_defconfig
arm                           h3600_defconfig
arm                            dove_defconfig
arc                          axs103_defconfig
x86_64               randconfig-c001-20210913
arm                  randconfig-c002-20210913
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
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
x86_64               randconfig-a002-20210913
x86_64               randconfig-a003-20210913
x86_64               randconfig-a006-20210913
x86_64               randconfig-a004-20210913
x86_64               randconfig-a005-20210913
x86_64               randconfig-a001-20210913
i386                 randconfig-a004-20210913
i386                 randconfig-a005-20210913
i386                 randconfig-a002-20210913
i386                 randconfig-a006-20210913
i386                 randconfig-a003-20210913
i386                 randconfig-a001-20210913
arc                  randconfig-r043-20210913
riscv                randconfig-r042-20210912
s390                 randconfig-r044-20210912
arc                  randconfig-r043-20210912
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210913
x86_64               randconfig-c007-20210913
mips                 randconfig-c004-20210913
powerpc              randconfig-c003-20210913
i386                 randconfig-c001-20210913
arm                  randconfig-c002-20210913
s390                 randconfig-c005-20210913
x86_64               randconfig-a016-20210913
x86_64               randconfig-a013-20210913
x86_64               randconfig-a012-20210913
x86_64               randconfig-a011-20210913
x86_64               randconfig-a014-20210913
x86_64               randconfig-a015-20210913
i386                 randconfig-a016-20210913
i386                 randconfig-a011-20210913
i386                 randconfig-a015-20210913
i386                 randconfig-a012-20210913
i386                 randconfig-a013-20210913
i386                 randconfig-a014-20210913
hexagon              randconfig-r045-20210912
hexagon              randconfig-r041-20210912

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
