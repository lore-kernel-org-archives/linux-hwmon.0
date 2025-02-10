Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEE01E570E
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182982; cv=none; b=k+F5NOJYxbgBXhWwRDbryspxRnH0Rxny/g7w1VvgQTNHmxSfy+f0K1skhDLw2k3mBNsOxyD5xTgzMmIxm1kYW48XEd0bOTVXxJFEGD3+xK7IwmHacPKM7WIHFAplniGhdcgLsprbvUPLlDabfwj1vTXXl1/ZSI7nEPZS1t1llZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182982; c=relaxed/simple;
	bh=Ozz7jpUa87yTeKvPcOHYVHRk5/sco8N2y3wqlW+eUYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VT0u56eamSQQSF1WGI//g3xwcjyJBbEx0RbtAmNwAOjnB9OYVYds+lxuhzStHO9sFXtvyFZsuckTyb0cRBm+tW1DMeMO2aA16Mk3iwoc0fG43qincS5gju5Hl67Cq1vTCPkccSYbS8H0PNX6WrqeOJCCwHjBZxoDhebK4opprc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHwmUy9I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHwmUy9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739182981; x=1770718981;
  h=date:from:to:cc:subject:message-id;
  bh=Ozz7jpUa87yTeKvPcOHYVHRk5/sco8N2y3wqlW+eUYM=;
  b=BHwmUy9IDRO7pdWrgjI10mku1gUbob9A04uZ4H27vxYKNQfuxHM2Gnrf
   CiQNpJ19eRLY0zv6F7QJ5t/kkOugvYA9XE4GahXfrEiuI81PZUDYF5Kkk
   DwljalBO5fxkCPD191W9GfRk4txwBS2If1qe3x5yHvo3dRCy8/zpKlBmR
   3nX/fxKbqiEYtCUvqnMWMYU7zxyR1stpbIiGmEx8hFimWhfYC0UwS1MLX
   u9WM0kwpl7OrOyQybc3CmL0w/FGxDFipdKBcged30sYHvKz2WgvpS1uty
   95VCLc5Ds5f4qa4cjhhRRvngNF+P76Nl3J7LyW6HsVUd/PRpZ7Lj3IrlJ
   A==;
X-CSE-ConnectionGUID: ur27PlDjQZ+M47OM5Cb6dg==
X-CSE-MsgGUID: /7l8GJ32QV64AI6EKxjKcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="27361229"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="27361229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:23:00 -0800
X-CSE-ConnectionGUID: UToK3cpIRc6PIk1U2khQ9g==
X-CSE-MsgGUID: sWwBs5NORLCMNuasBvt+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="143014936"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2025 02:22:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thQwJ-0012ap-2T;
	Mon, 10 Feb 2025 10:22:55 +0000
Date: Mon, 10 Feb 2025 18:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 0c1bca1a6d74b2b2100bf23a5ee781b661a3dd10
Message-ID: <202502101810.uB9u4Cuv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 0c1bca1a6d74b2b2100bf23a5ee781b661a3dd10  Merge branch 'fixes-v6.14' into testing

elapsed time: 780m

configs tested: 189
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-002-20250210    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-004-20250210    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    clang-19
arm                           spitz_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-004-20250210    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250210    clang-21
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    clang-21
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250210    clang-21
hexagon               randconfig-002-20250210    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250210    gcc-12
i386                  randconfig-012-20250210    gcc-12
i386                  randconfig-013-20250210    gcc-12
i386                  randconfig-014-20250210    gcc-12
i386                  randconfig-015-20250210    gcc-12
i386                  randconfig-016-20250210    gcc-12
i386                  randconfig-017-20250210    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250210    clang-21
loongarch             randconfig-001-20250210    gcc-14.2.0
loongarch             randconfig-002-20250210    clang-21
loongarch             randconfig-002-20250210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-21
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    clang-21
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    clang-21
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250210    clang-21
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    clang-21
parisc                randconfig-002-20250210    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-18
powerpc                      mgcoge_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250210    clang-21
powerpc               randconfig-002-20250210    clang-21
powerpc               randconfig-003-20250210    clang-21
powerpc               randconfig-003-20250210    gcc-14.2.0
powerpc64             randconfig-001-20250210    clang-21
powerpc64             randconfig-001-20250210    gcc-14.2.0
powerpc64             randconfig-002-20250210    clang-21
powerpc64             randconfig-002-20250210    gcc-14.2.0
powerpc64             randconfig-003-20250210    clang-21
powerpc64             randconfig-003-20250210    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250210    clang-16
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-002-20250210    clang-16
riscv                 randconfig-002-20250210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250210    clang-16
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-002-20250210    clang-16
s390                  randconfig-002-20250210    clang-19
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    clang-16
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-002-20250210    clang-16
sh                    randconfig-002-20250210    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250210    clang-16
sparc                 randconfig-001-20250210    gcc-14.2.0
sparc                 randconfig-002-20250210    clang-16
sparc                 randconfig-002-20250210    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250210    clang-16
sparc64               randconfig-001-20250210    gcc-14.2.0
sparc64               randconfig-002-20250210    clang-16
sparc64               randconfig-002-20250210    gcc-14.2.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250210    clang-16
um                    randconfig-001-20250210    clang-18
um                    randconfig-002-20250210    clang-16
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250210    clang-19
x86_64                randconfig-002-20250210    clang-19
x86_64                randconfig-003-20250210    clang-19
x86_64                randconfig-004-20250210    clang-19
x86_64                randconfig-005-20250210    clang-19
x86_64                randconfig-006-20250210    clang-19
x86_64                randconfig-007-20250210    clang-19
x86_64                randconfig-008-20250210    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    clang-16
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-002-20250210    clang-16
xtensa                randconfig-002-20250210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
