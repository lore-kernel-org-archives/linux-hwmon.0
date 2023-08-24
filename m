Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617F4C6FA8F
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Aug 2023 11:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240367AbjHXL5b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241254AbjHXL5U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Aug 2023 07:57:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FBA198A
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Aug 2023 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692878238; x=1724414238;
  h=date:from:to:cc:subject:message-id;
  bh=pwGwIZ6e3WSfwYIOJEUc9MKszFT1Zoy89a6aiBSNkJ0=;
  b=JnvV7FsY26RoPVOEqBMGsO40kiAxIJ7gdrXaoIUQiWALOD2JuuFfPpL/
   pd9WN9Zy+VkTSMWFED1+Zz1eeg9ShExBWZA34UumKMubvf3K0O4tsAcRn
   uUmZ+WytqNva9WresPiqjm89Ua6Ml4z7uxbcav+DWzBGrb/jZz00rOh9F
   PCe91Uh4EWwc1i3cSKCYY/hsE7UIoSZgJb2pHv92ga/aPQXUIi55tPeVW
   DE1eDG0+CABSQB16um2qAL6yDHcTMXS+2jBIIV31HtARonkZdENpZCI/Y
   m/1GabP6aL4JRz2XibzG/T9AmF/kD4+pzz44EPHO5MEYWK1WeZx1QhyUH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="354747547"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354747547"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 04:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="713944109"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="713944109"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Aug 2023 04:57:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZ8xf-0002Fv-2A;
        Thu, 24 Aug 2023 11:57:15 +0000
Date:   Thu, 24 Aug 2023 19:57:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 9c53fb0ad1acaf227718ccae16e8fb8e01c05918
Message-ID: <202308241905.wZZ4zSFE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 9c53fb0ad1acaf227718ccae16e8fb8e01c05918  hwmon: (asus-ec-sensosrs) fix mutex path for X670E Hero

elapsed time: 3933m

configs tested: 260
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230822   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230822   gcc  
arc                   randconfig-001-20230823   gcc  
arc                  randconfig-r011-20230822   gcc  
arc                  randconfig-r012-20230823   gcc  
arc                  randconfig-r035-20230823   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                        neponset_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20230822   gcc  
arm                  randconfig-r006-20230822   clang
arm                  randconfig-r014-20230822   gcc  
arm                           sama5_defconfig   gcc  
arm                        spear3xx_defconfig   clang
arm                    vt8500_v6_v7_defconfig   clang
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230822   gcc  
arm64                randconfig-r015-20230823   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230822   gcc  
csky                 randconfig-r016-20230822   gcc  
csky                 randconfig-r021-20230822   gcc  
hexagon               randconfig-001-20230822   clang
hexagon               randconfig-002-20230822   clang
hexagon              randconfig-r005-20230823   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230822   gcc  
i386         buildonly-randconfig-001-20230823   clang
i386         buildonly-randconfig-002-20230822   gcc  
i386         buildonly-randconfig-002-20230823   clang
i386         buildonly-randconfig-003-20230822   gcc  
i386         buildonly-randconfig-003-20230823   clang
i386         buildonly-randconfig-004-20230822   gcc  
i386         buildonly-randconfig-004-20230823   clang
i386         buildonly-randconfig-005-20230822   gcc  
i386         buildonly-randconfig-005-20230823   clang
i386         buildonly-randconfig-006-20230822   gcc  
i386         buildonly-randconfig-006-20230823   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230823   clang
i386                  randconfig-002-20230823   clang
i386                  randconfig-003-20230823   clang
i386                  randconfig-004-20230823   clang
i386                  randconfig-005-20230823   clang
i386                  randconfig-006-20230823   clang
i386                  randconfig-011-20230822   clang
i386                  randconfig-011-20230823   gcc  
i386                  randconfig-012-20230822   clang
i386                  randconfig-012-20230823   gcc  
i386                  randconfig-013-20230822   clang
i386                  randconfig-013-20230823   gcc  
i386                  randconfig-014-20230822   clang
i386                  randconfig-014-20230823   gcc  
i386                  randconfig-015-20230822   clang
i386                  randconfig-015-20230823   gcc  
i386                  randconfig-016-20230822   clang
i386                  randconfig-016-20230823   gcc  
i386                 randconfig-r022-20230823   gcc  
i386                 randconfig-r032-20230822   gcc  
i386                 randconfig-r035-20230822   gcc  
i386                 randconfig-r036-20230822   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230822   gcc  
loongarch             randconfig-001-20230823   gcc  
loongarch            randconfig-r002-20230822   gcc  
loongarch            randconfig-r013-20230822   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r014-20230822   gcc  
m68k                 randconfig-r023-20230822   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r014-20230823   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                 decstation_r4k_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip22_defconfig   clang
mips                        omega2p_defconfig   clang
mips                 randconfig-r002-20230822   clang
mips                 randconfig-r004-20230822   clang
mips                 randconfig-r026-20230822   gcc  
mips                 randconfig-r033-20230823   gcc  
mips                           rs90_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230822   gcc  
nios2                randconfig-r016-20230823   gcc  
nios2                randconfig-r034-20230822   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r015-20230822   gcc  
openrisc             randconfig-r023-20230823   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230823   gcc  
parisc               randconfig-r015-20230822   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                   motionpro_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r031-20230822   gcc  
powerpc                      walnut_defconfig   clang
powerpc64                        alldefconfig   gcc  
powerpc64                           defconfig   gcc  
powerpc64            randconfig-r012-20230822   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230822   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230822   clang
s390                  randconfig-001-20230823   gcc  
s390                 randconfig-r003-20230822   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r013-20230822   gcc  
sh                   randconfig-r025-20230822   gcc  
sh                   randconfig-r026-20230823   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230822   gcc  
sparc                randconfig-r025-20230823   gcc  
sparc                randconfig-r031-20230823   gcc  
sparc                randconfig-r034-20230823   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r006-20230822   gcc  
sparc64              randconfig-r024-20230823   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230822   gcc  
x86_64       buildonly-randconfig-001-20230823   clang
x86_64       buildonly-randconfig-002-20230822   gcc  
x86_64       buildonly-randconfig-002-20230823   clang
x86_64       buildonly-randconfig-003-20230822   gcc  
x86_64       buildonly-randconfig-003-20230823   clang
x86_64       buildonly-randconfig-004-20230822   gcc  
x86_64       buildonly-randconfig-004-20230823   clang
x86_64       buildonly-randconfig-005-20230822   gcc  
x86_64       buildonly-randconfig-005-20230823   clang
x86_64       buildonly-randconfig-006-20230822   gcc  
x86_64       buildonly-randconfig-006-20230823   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230822   clang
x86_64                randconfig-001-20230823   gcc  
x86_64                randconfig-002-20230822   clang
x86_64                randconfig-002-20230823   gcc  
x86_64                randconfig-003-20230822   clang
x86_64                randconfig-003-20230823   gcc  
x86_64                randconfig-004-20230822   clang
x86_64                randconfig-004-20230823   gcc  
x86_64                randconfig-005-20230822   clang
x86_64                randconfig-005-20230823   gcc  
x86_64                randconfig-006-20230822   clang
x86_64                randconfig-006-20230823   gcc  
x86_64                randconfig-011-20230823   clang
x86_64                randconfig-012-20230823   clang
x86_64                randconfig-013-20230823   clang
x86_64                randconfig-014-20230823   clang
x86_64                randconfig-015-20230823   clang
x86_64                randconfig-016-20230822   gcc  
x86_64                randconfig-016-20230823   clang
x86_64                randconfig-071-20230823   clang
x86_64                randconfig-072-20230823   clang
x86_64                randconfig-073-20230823   clang
x86_64                randconfig-074-20230823   clang
x86_64                randconfig-075-20230823   clang
x86_64                randconfig-076-20230822   gcc  
x86_64                randconfig-076-20230823   clang
x86_64               randconfig-r001-20230823   clang
x86_64               randconfig-r003-20230823   clang
x86_64               randconfig-r033-20230822   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r022-20230822   gcc  
xtensa               randconfig-r032-20230823   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
