Return-Path: <SRS0=A7RS=DB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4D9C4346E
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 04:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1597235F7
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 04:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgIXE62 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Sep 2020 00:58:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:48070 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXE62 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Sep 2020 00:58:28 -0400
IronPort-SDR: bAE9pqsqWHkBR2LzhK6R/LdlLyzePeKV3yEGEytM6Ybd2yR/cDcvJFPunhhoa18oxQy0KIY+aH
 l+ePG9Jy0law==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="160383349"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="160383349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 21:58:28 -0700
IronPort-SDR: SdrqUhNDQ87wUIIX72koC26fZZFhzuGVN6ZzRBvloUY4XZF3RnM9rhLMLQ2AhZ6PYVycPz79pz
 Yo5jDsIRag4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="455194775"
Received: from lkp-server01.sh.intel.com (HELO 9f27196b5390) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Sep 2020 21:58:26 -0700
Received: from kbuild by 9f27196b5390 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kLJKs-0000WO-0f; Thu, 24 Sep 2020 04:58:26 +0000
Date:   Thu, 24 Sep 2020 12:58:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 55163a1c00fcb526e2aa9f7f952fb38d3543da5e
Message-ID: <5f6c276e.CKqM/nhkiLJkPcK+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 55163a1c00fcb526e2aa9f7f952fb38d3543da5e  hwmon: (k10temp) Add support for Zen3 CPUs

elapsed time: 724m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             pxa_defconfig
xtensa                         virt_defconfig
sh                          rsk7269_defconfig
arm                       imx_v6_v7_defconfig
arm                             rpc_defconfig
riscv                               defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
ia64                          tiger_defconfig
mips                             allmodconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
h8300                       h8s-sim_defconfig
sh                             espt_defconfig
arm                          iop32x_defconfig
arm                       spear13xx_defconfig
arm                          simpad_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                       aspeed_g4_defconfig
arm                         axm55xx_defconfig
m68k                            q40_defconfig
sh                           se7712_defconfig
powerpc                    amigaone_defconfig
nios2                         10m50_defconfig
arm                         s3c6400_defconfig
mips                           rs90_defconfig
microblaze                    nommu_defconfig
sh                           se7206_defconfig
m68k                         apollo_defconfig
arc                            hsdk_defconfig
mips                          ath79_defconfig
arc                     nsimosci_hs_defconfig
arm                          imote2_defconfig
mips                  maltasmvp_eva_defconfig
arm                       cns3420vb_defconfig
arc                             nps_defconfig
arm                         orion5x_defconfig
sh                      rts7751r2d1_defconfig
sh                        sh7757lcr_defconfig
powerpc                     ep8248e_defconfig
powerpc                          g5_defconfig
powerpc                      acadia_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc85xx_cds_defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200923
i386                 randconfig-a006-20200923
i386                 randconfig-a003-20200923
i386                 randconfig-a004-20200923
i386                 randconfig-a005-20200923
i386                 randconfig-a001-20200923
x86_64               randconfig-a011-20200923
x86_64               randconfig-a013-20200923
x86_64               randconfig-a014-20200923
x86_64               randconfig-a015-20200923
x86_64               randconfig-a012-20200923
x86_64               randconfig-a016-20200923
i386                 randconfig-a012-20200923
i386                 randconfig-a014-20200923
i386                 randconfig-a016-20200923
i386                 randconfig-a013-20200923
i386                 randconfig-a011-20200923
i386                 randconfig-a015-20200923
i386                 randconfig-a012-20200924
i386                 randconfig-a014-20200924
i386                 randconfig-a016-20200924
i386                 randconfig-a013-20200924
i386                 randconfig-a011-20200924
i386                 randconfig-a015-20200924
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200923
x86_64               randconfig-a003-20200923
x86_64               randconfig-a004-20200923
x86_64               randconfig-a002-20200923
x86_64               randconfig-a006-20200923
x86_64               randconfig-a001-20200923
x86_64               randconfig-a011-20200924
x86_64               randconfig-a013-20200924
x86_64               randconfig-a014-20200924
x86_64               randconfig-a015-20200924
x86_64               randconfig-a012-20200924
x86_64               randconfig-a016-20200924

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
