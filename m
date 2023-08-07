Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F81C0015E
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Aug 2023 03:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjHGDCL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Aug 2023 23:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjHGDCK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Aug 2023 23:02:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D9BBA
        for <linux-hwmon@vger.kernel.org>; Sun,  6 Aug 2023 20:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691377329; x=1722913329;
  h=date:from:to:cc:subject:message-id;
  bh=lH/+wkSnT5h2HZYGb2/SMYCGQcfjuNgBncq/IQvFYbw=;
  b=OUFVICVtbzU8e+aQTxD1BfYS43g/yClocuvwxnVf3iOAVMzv0TKYeFOj
   MQR/fyiH4wGJnzonlALY7HQ/niiBiNfl4kG9V07eipymAoWMnwwIOSAVi
   TOWQqCq5YTwdsqz32FpXB4V0d8sh/0ise+EOhuC6DTF1M7UD3Zkn40+O2
   BC2HvCvBzLNFlaaoO+YebnZDVw823IgmgYag9fSNs1pNZnce02/qV22sa
   fk0JTjUJe88XDvUaXjonw1KneD0drtDMiVs4Kj08n3MMITYcaF83UhURx
   urqRp34HYBkR4qOCJFymfQqIXKqi+kb6TMKyxSgOWN6NjYL9rib4mvVMh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="374112785"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="374112785"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 20:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="854492593"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="854492593"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Aug 2023 20:02:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qSqVT-0004VJ-09;
        Mon, 07 Aug 2023 03:02:07 +0000
Date:   Mon, 07 Aug 2023 11:01:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 a0edb77a9ff261c45af3ace76c58b7a78b4bb44f
Message-ID: <202308071114.ocpJL5N5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: a0edb77a9ff261c45af3ace76c58b7a78b4bb44f  dt-bindings: watchdog: Add Loongson-1 watchdog

elapsed time: 721m

configs tested: 106
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230806   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230806   gcc  
arc                  randconfig-r016-20230806   gcc  
arc                  randconfig-r043-20230806   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230806   gcc  
arm                  randconfig-r046-20230806   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230806   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r022-20230806   clang
hexagon              randconfig-r041-20230806   clang
hexagon              randconfig-r045-20230806   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230806   clang
i386         buildonly-randconfig-r005-20230806   clang
i386         buildonly-randconfig-r006-20230806   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230806   clang
i386                 randconfig-i002-20230806   clang
i386                 randconfig-i003-20230806   clang
i386                 randconfig-i004-20230806   clang
i386                 randconfig-i005-20230806   clang
i386                 randconfig-i006-20230806   clang
i386                 randconfig-i011-20230806   gcc  
i386                 randconfig-i012-20230806   gcc  
i386                 randconfig-i013-20230806   gcc  
i386                 randconfig-i014-20230806   gcc  
i386                 randconfig-i015-20230806   gcc  
i386                 randconfig-i016-20230806   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230806   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230806   gcc  
m68k                 randconfig-r013-20230806   gcc  
microblaze           randconfig-r005-20230806   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230806   gcc  
openrisc             randconfig-r021-20230806   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r011-20230806   gcc  
powerpc              randconfig-r034-20230806   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230806   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230806   clang
s390                 randconfig-r004-20230806   clang
s390                 randconfig-r044-20230806   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230806   gcc  
sparc                randconfig-r036-20230806   gcc  
sparc64              randconfig-r023-20230806   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r025-20230806   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230806   clang
x86_64       buildonly-randconfig-r002-20230806   clang
x86_64       buildonly-randconfig-r003-20230806   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r031-20230806   clang
x86_64               randconfig-x001-20230806   gcc  
x86_64               randconfig-x002-20230806   gcc  
x86_64               randconfig-x003-20230806   gcc  
x86_64               randconfig-x004-20230806   gcc  
x86_64               randconfig-x005-20230806   gcc  
x86_64               randconfig-x006-20230806   gcc  
x86_64               randconfig-x011-20230806   clang
x86_64               randconfig-x012-20230806   clang
x86_64               randconfig-x013-20230806   clang
x86_64               randconfig-x014-20230806   clang
x86_64               randconfig-x015-20230806   clang
x86_64               randconfig-x016-20230806   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
