Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94316EB64DC
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jul 2023 13:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjGQNwE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjGQNwD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 09:52:03 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70225A3
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689601921; x=1721137921;
  h=date:from:to:cc:subject:message-id;
  bh=ydxr4Js318Zx4Hs7RCXeIr1UMFuKOS2n6poGJ9McIQM=;
  b=eJh7U1tGZ2HgehhWZywy4Zpefx14rfivaNyrBAjhCLgk2y1xwcByNVDb
   3tfKjwSXdFy1upj7/IFO9e7HPLCgQ6XQf606olM+HAWRrQBaRNt0vEN10
   bmrKIdFri6z3iLkG2EoEr5yUgTXrfjBTQUDlUl56EAiz75zcU1OP2c7li
   fzFZygRTHb2VfUHUbY3392wfwDuQj2iMzkzhE3Rhn5/6qbQ6gV9BN675/
   bow25cQSCZ2W1ymeqmcNNFayk8Ky+wjWvrhE1uohNSi/t11CmtKU7LeUd
   K05sfkr5WwUFtFp7ItnBwOKsGqwA7PWkIHJmG/6v5E4GaCRUeRHUHCvUE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="429694311"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="429694311"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="866740396"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2023 06:51:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLOdq-0009bc-0L;
        Mon, 17 Jul 2023 13:51:58 +0000
Date:   Mon, 17 Jul 2023 21:51:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 8b6e7cf4e1729fd33267e970b5019b50dceb25f9
Message-ID: <202307172121.ORgw5s9B-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8b6e7cf4e1729fd33267e970b5019b50dceb25f9  hwmon: Remove smm665 driver

elapsed time: 726m

configs tested: 140
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230717   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r016-20230717   gcc  
arc                  randconfig-r021-20230717   gcc  
arc                  randconfig-r043-20230717   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                  randconfig-r046-20230717   clang
arm                        realview_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230717   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230717   gcc  
csky                 randconfig-r026-20230717   gcc  
csky                 randconfig-r031-20230717   gcc  
hexagon              randconfig-r005-20230717   clang
hexagon              randconfig-r034-20230717   clang
hexagon              randconfig-r041-20230717   clang
hexagon              randconfig-r045-20230717   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230717   clang
i386         buildonly-randconfig-r005-20230717   clang
i386         buildonly-randconfig-r006-20230717   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230717   clang
i386                 randconfig-i002-20230717   clang
i386                 randconfig-i003-20230717   clang
i386                 randconfig-i004-20230717   clang
i386                 randconfig-i005-20230717   clang
i386                 randconfig-i006-20230717   clang
i386                 randconfig-i011-20230717   gcc  
i386                 randconfig-i012-20230717   gcc  
i386                 randconfig-i013-20230717   gcc  
i386                 randconfig-i014-20230717   gcc  
i386                 randconfig-i015-20230717   gcc  
i386                 randconfig-i016-20230717   gcc  
i386                 randconfig-r004-20230717   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230717   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze           randconfig-r006-20230717   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                        omega2p_defconfig   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r012-20230717   gcc  
openrisc             randconfig-r025-20230717   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230717   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                     kmeter1_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r023-20230717   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230717   gcc  
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230717   clang
s390                 randconfig-r044-20230717   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                   randconfig-r014-20230717   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r035-20230717   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230717   clang
x86_64       buildonly-randconfig-r002-20230717   clang
x86_64       buildonly-randconfig-r003-20230717   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230717   clang
x86_64               randconfig-r011-20230717   gcc  
x86_64               randconfig-x001-20230717   gcc  
x86_64               randconfig-x002-20230717   gcc  
x86_64               randconfig-x003-20230717   gcc  
x86_64               randconfig-x004-20230717   gcc  
x86_64               randconfig-x005-20230717   gcc  
x86_64               randconfig-x006-20230717   gcc  
x86_64               randconfig-x011-20230717   clang
x86_64               randconfig-x012-20230717   clang
x86_64               randconfig-x013-20230717   clang
x86_64               randconfig-x014-20230717   clang
x86_64               randconfig-x015-20230717   clang
x86_64               randconfig-x016-20230717   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
