Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF888C07E96
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 06:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF53061988
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 06:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhGFGGw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 02:06:52 -0400
Received: from mga04.intel.com ([192.55.52.120]:2272 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230036AbhGFGGw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Jul 2021 02:06:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="207234211"
X-IronPort-AV: E=Sophos;i="5.83,327,1616482800"; 
   d="scan'208";a="207234211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 23:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,327,1616482800"; 
   d="scan'208";a="422736357"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jul 2021 23:04:12 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m0eBo-000Cll-9l; Tue, 06 Jul 2021 06:04:12 +0000
Date:   Tue, 06 Jul 2021 14:03:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:master] BUILD SUCCESS
 af9efb8b661e98ec48abe85c22f4f7fb667f5195
Message-ID: <60e3f24b.VSuDa8eNOYMrQTvZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git master
branch HEAD: af9efb8b661e98ec48abe85c22f4f7fb667f5195  arm: ioremap: don't abuse pfn_valid() to check if pfn is in RAM

elapsed time: 726m

configs tested: 126
configs skipped: 69

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     sbc8548_defconfig
arm                         vf610m4_defconfig
powerpc                      acadia_defconfig
mips                   sb1250_swarm_defconfig
m68k                             allyesconfig
arm                     davinci_all_defconfig
arm                         socfpga_defconfig
arm                          pcm027_defconfig
xtensa                    smp_lx200_defconfig
x86_64                              defconfig
mips                     cu1830-neo_defconfig
arm                         at91_dt_defconfig
powerpc                 canyonlands_defconfig
openrisc                    or1ksim_defconfig
powerpc                      ppc44x_defconfig
m68k                             alldefconfig
arc                        nsim_700_defconfig
arm                            dove_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
powerpc                    ge_imp3a_defconfig
arm                        realview_defconfig
csky                             alldefconfig
xtensa                       common_defconfig
mips                         rt305x_defconfig
sh                         ap325rxa_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                         apsh4a3a_defconfig
mips                        bcm47xx_defconfig
mips                          malta_defconfig
powerpc                     pseries_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                          ath25_defconfig
powerpc                     tqm8560_defconfig
mips                  maltasmvp_eva_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
arm                        magician_defconfig
arm                           tegra_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                  mpc885_ads_defconfig
m68k                        mvme16x_defconfig
m68k                         amcore_defconfig
sh                           se7721_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210705
x86_64               randconfig-a002-20210705
x86_64               randconfig-a005-20210705
x86_64               randconfig-a006-20210705
x86_64               randconfig-a003-20210705
x86_64               randconfig-a001-20210705
i386                 randconfig-a004-20210705
i386                 randconfig-a006-20210705
i386                 randconfig-a001-20210705
i386                 randconfig-a003-20210705
i386                 randconfig-a005-20210705
i386                 randconfig-a002-20210705
i386                 randconfig-a015-20210706
i386                 randconfig-a016-20210706
i386                 randconfig-a012-20210706
i386                 randconfig-a011-20210706
i386                 randconfig-a014-20210706
i386                 randconfig-a013-20210706
i386                 randconfig-a015-20210705
i386                 randconfig-a016-20210705
i386                 randconfig-a012-20210705
i386                 randconfig-a011-20210705
i386                 randconfig-a014-20210705
i386                 randconfig-a013-20210705
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210705
x86_64               randconfig-a015-20210705
x86_64               randconfig-a014-20210705
x86_64               randconfig-a012-20210705
x86_64               randconfig-a011-20210705
x86_64               randconfig-a016-20210705
x86_64               randconfig-a013-20210705

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
