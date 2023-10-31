Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A6DC4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 07:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343627AbjJaHSr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 03:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343523AbjJaHSr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 03:18:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668428F
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 00:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698736724; x=1730272724;
  h=date:from:to:cc:subject:message-id;
  bh=svLnRNXiA3G6AU6zxtCYxaOscZWTQfO09czWtaY4sTA=;
  b=hr2rwASPUwN0tCBakrmHP3Vvq+qDk4Iflgn1CMtZH/5MBbwLrxdmCj+D
   yq/4yyVmYoFXYxThD9JXznFNrhDilVKcX2wK6TqmAm+hv4+7Msc80WTV9
   KDLjDm4PffuzmZc4yDWAawU+XV94RKUCsY7aGZTi2adum2ge9V73z3NEW
   WoQz9Y3rQooFo46GJkXdcq1Dh3+GfMY8OVwCp/0jJrEvycgddlEeD2ibM
   QMOJDrLJNqLHnMVdrIYNYttWXzReWGq55xFzGXRKojDG/VoTQUgqHMB+f
   5+LhlYEqHOk2vUBMDKaPoqwHllAzx8WecCQ97kqa/g5Stqt2MzKj35L1N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387111815"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="387111815"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 00:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764153986"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="764153986"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Oct 2023 00:18:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qxj1L-000Du7-2h;
        Tue, 31 Oct 2023 07:18:39 +0000
Date:   Tue, 31 Oct 2023 15:18:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 0f564130e5c76f1e5cf0008924f6a6cd138929d9
Message-ID: <202310311512.8bruEgLt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0f564130e5c76f1e5cf0008924f6a6cd138929d9  hwmon: (aquacomputer_d5next) Check if temp sensors of legacy devices are connected

Unverified Warning (likely false positive, please contact us if interested):

{standard input}:537: Warning: overflow in branch to .L72; converted into longer instruction sequence
{standard input}:643: Warning: overflow in branch to .L63; converted into longer instruction sequence

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-randconfig-r023-20211018
    |-- standard-input:Warning:overflow-in-branch-to-.L63-converted-into-longer-instruction-sequence
    `-- standard-input:Warning:overflow-in-branch-to-.L72-converted-into-longer-instruction-sequence

elapsed time: 1506m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231030   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231030   gcc  
arm                           sama5_defconfig   gcc  
arm                         socfpga_defconfig   clang
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
i386         buildonly-randconfig-001-20231030   gcc  
i386         buildonly-randconfig-002-20231030   gcc  
i386         buildonly-randconfig-003-20231030   gcc  
i386         buildonly-randconfig-004-20231030   gcc  
i386         buildonly-randconfig-005-20231030   gcc  
i386         buildonly-randconfig-006-20231030   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231030   gcc  
i386                  randconfig-002-20231030   gcc  
i386                  randconfig-003-20231030   gcc  
i386                  randconfig-004-20231030   gcc  
i386                  randconfig-005-20231030   gcc  
i386                  randconfig-006-20231030   gcc  
i386                  randconfig-011-20231030   gcc  
i386                  randconfig-012-20231030   gcc  
i386                  randconfig-013-20231030   gcc  
i386                  randconfig-014-20231030   gcc  
i386                  randconfig-015-20231030   gcc  
i386                  randconfig-016-20231030   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231030   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           jazz_defconfig   gcc  
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
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                     tqm5200_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231030   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231030   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231031   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231030   gcc  
x86_64       buildonly-randconfig-002-20231030   gcc  
x86_64       buildonly-randconfig-003-20231030   gcc  
x86_64       buildonly-randconfig-004-20231030   gcc  
x86_64       buildonly-randconfig-005-20231030   gcc  
x86_64       buildonly-randconfig-006-20231030   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231030   gcc  
x86_64                randconfig-002-20231030   gcc  
x86_64                randconfig-003-20231030   gcc  
x86_64                randconfig-004-20231030   gcc  
x86_64                randconfig-005-20231030   gcc  
x86_64                randconfig-006-20231030   gcc  
x86_64                randconfig-011-20231030   gcc  
x86_64                randconfig-071-20231030   gcc  
x86_64                randconfig-072-20231030   gcc  
x86_64                randconfig-073-20231030   gcc  
x86_64                randconfig-074-20231030   gcc  
x86_64                randconfig-075-20231030   gcc  
x86_64                randconfig-076-20231030   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
