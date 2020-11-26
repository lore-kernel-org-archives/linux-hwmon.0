Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAADEC56202
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 03:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F98921534
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 03:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732040AbgKZDBi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Nov 2020 22:01:38 -0500
Received: from mga12.intel.com ([192.55.52.136]:12459 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731813AbgKZDBi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Nov 2020 22:01:38 -0500
IronPort-SDR: g/20U3zUv+txThjDMMzEbiWq9zkQRzbczMtS/pWRJ8zTp67Q3pmGCFoxMOscN3MDtLhWv+u9jI
 0mtVwOgD7WAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="151487312"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
   d="scan'208";a="151487312"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 19:01:37 -0800
IronPort-SDR: 3FaP2U0Xi3wpgxHmZk8ctcDQDQakuG8/y1BBtZ7bps9Yo36OSHyFhedgU1pRoxYpFpwsuAR7ew
 FWoVi1y2Bnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
   d="scan'208";a="328216707"
Received: from lkp-server01.sh.intel.com (HELO dd79da36dde1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Nov 2020 19:01:36 -0800
Received: from kbuild by dd79da36dde1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ki7XL-00002l-KG; Thu, 26 Nov 2020 03:01:35 +0000
Date:   Thu, 26 Nov 2020 11:00:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 5452ef62fbc3c5ac86f8c80ce1201a07618abc9c
Message-ID: <5fbf1a65./CeKN20g8DX8pWks%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 5452ef62fbc3c5ac86f8c80ce1201a07618abc9c  hwmon: (ina3221) Fix PM usage counter unbalance in ina3221_write_enable

elapsed time: 724m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
mips                     loongson1c_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
sh                          rsk7201_defconfig
nios2                            alldefconfig
m68k                       m5208evb_defconfig
powerpc                      obs600_defconfig
arm                            pleb_defconfig
powerpc                        warp_defconfig
arm                            mps2_defconfig
mips                         rt305x_defconfig
openrisc                         alldefconfig
powerpc                       ebony_defconfig
sh                          r7785rp_defconfig
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
arm                            qcom_defconfig
m68k                        mvme147_defconfig
arm                            dove_defconfig
sh                   rts7751r2dplus_defconfig
mips                  cavium_octeon_defconfig
i386                             alldefconfig
powerpc                    socrates_defconfig
c6x                         dsk6455_defconfig
nios2                               defconfig
xtensa                         virt_defconfig
arc                      axs103_smp_defconfig
arm                           h5000_defconfig
c6x                        evmc6472_defconfig
powerpc                     tqm8541_defconfig
mips                      pic32mzda_defconfig
riscv                            allyesconfig
arm                        neponset_defconfig
xtensa                           allyesconfig
powerpc                     tqm5200_defconfig
powerpc                       holly_defconfig
um                            kunit_defconfig
sh                           se7206_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc64e_defconfig
arm                         cm_x300_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                   lite5200b_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8540_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                 randconfig-a004-20201125
i386                 randconfig-a003-20201125
i386                 randconfig-a002-20201125
i386                 randconfig-a005-20201125
i386                 randconfig-a001-20201125
i386                 randconfig-a006-20201125
x86_64               randconfig-a015-20201125
x86_64               randconfig-a011-20201125
x86_64               randconfig-a014-20201125
x86_64               randconfig-a016-20201125
x86_64               randconfig-a012-20201125
x86_64               randconfig-a013-20201125
i386                 randconfig-a012-20201125
i386                 randconfig-a013-20201125
i386                 randconfig-a011-20201125
i386                 randconfig-a016-20201125
i386                 randconfig-a014-20201125
i386                 randconfig-a015-20201125
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a006-20201125
x86_64               randconfig-a003-20201125
x86_64               randconfig-a004-20201125
x86_64               randconfig-a005-20201125
x86_64               randconfig-a002-20201125
x86_64               randconfig-a001-20201125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
