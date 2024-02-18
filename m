Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E36E2CE
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Feb 2024 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708276365; cv=none; b=sd3/oIiGlgi9y4wnw/ggJO7fLllGOaGgRn5DSd4YTwIAqU+NbFAyNexBouDZ1P6xePL0dSRNV0JHmT2dxYzdzjnwvck2LWmFnPULAB3P+nQvKepkLjugFK67fmW0/3x0uphUGJwmCj52Dh3f39TrsurzgwfdgrS4v7mKqKh4rm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708276365; c=relaxed/simple;
	bh=KVuIsz3A/HvaxcexS3xo5OiIEQWTjeNJ2l9AZ5igWZc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dHc160Hanx5L24H0cJ0TuQmx52GlAISaxRC3dadYWLW/JzIA5ChN0VNpCOVuZN0fcsQoRH7Pt+6+rRMCu2Cglu6qrbnDUEK4C1YwC7uhObpLZKlRCj9fJrLQNEKbzeRWmOb5UEcUaXpw8M8u/45RenMOkeRfF84BJDEQs5IwQFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2r2n1WA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2r2n1WA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708276364; x=1739812364;
  h=date:from:to:cc:subject:message-id;
  bh=KVuIsz3A/HvaxcexS3xo5OiIEQWTjeNJ2l9AZ5igWZc=;
  b=Q2r2n1WAHCBEIEvZrj0LYFi8oAMatQGQUZxVRYhnJSzYUYAQ9sxTF8u0
   wYn0VThVP8xd0fidSSa9OGiLUNI7qc2hzEKZp2cXsmRDfFk1/sK60O2xh
   rF+8LwKfd7SaeVN4s4Pb/+GNabSHkE2PUuVhv7F8x2SM91HjPSW9B4mXO
   3tBCUDC1+LyYsJ9PIl6WDu7de+JwoZOL/Jz+8pa6MMIYdqrpsjLYcWEfd
   QPBdESE+eF+s2bZ4ekmzupdFsm2Rr3fFdGixS8zWtu6nCciqmb4iQkkza
   yubMiXYhAtGqsNsYfuDiSJxFSW3LreQheza4D4Wzkz/EqnGO4S4y8HgnL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2784054"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2784054"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 09:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="8897638"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2024 09:12:42 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbkiW-0003C0-09;
	Sun, 18 Feb 2024 17:12:40 +0000
Date: Mon, 19 Feb 2024 01:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS WITH WARNING
 87a37f01e744b2203a6d053322632f680f30fade
Message-ID: <202402190159.P2ZqqKVt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 87a37f01e744b2203a6d053322632f680f30fade  carry tests for parisc targets

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202402180814.YyJcQzem-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402180953.upWqUKdc-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402182220.PBilO7Xm-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402190049.MS7cVVET-lkp@intel.com

Warning: (recently discovered and may have been fixed)

lib/checksum_kunit.c:235:18: warning: 'expected_csum_ipv6_magic_corner' defined but not used [-Wunused-const-variable=]
lib/checksum_kunit.c:235:18: warning: unused variable 'expected_csum_ipv6_magic_corner' [-Wunused-const-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-002-20240218
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- arc-randconfig-r064-20240218
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- i386-buildonly-randconfig-006-20240218
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- loongarch-randconfig-002-20240218
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- nios2-randconfig-r063-20240218
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- openrisc-randconfig-r122-20240218
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- s390-randconfig-001-20240218
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- x86_64-randconfig-121-20240218
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-restricted-__be32-usertype
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int
`-- xtensa-randconfig-001-20240218
    `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
clang_recent_errors
|-- arm-randconfig-001-20240218
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
|-- arm-randconfig-004-20240218
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
|-- hexagon-randconfig-r062-20240218
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
|-- mips-randconfig-r061-20240218
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
`-- x86_64-randconfig-122-20240218
    |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-restricted-__be32-usertype
    `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-unsigned-int

elapsed time: 1452m

configs tested: 182
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240218   gcc  
arc                   randconfig-002-20240218   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240218   clang
arm                   randconfig-002-20240218   clang
arm                   randconfig-003-20240218   gcc  
arm                   randconfig-004-20240218   clang
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240218   clang
arm64                 randconfig-002-20240218   clang
arm64                 randconfig-003-20240218   clang
arm64                 randconfig-004-20240218   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240218   gcc  
csky                  randconfig-002-20240218   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240218   clang
hexagon               randconfig-002-20240218   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240218   clang
i386         buildonly-randconfig-002-20240218   clang
i386         buildonly-randconfig-003-20240218   clang
i386         buildonly-randconfig-004-20240218   clang
i386         buildonly-randconfig-005-20240218   clang
i386         buildonly-randconfig-006-20240218   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240218   clang
i386                  randconfig-002-20240218   gcc  
i386                  randconfig-003-20240218   clang
i386                  randconfig-004-20240218   clang
i386                  randconfig-005-20240218   clang
i386                  randconfig-006-20240218   gcc  
i386                  randconfig-011-20240218   gcc  
i386                  randconfig-012-20240218   gcc  
i386                  randconfig-013-20240218   clang
i386                  randconfig-014-20240218   gcc  
i386                  randconfig-015-20240218   gcc  
i386                  randconfig-016-20240218   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240218   gcc  
loongarch             randconfig-002-20240218   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240218   gcc  
nios2                 randconfig-002-20240218   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240218   gcc  
parisc                randconfig-002-20240218   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240218   gcc  
powerpc               randconfig-002-20240218   gcc  
powerpc               randconfig-003-20240218   clang
powerpc64             randconfig-001-20240218   clang
powerpc64             randconfig-002-20240218   gcc  
powerpc64             randconfig-003-20240218   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240218   gcc  
riscv                 randconfig-002-20240218   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240218   gcc  
s390                  randconfig-002-20240218   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240218   gcc  
sh                    randconfig-002-20240218   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240218   gcc  
sparc64               randconfig-002-20240218   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240218   gcc  
um                    randconfig-002-20240218   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240218   clang
x86_64       buildonly-randconfig-002-20240218   gcc  
x86_64       buildonly-randconfig-003-20240218   gcc  
x86_64       buildonly-randconfig-004-20240218   clang
x86_64       buildonly-randconfig-005-20240218   gcc  
x86_64       buildonly-randconfig-006-20240218   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240218   clang
x86_64                randconfig-002-20240218   clang
x86_64                randconfig-003-20240218   gcc  
x86_64                randconfig-004-20240218   gcc  
x86_64                randconfig-005-20240218   gcc  
x86_64                randconfig-006-20240218   clang
x86_64                randconfig-011-20240218   clang
x86_64                randconfig-012-20240218   gcc  
x86_64                randconfig-013-20240218   clang
x86_64                randconfig-014-20240218   clang
x86_64                randconfig-015-20240218   gcc  
x86_64                randconfig-016-20240218   clang
x86_64                randconfig-071-20240218   gcc  
x86_64                randconfig-072-20240218   clang
x86_64                randconfig-073-20240218   gcc  
x86_64                randconfig-074-20240218   gcc  
x86_64                randconfig-075-20240218   clang
x86_64                randconfig-076-20240218   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240218   gcc  
xtensa                randconfig-002-20240218   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
