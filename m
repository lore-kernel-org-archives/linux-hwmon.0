Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8605C77B7F
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 May 2023 04:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjETEBh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 20 May 2023 00:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjETEBf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 20 May 2023 00:01:35 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B0B1B4
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 21:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684555294; x=1716091294;
  h=date:from:to:cc:subject:message-id;
  bh=+i+3ZugWJlELZm0D33/vx9l92Gksug7H4uC8TIkgTsk=;
  b=Pfnqd+sancg5xwi6kLEdX2vtgbm73vKA1i6bwayVBFkuE+riyoYmuO5m
   /BXkjDEG+pil0xQHoCvqdSO9/9qdYgzSd0f9hE24K81X5EikGbIcNDBam
   AynelAoLWNR+CSqIxcPhsM5FIqoDLefOTRwNb8rC/AWqPGV2PSwHOXy4z
   L9dsDWDHqYjZZ7HJciVeBdE8LYeMVtUYa6Pi6mlLdfHbZgczONTu8/yhl
   zY9D/V6q0DuBSKf8G7YwakzjA2CKdRfWPXnKdP2qMO/AP3alX34LTR0LL
   bVegTVkl8uQtBnJk5Sxy5tUhrwxbmxQqWPRi19lSX1ptcL2xpyXeZmd6l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="416007117"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; 
   d="scan'208";a="416007117"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 21:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="702782789"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; 
   d="scan'208";a="702782789"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2023 21:01:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q0Dme-000BIg-1I;
        Sat, 20 May 2023 04:01:32 +0000
Date:   Sat, 20 May 2023 12:01:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 d7c7e647a7dd1b9ef43fdd893d2180db4c0d3c7e
Message-ID: <20230520040116.PmlyD%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230519164737/lkp-src/repo/*/groeck-staging
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: d7c7e647a7dd1b9ef43fdd893d2180db4c0d3c7e  hwmon: (aht10) Refactor aht10_read_values function

elapsed time: 735m

configs tested: 115
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230517   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230517   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230517   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230517   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230517   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230517   gcc  
arm64                randconfig-r036-20230517   clang
csky         buildonly-randconfig-r004-20230517   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230517   gcc  
hexagon              randconfig-r022-20230517   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230517   clang
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
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230517   gcc  
m68k                 randconfig-r023-20230517   gcc  
microblaze   buildonly-randconfig-r002-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230517   clang
mips                 randconfig-r033-20230517   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230517   gcc  
openrisc             randconfig-r026-20230517   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230517   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r034-20230517   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230517   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230517   clang
riscv                randconfig-r005-20230517   clang
riscv                randconfig-r032-20230517   clang
riscv                randconfig-r035-20230517   clang
riscv                randconfig-r042-20230517   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230517   clang
s390                 randconfig-r044-20230517   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230517   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230517   gcc  
sparc                randconfig-r024-20230517   gcc  
sparc64              randconfig-r012-20230517   gcc  
sparc64              randconfig-r031-20230517   gcc  
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
x86_64                        randconfig-x051   gcc  
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x053   gcc  
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x055   gcc  
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230517   gcc  
xtensa               randconfig-r021-20230517   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
