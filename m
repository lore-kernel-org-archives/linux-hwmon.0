Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16836C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 May 2021 11:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFBEB61001
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 May 2021 11:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241951AbhERLMU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 May 2021 07:12:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:14900 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241330AbhERLMT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 May 2021 07:12:19 -0400
IronPort-SDR: aGirXaop55scAM7jSnmV1hECZ3VVkLVd1zR/NcCttdGVDTon4PTLDRL9l5C88m5Cp+IQBoxTob
 bR0OqA/l/qjA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="286215324"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="286215324"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 04:11:01 -0700
IronPort-SDR: vJv17xykKAxfgDrdaZE/oweUIt9hrc7mnBO/j1lngB259/Ujx9JcIaSBLU0qAEE+6XVC3EGFw1
 ivEwLSuXhj3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="472899750"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 May 2021 04:11:00 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lixcp-00029p-Kk; Tue, 18 May 2021 11:10:59 +0000
Date:   Tue, 18 May 2021 19:10:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 f0fb26c456a30d6009faa2c9d44aa22f5bf88c90
Message-ID: <60a3a0ba.oSOh4Jha++10rpFt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f0fb26c456a30d6009faa2c9d44aa22f5bf88c90  hwmon/pmbus: (q54sj108a2) The PMBUS_MFR_ID is actually 6 chars instead of 5

elapsed time: 724m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        edosk7760_defconfig
arm                       aspeed_g5_defconfig
mips                           rs90_defconfig
mips                          rb532_defconfig
s390                             alldefconfig
sh                                  defconfig
sh                         ap325rxa_defconfig
arm                          moxart_defconfig
arm                         bcm2835_defconfig
sh                          r7785rp_defconfig
mips                          ath79_defconfig
sh                          urquell_defconfig
powerpc                      arches_defconfig
mips                    maltaup_xpa_defconfig
sh                             shx3_defconfig
powerpc                        cell_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                            q40_defconfig
powerpc                   currituck_defconfig
um                            kunit_defconfig
arm                        oxnas_v6_defconfig
i386                             allyesconfig
powerpc                 mpc8560_ads_defconfig
m68k                       bvme6000_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
s390                          debug_defconfig
xtensa                generic_kc705_defconfig
mips                            ar7_defconfig
arm                           spitz_defconfig
arc                           tb10x_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                      fuloong2e_defconfig
powerpc                     tqm5200_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                 randconfig-a003-20210518
i386                 randconfig-a001-20210518
i386                 randconfig-a005-20210518
i386                 randconfig-a004-20210518
i386                 randconfig-a002-20210518
i386                 randconfig-a006-20210518
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
x86_64               randconfig-b001-20210518
x86_64               randconfig-b001-20210517
x86_64               randconfig-a004-20210517
x86_64               randconfig-a003-20210517
x86_64               randconfig-a001-20210517
x86_64               randconfig-a005-20210517
x86_64               randconfig-a002-20210517
x86_64               randconfig-a006-20210517

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
