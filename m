Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60ECC7EE22
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 May 2023 16:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjEEQe0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 May 2023 12:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjEEQeZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 May 2023 12:34:25 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C8BA255
        for <linux-hwmon@vger.kernel.org>; Fri,  5 May 2023 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683304464; x=1714840464;
  h=date:from:to:cc:subject:message-id;
  bh=414yJsY31XNVKSIN5L9HlvSxtA2ZtYkA9AFyZMxBOlY=;
  b=hAW47ZNszyIl3IelKquO6docYgrqj8dFZFNwtnrVv4blN5UIv6EKWbAi
   rJ7aYcsgOnN0cqk2GCHcMJCNEoNFxMu+/5OUxYNqiX0TLX0YQelYswfbc
   whw5pOWL7N4aLubOcPlrN0IQhYYCEBLmKldy68R0yandUPdtT2A4nQPpG
   7p8n6UpEXtuxQflR5+9yqXXq224exs0ujoCObhG8aHcB4oo1bswkrIAEb
   mee2q4JwQzF+q38DfHCoNz++gf708trpSFycRvY9VF9E93DCwepqdpEVf
   Ru5ufp7Me4feHwi7rVljDO1WAlM+5YF+ZiaWBUH+HmFiYyuBo4adE3AoO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="348069897"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="348069897"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 09:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="809316629"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="809316629"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 May 2023 09:34:22 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1puyNy-0000kK-0F;
        Fri, 05 May 2023 16:34:22 +0000
Date:   Sat, 06 May 2023 00:33:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 d668ce20559e8834009f5f1e202159fd9ed41365
Message-ID: <20230505163345.251aZ%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: d668ce20559e8834009f5f1e202159fd9ed41365  watchdog: rzg2l_wdt: Fix reboot for RZ/V2M

elapsed time: 824m

configs tested: 180
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230501   gcc  
alpha                randconfig-r021-20230430   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r006-20230501   gcc  
arc                  randconfig-r011-20230505   gcc  
arc                  randconfig-r016-20230502   gcc  
arc                  randconfig-r016-20230505   gcc  
arc                  randconfig-r023-20230430   gcc  
arc                  randconfig-r023-20230501   gcc  
arc                  randconfig-r025-20230502   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230502   gcc  
arc                  randconfig-r043-20230504   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230501   gcc  
arm          buildonly-randconfig-r002-20230504   clang
arm          buildonly-randconfig-r005-20230501   gcc  
arm          buildonly-randconfig-r006-20230430   gcc  
arm          buildonly-randconfig-r006-20230501   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                  randconfig-r003-20230430   clang
arm                  randconfig-r026-20230501   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230502   clang
arm                  randconfig-r046-20230504   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230504   clang
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230502   clang
arm64                randconfig-r006-20230430   gcc  
arm64                randconfig-r013-20230502   gcc  
arm64                randconfig-r022-20230502   gcc  
csky         buildonly-randconfig-r006-20230502   gcc  
csky         buildonly-randconfig-r006-20230504   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230430   gcc  
csky                 randconfig-r012-20230502   gcc  
csky                 randconfig-r022-20230430   gcc  
hexagon              randconfig-r025-20230430   clang
hexagon              randconfig-r025-20230501   clang
hexagon              randconfig-r036-20230502   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r041-20230502   clang
hexagon              randconfig-r041-20230504   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
hexagon              randconfig-r045-20230502   clang
hexagon              randconfig-r045-20230504   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230501   gcc  
i386                 randconfig-a002-20230501   gcc  
i386                 randconfig-a003-20230501   gcc  
i386                 randconfig-a004-20230501   gcc  
i386                 randconfig-a005-20230501   gcc  
i386                 randconfig-a006-20230501   gcc  
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
i386                 randconfig-r024-20230501   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230430   gcc  
loongarch    buildonly-randconfig-r004-20230430   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230502   gcc  
loongarch            randconfig-r005-20230430   gcc  
loongarch            randconfig-r026-20230502   gcc  
loongarch            randconfig-r033-20230502   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230502   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r001-20230501   gcc  
microblaze           randconfig-r002-20230430   gcc  
microblaze           randconfig-r012-20230505   gcc  
microblaze           randconfig-r013-20230505   gcc  
microblaze           randconfig-r023-20230502   gcc  
microblaze           randconfig-r031-20230502   gcc  
microblaze           randconfig-r032-20230502   gcc  
microblaze           randconfig-r035-20230502   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   clang
mips                          malta_defconfig   clang
mips                      pic32mzda_defconfig   clang
mips                 randconfig-r014-20230502   clang
mips                 randconfig-r014-20230505   gcc  
nios2        buildonly-randconfig-r003-20230502   gcc  
nios2        buildonly-randconfig-r004-20230502   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230502   gcc  
openrisc             randconfig-r004-20230501   gcc  
openrisc             randconfig-r015-20230502   gcc  
openrisc             randconfig-r021-20230502   gcc  
openrisc             randconfig-r024-20230430   gcc  
openrisc             randconfig-r034-20230502   gcc  
parisc       buildonly-randconfig-r002-20230501   gcc  
parisc       buildonly-randconfig-r002-20230502   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc      buildonly-randconfig-r004-20230501   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230502   gcc  
riscv                randconfig-r042-20230504   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230501   clang
s390         buildonly-randconfig-r005-20230430   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230502   gcc  
s390                 randconfig-r044-20230504   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230504   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                   randconfig-r004-20230502   gcc  
sh                   randconfig-r011-20230502   gcc  
sh                   randconfig-r022-20230501   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc        buildonly-randconfig-r005-20230502   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230501   gcc  
sparc                randconfig-r021-20230501   gcc  
sparc                randconfig-r026-20230430   gcc  
sparc64              randconfig-r024-20230502   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230501   gcc  
x86_64               randconfig-a002-20230501   gcc  
x86_64               randconfig-a003-20230501   gcc  
x86_64               randconfig-a004-20230501   gcc  
x86_64               randconfig-a005-20230501   gcc  
x86_64               randconfig-a006-20230501   gcc  
x86_64               randconfig-a011-20230501   clang
x86_64               randconfig-a012-20230501   clang
x86_64               randconfig-a013-20230501   clang
x86_64               randconfig-a014-20230501   clang
x86_64               randconfig-a015-20230501   clang
x86_64               randconfig-a016-20230501   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230502   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
