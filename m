Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF59C77B61
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 Apr 2023 08:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDHI3n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 Apr 2023 04:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjDHI3n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Apr 2023 04:29:43 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BECD522
        for <linux-hwmon@vger.kernel.org>; Sat,  8 Apr 2023 01:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680942582; x=1712478582;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hhLt8upTlSYj2GHVLabUBROfjG5snlNyLYijfPDrPkc=;
  b=D39lM7EgPDVmmHJwk2hWgGFEI2VYK6jKcbFhW2hYCr3zDzGgwY2p/hAj
   8v9eCfBx+PJt91so+futlJBpSq1SjzZIgSVoDLlkEZBtfPrY12bsc81IG
   5lG6SmZP+j3f/HsVsu2QovMLhQRWWibm9ewBuhOksmXzg5qH+2mHEpgUU
   aSbBGkdT81Nq5JEiMCEVbSNQahiSmCpEWCcoQjlSI/jEL1qUKUNci7876
   j1Cs6mDEBXfyfRHzyOs1HBvim3CuOV5z8FuUhp7hRQW3h9P8cSnbw4gya
   s+idwZCuL3IkseLsBuEi9td57oBY9VV7tNXciJiVVVl/Fbzc8tCovYJLn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="345783313"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="345783313"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 01:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752248900"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="752248900"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2023 01:29:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pl3x5-000TX3-0T;
        Sat, 08 Apr 2023 08:29:39 +0000
Date:   Sat, 08 Apr 2023 16:29:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-const] BUILD SUCCESS
 d8cc9415a40f479b666fc03e7b1f4601868e6dc8
Message-ID: <643125da.hNWu3w+BIa6dJHMp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-const
branch HEAD: d8cc9415a40f479b666fc03e7b1f4601868e6dc8  hwmon: constify pointers to hwmon_channel_info

elapsed time: 843m

configs tested: 138
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230403   gcc  
alpha        buildonly-randconfig-r005-20230403   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230403   gcc  
alpha                randconfig-r036-20230403   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230403   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230403   gcc  
arc                  randconfig-r016-20230403   gcc  
arc                  randconfig-r033-20230403   gcc  
arc                  randconfig-r043-20230403   gcc  
arc                  randconfig-r043-20230408   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230403   gcc  
arm                  randconfig-r046-20230408   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230403   clang
arm64                randconfig-r015-20230403   gcc  
arm64                randconfig-r015-20230406   clang
arm64                randconfig-r016-20230406   clang
csky         buildonly-randconfig-r003-20230403   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r021-20230404   gcc  
hexagon      buildonly-randconfig-r001-20230403   clang
hexagon              randconfig-r004-20230403   clang
hexagon              randconfig-r012-20230403   clang
hexagon              randconfig-r041-20230408   clang
hexagon              randconfig-r045-20230408   clang
i386                             allyesconfig   gcc  
i386                         debian-10.3-func   gcc  
i386                   debian-10.3-kselftests   gcc  
i386                        debian-10.3-kunit   gcc  
i386                          debian-10.3-kvm   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                          randconfig-a016   gcc  
i386                 randconfig-r022-20230403   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r022-20230403   gcc  
ia64                 randconfig-r023-20230403   gcc  
ia64                 randconfig-r026-20230404   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230403   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230403   gcc  
m68k         buildonly-randconfig-r006-20230403   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r023-20230403   gcc  
microblaze           randconfig-r024-20230403   gcc  
microblaze           randconfig-r031-20230403   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230403   gcc  
mips                 randconfig-r011-20230403   clang
nios2        buildonly-randconfig-r003-20230403   gcc  
nios2        buildonly-randconfig-r006-20230403   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230403   gcc  
nios2                randconfig-r024-20230403   gcc  
openrisc             randconfig-r025-20230403   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230403   gcc  
powerpc              randconfig-r013-20230403   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230403   clang
riscv                randconfig-r012-20230406   clang
riscv                randconfig-r021-20230403   gcc  
riscv                randconfig-r042-20230403   gcc  
riscv                randconfig-r042-20230408   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230403   clang
s390                 randconfig-r004-20230403   clang
s390                 randconfig-r035-20230403   clang
s390                 randconfig-r044-20230403   gcc  
s390                 randconfig-r044-20230408   clang
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230404   gcc  
sparc                randconfig-r032-20230403   gcc  
sparc64      buildonly-randconfig-r002-20230403   gcc  
sparc64              randconfig-r005-20230403   gcc  
sparc64              randconfig-r021-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64                        randconfig-a016   clang
x86_64               randconfig-k001-20230403   gcc  
x86_64               randconfig-r026-20230403   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r024-20230404   gcc  
xtensa               randconfig-r026-20230403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
