Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B888AC77B71
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Apr 2023 05:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjDRFRh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Apr 2023 01:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjDRFRY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Apr 2023 01:17:24 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F14F189
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Apr 2023 22:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681795043; x=1713331043;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KjjSzgRgGeIOqxNa2XJRBVzGIB7JsrYDq7gO3+exg9k=;
  b=Ayq5lfcD/f6LT57JajMKI6W2uRvKkKb9pgQeOPWMPIcGtxwHP6uEuzvI
   h47d1c3QdnUyJ/XLJtHVz5AN8Q2auTwCQSoobiMhrJ6OdshfWRmOp/8X7
   v6bbqvav6JOrxQwgvcsPtkoZ+5TXqVxkLyfrTufcyNGwuyBJZdurfzOSl
   H3BF3rAp2YOfsKZgo4Ayfll6KVcWZ+pRfAnFFy+dHr0kPoBgwIZxm5cYN
   3BiWKHJMCNFm2JzRkws+oZkPzi0lay8IL/Xko3nDHsFKV+PzWcXubJTGC
   45MeOOHtVeFFLPfAgI1f956O/FMdmMt+nx29dBBGKZoRD30fAQ5XdopKZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325417148"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="325417148"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 22:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834719621"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="834719621"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 22:17:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1podiT-000d0x-1L;
        Tue, 18 Apr 2023 05:17:21 +0000
Date:   Tue, 18 Apr 2023 13:16:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 fcf5181e0dea2f42d6b3d387b5aa1bbb775bcf38
Message-ID: <643e27bb.UdvRVJIKc++ECHO2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: fcf5181e0dea2f42d6b3d387b5aa1bbb775bcf38  watchdog: loongson1_wdt: Implement restart handler

elapsed time: 871m

configs tested: 121
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230417   gcc  
arc                  randconfig-r014-20230417   gcc  
arc                  randconfig-r025-20230417   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230417   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230416   gcc  
arm                  randconfig-r002-20230417   clang
arm                  randconfig-r021-20230416   clang
arm                  randconfig-r025-20230416   clang
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230417   gcc  
arm64                randconfig-r026-20230416   gcc  
arm64                randconfig-r036-20230416   clang
csky                                defconfig   gcc  
csky                 randconfig-r016-20230417   gcc  
csky                 randconfig-r023-20230416   gcc  
hexagon              randconfig-r005-20230416   clang
hexagon              randconfig-r013-20230416   clang
hexagon              randconfig-r035-20230416   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
i386                 randconfig-r023-20230417   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230416   gcc  
ia64                 randconfig-r034-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230416   gcc  
m68k                 randconfig-r015-20230416   gcc  
microblaze   buildonly-randconfig-r002-20230416   gcc  
microblaze           randconfig-r021-20230417   gcc  
microblaze           randconfig-r024-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r003-20230417   clang
mips                 randconfig-r013-20230417   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230416   gcc  
nios2                randconfig-r022-20230417   gcc  
openrisc     buildonly-randconfig-r004-20230417   gcc  
openrisc             randconfig-r014-20230416   gcc  
parisc       buildonly-randconfig-r002-20230417   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230417   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230417   clang
powerpc              randconfig-r015-20230417   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230416   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230416   clang
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230417   gcc  
sparc        buildonly-randconfig-r001-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230416   gcc  
sparc64              randconfig-r003-20230416   gcc  
sparc64              randconfig-r016-20230416   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r006-20230417   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
