Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90151EB64DA
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jul 2023 08:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjGPIzZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jul 2023 04:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGPIzY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 04:55:24 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD62D1
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jul 2023 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689497723; x=1721033723;
  h=date:from:to:cc:subject:message-id;
  bh=ZauFBNAdjmZCdLHHI4A4z7rs95ceF8rpmSSGRQjyOAs=;
  b=nzHT+3dyvsDe+SE2huZyx4bCJkeviYh4ObF2qHQw6Qya/cjEoq+8IalR
   bMBCxh0MQ3aLIDem0sX+jKczKnN1mDdNiuDAuFAAvzkphoAjJm5zueyX/
   XbBsxu0unuKCkbAYgdV1YzfBQVIJEA+sxWtrFTndOlUVaYdys+e5XLSIf
   So2H0spAbY2afMUoV5QYRml6awHHrXTS9eNpJxwl102RHh4O2kFDdylbN
   /rjkIatin8MAzwjnZY4p9BZ7Gn4DFhVsHY9vM12tfrDnbsHqWwdsGtJ/X
   gHwRuW1Oao79Zbc6fqO/F4PWGF1oicbV1hfuT7xmF4iyQDJxNDy2Mb8TC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="355676851"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="355676851"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 01:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="1053550923"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="1053550923"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2023 01:55:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qKxXE-0008kr-2p;
        Sun, 16 Jul 2023 08:55:20 +0000
Date:   Sun, 16 Jul 2023 16:54:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 a746b3689546da27125da9ccaea62b1dbaaf927c
Message-ID: <202307161651.Q8ma8Blr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: a746b3689546da27125da9ccaea62b1dbaaf927c  hwmon: (aquacomputer_d5next) Fix incorrect PWM value readout

elapsed time: 721m

configs tested: 128
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230716   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                  randconfig-r002-20230716   clang
arm                  randconfig-r026-20230716   gcc  
arm                  randconfig-r046-20230716   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230716   clang
arm64                randconfig-r025-20230716   clang
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230716   clang
hexagon              randconfig-r045-20230716   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230716   gcc  
i386         buildonly-randconfig-r005-20230716   gcc  
i386         buildonly-randconfig-r006-20230716   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230716   gcc  
i386                 randconfig-i002-20230716   gcc  
i386                 randconfig-i003-20230716   gcc  
i386                 randconfig-i004-20230716   gcc  
i386                 randconfig-i005-20230716   gcc  
i386                 randconfig-i006-20230716   gcc  
i386                 randconfig-i011-20230716   clang
i386                 randconfig-i012-20230716   clang
i386                 randconfig-i013-20230716   clang
i386                 randconfig-i014-20230716   clang
i386                 randconfig-i015-20230716   clang
i386                 randconfig-i016-20230716   clang
i386                 randconfig-r021-20230716   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230716   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                 randconfig-r036-20230716   gcc  
microblaze           randconfig-r033-20230716   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                 randconfig-r035-20230716   clang
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230716   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                     ppa8548_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r006-20230716   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r003-20230716   gcc  
riscv                randconfig-r031-20230716   gcc  
riscv                randconfig-r042-20230716   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230716   clang
s390                 randconfig-r032-20230716   gcc  
s390                 randconfig-r044-20230716   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230716   gcc  
sh                   randconfig-r013-20230716   gcc  
sh                   randconfig-r034-20230716   gcc  
sh                          sdk7786_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230716   gcc  
sparc64                          alldefconfig   gcc  
sparc64              randconfig-r011-20230716   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r014-20230716   gcc  
um                   randconfig-r016-20230716   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230716   gcc  
x86_64       buildonly-randconfig-r002-20230716   gcc  
x86_64       buildonly-randconfig-r003-20230716   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r001-20230716   gcc  
x86_64               randconfig-x001-20230716   clang
x86_64               randconfig-x002-20230716   clang
x86_64               randconfig-x003-20230716   clang
x86_64               randconfig-x004-20230716   clang
x86_64               randconfig-x005-20230716   clang
x86_64               randconfig-x006-20230716   clang
x86_64               randconfig-x011-20230716   gcc  
x86_64               randconfig-x012-20230716   gcc  
x86_64               randconfig-x013-20230716   gcc  
x86_64               randconfig-x014-20230716   gcc  
x86_64               randconfig-x015-20230716   gcc  
x86_64               randconfig-x016-20230716   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
