Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A802C433DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Jan 2021 13:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F62064DD8
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Jan 2021 13:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhA1N46 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Jan 2021 08:56:58 -0500
Received: from mga06.intel.com ([134.134.136.31]:7655 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229825AbhA1N44 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Jan 2021 08:56:56 -0500
IronPort-SDR: sKWU0Z1w69EpIgthw9DW3LVQyXjaS3ORegAeT9mOwEMLKUeAbvU4nvg2pjQohKRWI+IefNPezb
 DkjASXKj8qdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="241760110"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="241760110"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 05:56:12 -0800
IronPort-SDR: kSk/9goxasdpZ5HG64W2Q1r5tNx9cFuXUpH+g4ZOsTO/C4igGgkgKu8eAx4I98SnMrIzvYyBCo
 yYgWVQCZ3bZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="578626798"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2021 05:56:11 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l57mM-0002xO-Cl; Thu, 28 Jan 2021 13:56:10 +0000
Date:   Thu, 28 Jan 2021 21:55:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 4008bc7d39537bb3be166d8a3129c4980e1dd7dc
Message-ID: <6012c26c.n6LbP5hpBgx1ghYJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 4008bc7d39537bb3be166d8a3129c4980e1dd7dc  hwmon: (dell-smm) Add XPS 15 L502X to fan control blacklist

elapsed time: 724m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
powerpc                   bluestone_defconfig
nios2                         3c120_defconfig
arc                        vdk_hs38_defconfig
sh                           se7724_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      mgcoge_defconfig
powerpc                          g5_defconfig
powerpc                         ps3_defconfig
nds32                            alldefconfig
c6x                        evmc6457_defconfig
m68k                            q40_defconfig
m68k                       m5208evb_defconfig
sh                            titan_defconfig
arm                     eseries_pxa_defconfig
xtensa                    xip_kc705_defconfig
mips                            gpr_defconfig
arm                          pxa910_defconfig
arm                         lpc18xx_defconfig
sh                         microdev_defconfig
mips                         mpc30x_defconfig
riscv                               defconfig
arc                     nsimosci_hs_defconfig
c6x                        evmc6474_defconfig
mips                           ip28_defconfig
alpha                            alldefconfig
powerpc                    gamecube_defconfig
sparc                       sparc32_defconfig
mips                         tb0226_defconfig
mips                      pic32mzda_defconfig
powerpc                     pseries_defconfig
arm                          ep93xx_defconfig
openrisc                    or1ksim_defconfig
sh                         apsh4a3a_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
m68k                       m5275evb_defconfig
powerpc                      ppc44x_defconfig
nios2                            allyesconfig
m68k                        m5407c3_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                  colibri_pxa270_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
arc                           tb10x_defconfig
m68k                        mvme147_defconfig
m68k                        m5272c3_defconfig
arm                       aspeed_g4_defconfig
c6x                        evmc6678_defconfig
mips                          malta_defconfig
xtensa                generic_kc705_defconfig
sh                          rsk7269_defconfig
mips                            ar7_defconfig
sh                          sdk7780_defconfig
mips                      malta_kvm_defconfig
sh                   secureedge5410_defconfig
arc                              alldefconfig
mips                   sb1250_swarm_defconfig
openrisc                            defconfig
ia64                        generic_defconfig
openrisc                 simple_smp_defconfig
mips                  cavium_octeon_defconfig
sparc                            allyesconfig
powerpc                  storcenter_defconfig
x86_64                              defconfig
powerpc                    sam440ep_defconfig
arm                           tegra_defconfig
mips                          ath79_defconfig
powerpc                    ge_imp3a_defconfig
arm                         at91_dt_defconfig
arm                            lart_defconfig
sh                          r7785rp_defconfig
ia64                         bigsur_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210128
i386                 randconfig-a002-20210128
i386                 randconfig-a004-20210128
i386                 randconfig-a005-20210128
i386                 randconfig-a003-20210128
i386                 randconfig-a006-20210128
x86_64               randconfig-a012-20210128
x86_64               randconfig-a015-20210128
x86_64               randconfig-a016-20210128
x86_64               randconfig-a011-20210128
x86_64               randconfig-a013-20210128
x86_64               randconfig-a014-20210128
i386                 randconfig-a013-20210128
i386                 randconfig-a011-20210128
i386                 randconfig-a012-20210128
i386                 randconfig-a016-20210128
i386                 randconfig-a014-20210128
i386                 randconfig-a015-20210128
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210128
x86_64               randconfig-a003-20210128
x86_64               randconfig-a001-20210128
x86_64               randconfig-a005-20210128
x86_64               randconfig-a006-20210128
x86_64               randconfig-a004-20210128

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
