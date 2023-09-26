Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6CAE7E628
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Sep 2023 11:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbjIZLsl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Sep 2023 07:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjIZLsl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Sep 2023 07:48:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58909DE
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Sep 2023 04:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695728914; x=1727264914;
  h=date:from:to:cc:subject:message-id;
  bh=knBOTozTy4ti92oFB1Ax86CLJCfWxfhZWqb46wqL0A4=;
  b=eMAPFWVrNEufNnkq4GeC7UUXLqvp3hMDrbe+E/LTM9j7YswuWjJkZtkh
   MfNi3Nb/hh93yXAy0Uk9blUz8n44CV8xLg5m2Ui/GB6AW5r5fhqM9GnYh
   kYS5al/koS1lI+NhyruNYRyJz0TfGHbXBoKUapmebZENDjev4s2wgcYsK
   Gy1acoiYWwZUIA0cHCJqellEKGKzLLpN8d4sBlT9IN1CQXwEL8+2taqq1
   RXlIfaPfNU08y9ay2RMjba2pcVF3pFwJB7U9tSMseqqb+7idqKIdQ6pxx
   1f1F6e3jReqKJ6amTaSmBzsY+2+d1s+pNokV2nqizhCDCv2z0oWbiTQh8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385395268"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="385395268"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 04:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814428654"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="814428654"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Sep 2023 04:48:32 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ql6YI-0002m1-0d;
        Tue, 26 Sep 2023 11:48:30 +0000
Date:   Tue, 26 Sep 2023 19:48:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 443f1855047638fa27436dfdd1cb2d066408e748
Message-ID: <202309261909.06hAOLDR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 443f1855047638fa27436dfdd1cb2d066408e748  hwmon: (adt7475) Add support for Imon readout on ADT7490

elapsed time: 1409m

configs tested: 183
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230925   gcc  
arc                   randconfig-001-20230926   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                           omap1_defconfig   clang
arm                   randconfig-001-20230925   gcc  
arm                   randconfig-001-20230926   gcc  
arm                        spear6xx_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230926   gcc  
i386         buildonly-randconfig-002-20230926   gcc  
i386         buildonly-randconfig-003-20230926   gcc  
i386         buildonly-randconfig-004-20230926   gcc  
i386         buildonly-randconfig-005-20230926   gcc  
i386         buildonly-randconfig-006-20230926   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230925   gcc  
i386                  randconfig-001-20230926   gcc  
i386                  randconfig-002-20230925   gcc  
i386                  randconfig-002-20230926   gcc  
i386                  randconfig-003-20230925   gcc  
i386                  randconfig-003-20230926   gcc  
i386                  randconfig-004-20230925   gcc  
i386                  randconfig-004-20230926   gcc  
i386                  randconfig-005-20230926   gcc  
i386                  randconfig-006-20230926   gcc  
i386                  randconfig-011-20230925   gcc  
i386                  randconfig-011-20230926   gcc  
i386                  randconfig-012-20230925   gcc  
i386                  randconfig-012-20230926   gcc  
i386                  randconfig-013-20230925   gcc  
i386                  randconfig-013-20230926   gcc  
i386                  randconfig-014-20230925   gcc  
i386                  randconfig-014-20230926   gcc  
i386                  randconfig-015-20230925   gcc  
i386                  randconfig-015-20230926   gcc  
i386                  randconfig-016-20230925   gcc  
i386                  randconfig-016-20230926   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230925   gcc  
loongarch             randconfig-001-20230926   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                        bcm63xx_defconfig   clang
mips                  cavium_octeon_defconfig   clang
mips                     cu1830-neo_defconfig   clang
mips                     loongson1b_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          allyesconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230926   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230926   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230926   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230926   gcc  
x86_64       buildonly-randconfig-002-20230926   gcc  
x86_64       buildonly-randconfig-003-20230926   gcc  
x86_64       buildonly-randconfig-004-20230926   gcc  
x86_64       buildonly-randconfig-005-20230926   gcc  
x86_64       buildonly-randconfig-006-20230926   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230925   gcc  
x86_64                randconfig-001-20230926   gcc  
x86_64                randconfig-002-20230925   gcc  
x86_64                randconfig-002-20230926   gcc  
x86_64                randconfig-003-20230925   gcc  
x86_64                randconfig-003-20230926   gcc  
x86_64                randconfig-004-20230925   gcc  
x86_64                randconfig-004-20230926   gcc  
x86_64                randconfig-005-20230926   gcc  
x86_64                randconfig-006-20230926   gcc  
x86_64                randconfig-011-20230926   gcc  
x86_64                randconfig-012-20230926   gcc  
x86_64                randconfig-013-20230926   gcc  
x86_64                randconfig-014-20230926   gcc  
x86_64                randconfig-015-20230926   gcc  
x86_64                randconfig-016-20230926   gcc  
x86_64                randconfig-071-20230926   gcc  
x86_64                randconfig-072-20230926   gcc  
x86_64                randconfig-073-20230926   gcc  
x86_64                randconfig-074-20230926   gcc  
x86_64                randconfig-075-20230926   gcc  
x86_64                randconfig-076-20230926   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
