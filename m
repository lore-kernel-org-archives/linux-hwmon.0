Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C533203710
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Feb 2025 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738701056; cv=none; b=CtW4PwgxN5pCKbgOGWtDM+amp5tCIFZGzhdGHzLTArYuNW0+06UFWAABonbPLBkoVDpmWzixCnzJEbgRqIqV6pY7LojgKvCpJxdOf8YgWS7Jp9NKG6AN9udQ77UptPhQjSCI/nQfmQed5lrkupDnsC7T9MUeO7/7Eji55VvAGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738701056; c=relaxed/simple;
	bh=Khdcpg9qJWyy60FHs+zYy1DwH7Gobk1FeEEv8r33qZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=plY2rgiCKQMvaiZCFEJLj4Rkv24SJ68QvdQ2/qaCbKvEx/iMjtQWuYd0WWDCMREqgTEfF99JtCwpMl+Z0U/fwENHt1l7NNvzY1r6DKjGvhKMjtQpkNSK4HsjfhNJlmXtngKvNDwljDl4UUQlq71rCE/D/IyagpMNViZ1BeRByog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2KrwOHC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2KrwOHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738701054; x=1770237054;
  h=date:from:to:cc:subject:message-id;
  bh=Khdcpg9qJWyy60FHs+zYy1DwH7Gobk1FeEEv8r33qZk=;
  b=f2KrwOHCR83ww2lJZtW5+LLBYxFAbSWupNKBmnmHln1TfeXMUtpm8PAF
   /ar5cTMYpLO4p4Z9U8OcfYOXOxbPeUYddeEYwfaT9lF+X99/M6bwGm3Lu
   VA0uj4OoOrGCEKr/DKo04H6W4HQt66GjHYEYnIKM3BWQAJcg4N1qaT/n5
   dUIyzQ4YbM9HHfvZDb8foOCHmzpkwKgdkEfQCmyCX5WCefg6a3NfEizN7
   MH65y+8wB6HHGY1+UhKp9uuxwSRwvPmHdHyhKgnusXNe2HTr5KUu+5rJX
   acC/J7u1RIyNnMcfMscAVTTkoNCLk1eznHQ31AGYi85n3fHaYWZpKyUen
   g==;
X-CSE-ConnectionGUID: Sw20h5fwQbeAgmIY+68tag==
X-CSE-MsgGUID: A2dvGWgOQpubRVgVq2c4/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42996440"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="42996440"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 12:30:53 -0800
X-CSE-ConnectionGUID: y5nU8PG4ShiUN9lA7aII/w==
X-CSE-MsgGUID: lCfC0Mp7Sg6vgROI/YqFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="111242233"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 12:30:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfPZJ-000sz7-3D;
	Tue, 04 Feb 2025 20:30:49 +0000
Date: Wed, 05 Feb 2025 04:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 67b0f0fb646de244e59420a373c93a9deb2c60b5
Message-ID: <202502050447.TlFtFlt0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 67b0f0fb646de244e59420a373c93a9deb2c60b5  Merge branch 'fixes-v6.14' into testing

elapsed time: 1446m

configs tested: 187
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
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250204    clang-21
arm                   randconfig-001-20250205    gcc-13.2.0
arm                   randconfig-002-20250204    clang-17
arm                   randconfig-002-20250205    gcc-13.2.0
arm                   randconfig-003-20250204    clang-19
arm                   randconfig-003-20250205    gcc-13.2.0
arm                   randconfig-004-20250204    clang-21
arm                   randconfig-004-20250205    gcc-13.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250204    clang-21
arm64                 randconfig-001-20250205    gcc-13.2.0
arm64                 randconfig-002-20250204    clang-21
arm64                 randconfig-002-20250205    gcc-13.2.0
arm64                 randconfig-003-20250204    clang-17
arm64                 randconfig-003-20250205    gcc-13.2.0
arm64                 randconfig-004-20250204    clang-21
arm64                 randconfig-004-20250205    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-001-20250204    gcc-14.2.0
hexagon               randconfig-002-20250204    clang-21
hexagon               randconfig-002-20250204    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-005-20250205    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386        buildonly-randconfig-006-20250205    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250205    clang-19
i386                  randconfig-012-20250205    clang-19
i386                  randconfig-013-20250205    clang-19
i386                  randconfig-014-20250205    clang-19
i386                  randconfig-015-20250205    clang-19
i386                  randconfig-016-20250205    clang-19
i386                  randconfig-017-20250205    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
mips                           mtx1_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-16
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                      pasemi_defconfig    clang-21
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc               randconfig-003-20250204    gcc-14.2.0
powerpc                     taishan_defconfig    gcc-14.2.0
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-002-20250204    gcc-14.2.0
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                            alldefconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250204    gcc-14.2.0
riscv                 randconfig-002-20250204    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250204    gcc-14.2.0
s390                  randconfig-002-20250204    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250204    gcc-14.2.0
sh                    randconfig-002-20250204    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250204    gcc-14.2.0
sparc                 randconfig-002-20250204    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250204    gcc-14.2.0
sparc64               randconfig-002-20250204    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250204    clang-21
um                    randconfig-001-20250204    gcc-14.2.0
um                    randconfig-002-20250204    gcc-12
um                    randconfig-002-20250204    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-004-20250205    clang-19
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250204    clang-19
x86_64                randconfig-002-20250204    clang-19
x86_64                randconfig-003-20250204    clang-19
x86_64                randconfig-004-20250204    clang-19
x86_64                randconfig-005-20250204    clang-19
x86_64                randconfig-006-20250204    clang-19
x86_64                randconfig-007-20250204    clang-19
x86_64                randconfig-008-20250204    clang-19
x86_64                randconfig-071-20250205    gcc-12
x86_64                randconfig-072-20250205    gcc-12
x86_64                randconfig-073-20250205    gcc-12
x86_64                randconfig-074-20250205    gcc-12
x86_64                randconfig-075-20250205    gcc-12
x86_64                randconfig-076-20250205    gcc-12
x86_64                randconfig-077-20250205    gcc-12
x86_64                randconfig-078-20250205    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250204    gcc-14.2.0
xtensa                randconfig-002-20250204    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
