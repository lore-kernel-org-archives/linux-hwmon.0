Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD232C08C2
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Jul 2025 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113409; cv=none; b=Dyps8YaFiDNhXefTUnyuIoHE9vZnxpIX/N4uV4y9WLI/xkbfqLn8CP+3RcvBskczGJ+ZLOksiGiCkuDHR1AFrjYB+g7Dqn7KLxVq65+VN2afIkCDs5WlYHtXVt+wIlwHN3oifxsT0oPUCWmPbDUkmsyXRcr2VsBF+31NdheawBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113409; c=relaxed/simple;
	bh=UYQO6MQy8OtePYS1raCf4YB1c7/wiftnu7XUuXlLP4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NbtYGSNnidCk0GGUbUlAuU2cJe4KactBy/THlyjHNTn6K5+O8TLXJj/wDUfuZv8fK+GWQEb3JkY+dDzsZwzny2Y04XlDKujAOYZWQCNuL81nq3B1k/OSEQonf4JGYCIXB/bO+mAHkjqNYS+ZR3hoVFlX5g9acgKIJRlUbAxYzRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFlUzqWC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFlUzqWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753113407; x=1784649407;
  h=date:from:to:cc:subject:message-id;
  bh=UYQO6MQy8OtePYS1raCf4YB1c7/wiftnu7XUuXlLP4k=;
  b=YFlUzqWCf24nfp17i1EILvJYQcJK+GryZsTLEWoqdUFzXq67akmDWvLH
   YEZGPJV/PpG99krE0C0QB8qjGXsr753MSeTYmPeDnbU/kLWVbsEC19i2L
   XwL50j/2mxC+2oa1jePOgPIOxSvOb8gHEprc4PMU67KHYGaG76KDavCO6
   03muW00fyAKV5VYb2Lyd+9L+cVo2KxGQPUB9uHquNW1N+xSCwTmUd+Z1t
   2ckgMZG13kmtrGoK7Cr217iO0i7fUKzNlLwG0Y2AuBOKVFDRAMPGNadIS
   OsYj61jDZLRjlT+tAxA1lYmHMnuwzuzALhv4YJFqEloi2uNp3j487H/e+
   w==;
X-CSE-ConnectionGUID: 9EHzJnscSLSzMsLqlF9Ujg==
X-CSE-MsgGUID: lrMIltl4TD6p/DktknAv3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55291063"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55291063"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 08:56:47 -0700
X-CSE-ConnectionGUID: guzxM4OET+WTtF78cIR2gA==
X-CSE-MsgGUID: ayneRSnLTP2LVAHLtdtQvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158660644"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jul 2025 08:56:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udssd-000GwT-26;
	Mon, 21 Jul 2025 15:56:43 +0000
Date: Mon, 21 Jul 2025 23:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 9c62e2282900332c8b711d9f9e37af369a8ef71b
Message-ID: <202507212307.1nM0Mc9c-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 9c62e2282900332c8b711d9f9e37af369a8ef71b  hwmon: (gsc-hwmon) fix fan pwm setpoint show functions

elapsed time: 914m

configs tested: 128
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250721    gcc-11.5.0
arc                   randconfig-002-20250721    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          moxart_defconfig    gcc-15.1.0
arm                   randconfig-001-20250721    clang-21
arm                   randconfig-002-20250721    gcc-13.4.0
arm                   randconfig-003-20250721    gcc-15.1.0
arm                   randconfig-004-20250721    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250721    clang-21
arm64                 randconfig-002-20250721    clang-20
arm64                 randconfig-003-20250721    gcc-13.4.0
arm64                 randconfig-004-20250721    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250721    gcc-15.1.0
csky                  randconfig-002-20250721    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250721    clang-21
hexagon               randconfig-002-20250721    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250721    clang-20
i386        buildonly-randconfig-002-20250721    clang-20
i386        buildonly-randconfig-003-20250721    gcc-12
i386        buildonly-randconfig-004-20250721    gcc-12
i386        buildonly-randconfig-005-20250721    clang-20
i386        buildonly-randconfig-006-20250721    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250721    clang-18
loongarch             randconfig-002-20250721    gcc-12.5.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250721    gcc-8.5.0
nios2                 randconfig-002-20250721    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250721    gcc-15.1.0
parisc                randconfig-002-20250721    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250721    gcc-12.5.0
powerpc               randconfig-002-20250721    gcc-10.5.0
powerpc               randconfig-003-20250721    gcc-11.5.0
powerpc64             randconfig-001-20250721    clang-21
powerpc64             randconfig-002-20250721    clang-21
powerpc64             randconfig-003-20250721    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250721    clang-21
riscv                 randconfig-002-20250721    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250721    clang-21
s390                  randconfig-002-20250721    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250721    gcc-15.1.0
sh                    randconfig-002-20250721    gcc-14.3.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250721    gcc-15.1.0
sparc                 randconfig-002-20250721    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250721    clang-20
sparc64               randconfig-002-20250721    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250721    gcc-12
um                    randconfig-002-20250721    clang-17
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250721    clang-20
x86_64      buildonly-randconfig-002-20250721    gcc-12
x86_64      buildonly-randconfig-003-20250721    gcc-12
x86_64      buildonly-randconfig-004-20250721    gcc-12
x86_64      buildonly-randconfig-005-20250721    clang-20
x86_64      buildonly-randconfig-006-20250721    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250721    gcc-11.5.0
xtensa                randconfig-002-20250721    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
