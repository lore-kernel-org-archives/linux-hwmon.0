Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08361D5CFB
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Oct 2025 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581155; cv=none; b=qkJ8wMGt04oupOlUEzG0w+7hK9JEQxd7EWg20YchKt3zXfwRu2y54nIXJVsCYkU4kapoCda4iJNhX0RmUrIMQL+aVN8OZm44VVO7FOPemvQVdYc/nr5nRi81+gDPhhWciBBlCSvsqR9aM86CMQ+T4GI/+LHCtzvNO5viYAs/tg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581155; c=relaxed/simple;
	bh=dljqY/SM3OFZxgDe/94LyyNmzU+k9fviBXgYICny7KM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uQ/obmOa+AjxAVoRPxs8U8E+wAisM0l/Ta8WS6xxvyI+k0dFOcviv7SSB+7IkBCltytu3bqzCQ2xuv1OsZUJQz/pnpE9EUORv54FP+oRGCPMio28OqXT/TpQU/JV8EAv8p5+3pDpUKLYO+n24hWrpzmV+emfHhzxZ4ttp1KaQ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLhtRNY0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLhtRNY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761581153; x=1793117153;
  h=date:from:to:cc:subject:message-id;
  bh=dljqY/SM3OFZxgDe/94LyyNmzU+k9fviBXgYICny7KM=;
  b=mLhtRNY0tNpLzewudpBZVsassar0HSh/ypCHunwFpZIcfq6d26x4c2GK
   50uwRc9GEJ3onDlUFmLpmj+XWxQbqXj9LpCSA5bbtZ9gURACyP6u6QsOI
   07YZ6yqnfbGQhejTeyQdu+2Noi94relxtlLSZOmzRNnaxkudAiinyKR1g
   VntBf5jbRXk/iVDlr+topWSPh2PpcLNsScXvFWO6A8Uj72aETzgdS0/fc
   WlzxjqTH5zSWvhm+R0AzdoNZR597hmvf59PLUA2+x6XHrPiS1zL3NFRvs
   2PkEY1yhc4wHytGnEyAa6AkxEqhLDuaJyTFuDddk8x3u59Hd0Mnjx0H1W
   g==;
X-CSE-ConnectionGUID: nPjuG5ygRmK/wUYA3n4Ozg==
X-CSE-MsgGUID: 3X666yFDQAK/tHIMMVts7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63700903"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63700903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 09:05:53 -0700
X-CSE-ConnectionGUID: N1JJS1k0R12mfNU3KIt1MA==
X-CSE-MsgGUID: BlGmXlwpRpmwDKkktZTAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="208693867"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2025 09:05:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDPjB-000Gxh-2e;
	Mon, 27 Oct 2025 16:05:49 +0000
Date: Tue, 28 Oct 2025 00:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 1f7110b12cac389e4dd21d7fad42b4471090caec
Message-ID: <202510280008.EZCp3hNr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 1f7110b12cac389e4dd21d7fad42b4471090caec  hwmon: (gpd-fan) Fix compilation error in non-ACPI builds

elapsed time: 798m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-002-20251027    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-004-20251027    clang-22
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-004-20251027    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251027    gcc-14.3.0
csky                  randconfig-002-20251027    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251027    clang-22
hexagon               randconfig-002-20251027    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251027    gcc-15.1.0
loongarch             randconfig-002-20251027    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251027    gcc-8.5.0
nios2                 randconfig-002-20251027    gcc-8.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251027    gcc-8.5.0
parisc                randconfig-002-20251027    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251027    clang-22
powerpc               randconfig-002-20251027    clang-22
powerpc               randconfig-003-20251027    gcc-8.5.0
powerpc64             randconfig-001-20251027    gcc-8.5.0
powerpc64             randconfig-002-20251027    gcc-10.5.0
powerpc64             randconfig-003-20251027    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251027    gcc-13.4.0
riscv                 randconfig-002-20251027    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251027    clang-22
s390                  randconfig-002-20251027    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251027    gcc-12.5.0
sh                    randconfig-002-20251027    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251027    gcc-12.5.0
sparc                 randconfig-002-20251027    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251027    gcc-14.3.0
sparc64               randconfig-002-20251027    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251027    clang-22
um                    randconfig-002-20251027    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251027    gcc-12.5.0
xtensa                randconfig-002-20251027    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
