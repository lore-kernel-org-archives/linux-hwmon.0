Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59F1D5143
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Feb 2025 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611556; cv=none; b=XV6A2IZpFsSTh9+S4LZJQnzHXT9TU8b1Ysl0B27Famzwf5m3MwcMN6YU/5Pg3IYWvhRz9JIUDEkW0GmmkSs2tk9OXYZUqmyoVrbVDl9fP9xD4slZj3fDx3bbdUrdq6yOL/tx72eT6r8SM4IFXJ/hghAHXY+YdaRYj5Nu5SF1Xgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611556; c=relaxed/simple;
	bh=b6PfrYkvkch3BL4QJ9pHk0UzPrKgoBDpiVhfrR81ns8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FiHikGbJs9AsSzt9146XnC8vRsjWS7w11Mvz/marDMXTIsryFyQIXDe3N7D5X+jfJi49rYqp7S4nbO/NaWRqubSe2nyhNDue3U+bEGESmCO+vh3m6A1VmeIkDPjniLteldnACx1TbjJFVI5gteffkxKqVZXuX0p2eT1VLeCjuR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaGi1QQY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaGi1QQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738611554; x=1770147554;
  h=date:from:to:cc:subject:message-id;
  bh=b6PfrYkvkch3BL4QJ9pHk0UzPrKgoBDpiVhfrR81ns8=;
  b=GaGi1QQYsuXhHns2rj9MPggxWmRWtqGSqarleol8enM5DMk/CdQBiK7M
   XDw2wWG8kb6Lef3/t8a9lOPbZDqHNNJvwSxaNjtutn72mdlsztWdwp6d/
   0AbvLTc+Samo2kjmH+i55KKttHqZc6mEAHX/RmB/pGlMf/mPFfk3qKIAN
   gsjZO3qw6TSXM9fmeIHr32swxk+KaTv/5uZrMZaafv9IyEQuhKMRNstI3
   +2EhlbOFc1b5xxr2zlP1JSyAOs4Y09szuIEV0e4xGl+IrmHsw6u4P6Cbe
   SFpCJV0eoO5y2a1Ocq14FgMNs5B8qneH4NNuXh0KeEyZdYW63UvCfKn/9
   A==;
X-CSE-ConnectionGUID: NhjuppMoQSinCVHHQTRThQ==
X-CSE-MsgGUID: yOFf5w2pSsaJ5pRVhWWY3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39013179"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39013179"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:39:13 -0800
X-CSE-ConnectionGUID: a/VeHI3+S32/lZA0sr2D2w==
X-CSE-MsgGUID: cd/HK+seSTe/ZMS24jn5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115360952"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2025 11:39:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2Hm-000rOl-0E;
	Mon, 03 Feb 2025 19:39:10 +0000
Date: Tue, 04 Feb 2025 03:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 84426506171bcfe4eeba034ac167b3d7a4dec0f2
Message-ID: <202502040331.aopBdsh0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 84426506171bcfe4eeba034ac167b3d7a4dec0f2  hwmon: (peci/dimmtemp) Do not provide fake thresholds data

elapsed time: 1076m

configs tested: 239
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-14.1.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250203    gcc-13.2.0
arc                   randconfig-002-20250203    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.1.0
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-001-20250203    gcc-13.2.0
arm                   randconfig-002-20250203    gcc-13.2.0
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-003-20250203    gcc-13.2.0
arm                   randconfig-004-20250203    gcc-13.2.0
arm                   randconfig-004-20250203    gcc-14.2.0
arm                           u8500_defconfig    gcc-13.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-13.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-002-20250203    gcc-13.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-003-20250203    gcc-13.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-004-20250203    gcc-13.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250203    clang-21
hexagon               randconfig-001-20250203    gcc-14.2.0
hexagon               randconfig-002-20250203    clang-21
hexagon               randconfig-002-20250203    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-006-20250203    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250203    clang-19
i386                  randconfig-002-20250203    clang-19
i386                  randconfig-003-20250203    clang-19
i386                  randconfig-004-20250203    clang-19
i386                  randconfig-005-20250203    clang-19
i386                  randconfig-006-20250203    clang-19
i386                  randconfig-007-20250203    clang-19
i386                  randconfig-011-20250203    clang-19
i386                  randconfig-012-20250203    clang-19
i386                  randconfig-013-20250203    clang-19
i386                  randconfig-014-20250203    clang-19
i386                  randconfig-015-20250203    clang-19
i386                  randconfig-016-20250203    clang-19
i386                  randconfig-017-20250203    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-13.2.0
mips                           jazz_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250203    gcc-14.2.0
nios2                 randconfig-002-20250203    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250203    gcc-14.2.0
parisc                randconfig-002-20250203    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    clang-18
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250203    clang-21
powerpc               randconfig-001-20250203    gcc-14.2.0
powerpc               randconfig-002-20250203    clang-16
powerpc               randconfig-002-20250203    gcc-14.2.0
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-13.2.0
powerpc                     stx_gp3_defconfig    gcc-13.2.0
powerpc                     taishan_defconfig    gcc-13.2.0
powerpc                         wii_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    clang-18
powerpc64             randconfig-002-20250203    gcc-14.2.0
powerpc64             randconfig-003-20250203    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250203    clang-16
riscv                 randconfig-001-20250203    gcc-14.2.0
riscv                 randconfig-002-20250203    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-001-20250203    gcc-14.2.0
s390                  randconfig-002-20250203    clang-21
s390                  randconfig-002-20250203    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-001-20250203    gcc-14.2.0
um                    randconfig-002-20250203    clang-18
um                    randconfig-002-20250203    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-001-20250203    gcc-12
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-004-20250203    gcc-12
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250203    gcc-12
x86_64                randconfig-002-20250203    gcc-12
x86_64                randconfig-003-20250203    gcc-12
x86_64                randconfig-004-20250203    gcc-12
x86_64                randconfig-005-20250203    gcc-12
x86_64                randconfig-006-20250203    gcc-12
x86_64                randconfig-007-20250203    gcc-12
x86_64                randconfig-008-20250203    gcc-12
x86_64                randconfig-071-20250203    gcc-12
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250203    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250203    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250203    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250203    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250203    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250203    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250203    gcc-12
x86_64                randconfig-078-20250204    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
