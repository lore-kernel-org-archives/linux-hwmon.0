Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B062DC678D4
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Mar 2023 12:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjCFMbI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Mar 2023 07:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjCFMbG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Mar 2023 07:31:06 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5922B2AF
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Mar 2023 04:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678105865; x=1709641865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z9f1TImMm4KDx4czD+/U6Ds2uA6SjKaPxGEV3r/J1tQ=;
  b=E/ESvsqT/Yx5yHk5efA/cAbMOb/zot73LDLZtupU0Mg+tPMoiqBoVP8A
   TKhcTaMjOTkTRi3gAm16fY7yfIAuKvXHGVsJ2huy6/BQIrNyvlbOkLH3c
   jI0XpljBufic8UrmPZEfBaqnouwCZbG7xPge5nTdXeE515k+0NfeXb8i2
   ymG5C2egtUPPzQC3Hhrs6ZdNfU5zUHIx70P1HZli5grGgK2jht8HVatO4
   Dbahh8wvJ+d5RMsZzarFBD7H9tRhdfkjkcguvUIf9wtpymmFfPOcCFHJt
   4Dkd7sIIRGU+Me/2uH4j51JR4R1v1BJidxm0r9BnHUcRpFwjiZfGj7+rY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="398123104"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="398123104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 04:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="706421988"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="706421988"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 04:31:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZ9zb-0000JZ-0j;
        Mon, 06 Mar 2023 12:31:03 +0000
Date:   Mon, 06 Mar 2023 20:30:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 fb4c86f3a5895eac953de0dc520288f6bd6b86f5
Message-ID: <6405dcdf.wxmSYqD2N7j+cBce%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: fb4c86f3a5895eac953de0dc520288f6bd6b86f5  watchdog: s3c2410_wdt: Use devm_add_action_or_reset() to disable watchdog

elapsed time: 729m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r033-20230306   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r021-20230306   gcc  
arm                  randconfig-r034-20230305   gcc  
arm                  randconfig-r035-20230306   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230306   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r025-20230306   clang
csky                                defconfig   gcc  
csky                 randconfig-r014-20230306   gcc  
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230306   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r023-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230305   gcc  
loongarch            randconfig-r015-20230305   gcc  
loongarch            randconfig-r022-20230305   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230305   gcc  
microblaze   buildonly-randconfig-r005-20230305   gcc  
microblaze           randconfig-r001-20230306   gcc  
microblaze           randconfig-r013-20230305   gcc  
microblaze           randconfig-r033-20230305   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230306   clang
mips                 randconfig-r005-20230306   clang
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230305   gcc  
nios2                randconfig-r025-20230305   gcc  
nios2                randconfig-r031-20230306   gcc  
openrisc     buildonly-randconfig-r002-20230306   gcc  
openrisc             randconfig-r003-20230305   gcc  
openrisc             randconfig-r013-20230306   gcc  
openrisc             randconfig-r014-20230305   gcc  
openrisc             randconfig-r016-20230306   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230306   gcc  
parisc               randconfig-r023-20230306   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230305   gcc  
powerpc              randconfig-r006-20230306   gcc  
powerpc              randconfig-r024-20230306   clang
powerpc              randconfig-r036-20230305   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230306   clang
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230305   gcc  
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230306   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230305   gcc  
sh                   randconfig-r011-20230306   gcc  
sh                   randconfig-r012-20230306   gcc  
sh                   randconfig-r031-20230305   gcc  
sh                   randconfig-r034-20230306   gcc  
sparc        buildonly-randconfig-r001-20230305   gcc  
sparc        buildonly-randconfig-r002-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230306   gcc  
sparc                randconfig-r024-20230305   gcc  
sparc                randconfig-r032-20230306   gcc  
sparc                randconfig-r035-20230305   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64               randconfig-r015-20230306   clang
x86_64               randconfig-r026-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230306   gcc  
xtensa               randconfig-r011-20230305   gcc  
xtensa               randconfig-r032-20230305   gcc  
xtensa               randconfig-r036-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
