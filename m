Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02594C433B4
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 11:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0A2861242
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 11:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbhEQLHX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 May 2021 07:07:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:47511 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236514AbhEQLHW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 May 2021 07:07:22 -0400
IronPort-SDR: p8vOQsviebMlUlDp1l0O+Ux/ZNdfU5Ss2KDcTnnUW/+wmtRqyU3sxs8jmUYRxgUsxdMkPh0cTG
 A4Vbr+R4hKuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="197355960"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="197355960"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:06:06 -0700
IronPort-SDR: 629W5gZLfahQPpOyacO+FYXUY1xkmsrEAOV7XMCzVAvo1ES8bXvsDuJjSV4BUlN/EoosnJycnD
 HR49/lbJFGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="437708631"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 May 2021 04:06:05 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lib4W-0001ld-HY; Mon, 17 May 2021 11:06:04 +0000
Date:   Mon, 17 May 2021 19:05:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 7eafc07471f6526b6abe6d72d668abe49fce3367
Message-ID: <60a24dea.yJoBSwKshYNsoR1t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7eafc07471f6526b6abe6d72d668abe49fce3367  hwmon: (adm1275) enable adm1272 temperature reporting

elapsed time: 721m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      fuloong2e_defconfig
arm                             mxs_defconfig
powerpc                      bamboo_defconfig
xtensa                  nommu_kc705_defconfig
m68k                             allyesconfig
sh                           se7780_defconfig
powerpc                    ge_imp3a_defconfig
mips                     cu1000-neo_defconfig
mips                           ip22_defconfig
sh                          rsk7201_defconfig
powerpc                     mpc5200_defconfig
mips                     loongson1c_defconfig
powerpc                   currituck_defconfig
sh                             shx3_defconfig
nios2                            allyesconfig
mips                  cavium_octeon_defconfig
powerpc                      chrp32_defconfig
arm                            lart_defconfig
parisc                           allyesconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm5200_defconfig
powerpc                     ep8248e_defconfig
mips                    maltaup_xpa_defconfig
arm                     am200epdkit_defconfig
arm                         vf610m4_defconfig
arc                         haps_hs_defconfig
arm                       aspeed_g5_defconfig
alpha                               defconfig
openrisc                    or1ksim_defconfig
i386                             alldefconfig
openrisc                  or1klitex_defconfig
mips                       bmips_be_defconfig
mips                      pistachio_defconfig
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
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
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
i386                 randconfig-a003-20210517
i386                 randconfig-a001-20210517
i386                 randconfig-a004-20210517
i386                 randconfig-a005-20210517
i386                 randconfig-a002-20210517
i386                 randconfig-a006-20210517
x86_64               randconfig-a012-20210517
x86_64               randconfig-a015-20210517
x86_64               randconfig-a011-20210517
x86_64               randconfig-a013-20210517
x86_64               randconfig-a016-20210517
x86_64               randconfig-a014-20210517
i386                 randconfig-a016-20210517
i386                 randconfig-a014-20210517
i386                 randconfig-a011-20210517
i386                 randconfig-a012-20210517
i386                 randconfig-a015-20210517
i386                 randconfig-a013-20210517
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
x86_64               randconfig-a004-20210517
x86_64               randconfig-a003-20210517
x86_64               randconfig-a001-20210517
x86_64               randconfig-a005-20210517
x86_64               randconfig-a002-20210517
x86_64               randconfig-a006-20210517

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
