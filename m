Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA91946D0
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Dec 2024 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734281761; cv=none; b=hjf7yehhpFv7DawxOdWm8QBozr2Lj2c1oD60yKkOHUVBQUwvP0Mws64qE/cyqWUK9uv74FEOl66Gqa1HuIaUDkbnNKx5acfhtzNVYLezsj6I2wbsVzIF4V/MvnxMvF0+MJFl4FwUC+YgTqcuupTGGT35Mm+JIvd0cTeoRyXKklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734281761; c=relaxed/simple;
	bh=w0ObwMHrmbHUvdPcZp5FlZjRW53prGgDEAPIJzM7Mas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VaA4r5znwIpEjQnOK92sqMsZv8qaTBCYh/eLagcT2WS1tGYr6zvVhQylNjjERLYbvQZqN/wV9O7XCGAfhP6cfa0oQR+Dm4ytnnXdRjtiJzr57/auoduM7LwYkUAjRln2t4AToCKb6MqFdcPcQzcobYdGJVLQYUCWlgF9/R/VEmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlsCrTjB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlsCrTjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734281760; x=1765817760;
  h=date:from:to:cc:subject:message-id;
  bh=w0ObwMHrmbHUvdPcZp5FlZjRW53prGgDEAPIJzM7Mas=;
  b=QlsCrTjBECM8gAeaJ+XCB1h/wN0i0IN+JRORhAJulrlv5UtkMgUdYxwN
   fBuP6PDx96qtGTrIofO7OsVNMZtGxVevV6w8MZd8Sy29u4zJco2fF5SZ4
   V78yNcrJcioE2dkGraFetwQiprdnwqu4xcEndMIQ6F/Gp/TcgDAZy0Lej
   LJcV01xDAi+4/IzH9YVoOceta9twsEHFYYckDZldNGjIYRRaULlKzsvHm
   m2sWsiA3gL30BnX3J33xr12luNLuVFo0kY2j48442xyPdQPotQkRn3s2C
   YMn0Ove4BNRxX/FCAamJxJijIlao7nNzfbw3VYZdXaiiRDLxuDZMNPrei
   w==;
X-CSE-ConnectionGUID: fNAHrLusSuenCnqxKdlysg==
X-CSE-MsgGUID: cVeB3CyuSzShdx89zphGXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="22256093"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="22256093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 08:55:59 -0800
X-CSE-ConnectionGUID: CLP8p6hcSFe8WIMFaKcP9g==
X-CSE-MsgGUID: CjT6qXVGTbGZl7hGDX1kpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101137892"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Dec 2024 08:55:58 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMruO-000Dko-0F;
	Sun, 15 Dec 2024 16:55:56 +0000
Date: Mon, 16 Dec 2024 00:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 db6b0c4bcb558dd58b5e2f8f999327ba573ed106
Message-ID: <202412160032.JjkXd6IT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: db6b0c4bcb558dd58b5e2f8f999327ba573ed106  hwmon: (nct6683) Add customer ID for ASRock B650 Steel Legend WiFi

elapsed time: 1447m

configs tested: 122
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241215    gcc-13.2.0
arc                   randconfig-002-20241215    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                           imxrt_defconfig    clang-19
arm                   randconfig-001-20241215    clang-20
arm                   randconfig-002-20241215    clang-16
arm                   randconfig-003-20241215    gcc-14.2.0
arm                   randconfig-004-20241215    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241215    gcc-14.2.0
arm64                 randconfig-002-20241215    gcc-14.2.0
arm64                 randconfig-003-20241215    clang-20
arm64                 randconfig-004-20241215    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241215    gcc-14.2.0
csky                  randconfig-002-20241215    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241215    clang-20
hexagon               randconfig-002-20241215    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241215    gcc-12
i386        buildonly-randconfig-002-20241215    gcc-12
i386        buildonly-randconfig-003-20241215    gcc-12
i386        buildonly-randconfig-004-20241215    gcc-12
i386        buildonly-randconfig-005-20241215    gcc-12
i386        buildonly-randconfig-006-20241215    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241215    gcc-14.2.0
loongarch             randconfig-002-20241215    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241215    gcc-14.2.0
nios2                 randconfig-002-20241215    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20241215    gcc-14.2.0
parisc                randconfig-002-20241215    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241215    gcc-14.2.0
powerpc               randconfig-002-20241215    clang-20
powerpc               randconfig-003-20241215    gcc-14.2.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241215    gcc-14.2.0
powerpc64             randconfig-002-20241215    gcc-14.2.0
powerpc64             randconfig-003-20241215    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241215    clang-16
riscv                 randconfig-002-20241215    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241215    gcc-14.2.0
s390                  randconfig-002-20241215    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20241215    gcc-14.2.0
sh                    randconfig-002-20241215    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241215    gcc-14.2.0
sparc                 randconfig-002-20241215    gcc-14.2.0
sparc64               randconfig-001-20241215    gcc-14.2.0
sparc64               randconfig-002-20241215    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241215    gcc-12
um                    randconfig-002-20241215    clang-18
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241215    gcc-12
x86_64      buildonly-randconfig-002-20241215    clang-19
x86_64      buildonly-randconfig-003-20241215    clang-19
x86_64      buildonly-randconfig-004-20241215    gcc-12
x86_64      buildonly-randconfig-005-20241215    clang-19
x86_64      buildonly-randconfig-006-20241215    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241215    gcc-14.2.0
xtensa                randconfig-002-20241215    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
