Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344D02500C8
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Nov 2024 03:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732506952; cv=none; b=tJU3lb5JzPZpSiL9aNgDyrloUCmeOxRspvNi2Qbc+PJxBYdAwE+3Bk7xalvqKa9fvPO1lFDgwjvpTNym4yOKAFpQc8ZiPz8F+3OqmkK/fjuBV8bLIrmPKUQvo01KT7HcBXc9PQRc8ne2vu7Px5K40FyBcmPU67xSiP7jSXZoHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732506952; c=relaxed/simple;
	bh=kb85GNRpLSXP1VxYMfXNvS4wSUGaMNUcbyG564vGmsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YdKbEeZ+h2YhpMkq7KEf7/4ggrS+RvfQZyA49WGyHrkiEQsRt3CUAXTakQ1pvFPHMz3RCvT0J/ByyTrttgFnOYIlpq15u8KgaCjzO8K92a9+9j7YrSpTJNuebBXwWDV0sZd5Cg6yDRD/lJDk16NK4t4Nv0euT+Baa76OVCa/CqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1cdKm7C; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1cdKm7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732506950; x=1764042950;
  h=date:from:to:cc:subject:message-id;
  bh=kb85GNRpLSXP1VxYMfXNvS4wSUGaMNUcbyG564vGmsY=;
  b=c1cdKm7CuJ/DYsP03LQCKQsHEZx+5OJHddeicE2dpuChBs1Z53K9aghJ
   WSc6ILDcWYdm4twUWTYoNeYPVLssKavdjyzbNkM406kvmbjnqLkcieG+T
   uByEfuUBgp0Aa9jZAXgce84byZjtOpAHruPx4Y95A93bDbSawH2MlcNub
   9ym8zqljgdPxOV6ogCSdQgVixrE2tGKUvYb/36boZlfIddEqu1dWvAHfQ
   zl7D3fMFh2/SC9h2QkndtEKs+QO41OcAmjqdYcKmePR0r0ZUrcm12rR4a
   JBn60gZDOKdePMEKPg+SVTBqkUzggrIbgVkrzjDDSnrEQjWYVqacFy8PY
   w==;
X-CSE-ConnectionGUID: BZWMVhZESGe5i97kr0zj+A==
X-CSE-MsgGUID: s6f4iNVjSiGI/k/2F10iQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32535358"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32535358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 19:55:49 -0800
X-CSE-ConnectionGUID: vNDnmn2iSA6o4HeTHL0GeQ==
X-CSE-MsgGUID: 9H5ucTYkTeqYoxWrhhp30Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91038118"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Nov 2024 19:55:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFQCO-0005mn-1E;
	Mon, 25 Nov 2024 03:55:44 +0000
Date: Mon, 25 Nov 2024 11:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 998b5a78a9ce1cc4378e7281e4ea310e37596170
Message-ID: <202411251151.2x86bLSW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 998b5a78a9ce1cc4378e7281e4ea310e37596170  hwmon: (aquacomputer_d5next) Fix length of speed_input array

elapsed time: 722m

configs tested: 160
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241125    gcc-13.2.0
arc                   randconfig-002-20241125    gcc-13.2.0
arm                              alldefconfig    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    clang-20
arm                         at91_dt_defconfig    clang-20
arm                         axm55xx_defconfig    clang-20
arm                     davinci_all_defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-20
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-20
arm                         lpc18xx_defconfig    clang-20
arm                        multi_v7_defconfig    clang-20
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-20
arm                   randconfig-001-20241125    gcc-14.2.0
arm                   randconfig-002-20241125    gcc-14.2.0
arm                   randconfig-003-20241125    gcc-14.2.0
arm                   randconfig-004-20241125    clang-20
arm                           spitz_defconfig    clang-20
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241125    gcc-14.2.0
arm64                 randconfig-002-20241125    gcc-14.2.0
arm64                 randconfig-003-20241125    gcc-14.2.0
arm64                 randconfig-004-20241125    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241125    gcc-14.2.0
csky                  randconfig-002-20241125    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241125    clang-20
hexagon               randconfig-002-20241125    clang-16
i386        buildonly-randconfig-001-20241125    gcc-12
i386        buildonly-randconfig-002-20241125    clang-19
i386        buildonly-randconfig-003-20241125    clang-19
i386        buildonly-randconfig-004-20241125    clang-19
i386        buildonly-randconfig-005-20241125    clang-19
i386        buildonly-randconfig-006-20241125    clang-19
i386                  randconfig-001-20241125    gcc-12
i386                  randconfig-002-20241125    gcc-12
i386                  randconfig-003-20241125    gcc-12
i386                  randconfig-004-20241125    clang-19
i386                  randconfig-005-20241125    gcc-12
i386                  randconfig-006-20241125    clang-19
i386                  randconfig-011-20241125    clang-19
i386                  randconfig-012-20241125    clang-19
i386                  randconfig-013-20241125    gcc-12
i386                  randconfig-014-20241125    gcc-12
i386                  randconfig-015-20241125    gcc-12
i386                  randconfig-016-20241125    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241125    gcc-14.2.0
loongarch             randconfig-002-20241125    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    clang-20
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-13.2.0
mips                          ath79_defconfig    gcc-13.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-16
mips                       rbtx49xx_defconfig    clang-20
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241125    gcc-14.2.0
nios2                 randconfig-002-20241125    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20241125    gcc-14.2.0
parisc                randconfig-002-20241125    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                    amigaone_defconfig    clang-20
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                      pcm030_defconfig    clang-20
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241125    clang-20
powerpc               randconfig-002-20241125    gcc-14.2.0
powerpc               randconfig-003-20241125    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc                         wii_defconfig    clang-20
powerpc64             randconfig-001-20241125    clang-20
powerpc64             randconfig-002-20241125    gcc-14.2.0
powerpc64             randconfig-003-20241125    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241125    gcc-14.2.0
riscv                 randconfig-002-20241125    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241125    gcc-14.2.0
s390                  randconfig-002-20241125    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-13.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-13.2.0
sh                    randconfig-001-20241125    gcc-14.2.0
sh                    randconfig-002-20241125    gcc-14.2.0
sh                          sdk7780_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7724_defconfig    clang-20
sh                           se7751_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                             shx3_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241125    gcc-14.2.0
sparc64               randconfig-002-20241125    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                             i386_defconfig    clang-20
um                    randconfig-002-20241125    gcc-12
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241125    gcc-14.2.0
xtensa                randconfig-002-20241125    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
