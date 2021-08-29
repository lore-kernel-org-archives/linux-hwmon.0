Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AB1C432BE
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Aug 2021 04:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58F5A60E90
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Aug 2021 04:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhH2EWq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:22:46 -0400
Received: from mga12.intel.com ([192.55.52.136]:31389 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2EWp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 29 Aug 2021 00:22:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10090"; a="197698863"
X-IronPort-AV: E=Sophos;i="5.84,360,1620716400"; 
   d="scan'208";a="197698863"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2021 21:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,360,1620716400"; 
   d="scan'208";a="518175103"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2021 21:21:52 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mKCKN-00041Z-G5; Sun, 29 Aug 2021 04:21:51 +0000
Date:   Sun, 29 Aug 2021 12:20:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 0e35f63f7f4eebd268ec236fd1bbf4e561ce8de5
Message-ID: <612b0b2b.fAe6j4ocMaoCSVad%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0e35f63f7f4eebd268ec236fd1bbf4e561ce8de5  hwmon: add driver for Aquacomputer D5 Next

elapsed time: 722m

configs tested: 99
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210827
mips                     cu1830-neo_defconfig
sh                          sdk7780_defconfig
x86_64                           alldefconfig
powerpc                   microwatt_defconfig
mips                          ath25_defconfig
openrisc                 simple_smp_defconfig
m68k                       m5249evb_defconfig
powerpc                      bamboo_defconfig
powerpc                       ppc64_defconfig
arm                        cerfcube_defconfig
powerpc                      chrp32_defconfig
arc                     haps_hs_smp_defconfig
nds32                             allnoconfig
mips                    maltaup_xpa_defconfig
powerpc                     kilauea_defconfig
arm                           sunxi_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
x86_64               randconfig-a014-20210829
x86_64               randconfig-a016-20210829
x86_64               randconfig-a015-20210829
x86_64               randconfig-a012-20210829
x86_64               randconfig-a013-20210829
x86_64               randconfig-a011-20210829
arc                  randconfig-r043-20210829
riscv                randconfig-r042-20210829
s390                 randconfig-r044-20210829
arc                  randconfig-r043-20210827
riscv                randconfig-r042-20210827
s390                 randconfig-r044-20210827
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20210829
x86_64               randconfig-a006-20210829
x86_64               randconfig-a005-20210829
x86_64               randconfig-a003-20210829
x86_64               randconfig-a004-20210829
x86_64               randconfig-a002-20210829
i386                 randconfig-a001-20210829
i386                 randconfig-a006-20210829
i386                 randconfig-a005-20210829
i386                 randconfig-a004-20210829
i386                 randconfig-a003-20210829
i386                 randconfig-a011-20210828
i386                 randconfig-a016-20210828
i386                 randconfig-a012-20210828
i386                 randconfig-a014-20210828
i386                 randconfig-a013-20210828
i386                 randconfig-a015-20210828
hexagon              randconfig-r041-20210827
hexagon              randconfig-r045-20210827

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
