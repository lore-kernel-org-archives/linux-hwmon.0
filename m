Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932C2170A26
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Jun 2025 20:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760741; cv=none; b=jM/8OY3R8inrpTrJ5X2G43vWL/gkbYJP87XCfzc3vLFypN8qgI0hT6F7+hvozby/FxQxSEpWGqaTh6z5HF1bFbbCbAI/p9+8y2CG1D2jQqetixSuT2WyOByB2yNNyIdHjBIst4hlwgVHjyFWi3gA7lfVEkyxMOk51Je0abT2C2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760741; c=relaxed/simple;
	bh=3YwJBmPd2n7p3Aq63pMO6K9n1DNwGYa+Ty3NqbIohrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AoPAtMscmILmz7g/YKCfMWOaK8bWfrdiYeawTY2/18UNBslyf1EULhzv2pOIM9a4z6QhQM/aN5UqXfBrX51AXmKkSevBqMn9XXGFV7ROPyKTFLvSuAVnFkhAriCez5isZ0pXNITzIEE+z1dR5KdtLyOvQcDIdkVMhx70VHz4BAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O65uierZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O65uierZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749760740; x=1781296740;
  h=date:from:to:cc:subject:message-id;
  bh=3YwJBmPd2n7p3Aq63pMO6K9n1DNwGYa+Ty3NqbIohrg=;
  b=O65uierZY8KmbM7xYs1E1aBhZMmoC26OVH784Dw523tLpXhLwIrGjaEK
   fTQlaOgAtA2K+fgsaw+gOd8riZleVPhAV8KS4lhMj3n/ABfHo/1aDZa03
   dhLfZEKNf4XMS1NnmEf75KUgxkxgmZz4K/7ATc0acxq2yXKKRiiJ2Z22k
   bOGl9vJoLHrKFIUu4XDzi6TacunBa9h51BF2k74VWehU86wEgQgYldb9W
   uRy8X8VIbzHSHhgWyzY6vCOFZtOqCBSw8M2keF1LcQ6G+Fo8nXIiLne0t
   Rn4T+mTH3WAmSlhS0W4tHDRIvCYYtFQCCwvkOZYlwEsTIcdhX4odYwA36
   Q==;
X-CSE-ConnectionGUID: llf9naijRhWmz+KNV+qN6A==
X-CSE-MsgGUID: iTiBsFL0RIOn7znGWE+ajA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69406270"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="69406270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 13:38:59 -0700
X-CSE-ConnectionGUID: /0TM1ZpvTW2KsIgqzALRsw==
X-CSE-MsgGUID: vF+PttwwTC6UD4M6aCxbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="148182320"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2025 13:38:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPohL-000Bwg-1r;
	Thu, 12 Jun 2025 20:38:55 +0000
Date: Fri, 13 Jun 2025 04:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 e8d63ffe031f379814f0c13f72bf41815de4eca6
Message-ID: <202506130432.AAaz1QBC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: e8d63ffe031f379814f0c13f72bf41815de4eca6  hwmon: (ltc4282) fix copy paste on variable name

elapsed time: 1376m

configs tested: 233
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250612    gcc-8.5.0
arc                   randconfig-002-20250612    gcc-10.5.0
arc                   randconfig-002-20250612    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                         assabet_defconfig    clang-21
arm                         bcm2835_defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm                      footbridge_defconfig    clang-21
arm                         lpc18xx_defconfig    clang-21
arm                        multi_v7_defconfig    clang-21
arm                   randconfig-001-20250612    clang-21
arm                   randconfig-001-20250612    gcc-8.5.0
arm                   randconfig-002-20250612    clang-18
arm                   randconfig-002-20250612    gcc-8.5.0
arm                   randconfig-003-20250612    clang-21
arm                   randconfig-003-20250612    gcc-8.5.0
arm                   randconfig-004-20250612    clang-21
arm                   randconfig-004-20250612    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250612    clang-19
arm64                 randconfig-001-20250612    gcc-8.5.0
arm64                 randconfig-002-20250612    clang-17
arm64                 randconfig-002-20250612    gcc-8.5.0
arm64                 randconfig-003-20250612    clang-21
arm64                 randconfig-003-20250612    gcc-8.5.0
arm64                 randconfig-004-20250612    clang-18
arm64                 randconfig-004-20250612    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250612    gcc-10.5.0
csky                  randconfig-001-20250612    gcc-11.5.0
csky                  randconfig-002-20250612    gcc-10.5.0
csky                  randconfig-002-20250612    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250612    clang-21
hexagon               randconfig-001-20250612    gcc-10.5.0
hexagon               randconfig-002-20250612    clang-21
hexagon               randconfig-002-20250612    gcc-10.5.0
i386                             alldefconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250612    clang-20
i386        buildonly-randconfig-002-20250612    clang-20
i386        buildonly-randconfig-002-20250612    gcc-12
i386        buildonly-randconfig-003-20250612    clang-20
i386        buildonly-randconfig-004-20250612    clang-20
i386        buildonly-randconfig-005-20250612    clang-20
i386        buildonly-randconfig-006-20250612    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250612    gcc-12
i386                  randconfig-002-20250612    gcc-12
i386                  randconfig-003-20250612    gcc-12
i386                  randconfig-004-20250612    gcc-12
i386                  randconfig-005-20250612    gcc-12
i386                  randconfig-006-20250612    gcc-12
i386                  randconfig-007-20250612    gcc-12
i386                  randconfig-011-20250612    gcc-12
i386                  randconfig-012-20250612    gcc-12
i386                  randconfig-013-20250612    gcc-12
i386                  randconfig-014-20250612    gcc-12
i386                  randconfig-015-20250612    gcc-12
i386                  randconfig-016-20250612    gcc-12
i386                  randconfig-017-20250612    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250612    gcc-10.5.0
loongarch             randconfig-001-20250612    gcc-13.3.0
loongarch             randconfig-002-20250612    gcc-10.5.0
loongarch             randconfig-002-20250612    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250612    gcc-10.5.0
nios2                 randconfig-001-20250612    gcc-14.2.0
nios2                 randconfig-002-20250612    gcc-10.5.0
nios2                 randconfig-002-20250612    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250612    gcc-10.5.0
parisc                randconfig-001-20250612    gcc-8.5.0
parisc                randconfig-002-20250612    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        cell_defconfig    clang-21
powerpc                      ep88xc_defconfig    clang-21
powerpc                     mpc512x_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    clang-21
powerpc               randconfig-001-20250612    clang-21
powerpc               randconfig-001-20250612    gcc-10.5.0
powerpc               randconfig-002-20250612    gcc-10.5.0
powerpc               randconfig-002-20250612    gcc-8.5.0
powerpc               randconfig-003-20250612    clang-17
powerpc               randconfig-003-20250612    gcc-10.5.0
powerpc64             randconfig-001-20250612    gcc-10.5.0
powerpc64             randconfig-001-20250612    gcc-12.4.0
powerpc64             randconfig-002-20250612    clang-21
powerpc64             randconfig-002-20250612    gcc-10.5.0
powerpc64             randconfig-003-20250612    clang-21
powerpc64             randconfig-003-20250612    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250612    clang-21
riscv                 randconfig-001-20250612    gcc-12.4.0
riscv                 randconfig-002-20250612    clang-21
riscv                 randconfig-002-20250612    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250612    clang-21
s390                  randconfig-001-20250612    gcc-12.4.0
s390                  randconfig-002-20250612    gcc-11.5.0
s390                  randconfig-002-20250612    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-15.1.0
sh                   sh7770_generic_defconfig    clang-21
sh                  sh7785lcr_32bit_defconfig    clang-21
sh                            titan_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250612    gcc-12.4.0
sparc                 randconfig-001-20250612    gcc-14.3.0
sparc                 randconfig-002-20250612    gcc-10.3.0
sparc                 randconfig-002-20250612    gcc-12.4.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250612    gcc-12.4.0
sparc64               randconfig-001-20250612    gcc-13.3.0
sparc64               randconfig-002-20250612    gcc-12.4.0
sparc64               randconfig-002-20250612    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250612    clang-17
um                    randconfig-001-20250612    gcc-12.4.0
um                    randconfig-002-20250612    clang-21
um                    randconfig-002-20250612    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250612    clang-20
x86_64      buildonly-randconfig-001-20250612    gcc-12
x86_64      buildonly-randconfig-002-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    gcc-12
x86_64      buildonly-randconfig-004-20250612    clang-20
x86_64      buildonly-randconfig-004-20250612    gcc-12
x86_64      buildonly-randconfig-005-20250612    clang-20
x86_64      buildonly-randconfig-006-20250612    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250612    clang-20
x86_64                randconfig-001-20250613    gcc-12
x86_64                randconfig-002-20250612    clang-20
x86_64                randconfig-002-20250613    gcc-12
x86_64                randconfig-003-20250612    clang-20
x86_64                randconfig-003-20250613    gcc-12
x86_64                randconfig-004-20250612    clang-20
x86_64                randconfig-004-20250613    gcc-12
x86_64                randconfig-005-20250612    clang-20
x86_64                randconfig-005-20250613    gcc-12
x86_64                randconfig-006-20250612    clang-20
x86_64                randconfig-006-20250613    gcc-12
x86_64                randconfig-007-20250612    clang-20
x86_64                randconfig-007-20250613    gcc-12
x86_64                randconfig-008-20250612    clang-20
x86_64                randconfig-008-20250613    gcc-12
x86_64                randconfig-071-20250612    gcc-12
x86_64                randconfig-072-20250612    gcc-12
x86_64                randconfig-073-20250612    gcc-12
x86_64                randconfig-074-20250612    gcc-12
x86_64                randconfig-075-20250612    gcc-12
x86_64                randconfig-076-20250612    gcc-12
x86_64                randconfig-077-20250612    gcc-12
x86_64                randconfig-078-20250612    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250612    gcc-10.5.0
xtensa                randconfig-001-20250612    gcc-12.4.0
xtensa                randconfig-002-20250612    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
