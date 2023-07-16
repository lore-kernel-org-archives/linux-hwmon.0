Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E22C001DC
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jul 2023 08:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjGPIzZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jul 2023 04:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGPIzY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 04:55:24 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE46115
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jul 2023 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689497724; x=1721033724;
  h=date:from:to:cc:subject:message-id;
  bh=zywiKHOYrkMeNVPE1R5/Ph66o4g21MBPXnNEksq/6g0=;
  b=Ivb2DgoCww2nyZz6pm68hSnW4AEOURB+mLnc0GLa3H2MDKE3Ip2pcn3d
   2gDxHuWY1IV6k3edKy6omYubBBv7xPhkrhyoVAYw+8jIKQw3kVtIXcVee
   PAnJThVhNPC6zt4Zp4RCrh8p5nRiZ7KbqFFk8mPyWc2pCffSOZJdZ7aRe
   RTnC1efgwKXsyASaocMXQ5LStbufZ9fWKiP+aqaFW3E/SvOCi8d8ETKSx
   DHd8iZJvJvia4fLwZitOAVncshQ+q/8jH3lmZ7rGrhYoQbTccKbioNkqe
   mi37lbxqTYlEUX4t8SK7fjKmQU8ByooV8Bp6YG4G5dyA5OsqeMNWASw6/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="363203953"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="363203953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 01:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="722868868"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="722868868"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jul 2023 01:55:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qKxXE-0008kx-2x;
        Sun, 16 Jul 2023 08:55:20 +0000
Date:   Sun, 16 Jul 2023 16:54:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 96e4fb748d758f01e136932028f06cbf8d8a0a50
Message-ID: <202307161644.fgDY6k8f-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 96e4fb748d758f01e136932028f06cbf8d8a0a50  hwmon: (nct6775) Change labels for nct6799

elapsed time: 721m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230716   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230716   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                          ixp4xx_defconfig   clang
arm                  randconfig-r004-20230716   clang
arm                  randconfig-r022-20230716   gcc  
arm                  randconfig-r023-20230716   gcc  
arm                  randconfig-r033-20230716   clang
arm                  randconfig-r034-20230716   clang
arm                  randconfig-r046-20230716   gcc  
arm                         s3c6400_defconfig   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230716   clang
arm64                randconfig-r036-20230716   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230716   gcc  
csky                 randconfig-r031-20230716   gcc  
hexagon              randconfig-r002-20230716   clang
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
i386                 randconfig-r001-20230716   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                 randconfig-r026-20230716   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                           mtx1_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r014-20230716   gcc  
mips                 randconfig-r024-20230716   gcc  
mips                 randconfig-r025-20230716   gcc  
mips                 randconfig-r032-20230716   clang
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r005-20230716   gcc  
riscv                randconfig-r006-20230716   gcc  
riscv                randconfig-r016-20230716   clang
riscv                randconfig-r042-20230716   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r035-20230716   gcc  
s390                 randconfig-r044-20230716   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r013-20230716   gcc  
sh                   randconfig-r021-20230716   gcc  
sh                           se7724_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          alldefconfig   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r015-20230716   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230716   gcc  
x86_64       buildonly-randconfig-r002-20230716   gcc  
x86_64       buildonly-randconfig-r003-20230716   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
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
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
