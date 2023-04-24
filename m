Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC70C7618E
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Apr 2023 03:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjDXDiu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Apr 2023 23:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjDXDin (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Apr 2023 23:38:43 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95D6271F
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Apr 2023 20:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682307521; x=1713843521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D4sttiWcFzZtOg7ZwoOEf3Yac5YSqS6PDywLZRVoOok=;
  b=McvtJQ4Ink/heMdLp6fAn3EvqR0dIu5IOk1OSWZP9ZkCWzPdTaNJURzf
   nM1YD7zwbwFY+OhQ4NqaO6ig3ZkbB+7+Ao+Xgpde2yt0NUPYxKYPBv+xh
   U/FH0whpkEvPibKGhBuB1IPobIXvzYtiVn2paGeUycn9d72yRQ5H2ROEm
   aqQMTHLxqXhi+5XW+AsVSLWM+tfcABL6gLhZWe9WNHzGU/BSdVYds3Icm
   lTsPd8zuzjdbGZGw9txvVXwCPd/jlDRpK8ME0UBC5Cnld9I7wFTlLDZGw
   1xKoDTeiXYsxQ/3fXiXbcChKrBMpLBb9/8Sjw1H9pVjAscV/k1SUiqC0j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="348263029"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="348263029"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 20:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="692920017"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="692920017"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Apr 2023 20:38:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pqn2F-000iFz-1A;
        Mon, 24 Apr 2023 03:38:39 +0000
Date:   Mon, 24 Apr 2023 11:38:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 1c19ac768b8eeb0304c4ed7db66c2bb89c6ad226
Message-ID: <6445f9b9.03qLWghoqDS+Vj2A%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 1c19ac768b8eeb0304c4ed7db66c2bb89c6ad226  hwmon: lochnagar: Remove the unneeded include <linux/i2c.h>

elapsed time: 722m

configs tested: 107
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230423   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230423   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230423   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                  randconfig-r023-20230423   gcc  
arm                  randconfig-r032-20230423   clang
arm                  randconfig-r046-20230423   gcc  
arm                        realview_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230423   clang
csky                                defconfig   gcc  
csky                 randconfig-r033-20230423   gcc  
hexagon      buildonly-randconfig-r002-20230423   clang
hexagon      buildonly-randconfig-r006-20230423   clang
hexagon              randconfig-r003-20230423   clang
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r045-20230423   clang
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
ia64                 randconfig-r005-20230423   gcc  
ia64                 randconfig-r014-20230423   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230423   gcc  
microblaze           randconfig-r011-20230423   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230423   clang
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230423   gcc  
nios2                randconfig-r031-20230423   gcc  
openrisc     buildonly-randconfig-r004-20230423   gcc  
openrisc             randconfig-r001-20230423   gcc  
openrisc             randconfig-r006-20230423   gcc  
openrisc             randconfig-r021-20230423   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230423   clang
powerpc                      chrp32_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r024-20230423   clang
riscv                randconfig-r042-20230423   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230423   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230423   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r013-20230423   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230423   gcc  
xtensa               randconfig-r025-20230423   gcc  
xtensa               randconfig-r034-20230423   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
