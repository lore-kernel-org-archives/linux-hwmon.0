Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C6FC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Sep 2021 15:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 949E0610A6
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Sep 2021 15:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344334AbhIMPvN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Sep 2021 11:51:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:52772 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344151AbhIMPvG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Sep 2021 11:51:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="285407490"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; 
   d="scan'208";a="285407490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 08:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; 
   d="scan'208";a="528151129"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2021 08:49:48 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mPoDL-0007cz-Mt; Mon, 13 Sep 2021 15:49:47 +0000
Date:   Mon, 13 Sep 2021 23:49:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 f2a787937ec93b0bd81751d32f03ba7cf9a275d2
Message-ID: <613f7318.wOZwfUq+uCaxsmAH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: f2a787937ec93b0bd81751d32f03ba7cf9a275d2  hwmon: (raspberrypi) Use generic notification mechanism

elapsed time: 864m

configs tested: 193
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                               defconfig
arm                              allmodconfig
i386                 randconfig-c001-20210912
i386                 randconfig-c001-20210913
arm                       omap2plus_defconfig
arm                          moxart_defconfig
arc                     haps_hs_smp_defconfig
arm                          pcm027_defconfig
arm                             ezx_defconfig
um                                  defconfig
arm                         lpc18xx_defconfig
powerpc                      obs600_defconfig
m68k                       m5249evb_defconfig
s390                             alldefconfig
sh                              ul2_defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7264_defconfig
nds32                             allnoconfig
mips                      fuloong2e_defconfig
arm                         s3c6400_defconfig
arc                        nsimosci_defconfig
powerpc                       maple_defconfig
sh                         apsh4a3a_defconfig
arm                           omap1_defconfig
mips                       bmips_be_defconfig
powerpc                   motionpro_defconfig
powerpc                     pq2fads_defconfig
mips                      malta_kvm_defconfig
riscv                            alldefconfig
powerpc                 canyonlands_defconfig
xtensa                         virt_defconfig
arm                           u8500_defconfig
powerpc                         wii_defconfig
powerpc                     tqm8560_defconfig
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
powerpc                           allnoconfig
h8300                            allyesconfig
powerpc                     akebono_defconfig
xtensa                    xip_kc705_defconfig
nios2                         10m50_defconfig
arm                       spear13xx_defconfig
riscv                    nommu_k210_defconfig
mips                        maltaup_defconfig
powerpc                  storcenter_defconfig
arm                            qcom_defconfig
um                           x86_64_defconfig
csky                             alldefconfig
arc                        nsim_700_defconfig
arm                          simpad_defconfig
mips                           ip28_defconfig
powerpc                      pcm030_defconfig
powerpc                          g5_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                       aspeed_g4_defconfig
sh                           se7751_defconfig
sh                        edosk7705_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7750_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         axm55xx_defconfig
mips                           mtx1_defconfig
sh                           se7712_defconfig
arm                       netwinder_defconfig
arc                           tb10x_defconfig
powerpc                     tqm8548_defconfig
sh                          rsk7203_defconfig
sh                               allmodconfig
sparc                       sparc64_defconfig
sh                           se7780_defconfig
h8300                       h8s-sim_defconfig
sh                          landisk_defconfig
m68k                        m5307c3_defconfig
arm                        clps711x_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
mips                       rbtx49xx_defconfig
x86_64               randconfig-c001-20210913
arm                  randconfig-c002-20210913
x86_64               randconfig-c001-20210912
arm                  randconfig-c002-20210912
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
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
x86_64               randconfig-a016-20210912
x86_64               randconfig-a013-20210912
x86_64               randconfig-a012-20210912
x86_64               randconfig-a011-20210912
x86_64               randconfig-a014-20210912
x86_64               randconfig-a015-20210912
i386                 randconfig-a016-20210912
i386                 randconfig-a011-20210912
i386                 randconfig-a015-20210912
i386                 randconfig-a012-20210912
i386                 randconfig-a013-20210912
i386                 randconfig-a014-20210912
arc                  randconfig-r043-20210913
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210912
x86_64               randconfig-c007-20210912
mips                 randconfig-c004-20210912
powerpc              randconfig-c003-20210912
i386                 randconfig-c001-20210912
arm                  randconfig-c002-20210912
s390                 randconfig-c005-20210912
riscv                randconfig-c006-20210913
x86_64               randconfig-c007-20210913
mips                 randconfig-c004-20210913
powerpc              randconfig-c003-20210913
i386                 randconfig-c001-20210913
arm                  randconfig-c002-20210913
s390                 randconfig-c005-20210913
i386                 randconfig-a004-20210912
i386                 randconfig-a005-20210912
i386                 randconfig-a002-20210912
i386                 randconfig-a006-20210912
i386                 randconfig-a003-20210912
i386                 randconfig-a001-20210912
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
riscv                randconfig-r042-20210913
hexagon              randconfig-r045-20210913
s390                 randconfig-r044-20210913
hexagon              randconfig-r041-20210913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
