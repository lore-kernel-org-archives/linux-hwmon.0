Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A19C432BE
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Aug 2021 05:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18A7760C3F
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Aug 2021 05:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhH2FWp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 29 Aug 2021 01:22:45 -0400
Received: from mga14.intel.com ([192.55.52.115]:62447 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233657AbhH2FWp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 29 Aug 2021 01:22:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10090"; a="217855649"
X-IronPort-AV: E=Sophos;i="5.84,360,1620716400"; 
   d="scan'208";a="217855649"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2021 22:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,360,1620716400"; 
   d="scan'208";a="539582817"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2021 22:21:52 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mKDGS-000430-07; Sun, 29 Aug 2021 05:21:52 +0000
Date:   Sun, 29 Aug 2021 13:21:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 3b24fa6d46ee110170f34d7362281410999435a8
Message-ID: <612b195d.U9dlZLUwb0obs9A6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 3b24fa6d46ee110170f34d7362281410999435a8  dt-bindings: watchdog: Add compatible for Mediatek MT7986

elapsed time: 733m

configs tested: 134
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210829
mips                  cavium_octeon_defconfig
mips                           gcw0_defconfig
m68k                        m5407c3_defconfig
arm                            xcep_defconfig
mips                         cobalt_defconfig
powerpc                       maple_defconfig
sh                          polaris_defconfig
arc                      axs103_smp_defconfig
sh                ecovec24-romimage_defconfig
riscv             nommu_k210_sdcard_defconfig
riscv                          rv32_defconfig
mips                     loongson2k_defconfig
powerpc                     redwood_defconfig
sh                           se7724_defconfig
arm                           stm32_defconfig
s390                             alldefconfig
powerpc                    sam440ep_defconfig
s390                          debug_defconfig
arm                       netwinder_defconfig
mips                           ci20_defconfig
powerpc                     kilauea_defconfig
arm                             mxs_defconfig
mips                     loongson1c_defconfig
powerpc                      bamboo_defconfig
ia64                             allyesconfig
sh                        edosk7705_defconfig
arc                     haps_hs_smp_defconfig
arm                        realview_defconfig
powerpc                   currituck_defconfig
arm                      integrator_defconfig
m68k                       m5249evb_defconfig
powerpc                       ppc64_defconfig
arm                        cerfcube_defconfig
powerpc                     tqm8541_defconfig
arm                          gemini_defconfig
arm                           h3600_defconfig
mips                         db1xxx_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     skiroot_defconfig
powerpc                      chrp32_defconfig
nds32                             allnoconfig
mips                    maltaup_xpa_defconfig
arm                           sunxi_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
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
x86_64               randconfig-a014-20210829
x86_64               randconfig-a016-20210829
x86_64               randconfig-a015-20210829
x86_64               randconfig-a012-20210829
x86_64               randconfig-a013-20210829
x86_64               randconfig-a011-20210829
i386                 randconfig-a011-20210829
i386                 randconfig-a016-20210829
i386                 randconfig-a012-20210829
i386                 randconfig-a014-20210829
i386                 randconfig-a013-20210829
i386                 randconfig-a015-20210829
arc                  randconfig-r043-20210829
riscv                randconfig-r042-20210829
s390                 randconfig-r044-20210829
arc                  randconfig-r043-20210827
riscv                randconfig-r042-20210827
s390                 randconfig-r044-20210827
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20210829
i386                 randconfig-c001-20210829
arm                  randconfig-c002-20210829
riscv                randconfig-c006-20210829
x86_64               randconfig-c007-20210829
powerpc              randconfig-c003-20210829
mips                 randconfig-c004-20210829
x86_64               randconfig-a001-20210829
x86_64               randconfig-a006-20210829
x86_64               randconfig-a005-20210829
x86_64               randconfig-a003-20210829
x86_64               randconfig-a004-20210829
x86_64               randconfig-a002-20210829
i386                 randconfig-a001-20210829
i386                 randconfig-a006-20210829
i386                 randconfig-a005-20210829
i386                 randconfig-a004-20210829
i386                 randconfig-a003-20210829
i386                 randconfig-a006-20210827
i386                 randconfig-a001-20210827
i386                 randconfig-a002-20210827
i386                 randconfig-a005-20210827
i386                 randconfig-a004-20210827
i386                 randconfig-a003-20210827

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
