Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C026290
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Feb 2026 05:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770786799; cv=none; b=BfX1PsTcB62VEwxqoFt4g5R/qla46pgeh1Kxq5IC7PVdgMBH0w13D91eULjKSR8Osb6+zMPHBf5xUh3vFf0+7ben+BaggytO18HyUxTaIaByCb+yBzVlGWWdPWzvZPlGoIFbmP7+e9oXYOU1cfvUxFu4S42yPRHoXnU1nS4nVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770786799; c=relaxed/simple;
	bh=dHZkiwZTNhIcMOKRRT3ZvMsX/Lquio0YzhMM6sIeFdA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4Fkd1mfLe4J1FzYK/7YTghxrh11wwOJi6InwGj4DqsG5D0YuRcYfDgSPpFInRvuHcd2YlRPBJ86z4DymmgdBGZ5TfgG9zLabFqLY3D7H/wIPJOcWCuYXoPmjmcUVdztp3FdfnB5E7DZTMSStJX3H3qg89Lwv2tBZhS/v5KYmd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ey5zUHny; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ey5zUHny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770786799; x=1802322799;
  h=date:from:to:cc:subject:message-id;
  bh=dHZkiwZTNhIcMOKRRT3ZvMsX/Lquio0YzhMM6sIeFdA=;
  b=ey5zUHnyaK6cfuPh72oxfgSE0tukCpaY9XCmeLAqjbTaC46NVwqAYQKE
   7A0jkBGYtVGdhGY6po6MLpGBG9pGaNcVEQCyC0vTcuNSfgg5lMdNJpPXq
   54wvseZCtay4w4SOQvKfkmhQheisZuNPQhWQzfWgHOFln04unDUMDuJRa
   I0aUGhLbvfver52s+lDdrx+vwGTUsQYamVwCKGxO/1pNm+9qrktMOEXHo
   ZkX+sw0bY36ZvSIyrH1Fwi6j5tbBqsx8DFYdYmfj/UbiyrjQhUHph1cCT
   FPX3VXUYp9y56X4xPp41NXZ1oqYNLDcrE6gc+9cysk4/egYej2oeXX3wx
   g==;
X-CSE-ConnectionGUID: /V4rz6fASyu2QOUTnDzYUQ==
X-CSE-MsgGUID: clqhV04vQQ63L96X2hwfMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83366080"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83366080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 21:13:15 -0800
X-CSE-ConnectionGUID: g0vEuiwvQoS7kCLt8+G6jQ==
X-CSE-MsgGUID: jz/sz8RKSzO61FYt+sa8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211753323"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2026 21:13:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq2XG-00000000pgu-2rJH;
	Wed, 11 Feb 2026 05:13:10 +0000
Date: Wed, 11 Feb 2026 13:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9e33c1dba22431bea9b2bf48adf56859e52fc7ec
Message-ID: <202602111334.EeXT0mgp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9e33c1dba22431bea9b2bf48adf56859e52fc7ec  hwmon: (pmbus/mpq8785) fix VOUT_MODE mismatch during identification

elapsed time: 827m

configs tested: 227
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-22
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-22
arc                            hsdk_defconfig    gcc-15.2.0
arc                   randconfig-001-20260211    gcc-8.5.0
arc                   randconfig-001-20260211    gcc-9.5.0
arc                   randconfig-002-20260211    gcc-8.5.0
arc                   randconfig-002-20260211    gcc-9.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                         assabet_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    gcc-15.2.0
arm                            hisi_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                        multi_v7_defconfig    clang-22
arm                          pxa910_defconfig    gcc-15.2.0
arm                             pxa_defconfig    clang-22
arm                             pxa_defconfig    gcc-15.2.0
arm                   randconfig-001-20260211    gcc-10.5.0
arm                   randconfig-001-20260211    gcc-8.5.0
arm                   randconfig-002-20260211    gcc-8.5.0
arm                   randconfig-003-20260211    clang-22
arm                   randconfig-003-20260211    gcc-8.5.0
arm                   randconfig-004-20260211    gcc-8.5.0
arm                          sp7021_defconfig    clang-22
arm                           sunxi_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260211    gcc-15.2.0
arm64                 randconfig-002-20260211    gcc-15.2.0
arm64                 randconfig-003-20260211    gcc-15.2.0
arm64                 randconfig-004-20260211    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260211    gcc-15.2.0
csky                  randconfig-002-20260211    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260211    clang-22
hexagon               randconfig-002-20260211    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260211    clang-20
i386        buildonly-randconfig-002-20260211    clang-20
i386        buildonly-randconfig-003-20260211    clang-20
i386        buildonly-randconfig-004-20260211    clang-20
i386        buildonly-randconfig-005-20260211    clang-20
i386        buildonly-randconfig-006-20260211    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260211    gcc-14
i386                  randconfig-002-20260211    gcc-14
i386                  randconfig-003-20260211    gcc-14
i386                  randconfig-004-20260211    gcc-14
i386                  randconfig-005-20260211    gcc-14
i386                  randconfig-006-20260211    gcc-14
i386                  randconfig-007-20260211    gcc-14
i386                  randconfig-011-20260211    clang-20
i386                  randconfig-012-20260211    clang-20
i386                  randconfig-013-20260211    clang-20
i386                  randconfig-014-20260211    clang-20
i386                  randconfig-015-20260211    clang-20
i386                  randconfig-016-20260211    clang-20
i386                  randconfig-017-20260211    clang-20
loongarch                        alldefconfig    clang-22
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    clang-22
loongarch             randconfig-001-20260211    clang-22
loongarch             randconfig-002-20260211    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         amcore_defconfig    clang-22
m68k                                defconfig    clang-19
m68k                       m5475evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ci20_defconfig    gcc-15.2.0
mips                         cobalt_defconfig    gcc-15.2.0
mips                          rm200_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260211    clang-22
nios2                 randconfig-002-20260211    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
openrisc                    or1ksim_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    clang-22
parisc                randconfig-001-20260211    clang-22
parisc                randconfig-002-20260211    clang-22
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    clang-22
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      arches_defconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.2.0
powerpc                      katmai_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc                      ppc44x_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260211    clang-22
powerpc               randconfig-002-20260211    clang-22
powerpc64             randconfig-001-20260211    clang-22
powerpc64             randconfig-002-20260211    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260211    gcc-13.4.0
riscv                 randconfig-002-20260211    gcc-13.4.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260211    gcc-13.4.0
s390                  randconfig-002-20260211    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          lboxre2_defconfig    gcc-15.2.0
sh                     magicpanelr2_defconfig    clang-22
sh                    randconfig-001-20260211    gcc-13.4.0
sh                    randconfig-002-20260211    gcc-13.4.0
sh                           se7721_defconfig    gcc-15.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.2.0
sh                            titan_defconfig    gcc-15.2.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260211    gcc-13.4.0
sparc                 randconfig-002-20260211    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260211    gcc-13.4.0
sparc64               randconfig-002-20260211    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260211    gcc-13.4.0
um                    randconfig-002-20260211    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260211    clang-20
x86_64      buildonly-randconfig-001-20260211    gcc-12
x86_64      buildonly-randconfig-002-20260211    gcc-12
x86_64      buildonly-randconfig-002-20260211    gcc-14
x86_64      buildonly-randconfig-003-20260211    gcc-12
x86_64      buildonly-randconfig-003-20260211    gcc-14
x86_64      buildonly-randconfig-004-20260211    gcc-12
x86_64      buildonly-randconfig-005-20260211    clang-20
x86_64      buildonly-randconfig-005-20260211    gcc-12
x86_64      buildonly-randconfig-006-20260211    clang-20
x86_64      buildonly-randconfig-006-20260211    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260211    clang-20
x86_64                randconfig-002-20260211    clang-20
x86_64                randconfig-003-20260211    clang-20
x86_64                randconfig-004-20260211    clang-20
x86_64                randconfig-005-20260211    clang-20
x86_64                randconfig-006-20260211    clang-20
x86_64                randconfig-011-20260211    gcc-14
x86_64                randconfig-012-20260211    gcc-14
x86_64                randconfig-013-20260211    gcc-14
x86_64                randconfig-014-20260211    gcc-14
x86_64                randconfig-015-20260211    gcc-14
x86_64                randconfig-016-20260211    gcc-14
x86_64                randconfig-071-20260211    clang-20
x86_64                randconfig-072-20260211    clang-20
x86_64                randconfig-073-20260211    clang-20
x86_64                randconfig-074-20260211    clang-20
x86_64                randconfig-075-20260211    clang-20
x86_64                randconfig-076-20260211    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260211    gcc-13.4.0
xtensa                randconfig-002-20260211    gcc-13.4.0
xtensa                    smp_lx200_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
