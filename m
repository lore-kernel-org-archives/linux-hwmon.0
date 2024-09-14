Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD81FB4
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Sep 2024 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726320123; cv=none; b=CQs3FOTd4sMOOrWF4V2943i/3CRv7HB8KNevjWtdjhcOWy2lK97LvirJU7FelX2SnB699dqyrLkjgJxTfSebBooInVucdQ9xpYcQ4pEyPRC0J0ntdBl2k3AQuhYdKRxupB5KB7hPhS0ZwRwrnIpXF5y9t+ilq+PV6N5d61VOgxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726320123; c=relaxed/simple;
	bh=Pg7RonRy5Hu1IBAMGW+cKau48bqsFnw0WjRxQS+e9k8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MS5tcOv6GFXSmI93B22z9uY7pIaC148ahlPNSpRo5x8Tx6pOTGoGPC2arwrhWM4lzHLfn4shE0RvoJ5dbvPsFdXnXrRkQUFOQq56gGpHrGqVtGEwl0tFcqegmCnXlHrm5KbLTgQKqO0pjQ6qz3zB28ca7aur+cWyU3yWgEsfY5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6T0GDPl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6T0GDPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726320121; x=1757856121;
  h=date:from:to:cc:subject:message-id;
  bh=Pg7RonRy5Hu1IBAMGW+cKau48bqsFnw0WjRxQS+e9k8=;
  b=K6T0GDPlL8HjcATFUDx5Z6toQhvLU27sypH41aaRB5xD6aT1A62/ZBtr
   23/o+SQxIqQ9jJuBurVrzsRHyYATZd/5lgdKpgPlprz+TzcBfUGIZYC0m
   iK4bAVug40lefVPbVNWko1+TyrjVcLyjiC8UEBqOjmrCykiiAFwL0H/X9
   ejMUUi+360gMNnaQTJk0/mGFwbJQShzOKkwgtzc73PyDXi0GDaF+qpH35
   bTc8AndiB+bCN0F6FOnAptSmoA7Y/eZa9VL+AkLmjvt3kwz8QQ0rKs3uo
   tEa1uZaGJLZd9Nx6W6G6kbek1RGpomcQC/AmREGSapMBZP1iyRRrYfs5S
   A==;
X-CSE-ConnectionGUID: H+aH3rdqRqufVPSYF2dMdw==
X-CSE-MsgGUID: QNHoXwRNSgqmkwNroELkNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25100025"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25100025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 06:22:00 -0700
X-CSE-ConnectionGUID: zicoVp3pTTmEqgL8e4Ci6g==
X-CSE-MsgGUID: 0KJBLVcUQ1yKgzc68jy+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72786263"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2024 06:22:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spSir-0007ly-1q;
	Sat, 14 Sep 2024 13:21:57 +0000
Date: Sat, 14 Sep 2024 21:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 fbd0d41a749d1803572b7448dc98bd6da6568819
Message-ID: <202409142126.p3Bf1e0b-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: fbd0d41a749d1803572b7448dc98bd6da6568819  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1209m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                            mmp2_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    clang-20
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240914    clang-18
i386        buildonly-randconfig-002-20240914    clang-18
i386        buildonly-randconfig-003-20240914    clang-18
i386        buildonly-randconfig-004-20240914    clang-18
i386        buildonly-randconfig-005-20240914    clang-18
i386        buildonly-randconfig-006-20240914    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240914    clang-18
i386                  randconfig-002-20240914    clang-18
i386                  randconfig-003-20240914    clang-18
i386                  randconfig-004-20240914    clang-18
i386                  randconfig-005-20240914    clang-18
i386                  randconfig-006-20240914    clang-18
i386                  randconfig-011-20240914    clang-18
i386                  randconfig-012-20240914    clang-18
i386                  randconfig-013-20240914    clang-18
i386                  randconfig-014-20240914    clang-18
i386                  randconfig-015-20240914    clang-18
i386                  randconfig-016-20240914    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    clang-20
m68k                        m5307c3_defconfig    clang-20
m68k                          multi_defconfig    clang-20
m68k                        mvme16x_defconfig    clang-20
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    clang-20
mips                     loongson1b_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                      pic32mzda_defconfig    clang-20
mips                           xway_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    clang-20
parisc                           alldefconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      bamboo_defconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                      chrp32_defconfig    clang-20
powerpc                   microwatt_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      ppc44x_defconfig    clang-20
powerpc                     rainier_defconfig    clang-20
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7705_defconfig    clang-20
sh                            shmin_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240914    clang-18
x86_64      buildonly-randconfig-002-20240914    clang-18
x86_64      buildonly-randconfig-003-20240914    clang-18
x86_64      buildonly-randconfig-004-20240914    clang-18
x86_64      buildonly-randconfig-005-20240914    clang-18
x86_64      buildonly-randconfig-006-20240914    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240914    clang-18
x86_64                randconfig-002-20240914    clang-18
x86_64                randconfig-003-20240914    clang-18
x86_64                randconfig-004-20240914    clang-18
x86_64                randconfig-005-20240914    clang-18
x86_64                randconfig-006-20240914    clang-18
x86_64                randconfig-011-20240914    clang-18
x86_64                randconfig-012-20240914    clang-18
x86_64                randconfig-013-20240914    clang-18
x86_64                randconfig-014-20240914    clang-18
x86_64                randconfig-015-20240914    clang-18
x86_64                randconfig-016-20240914    clang-18
x86_64                randconfig-071-20240914    clang-18
x86_64                randconfig-072-20240914    clang-18
x86_64                randconfig-073-20240914    clang-18
x86_64                randconfig-074-20240914    clang-18
x86_64                randconfig-075-20240914    clang-18
x86_64                randconfig-076-20240914    clang-18
x86_64                          rhel-8.3-rust    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
