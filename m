Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB4D14F9FD
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Feb 2025 21:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738792128; cv=none; b=rdjCekdGVnard6sHTmUhi2K++MWj+2mAVUqZYtB4O4wjAyV/aSz+uD3WTP4dyosuIs3DyD7lirW3fHz05sUstk1YGY3BM4siyF9BCBvJIRdXWRQxUHN/yS7pmxNuh7M9ocsiOPqwGVVNRdZudsj2i0n3y+YyCEyeF7Lt/oXXlF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738792128; c=relaxed/simple;
	bh=mY13eqt4I+0zfFz+4QuHwi0vVOSSR3CUwtvJPoqG26Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B+ADiGnFGDzTaT1gO4h/npGS9MUMX4GjgeOpxhAOpbN8eeddNaSvEzNqpPCPNilUraLzTupEPy7WaHV72mMSkAEpa88X9vNTKbjr68NBMEjceDNzTLipUTEganq8X0LthQXYft1v9P0UV5C7lvxBot3bVOOVnJ8AjCWlXS1HyVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjEnFxxj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjEnFxxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738792126; x=1770328126;
  h=date:from:to:cc:subject:message-id;
  bh=mY13eqt4I+0zfFz+4QuHwi0vVOSSR3CUwtvJPoqG26Y=;
  b=CjEnFxxjAfXZP6vknlRgg4PTwEBIpieKlZg6ii28vmIzTo1dcJmtgVtX
   Gdz4c4990cgXZBNEod5SYj4zkg6j/wleorcakZkVyMFkFcqN3J5l3hYTX
   5+LRnRDYvV6q+GKDO0xqR2d5E4Wz7Eb2ho5iPf+zhOhD+YLYVmPWeedS9
   8cdH+jcka2ClqXKzCeJk4UcGbp7JhCOt8FEj+GzA0kpQfxkIEW0Sz1pkJ
   wKaoOE52vWoleUxx3pZ+egC6ra6isvhskTeBHVQWU2YW+LtsPBq/2srID
   ft+O7zZTuaCEfLZVLoHDaJuBBLvUp1jIXo1Bu/RJy9WyQmrqz4qkeaHSj
   g==;
X-CSE-ConnectionGUID: 1ZoBVJacQyyJsgH7qo0pcA==
X-CSE-MsgGUID: Ppar+Q2pRWWS1ugOLHUcmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39512034"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39512034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 13:48:45 -0800
X-CSE-ConnectionGUID: v72rHhlRQQmu0TfkabDGgA==
X-CSE-MsgGUID: 7wUE0JgjTBW+pjqJntM9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="116067329"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Feb 2025 13:48:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfnGD-000w6p-1P;
	Wed, 05 Feb 2025 21:48:41 +0000
Date: Thu, 06 Feb 2025 05:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 dbb1bf1cdc6c7411c5b203e3fe2650cec4350cfe
Message-ID: <202502060533.x8cxwk5O-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: dbb1bf1cdc6c7411c5b203e3fe2650cec4350cfe  Merge branch 'hwmon-pmbus' into hwmon-staging

elapsed time: 1441m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-21
arm                         lpc18xx_defconfig    clang-19
arm                            mmp2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-004-20250205    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250205    clang-17
hexagon               randconfig-002-20250205    clang-19
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-11
i386        buildonly-randconfig-005-20250205    clang-19
i386        buildonly-randconfig-006-20250205    clang-19
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-001-20250205    clang-16
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250205    clang-18
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-003-20250205    clang-18
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-002-20250205    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-002-20250205    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-004-20250205    gcc-12
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
