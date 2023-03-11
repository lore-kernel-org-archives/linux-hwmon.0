Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85412C61DA4
	for <linux-hwmon@archiver.kernel.org>; Sat, 11 Mar 2023 06:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjCKGCq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 11 Mar 2023 01:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCKGCp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Mar 2023 01:02:45 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225C512B676
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Mar 2023 22:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678514564; x=1710050564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HBpDrgVPPTykZlWuCmcuuxdgTT8k9GrUEJE+vwCcXOE=;
  b=J+4ylqSJXTeSTimnAqgDT+4OT/q1MSc+mKppK7IBXZ0A6gEjsZVqJlvq
   lVv6TNFRTcHlUm1Ie6v11Rj/7hKfZFeMM23f8vd/0IUE1FUxx2d6iquIl
   v6JkuShCvD1ZcleMU+CTcOAnGMfEmftndGO+MjPLb2DQztyxlwnNQc5sG
   HnBGL/HCQmJ2yPcP+gvE7dENbG+JyPybpcCj2vYKaXu9GAljdm8hrjgTG
   6zaeewF0Uz7JI7saK4QBf4IgcCziQ8pzuaZ3h2QR2xSy0dPoMLroeo3WU
   pYg7JIt10X6kbp004zsFF40Cc38CE47SdXqs0d1z34mc1igtXjANcjAe7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338437525"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338437525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="923935500"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="923935500"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 22:02:42 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pasJV-0004NP-2e;
        Sat, 11 Mar 2023 06:02:41 +0000
Date:   Sat, 11 Mar 2023 14:02:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 420ea4bfc0570cff9a318506846de1f1eac8e34b
Message-ID: <640c1962.41EuE6La/hrPu35K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 420ea4bfc0570cff9a318506846de1f1eac8e34b  hwmon: (nct6775) ASUS PRIME Z590 boards support

elapsed time: 723m

configs tested: 102
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230310   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230310   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230310   gcc  
arc                  randconfig-r043-20230310   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230310   clang
arm                                 defconfig   gcc  
arm                  randconfig-r025-20230310   clang
arm                  randconfig-r026-20230310   clang
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r032-20230310   gcc  
hexagon              randconfig-r036-20230310   clang
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
ia64         buildonly-randconfig-r001-20230310   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230310   gcc  
ia64                 randconfig-r022-20230310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230310   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230310   gcc  
m68k                 randconfig-r033-20230310   gcc  
m68k                 randconfig-r034-20230310   gcc  
microblaze           randconfig-r006-20230310   gcc  
microblaze           randconfig-r011-20230310   gcc  
microblaze           randconfig-r023-20230310   gcc  
microblaze           randconfig-r031-20230310   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230310   gcc  
nios2                randconfig-r015-20230310   gcc  
nios2                randconfig-r024-20230310   gcc  
openrisc     buildonly-randconfig-r006-20230310   gcc  
openrisc             randconfig-r003-20230310   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230310   gcc  
parisc               randconfig-r021-20230310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230310   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230310   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230310   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r004-20230310   gcc  
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
xtensa               randconfig-r002-20230310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
