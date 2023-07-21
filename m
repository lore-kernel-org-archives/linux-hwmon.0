Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F6FEB64DD
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jul 2023 04:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGUEIv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jul 2023 00:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGUEIu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jul 2023 00:08:50 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B92269F
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Jul 2023 21:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689912529; x=1721448529;
  h=date:from:to:cc:subject:message-id;
  bh=vuiShM5wfmBFLBVuv/OO/KjYRMo0mknjpTukdq72TQE=;
  b=UKKj8KKILlpNenFK/V0qZjpZG3bhpHPdwx4t76FvRWPbXz46GgD2pNmZ
   2N5zmk+5+K/YcfCpczpKZ8z5mB3sNSnwuC5beOnhJ6WQwbgP5DTzfylQu
   Tm5OtY/Ktnblt1xnOOjaNTJC9ETpf8OBNT52NV9aYBYUZ8dzakSNkDT5a
   uE9x8b+JJaEsz/DhKVBQNWoRN5X+jkiu0xpAXVJeaL3pwH1K8mDFxKn6W
   4UPJDiRaK22KiHNhjSfH3docmh1p/SBv0R1JLoBbUpdOGFQsDNp3ty2aG
   lGPgF+NK1RpUUOTUzDGrNsjkHX0Kuj6xt4Z4yEmJY7wTdyHss6n7E+Sau
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369602030"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="369602030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 21:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701893506"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="701893506"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 21:08:47 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qMhRe-0006qt-2Y;
        Fri, 21 Jul 2023 04:08:46 +0000
Date:   Fri, 21 Jul 2023 12:08:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 c4be22597a36e3487474aee9b4177cc8cf780124
Message-ID: <202307211208.o7sSWsZI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c4be22597a36e3487474aee9b4177cc8cf780124  hwmon: (nct6775) Add support for 18 IN readings for nct6799

elapsed time: 725m

configs tested: 128
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230720   gcc  
alpha                randconfig-r014-20230720   gcc  
alpha                randconfig-r023-20230720   gcc  
alpha                randconfig-r035-20230720   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r016-20230720   gcc  
arc                  randconfig-r022-20230720   gcc  
arc                  randconfig-r043-20230720   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230720   clang
arm                  randconfig-r005-20230720   clang
arm                  randconfig-r046-20230720   gcc  
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230720   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230720   gcc  
hexagon              randconfig-r013-20230720   clang
hexagon              randconfig-r031-20230720   clang
hexagon              randconfig-r033-20230720   clang
hexagon              randconfig-r041-20230720   clang
hexagon              randconfig-r045-20230720   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230720   gcc  
i386         buildonly-randconfig-r005-20230720   gcc  
i386         buildonly-randconfig-r006-20230720   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230720   gcc  
i386                 randconfig-i002-20230720   gcc  
i386                 randconfig-i003-20230720   gcc  
i386                 randconfig-i004-20230720   gcc  
i386                 randconfig-i005-20230720   gcc  
i386                 randconfig-i006-20230720   gcc  
i386                 randconfig-i011-20230720   clang
i386                 randconfig-i012-20230720   clang
i386                 randconfig-i013-20230720   clang
i386                 randconfig-i014-20230720   clang
i386                 randconfig-i015-20230720   clang
i386                 randconfig-i016-20230720   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230720   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r003-20230720   gcc  
microblaze           randconfig-r006-20230720   gcc  
microblaze           randconfig-r011-20230720   gcc  
microblaze           randconfig-r022-20230720   gcc  
microblaze           randconfig-r024-20230720   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                            gpr_defconfig   gcc  
mips                 randconfig-r004-20230720   clang
mips                 randconfig-r012-20230720   gcc  
mips                 randconfig-r025-20230720   gcc  
mips                 randconfig-r036-20230720   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230720   gcc  
openrisc             randconfig-r001-20230720   gcc  
openrisc             randconfig-r024-20230720   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r032-20230720   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230720   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230720   gcc  
riscv                randconfig-r042-20230720   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230720   clang
s390                 randconfig-r044-20230720   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230720   gcc  
sh                   randconfig-r021-20230720   gcc  
sh                   randconfig-r026-20230720   gcc  
sh                          rsk7201_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230720   gcc  
sparc64              randconfig-r013-20230720   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r026-20230720   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230720   gcc  
x86_64       buildonly-randconfig-r002-20230720   gcc  
x86_64       buildonly-randconfig-r003-20230720   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r036-20230720   gcc  
x86_64               randconfig-x001-20230720   clang
x86_64               randconfig-x002-20230720   clang
x86_64               randconfig-x003-20230720   clang
x86_64               randconfig-x004-20230720   clang
x86_64               randconfig-x005-20230720   clang
x86_64               randconfig-x006-20230720   clang
x86_64               randconfig-x011-20230720   gcc  
x86_64               randconfig-x012-20230720   gcc  
x86_64               randconfig-x013-20230720   gcc  
x86_64               randconfig-x014-20230720   gcc  
x86_64               randconfig-x015-20230720   gcc  
x86_64               randconfig-x016-20230720   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r025-20230720   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
