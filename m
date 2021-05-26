Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CA0C47088
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 16:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E30FD613D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 May 2021 16:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbhEZQBe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 May 2021 12:01:34 -0400
Received: from mga01.intel.com ([192.55.52.88]:37610 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234962AbhEZQBd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 May 2021 12:01:33 -0400
IronPort-SDR: Ac4Y7QeKF6QPRmlHx2X5S0CDggS8DWG6oALaZFWOQwd9gvnSr7D4BvZxitZYFom4wQkQ8kJ2OY
 vNsjddUQbbRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223686372"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="223686372"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 08:59:55 -0700
IronPort-SDR: mbIEuhX4rUGhpm+ul/5Ie6GfQECJ8OwDMOuY/OVz0GlVmDaYLqc1OEjsXp6mIXkvK71UU9dmBL
 +L3P/nvAvoFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="480103599"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2021 08:59:54 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llvwn-0002I3-Ka; Wed, 26 May 2021 15:59:53 +0000
Date:   Wed, 26 May 2021 23:58:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 88b52a1c4964d096785993483149e99b1d6a12ea
Message-ID: <60ae703d.zxKFZeA936tkmvzT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 88b52a1c4964d096785993483149e99b1d6a12ea  hwmon: Add sht4x Temperature and Humidity Sensor Driver

elapsed time: 727m

configs tested: 166
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
sh                           se7751_defconfig
arm                           sunxi_defconfig
openrisc                         alldefconfig
arm                       imx_v6_v7_defconfig
sh                          sdk7786_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                  mpc866_ads_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm8548_defconfig
powerpc                      ppc44x_defconfig
sh                           se7780_defconfig
arm                        spear3xx_defconfig
powerpc                     tqm5200_defconfig
sh                            titan_defconfig
csky                                defconfig
arm                       multi_v4t_defconfig
mips                           ip22_defconfig
m68k                             allyesconfig
powerpc                     redwood_defconfig
mips                        omega2p_defconfig
arm                            xcep_defconfig
i386                                defconfig
powerpc                       eiger_defconfig
mips                  cavium_octeon_defconfig
powerpc                      obs600_defconfig
mips                            ar7_defconfig
sh                           se7712_defconfig
arm                          iop32x_defconfig
arc                              alldefconfig
powerpc                    ge_imp3a_defconfig
powerpc                     pq2fads_defconfig
arm                         at91_dt_defconfig
powerpc                       holly_defconfig
sh                          rsk7269_defconfig
sh                         microdev_defconfig
powerpc                        fsp2_defconfig
arm                       netwinder_defconfig
sh                          sdk7780_defconfig
arm                          pxa168_defconfig
s390                                defconfig
sh                          lboxre2_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc832x_mds_defconfig
mips                    maltaup_xpa_defconfig
arm                         orion5x_defconfig
mips                           ip28_defconfig
mips                         db1xxx_defconfig
m68k                        mvme16x_defconfig
xtensa                         virt_defconfig
nios2                            alldefconfig
arm                      jornada720_defconfig
arm                            pleb_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       spear13xx_defconfig
arm                         cm_x300_defconfig
mips                          rm200_defconfig
sparc64                             defconfig
arm                           omap1_defconfig
mips                         mpc30x_defconfig
csky                             alldefconfig
sparc                       sparc32_defconfig
sh                           se7343_defconfig
sh                           se7619_defconfig
sh                           se7750_defconfig
sh                           se7206_defconfig
arm                       cns3420vb_defconfig
powerpc                     sequoia_defconfig
arm                         lpc18xx_defconfig
arm                            qcom_defconfig
mips                      fuloong2e_defconfig
sparc                       sparc64_defconfig
m68k                        stmark2_defconfig
alpha                            alldefconfig
arc                    vdk_hs38_smp_defconfig
m68k                        mvme147_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          malta_defconfig
powerpc                         wii_defconfig
powerpc                      tqm8xx_defconfig
powerpc                   currituck_defconfig
mips                          ath25_defconfig
arm                        oxnas_v6_defconfig
sh                   sh7724_generic_defconfig
powerpc                      pasemi_defconfig
arc                        nsim_700_defconfig
arm                            dove_defconfig
arc                     nsimosci_hs_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210526
x86_64               randconfig-a001-20210526
x86_64               randconfig-a006-20210526
x86_64               randconfig-a003-20210526
x86_64               randconfig-a004-20210526
x86_64               randconfig-a002-20210526
i386                 randconfig-a001-20210526
i386                 randconfig-a002-20210526
i386                 randconfig-a005-20210526
i386                 randconfig-a004-20210526
i386                 randconfig-a003-20210526
i386                 randconfig-a006-20210526
i386                 randconfig-a011-20210526
i386                 randconfig-a016-20210526
i386                 randconfig-a015-20210526
i386                 randconfig-a012-20210526
i386                 randconfig-a014-20210526
i386                 randconfig-a013-20210526
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210526
x86_64               randconfig-a013-20210526
x86_64               randconfig-a012-20210526
x86_64               randconfig-a014-20210526
x86_64               randconfig-a016-20210526
x86_64               randconfig-a015-20210526
x86_64               randconfig-a011-20210526

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
