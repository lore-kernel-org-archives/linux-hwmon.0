Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19171C77B72
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Apr 2023 11:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjDQLZT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Apr 2023 07:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjDQLZK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Apr 2023 07:25:10 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4357D7690
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Apr 2023 04:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681730648; x=1713266648;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0gs5IeEeT2G54hJu5AKqUtBR+obyEVmNgol7LPxn1ww=;
  b=EwvnwDjG2x9+iTAPmVhA0aDOFP63BTqERfTTXtoFx+BlBdFx/eDwlDDT
   4+RC1n4DPmzV3cjLhzV8Xupko+dssUV3+DXPclVxV1QTyLctk6TdSZANB
   kwxd6+x+DrWWBFDD7wMILCvN35iSMQ9rYD0PMIDi8cdBJTjoB6B7jHsoZ
   nIOjRhiH4M7T42XCYlJQJJKiJ/xEwnSGJ+CCqGawyYXNDG2tb1ICVwv7J
   muB5K75JOpiz5iJGBmKNUx74idU4KgdvEYoZy+DCL6rFTlLX0u8NEIl7h
   i3ORGNyCb6n4kHpN8GCBIKoIHY6QTwH6UoYwRDJ05HxcDA6wZEPAiVC8S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="324486289"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="324486289"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 04:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="723215376"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="723215376"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Apr 2023 04:18:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1poMsc-000cJV-0r;
        Mon, 17 Apr 2023 11:18:42 +0000
Date:   Mon, 17 Apr 2023 19:18:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 b8610e0fe08f1476895f141be60f8dd842f0adac
Message-ID: <643d2af2.MhAlGmBa+QhLaqQg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b8610e0fe08f1476895f141be60f8dd842f0adac  hwmon: (aquacomputer_d5next) Add support for Aquacomputer Aquastream XT

elapsed time: 764m

configs tested: 121
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230417   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230417   gcc  
alpha                randconfig-r032-20230416   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230416   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230416   gcc  
arc                  randconfig-r033-20230416   gcc  
arc                  randconfig-r034-20230416   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230416   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230417   gcc  
arm64                randconfig-r012-20230416   gcc  
arm64                randconfig-r014-20230417   clang
arm64                randconfig-r016-20230416   gcc  
arm64                randconfig-r023-20230416   gcc  
arm64                randconfig-r025-20230416   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230416   gcc  
csky                 randconfig-r033-20230417   gcc  
csky                 randconfig-r035-20230417   gcc  
hexagon      buildonly-randconfig-r006-20230416   clang
hexagon      buildonly-randconfig-r006-20230417   clang
hexagon              randconfig-r001-20230417   clang
hexagon              randconfig-r014-20230416   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230416   gcc  
ia64                 randconfig-r005-20230416   gcc  
ia64                 randconfig-r006-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230416   gcc  
loongarch            randconfig-r034-20230417   gcc  
loongarch            randconfig-r036-20230416   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230416   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r003-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230417   clang
mips                 randconfig-r012-20230417   gcc  
mips                 randconfig-r016-20230417   gcc  
mips                 randconfig-r021-20230416   clang
nios2        buildonly-randconfig-r003-20230416   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230417   gcc  
nios2                randconfig-r025-20230417   gcc  
openrisc             randconfig-r015-20230417   gcc  
openrisc             randconfig-r035-20230416   gcc  
parisc       buildonly-randconfig-r004-20230417   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230417   gcc  
riscv                randconfig-r022-20230417   clang
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r024-20230416   gcc  
s390                 randconfig-r024-20230417   clang
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230417   gcc  
sh                   randconfig-r013-20230417   gcc  
sh                   randconfig-r026-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230416   gcc  
sparc64      buildonly-randconfig-r003-20230417   gcc  
sparc64              randconfig-r022-20230416   gcc  
sparc64              randconfig-r036-20230417   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-r032-20230417   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230416   gcc  
xtensa               randconfig-r021-20230417   gcc  
xtensa               randconfig-r031-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
