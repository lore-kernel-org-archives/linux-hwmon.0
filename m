Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536F4C6FD19
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Mar 2023 09:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjCMJhx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Mar 2023 05:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjCMJh2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Mar 2023 05:37:28 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDDE5D244
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Mar 2023 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678700141; x=1710236141;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K9SVXjFGYUpDcTWwqhzY+oRvgIgZRq3uytgni78Wk+M=;
  b=U82pKUEnBZmdQwaLm2Oke9ZypPfBJ/OnFxvWVV7TTG7CKUmHBxobJv53
   XI5aRHsGFJJxX5UnYkddl68crcYlmlZLG9d+BcTgzUJghKQVvo1uJfVa3
   +mE81t6wDSpO48JD7JzxXsyaKmmzr5cK43isOsoKtWKM/BMM12UsUdd9Z
   RJX+yhgRCs9g6fbx3uDib3r/n66KWfleCe8emJNNji9JQ118p7UBFn92S
   KB5NyXNPBkMJrc1y2KQiYhEC+vcTZ94ri/PkgFu1Qx6j6lq5LXYDtMdER
   Ssvr57xD9o9VpbCizZhHCzOLJyMmPAURTcPJGpLHiNmVySE1BWi2+0dk/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="339474369"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="339474369"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 02:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="680965625"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="680965625"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Mar 2023 02:33:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pbeYD-0005WE-2A;
        Mon, 13 Mar 2023 09:33:05 +0000
Date:   Mon, 13 Mar 2023 17:32:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 00d85e81796b17a29a0e096c5a4735daa47adef8
Message-ID: <640eedbb.UtRcjJyZyHHWpVQI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 00d85e81796b17a29a0e096c5a4735daa47adef8  hwmon: tmp512: drop of_match_ptr for ID table

elapsed time: 728m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230312   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230313   gcc  
arc                  randconfig-r012-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230313   clang
arm                  randconfig-r016-20230312   clang
arm                  randconfig-r026-20230312   clang
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230312   gcc  
hexagon              randconfig-r015-20230312   clang
hexagon              randconfig-r033-20230312   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                 randconfig-r004-20230313   gcc  
i386                 randconfig-r024-20230313   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230312   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230313   gcc  
microblaze           randconfig-r032-20230312   gcc  
microblaze           randconfig-r034-20230312   gcc  
microblaze           randconfig-r036-20230313   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r003-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230312   gcc  
nios2                randconfig-r013-20230312   gcc  
nios2                randconfig-r014-20230312   gcc  
nios2                randconfig-r036-20230312   gcc  
openrisc     buildonly-randconfig-r002-20230313   gcc  
openrisc     buildonly-randconfig-r004-20230312   gcc  
openrisc             randconfig-r031-20230312   gcc  
openrisc             randconfig-r034-20230313   gcc  
parisc       buildonly-randconfig-r005-20230313   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230313   gcc  
parisc               randconfig-r014-20230313   gcc  
parisc               randconfig-r021-20230313   gcc  
parisc               randconfig-r031-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r033-20230313   gcc  
powerpc              randconfig-r035-20230313   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230313   clang
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230312   clang
riscv                randconfig-r015-20230313   clang
riscv                randconfig-r022-20230313   clang
riscv                randconfig-r025-20230313   clang
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230313   clang
s390                                defconfig   gcc  
s390                 randconfig-r032-20230313   gcc  
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r016-20230313   gcc  
sh                   randconfig-r022-20230312   gcc  
sh                   randconfig-r023-20230313   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230313   gcc  
sparc                randconfig-r013-20230313   gcc  
sparc                randconfig-r021-20230312   gcc  
sparc                randconfig-r023-20230312   gcc  
sparc64      buildonly-randconfig-r002-20230312   gcc  
sparc64              randconfig-r004-20230312   gcc  
sparc64              randconfig-r024-20230312   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230313   gcc  
xtensa               randconfig-r001-20230312   gcc  
xtensa               randconfig-r001-20230313   gcc  
xtensa               randconfig-r003-20230312   gcc  
xtensa               randconfig-r012-20230313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
