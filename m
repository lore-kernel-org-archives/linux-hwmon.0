Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA43CD527
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Jan 2024 18:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD5ndq4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704135087; x=1735671087;
  h=date:from:to:cc:subject:message-id;
  bh=uhjgmZaKILJUXQMUfFiJjGgJr2yXl3VeuGFL0IQOyUA=;
  b=bD5ndq4TfAr82gbso/6BYKDWkmwpk1ti48LyOKIxSVr2yly2dzvlLDJI
   j2UupdENx5BL78Q/Ym+k45rB2n4251R4zLmFuq8ZloFuS9L9cSTjSmEVh
   vDbDjkekWNRd42eVFPDNCKAAyxMc950eV7WAy8Ag+24HXoMUQeTTO83ex
   NvRUcm/Q22eLgbDcW7s6RklQpFqQQCn/zupMyI892/jLzyS29qCPFnyAK
   qjppbebZoN9MHv0cGOorjP7xpMMMjgnIfH3OvDhUpKrBMWhFlTnoSPlPC
   ppQIOxlJSeJguKSazRl46Wiyk0cyFLnkrBNt4FGxVhb2RAY2hK5gKAeBu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="399580566"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="399580566"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 10:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="870041045"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="870041045"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jan 2024 10:51:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKNNj-000KTh-17;
	Mon, 01 Jan 2024 18:51:23 +0000
Date: Tue, 02 Jan 2024 02:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 887599b9201a3c37d4575a8f04f581bbe79221ca
Message-ID: <202401020244.dIsesnYg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 887599b9201a3c37d4575a8f04f581bbe79221ca  hwmon: (lm75) Add AMS AS6200 temperature sensor

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- csky-randconfig-r113-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- microblaze-randconfig-r052-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- microblaze-randconfig-r123-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- nios2-randconfig-r061-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- sparc-randconfig-r051-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- sparc64-randconfig-r064-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- sparc64-randconfig-r132-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- x86_64-randconfig-122-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- x86_64-randconfig-123-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
`-- xtensa-randconfig-r054-20240101
    `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
clang_recent_errors
|-- hexagon-randconfig-r122-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- i386-randconfig-053-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- i386-randconfig-062-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- i386-randconfig-063-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- mips-randconfig-r133-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- powerpc-randconfig-r121-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- powerpc64-randconfig-r111-20240101
|   `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y
|-- riscv-randconfig-r053-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- x86_64-randconfig-102-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- x86_64-randconfig-103-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
|-- x86_64-randconfig-104-20240101
|   `-- drivers-hwmon-pc87360.c:WARNING-opportunity-for-min()
`-- x86_64-randconfig-r112-20240101
    `-- drivers-hwmon-max31827.c:sparse:sparse:dubious:x-y

elapsed time: 1451m

configs tested: 206
configs skipped: 3

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
arc                   randconfig-001-20240101   gcc  
arc                   randconfig-002-20240101   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240101   clang
arm                   randconfig-002-20240101   clang
arm                   randconfig-003-20240101   clang
arm                   randconfig-004-20240101   clang
arm                        spear6xx_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240101   clang
arm64                 randconfig-002-20240101   clang
arm64                 randconfig-003-20240101   clang
arm64                 randconfig-004-20240101   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240101   gcc  
csky                  randconfig-002-20240101   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240101   clang
hexagon               randconfig-002-20240101   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240101   clang
i386         buildonly-randconfig-002-20240101   clang
i386         buildonly-randconfig-003-20240101   clang
i386         buildonly-randconfig-004-20240101   clang
i386         buildonly-randconfig-005-20240101   clang
i386         buildonly-randconfig-006-20240101   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240101   clang
i386                  randconfig-002-20240101   clang
i386                  randconfig-003-20240101   clang
i386                  randconfig-004-20240101   clang
i386                  randconfig-005-20240101   clang
i386                  randconfig-006-20240101   clang
i386                  randconfig-011-20240101   gcc  
i386                  randconfig-012-20240101   gcc  
i386                  randconfig-013-20240101   gcc  
i386                  randconfig-014-20240101   gcc  
i386                  randconfig-015-20240101   gcc  
i386                  randconfig-016-20240101   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240101   gcc  
loongarch             randconfig-002-20240101   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240101   gcc  
nios2                 randconfig-002-20240101   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240101   gcc  
parisc                randconfig-002-20240101   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       eiger_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20240101   clang
powerpc               randconfig-002-20240101   clang
powerpc               randconfig-003-20240101   clang
powerpc                     sequoia_defconfig   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                      walnut_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240101   clang
powerpc64             randconfig-002-20240101   clang
powerpc64             randconfig-003-20240101   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240101   clang
riscv                 randconfig-002-20240101   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240101   gcc  
s390                  randconfig-002-20240101   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240101   gcc  
sh                    randconfig-002-20240101   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240101   gcc  
sparc64               randconfig-002-20240101   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240101   clang
um                    randconfig-002-20240101   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240101   clang
x86_64       buildonly-randconfig-002-20240101   clang
x86_64       buildonly-randconfig-003-20240101   clang
x86_64       buildonly-randconfig-004-20240101   clang
x86_64       buildonly-randconfig-005-20240101   clang
x86_64       buildonly-randconfig-006-20240101   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240101   gcc  
x86_64                randconfig-002-20240101   gcc  
x86_64                randconfig-003-20240101   gcc  
x86_64                randconfig-004-20240101   gcc  
x86_64                randconfig-005-20240101   gcc  
x86_64                randconfig-006-20240101   gcc  
x86_64                randconfig-011-20240101   clang
x86_64                randconfig-012-20240101   clang
x86_64                randconfig-013-20240101   clang
x86_64                randconfig-014-20240101   clang
x86_64                randconfig-015-20240101   clang
x86_64                randconfig-016-20240101   clang
x86_64                randconfig-071-20240101   clang
x86_64                randconfig-072-20240101   clang
x86_64                randconfig-073-20240101   clang
x86_64                randconfig-074-20240101   clang
x86_64                randconfig-075-20240101   clang
x86_64                randconfig-076-20240101   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240101   gcc  
xtensa                randconfig-002-20240101   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
