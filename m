Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B5EC001B0
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Jul 2023 06:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjGWGqQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Jul 2023 02:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGWGqP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Jul 2023 02:46:15 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5BE10EC
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Jul 2023 23:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690094773; x=1721630773;
  h=date:from:to:cc:subject:message-id;
  bh=U9Dtif/5tTQ6rc6RrIN1HSMfa9LFnEFB8KYJuaFy4dg=;
  b=CElEIChv9fowIKsP7jk3rl+L0qYwKZ39mDf9LLUZ52bJKTpoMIvmjqmC
   RYj7shh1Vc1rwTGWiKMxAkgvNvKiavYTYBLzf0ixbr9Eaelr/Epj2Hqux
   wuUZDnVcrYbDpqDm9980ko5prZHj90U8GxJdHjDn+kaUlCd/zmXjgU0q6
   erFQZU5QT8Btlam74RundhqSbCmGkD2bw9mdnFne9TeABt0FW8b/LLgkv
   dtkGc3vYPDoirmytv5OCS4ruxbJY/lOUw/WJPZOLtoYGKmDuF2WZZz8Xx
   uMEX5CjCKl1ca5onb9vB6JyDE0BFKONWpg7bAWS5oumnGTRDrHRbAsbLD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="398152397"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="398152397"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 23:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="760427328"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="760427328"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2023 23:46:11 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qNSr4-0008ti-1m;
        Sun, 23 Jul 2023 06:46:10 +0000
Date:   Sun, 23 Jul 2023 14:45:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 261e411dbbf9364b3af2daf67714a3a5237aff68
Message-ID: <202307231440.exA6rkMR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 261e411dbbf9364b3af2daf67714a3a5237aff68  hwmon: (hp-wmi-sensors) Get WMI instance count from WMI driver core

elapsed time: 726m

configs tested: 111
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r031-20230723   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230723   gcc  
arc                  randconfig-r043-20230723   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                  randconfig-r046-20230723   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230723   clang
csky                                defconfig   gcc  
hexagon              randconfig-r016-20230723   clang
hexagon              randconfig-r041-20230723   clang
hexagon              randconfig-r045-20230723   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230723   clang
i386         buildonly-randconfig-r005-20230723   clang
i386         buildonly-randconfig-r006-20230723   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230723   clang
i386                 randconfig-i002-20230723   clang
i386                 randconfig-i003-20230723   clang
i386                 randconfig-i004-20230723   clang
i386                 randconfig-i005-20230723   clang
i386                 randconfig-i006-20230723   clang
i386                 randconfig-i011-20230723   gcc  
i386                 randconfig-i012-20230723   gcc  
i386                 randconfig-i013-20230723   gcc  
i386                 randconfig-i014-20230723   gcc  
i386                 randconfig-i015-20230723   gcc  
i386                 randconfig-i016-20230723   gcc  
i386                 randconfig-r014-20230723   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230723   gcc  
m68k                 randconfig-r035-20230723   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
mips                     loongson1b_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r021-20230723   gcc  
openrisc             randconfig-r025-20230723   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230723   gcc  
parisc               randconfig-r012-20230723   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc              randconfig-r033-20230723   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230723   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230723   gcc  
sh                               allmodconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r022-20230723   gcc  
sh                   randconfig-r023-20230723   gcc  
sh                   randconfig-r032-20230723   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230723   gcc  
sparc64              randconfig-r002-20230723   gcc  
sparc64              randconfig-r011-20230723   gcc  
sparc64              randconfig-r015-20230723   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230723   clang
x86_64       buildonly-randconfig-r002-20230723   clang
x86_64       buildonly-randconfig-r003-20230723   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230723   gcc  
x86_64               randconfig-x002-20230723   gcc  
x86_64               randconfig-x003-20230723   gcc  
x86_64               randconfig-x004-20230723   gcc  
x86_64               randconfig-x005-20230723   gcc  
x86_64               randconfig-x006-20230723   gcc  
x86_64               randconfig-x011-20230723   clang
x86_64               randconfig-x012-20230723   clang
x86_64               randconfig-x013-20230723   clang
x86_64               randconfig-x014-20230723   clang
x86_64               randconfig-x015-20230723   clang
x86_64               randconfig-x016-20230723   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r013-20230723   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
