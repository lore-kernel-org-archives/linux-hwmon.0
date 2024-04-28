Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995AA524B7
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714295005; cv=none; b=dCJ+sjC9NlZtRtoVzqAVuyOJqsZcWG0FCHyBi5edsqPJZea8u7VxNBOw1qKjjsBd3KTwRi4fv7qgQx+1Q/nI4oAJJyCZN21DBlIu++nhvzTcdhpp0U6ufTRk0ZNZvM6G1XtTvB0imSsyQxulYr4NX8PjAj+cL0phqmAjc4RPjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714295005; c=relaxed/simple;
	bh=W6AMK/XB2Gvy2wkuuHSLV6NRFJ2njrVLZe1ons4iZyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u9hm/nABKBlA0wPkbQU8PGC6AFL25eA33/Q/rzlM3oHu3B+gPay4tH/TvAf1thR0Q6zIb1itOEh67eWml5VlxcpQ9RluZhBNyVxqTpLpLQoP7ZOryhNW7HzpywGMWyxIPEpMcuAEKXuM+cLzhku0VFN3MQjdX19+IPSvOaNLzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ConguvZ7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ConguvZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714295003; x=1745831003;
  h=date:from:to:cc:subject:message-id;
  bh=W6AMK/XB2Gvy2wkuuHSLV6NRFJ2njrVLZe1ons4iZyw=;
  b=ConguvZ7nhU/UpWr9XRF4x2JT3TQD+ddWoUITyPclgPHrltZD5p+j0Wv
   CBV/3eCYMY+aVqNZLlbtsBwwLnBfM5Uee6IE9ix1/mdl1yPKG7Ol6G79O
   1BeGj7pDO65S2Kd0u7/ON0iNf2uZ5yYyBkgDCAb4jJuPEPhhfU8XkUyXb
   3zqdI4pLRO/RGkTxHYSEuTFRkQEfRoX6Y+gZxsBeOtkLnMQqfaZbNxe46
   xeOiR6fVWonUDPp712fsCFnqXrZxYfOWiQgmmKmMNi188+MjvT4goZGV9
   kKc/LWTNZMHDqfVoUazavstZY4UB2AhtgmAqPFTR78Qm5vB36zolYAl6Q
   A==;
X-CSE-ConnectionGUID: +EsOdAdUQ4qd67/P99UaTQ==
X-CSE-MsgGUID: p0Yozzm1QX6EfbP+bDGs4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13806845"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="13806845"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 02:03:23 -0700
X-CSE-ConnectionGUID: urM5smpITxisgxyFa0i0sA==
X-CSE-MsgGUID: EGkQAcucS/CqFo7pIhyq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25701260"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Apr 2024 02:03:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s10RL-00061w-1R;
	Sun, 28 Apr 2024 09:03:19 +0000
Date: Sun, 28 Apr 2024 17:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 bb1d7f8fb552de2984a6a6d3eb78c78d0920db6d
Message-ID: <202404281749.OQoJBJYx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: bb1d7f8fb552de2984a6a6d3eb78c78d0920db6d  Merge branch 'kunit-v4' into testing

elapsed time: 1279m

configs tested: 154
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240427   gcc  
arc                   randconfig-002-20240427   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   clang
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                            mps2_defconfig   clang
arm                   randconfig-001-20240427   clang
arm                   randconfig-002-20240427   clang
arm                   randconfig-003-20240427   gcc  
arm                   randconfig-004-20240427   clang
arm                         s5pv210_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240427   clang
arm64                 randconfig-002-20240427   clang
arm64                 randconfig-003-20240427   gcc  
arm64                 randconfig-004-20240427   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240427   gcc  
csky                  randconfig-002-20240427   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240427   clang
hexagon               randconfig-002-20240427   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240427   clang
i386         buildonly-randconfig-002-20240427   gcc  
i386         buildonly-randconfig-003-20240427   clang
i386         buildonly-randconfig-004-20240427   clang
i386         buildonly-randconfig-005-20240427   clang
i386         buildonly-randconfig-006-20240427   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240427   clang
i386                  randconfig-002-20240427   gcc  
i386                  randconfig-003-20240427   clang
i386                  randconfig-004-20240427   gcc  
i386                  randconfig-005-20240427   gcc  
i386                  randconfig-006-20240427   clang
i386                  randconfig-011-20240427   gcc  
i386                  randconfig-012-20240427   gcc  
i386                  randconfig-015-20240427   gcc  
i386                  randconfig-016-20240427   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240427   gcc  
loongarch             randconfig-002-20240427   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240427   gcc  
nios2                 randconfig-002-20240427   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240427   gcc  
parisc                randconfig-002-20240427   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240427   clang
powerpc               randconfig-002-20240427   clang
powerpc               randconfig-003-20240427   clang
powerpc                     tqm8540_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240427   gcc  
powerpc64             randconfig-002-20240427   gcc  
powerpc64             randconfig-003-20240427   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240427   clang
riscv                 randconfig-002-20240427   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240427   gcc  
s390                  randconfig-002-20240427   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240427   gcc  
sh                    randconfig-002-20240427   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240427   gcc  
sparc64               randconfig-002-20240427   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240427   clang
um                    randconfig-002-20240427   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240427   gcc  
xtensa                randconfig-002-20240427   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
