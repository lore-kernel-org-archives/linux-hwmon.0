Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B55EEB64DD
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jul 2023 03:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjG3D4d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Jul 2023 23:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG3D4b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Jul 2023 23:56:31 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C51172D
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Jul 2023 20:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690689390; x=1722225390;
  h=date:from:to:cc:subject:message-id;
  bh=d1pHWXmXhSaPDTTYR9kaskgbq7wL4iduy6loCgZTazw=;
  b=PrZG5iCF1YwII0tZltdvzByrOq1MGUl/szRap5GxGhzRC1tQmZ4uRrns
   Q3C6J5cleWayAkI47PwqVK59raghlA97UfGDhFjPuupSyNmW6khrP+Nuo
   5xOM2lE3qwoRdJ6YeEGCkwM+R2DMWe1GYSCCqSI7QX45b88bnPxFz5jGB
   TKGIrspwOJQV+yyqT3msTUkr6DydOnIH9ZIxlXxniCZDnvzKStDZJ/WMx
   rD/EZ1c8YRq59nuyeUz2LZIt/YcDX90Zkmo10hKpOsUarfD8e54DyXto3
   af21RTN5l8VSPx+1LAzlhzfaXhgj+eqMeqP0PDPLICmyga7YuxAJw2tnb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="348414565"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="348414565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 20:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="757566889"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="757566889"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Jul 2023 20:56:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPxXc-0004Qn-1N;
        Sun, 30 Jul 2023 03:56:25 +0000
Date:   Sun, 30 Jul 2023 11:55:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 b273f167906ae988296cf79d859f1f5a86428afe
Message-ID: <202307301137.V0qAjdxV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b273f167906ae988296cf79d859f1f5a86428afe  hwmon: Add driver for Renesas HS3001

elapsed time: 722m

configs tested: 105
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230729   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r036-20230729   gcc  
arm                  randconfig-r046-20230729   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230730   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230729   gcc  
hexagon              randconfig-r041-20230729   clang
hexagon              randconfig-r045-20230729   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230730   clang
i386         buildonly-randconfig-r005-20230730   clang
i386         buildonly-randconfig-r006-20230730   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230729   clang
i386                 randconfig-i002-20230729   clang
i386                 randconfig-i003-20230729   clang
i386                 randconfig-i004-20230729   clang
i386                 randconfig-i005-20230729   clang
i386                 randconfig-i006-20230729   clang
i386                 randconfig-i011-20230730   gcc  
i386                 randconfig-i012-20230730   gcc  
i386                 randconfig-i013-20230730   gcc  
i386                 randconfig-i014-20230730   gcc  
i386                 randconfig-i015-20230730   gcc  
i386                 randconfig-i016-20230730   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230729   gcc  
microblaze           randconfig-r013-20230730   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230729   gcc  
openrisc             randconfig-r022-20230729   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230729   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r021-20230729   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230729   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230729   clang
s390                 randconfig-r044-20230729   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230730   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230729   gcc  
sparc64              randconfig-r011-20230730   gcc  
sparc64              randconfig-r016-20230730   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r006-20230729   gcc  
um                   randconfig-r032-20230729   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230730   clang
x86_64       buildonly-randconfig-r002-20230730   clang
x86_64       buildonly-randconfig-r003-20230730   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230729   clang
x86_64               randconfig-r015-20230730   gcc  
x86_64               randconfig-r025-20230729   gcc  
x86_64               randconfig-x001-20230728   clang
x86_64               randconfig-x002-20230728   clang
x86_64               randconfig-x003-20230728   clang
x86_64               randconfig-x004-20230728   clang
x86_64               randconfig-x005-20230728   clang
x86_64               randconfig-x006-20230728   clang
x86_64               randconfig-x011-20230730   clang
x86_64               randconfig-x012-20230730   clang
x86_64               randconfig-x013-20230730   clang
x86_64               randconfig-x014-20230730   clang
x86_64               randconfig-x015-20230730   clang
x86_64               randconfig-x016-20230730   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r024-20230729   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
