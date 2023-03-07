Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615C3C678D5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Mar 2023 13:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjCGNxv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Mar 2023 08:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjCGNxf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Mar 2023 08:53:35 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D719EC3
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Mar 2023 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197190; x=1709733190;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MdBfwX4gufbI3VIo6+DLec73ImH1hcEWO51o4v5F8/M=;
  b=l8vbj7UnZEDXdUXd5cE+vYwxcVeKYphHfTVWjN/XtscBgADvFiHe33m8
   XGz8RIQjGv+ZMfrqeDg0dSS9FOZ2n/oYoibNk92YYMJWXK6+DUp+1v5P9
   ocYNnGJXwQUWnuqse4IrNmQWzQt3t0ZCFJ+eGiMnwa7M3T267vbplZlyz
   EkYZk4O/Z+eXeTmI5li1amKS9QBe6yZx7ZXwo93He3iPHZsZOk6T5iJhU
   j3rTrh0KEyBxhP5xbCFLMtJ7Nqm4CdtGL3FtupOJ3AiHe2Up0+CRQfQFC
   fGaef+7vXGTV8IWktXOiS9K+nbs7dsXnqyavm1K38WbaNgOi4Dyrs263s
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="324157334"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="324157334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 05:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740724275"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="740724275"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2023 05:53:08 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZXkZ-0001Mp-1N;
        Tue, 07 Mar 2023 13:53:07 +0000
Date:   Tue, 07 Mar 2023 21:52:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 09f89b1232d7db55a133a7c71ebc079a4832289f
Message-ID: <6407418a.xCIjGYQeSfOw9t4o%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 09f89b1232d7db55a133a7c71ebc079a4832289f  watchdog: sbsa: Test WDOG_HW_RUNNING bit in suspend and resume

elapsed time: 736m

configs tested: 132
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230306   gcc  
arc                  randconfig-r006-20230305   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230305   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230305   gcc  
arm64                randconfig-r026-20230306   clang
csky                                defconfig   gcc  
csky                 randconfig-r025-20230306   gcc  
csky                 randconfig-r031-20230306   gcc  
hexagon      buildonly-randconfig-r001-20230305   clang
hexagon      buildonly-randconfig-r002-20230305   clang
hexagon              randconfig-r023-20230305   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
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
ia64         buildonly-randconfig-r003-20230306   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r021-20230306   gcc  
ia64                 randconfig-r022-20230306   gcc  
ia64                 randconfig-r036-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230306   gcc  
loongarch            randconfig-r016-20230306   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230306   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r034-20230306   gcc  
microblaze           randconfig-r005-20230306   gcc  
microblaze           randconfig-r011-20230305   gcc  
microblaze           randconfig-r032-20230306   gcc  
microblaze           randconfig-r033-20230305   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230305   clang
mips                 randconfig-r022-20230305   clang
nios2        buildonly-randconfig-r004-20230306   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230306   gcc  
nios2                randconfig-r004-20230306   gcc  
nios2                randconfig-r035-20230305   gcc  
openrisc     buildonly-randconfig-r006-20230305   gcc  
openrisc             randconfig-r002-20230305   gcc  
openrisc             randconfig-r004-20230305   gcc  
openrisc             randconfig-r033-20230306   gcc  
openrisc             randconfig-r036-20230306   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230306   gcc  
parisc               randconfig-r012-20230305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230305   gcc  
powerpc      buildonly-randconfig-r005-20230305   gcc  
powerpc      buildonly-randconfig-r005-20230306   clang
powerpc              randconfig-r014-20230306   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230305   clang
riscv                randconfig-r024-20230305   gcc  
riscv                randconfig-r031-20230305   clang
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230305   clang
s390                 randconfig-r013-20230306   clang
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230306   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230305   gcc  
sparc                randconfig-r023-20230306   gcc  
sparc64              randconfig-r024-20230306   gcc  
sparc64              randconfig-r034-20230305   gcc  
sparc64              randconfig-r035-20230306   gcc  
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
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64               randconfig-r002-20230306   gcc  
x86_64               randconfig-r011-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
