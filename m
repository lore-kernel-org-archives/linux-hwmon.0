Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81F17591
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 10:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183945; cv=none; b=i7qljSBES6fchG9xzyI19Z/fvB1P/eNjqJJt+3vlYgXfcdsvIb5BjuxUPuegTBtmTNz/2xrOgLC+A4P//Bs5sqoZjCzFDSWRz1MayAxXOegknRJop6K1P4PZHhmIubBdKyQHvbdQVqNLykhyglf893NyQ6pP7YQKoeTMNO/R9OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183945; c=relaxed/simple;
	bh=KKuRu7NME6MiOXrRV8OwWauiagPGLdYUhtO+is1Guq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LPLi6ucjDrKWIx3027cbJAaWEu/Idaf+BlC6AVj+ZeUQ5gOhieZteFq0cSwDiKoa6XjddxHHqYPShLDoQm1OfF/OQ8vehSty0zWklVqc7Ki3TFsGikzYrXPumBz1t9qd1c0+q+0bJ5lpmX96N69IqF+9iUHu9ttzmaeBpeWza/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ouxxl1vE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ouxxl1vE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739183943; x=1770719943;
  h=date:from:to:cc:subject:message-id;
  bh=KKuRu7NME6MiOXrRV8OwWauiagPGLdYUhtO+is1Guq0=;
  b=Ouxxl1vERGCRoH6yONnfnSk3UuVLGMmZG6Ctph6cfpsdX9JSoLTggghy
   SPUksbfuOsYx1SCGDgmiR1L3asKJWiaOt+56jtO6sKRHHX6IOKn9wldEO
   uYdarNesFSCOwt++I44UAYnutE1f6omlkXevuNCoLC7n5SZrekQDvOst2
   U29w6/1VIaH1lbzw9JbGeqNNfoGFb7vt/sJU+6wLUR01/q63YLB1QkyBO
   +UldzGntwTXq7Ls2L8WG3PMVS8KmgIT2HjHi4nJreBsIUbhYAs+6O1gf/
   eLr5APjVbhDO8ZtXnvGlAqjeO5pgOydiQJR5c12/KizXuA0hEmtBK6kVy
   w==;
X-CSE-ConnectionGUID: ARJmWY9mTH6hqqv8llXs0g==
X-CSE-MsgGUID: pQB+ESX3Q3KSiVZ2QbVrQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50741852"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50741852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:39:03 -0800
X-CSE-ConnectionGUID: IW6fXir3Sq+oxqtu9FEt5A==
X-CSE-MsgGUID: KtpS3tGBQceUP7uuKX7m1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="111917856"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2025 02:39:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thRBp-0012cZ-2i;
	Mon, 10 Feb 2025 10:38:57 +0000
Date: Mon, 10 Feb 2025 18:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 8df0f002827e18632dcd986f7546c1abf1953a6f
Message-ID: <202502101806.OBlZgfTo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8df0f002827e18632dcd986f7546c1abf1953a6f  hwmon: (xgene-hwmon) use appropriate type for the latency value

elapsed time: 728m

configs tested: 191
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-002-20250210    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-16
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-004-20250210    gcc-14.2.0
arm                             rpc_defconfig    clang-17
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-004-20250210    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250210    clang-21
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    clang-21
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
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
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    clang-21
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    clang-21
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250210    clang-21
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    clang-21
parisc                randconfig-002-20250210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       holly_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-18
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
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
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
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    clang-16
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-002-20250210    clang-16
sh                    randconfig-002-20250210    gcc-14.2.0
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
um                                allnoconfig    clang-21
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
