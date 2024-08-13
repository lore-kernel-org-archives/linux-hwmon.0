Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E65368
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Aug 2024 04:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723524433; cv=none; b=EovEFnCwhF+AOwtvE2m+fq/bayKWjXvJh0qtwOlufDObBXM0HadLR7zYgHH50yzRnDtdgK9Zx1s97suPJVZr7sH3qZUNKq1+Q1tK8ZUL48n9J+AQ7vIKIBIW5USt6Z14KvPfKLLIUzn0Sr7LhonkqvXximcndMKQ/RQcz8SUOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723524433; c=relaxed/simple;
	bh=7MQ2l/2FyP6hSgwlsxfjA57NA2cWsUwJ5IXouMWpcGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fTCaiJRIZD+xZZgEKJebe2J/R1Jf1cbLb8bmjkNS9WRL7xDij2xTx7DMSucdCOD29hUtOEUO9NlNlCIfKGWtubCQkzrrvW1i8srbLkIHpfkXHQPg/xgEQ7v2BDXG2Euz+at5z4J3PrJr7/PUxuUjVoNf//u7z80GGx+UAsUejUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPQ8utfx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPQ8utfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723524431; x=1755060431;
  h=date:from:to:cc:subject:message-id;
  bh=7MQ2l/2FyP6hSgwlsxfjA57NA2cWsUwJ5IXouMWpcGc=;
  b=JPQ8utfxROLilhLtUTugXEaNoyZhcnq/xx80RvYHXVDUpdl9p1l0zjoh
   bvmRmzi8sjwYAMgkYGZiKPhOJUSlBWZjtlru6nfFJzBJp7GhCChUG21Eg
   6hKiYJ1f1uyvrEZyqeVTFHYa+3s/FTy4wB0GQwuKkMTuow9iod2RhZ2uy
   ZXcJu2W4R3GzEVHzHbxlJss40rVIWwHUDr+ByCUwOsip/3EwTAWSGkEKW
   luZpXZeNIf//y+FR/hARJ2sWwOGCOdJm0bBgTnmxNw+YNz8F+9kTP8hC1
   ej5CNSq0wwBZc1ZqKz10vtswCsKNn+zFjoz/f0f2gKZJ46PsgkJ6eVsh/
   w==;
X-CSE-ConnectionGUID: 8jyASPS2QnGsawrcysSB8g==
X-CSE-MsgGUID: qvUuYh/DR3q3+QT7VpG24w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21797573"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21797573"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 21:47:09 -0700
X-CSE-ConnectionGUID: nM02D8iMR1evhuCls7EVew==
X-CSE-MsgGUID: 3GX7pEjNSjOOSXmOMDR17w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63493371"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2024 21:47:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdjR3-0000Ao-2x;
	Tue, 13 Aug 2024 04:47:05 +0000
Date: Tue, 13 Aug 2024 12:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 fbf562a03282767f24ecc5e1b6a1bb8e1d2256db
Message-ID: <202408131206.9W0dQovW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: fbf562a03282767f24ecc5e1b6a1bb8e1d2256db  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 721m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240813   gcc-13.2.0
arc                   randconfig-002-20240813   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240813   gcc-14.1.0
arm                   randconfig-002-20240813   gcc-14.1.0
arm                   randconfig-003-20240813   gcc-14.1.0
arm                   randconfig-004-20240813   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240813   gcc-14.1.0
arm64                 randconfig-002-20240813   gcc-14.1.0
arm64                 randconfig-003-20240813   clang-20
arm64                 randconfig-004-20240813   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240813   gcc-14.1.0
csky                  randconfig-002-20240813   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240813   clang-20
hexagon               randconfig-002-20240813   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240813   gcc-12
i386         buildonly-randconfig-002-20240813   gcc-12
i386         buildonly-randconfig-003-20240813   gcc-12
i386         buildonly-randconfig-004-20240813   gcc-11
i386         buildonly-randconfig-005-20240813   clang-18
i386         buildonly-randconfig-006-20240813   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240813   gcc-12
i386                  randconfig-002-20240813   clang-18
i386                  randconfig-003-20240813   gcc-12
i386                  randconfig-004-20240813   gcc-12
i386                  randconfig-005-20240813   clang-18
i386                  randconfig-006-20240813   clang-18
i386                  randconfig-011-20240813   gcc-12
i386                  randconfig-012-20240813   gcc-12
i386                  randconfig-013-20240813   clang-18
i386                  randconfig-014-20240813   clang-18
i386                  randconfig-015-20240813   clang-18
i386                  randconfig-016-20240813   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240813   gcc-14.1.0
loongarch             randconfig-002-20240813   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240813   gcc-14.1.0
nios2                 randconfig-002-20240813   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                randconfig-001-20240813   gcc-14.1.0
parisc                randconfig-002-20240813   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240813   clang-18
x86_64       buildonly-randconfig-002-20240813   gcc-11
x86_64       buildonly-randconfig-003-20240813   clang-18
x86_64       buildonly-randconfig-004-20240813   gcc-12
x86_64       buildonly-randconfig-005-20240813   gcc-12
x86_64       buildonly-randconfig-006-20240813   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240813   gcc-12
x86_64                randconfig-002-20240813   clang-18
x86_64                randconfig-003-20240813   gcc-12
x86_64                randconfig-004-20240813   gcc-12
x86_64                randconfig-005-20240813   gcc-12
x86_64                randconfig-006-20240813   clang-18
x86_64                randconfig-011-20240813   gcc-12
x86_64                randconfig-012-20240813   gcc-12
x86_64                randconfig-013-20240813   gcc-12
x86_64                randconfig-014-20240813   gcc-11
x86_64                randconfig-015-20240813   gcc-11
x86_64                randconfig-016-20240813   gcc-12
x86_64                randconfig-071-20240813   clang-18
x86_64                randconfig-072-20240813   clang-18
x86_64                randconfig-073-20240813   gcc-11
x86_64                randconfig-074-20240813   gcc-12
x86_64                randconfig-075-20240813   gcc-12
x86_64                randconfig-076-20240813   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
