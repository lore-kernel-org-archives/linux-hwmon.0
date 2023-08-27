Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7840EC83F12
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Aug 2023 14:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjH0OPL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Aug 2023 10:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjH0OOz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Aug 2023 10:14:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F1511C
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Aug 2023 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693145693; x=1724681693;
  h=date:from:to:cc:subject:message-id;
  bh=2RQwv63S/LwJrWJ56eEMRXOdIgnv64Dc2IlslDe+68Q=;
  b=ZAV2pn2Wcdne8VfpUll8A8Hv0v7VFEsYGdlLs/pmKN21j+p2hjQoMNuo
   02OZAaG4mbimbEctQhLSDc4n6lC4wrhejbXP9woFn/kxXZSpsLYXZ8dOd
   XtUdswuahjpT307rm5cLoKozqhoTnHqUReQ5d0zHFr0xZAHjEAaUkLiuJ
   XAtEILuB3ehWRsxTyY4OtqJ+gTv57LcIWLI4mu1qAvHwE7cBoOIU+kMcW
   lBFJKyiLREbC/Ch5GKj7OdKxQYzFkhryP2QGlB8tknLrLM5vRI8MYjmMd
   a5qnwJ5bC1KxE7+EqOw1s8dM6SUDrJpNg3djWeDhAPivh/szvkI5nDLBc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="354473286"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="354473286"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 07:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="911767986"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="911767986"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Aug 2023 07:14:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qaGXP-0005sf-1w;
        Sun, 27 Aug 2023 14:14:48 +0000
Date:   Sun, 27 Aug 2023 22:14:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 919a83d020a8dfa1411c1dc1cff23a833f0f5268
Message-ID: <202308272217.pxa98ozc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 919a83d020a8dfa1411c1dc1cff23a833f0f5268  hwmon: (tmp513) Simplify probe()

Unverified Error/Warning (likely false positive, please contact us if interested):

sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:608: Error: pcrel too far
{standard input}:667: Warning: overflow in branch to .L84; converted into longer instruction sequence

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-randconfig-r006-20230826
    |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
    |-- standard-input:Error:pcrel-too-far
    |-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
    `-- standard-input:Warning:overflow-in-branch-to-.L84-converted-into-longer-instruction-sequence

elapsed time: 2796m

configs tested: 115
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230826   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230826   gcc  
arm                  randconfig-r021-20230826   gcc  
arm                  randconfig-r032-20230825   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon               randconfig-001-20230826   clang
hexagon               randconfig-002-20230826   clang
i386         buildonly-randconfig-001-20230826   gcc  
i386         buildonly-randconfig-002-20230826   gcc  
i386         buildonly-randconfig-003-20230826   gcc  
i386         buildonly-randconfig-004-20230826   gcc  
i386         buildonly-randconfig-005-20230826   gcc  
i386         buildonly-randconfig-006-20230826   gcc  
i386                                defconfig   gcc  
i386                 randconfig-r006-20230825   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230826   gcc  
loongarch            randconfig-r031-20230825   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r025-20230826   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r005-20230825   gcc  
microblaze           randconfig-r035-20230825   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r001-20230825   gcc  
openrisc             randconfig-r033-20230825   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc64            randconfig-r022-20230826   clang
powerpc64            randconfig-r026-20230826   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230826   gcc  
riscv                randconfig-r002-20230825   clang
riscv                randconfig-r034-20230825   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230826   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r004-20230825   gcc  
sh                   randconfig-r023-20230826   gcc  
sh                   randconfig-r036-20230825   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230826   gcc  
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
x86_64                              defconfig   gcc  
x86_64               randconfig-r003-20230825   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
