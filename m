Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE684C433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 16:08:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C97BA61363
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Apr 2021 16:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhDSQIn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Apr 2021 12:08:43 -0400
Received: from mga05.intel.com ([192.55.52.43]:60838 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229842AbhDSQIm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 12:08:42 -0400
IronPort-SDR: /QzAx74MknyckoE3E/q302cNKyTSYXbHfelg7fZbueV63jPq0e8A/Mm5Fz9ZeHSXYInGMJjlSi
 Uh8zmRqgq9dw==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="280677868"
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; 
   d="scan'208";a="280677868"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 09:08:12 -0700
IronPort-SDR: WEOfcEtvAFWg3bK8ZTOoIxUw/eoAF7jKbwoIuiso2OrKDoMvtD6CddFt5z8SA+1IF8AQ6HjIVO
 k5xuN64sFHCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; 
   d="scan'208";a="454378958"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2021 09:08:10 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lYWRW-0001mc-7H; Mon, 19 Apr 2021 16:08:10 +0000
Date:   Tue, 20 Apr 2021 00:07:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 789a4623bb12af51a6c05e188ba302f7d162ff04
Message-ID: <607daad9.x7gP3oBvDRip5uQp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 789a4623bb12af51a6c05e188ba302f7d162ff04  hwmon: (sch5627) Remove unnecessary error path

elapsed time: 723m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
sh                           se7206_defconfig
powerpc                     pq2fads_defconfig
mips                         tb0226_defconfig
mips                          ath79_defconfig
arc                          axs103_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                        mvebu_v5_defconfig
arm                        realview_defconfig
powerpc                     pseries_defconfig
arm                      pxa255-idp_defconfig
arm                       versatile_defconfig
arm                       multi_v4t_defconfig
xtensa                           allyesconfig
sh                          urquell_defconfig
arc                     haps_hs_smp_defconfig
arc                    vdk_hs38_smp_defconfig
arm                    vt8500_v6_v7_defconfig
mips                     cu1830-neo_defconfig
powerpc                      cm5200_defconfig
s390                             alldefconfig
mips                         tb0287_defconfig
powerpc                     powernv_defconfig
m68k                        m5407c3_defconfig
arm                         lubbock_defconfig
powerpc                       ppc64_defconfig
powerpc                     mpc5200_defconfig
mips                         mpc30x_defconfig
alpha                            allyesconfig
arc                          axs101_defconfig
arm                          pxa168_defconfig
arm                         orion5x_defconfig
riscv                          rv32_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          gemini_defconfig
arm                          exynos_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc834x_mds_defconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210419
i386                 randconfig-a001-20210419
i386                 randconfig-a006-20210419
i386                 randconfig-a005-20210419
i386                 randconfig-a004-20210419
i386                 randconfig-a002-20210419
i386                 randconfig-a015-20210419
i386                 randconfig-a013-20210419
i386                 randconfig-a014-20210419
i386                 randconfig-a016-20210419
i386                 randconfig-a012-20210419
i386                 randconfig-a011-20210419
x86_64               randconfig-a003-20210419
x86_64               randconfig-a001-20210419
x86_64               randconfig-a005-20210419
x86_64               randconfig-a002-20210419
x86_64               randconfig-a006-20210419
x86_64               randconfig-a004-20210419
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210419
x86_64               randconfig-a015-20210419
x86_64               randconfig-a013-20210419
x86_64               randconfig-a011-20210419
x86_64               randconfig-a012-20210419
x86_64               randconfig-a016-20210419

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
