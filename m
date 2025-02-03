Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954B1D5176
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Feb 2025 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590450; cv=none; b=lrArH3brn/B1BEPAfyakpkutegMXZYBdtlRETYr0ytcsFhGCwQtjVw/1hCRUFgLW9LByYoyBaKYn4JGhvaxfasrtc/wnX10Wy7hpiW7VBXm0GMGaJwfl/LmwS3JH/9FIDjU3p7YJIFJcj5aEetRdFiEThziBBztvyUK7Psz5J6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590450; c=relaxed/simple;
	bh=NtX06gFATHyrCECGyDsjNgJ8ascfo4ssQxngg+jI3sw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CAAWWYUtSNuIaTB5YwebmziHXSzor/vPdIhteInKvpjkqXn0wUDF5eqhTh5Hxk6byEmAyy2YafJPuWtT8dwAwK2sLWeKeI1CioKrxWQ0c2CXONd4gYlJf+7tvejtD8GjfvqgTRdW1s9tGN+3DGuMdTlyYgA1i7K8hAbZwTWHLZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzvEN6uG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzvEN6uG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738590448; x=1770126448;
  h=date:from:to:cc:subject:message-id;
  bh=NtX06gFATHyrCECGyDsjNgJ8ascfo4ssQxngg+jI3sw=;
  b=PzvEN6uGP/FK06mCLYePAO6KksFHhU3KeGPSd6EvW/7JxE6ANWBkAB3M
   gQLJ7MGmOCLWuR+bWUu653kyglffrBhust2S/e0iuwxrC28gOmq7wLHpx
   IpMdtJjnkdto37Bi1BdnqTl/E3g5MPn8Ll5CykNKH9evSZEK/g65URLYR
   XpT5NdCwwmElZczxYUkon22TaK8ZpiYoY1QgeNa5NLjDu7D1C2p6j9/Nn
   aMsu5uYve8OetzAA0EDQmqMQAAkgIbv1CkUuDla5qgPFwtnkRwPFJ+3Y9
   u1dzC7VXdHpcbE7Drjee5kFXcmaQobk3gCYZmOeI2F8GkAuEXadyu9zaH
   A==;
X-CSE-ConnectionGUID: qv+aX3qmSWSvtALkRMJ+5w==
X-CSE-MsgGUID: tp3+yA7MSMGPQasWQ8f6cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26683783"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="26683783"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:47:27 -0800
X-CSE-ConnectionGUID: 94vh4N1KSbKAlTqrqDEkaQ==
X-CSE-MsgGUID: rCEZqRCxSaeuXOWMFWsZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110855304"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 05:47:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tewnM-000qyD-0C;
	Mon, 03 Feb 2025 13:47:24 +0000
Date: Mon, 03 Feb 2025 21:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 bfbb730c4255e1965d202f48e7aa71baa9a7c65b
Message-ID: <202502032132.bb4ubrXv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: bfbb730c4255e1965d202f48e7aa71baa9a7c65b  hwmon: (sht3x) Use per-client debugfs entry

elapsed time: 724m

configs tested: 173
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-14.1.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250203    gcc-13.2.0
arc                   randconfig-002-20250203    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-19
arm                       netwinder_defconfig    gcc-14.1.0
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-004-20250203    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250203    clang-21
hexagon               randconfig-002-20250203    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-006-20250203    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250203    clang-19
i386                  randconfig-012-20250203    clang-19
i386                  randconfig-013-20250203    clang-19
i386                  randconfig-014-20250203    clang-19
i386                  randconfig-015-20250203    clang-19
i386                  randconfig-016-20250203    clang-19
i386                  randconfig-017-20250203    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                           jazz_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.2.0
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
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       ebony_defconfig    clang-18
powerpc                    gamecube_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc               randconfig-001-20250203    clang-21
powerpc               randconfig-002-20250203    clang-16
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    clang-17
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    clang-18
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
riscv                 randconfig-002-20250203    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-002-20250203    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
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
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-002-20250203    clang-18
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250203    gcc-12
x86_64                randconfig-072-20250203    gcc-12
x86_64                randconfig-073-20250203    gcc-12
x86_64                randconfig-074-20250203    gcc-12
x86_64                randconfig-075-20250203    gcc-12
x86_64                randconfig-076-20250203    gcc-12
x86_64                randconfig-077-20250203    gcc-12
x86_64                randconfig-078-20250203    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
