Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EC4C71156
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 12:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E72752084C
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 12:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730843AbgLAMZY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Dec 2020 07:25:24 -0500
Received: from mga02.intel.com ([134.134.136.20]:55777 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727374AbgLAMZX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 1 Dec 2020 07:25:23 -0500
IronPort-SDR: mtdoCsP66C8pPPUJQapi2peiavHicDDy3ktKlD8+HTADm3HT9RPBpfE3msJ0n1ItqYD06yS23Y
 cCIIxzh6B27A==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="159871255"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="159871255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 04:24:39 -0800
IronPort-SDR: nxiRmKp8jKiANYj9kKSIaKSPWChREHArf9A5jhqBjfN7AHhBJ7IUxIFv7MqmLC0Bcs8I835QAe
 SRxsOwDZnCKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="335072121"
Received: from lkp-server01.sh.intel.com (HELO 70b44b587200) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Dec 2020 04:24:37 -0800
Received: from kbuild by 70b44b587200 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kk4hw-0000FP-SZ; Tue, 01 Dec 2020 12:24:36 +0000
Date:   Tue, 01 Dec 2020 20:24:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 36657904fe28786802ec2c9b016fcefb8631bbb9
Message-ID: <5fc635e2.gWHQ1ieFiyOGXjaP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: 36657904fe28786802ec2c9b016fcefb8631bbb9  watchdog: iTCO_wdt: use dev_*() instead of pr_*() for logging

elapsed time: 724m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            xcep_defconfig
sh                   sh7770_generic_defconfig
powerpc                     mpc83xx_defconfig
mips                      pistachio_defconfig
xtensa                       common_defconfig
arc                        nsimosci_defconfig
arm64                            alldefconfig
powerpc                    gamecube_defconfig
arm                          exynos_defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
s390                          debug_defconfig
powerpc                      ep88xc_defconfig
arm                       aspeed_g5_defconfig
arm                            mmp2_defconfig
sh                   secureedge5410_defconfig
arm                         lpc32xx_defconfig
powerpc                    sam440ep_defconfig
mips                        workpad_defconfig
arm                          gemini_defconfig
mips                     cu1000-neo_defconfig
ia64                        generic_defconfig
powerpc                     kilauea_defconfig
powerpc                     mpc5200_defconfig
nios2                         10m50_defconfig
um                           x86_64_defconfig
powerpc                      katmai_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                           allyesconfig
powerpc                        fsp2_defconfig
mips                       capcella_defconfig
powerpc                      ppc44x_defconfig
arm                          imote2_defconfig
powerpc                      mgcoge_defconfig
c6x                        evmc6678_defconfig
m68k                          amiga_defconfig
sh                           se7712_defconfig
powerpc                     pseries_defconfig
mips                     cu1830-neo_defconfig
powerpc                      walnut_defconfig
mips                      loongson3_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
i386                 randconfig-a004-20201130
i386                 randconfig-a002-20201130
i386                 randconfig-a003-20201130
i386                 randconfig-a005-20201130
i386                 randconfig-a006-20201130
i386                 randconfig-a001-20201130
x86_64               randconfig-a014-20201130
x86_64               randconfig-a015-20201130
x86_64               randconfig-a016-20201130
x86_64               randconfig-a011-20201130
x86_64               randconfig-a012-20201130
x86_64               randconfig-a013-20201130
i386                 randconfig-a013-20201130
i386                 randconfig-a012-20201130
i386                 randconfig-a011-20201130
i386                 randconfig-a016-20201130
i386                 randconfig-a015-20201130
i386                 randconfig-a014-20201130
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
x86_64               randconfig-a004-20201201
x86_64               randconfig-a006-20201201
x86_64               randconfig-a001-20201201
x86_64               randconfig-a002-20201201
x86_64               randconfig-a005-20201201
x86_64               randconfig-a003-20201201
x86_64               randconfig-a002-20201130
x86_64               randconfig-a006-20201130
x86_64               randconfig-a005-20201130
x86_64               randconfig-a004-20201130
x86_64               randconfig-a001-20201130
x86_64               randconfig-a003-20201130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
