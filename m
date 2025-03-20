Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58386352
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Mar 2025 23:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742514749; cv=none; b=m4ZA2MGadTEsKeCXThjdfVTGR8u5TnfUKeqyP7kRsHpjM5WcwaRNrLoCXlZ9zkjEx1D+e6DKAnNSFEvMWnnafv+HArJbn+bh+nL0yy6vCSWJ2psWeW2pxy+tvQZ1J97Xpd4oRHV1x0fbceF8VXbO8k3Wgp5AXiaVll8qLmz1Mdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742514749; c=relaxed/simple;
	bh=hvpLdyH6agyklPhPCvecTfBODKTiJ9uohNNff3c9I3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cmoiN4sCT6olOAR33AIf2OFJq/KeIegjzkTIBVah779QeDws5TbcDLEfzXZeu1FtnNukA94oUNW1fPTAKhTp9+DKluOncV0Uw/d7C82xR7+3Fxuw/l2h3NS90Eg2wuFolpWRzDCG54UbYeOshkegK+IPhDnDQBllqn8kaWRXpWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+WYfy20; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+WYfy20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742514748; x=1774050748;
  h=date:from:to:cc:subject:message-id;
  bh=hvpLdyH6agyklPhPCvecTfBODKTiJ9uohNNff3c9I3k=;
  b=W+WYfy20Ey+H+jczbyBA8iLcEf4h9xFj+8BdGYYJOSu1hgPa4eQc5JHg
   UtIyDdeke0M7YmV1hFnW51mrhzutk1FR3JTCVDyJW+vzeCocZ+TWiY0cf
   PldEuf/xkZNFgLLNXyBu1Au5x7LCWsY2EQEVZ7YSTWQudJIoUNZ2hfGPl
   ou2Lt9vb0ODfCVY8K08+9mJwcnpoe/8kyJgPQNCTNsvbGV9JpudQhmPQI
   UONFir2jR7HMVH2R5Wf1/xkGn8B3dhGY93W2YZ24oxBLeDGxz4VzWQJ3F
   sgNqiVZeOe4wTtNRy86Exq1LbuoR5QU2VjGz/XalFau8p+KOvXlagBmy5
   w==;
X-CSE-ConnectionGUID: OxRFuzqtReC0pBjkfMCygg==
X-CSE-MsgGUID: mAwc/80XTWm9EFI/La72kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43019300"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="43019300"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 16:52:27 -0700
X-CSE-ConnectionGUID: iaW5BfWsQDqrxQQferV/Tw==
X-CSE-MsgGUID: 5eMemNSUTpGVh+VlLbSmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="128309157"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Mar 2025 16:52:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvPgU-0000sF-2D;
	Thu, 20 Mar 2025 23:52:22 +0000
Date: Fri, 21 Mar 2025 07:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 c812cc42f92d3d0b17c01b5db9a1dee5793a1491
Message-ID: <202503210749.E0E4yyAr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c812cc42f92d3d0b17c01b5db9a1dee5793a1491  hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register

elapsed time: 1451m

configs tested: 235
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                   randconfig-001-20250320    gcc-10.5.0
arc                   randconfig-001-20250321    clang-21
arc                   randconfig-002-20250320    gcc-8.5.0
arc                   randconfig-002-20250321    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                   randconfig-001-20250320    clang-20
arm                   randconfig-001-20250321    clang-21
arm                   randconfig-002-20250320    clang-16
arm                   randconfig-002-20250321    clang-21
arm                   randconfig-003-20250320    gcc-8.5.0
arm                   randconfig-003-20250321    clang-21
arm                   randconfig-004-20250320    gcc-7.5.0
arm                   randconfig-004-20250321    clang-21
arm                           sama7_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250320    clang-21
arm64                 randconfig-001-20250321    clang-21
arm64                 randconfig-002-20250320    clang-21
arm64                 randconfig-002-20250321    clang-21
arm64                 randconfig-003-20250320    clang-19
arm64                 randconfig-003-20250321    clang-21
arm64                 randconfig-004-20250320    gcc-8.5.0
arm64                 randconfig-004-20250321    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250320    gcc-10.5.0
csky                  randconfig-001-20250321    gcc-7.5.0
csky                  randconfig-002-20250320    gcc-14.2.0
csky                  randconfig-002-20250321    gcc-7.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250320    clang-18
hexagon               randconfig-001-20250321    gcc-7.5.0
hexagon               randconfig-002-20250320    clang-21
hexagon               randconfig-002-20250321    gcc-7.5.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250320    gcc-12
i386        buildonly-randconfig-002-20250320    clang-20
i386        buildonly-randconfig-003-20250320    clang-20
i386        buildonly-randconfig-004-20250320    clang-20
i386        buildonly-randconfig-005-20250320    gcc-12
i386        buildonly-randconfig-006-20250320    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250321    clang-20
i386                  randconfig-002-20250321    clang-20
i386                  randconfig-003-20250321    clang-20
i386                  randconfig-004-20250321    clang-20
i386                  randconfig-005-20250321    clang-20
i386                  randconfig-006-20250321    clang-20
i386                  randconfig-007-20250321    clang-20
i386                  randconfig-011-20250321    clang-20
i386                  randconfig-012-20250321    clang-20
i386                  randconfig-013-20250321    clang-20
i386                  randconfig-014-20250321    clang-20
i386                  randconfig-015-20250321    clang-20
i386                  randconfig-016-20250321    clang-20
i386                  randconfig-017-20250321    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250320    gcc-14.2.0
loongarch             randconfig-001-20250321    gcc-7.5.0
loongarch             randconfig-002-20250320    gcc-12.4.0
loongarch             randconfig-002-20250321    gcc-7.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-6.5.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-9.3.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250320    gcc-6.5.0
nios2                 randconfig-001-20250321    gcc-7.5.0
nios2                 randconfig-002-20250320    gcc-12.4.0
nios2                 randconfig-002-20250321    gcc-7.5.0
openrisc                          allnoconfig    clang-15
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250320    gcc-13.3.0
parisc                randconfig-001-20250321    gcc-7.5.0
parisc                randconfig-002-20250320    gcc-11.5.0
parisc                randconfig-002-20250321    gcc-7.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                          allyesconfig    clang-21
powerpc                     mpc83xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250320    gcc-6.5.0
powerpc               randconfig-001-20250321    gcc-7.5.0
powerpc               randconfig-002-20250320    clang-21
powerpc               randconfig-002-20250321    gcc-7.5.0
powerpc               randconfig-003-20250320    clang-21
powerpc               randconfig-003-20250321    gcc-7.5.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250320    clang-21
powerpc64             randconfig-001-20250321    gcc-7.5.0
powerpc64             randconfig-002-20250320    gcc-8.5.0
powerpc64             randconfig-002-20250321    gcc-7.5.0
powerpc64             randconfig-003-20250320    clang-21
powerpc64             randconfig-003-20250321    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-15
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250320    clang-21
riscv                 randconfig-001-20250321    gcc-6.5.0
riscv                 randconfig-002-20250320    gcc-8.5.0
riscv                 randconfig-002-20250321    gcc-6.5.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                             allyesconfig    gcc-8.5.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250320    gcc-6.5.0
s390                  randconfig-001-20250321    gcc-6.5.0
s390                  randconfig-002-20250320    gcc-7.5.0
s390                  randconfig-002-20250321    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                               allmodconfig    gcc-9.3.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                               allyesconfig    gcc-7.5.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250320    gcc-14.2.0
sh                    randconfig-001-20250321    gcc-6.5.0
sh                    randconfig-002-20250320    gcc-10.5.0
sh                    randconfig-002-20250321    gcc-6.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250320    gcc-7.5.0
sparc                 randconfig-001-20250321    gcc-6.5.0
sparc                 randconfig-002-20250320    gcc-7.5.0
sparc                 randconfig-002-20250321    gcc-6.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250320    gcc-5.5.0
sparc64               randconfig-001-20250321    gcc-6.5.0
sparc64               randconfig-002-20250320    gcc-13.3.0
sparc64               randconfig-002-20250321    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250320    gcc-12
um                    randconfig-001-20250321    gcc-6.5.0
um                    randconfig-002-20250320    clang-16
um                    randconfig-002-20250321    gcc-6.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250320    clang-20
x86_64      buildonly-randconfig-001-20250321    clang-20
x86_64      buildonly-randconfig-002-20250320    gcc-12
x86_64      buildonly-randconfig-002-20250321    clang-20
x86_64      buildonly-randconfig-003-20250320    clang-20
x86_64      buildonly-randconfig-003-20250321    clang-20
x86_64      buildonly-randconfig-004-20250320    clang-20
x86_64      buildonly-randconfig-004-20250321    clang-20
x86_64      buildonly-randconfig-005-20250320    clang-20
x86_64      buildonly-randconfig-005-20250321    clang-20
x86_64      buildonly-randconfig-006-20250320    gcc-12
x86_64      buildonly-randconfig-006-20250321    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250321    clang-20
x86_64                randconfig-002-20250321    clang-20
x86_64                randconfig-003-20250321    clang-20
x86_64                randconfig-004-20250321    clang-20
x86_64                randconfig-005-20250321    clang-20
x86_64                randconfig-006-20250321    clang-20
x86_64                randconfig-007-20250321    clang-20
x86_64                randconfig-008-20250321    clang-20
x86_64                randconfig-071-20250321    gcc-12
x86_64                randconfig-072-20250321    gcc-12
x86_64                randconfig-073-20250321    gcc-12
x86_64                randconfig-074-20250321    gcc-12
x86_64                randconfig-075-20250321    gcc-12
x86_64                randconfig-076-20250321    gcc-12
x86_64                randconfig-077-20250321    gcc-12
x86_64                randconfig-078-20250321    gcc-12
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250320    gcc-9.3.0
xtensa                randconfig-001-20250321    gcc-6.5.0
xtensa                randconfig-002-20250320    gcc-11.5.0
xtensa                randconfig-002-20250321    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
