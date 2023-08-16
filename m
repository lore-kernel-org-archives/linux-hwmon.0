Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C57BC27C42
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Aug 2023 21:52:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbjHPVwX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Aug 2023 17:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346666AbjHPVwJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Aug 2023 17:52:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78B01FD0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Aug 2023 14:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692222727; x=1723758727;
  h=date:from:to:cc:subject:message-id;
  bh=ccTvTxX9o7l1vrfUxoGFm4zHC86cjTRfAlHJRkG+6I4=;
  b=SCcbDFteaS3npnO2luZPWufF2QQ26HvbWD12Cc1PCZrfC4zqeVgCykBo
   B+O449gT2w/VNI4ULfyXjWovFlFt5tm4SgntB/SYmY2RCeT5p+sPZUg7d
   lsWw1pIdvETwK5XOnZhal6MF5EStuPDlmWsNglzaTycPXXhbxxDPzjGaG
   LoeSdjA3Wjl9QmM67fvgSs/Mtkyt2oXe6FfC8kHcITYv6priH98sCM2OD
   qISfh++kxRTTLOez+vJSIddnxrIopqmmK3GyEfIf0tJT7S1hhCAXU3e94
   +yNv6ldbGCalIBALlVDxkuQh0SS0I8hzwD4YNIE7r6xAqWgRhC9H0fgJw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352963756"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="352963756"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 14:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980869995"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="980869995"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2023 14:52:06 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qWOQt-0000b3-39;
        Wed, 16 Aug 2023 21:52:04 +0000
Date:   Thu, 17 Aug 2023 05:51:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 8237b6f08acc2f56c94714f326026122a7b49961
Message-ID: <202308170528.qTN6d4gX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 8237b6f08acc2f56c94714f326026122a7b49961  watchdog: intel-mid_wdt: add MODULE_ALIAS() to allow auto-load

elapsed time: 1454m

configs tested: 212
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230816   gcc  
alpha                randconfig-r022-20230816   gcc  
alpha                randconfig-r025-20230816   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r005-20230816   gcc  
arc                  randconfig-r006-20230816   gcc  
arc                  randconfig-r021-20230816   gcc  
arc                  randconfig-r035-20230817   gcc  
arc                  randconfig-r043-20230817   gcc  
arc                           tb10x_defconfig   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                  randconfig-r036-20230816   clang
arm                           sama5_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230816   gcc  
arm64                randconfig-r026-20230816   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230816   gcc  
csky                 randconfig-r032-20230817   gcc  
csky                 randconfig-r034-20230816   gcc  
csky                 randconfig-r036-20230817   gcc  
hexagon              randconfig-r001-20230817   clang
hexagon              randconfig-r032-20230816   clang
hexagon              randconfig-r033-20230816   clang
hexagon              randconfig-r041-20230816   clang
hexagon              randconfig-r045-20230816   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230816   gcc  
i386         buildonly-randconfig-r004-20230817   clang
i386         buildonly-randconfig-r005-20230816   gcc  
i386         buildonly-randconfig-r005-20230817   clang
i386         buildonly-randconfig-r006-20230816   gcc  
i386         buildonly-randconfig-r006-20230817   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230816   gcc  
i386                 randconfig-i002-20230816   gcc  
i386                 randconfig-i003-20230816   gcc  
i386                 randconfig-i004-20230816   gcc  
i386                 randconfig-i005-20230816   gcc  
i386                 randconfig-i006-20230816   gcc  
i386                 randconfig-i011-20230816   clang
i386                 randconfig-i011-20230817   gcc  
i386                 randconfig-i012-20230816   clang
i386                 randconfig-i012-20230817   gcc  
i386                 randconfig-i013-20230816   clang
i386                 randconfig-i013-20230817   gcc  
i386                 randconfig-i014-20230816   clang
i386                 randconfig-i014-20230817   gcc  
i386                 randconfig-i015-20230816   clang
i386                 randconfig-i015-20230817   gcc  
i386                 randconfig-i016-20230816   clang
i386                 randconfig-i016-20230817   gcc  
i386                 randconfig-r022-20230816   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230816   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r004-20230816   gcc  
m68k                           sun3_defconfig   gcc  
microblaze           randconfig-r001-20230816   gcc  
microblaze           randconfig-r002-20230816   gcc  
microblaze           randconfig-r005-20230816   gcc  
microblaze           randconfig-r011-20230816   gcc  
microblaze           randconfig-r022-20230817   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                  cavium_octeon_defconfig   clang
mips                         cobalt_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                        qi_lb60_defconfig   gcc  
mips                           rs90_defconfig   clang
mips                         rt305x_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230817   gcc  
openrisc             randconfig-r002-20230816   gcc  
openrisc             randconfig-r023-20230816   gcc  
openrisc                 simple_smp_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r001-20230816   gcc  
parisc               randconfig-r003-20230816   gcc  
parisc               randconfig-r024-20230816   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r026-20230817   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230817   clang
riscv                randconfig-r012-20230816   clang
riscv                randconfig-r021-20230817   gcc  
riscv                randconfig-r042-20230816   clang
riscv                randconfig-r042-20230817   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230816   gcc  
s390                 randconfig-r021-20230816   clang
s390                 randconfig-r032-20230816   gcc  
s390                 randconfig-r044-20230816   clang
s390                 randconfig-r044-20230817   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r001-20230816   gcc  
sh                   randconfig-r006-20230816   gcc  
sh                   randconfig-r025-20230816   gcc  
sh                          rsk7203_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230816   gcc  
sparc                randconfig-r021-20230816   gcc  
sparc                randconfig-r023-20230816   gcc  
sparc                randconfig-r026-20230816   gcc  
sparc                randconfig-r036-20230816   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r003-20230816   gcc  
sparc64              randconfig-r004-20230816   gcc  
sparc64              randconfig-r014-20230816   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230816   gcc  
x86_64       buildonly-randconfig-r001-20230817   clang
x86_64       buildonly-randconfig-r002-20230816   gcc  
x86_64       buildonly-randconfig-r002-20230817   clang
x86_64       buildonly-randconfig-r003-20230816   gcc  
x86_64       buildonly-randconfig-r003-20230817   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r006-20230817   clang
x86_64               randconfig-x001-20230816   clang
x86_64               randconfig-x001-20230817   gcc  
x86_64               randconfig-x002-20230816   clang
x86_64               randconfig-x002-20230817   gcc  
x86_64               randconfig-x003-20230816   clang
x86_64               randconfig-x003-20230817   gcc  
x86_64               randconfig-x004-20230816   clang
x86_64               randconfig-x004-20230817   gcc  
x86_64               randconfig-x005-20230816   clang
x86_64               randconfig-x005-20230817   gcc  
x86_64               randconfig-x006-20230816   clang
x86_64               randconfig-x006-20230817   gcc  
x86_64               randconfig-x011-20230816   gcc  
x86_64               randconfig-x012-20230816   gcc  
x86_64               randconfig-x013-20230816   gcc  
x86_64               randconfig-x014-20230816   gcc  
x86_64               randconfig-x015-20230816   gcc  
x86_64               randconfig-x016-20230816   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r006-20230816   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
