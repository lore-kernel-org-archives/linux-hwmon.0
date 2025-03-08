Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC161167DB7
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Mar 2025 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741448306; cv=none; b=EuWPJlgBjp7XU5KiFGElL5SHBo3Oxs8tRKkaSHpbZsaK2uCH00nNKqlU3kMW6t61Sk/9b1BFlN9utZumQOy9yyC1mK1NqRD0UILH9lkpBcDJK3bW7Pha5jbfhL/xbarypWI3HLEvhE2deiZe5NNiJrQXlmKHy4Hw9fz49Hcgs4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741448306; c=relaxed/simple;
	bh=MnWjY5DQma0Dog6nxIlzeX3/0HPCpdMO0jma/pCWh90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZG0dYc+NAKtvGPA2emUrd+DfDfblKgIBy2QaKU7FsiasikTxTLSQn1DmGa0+XE099qZ176aEOLRKMRQNAwG1LZJqjdcwEgsVEpO75xSm5+HLXxvzEyroJVBOiPil6lPFjNz8KYocrEXfdDbarMUGzXAxQb722PCt5qtbPH1s4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sl4bjK+N; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sl4bjK+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741448305; x=1772984305;
  h=date:from:to:cc:subject:message-id;
  bh=MnWjY5DQma0Dog6nxIlzeX3/0HPCpdMO0jma/pCWh90=;
  b=Sl4bjK+NOZixGeaYF5kZezTq9PIsgU+ALxoadrxkWw+mz8nC9yItbzIV
   C1N6oEk4WGN/gbBTrF1FvDLwJrA9VQ9tPQh87XUM1YrygTOhWq1Cxa6i+
   gqjpPJjQvZHt2CCifmD3zzRHoYsfuIxB5i114k8qWmhJp261iKaQ7DbLG
   ECtP4+LLtp3SJdj48SXyWJqC7/A9Rokf26SSD6BqvJUKTrpufEwiGVMgi
   eJpK7afCgRp/cQFvSJIV8nghmk/C8OpMrupLMEE5F9qsycE3BC9lzxz+n
   4Bu6wivNGm8/87H6Zr53lK7pHELLWerQvXZK96D1vIZYyV4nkZrbzFvVT
   A==;
X-CSE-ConnectionGUID: 4kEzjCllTKau5bOlfFWw5g==
X-CSE-MsgGUID: uro4PXZyQRqme2/jupq4fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="41737366"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="41737366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 07:38:24 -0800
X-CSE-ConnectionGUID: LVsgEHa1RlelT8O07CnFyg==
X-CSE-MsgGUID: LHOY7p5wQIiCT29Qqzfpzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120484690"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2025 07:38:23 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqwFg-00020G-19;
	Sat, 08 Mar 2025 15:38:13 +0000
Date: Sat, 08 Mar 2025 23:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7953605976f55acd4f297d310e6b0b2944f4bdc8
Message-ID: <202503082302.ruCrQ8Za-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7953605976f55acd4f297d310e6b0b2944f4bdc8  hwmon: (ntc_thermistor) return error instead of clipping on OOB

elapsed time: 1448m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250308    gcc-13.2.0
arc                   randconfig-002-20250308    gcc-13.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250308    gcc-14.2.0
arm                   randconfig-002-20250308    gcc-14.2.0
arm                   randconfig-003-20250308    gcc-14.2.0
arm                   randconfig-004-20250308    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250308    gcc-14.2.0
arm64                 randconfig-002-20250308    gcc-14.2.0
arm64                 randconfig-003-20250308    clang-16
arm64                 randconfig-004-20250308    gcc-14.2.0
csky                  randconfig-001-20250308    gcc-14.2.0
csky                  randconfig-002-20250308    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250308    clang-19
hexagon               randconfig-002-20250308    clang-21
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250308    gcc-12
i386        buildonly-randconfig-002-20250308    gcc-11
i386        buildonly-randconfig-003-20250308    clang-19
i386        buildonly-randconfig-004-20250308    clang-19
i386        buildonly-randconfig-005-20250308    clang-19
i386        buildonly-randconfig-006-20250308    gcc-12
loongarch             randconfig-001-20250308    gcc-14.2.0
loongarch             randconfig-002-20250308    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250308    gcc-14.2.0
nios2                 randconfig-002-20250308    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250308    gcc-14.2.0
parisc                randconfig-002-20250308    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250308    clang-18
powerpc               randconfig-002-20250308    gcc-14.2.0
powerpc               randconfig-003-20250308    gcc-14.2.0
powerpc64             randconfig-001-20250308    gcc-14.2.0
powerpc64             randconfig-003-20250308    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250308    clang-21
riscv                 randconfig-002-20250308    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250308    clang-19
s390                  randconfig-002-20250308    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250308    gcc-14.2.0
sh                    randconfig-002-20250308    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250308    gcc-14.2.0
sparc                 randconfig-002-20250308    gcc-14.2.0
sparc64               randconfig-001-20250308    gcc-14.2.0
sparc64               randconfig-002-20250308    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250308    gcc-12
um                    randconfig-002-20250308    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250308    gcc-12
x86_64      buildonly-randconfig-002-20250308    clang-19
x86_64      buildonly-randconfig-003-20250308    gcc-12
x86_64      buildonly-randconfig-004-20250308    clang-19
x86_64      buildonly-randconfig-005-20250308    clang-19
x86_64      buildonly-randconfig-006-20250308    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250308    gcc-14.2.0
xtensa                randconfig-002-20250308    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
