Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B913C64E7A
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 12:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9B412080A
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 12:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgLAMZV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Dec 2020 07:25:21 -0500
Received: from mga01.intel.com ([192.55.52.88]:28968 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727374AbgLAMZV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 1 Dec 2020 07:25:21 -0500
IronPort-SDR: AsBoEvMcK23B4PL/HAXTySbvfEsklFxw+CF/YcaPJCQAv0rPPJRFDNXDmC79dOzUxXiy0sT2po
 FpmHAU+UtJJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="191014133"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="191014133"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 04:24:38 -0800
IronPort-SDR: aPsRgwY0XNJmgXEPL66JFSZoMpcXsBj5zPRuWAUrb2yHHKWyUo8mPJXA+eNWPMV6OkV3WuCNwf
 lSKjppcegO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="537495093"
Received: from lkp-server01.sh.intel.com (HELO 70b44b587200) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2020 04:24:37 -0800
Received: from kbuild by 70b44b587200 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kk4hw-0000FR-Tb; Tue, 01 Dec 2020 12:24:36 +0000
Date:   Tue, 01 Dec 2020 20:23:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 cf9c31cd71fae6d16faa02597ac77519c1d48fa2
Message-ID: <5fc635dd.3RAebLnYHy5Ot0zZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: cf9c31cd71fae6d16faa02597ac77519c1d48fa2  hwmon: (applesmc) Add DMI product matches for Intel-based Xserves (non-RackMac*)

elapsed time: 723m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
s390                          debug_defconfig
sh                          polaris_defconfig
powerpc                     redwood_defconfig
parisc                generic-64bit_defconfig
arm                            xcep_defconfig
sh                   sh7770_generic_defconfig
powerpc                     mpc83xx_defconfig
mips                      pistachio_defconfig
xtensa                       common_defconfig
arc                        nsimosci_defconfig
arm                         socfpga_defconfig
mips                      fuloong2e_defconfig
sparc                       sparc32_defconfig
mips                         cobalt_defconfig
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
arc                        vdk_hs38_defconfig
arm                         at91_dt_defconfig
arm                          prima2_defconfig
sh                               allmodconfig
powerpc                     mpc512x_defconfig
powerpc                  mpc885_ads_defconfig
nios2                            alldefconfig
mips                         tb0219_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                           mtx1_defconfig
arm                          ep93xx_defconfig
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
i386                 randconfig-a014-20201201
i386                 randconfig-a013-20201201
i386                 randconfig-a011-20201201
i386                 randconfig-a015-20201201
i386                 randconfig-a012-20201201
i386                 randconfig-a016-20201201
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
x86_64               randconfig-a002-20201130
x86_64               randconfig-a006-20201130
x86_64               randconfig-a005-20201130
x86_64               randconfig-a004-20201130
x86_64               randconfig-a001-20201130
x86_64               randconfig-a003-20201130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
