Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB34C41513
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jul 2023 14:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbjGYOmi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jul 2023 10:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbjGYOmf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2023 10:42:35 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CE3E77
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2023 07:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690296138; x=1721832138;
  h=date:from:to:cc:subject:message-id;
  bh=+RWAmE3fBKLMZyjvGLGAqy/fk8JK6mw1crlprUDg2ys=;
  b=kKEMyKZ24mDBcjLetwg2Sf2BnU7wX/fmAyAWuNCR++jGigSZCE5bzGcW
   A13iVm/45DmRqHQldqNqRw8Tq2XCUkY7pRc2ZzIe62JKnWut9fUDwsAsw
   UHeQNtpVwMlYc+EpnZeP2jLd2Q5NtKMBEeme+ptupsur2Da9c3Hb3ShhY
   jFmN3YP2iiDalG1ziNvkQCiuwGVZWZX0LPkMhshGZN4Tcg/u9Fd3MD9xe
   BQEep+9HSZSpjGkQ4S41gPTTzkIFTg76qutF/pZEvDmZPNCIiPb3qGOg9
   ojSHtb9CnR6JHZSHdgI8krtnZpWyN3a9lqoFARwMQXpTdw8+ZqNVHZpgT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="433997023"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="433997023"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791419856"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791419856"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 07:41:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOJE8-00003X-1R;
        Tue, 25 Jul 2023 14:41:28 +0000
Date:   Tue, 25 Jul 2023 22:35:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 54685abe660a59402344d5045ce08c43c6a5ac42
Message-ID: <202307252219.u97B6W8l-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 54685abe660a59402344d5045ce08c43c6a5ac42  hwmon: (nct7802) Fix for temp6 (PECI1) processed even if PECI1 disabled

elapsed time: 1444m

configs tested: 263
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230724   gcc  
alpha                randconfig-r016-20230724   gcc  
alpha                randconfig-r031-20230724   gcc  
alpha                randconfig-r034-20230725   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r001-20230725   gcc  
arc                  randconfig-r006-20230725   gcc  
arc                  randconfig-r023-20230725   gcc  
arc                  randconfig-r024-20230725   gcc  
arc                  randconfig-r036-20230725   gcc  
arc                  randconfig-r043-20230724   gcc  
arc                  randconfig-r043-20230725   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r001-20230725   gcc  
arm                  randconfig-r002-20230724   clang
arm                  randconfig-r003-20230725   gcc  
arm                  randconfig-r011-20230724   gcc  
arm                  randconfig-r012-20230724   gcc  
arm                  randconfig-r031-20230725   gcc  
arm                  randconfig-r046-20230724   gcc  
arm                           stm32_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230725   gcc  
arm64                randconfig-r014-20230725   gcc  
arm64                randconfig-r023-20230724   clang
arm64                randconfig-r026-20230725   gcc  
arm64                randconfig-r031-20230724   gcc  
arm64                randconfig-r032-20230725   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230724   gcc  
csky                 randconfig-r011-20230725   gcc  
csky                 randconfig-r031-20230725   gcc  
csky                 randconfig-r036-20230725   gcc  
hexagon              randconfig-r002-20230724   clang
hexagon              randconfig-r041-20230724   clang
hexagon              randconfig-r045-20230724   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230723   clang
i386         buildonly-randconfig-r004-20230724   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r005-20230723   clang
i386         buildonly-randconfig-r005-20230724   gcc  
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r006-20230723   clang
i386         buildonly-randconfig-r006-20230724   gcc  
i386         buildonly-randconfig-r006-20230725   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230724   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i002-20230724   gcc  
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i003-20230724   gcc  
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i004-20230724   gcc  
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i005-20230724   gcc  
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i006-20230724   gcc  
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i011-20230724   clang
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i012-20230724   clang
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i013-20230724   clang
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i014-20230724   clang
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i015-20230724   clang
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i016-20230724   clang
i386                 randconfig-i016-20230725   gcc  
i386                 randconfig-r012-20230725   gcc  
i386                 randconfig-r025-20230724   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r015-20230725   gcc  
loongarch            randconfig-r016-20230724   gcc  
loongarch            randconfig-r023-20230725   gcc  
loongarch            randconfig-r025-20230724   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                 randconfig-r002-20230725   gcc  
m68k                 randconfig-r014-20230724   gcc  
m68k                 randconfig-r015-20230724   gcc  
m68k                 randconfig-r023-20230724   gcc  
m68k                 randconfig-r035-20230724   gcc  
m68k                 randconfig-r035-20230725   gcc  
microblaze           randconfig-r001-20230724   gcc  
microblaze           randconfig-r004-20230724   gcc  
microblaze           randconfig-r015-20230724   gcc  
microblaze           randconfig-r015-20230725   gcc  
microblaze           randconfig-r016-20230724   gcc  
microblaze           randconfig-r021-20230725   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      malta_kvm_defconfig   clang
mips                 randconfig-r004-20230724   clang
mips                 randconfig-r034-20230725   gcc  
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230724   gcc  
nios2                randconfig-r023-20230725   gcc  
nios2                randconfig-r025-20230724   gcc  
nios2                randconfig-r025-20230725   gcc  
openrisc             randconfig-r005-20230725   gcc  
openrisc             randconfig-r012-20230724   gcc  
openrisc             randconfig-r021-20230724   gcc  
openrisc             randconfig-r026-20230724   gcc  
openrisc             randconfig-r033-20230725   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r001-20230724   gcc  
parisc               randconfig-r005-20230724   gcc  
parisc               randconfig-r016-20230725   gcc  
parisc               randconfig-r024-20230725   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r004-20230725   clang
powerpc              randconfig-r006-20230724   gcc  
powerpc              randconfig-r022-20230725   gcc  
powerpc              randconfig-r023-20230724   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230724   gcc  
riscv                randconfig-r013-20230724   clang
riscv                randconfig-r042-20230724   clang
riscv                randconfig-r042-20230725   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230725   clang
s390                 randconfig-r011-20230725   gcc  
s390                 randconfig-r021-20230724   clang
s390                 randconfig-r022-20230724   clang
s390                 randconfig-r026-20230724   clang
s390                 randconfig-r033-20230724   gcc  
s390                 randconfig-r044-20230724   clang
s390                 randconfig-r044-20230725   gcc  
sh                               allmodconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r004-20230724   gcc  
sh                   randconfig-r013-20230724   gcc  
sh                   randconfig-r015-20230725   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230724   gcc  
sparc                randconfig-r005-20230724   gcc  
sparc                randconfig-r012-20230724   gcc  
sparc                randconfig-r013-20230724   gcc  
sparc                randconfig-r021-20230725   gcc  
sparc                randconfig-r036-20230724   gcc  
sparc64              randconfig-r002-20230725   gcc  
sparc64              randconfig-r005-20230725   gcc  
sparc64              randconfig-r016-20230725   gcc  
sparc64              randconfig-r035-20230724   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r003-20230724   clang
um                   randconfig-r006-20230724   clang
um                   randconfig-r024-20230724   gcc  
um                   randconfig-r032-20230725   gcc  
um                   randconfig-r033-20230725   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230723   clang
x86_64       buildonly-randconfig-r001-20230724   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r002-20230723   clang
x86_64       buildonly-randconfig-r002-20230724   gcc  
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r003-20230723   clang
x86_64       buildonly-randconfig-r003-20230724   gcc  
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r006-20230724   gcc  
x86_64               randconfig-r011-20230724   clang
x86_64               randconfig-r013-20230724   clang
x86_64               randconfig-r016-20230724   clang
x86_64               randconfig-r016-20230725   gcc  
x86_64               randconfig-r022-20230725   gcc  
x86_64               randconfig-r025-20230725   gcc  
x86_64               randconfig-x001-20230724   clang
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x002-20230724   clang
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x003-20230724   clang
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x004-20230724   clang
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x005-20230724   clang
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x006-20230724   clang
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x011-20230724   gcc  
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x012-20230724   gcc  
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x013-20230724   gcc  
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x014-20230724   gcc  
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x015-20230724   gcc  
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x016-20230724   gcc  
x86_64               randconfig-x016-20230725   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa               randconfig-r003-20230724   gcc  
xtensa               randconfig-r006-20230725   gcc  
xtensa               randconfig-r012-20230724   gcc  
xtensa               randconfig-r012-20230725   gcc  
xtensa               randconfig-r015-20230724   gcc  
xtensa               randconfig-r022-20230725   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
