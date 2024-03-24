Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78141A38DA
	for <linux-hwmon@vger.kernel.org>; Sun, 24 Mar 2024 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711286442; cv=none; b=hRxaenLSZH4g5U8MsXyLvtxUgIeeHrmU8WgU5XPZDzooZgMuuWPrExyITvHfemENeqb1EHZpA71e9wP5lBlaZDdR7GZTr2cAUf7eBcI1ndOn78MJgIobBEqJul4SVlX4G4r7I7/41A+LJLWOyBa36U3d6Oj2Afe4wGvK2Fe5ZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711286442; c=relaxed/simple;
	bh=A1kzfqaCCjP4nOW+MTQvgh0Rt4fgqJdYLaFTMEQiz64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kgE9v1VLXKoDOPUklqHUq8YUWDEhEMtGKp5M5uqtGhe0fYfmv/EZTt0luUJ0R9h/aS18Ux75symLODFQwUTOZTkHhcuSJu3n4z1z6JZjkXjsDwPRIyt9ocVjtNltMGbW12oaMLWoTj+6DlIa2oH2hWfDkqZXFLjAnQZuG2SX8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nao7Hz2J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nao7Hz2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711286440; x=1742822440;
  h=date:from:to:cc:subject:message-id;
  bh=A1kzfqaCCjP4nOW+MTQvgh0Rt4fgqJdYLaFTMEQiz64=;
  b=Nao7Hz2JOsJbThZd3bQ6G8aR/DDeMN6mUdexw7XUOPdvDCcqj6V5aTw+
   R8+HwIe9Mm5QgVjHdZKxno8Wkrldz/DloMxyunlf+uHHm5sQlNHKzvUi0
   Dg0A9Qxy3bCxZH5mG9EjnKgGWafVc/+bJjBexaITLVd81BN7HZqdvnwk0
   1wrYlGtt1ZCsNDvOtHbB5nl97B83fzktCMnWGov2RSL57MRRXD3L1EOMd
   yRRBAb6nrCbAAyc6QjoBj5YZMql5r+VSo/xi7lZSFGcyLqqWaFCXPbG4I
   gx4TJgpnavisfg837r6gSUPxIETcfFJF6v6Sw/0uDdVDk13mny+KQKSN/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="16832926"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="16832926"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 06:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="20029818"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2024 06:20:36 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roNm6-000Lq7-0d;
	Sun, 24 Mar 2024 13:20:34 +0000
Date: Sun, 24 Mar 2024 21:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 03c80a19e739f5bd428be04dccff54a075585dc8
Message-ID: <202403242146.FzZL1Joq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 03c80a19e739f5bd428be04dccff54a075585dc8  Merge branch 'kunit-v2' into testing

elapsed time: 722m

configs tested: 180
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
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240324   gcc  
arc                   randconfig-002-20240324   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                      integrator_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240324   clang
arm                   randconfig-002-20240324   gcc  
arm                   randconfig-003-20240324   clang
arm                   randconfig-004-20240324   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240324   gcc  
arm64                 randconfig-002-20240324   gcc  
arm64                 randconfig-003-20240324   gcc  
arm64                 randconfig-004-20240324   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240324   gcc  
csky                  randconfig-002-20240324   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240324   clang
hexagon               randconfig-002-20240324   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240324   gcc  
i386         buildonly-randconfig-002-20240324   clang
i386         buildonly-randconfig-003-20240324   gcc  
i386         buildonly-randconfig-004-20240324   gcc  
i386         buildonly-randconfig-005-20240324   gcc  
i386         buildonly-randconfig-006-20240324   clang
i386                                defconfig   clang
i386                  randconfig-001-20240324   clang
i386                  randconfig-002-20240324   gcc  
i386                  randconfig-003-20240324   gcc  
i386                  randconfig-004-20240324   gcc  
i386                  randconfig-005-20240324   clang
i386                  randconfig-006-20240324   gcc  
i386                  randconfig-011-20240324   clang
i386                  randconfig-012-20240324   clang
i386                  randconfig-013-20240324   clang
i386                  randconfig-014-20240324   clang
i386                  randconfig-015-20240324   clang
i386                  randconfig-016-20240324   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240324   gcc  
loongarch             randconfig-002-20240324   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240324   gcc  
nios2                 randconfig-002-20240324   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240324   gcc  
parisc                randconfig-002-20240324   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240324   gcc  
powerpc               randconfig-002-20240324   gcc  
powerpc               randconfig-003-20240324   clang
powerpc64             randconfig-001-20240324   gcc  
powerpc64             randconfig-002-20240324   gcc  
powerpc64             randconfig-003-20240324   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240324   clang
riscv                 randconfig-002-20240324   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240324   clang
s390                  randconfig-002-20240324   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240324   gcc  
sh                    randconfig-002-20240324   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240324   gcc  
sparc64               randconfig-002-20240324   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240324   gcc  
um                    randconfig-002-20240324   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240324   gcc  
x86_64       buildonly-randconfig-002-20240324   gcc  
x86_64       buildonly-randconfig-003-20240324   clang
x86_64       buildonly-randconfig-004-20240324   clang
x86_64       buildonly-randconfig-005-20240324   gcc  
x86_64       buildonly-randconfig-006-20240324   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240324   clang
x86_64                randconfig-002-20240324   clang
x86_64                randconfig-003-20240324   clang
x86_64                randconfig-004-20240324   clang
x86_64                randconfig-005-20240324   clang
x86_64                randconfig-006-20240324   gcc  
x86_64                randconfig-011-20240324   clang
x86_64                randconfig-012-20240324   gcc  
x86_64                randconfig-013-20240324   gcc  
x86_64                randconfig-014-20240324   gcc  
x86_64                randconfig-015-20240324   gcc  
x86_64                randconfig-016-20240324   clang
x86_64                randconfig-071-20240324   clang
x86_64                randconfig-072-20240324   gcc  
x86_64                randconfig-073-20240324   clang
x86_64                randconfig-074-20240324   clang
x86_64                randconfig-075-20240324   clang
x86_64                randconfig-076-20240324   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240324   gcc  
xtensa                randconfig-002-20240324   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
