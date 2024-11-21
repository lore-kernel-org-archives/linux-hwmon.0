Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD6198A2F
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208249; cv=none; b=IHagO6x9sPbdfvjp2xzMKlVZUvsIOVFluTBq4fRo8N8NZPlRe4xOPL9z0HdGHXnMEAnVwayeo3qmiI4VLXrh4HjYkJU32RzSxREXfqmMrX3f+3t9F+F82SofEYKzZZytK177+f62V9HNw1cexgXNVKbaT4wFhNAqXGOBbORaGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208249; c=relaxed/simple;
	bh=b5vHddiqWW/KFxca7GsaWYbLzFTRyh7X1HFrRNK/eVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RP48w3Qe07lOCaa6UmC/qSphY7QJdQsanxmNZx9H5NMClhi/DCwsUbCeAyfVKDrVWoGSxAwkt6li/UBA7E/CoPdslwmN47HBh0He4PirHywHvehTKZ0A5+cO+f3Po1kjgi0cQX6Ps9oiN4vciGp8SJcy8oXxN1BOWSPcEyPM+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5RNLLRE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5RNLLRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732208247; x=1763744247;
  h=date:from:to:cc:subject:message-id;
  bh=b5vHddiqWW/KFxca7GsaWYbLzFTRyh7X1HFrRNK/eVM=;
  b=H5RNLLREemR5XFjTdhJmOJefsnMnaO5WY6ig3gB31BrTElm6y+BadB94
   fYH0A2fW+TwKwFkDDEAyINH3ATqKzjtjGMT5S6ijd1skM2iF+P1xzpPHM
   UHJ2zc3n1BURyvB66J47SVqdOnzWC8jhdGyt7vSzx7FqQcIt8kIH1O3TA
   1nhdGqieCIRBROHJX0SsNO2WVYFeUB1ylQRjVC681Z13StRhVhaqgY/8V
   2lttSWu3GZ0FIv4Ux/VHe/qVi05zWoOY7CkxwSkA+UtUGpCzVOoQp+SOA
   z/Q+5JBaimnOT8bHXXmgPibMnlbz1BOQ8XN2atVbJilKz5GdxPHRXijb1
   w==;
X-CSE-ConnectionGUID: wnL2kjGyRFuc50qBwiT1Qw==
X-CSE-MsgGUID: CxFAPo2HSPiSgPPuSsozAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42976107"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="42976107"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:57:26 -0800
X-CSE-ConnectionGUID: dAJIxrh3Sy2fRhlfFHYIjA==
X-CSE-MsgGUID: YhrcpS9tRr2vzX2LroQ4cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90728824"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2024 08:57:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEAUc-0003BV-2G;
	Thu, 21 Nov 2024 16:57:22 +0000
Date: Fri, 22 Nov 2024 00:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD REGRESSION
 b731b2c24d88f6782fdf6e1c19d735cd5aadeb3b
Message-ID: <202411220058.ijl2CNx9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: b731b2c24d88f6782fdf6e1c19d735cd5aadeb3b  Merge branch 'fixes-v6.13' into testing

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202411211850.BxMkSXmZ-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202411211946.6XukCd3K-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202411212020.XoC2kJ47-lkp@intel.com

    drivers/hwmon/hwmon.c:432:41: warning: pointer type mismatch ('long long *' and 'long *') [-Wpointer-type-mismatch]
    drivers/hwmon/hwmon.c:432:84: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
    drivers/hwmon/hwmon.c:432:84: warning: pointer type mismatch in conditional expression

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- alpha-defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- alpha-randconfig-r064-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- arc-alldefconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- arm-defconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- arm-gemini_defconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- arm-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- arm-randconfig-003-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- arm64-defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- arm64-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- arm64-randconfig-003-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- arm64-randconfig-004-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- csky-defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- csky-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- hexagon-allmodconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- hexagon-allyesconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- hexagon-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-allmodconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-allyesconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-buildonly-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-buildonly-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-buildonly-randconfig-003-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-buildonly-randconfig-004-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-buildonly-randconfig-006-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-defconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-randconfig-005-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-randconfig-006-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-randconfig-011-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-randconfig-013-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-randconfig-015-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-randconfig-016-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-randconfig-052-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-randconfig-053-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- i386-randconfig-054-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- i386-randconfig-141-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- loongarch-allmodconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- loongarch-allyesconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- loongarch-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- loongarch-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- loongarch-randconfig-r054-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- m68k-allmodconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- m68k-allyesconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- m68k-defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- microblaze-allmodconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- microblaze-allyesconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- microblaze-randconfig-r051-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- mips-allyesconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- mips-db1xxx_defconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- mips-randconfig-r054-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- nios2-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- nios2-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- parisc-defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- parisc-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- parisc-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- parisc-randconfig-r061-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- powerpc-allmodconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- powerpc-holly_defconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- powerpc-mpc832x_rdb_defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- powerpc-mpc837x_rdb_defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- powerpc-mpc866_ads_defconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- powerpc-ppc64e_defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- powerpc-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- powerpc-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- powerpc-randconfig-003-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- powerpc-randconfig-r071-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- powerpc64-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- riscv-defconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- s390-allmodconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- sh-allmodconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- sparc64-defconfig
|   `-- drivers-hwmon-hwmon.c:error:pointer-type-mismatch-in-conditional-expression
|-- um-allmodconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- um-allyesconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- x86_64-allyesconfig
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-buildonly-randconfig-001-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-buildonly-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- x86_64-buildonly-randconfig-003-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-buildonly-randconfig-004-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-buildonly-randconfig-005-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-buildonly-randconfig-006-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- x86_64-kexec
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-randconfig-002-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-randconfig-003-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-randconfig-006-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- x86_64-randconfig-011-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-randconfig-012-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-randconfig-013-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression
|-- x86_64-randconfig-014-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
|-- x86_64-randconfig-161-20241121
|   `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-(-long-long-and-long-)
`-- x86_64-rhel-9.4
    `-- drivers-hwmon-hwmon.c:warning:pointer-type-mismatch-in-conditional-expression

elapsed time: 737m

configs tested: 98
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                          gemini_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241121    clang-19
i386        buildonly-randconfig-002-20241121    clang-19
i386        buildonly-randconfig-003-20241121    clang-19
i386        buildonly-randconfig-004-20241121    clang-19
i386        buildonly-randconfig-005-20241121    clang-19
i386        buildonly-randconfig-006-20241121    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241121    clang-19
i386                  randconfig-002-20241121    clang-19
i386                  randconfig-003-20241121    clang-19
i386                  randconfig-004-20241121    clang-19
i386                  randconfig-005-20241121    clang-19
i386                  randconfig-006-20241121    clang-19
i386                  randconfig-011-20241121    clang-19
i386                  randconfig-012-20241121    clang-19
i386                  randconfig-013-20241121    clang-19
i386                  randconfig-014-20241121    clang-19
i386                  randconfig-015-20241121    clang-19
i386                  randconfig-016-20241121    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
