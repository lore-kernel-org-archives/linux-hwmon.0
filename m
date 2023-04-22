Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B89C77B61
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Apr 2023 03:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjDVDDi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Apr 2023 23:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDVDDf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2023 23:03:35 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8591FF7
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 20:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682132614; x=1713668614;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AlWdH+e5r41YbJXMHEhmALFioccmXWg7PT0Kvwu9FDQ=;
  b=SIx6lNBP0xiaAtjVASPz23GSoTAxOop+iNz4/6kitOu2Va4HN9RwVxYL
   SWs8HYCMKLf6hPwHwj8yOc7iZc3wkGKiz8JJ8f7YFK1grwO3L14kRmstf
   TIMiwg4e8pBFq8f7SYLipT+iOXn9lYXA6C0TZQ+NsB/A97oTgHo5EmVWb
   tPIyZLWZ72Z1doH2bJCJ+c+/WRfmcn1h8H9uYKMN2CoiqmauGNCeccEz5
   PtRKbyG88EyOVK2O2ZHgxOpIkCrVVNlkmf9hrvDThX/EitFC8AEdf6Mi+
   EIm2F/kNa29wQXZuJMM/UCFBBtadCifCB9d6g0i9ql+nD7ha+XxY3MdVn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="344872042"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="344872042"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 20:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695134992"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="695134992"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2023 20:03:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pq3XA-000h1G-0o;
        Sat, 22 Apr 2023 03:03:32 +0000
Date:   Sat, 22 Apr 2023 11:03:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 93822f5161a2dc57a60b95b35b3cb8589f53413e
Message-ID: <64434e7d.cyXjr2SNURJk2BVe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 93822f5161a2dc57a60b95b35b3cb8589f53413e  hwmon: (pmbus/fsp-3y) Fix functionality bitmask in FSP-3Y YM-2151E

elapsed time: 728m

configs tested: 154
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230421   gcc  
alpha                randconfig-r021-20230421   gcc  
alpha                randconfig-r034-20230421   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230421   gcc  
arc                  randconfig-r006-20230421   gcc  
arc                  randconfig-r043-20230421   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230421   clang
arm                  randconfig-r026-20230421   gcc  
arm                  randconfig-r033-20230421   clang
arm                  randconfig-r046-20230421   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230421   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230421   gcc  
csky                 randconfig-r012-20230421   gcc  
csky                 randconfig-r015-20230421   gcc  
csky                 randconfig-r023-20230421   gcc  
csky                 randconfig-r032-20230421   gcc  
hexagon              randconfig-r016-20230421   clang
hexagon              randconfig-r022-20230421   clang
hexagon              randconfig-r041-20230421   clang
hexagon              randconfig-r045-20230421   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230421   gcc  
ia64                 randconfig-r003-20230421   gcc  
ia64                 randconfig-r005-20230421   gcc  
ia64                 randconfig-r011-20230421   gcc  
ia64                 randconfig-r014-20230421   gcc  
ia64                 randconfig-r025-20230421   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230421   gcc  
loongarch            randconfig-r003-20230421   gcc  
loongarch            randconfig-r011-20230421   gcc  
loongarch            randconfig-r015-20230421   gcc  
loongarch            randconfig-r032-20230421   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230421   gcc  
m68k                 randconfig-r014-20230421   gcc  
m68k                 randconfig-r015-20230421   gcc  
m68k                 randconfig-r016-20230421   gcc  
m68k                 randconfig-r034-20230421   gcc  
m68k                 randconfig-r036-20230421   gcc  
microblaze   buildonly-randconfig-r001-20230421   gcc  
microblaze           randconfig-r012-20230421   gcc  
microblaze           randconfig-r013-20230421   gcc  
microblaze           randconfig-r014-20230421   gcc  
microblaze           randconfig-r024-20230421   gcc  
microblaze           randconfig-r034-20230421   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230421   clang
mips                 randconfig-r006-20230421   clang
mips                 randconfig-r013-20230421   gcc  
mips                 randconfig-r022-20230421   gcc  
nios2        buildonly-randconfig-r005-20230421   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230421   gcc  
nios2                randconfig-r026-20230421   gcc  
nios2                randconfig-r035-20230421   gcc  
openrisc     buildonly-randconfig-r002-20230421   gcc  
openrisc     buildonly-randconfig-r003-20230421   gcc  
openrisc     buildonly-randconfig-r006-20230421   gcc  
openrisc             randconfig-r032-20230421   gcc  
parisc       buildonly-randconfig-r002-20230421   gcc  
parisc       buildonly-randconfig-r004-20230421   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230421   gcc  
parisc               randconfig-r014-20230421   gcc  
parisc               randconfig-r022-20230421   gcc  
parisc               randconfig-r036-20230421   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230421   gcc  
powerpc              randconfig-r014-20230421   clang
powerpc              randconfig-r033-20230421   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230421   gcc  
riscv                randconfig-r024-20230421   clang
riscv                randconfig-r042-20230421   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230421   clang
s390         buildonly-randconfig-r004-20230421   clang
s390         buildonly-randconfig-r005-20230421   clang
s390                                defconfig   gcc  
s390                 randconfig-r006-20230421   gcc  
s390                 randconfig-r011-20230421   clang
s390                 randconfig-r012-20230421   clang
s390                 randconfig-r016-20230421   clang
s390                 randconfig-r044-20230421   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230421   gcc  
sh                   randconfig-r013-20230421   gcc  
sh                   randconfig-r016-20230421   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230421   gcc  
sparc64              randconfig-r002-20230421   gcc  
sparc64              randconfig-r025-20230421   gcc  
sparc64              randconfig-r031-20230421   gcc  
sparc64              randconfig-r032-20230421   gcc  
sparc64              randconfig-r035-20230421   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230421   gcc  
xtensa               randconfig-r005-20230421   gcc  
xtensa               randconfig-r034-20230421   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
