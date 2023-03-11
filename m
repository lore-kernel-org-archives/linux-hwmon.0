Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB537C678D5
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Mar 2023 06:03:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjCKGDr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Mar 2023 01:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCKGDq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Mar 2023 01:03:46 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FE612B7FA
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Mar 2023 22:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678514625; x=1710050625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IfbwkYEQbnFYMk6FBckGk19lVAub+k6oUX6goOVOL6A=;
  b=G9XL4Gy9/kfDxt3JjS5GDSucrDWW/KSpvk6F7AJD+HVgu9T40uXKEhEz
   pXH2dGv08Xgm6QXVjnh1pwdiO1tVisvwPLWZCrkP/+rxDWf2ez9abE86k
   UsdhCrPno+br5nQDr8KnjYHUfKJ538EQMS9iG3yhkwFQoSIU4dcc3MMQd
   4w4ZDIrkJnXnpaDSq6q7dmzBkVcUzfGvRZDi/OJohpWrsrgGwQbg/dwTj
   Grcv0ui4WpFGM+04LcWb/hEwr5Fd+cajT7wyKmVGX6kUNE/phCtb6Jwj3
   wlVdBQ82XHzGyvncoqgon5LN51bJR+HQt9RKvpp0PRnQBSqnZBZxc6aOX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338437671"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338437671"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="801863817"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="801863817"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Mar 2023 22:03:42 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pasKU-0004Nz-0I;
        Sat, 11 Mar 2023 06:03:42 +0000
Date:   Sat, 11 Mar 2023 14:03:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 6519783ed0ff9b7cedf10a6185a3c28a4c64b6bd
Message-ID: <640c199a.aBJ4cKQPySsatsej%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 6519783ed0ff9b7cedf10a6185a3c28a4c64b6bd  hwmon: (ina3221) return prober error code

elapsed time: 724m

configs tested: 98
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230310   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230310   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230310   gcc  
arc                  randconfig-r006-20230310   gcc  
arc                  randconfig-r032-20230310   gcc  
arc                  randconfig-r043-20230310   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230310   clang
arm                                 defconfig   gcc  
arm                  randconfig-r036-20230310   gcc  
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230310   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r024-20230310   clang
hexagon              randconfig-r041-20230310   clang
hexagon              randconfig-r045-20230310   clang
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
ia64                 randconfig-r022-20230310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230310   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r004-20230310   gcc  
microblaze           randconfig-r035-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230310   gcc  
nios2                randconfig-r021-20230310   gcc  
openrisc     buildonly-randconfig-r004-20230310   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r011-20230310   gcc  
powerpc              randconfig-r033-20230310   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r026-20230310   gcc  
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230310   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230310   clang
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230310   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r012-20230310   gcc  
sparc64              randconfig-r031-20230310   gcc  
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
