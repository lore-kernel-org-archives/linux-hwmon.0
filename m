Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA41DC77B7A
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Jun 2023 04:51:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjFKEu5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 11 Jun 2023 00:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbjFKEuw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Jun 2023 00:50:52 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350BE30F5
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Jun 2023 21:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686459050; x=1717995050;
  h=date:from:to:cc:subject:message-id;
  bh=nwwaLm16ZC1GAvJnQjGGprQaKGGON5C0EebGp1AGFuI=;
  b=G7Vm9ZywW+mZowkazhrc5nKRVfiWh3F2UnOlFQ5If5N84Runn8XJa/KS
   3YBtMianUM1IwH8fjYreYwhw7z955Lz9eIZgoNnwkTYNdfWkBloU2SOVa
   t9SIwnEIjFY7aero1w61sypwfdSSZsqXH321+uUJK807jW3v3fu6iM70U
   OELHYxzGnC16nZknsHFFwYeT0tSTS7+OZfyKl8ciyiCO7N1K+p0kKQ9js
   V+ILpwhng40f9VEJNoq5FIs64IoIWSngPJLG+qi0U0DzWjkJf3hxgUSd0
   VHf532CZC3tnUI+ibWrUcuIH0aT2WpjCOh5ujW+qUZZY0WuzGrYYzGh0o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="347474133"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="347474133"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 21:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="855185667"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="855185667"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 21:50:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q8D2N-000Adu-28;
        Sun, 11 Jun 2023 04:50:47 +0000
Date:   Sun, 11 Jun 2023 12:50:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7357b1876b212742a5bec59786d660cfcf66defb
Message-ID: <202306111257.kz0yj7DA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7357b1876b212742a5bec59786d660cfcf66defb  hwmon: (tmp464) Use maple tree register cache

elapsed time: 805m

configs tested: 119
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230610   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230610   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r012-20230610   gcc  
arc                  randconfig-r043-20230610   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r046-20230610   clang
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230610   clang
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230610   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230610   gcc  
hexagon              randconfig-r005-20230610   clang
hexagon              randconfig-r041-20230610   clang
hexagon              randconfig-r045-20230610   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230610   clang
i386                 randconfig-i002-20230610   clang
i386                 randconfig-i003-20230610   clang
i386                 randconfig-i004-20230610   clang
i386                 randconfig-i005-20230610   clang
i386                 randconfig-i006-20230610   clang
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230610   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r023-20230610   gcc  
loongarch            randconfig-r024-20230610   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                 randconfig-r016-20230610   gcc  
m68k                 randconfig-r022-20230610   gcc  
m68k                           sun3_defconfig   gcc  
microblaze           randconfig-r036-20230610   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                 randconfig-r015-20230610   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r001-20230610   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230610   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                  mpc866_ads_defconfig   clang
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv        buildonly-randconfig-r006-20230610   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230610   gcc  
riscv                randconfig-r033-20230610   clang
riscv                randconfig-r035-20230610   clang
riscv                randconfig-r042-20230610   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230610   clang
s390                 randconfig-r044-20230610   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230610   gcc  
sh                        edosk7705_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r032-20230610   gcc  
sparc64              randconfig-r002-20230610   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230610   clang
x86_64               randconfig-a002-20230610   clang
x86_64               randconfig-a003-20230610   clang
x86_64               randconfig-a004-20230610   clang
x86_64               randconfig-a005-20230610   clang
x86_64               randconfig-a006-20230610   clang
x86_64               randconfig-a011-20230610   gcc  
x86_64               randconfig-a012-20230610   gcc  
x86_64               randconfig-a013-20230610   gcc  
x86_64               randconfig-a014-20230610   gcc  
x86_64               randconfig-a015-20230610   gcc  
x86_64               randconfig-a016-20230610   gcc  
x86_64               randconfig-r004-20230610   clang
x86_64               randconfig-r025-20230610   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
