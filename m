Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6130E79E1
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Aug 2024 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723906546; cv=none; b=SMno/QP7qhlDjxNJtL3odwuE9tqXJbDYiKuGjuFm2kUVev4pdYbHeiJ4RJTInmFCGgbxMf3EhYs2F8Rh9tvps2LiA1l8Qj9rEHscWAp6QFZhGDsWGiBra5j6gRyMWYSAsQrF5p0WWWYB08UmkYzaqsC56FcQXrcSuDvLVFceTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723906546; c=relaxed/simple;
	bh=05sKcNLJHzfM3A+AVJ191tMTBlkJLQxPYu4reHDkDi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o6UXnDT9iO35ArFaI+N0oB1AGb0wFxmU9G0gCzCXHoCJ9DBusFYhxTn4RxbdtzcyVwyJ/itClGc0R1ZUrZgRiksjrBJ+6XYXoBFAddfSvl4fW/aSI6aYFN/FMA56Q8K6SCwZ2vWE6iSLn9ittVBECZxaqCuwGezScd0eB5TQR2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfdecI0/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfdecI0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723906543; x=1755442543;
  h=date:from:to:cc:subject:message-id;
  bh=05sKcNLJHzfM3A+AVJ191tMTBlkJLQxPYu4reHDkDi0=;
  b=nfdecI0/UQGcxY2gZoXFgYkkYKIeeUfCP0eAw0YGJLtSyfz3U5bkS5Jb
   rNhomEXAVERr0QS7zHITCecM7a2ZAuO+1GKFERU0o+NYHdbad5XfPyS0T
   n1l8O6L3TTz0/l0iA7sLZFprMvr5qazvBOVjjGrzKCwXXK4Q21eQkyzFX
   TF2yLmmeiTD3UfVF8t0HtghEikygXEZwUFp/8f6u1/qwe+z70bjA2/E3h
   Cq/CmBYA/k5I1vQqZryWf4A+uFST9TCa7TNvmgF8OQyvxA6owjyJbsa0f
   4Ceq3H2CeK3gxJ9Ij4U8OEOU6S1HaYE2przLmmfcy1h3/acpFSqnzY5zL
   Q==;
X-CSE-ConnectionGUID: qbQpNSaZQT2J1h6e7r9+dA==
X-CSE-MsgGUID: G7DNacJQSeusPtYVW2Ihkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="44709636"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="44709636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 07:55:43 -0700
X-CSE-ConnectionGUID: zrhfUzRbREOBwNCTbEZqqQ==
X-CSE-MsgGUID: jbpdp8WYRzqerD3mDVDPsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="59586194"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2024 07:55:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfKqB-0007Z4-2G;
	Sat, 17 Aug 2024 14:55:39 +0000
Date: Sat, 17 Aug 2024 22:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 df9686ab8ee94af8cd8bcde9cec66ef20913e4fb
Message-ID: <202408172200.7t8WUcBU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: df9686ab8ee94af8cd8bcde9cec66ef20913e4fb  hwmon: (ntc_thermistor) fix module autoloading

elapsed time: 1438m

configs tested: 197
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240817   gcc-13.2.0
arc                   randconfig-002-20240817   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                        clps711x_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                         lpc32xx_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                   randconfig-001-20240817   gcc-13.2.0
arm                   randconfig-002-20240817   gcc-13.2.0
arm                   randconfig-003-20240817   gcc-13.2.0
arm                   randconfig-004-20240817   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                       spear13xx_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240817   gcc-13.2.0
arm64                 randconfig-002-20240817   gcc-13.2.0
arm64                 randconfig-003-20240817   gcc-13.2.0
arm64                 randconfig-004-20240817   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240817   gcc-13.2.0
csky                  randconfig-002-20240817   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240817   gcc-12
i386         buildonly-randconfig-002-20240817   gcc-12
i386         buildonly-randconfig-003-20240817   clang-18
i386         buildonly-randconfig-003-20240817   gcc-12
i386         buildonly-randconfig-004-20240817   gcc-12
i386         buildonly-randconfig-005-20240817   clang-18
i386         buildonly-randconfig-005-20240817   gcc-12
i386         buildonly-randconfig-006-20240817   clang-18
i386         buildonly-randconfig-006-20240817   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240817   gcc-12
i386                  randconfig-002-20240817   gcc-12
i386                  randconfig-003-20240817   gcc-12
i386                  randconfig-004-20240817   clang-18
i386                  randconfig-004-20240817   gcc-12
i386                  randconfig-005-20240817   gcc-12
i386                  randconfig-006-20240817   clang-18
i386                  randconfig-006-20240817   gcc-12
i386                  randconfig-011-20240817   gcc-12
i386                  randconfig-012-20240817   clang-18
i386                  randconfig-012-20240817   gcc-12
i386                  randconfig-013-20240817   gcc-12
i386                  randconfig-014-20240817   gcc-12
i386                  randconfig-015-20240817   gcc-12
i386                  randconfig-016-20240817   clang-18
i386                  randconfig-016-20240817   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240817   gcc-13.2.0
loongarch             randconfig-002-20240817   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                           rs90_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240817   gcc-13.2.0
nios2                 randconfig-002-20240817   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240817   gcc-13.2.0
parisc                randconfig-002-20240817   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240817   gcc-13.2.0
powerpc               randconfig-002-20240817   gcc-13.2.0
powerpc                     skiroot_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240817   gcc-13.2.0
powerpc64             randconfig-002-20240817   gcc-13.2.0
powerpc64             randconfig-003-20240817   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240817   gcc-13.2.0
riscv                 randconfig-002-20240817   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240817   gcc-13.2.0
s390                  randconfig-002-20240817   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240817   gcc-13.2.0
sh                    randconfig-002-20240817   gcc-13.2.0
sh                             sh03_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240817   gcc-13.2.0
sparc64               randconfig-002-20240817   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240817   gcc-13.2.0
um                    randconfig-002-20240817   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240817   gcc-12
x86_64       buildonly-randconfig-002-20240817   gcc-12
x86_64       buildonly-randconfig-003-20240817   gcc-12
x86_64       buildonly-randconfig-004-20240817   gcc-12
x86_64       buildonly-randconfig-005-20240817   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240817   gcc-12
x86_64                randconfig-002-20240817   gcc-12
x86_64                randconfig-003-20240817   gcc-12
x86_64                randconfig-004-20240817   gcc-12
x86_64                randconfig-005-20240817   gcc-12
x86_64                randconfig-006-20240817   gcc-12
x86_64                randconfig-011-20240817   gcc-12
x86_64                randconfig-012-20240817   gcc-12
x86_64                randconfig-013-20240817   gcc-12
x86_64                randconfig-014-20240817   gcc-12
x86_64                randconfig-015-20240817   gcc-12
x86_64                randconfig-016-20240817   gcc-12
x86_64                randconfig-071-20240817   gcc-12
x86_64                randconfig-072-20240817   gcc-12
x86_64                randconfig-073-20240817   gcc-12
x86_64                randconfig-074-20240817   gcc-12
x86_64                randconfig-075-20240817   gcc-12
x86_64                randconfig-076-20240817   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240817   gcc-13.2.0
xtensa                randconfig-002-20240817   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
