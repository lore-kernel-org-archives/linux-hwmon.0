Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DA4C2D0E4
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Nov 2020 02:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30311206C0
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Nov 2020 02:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgKXCDl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Nov 2020 21:03:41 -0500
Received: from mga11.intel.com ([192.55.52.93]:30674 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbgKXCDl (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Nov 2020 21:03:41 -0500
IronPort-SDR: /frTIO4NHZ75cDpDSujWklToLjFHCdUPgdI7f5SGKj2QG5itX15rYm1UAH/1AGwT0uFMtUzZzB
 zaWkVpEUN2Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="168367996"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="168367996"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 18:03:40 -0800
IronPort-SDR: D7eip0dzArH3FSALYvkRzhDAyUnDmmwsZ5M0LZles/MR/1ozLtv1/exwKb/bFq6Gy0+2840wnk
 p7iki/IcdvIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="313089331"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2020 18:03:39 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khNgA-0000IG-HH; Tue, 24 Nov 2020 02:03:38 +0000
Date:   Tue, 24 Nov 2020 10:03:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 9e6f991ca2627acc563c2eeec2e2740066fbce0c
Message-ID: <5fbc69ec.X6CTD20d+ZoiDEYC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 9e6f991ca2627acc563c2eeec2e2740066fbce0c  dt-bindings: hwmon: pwm-fan: Support multiple fan tachometer inputs

elapsed time: 722m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            zeus_defconfig
powerpc                   bluestone_defconfig
sh                         apsh4a3a_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           u8500_defconfig
powerpc                     tqm8555_defconfig
c6x                        evmc6472_defconfig
xtensa                         virt_defconfig
sh                          r7780mp_defconfig
arm                       netwinder_defconfig
xtensa                              defconfig
arm                            u300_defconfig
mips                             allyesconfig
arm                        keystone_defconfig
mips                           ip32_defconfig
powerpc                      tqm8xx_defconfig
m68k                        mvme16x_defconfig
powerpc                  storcenter_defconfig
powerpc                      acadia_defconfig
powerpc                     mpc512x_defconfig
mips                        vocore2_defconfig
sh                           se7724_defconfig
csky                             alldefconfig
arm                            dove_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
arm                          gemini_defconfig
arm                         s5pv210_defconfig
sparc64                          alldefconfig
arm                       aspeed_g4_defconfig
arm                        shmobile_defconfig
arm                           h3600_defconfig
c6x                                 defconfig
arc                              alldefconfig
mips                           ip27_defconfig
powerpc                    mvme5100_defconfig
arm                  colibri_pxa270_defconfig
nds32                             allnoconfig
powerpc                           allnoconfig
nds32                            alldefconfig
arm                         cm_x300_defconfig
mips                        jmr3927_defconfig
ia64                      gensparse_defconfig
powerpc                     powernv_defconfig
sh                           se7751_defconfig
mips                     loongson1b_defconfig
arm                          tango4_defconfig
xtensa                  nommu_kc705_defconfig
mips                     decstation_defconfig
arm                        mvebu_v5_defconfig
arm                            xcep_defconfig
powerpc                     kilauea_defconfig
powerpc                   motionpro_defconfig
powerpc                      chrp32_defconfig
sh                          rsk7269_defconfig
mips                malta_qemu_32r6_defconfig
arm                             rpc_defconfig
powerpc                     pseries_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        magician_defconfig
mips                       lemote2f_defconfig
arc                                 defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
alpha                               defconfig
sh                         ecovec24_defconfig
arm                           corgi_defconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
xtensa                  audio_kc705_defconfig
mips                       rbtx49xx_defconfig
arm                            mps2_defconfig
c6x                        evmc6474_defconfig
arm                        spear3xx_defconfig
arm                     davinci_all_defconfig
xtensa                generic_kc705_defconfig
mips                          rb532_defconfig
powerpc                 canyonlands_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
