Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A891DCA0EC7
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 21:21:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbjIKVQV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242636AbjIKP73 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2023 11:59:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECE71AE
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Sep 2023 08:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694447964; x=1725983964;
  h=date:from:to:cc:subject:message-id;
  bh=4771JjZRsNiZs2ojyfoOiwpHSekzjLsJIf5osN7pwqU=;
  b=NZ3cFYnm1aE6SjXhaWGbl48NTuIEa19rVCKtX00xooMad1y66tPQltAu
   nEEXjp8T9jufFr0eyFFZxSGhCokqkzaJDqnlUtZzRvP5+C5dUqu3NeB79
   SCDndJqQoKycN13WFHVJs9bcOWlCNhMYchRxsnjyiawH6MYTFU2f3eaO4
   DD0EO0Ncyt8qKqfFHdQP57HnwVE4uX6Tr/2am3X94LUxyvMjKFy67557B
   AytUCAZrFKVYXtOiyIAGgOE4ChVAgP5sLMxO/9rIOtFWDDVCmYCG+7gzG
   3nr54ERnESRHEpyJx9T939Dj49jIF6aUDu+QrnnFbvG1stxMOpd4ZuozB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378037752"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="378037752"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 08:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772633207"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="772633207"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2023 08:59:20 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfjJl-0006QQ-2s;
        Mon, 11 Sep 2023 15:59:17 +0000
Date:   Mon, 11 Sep 2023 23:58:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 80369d9e1f2f16993ae6d148553c37bf65a209e4
Message-ID: <202309112345.THoy63Mm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 80369d9e1f2f16993ae6d148553c37bf65a209e4  hwmon: (sch5627) Document behaviour of limit registers

Unverified Error/Warning (likely false positive, please contact us if interested):

sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:1095: Error: pcrel too far
{standard input}:611: Warning: end of file not at end of a line; newline inserted

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- sh-allmodconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
`-- sh-allyesconfig
    |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
    |-- standard-input:Error:pcrel-too-far
    `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted

elapsed time: 879m

configs tested: 162
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                  randconfig-r032-20230911   clang
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r035-20230911   gcc  
arm64                randconfig-r036-20230911   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r023-20230911   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-006-20230911   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230911   gcc  
i386                  randconfig-002-20230911   gcc  
i386                  randconfig-003-20230911   gcc  
i386                  randconfig-004-20230911   gcc  
i386                  randconfig-005-20230911   gcc  
i386                  randconfig-006-20230911   gcc  
i386                  randconfig-011-20230911   clang
i386                  randconfig-012-20230911   clang
i386                  randconfig-013-20230911   clang
i386                  randconfig-014-20230911   clang
i386                  randconfig-015-20230911   clang
i386                  randconfig-016-20230911   clang
i386                 randconfig-r012-20230911   clang
i386                 randconfig-r014-20230911   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230911   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r025-20230911   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                        bcm47xx_defconfig   gcc  
mips                 randconfig-r003-20230911   clang
mips                 randconfig-r024-20230911   gcc  
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230911   gcc  
nios2                randconfig-r016-20230911   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r033-20230911   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc              randconfig-r022-20230911   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230911   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230911   clang
s390                 randconfig-r015-20230911   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r021-20230911   gcc  
sh                   randconfig-r034-20230911   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230911   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r004-20230911   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r006-20230911   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230911   gcc  
x86_64       buildonly-randconfig-002-20230911   gcc  
x86_64       buildonly-randconfig-003-20230911   gcc  
x86_64       buildonly-randconfig-004-20230911   gcc  
x86_64       buildonly-randconfig-005-20230911   gcc  
x86_64       buildonly-randconfig-006-20230911   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230911   clang
x86_64                randconfig-002-20230911   clang
x86_64                randconfig-003-20230911   clang
x86_64                randconfig-004-20230911   clang
x86_64                randconfig-005-20230911   clang
x86_64                randconfig-006-20230911   clang
x86_64                randconfig-011-20230911   gcc  
x86_64                randconfig-013-20230911   gcc  
x86_64                randconfig-014-20230911   gcc  
x86_64                randconfig-071-20230911   gcc  
x86_64                randconfig-072-20230911   gcc  
x86_64                randconfig-073-20230911   gcc  
x86_64                randconfig-074-20230911   gcc  
x86_64                randconfig-075-20230911   gcc  
x86_64                randconfig-076-20230911   gcc  
x86_64               randconfig-r005-20230911   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r026-20230911   gcc  
xtensa               randconfig-r031-20230911   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
