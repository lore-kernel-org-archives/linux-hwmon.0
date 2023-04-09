Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F8C77B61
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Apr 2023 11:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjDILYd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 9 Apr 2023 07:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDILYc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 9 Apr 2023 07:24:32 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE113C3D
        for <linux-hwmon@vger.kernel.org>; Sun,  9 Apr 2023 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681039471; x=1712575471;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CCPtEGwLd68szxbXv/quIs1cfewe5JHe22biZmEzR68=;
  b=jYtJ72YR9a0XCTwiK1uEFthN2LdzvApl9c+hmrGCL3FEBS+m1jgUiLwl
   VZtKvVfmhbUA3hScTFgI9TvHQasHFEzIbSME9B/zLQ4VG+FLzhMgxujFJ
   zTrX3csktUhUEZFnTsNVOQq35wj4cpFmbzWw23VDTHQAdmUkqbTVGxmZX
   zHsND8t4YGNuZcbZppdAyk7uGIj26ulFuRnK+X2I1seEC8Vwe7YCynLD0
   LIbAe9cgQIEdFJ0YnYerahRVISXCCKSZWTvxrkAQpyXoEgllOyOS8aFJp
   kjtuFiDQG+Q8eycvfPDGPqz1nMqDToZU8IqW/YBGWIJDoo1Vd0VwhoKyL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="406039767"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="406039767"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 04:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="690496898"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="690496898"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2023 04:24:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1plT9o-000UUl-25;
        Sun, 09 Apr 2023 11:24:28 +0000
Date:   Sun, 09 Apr 2023 19:23:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 05526b7e8d86b0dd2f408b92c08b5c5ec65c9ac9
Message-ID: <6432a043.xF93VdM4S1KcCDiw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 05526b7e8d86b0dd2f408b92c08b5c5ec65c9ac9  dt-bindings: watchdog: rockchip: Add rockchip,rk3588-wdt string

elapsed time: 809m

configs tested: 104
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230409   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230409   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230409   gcc  
arc                  randconfig-r043-20230409   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r035-20230409   gcc  
arm                  randconfig-r046-20230409   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230409   clang
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230409   clang
arm64                randconfig-r026-20230409   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r021-20230409   gcc  
hexagon              randconfig-r015-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r045-20230409   clang
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
ia64                 randconfig-r011-20230409   gcc  
ia64                 randconfig-r033-20230409   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230409   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r031-20230409   gcc  
m68k                 randconfig-r032-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                      maltaaprp_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230409   gcc  
openrisc     buildonly-randconfig-r006-20230409   gcc  
openrisc             randconfig-r013-20230409   gcc  
openrisc             randconfig-r016-20230409   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r024-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r025-20230409   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230409   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230409   clang
s390                 randconfig-r044-20230409   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230409   gcc  
sh                   randconfig-r023-20230409   gcc  
sh                   randconfig-r034-20230409   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r001-20230409   gcc  
sparc64              randconfig-r003-20230409   gcc  
sparc64              randconfig-r012-20230409   gcc  
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
xtensa               randconfig-r036-20230409   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
