Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C60C2D0E4
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 03:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46CB620A8B
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 03:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgKMDIP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 22:08:15 -0500
Received: from mga18.intel.com ([134.134.136.126]:52175 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgKMDIP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 22:08:15 -0500
IronPort-SDR: QnLyg4pEHB7T86nahI+rU8Tm+pe56gEXPztcSA/bk3cl1vTNZ8zrNtnZfZDYBklwrUiovqXSn4
 LtpBTrljRw2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="158196663"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="158196663"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 19:08:15 -0800
IronPort-SDR: /Z2mDOa4L4Fqx3a2DBUUqv+0IlQIUMnkLjsSPvWSE4IJe1G7l6KFjn3YXWmlsgVOi6BM+sYn2Y
 U6RC8HEZEdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="366812036"
Received: from lkp-server02.sh.intel.com (HELO 697932c29306) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Nov 2020 19:08:13 -0800
Received: from kbuild by 697932c29306 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kdPRd-00000q-99; Fri, 13 Nov 2020 03:08:13 +0000
Date:   Fri, 13 Nov 2020 11:07:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 4d64bb4ba5ecf4831448cdb2fe16d0ae91b2b40b
Message-ID: <5fadf868.rJbuFuQEWkZz7Jx/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 4d64bb4ba5ecf4831448cdb2fe16d0ae91b2b40b  hwmon: (applesmc) Re-work SMC comms

elapsed time: 722m

configs tested: 181
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         bcm2835_defconfig
arm                        shmobile_defconfig
arm                        spear6xx_defconfig
arm                       aspeed_g5_defconfig
ia64                        generic_defconfig
sh                   rts7751r2dplus_defconfig
sh                         microdev_defconfig
powerpc                      katmai_defconfig
sh                   sh7770_generic_defconfig
sh                            hp6xx_defconfig
riscv                            allmodconfig
powerpc                    ge_imp3a_defconfig
sparc                               defconfig
sparc64                          alldefconfig
sh                        dreamcast_defconfig
powerpc                       maple_defconfig
openrisc                            defconfig
powerpc                      acadia_defconfig
sh                          rsk7201_defconfig
arm                  colibri_pxa300_defconfig
arm                            lart_defconfig
powerpc                    mvme5100_defconfig
powerpc                        icon_defconfig
mips                   sb1250_swarm_defconfig
mips                        workpad_defconfig
m68k                         apollo_defconfig
sh                ecovec24-romimage_defconfig
riscv                            alldefconfig
arm                          pxa3xx_defconfig
powerpc                     pq2fads_defconfig
arm                           tegra_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                           se7722_defconfig
powerpc                        warp_defconfig
arm                  colibri_pxa270_defconfig
arm                              alldefconfig
arm                           h3600_defconfig
m68k                        m5407c3_defconfig
m68k                        mvme16x_defconfig
sh                          rsk7203_defconfig
mips                     loongson1b_defconfig
arm                             mxs_defconfig
sh                          sdk7786_defconfig
mips                       bmips_be_defconfig
arm                           efm32_defconfig
mips                         tb0287_defconfig
powerpc                      arches_defconfig
c6x                         dsk6455_defconfig
powerpc                     kmeter1_defconfig
nds32                            alldefconfig
powerpc64                           defconfig
arm                       imx_v6_v7_defconfig
arm                        cerfcube_defconfig
m68k                        mvme147_defconfig
arm                         shannon_defconfig
powerpc                     asp8347_defconfig
powerpc                         wii_defconfig
sh                           sh2007_defconfig
mips                malta_kvm_guest_defconfig
i386                             alldefconfig
mips                        maltaup_defconfig
arm                         mv78xx0_defconfig
mips                          malta_defconfig
arm                      footbridge_defconfig
xtensa                              defconfig
mips                 decstation_r4k_defconfig
arm                         nhk8815_defconfig
c6x                        evmc6457_defconfig
powerpc                    socrates_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                   lite5200b_defconfig
m68k                         amcore_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         assabet_defconfig
arm                          pxa168_defconfig
microblaze                          defconfig
s390                          debug_defconfig
arm                         socfpga_defconfig
m68k                        m5307c3_defconfig
ia64                      gensparse_defconfig
m68k                        stmark2_defconfig
m68k                             alldefconfig
powerpc                      ep88xc_defconfig
arc                         haps_hs_defconfig
arm                      jornada720_defconfig
powerpc                      obs600_defconfig
arm64                            alldefconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
arm                         orion5x_defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201112
i386                 randconfig-a005-20201112
i386                 randconfig-a002-20201112
i386                 randconfig-a001-20201112
i386                 randconfig-a003-20201112
i386                 randconfig-a004-20201112
i386                 randconfig-a006-20201111
i386                 randconfig-a005-20201111
i386                 randconfig-a002-20201111
i386                 randconfig-a001-20201111
i386                 randconfig-a003-20201111
i386                 randconfig-a004-20201111
x86_64               randconfig-a015-20201111
x86_64               randconfig-a011-20201111
x86_64               randconfig-a014-20201111
x86_64               randconfig-a013-20201111
x86_64               randconfig-a016-20201111
x86_64               randconfig-a012-20201111
i386                 randconfig-a012-20201112
i386                 randconfig-a014-20201112
i386                 randconfig-a016-20201112
i386                 randconfig-a011-20201112
i386                 randconfig-a015-20201112
i386                 randconfig-a013-20201112
i386                 randconfig-a012-20201111
i386                 randconfig-a014-20201111
i386                 randconfig-a016-20201111
i386                 randconfig-a011-20201111
i386                 randconfig-a015-20201111
i386                 randconfig-a013-20201111
i386                 randconfig-a012-20201113
i386                 randconfig-a014-20201113
i386                 randconfig-a016-20201113
i386                 randconfig-a011-20201113
i386                 randconfig-a015-20201113
i386                 randconfig-a013-20201113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201111
x86_64               randconfig-a005-20201111
x86_64               randconfig-a004-20201111
x86_64               randconfig-a002-20201111
x86_64               randconfig-a006-20201111
x86_64               randconfig-a001-20201111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
