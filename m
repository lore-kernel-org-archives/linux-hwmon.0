Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD70C77B70
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Apr 2023 10:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjDQKks (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjDQKkr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Apr 2023 06:40:47 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BD44EEE
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Apr 2023 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681727998; x=1713263998;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ijyVABiDRvsXhuMNoNUPL0bkRltTyohWgCHV1135WEM=;
  b=fYh2UMKAAekN/7iwQqhv2fKmjfL4G7idauI5NCGsn09X4Tgdwl4qFEuE
   Ne7PnhBVGway6XBFWw2918VcP3PNdwxrzLrB+EsE3Ys7PxCVrYta6LcQw
   ZSjce0Eott7NdRCKHXPCte8hvN1fu248inID9fg0wowYopsiDa0UmmV1p
   xyrheOhIFliTOT6j28xBRU1Y3cTIzwNegmxBhH/bzSaVsvpQT1C1Rx7rY
   mKg/QarHOQVAf96NgyMbLAIzJlLJ+Yk4UKLk9MZp85k+U4EzR+ynLkRrF
   /KJdIVSAHUCFnZge7Ek63m1idLYVdTId1dq5ruWqogUzv2zuRjYhkpxQP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="410069916"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="410069916"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 03:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="936780750"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="936780750"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2023 03:38:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1poMFs-000cHz-29;
        Mon, 17 Apr 2023 10:38:40 +0000
Date:   Mon, 17 Apr 2023 18:38:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 831f5e20e6c349406e0deeca1d4bd54b07412b5f
Message-ID: <643d2193.mWksPXi6yMDy0n2F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 831f5e20e6c349406e0deeca1d4bd54b07412b5f  watchdog: loongson1_wdt: Implement restart handler

elapsed time: 723m

configs tested: 123
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230417   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        oxnas_v6_defconfig   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230417   clang
csky         buildonly-randconfig-r006-20230416   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230417   gcc  
hexagon              randconfig-r001-20230417   clang
hexagon              randconfig-r014-20230417   clang
hexagon              randconfig-r023-20230417   clang
hexagon              randconfig-r036-20230417   clang
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
ia64                 randconfig-r003-20230416   gcc  
ia64                 randconfig-r006-20230417   gcc  
ia64                 randconfig-r033-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230416   gcc  
loongarch    buildonly-randconfig-r005-20230416   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230416   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230416   gcc  
m68k                 randconfig-r015-20230417   gcc  
m68k                 randconfig-r022-20230417   gcc  
m68k                 randconfig-r024-20230417   gcc  
microblaze           randconfig-r001-20230416   gcc  
microblaze           randconfig-r012-20230417   gcc  
microblaze           randconfig-r031-20230416   gcc  
microblaze           randconfig-r034-20230417   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r023-20230416   clang
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230417   gcc  
nios2                randconfig-r035-20230417   gcc  
openrisc     buildonly-randconfig-r003-20230416   gcc  
openrisc             randconfig-r011-20230416   gcc  
openrisc             randconfig-r016-20230416   gcc  
openrisc             randconfig-r035-20230416   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230417   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc              randconfig-r025-20230416   gcc  
powerpc              randconfig-r031-20230417   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230417   gcc  
riscv                randconfig-r022-20230416   gcc  
riscv                randconfig-r026-20230416   gcc  
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230416   gcc  
s390                 randconfig-r036-20230416   clang
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230416   gcc  
sh                   randconfig-r025-20230417   gcc  
sh                   randconfig-r032-20230416   gcc  
sh                           sh2007_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230416   gcc  
sparc                randconfig-r013-20230417   gcc  
sparc64              randconfig-r032-20230417   gcc  
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
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230416   gcc  
xtensa               randconfig-r021-20230416   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
