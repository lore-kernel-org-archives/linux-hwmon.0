Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23DAAD2D
	for <linux-hwmon@vger.kernel.org>; Sun, 11 Feb 2024 19:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707681071; cv=none; b=Cdj2+I/KsZVmZrNF0cN1Nz484//uVeZZQ6Q3zsiMp/L5nM5KRrd8JN+aoAWIz07cdY+q50Dg56TBjn+pUxLkc6grflzhOotpnBlXOX6gRGkuY9ksc3uew4049F9hsuc9WWVM1GJZKxxgj4R1Un10JUPozamFfRwS25DduDc5QzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707681071; c=relaxed/simple;
	bh=HNRoi8DQBrSJdGe9Oo0NtdPNmsoKHxsIQEdfv3l2n2o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QztooyXDZlx8aSBgzETo6pc19k23EUxq0mS9dumS6v7G1UlV/KUQlzkJyTZ3tgjmzDpC4hc7qZstB1E8jHX/PJYlyZEpk1sAUcSfTa8nKwUJFAiYfCkShSPYHGyCzFdNy4f4kwm0UK+Lq791lX6nH465ot37tNv1QmFCIvzUDnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGAMpUbW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGAMpUbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707681069; x=1739217069;
  h=date:from:to:cc:subject:message-id;
  bh=HNRoi8DQBrSJdGe9Oo0NtdPNmsoKHxsIQEdfv3l2n2o=;
  b=GGAMpUbWKLdfQ7x6zwHDtFk9FyltCgqfc4Uiq1S9GsuwvI9PML88FOC4
   Bz+OD0Rj8DsFAU/+GEHv6+j9CRAm+M0gTfyIlpVJ0DlqtD1HJBVlW5Kir
   AUXGgP5frH/5YGcfKvjPbMV2STq60AFPzwmZEoYVM0qgpULM5ejSq73uu
   cSb/rafEHLpTjRS4wu9Fu52DHg7rvV6qiR5zUOvc2rtxmvTjK1w+MVbLn
   nMEtBopOiSVatpPnoklVHwzzF6ajj7Ga3Sh8xBuF12VurU9XMHOii4lLg
   bOxPp4sBqSFqPZ/xVoTFqKPED4RMW1OoSxymYpFagb6GUqDtV5AhbwBOi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="27095563"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="27095563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 11:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="7044778"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2024 11:51:07 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZFqy-0006kX-2F;
	Sun, 11 Feb 2024 19:51:04 +0000
Date: Mon, 12 Feb 2024 03:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-playground] BUILD SUCCESS
 0d5f15f790fe549590fd8d40593b340fb010fc12
Message-ID: <202402120347.3bdZX42m-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
branch HEAD: 0d5f15f790fe549590fd8d40593b340fb010fc12  Merge branch 'hwmon-debugfs' into hwmon-playground

elapsed time: 1445m

configs tested: 186
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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240211   gcc  
arc                   randconfig-002-20240211   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                   randconfig-001-20240211   clang
arm                   randconfig-002-20240211   clang
arm                   randconfig-003-20240211   gcc  
arm                   randconfig-004-20240211   gcc  
arm                        spear3xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240211   clang
arm64                 randconfig-002-20240211   gcc  
arm64                 randconfig-003-20240211   gcc  
arm64                 randconfig-004-20240211   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240211   gcc  
csky                  randconfig-002-20240211   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240211   clang
hexagon               randconfig-002-20240211   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240211   clang
i386         buildonly-randconfig-002-20240211   gcc  
i386         buildonly-randconfig-003-20240211   clang
i386         buildonly-randconfig-004-20240211   gcc  
i386         buildonly-randconfig-005-20240211   gcc  
i386         buildonly-randconfig-006-20240211   clang
i386                                defconfig   clang
i386                  randconfig-001-20240211   gcc  
i386                  randconfig-002-20240211   gcc  
i386                  randconfig-003-20240211   gcc  
i386                  randconfig-004-20240211   clang
i386                  randconfig-005-20240211   gcc  
i386                  randconfig-006-20240211   clang
i386                  randconfig-011-20240211   clang
i386                  randconfig-012-20240211   gcc  
i386                  randconfig-013-20240211   clang
i386                  randconfig-014-20240211   clang
i386                  randconfig-015-20240211   clang
i386                  randconfig-016-20240211   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240211   gcc  
loongarch             randconfig-002-20240211   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240211   gcc  
nios2                 randconfig-002-20240211   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240211   gcc  
parisc                randconfig-002-20240211   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                        fsp2_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240211   gcc  
powerpc               randconfig-002-20240211   clang
powerpc               randconfig-003-20240211   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240211   clang
powerpc64             randconfig-002-20240211   gcc  
powerpc64             randconfig-003-20240211   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240211   gcc  
riscv                 randconfig-002-20240211   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240211   clang
s390                  randconfig-002-20240211   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20240211   gcc  
sh                    randconfig-002-20240211   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240211   gcc  
sparc64               randconfig-002-20240211   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240211   gcc  
um                    randconfig-002-20240211   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240211   gcc  
x86_64       buildonly-randconfig-002-20240211   clang
x86_64       buildonly-randconfig-003-20240211   clang
x86_64       buildonly-randconfig-004-20240211   clang
x86_64       buildonly-randconfig-005-20240211   gcc  
x86_64       buildonly-randconfig-006-20240211   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240211   gcc  
x86_64                randconfig-002-20240211   clang
x86_64                randconfig-003-20240211   clang
x86_64                randconfig-004-20240211   clang
x86_64                randconfig-005-20240211   gcc  
x86_64                randconfig-006-20240211   clang
x86_64                randconfig-011-20240211   clang
x86_64                randconfig-012-20240211   clang
x86_64                randconfig-013-20240211   gcc  
x86_64                randconfig-014-20240211   gcc  
x86_64                randconfig-015-20240211   clang
x86_64                randconfig-016-20240211   gcc  
x86_64                randconfig-071-20240211   gcc  
x86_64                randconfig-072-20240211   gcc  
x86_64                randconfig-073-20240211   gcc  
x86_64                randconfig-074-20240211   clang
x86_64                randconfig-075-20240211   clang
x86_64                randconfig-076-20240211   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240211   gcc  
xtensa                randconfig-002-20240211   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
