Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlJo3Wmt"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4B69C
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Dec 2023 14:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702506078; x=1734042078;
  h=date:from:to:cc:subject:message-id;
  bh=GIe82i3XdXSOaZMBT0OUr23sNlghNv92jHPpowLrMCo=;
  b=MlJo3WmtL5bVEU/G2iBLtuycSm658Xk3CQkjmd2C+4ItomhuEB38SmNt
   rFKzFkXzmO83xXS/rZ25ltVAESe4Rezb9lM9M6SRHLZMU8zDTaiJnfa+P
   ZKeuDfkgSLG6QdrRVv+3jNUFx3hWGrZ+jFDSFpelt5M46OuJ8+tqJ/rTm
   x/1rzK5i8i+0O8yqWdpXdw5h+c/7WOX1TCyy5acg9hG+CZnHFRY/9VuvL
   n+CMntR2C+FtgwNBdhGTbevRBKgomHd34DK3rQAAeLzsTg6/17rEILXyk
   6iZ2tyxe5mNxC0y6f5x54mXkU6wem5yDp/7Rhf98Z4QR5wZSA6cZTGFWR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375189840"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="375189840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 14:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="15592860"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2023 14:21:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDXbO-000LBs-0i;
	Wed, 13 Dec 2023 22:21:14 +0000
Date: Thu, 14 Dec 2023 06:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 dfaacc77d7876849d0ecdb5dc734d1fb8e6717d3
Message-ID: <202312140627.wYvKjlFB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: dfaacc77d7876849d0ecdb5dc734d1fb8e6717d3  dt-bindings: hwmon: gpio-fan: Convert txt bindings to yaml

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- i386-randconfig-063-20231214
    `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
clang_recent_errors
|-- arm-randconfig-001-20231213
|   `-- fs-bcachefs-fsck.c:warning:stack-frame-size-()-exceeds-limit-()-in-reattach_inode
|-- arm-randconfig-002-20231213
|   `-- drivers-char-apm-emulation.c:warning:unused-variable-driver_version
|-- arm-randconfig-003-20231213
|   `-- drivers-infiniband-core-mad_priv.h:warning:field-wc-within-struct-ib_mad_private_header-is-less-aligned-than-struct-ib_wc-and-is-usually-due-to-struct-ib_mad_private_header-being-packed-which-can-lead
|-- powerpc-randconfig-001-20231213
|   |-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_give_timebase
|   `-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_take_timebase
|-- powerpc-randconfig-003-20231213
|   |-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_give_timebase
|   |-- arch-powerpc-platforms-powermac-smp.c:warning:no-previous-prototype-for-function-smp_psurge_take_timebase
|   `-- fs-bcachefs-fsck.c:warning:stack-frame-size-()-exceeds-limit-()-in-reattach_inode
|-- x86_64-randconfig-121-20231214
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
`-- x86_64-randconfig-122-20231214
    `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y

elapsed time: 1478m

configs tested: 177
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
arc                   randconfig-001-20231213   gcc  
arc                   randconfig-002-20231213   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231213   clang
arm                   randconfig-002-20231213   clang
arm                   randconfig-003-20231213   clang
arm                   randconfig-004-20231213   clang
arm                             rpc_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231213   clang
arm64                 randconfig-002-20231213   clang
arm64                 randconfig-003-20231213   clang
arm64                 randconfig-004-20231213   clang
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231213   gcc  
csky                  randconfig-002-20231213   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231213   clang
hexagon               randconfig-002-20231213   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231213   clang
i386         buildonly-randconfig-002-20231213   clang
i386         buildonly-randconfig-003-20231213   clang
i386         buildonly-randconfig-004-20231213   clang
i386         buildonly-randconfig-005-20231213   clang
i386         buildonly-randconfig-006-20231213   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231213   clang
i386                  randconfig-002-20231213   clang
i386                  randconfig-003-20231213   clang
i386                  randconfig-004-20231213   clang
i386                  randconfig-005-20231213   clang
i386                  randconfig-006-20231213   clang
i386                  randconfig-011-20231213   gcc  
i386                  randconfig-012-20231213   gcc  
i386                  randconfig-013-20231213   gcc  
i386                  randconfig-014-20231213   gcc  
i386                  randconfig-015-20231213   gcc  
i386                  randconfig-016-20231213   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20231213   gcc  
loongarch             randconfig-002-20231213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                           rs90_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231213   gcc  
nios2                 randconfig-002-20231213   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231213   gcc  
parisc                randconfig-002-20231213   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc               randconfig-001-20231213   clang
powerpc               randconfig-002-20231213   clang
powerpc               randconfig-003-20231213   clang
powerpc64             randconfig-001-20231213   clang
powerpc64             randconfig-002-20231213   clang
powerpc64             randconfig-003-20231213   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231213   clang
riscv                 randconfig-002-20231213   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231213   gcc  
s390                  randconfig-002-20231213   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20231213   gcc  
sh                    randconfig-002-20231213   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231213   gcc  
sparc64               randconfig-002-20231213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231213   clang
um                    randconfig-002-20231213   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231213   clang
x86_64       buildonly-randconfig-002-20231213   clang
x86_64       buildonly-randconfig-003-20231213   clang
x86_64       buildonly-randconfig-004-20231213   clang
x86_64       buildonly-randconfig-005-20231213   clang
x86_64       buildonly-randconfig-006-20231213   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231213   gcc  
x86_64                randconfig-002-20231213   gcc  
x86_64                randconfig-003-20231213   gcc  
x86_64                randconfig-004-20231213   gcc  
x86_64                randconfig-005-20231213   gcc  
x86_64                randconfig-006-20231213   gcc  
x86_64                randconfig-011-20231213   clang
x86_64                randconfig-012-20231213   clang
x86_64                randconfig-013-20231213   clang
x86_64                randconfig-014-20231213   clang
x86_64                randconfig-015-20231213   clang
x86_64                randconfig-016-20231213   clang
x86_64                randconfig-071-20231213   clang
x86_64                randconfig-072-20231213   clang
x86_64                randconfig-073-20231213   clang
x86_64                randconfig-074-20231213   clang
x86_64                randconfig-075-20231213   clang
x86_64                randconfig-076-20231213   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231213   gcc  
xtensa                randconfig-002-20231213   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
