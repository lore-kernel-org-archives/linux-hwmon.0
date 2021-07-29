Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60466C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 06:32:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40CB260F6F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 06:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhG2GcJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 29 Jul 2021 02:32:09 -0400
Received: from mga17.intel.com ([192.55.52.151]:17578 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233934AbhG2GcI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Jul 2021 02:32:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="193092850"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; 
   d="scan'208";a="193092850"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 23:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; 
   d="scan'208";a="499640506"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2021 23:32:04 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m8zaN-0008wN-Kk; Thu, 29 Jul 2021 06:32:03 +0000
Date:   Thu, 29 Jul 2021 14:31:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 36c4d19d52b01d8dec42d0bb27c03d9f28774462
Message-ID: <61024b40.JxHDxw3ph02zhcIz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 36c4d19d52b01d8dec42d0bb27c03d9f28774462  dt-bindings: sbrmi: Add SB-RMI hwmon driver bindings

elapsed time: 723m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210728
powerpc                     kilauea_defconfig
m68k                          multi_defconfig
sh                          polaris_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                       holly_defconfig
x86_64                              defconfig
arm                       spear13xx_defconfig
powerpc                     mpc5200_defconfig
powerpc                    adder875_defconfig
sh                          r7780mp_defconfig
mips                           mtx1_defconfig
m68k                             allmodconfig
arm                        vexpress_defconfig
mips                     loongson2k_defconfig
sh                          rsk7264_defconfig
sh                   sh7770_generic_defconfig
h8300                            alldefconfig
openrisc                 simple_smp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
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
x86_64               randconfig-a006-20210728
x86_64               randconfig-a003-20210728
x86_64               randconfig-a001-20210728
x86_64               randconfig-a004-20210728
x86_64               randconfig-a005-20210728
x86_64               randconfig-a002-20210728
i386                 randconfig-a005-20210728
i386                 randconfig-a003-20210728
i386                 randconfig-a004-20210728
i386                 randconfig-a002-20210728
i386                 randconfig-a001-20210728
i386                 randconfig-a006-20210728
i386                 randconfig-a016-20210728
i386                 randconfig-a012-20210728
i386                 randconfig-a013-20210728
i386                 randconfig-a014-20210728
i386                 randconfig-a011-20210728
i386                 randconfig-a015-20210728
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210728
x86_64               randconfig-a016-20210728
x86_64               randconfig-a011-20210728
x86_64               randconfig-a014-20210728
x86_64               randconfig-a013-20210728
x86_64               randconfig-a012-20210728
x86_64               randconfig-a015-20210728

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
