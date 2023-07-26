Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B46C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 03:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbjGZDtM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 23:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjGZDtL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 23:49:11 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1132697
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 20:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690343350; x=1721879350;
  h=date:from:to:cc:subject:message-id;
  bh=Ua/m9kMP3+hOti932CMkL5VxKRS+pDPf6tBL7Qnxp0I=;
  b=YedMKHzdujTb13NL3qnCFSeS9M2eOmENhvgHeUSyDvq9tbMglYeWPVFg
   83hCjhyoB0Hh2scn6joKZ9AqQ2r6U7TO52Tq4eD1Bq8r4f6jLoF9zlu/c
   vI4a9FKOZF7SfaJcpfuih+DyLhHSZpHW8umK4RBk/iIkXoszZcjNaF8YX
   c+dqUWv1zeifRB3pfjNMjC5Da7SIHWlamFlj+ByOavs3I/R+x7GYvM+hK
   oTFdAx5pGN+El1vY9b4ANIC99flstWsFfQI914pypoVKboYa5/roTdbZm
   yZKI3d3F3jjzeroEPvA7J4SU3LJWvnwSP3OOeEJktGDxn8c22wZBab7fk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431708508"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="431708508"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 20:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791649476"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="791649476"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 20:49:08 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOVWN-0000bj-1m;
        Wed, 26 Jul 2023 03:49:07 +0000
Date:   Wed, 26 Jul 2023 11:48:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 ad0f768007f4a533ea7abb489be731e2ad296140
Message-ID: <202307261151.9QiROga8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: ad0f768007f4a533ea7abb489be731e2ad296140  hwmon: (hp-wmi-sensors) Initialize pevents in hp_wmi_sensors_init()

elapsed time: 721m

configs tested: 175
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230725   gcc  
alpha                randconfig-r012-20230725   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230725   gcc  
arc                  randconfig-r014-20230725   gcc  
arc                  randconfig-r016-20230725   gcc  
arc                  randconfig-r043-20230725   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230725   gcc  
arm                  randconfig-r003-20230725   gcc  
arm                  randconfig-r021-20230725   clang
arm                  randconfig-r024-20230725   clang
arm                  randconfig-r046-20230725   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230725   clang
arm64                randconfig-r004-20230725   clang
arm64                randconfig-r023-20230725   gcc  
arm64                randconfig-r024-20230725   gcc  
arm64                randconfig-r035-20230725   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230725   gcc  
csky                 randconfig-r016-20230725   gcc  
csky                 randconfig-r023-20230725   gcc  
hexagon              randconfig-r004-20230725   clang
hexagon              randconfig-r005-20230725   clang
hexagon              randconfig-r023-20230725   clang
hexagon              randconfig-r041-20230725   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230725   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r006-20230725   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i016-20230725   gcc  
i386                 randconfig-r001-20230725   clang
i386                 randconfig-r003-20230725   clang
i386                 randconfig-r026-20230725   gcc  
i386                 randconfig-r036-20230725   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230725   gcc  
loongarch            randconfig-r015-20230725   gcc  
loongarch            randconfig-r016-20230725   gcc  
loongarch            randconfig-r021-20230725   gcc  
loongarch            randconfig-r024-20230725   gcc  
loongarch            randconfig-r031-20230725   gcc  
loongarch            randconfig-r032-20230725   gcc  
loongarch            randconfig-r034-20230725   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230725   gcc  
m68k                 randconfig-r021-20230725   gcc  
m68k                 randconfig-r026-20230725   gcc  
m68k                 randconfig-r036-20230725   gcc  
microblaze           randconfig-r002-20230725   gcc  
microblaze           randconfig-r012-20230725   gcc  
microblaze           randconfig-r025-20230725   gcc  
microblaze           randconfig-r033-20230725   gcc  
microblaze           randconfig-r035-20230725   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230725   gcc  
mips                 randconfig-r022-20230725   clang
mips                 randconfig-r033-20230725   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230725   gcc  
nios2                randconfig-r021-20230725   gcc  
nios2                randconfig-r026-20230725   gcc  
openrisc             randconfig-r003-20230725   gcc  
openrisc             randconfig-r031-20230725   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230725   gcc  
parisc               randconfig-r016-20230725   gcc  
parisc               randconfig-r025-20230725   gcc  
parisc               randconfig-r036-20230725   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230725   clang
powerpc              randconfig-r012-20230725   gcc  
powerpc              randconfig-r023-20230725   gcc  
powerpc              randconfig-r032-20230725   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230725   clang
riscv                randconfig-r012-20230725   gcc  
riscv                randconfig-r034-20230725   clang
riscv                randconfig-r042-20230725   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230725   gcc  
s390                 randconfig-r026-20230725   gcc  
s390                 randconfig-r031-20230725   clang
s390                 randconfig-r044-20230725   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r014-20230725   gcc  
sh                   randconfig-r016-20230725   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230725   gcc  
sparc                randconfig-r015-20230725   gcc  
sparc64              randconfig-r005-20230725   gcc  
sparc64              randconfig-r006-20230725   gcc  
sparc64              randconfig-r014-20230725   gcc  
sparc64              randconfig-r022-20230725   gcc  
sparc64              randconfig-r025-20230725   gcc  
sparc64              randconfig-r034-20230725   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230725   gcc  
um                   randconfig-r004-20230725   gcc  
um                   randconfig-r016-20230725   clang
um                   randconfig-r025-20230725   clang
um                   randconfig-r026-20230725   clang
um                   randconfig-r032-20230725   gcc  
um                   randconfig-r034-20230725   gcc  
um                   randconfig-r036-20230725   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r011-20230725   gcc  
x86_64               randconfig-r015-20230725   gcc  
x86_64               randconfig-r024-20230725   gcc  
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x016-20230725   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r013-20230725   gcc  
xtensa               randconfig-r033-20230725   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
