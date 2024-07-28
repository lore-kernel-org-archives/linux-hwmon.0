Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4793C2566
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 04:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722140275; cv=none; b=c6o9C8oeVacjYViBEbW0A9oIyea4dACC+3oQ9FFFiQPA55tMwkpeIZFgbUrTHUCiXptgGjy8WH+Eig+pqtqyBDcRbS+CDO8q9m+SzkkKs4zkY9uHfAPE6mGQQ2Tw2auY1nOrbsOCFaD1bb+Da2s4yqP1JSWdvQQiO9hNTZdrKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722140275; c=relaxed/simple;
	bh=R2PfPAnSKcvo1EDgWVsnUM7JQFzWB6egrxReJXRcPDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=COT9t5J+rmSWReZPy2pj8mt9Ji4EUO5fyBIEdk/ZukTC8jrSnsWrCwZJ79iEqbp4mIY77BM6Q/qNrD4ZLohXRvYGish5Jwxtuf8sRXmOqjBKu3vjcSEZbF02Koq9iNXhQFC3Q1cvr/DEP6P6Q4ql1DpfvjZbfNxh+GN82TaUju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIBEnmN7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIBEnmN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722140273; x=1753676273;
  h=date:from:to:cc:subject:message-id;
  bh=R2PfPAnSKcvo1EDgWVsnUM7JQFzWB6egrxReJXRcPDQ=;
  b=TIBEnmN77orfWWL9qBnnHLXIqz0dPUpfDe7br0imuzIvdGnJHz873kDP
   Uod1QKZ4V9k6qc1h+lXxt7MGB8JacIhdVeyR8sExx+eiU6PTPeGS7DcZ6
   xMESGcY2R/3FyFnSxz7RdYJ08C2QK/hBsiKCHUPC4TutY90kp6m1PK2ny
   YZz39/KBztqydpO4KTo2NeQGJWbqCZ4OCSuD5TO5j4tgmdqnypCZKNON3
   Ylg0oXVdOrwLv5Rx4Rj4fh857xEuSqOx0Qybx/W8Q8uf040kfUDNKqlxC
   8VvZZXqj1zE1Pdn9Rh+YbAlsBqgGB6+l+TglR2I3mYqWyX60IdwKyS1PN
   Q==;
X-CSE-ConnectionGUID: E2pxBNysR1+gg97IYe0KSg==
X-CSE-MsgGUID: 1a3i9i4+QfuV6kjRedN2kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="30551967"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="30551967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 21:17:52 -0700
X-CSE-ConnectionGUID: CnxK0yYnRVKslg9xFcPffA==
X-CSE-MsgGUID: DrVRF7HKQcmeLrHb+Jwk9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="58733865"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2024 21:17:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXvLw-000qUc-3B;
	Sun, 28 Jul 2024 04:17:48 +0000
Date: Sun, 28 Jul 2024 12:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 aeaa1e2c83b1ba36a89a6223d0da89245462f9b7
Message-ID: <202407281210.xapHkorw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: aeaa1e2c83b1ba36a89a6223d0da89245462f9b7  hwmon: (max1668) Convert to use with_info hwmon API

elapsed time: 727m

configs tested: 148
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240728   gcc-13.2.0
arc                   randconfig-002-20240728   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   clang-14
arm                   randconfig-001-20240728   clang-20
arm                   randconfig-002-20240728   clang-20
arm                   randconfig-003-20240728   gcc-14.1.0
arm                   randconfig-004-20240728   gcc-14.1.0
arm                             rpc_defconfig   clang-20
arm                         s5pv210_defconfig   gcc-14.1.0
arm                        spear3xx_defconfig   clang-16
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240728   gcc-14.1.0
arm64                 randconfig-002-20240728   clang-20
arm64                 randconfig-003-20240728   gcc-14.1.0
arm64                 randconfig-004-20240728   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240728   gcc-14.1.0
csky                  randconfig-002-20240728   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240728   clang-15
hexagon               randconfig-002-20240728   clang-17
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240728   clang-18
i386         buildonly-randconfig-002-20240728   gcc-13
i386         buildonly-randconfig-003-20240728   gcc-11
i386         buildonly-randconfig-004-20240728   gcc-13
i386         buildonly-randconfig-005-20240728   gcc-11
i386         buildonly-randconfig-006-20240728   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240728   gcc-13
i386                  randconfig-002-20240728   gcc-13
i386                  randconfig-003-20240728   gcc-7
i386                  randconfig-004-20240728   gcc-13
i386                  randconfig-005-20240728   clang-18
i386                  randconfig-006-20240728   gcc-13
i386                  randconfig-011-20240728   gcc-13
i386                  randconfig-012-20240728   gcc-12
i386                  randconfig-013-20240728   clang-18
i386                  randconfig-014-20240728   gcc-13
i386                  randconfig-015-20240728   gcc-13
i386                  randconfig-016-20240728   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240728   gcc-14.1.0
loongarch             randconfig-002-20240728   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                          multi_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           ip30_defconfig   gcc-14.1.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240728   gcc-14.1.0
nios2                 randconfig-002-20240728   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                randconfig-001-20240728   gcc-14.1.0
parisc                randconfig-002-20240728   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                    amigaone_defconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                      cm5200_defconfig   clang-20
powerpc                    ge_imp3a_defconfig   gcc-14.1.0
powerpc                     rainier_defconfig   gcc-14.1.0
powerpc                  storcenter_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240728   clang-20
powerpc64             randconfig-002-20240728   gcc-14.1.0
powerpc64             randconfig-003-20240728   clang-17
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                 randconfig-001-20240728   clang-20
riscv                 randconfig-002-20240728   clang-15
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240728   clang-16
s390                  randconfig-002-20240728   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240728   gcc-14.1.0
sh                    randconfig-002-20240728   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64               randconfig-001-20240728   gcc-14.1.0
sparc64               randconfig-002-20240728   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                    randconfig-001-20240728   gcc-11
um                    randconfig-002-20240728   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240728   gcc-13
x86_64       buildonly-randconfig-002-20240728   clang-18
x86_64       buildonly-randconfig-003-20240728   clang-18
x86_64       buildonly-randconfig-004-20240728   gcc-13
x86_64       buildonly-randconfig-005-20240728   clang-18
x86_64       buildonly-randconfig-006-20240728   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240728   clang-18
x86_64                randconfig-002-20240728   gcc-13
x86_64                randconfig-003-20240728   gcc-13
x86_64                randconfig-004-20240728   gcc-8
x86_64                randconfig-005-20240728   gcc-12
x86_64                randconfig-006-20240728   gcc-13
x86_64                randconfig-011-20240728   clang-18
x86_64                randconfig-012-20240728   clang-18
x86_64                randconfig-013-20240728   gcc-13
x86_64                randconfig-014-20240728   clang-18
x86_64                randconfig-015-20240728   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240728   gcc-14.1.0
xtensa                randconfig-002-20240728   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
