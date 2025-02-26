Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2584122577D
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Feb 2025 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740538921; cv=none; b=BFGP2sGY0YDH6ztjeq0/KTpqYIrNR+O3wEgb0xT4B/ZGaNhofjRqzHR11+YRB9bDtpKf/4d6MJMCAZElAoqw41+/uaZRfcF9BlwbqFtOJdpjuBsTZqYXBihCRfb5xVrsE0EF1zJLlbgrM7WP9yITWKTIQu0OqxzIfBV6kIl5+wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740538921; c=relaxed/simple;
	bh=UBDwnEAa+Z6WOYKxKe5JBrlZYA6opAhQcl/MRdQfqrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qPOAZYrASdkIaTsQ1pEsKiL4y/yrmANlCflQDGF77pNPtNG8e12tRl0W3DROvGL8SQCIY4pI5q1/WJIjUS6Mcy//MHyLTyNL8yhRExkGJjuVehPp16gvl0oiPXxAaqhfpuVyq8zN2dqZtx5m92sd+7PZU6SNxe4lBpCriC3cgjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2aXSou+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2aXSou+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740538920; x=1772074920;
  h=date:from:to:cc:subject:message-id;
  bh=UBDwnEAa+Z6WOYKxKe5JBrlZYA6opAhQcl/MRdQfqrY=;
  b=j2aXSou+r3/z4SBKq+gk2ug9U4rtnhukIVgMgbMM3PeQEzOBPvZZFNyr
   cF4sokukc8+J+2Z67b0dsdEifnuk8OsmOeOVlBRhYHEeJB5QgavX6YGJ9
   E8MTmEtwhYMAo0PpZoXXkeS+nY1DnRJ+ZGPyJLFnHgtkxb61gEG5Q0YZL
   38ffw58K0bi941E4KNjfveC58sU+gisl++3BFT7j9TX79vRknNZcAZGel
   ydzIPaKuI7j2y4MXEVHQSFGbzv+JIZovKQbTQFQtOJU7CjRnR32GGWnU4
   BU4Ukadd6vnaEOpzSOJ9LthbImSWMhZqVmJcCVth2+DWDPeMSpkmAd18Q
   w==;
X-CSE-ConnectionGUID: kgFKTVGnTGm0vCxuFVrZ3w==
X-CSE-MsgGUID: jKGer+FMTwyk7KJNyZJ7dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45155491"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45155491"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 19:01:59 -0800
X-CSE-ConnectionGUID: GIHqf3WHRkO3qe1033PjQA==
X-CSE-MsgGUID: dlqQU6fEQHi1fbGL9aCfvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116363252"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2025 19:01:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn7gJ-000B3R-0z;
	Wed, 26 Feb 2025 03:01:55 +0000
Date: Wed, 26 Feb 2025 11:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 5797c04400ee117bfe459ff1e468d0ea38054ab4
Message-ID: <202502261107.5YQTy2ww-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 5797c04400ee117bfe459ff1e468d0ea38054ab4  hwmon: (peci/dimmtemp) Do not provide fake thresholds data

elapsed time: 1457m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250225    gcc-13.2.0
arc                  randconfig-002-20250225    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250225    gcc-14.2.0
arm                  randconfig-002-20250225    gcc-14.2.0
arm                  randconfig-003-20250225    gcc-14.2.0
arm                  randconfig-004-20250225    clang-15
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250225    clang-19
arm64                randconfig-002-20250225    clang-17
arm64                randconfig-003-20250225    clang-15
arm64                randconfig-004-20250225    clang-21
csky                 randconfig-001-20250225    gcc-14.2.0
csky                 randconfig-002-20250225    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250225    clang-21
hexagon              randconfig-002-20250225    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250225    clang-19
i386       buildonly-randconfig-002-20250225    gcc-11
i386       buildonly-randconfig-003-20250225    clang-19
i386       buildonly-randconfig-004-20250225    clang-19
i386       buildonly-randconfig-005-20250225    gcc-12
i386       buildonly-randconfig-006-20250225    clang-19
i386                               defconfig    clang-19
loongarch            randconfig-001-20250225    gcc-14.2.0
loongarch            randconfig-002-20250225    gcc-14.2.0
nios2                randconfig-001-20250225    gcc-14.2.0
nios2                randconfig-002-20250225    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250225    gcc-14.2.0
parisc               randconfig-002-20250225    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250225    gcc-14.2.0
powerpc              randconfig-002-20250225    clang-19
powerpc              randconfig-003-20250225    clang-21
powerpc64            randconfig-001-20250225    gcc-14.2.0
powerpc64            randconfig-002-20250225    gcc-14.2.0
powerpc64            randconfig-003-20250225    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250225    clang-15
riscv                randconfig-002-20250225    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250225    clang-15
s390                 randconfig-002-20250225    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250225    gcc-14.2.0
sh                   randconfig-002-20250225    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250225    gcc-14.2.0
sparc                randconfig-002-20250225    gcc-14.2.0
sparc64              randconfig-001-20250225    gcc-14.2.0
sparc64              randconfig-002-20250225    gcc-14.2.0
um                              allmodconfig    clang-21
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250225    clang-21
um                   randconfig-002-20250225    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250225    gcc-12
x86_64     buildonly-randconfig-002-20250225    clang-19
x86_64     buildonly-randconfig-003-20250225    clang-19
x86_64     buildonly-randconfig-004-20250225    gcc-11
x86_64     buildonly-randconfig-005-20250225    gcc-12
x86_64     buildonly-randconfig-006-20250225    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250225    gcc-14.2.0
xtensa               randconfig-002-20250225    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
