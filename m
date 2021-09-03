Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A110C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 19:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83A4560FC0
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 19:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349566AbhICTwj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Sep 2021 15:52:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:32224 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230421AbhICTwh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 3 Sep 2021 15:52:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="219518677"
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; 
   d="scan'208";a="219518677"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2021 12:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,266,1624345200"; 
   d="scan'208";a="692425335"
Received: from lkp-server01.sh.intel.com (HELO 2115029a3e5c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Sep 2021 12:51:35 -0700
Received: from kbuild by 2115029a3e5c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mMFDq-0000mg-S3; Fri, 03 Sep 2021 19:51:34 +0000
Date:   Sat, 04 Sep 2021 03:50:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 15d4ec3b12b54ff069016f15c8e66aa727f6d890
Message-ID: <61327c8e.mZpsHiemWzSFTs+n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 15d4ec3b12b54ff069016f15c8e66aa727f6d890  hwmon: (k10temp) Remove residues of current and voltage

elapsed time: 1272m

configs tested: 179
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210904
i386                 randconfig-c001-20210902
arm                         s3c6400_defconfig
riscv                            alldefconfig
arm                       cns3420vb_defconfig
m68k                       bvme6000_defconfig
sparc                       sparc32_defconfig
powerpc                     mpc512x_defconfig
mips                      fuloong2e_defconfig
s390                             alldefconfig
powerpc                       eiger_defconfig
sh                        dreamcast_defconfig
arm                           viper_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     rainier_defconfig
mips                         tb0226_defconfig
m68k                        m5272c3_defconfig
mips                        bcm63xx_defconfig
sh                   secureedge5410_defconfig
sh                   sh7770_generic_defconfig
arm                            hisi_defconfig
powerpc                      pmac32_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
sh                           se7206_defconfig
microblaze                      mmu_defconfig
arm                          collie_defconfig
powerpc                 mpc836x_mds_defconfig
mips                  maltasmvp_eva_defconfig
sh                          sdk7786_defconfig
powerpc                      ppc40x_defconfig
powerpc64                        alldefconfig
xtensa                          iss_defconfig
sh                           sh2007_defconfig
arm                  colibri_pxa300_defconfig
sh                          polaris_defconfig
arm                       imx_v6_v7_defconfig
mips                    maltaup_xpa_defconfig
powerpc                     mpc83xx_defconfig
powerpc                         ps3_defconfig
powerpc                      pcm030_defconfig
sh                           se7751_defconfig
mips                        jmr3927_defconfig
arm                        clps711x_defconfig
um                                  defconfig
m68k                             allyesconfig
arm                         socfpga_defconfig
m68k                       m5475evb_defconfig
i386                             alldefconfig
arm                       aspeed_g5_defconfig
m68k                       m5275evb_defconfig
arm                         hackkit_defconfig
arm                      tct_hammer_defconfig
arm                        spear6xx_defconfig
arm                             ezx_defconfig
powerpc                     tqm8548_defconfig
sh                             sh03_defconfig
mips                           jazz_defconfig
m68k                          multi_defconfig
arm                    vt8500_v6_v7_defconfig
arm                            lart_defconfig
sh                         ecovec24_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      makalu_defconfig
mips                       capcella_defconfig
powerpc                     sequoia_defconfig
mips                       rbtx49xx_defconfig
m68k                            mac_defconfig
arm                           tegra_defconfig
sh                          rsk7201_defconfig
xtensa                generic_kc705_defconfig
parisc                generic-32bit_defconfig
arm                          exynos_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210902
x86_64               randconfig-a006-20210902
x86_64               randconfig-a003-20210902
x86_64               randconfig-a005-20210902
x86_64               randconfig-a001-20210902
x86_64               randconfig-a002-20210902
x86_64               randconfig-a016-20210903
x86_64               randconfig-a011-20210903
x86_64               randconfig-a012-20210903
x86_64               randconfig-a015-20210903
x86_64               randconfig-a014-20210903
x86_64               randconfig-a013-20210903
i386                 randconfig-a012-20210903
i386                 randconfig-a015-20210903
i386                 randconfig-a011-20210903
i386                 randconfig-a013-20210903
i386                 randconfig-a014-20210903
i386                 randconfig-a016-20210903
riscv                randconfig-r042-20210903
s390                 randconfig-r044-20210903
arc                  randconfig-r043-20210903
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
s390                 randconfig-c005-20210903
mips                 randconfig-c004-20210903
x86_64               randconfig-c007-20210903
powerpc              randconfig-c003-20210903
i386                 randconfig-c001-20210903
arm                  randconfig-c002-20210903
riscv                randconfig-c006-20210903
s390                 randconfig-c005-20210904
mips                 randconfig-c004-20210904
powerpc              randconfig-c003-20210904
x86_64               randconfig-c007-20210904
i386                 randconfig-c001-20210904
arm                  randconfig-c002-20210904
riscv                randconfig-c006-20210904
x86_64               randconfig-a004-20210903
x86_64               randconfig-a006-20210903
x86_64               randconfig-a003-20210903
x86_64               randconfig-a005-20210903
x86_64               randconfig-a001-20210903
x86_64               randconfig-a002-20210903
i386                 randconfig-a005-20210903
i386                 randconfig-a004-20210903
i386                 randconfig-a006-20210903
i386                 randconfig-a002-20210903
i386                 randconfig-a001-20210903
i386                 randconfig-a003-20210903
i386                 randconfig-a012-20210904
i386                 randconfig-a015-20210904
i386                 randconfig-a011-20210904
i386                 randconfig-a013-20210904
i386                 randconfig-a014-20210904
i386                 randconfig-a016-20210904
hexagon              randconfig-r045-20210903
hexagon              randconfig-r041-20210903

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
