Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF51F7096
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448180; cv=none; b=gBgP/Di5xxcNKZZJzJw/PooIbBOgCQVtxZvkkC/NhPGGn5McewJythV8g2sxmZRpjghlq7Z+RG31rzZzDMQqh/jF5geX36+VvZSzEfysW9O6NJXCvAI7WTl5YCpWcU2wplAI1KfcUQ64GN9grVs3oEWhsnrbuTUwIurcOdCtAtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448180; c=relaxed/simple;
	bh=/kmaFVq3davhGXLhZ7tqNxrLaucF7/nXy1FPcL/hWWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ql64RGK/4SIVSONGGUxc5e2b4BpMZWrtUxNRFGe53RBIdBRtREWo36xTFCn/eqKwfbRAhGPJtH5CgRW1oWe1fY4+uT34aWApLAYeHthLRf/dP68Mj0RQ3btcgaEHxfBc4DwSRMqAil8S94t7ppQJJTOVDBDY45+cVA8LwDWZ6TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=au3lVmBq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="au3lVmBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734448178; x=1765984178;
  h=date:from:to:cc:subject:message-id;
  bh=/kmaFVq3davhGXLhZ7tqNxrLaucF7/nXy1FPcL/hWWs=;
  b=au3lVmBqCWhgbTk9O5YvVq0P2aowT3okuZWULVpgMW1G/O3yP56GLmMD
   R1Yho+eomiJQVq1QEGYVU51dXTPFdeWKGqSA71G0UWuLvBYzHElclTaQA
   vArq77PMb36Dy8AKQ0fwMioNfHBZmnYZJ2GOmnOjI2huEPQIuUaJ38BkB
   9DChCPQPoDYme8taPFUOMBIXVu7I3KhoGt8SP/8A1HAFM1j078ihGGA3I
   DjMIE9NWaO3O9IAkBbLorHOql9d7moVaHlS1yNi58gUNkZyOOZ9PZXQUS
   EDc/jhvQQYfiwHwaJ+3oXvo/40GsYPbKXDgrWgT8ZD4vcsP/t1nd9Oh1G
   w==;
X-CSE-ConnectionGUID: l9HYO12iRDaNLNksl8wZ0Q==
X-CSE-MsgGUID: daNsrMtlSHmyV3wUxbUn4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38656184"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="38656184"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:09:37 -0800
X-CSE-ConnectionGUID: PYciS9m+S0+8Yx2hQMtvQw==
X-CSE-MsgGUID: RvdVW0Z5TdSAr7cjCv+07w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98007350"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Dec 2024 07:09:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNZCY-000F5i-1k;
	Tue, 17 Dec 2024 15:09:34 +0000
Date: Tue, 17 Dec 2024 23:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 0e8df6ef3b855b00e618413ce01cb68f71f91598
Message-ID: <202412172304.cTUYIg3T-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: 0e8df6ef3b855b00e618413ce01cb68f71f91598  staging: gpib: fix pcmcia dependencies

elapsed time: 1449m

configs tested: 124
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241216    gcc-13.2.0
arc                   randconfig-002-20241216    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241216    clang-15
arm                   randconfig-002-20241216    gcc-14.2.0
arm                   randconfig-003-20241216    clang-20
arm                   randconfig-004-20241216    clang-17
arm                        spear6xx_defconfig    clang-19
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241216    gcc-14.2.0
arm64                 randconfig-002-20241216    clang-20
arm64                 randconfig-003-20241216    gcc-14.2.0
arm64                 randconfig-004-20241216    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241217    gcc-14.2.0
csky                  randconfig-002-20241217    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241217    clang-20
hexagon               randconfig-002-20241217    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241217    clang-19
i386        buildonly-randconfig-002-20241217    gcc-12
i386        buildonly-randconfig-003-20241217    gcc-12
i386        buildonly-randconfig-004-20241217    clang-19
i386        buildonly-randconfig-005-20241217    clang-19
i386        buildonly-randconfig-006-20241217    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241217    gcc-14.2.0
loongarch             randconfig-002-20241217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241217    gcc-14.2.0
nios2                 randconfig-002-20241217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241217    gcc-14.2.0
parisc                randconfig-002-20241217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241217    clang-20
powerpc               randconfig-002-20241217    gcc-14.2.0
powerpc               randconfig-003-20241217    clang-16
powerpc64             randconfig-001-20241217    gcc-14.2.0
powerpc64             randconfig-002-20241217    gcc-14.2.0
powerpc64             randconfig-003-20241217    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241217    gcc-14.2.0
riscv                 randconfig-002-20241217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241217    gcc-14.2.0
s390                  randconfig-002-20241217    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20241217    gcc-14.2.0
sh                    randconfig-002-20241217    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241217    gcc-14.2.0
sparc                 randconfig-002-20241217    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241217    gcc-14.2.0
sparc64               randconfig-002-20241217    gcc-14.2.0
um                               alldefconfig    clang-19
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241217    clang-20
um                    randconfig-002-20241217    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241217    clang-19
x86_64      buildonly-randconfig-002-20241217    gcc-12
x86_64      buildonly-randconfig-003-20241217    gcc-12
x86_64      buildonly-randconfig-004-20241217    clang-19
x86_64      buildonly-randconfig-005-20241217    gcc-12
x86_64      buildonly-randconfig-006-20241217    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241217    gcc-14.2.0
xtensa                randconfig-002-20241217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
