Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A37C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 13:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BF5960F4B
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Oct 2021 13:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbhJKNqJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:46:09 -0400
Received: from mga04.intel.com ([192.55.52.120]:38965 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231577AbhJKNqJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Oct 2021 09:46:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225649266"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="225649266"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 06:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="490483527"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 06:43:56 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mZvat-0002MR-Q0; Mon, 11 Oct 2021 13:43:55 +0000
Date:   Mon, 11 Oct 2021 21:43:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 15203437f0b11aa0630b297c474c9b3d389f7982
Message-ID: <61643f66.HlM17Ihz1oFJXurc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 15203437f0b11aa0630b297c474c9b3d389f7982  watchdog: iTCO: Drop vendor support

elapsed time: 723m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211011
arm                       omap2plus_defconfig
m68k                       m5475evb_defconfig
powerpc                   lite5200b_defconfig
arm                          imote2_defconfig
sh                           se7705_defconfig
arm                      tct_hammer_defconfig
ia64                      gensparse_defconfig
i386                             allyesconfig
mips                       capcella_defconfig
m68k                           sun3_defconfig
sh                     sh7710voipgw_defconfig
s390                                defconfig
powerpc                    ge_imp3a_defconfig
arm                            qcom_defconfig
powerpc                     powernv_defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
arm                        realview_defconfig
arm                        multi_v5_defconfig
riscv                               defconfig
sh                     magicpanelr2_defconfig
mips                  maltasmvp_eva_defconfig
powerpc64                           defconfig
powerpc                     taishan_defconfig
powerpc                     mpc83xx_defconfig
openrisc                    or1ksim_defconfig
m68k                                defconfig
arm                         at91_dt_defconfig
arm                             mxs_defconfig
mips                    maltaup_xpa_defconfig
arm                          ep93xx_defconfig
riscv             nommu_k210_sdcard_defconfig
nios2                            alldefconfig
powerpc                    adder875_defconfig
sh                           se7343_defconfig
h8300                               defconfig
sh                          lboxre2_defconfig
sh                                  defconfig
sh                          r7785rp_defconfig
arm                         lubbock_defconfig
xtensa                           alldefconfig
powerpc                      ppc44x_defconfig
mips                         tb0287_defconfig
mips                        workpad_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     asp8347_defconfig
arm                        mini2440_defconfig
h8300                            alldefconfig
powerpc                       ebony_defconfig
arm                        keystone_defconfig
arm                          iop32x_defconfig
mips                            e55_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                             pxa_defconfig
sh                           se7206_defconfig
sh                           se7724_defconfig
m68k                       m5249evb_defconfig
arm                        oxnas_v6_defconfig
arm                     davinci_all_defconfig
sh                          sdk7780_defconfig
powerpc                   microwatt_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7757lcr_defconfig
nds32                            alldefconfig
sh                      rts7751r2d1_defconfig
ia64                        generic_defconfig
xtensa                    smp_lx200_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211010
i386                 randconfig-a003-20211010
i386                 randconfig-a004-20211010
i386                 randconfig-a005-20211010
i386                 randconfig-a002-20211010
i386                 randconfig-a006-20211010
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211011
mips                 randconfig-c004-20211011
i386                 randconfig-c001-20211011
s390                 randconfig-c005-20211011
x86_64               randconfig-c007-20211011
powerpc              randconfig-c003-20211011
riscv                randconfig-c006-20211011
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
