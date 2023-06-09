Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA211C7EE25
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jun 2023 02:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjFICUN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jun 2023 22:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjFICUK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Jun 2023 22:20:10 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BF7269A
        for <linux-hwmon@vger.kernel.org>; Thu,  8 Jun 2023 19:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686277209; x=1717813209;
  h=date:from:to:cc:subject:message-id;
  bh=s+P1oeutDjpUqU5t7LOe0dCttwNxeo2ktPPCdgsGjac=;
  b=FU5YDnH56klnjxUJTELaMcSe9xY9PRQs8+6ednp/JD2A5nyQmfmoxLrv
   RCTTGcbLNiAgs0iNpEwhMPG8gbDchf7llUQ0q3V7mhZT1jvRi/sJb4SeW
   fKVA/F4K30e3jLlcLDz8WGS7oxFn82sCd2ROqEGby45HZTFu7gcNuVdxZ
   4CtHiZXn7gV/vdq6B5IGQEgesv8pvvso8RlT8nGbxEFnBtN+cgx5cHc5v
   LOB/gUZo8ZGTdNooRB3w75mn4krqnoQ/twNwjcB4JQ8nJQx/dnf/BEvpn
   sS+OqwU65YPfnFbzsyEcPSsfkvUvkGBKLOi7PJeSyK9DYPnq2gWuGfU/A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359977705"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="359977705"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713337584"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713337584"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 19:20:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q7RjR-0008Vn-1Q;
        Fri, 09 Jun 2023 02:20:05 +0000
Date:   Fri, 09 Jun 2023 10:19:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 b153a0bb4199566abd337119207f82b59a8cd1ca
Message-ID: <202306091045.4FQj7ouF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: b153a0bb4199566abd337119207f82b59a8cd1ca  hwmon: (pmbus/adm1275) Fix problems with temperature monitoring on ADM1272

elapsed time: 725m

configs tested: 135
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230608   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230608   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r031-20230608   gcc  
arc                  randconfig-r043-20230608   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230608   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r032-20230608   clang
arm                  randconfig-r046-20230608   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230608   gcc  
hexagon      buildonly-randconfig-r006-20230608   clang
hexagon              randconfig-r011-20230608   clang
hexagon              randconfig-r041-20230608   clang
hexagon              randconfig-r045-20230608   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230608   gcc  
i386                 randconfig-i002-20230608   gcc  
i386                 randconfig-i003-20230608   gcc  
i386                 randconfig-i004-20230608   gcc  
i386                 randconfig-i005-20230608   gcc  
i386                 randconfig-i006-20230608   gcc  
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i056-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230608   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230608   gcc  
loongarch            randconfig-r005-20230608   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r033-20230608   gcc  
microblaze           randconfig-r034-20230608   gcc  
microblaze           randconfig-r036-20230608   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230608   gcc  
nios2                randconfig-r014-20230608   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                 mpc8560_ads_defconfig   clang
powerpc              randconfig-r033-20230608   gcc  
powerpc              randconfig-r035-20230608   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r034-20230608   gcc  
riscv                randconfig-r042-20230608   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230608   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230608   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r004-20230608   gcc  
sh                   randconfig-r025-20230608   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230608   gcc  
sparc                randconfig-r024-20230608   gcc  
sparc                randconfig-r026-20230608   gcc  
sparc64              randconfig-r023-20230608   gcc  
sparc64              randconfig-r036-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-r031-20230608   gcc  
x86_64               randconfig-x051-20230608   clang
x86_64               randconfig-x052-20230608   clang
x86_64               randconfig-x053-20230608   clang
x86_64               randconfig-x054-20230608   clang
x86_64               randconfig-x055-20230608   clang
x86_64               randconfig-x056-20230608   clang
x86_64               randconfig-x061-20230608   clang
x86_64               randconfig-x062-20230608   clang
x86_64               randconfig-x063-20230608   clang
x86_64               randconfig-x064-20230608   clang
x86_64               randconfig-x065-20230608   clang
x86_64               randconfig-x066-20230608   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230608   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r021-20230608   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
