Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547522741AB
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 05:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763618071; cv=none; b=F82hmyrLw+CndmjVxi3VlbclR6KTZ/o/A+3ZMh4UYKbi/VCh5lYWYE6hjGzpUBYHgL/VJ+tCKXT3l13chJ7SR4siYZuWgY61eh2oqBHeQhqoEpERZi55UdwqXp10XXYt3NoL4NofzxtdylhvUuifA+nvFeABDcwKnywtV/uO3ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763618071; c=relaxed/simple;
	bh=+vRDBEyde8LnqOdOXIAkvHYVjR/9zyebWlK2HtAgLSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ilnsoGOG5dcESDMudsOAHbRWQCx5xD2yCtdjNnVhb6RwCqV+VvdMPA37dUPM9qcTRlTxJP927OfTWkJSdhzJ4P990fbzk7Z7xLhcgT8I//2dsWQesbPGKexs4hWuJjwlIQ++2naZtm55TG9Fr3oYxKORwWbF4ToLNSNee+YayLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRYUf6ye; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRYUf6ye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763618069; x=1795154069;
  h=date:from:to:cc:subject:message-id;
  bh=+vRDBEyde8LnqOdOXIAkvHYVjR/9zyebWlK2HtAgLSc=;
  b=NRYUf6yewOOsCcGTSZaemAjZUO4sp+bIe52itRzTnKsSfSE9vb91iHua
   TWAVxGTyqajqmL9dujubaipYuRRk6WM4gV39oWxL1wzy2KP8MFBcYURvY
   EydcilmqHyw9/i7o9MtlW3RN//lcRbWh0Jopb5qrZOco3VhTNAbVpEdRf
   fnl08vG6cpnZ/rBzhW50zOnkh0RVHslkS0c5XFxVv3RCUOTmo2U0ynyv3
   vSWZPd2/gc+vHKAfUWar85zFxW1sBjqOzC5UPwDDRcnOldj3GAZ0/S18N
   6BHv2eGsndIEGfGVQ2W/1kG7Aci/0BF1IVl56MjWAi/FIB168KGABIM8y
   g==;
X-CSE-ConnectionGUID: Nb752xoYRJG+cdDHB7xLAQ==
X-CSE-MsgGUID: W9N4IvxSQ+qXBNFt499qLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65711512"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65711512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 21:54:29 -0800
X-CSE-ConnectionGUID: lrk3gS8sR9OJ5aBErQVWJg==
X-CSE-MsgGUID: Gjz8R0WbSlOG0pV0XX7KLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191058219"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2025 21:54:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLxcf-0003eJ-0s;
	Thu, 20 Nov 2025 05:54:25 +0000
Date: Thu, 20 Nov 2025 13:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 d56933e74d0d691dcd642876feda0b30f397e2ad
Message-ID: <202511201356.aSvMp3ii-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: d56933e74d0d691dcd642876feda0b30f397e2ad  hwmon: (k10temp) Add AMD Steam Deck APU ID

elapsed time: 1564m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251119    gcc-10.5.0
arc                   randconfig-002-20251119    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20251119    gcc-8.5.0
arm                   randconfig-002-20251119    clang-16
arm                   randconfig-003-20251119    clang-22
arm                   randconfig-004-20251119    gcc-13.4.0
arm64                             allnoconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251120    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251120    clang-22
hexagon               randconfig-002-20251120    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-002-20251120    gcc-14
i386        buildonly-randconfig-003-20251120    clang-20
i386        buildonly-randconfig-004-20251120    clang-20
i386                  randconfig-001-20251120    gcc-14
i386                  randconfig-002-20251120    gcc-14
i386                  randconfig-003-20251120    clang-20
i386                  randconfig-004-20251120    clang-20
i386                  randconfig-005-20251120    clang-20
i386                  randconfig-006-20251120    clang-20
i386                  randconfig-007-20251120    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251120    clang-22
loongarch             randconfig-002-20251120    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251120    gcc-9.5.0
nios2                 randconfig-002-20251120    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251119    gcc-8.5.0
parisc                randconfig-002-20251119    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc               randconfig-001-20251119    clang-16
powerpc               randconfig-002-20251119    clang-22
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20251119    clang-19
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251119    gcc-15.1.0
riscv                 randconfig-002-20251119    gcc-10.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251119    gcc-8.5.0
s390                  randconfig-002-20251119    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251119    gcc-11.5.0
sh                    randconfig-002-20251119    gcc-9.5.0
sh                           sh2007_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251120    gcc-8.5.0
sparc                 randconfig-002-20251120    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251120    clang-20
sparc64               randconfig-002-20251120    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251120    gcc-14
um                    randconfig-002-20251120    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251120    clang-20
x86_64      buildonly-randconfig-002-20251120    clang-20
x86_64      buildonly-randconfig-003-20251120    clang-20
x86_64      buildonly-randconfig-004-20251120    clang-20
x86_64      buildonly-randconfig-005-20251120    gcc-14
x86_64      buildonly-randconfig-006-20251120    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251120    gcc-14
x86_64                randconfig-002-20251120    clang-20
x86_64                randconfig-003-20251120    clang-20
x86_64                randconfig-004-20251120    gcc-14
x86_64                randconfig-005-20251120    gcc-12
x86_64                randconfig-006-20251120    gcc-14
x86_64                randconfig-011-20251120    clang-20
x86_64                randconfig-012-20251120    gcc-13
x86_64                randconfig-013-20251120    gcc-14
x86_64                randconfig-014-20251120    gcc-14
x86_64                randconfig-015-20251120    gcc-14
x86_64                randconfig-016-20251120    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251120    gcc-15.1.0
xtensa                randconfig-002-20251120    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
