Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C90C25B47
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Oct 2023 04:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjJ0ElK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Oct 2023 00:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJ0ElJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Oct 2023 00:41:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE61186
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Oct 2023 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698381667; x=1729917667;
  h=date:from:to:cc:subject:message-id;
  bh=/SSK4l8EqlkHc4ye0ORV4FN45X5ZhEGYfjd6J0F3ApQ=;
  b=Pd4eWx4vwAAnx9sHAMJRqnYcFvWwNCYhMf6W6Hh4sRz75wlU9BfPW3qN
   xOYZvBVYbL/4n8/gIIyPD4vbtBZHrWXU+YpzxgrM4pRYl0TKYS+EIztiD
   25DSQdXBuAk8L7246wJtY1NvLnGYFKNKWLZ+ATt3sSKaRXbjWLItu4S0X
   +nXD+iUKHnuPmw3NuzbCBeDMyJhq9qut07nrCi4ws5x0Q4zKBaxMIrkIH
   kru5Y+v7kuRxlM720mFJRfj3EZIKPM1k6uUWpnPmN/mEcIJF+QDpG9rOp
   Zlcmjbboptm+XkmdUYns0atthXUmb3pI4MkJt3NSo0DKbtst7b9K0sVKg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9246083"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="9246083"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 21:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1006634236"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="1006634236"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2023 21:41:05 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qwEec-000ARc-2t;
        Fri, 27 Oct 2023 04:41:02 +0000
Date:   Fri, 27 Oct 2023 12:40:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 5421af83a43bdcb646564fec238253d11009ad3f
Message-ID: <202310271250.kyeYvU1I-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 5421af83a43bdcb646564fec238253d11009ad3f  drivers: hwmon: max31827: handle vref regulator

elapsed time: 1576m

configs tested: 199
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231026   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231026   gcc  
arm                   randconfig-001-20231027   gcc  
arm                       spear13xx_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231026   gcc  
i386         buildonly-randconfig-001-20231027   gcc  
i386         buildonly-randconfig-002-20231026   gcc  
i386         buildonly-randconfig-002-20231027   gcc  
i386         buildonly-randconfig-003-20231026   gcc  
i386         buildonly-randconfig-003-20231027   gcc  
i386         buildonly-randconfig-004-20231026   gcc  
i386         buildonly-randconfig-004-20231027   gcc  
i386         buildonly-randconfig-005-20231026   gcc  
i386         buildonly-randconfig-005-20231027   gcc  
i386         buildonly-randconfig-006-20231026   gcc  
i386         buildonly-randconfig-006-20231027   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231026   gcc  
i386                  randconfig-001-20231027   gcc  
i386                  randconfig-002-20231026   gcc  
i386                  randconfig-002-20231027   gcc  
i386                  randconfig-003-20231026   gcc  
i386                  randconfig-003-20231027   gcc  
i386                  randconfig-004-20231026   gcc  
i386                  randconfig-004-20231027   gcc  
i386                  randconfig-005-20231026   gcc  
i386                  randconfig-005-20231027   gcc  
i386                  randconfig-006-20231026   gcc  
i386                  randconfig-006-20231027   gcc  
i386                  randconfig-011-20231026   gcc  
i386                  randconfig-011-20231027   gcc  
i386                  randconfig-012-20231026   gcc  
i386                  randconfig-012-20231027   gcc  
i386                  randconfig-013-20231026   gcc  
i386                  randconfig-013-20231027   gcc  
i386                  randconfig-014-20231026   gcc  
i386                  randconfig-014-20231027   gcc  
i386                  randconfig-015-20231026   gcc  
i386                  randconfig-015-20231027   gcc  
i386                  randconfig-016-20231026   gcc  
i386                  randconfig-016-20231027   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231026   gcc  
loongarch             randconfig-001-20231027   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231026   gcc  
riscv                 randconfig-001-20231027   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231026   gcc  
s390                  randconfig-001-20231027   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231026   gcc  
sparc                 randconfig-001-20231027   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231026   gcc  
x86_64       buildonly-randconfig-001-20231027   gcc  
x86_64       buildonly-randconfig-002-20231026   gcc  
x86_64       buildonly-randconfig-002-20231027   gcc  
x86_64       buildonly-randconfig-003-20231026   gcc  
x86_64       buildonly-randconfig-003-20231027   gcc  
x86_64       buildonly-randconfig-004-20231026   gcc  
x86_64       buildonly-randconfig-004-20231027   gcc  
x86_64       buildonly-randconfig-005-20231026   gcc  
x86_64       buildonly-randconfig-005-20231027   gcc  
x86_64       buildonly-randconfig-006-20231026   gcc  
x86_64       buildonly-randconfig-006-20231027   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231026   gcc  
x86_64                randconfig-001-20231027   gcc  
x86_64                randconfig-002-20231026   gcc  
x86_64                randconfig-002-20231027   gcc  
x86_64                randconfig-003-20231026   gcc  
x86_64                randconfig-003-20231027   gcc  
x86_64                randconfig-004-20231026   gcc  
x86_64                randconfig-004-20231027   gcc  
x86_64                randconfig-005-20231026   gcc  
x86_64                randconfig-005-20231027   gcc  
x86_64                randconfig-006-20231026   gcc  
x86_64                randconfig-006-20231027   gcc  
x86_64                randconfig-011-20231026   gcc  
x86_64                randconfig-011-20231027   gcc  
x86_64                randconfig-012-20231026   gcc  
x86_64                randconfig-012-20231027   gcc  
x86_64                randconfig-013-20231026   gcc  
x86_64                randconfig-013-20231027   gcc  
x86_64                randconfig-014-20231026   gcc  
x86_64                randconfig-014-20231027   gcc  
x86_64                randconfig-015-20231026   gcc  
x86_64                randconfig-015-20231027   gcc  
x86_64                randconfig-016-20231026   gcc  
x86_64                randconfig-016-20231027   gcc  
x86_64                randconfig-071-20231026   gcc  
x86_64                randconfig-071-20231027   gcc  
x86_64                randconfig-072-20231026   gcc  
x86_64                randconfig-072-20231027   gcc  
x86_64                randconfig-073-20231026   gcc  
x86_64                randconfig-073-20231027   gcc  
x86_64                randconfig-074-20231026   gcc  
x86_64                randconfig-074-20231027   gcc  
x86_64                randconfig-075-20231026   gcc  
x86_64                randconfig-075-20231027   gcc  
x86_64                randconfig-076-20231026   gcc  
x86_64                randconfig-076-20231027   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
