Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C9C17C71
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jan 2024 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/v+o8Zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705337130; x=1736873130;
  h=date:from:to:cc:subject:message-id;
  bh=9JOQJs79Khw+FtXc6KKmjXfp8juia/6VGh7tB2vUQAA=;
  b=a/v+o8ZjC0TV8T86K5SlQPmIJPBUjQpJe+YLyB6yLHTHVNQ5LgyQ5ILU
   pTZ8Qa1RQuksZA/H2paq1X2g9oJvvPP12bEoCPnH3i7wDNtVogCzZPi0j
   ojaQF0UMf80F4baCFx1nZ7cw/29UgDlL/mgvVcyYULZ2SZib2sfqU9Umd
   eWgBrUr6mLgYu+EUrqAcFkLRqR9+xZs/j7OKKmY1VUZFot8dIHTqoKTfO
   rIbP97V25nd2oZJXaf0efiJMudN0e1eGIV7hLZBko6thTcn53eR0bf6tF
   7yEVYAe74sB1RTT9ll+jj+5YtrSy+TID9WJGCh7NJ74J4zNy17r3i3I7O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6405996"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6405996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 08:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="907097931"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="907097931"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Jan 2024 08:45:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPQ5V-000Cbs-2s;
	Mon, 15 Jan 2024 16:45:25 +0000
Date: Tue, 16 Jan 2024 00:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2539b15d504c3f9fd8ca82032bf9c80c9864412c
Message-ID: <202401160048.w6L3GnGh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2539b15d504c3f9fd8ca82032bf9c80c9864412c  hwmon: (npcm750-pwm-fan) Fix crash observed when instantiating nuvoton,npcm750-pwm-fan

elapsed time: 1444m

configs tested: 128
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             alldefconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240115   gcc  
i386         buildonly-randconfig-002-20240115   gcc  
i386         buildonly-randconfig-003-20240115   gcc  
i386         buildonly-randconfig-004-20240115   gcc  
i386         buildonly-randconfig-005-20240115   gcc  
i386         buildonly-randconfig-006-20240115   gcc  
i386                  randconfig-001-20240115   gcc  
i386                  randconfig-002-20240115   gcc  
i386                  randconfig-003-20240115   gcc  
i386                  randconfig-004-20240115   gcc  
i386                  randconfig-005-20240115   gcc  
i386                  randconfig-006-20240115   gcc  
i386                  randconfig-011-20240115   clang
i386                  randconfig-012-20240115   clang
i386                  randconfig-013-20240115   clang
i386                  randconfig-014-20240115   clang
i386                  randconfig-015-20240115   clang
i386                  randconfig-016-20240115   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240115   gcc  
x86_64       buildonly-randconfig-002-20240115   gcc  
x86_64       buildonly-randconfig-003-20240115   gcc  
x86_64       buildonly-randconfig-004-20240115   gcc  
x86_64       buildonly-randconfig-005-20240115   gcc  
x86_64       buildonly-randconfig-006-20240115   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240115   gcc  
x86_64                randconfig-012-20240115   gcc  
x86_64                randconfig-013-20240115   gcc  
x86_64                randconfig-014-20240115   gcc  
x86_64                randconfig-015-20240115   gcc  
x86_64                randconfig-016-20240115   gcc  
x86_64                randconfig-071-20240115   gcc  
x86_64                randconfig-072-20240115   gcc  
x86_64                randconfig-073-20240115   gcc  
x86_64                randconfig-074-20240115   gcc  
x86_64                randconfig-075-20240115   gcc  
x86_64                randconfig-076-20240115   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
