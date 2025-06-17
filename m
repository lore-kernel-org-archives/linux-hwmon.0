Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95937262B
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Jun 2025 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155920; cv=none; b=Tv0RoaXdaD66z25bDYiJPsPRIrTPFKQzBVb39L9T/dOfqP2WJoCin5Wl4U+oWNHf4AKjoOVFxsWrAvswDqwQp4O6fVG8E7Xqgv2uDQgr6b5uQlvtxGR37PUpgxrNDKgGfDawW7a+HIMLX69fniTpm7qAdeA6VOgY+sP2pyaoWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155920; c=relaxed/simple;
	bh=DeNwVpalWiiFTAwt91MN6QXvnS4xO/bkpBb7Jb5T5tw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W/93wbATWxhzphUlQ09GgAbzSntBz6sY1b3HDAtGf9hALP78YQCuWGn5fkhTKZpumeFB3GhBfSnIqFjkkR42rv4bw0M9uLd6vV77EM8fWnKuv+8AEbbZPv0zXDuNOHHCFaihsA8xU7MjAWlMOdkF0F2kqq+DfRX32qYCfsygDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFN/Q67h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFN/Q67h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750155919; x=1781691919;
  h=date:from:to:cc:subject:message-id;
  bh=DeNwVpalWiiFTAwt91MN6QXvnS4xO/bkpBb7Jb5T5tw=;
  b=hFN/Q67hgmk+absM3CQtmjLATCWW8/3VHRvbxsYnbpkGjd8uxWgKAOox
   Za4CrtcIyctCvWzKuxDi/FX+hkrUzeY1Ik3+mIjG5343lzhbhuyEXpMBk
   CvGP2Z3lt9O/5J31J2twKYCfAMEQjt6jyQ0XsCgMDeRaPPgfbWJGqBivS
   Egqy/lOw1hEcaNdn4kdx0L6+o7SShwaefgSfV4UyVgWmqJzY1sfdwrunV
   isxlKibrVDMwZ6WoEovdyM0BcpouxL+IfVR5vsw8USd2cpKBDIIA98Hha
   Vmo24q7oDMuH5xPctFMUO5/Ywa01b8DFNPDd1OeRT+yS0aSaueS4ljTuR
   g==;
X-CSE-ConnectionGUID: cfrLb/scSiG6/G3zT6C8mA==
X-CSE-MsgGUID: czjF1JinTe+WONiGMm4CxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62977836"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="62977836"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:25:17 -0700
X-CSE-ConnectionGUID: cp6BFhuGRtWynX2gSCZtQg==
X-CSE-MsgGUID: nZEh2BUWSnGLc2PgB59lQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148721935"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 03:25:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRTVB-000FsS-14;
	Tue, 17 Jun 2025 10:25:13 +0000
Date: Tue, 17 Jun 2025 18:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 201c2106d09943853c2484762095664569ddd552
Message-ID: <202506171840.dlqd5xCr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 201c2106d09943853c2484762095664569ddd552  Merge branch 'fixes-v6.16' into testing

elapsed time: 931m

configs tested: 228
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250617    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-15.1.0
arc                           tb10x_defconfig    clang-21
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                           h3600_defconfig    clang-21
arm                       multi_v4t_defconfig    gcc-15.1.0
arm                   randconfig-001-20250617    gcc-11.5.0
arm                   randconfig-001-20250617    gcc-8.5.0
arm                   randconfig-002-20250617    clang-21
arm                   randconfig-002-20250617    gcc-11.5.0
arm                   randconfig-003-20250617    clang-21
arm                   randconfig-003-20250617    gcc-11.5.0
arm                   randconfig-004-20250617    clang-21
arm                   randconfig-004-20250617    gcc-11.5.0
arm64                            alldefconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250617    gcc-11.5.0
arm64                 randconfig-002-20250617    clang-21
arm64                 randconfig-002-20250617    gcc-11.5.0
arm64                 randconfig-003-20250617    gcc-11.5.0
arm64                 randconfig-003-20250617    gcc-8.5.0
arm64                 randconfig-004-20250617    gcc-11.5.0
arm64                 randconfig-004-20250617    gcc-12.3.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250617    clang-21
csky                  randconfig-001-20250617    gcc-13.3.0
csky                  randconfig-002-20250617    clang-21
csky                  randconfig-002-20250617    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250617    clang-21
hexagon               randconfig-002-20250617    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250617    gcc-12
i386        buildonly-randconfig-002-20250617    clang-20
i386        buildonly-randconfig-002-20250617    gcc-12
i386        buildonly-randconfig-003-20250617    gcc-12
i386        buildonly-randconfig-004-20250617    gcc-12
i386        buildonly-randconfig-005-20250617    gcc-12
i386        buildonly-randconfig-006-20250617    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250617    gcc-12
i386                  randconfig-002-20250617    gcc-12
i386                  randconfig-003-20250617    gcc-12
i386                  randconfig-004-20250617    gcc-12
i386                  randconfig-005-20250617    gcc-12
i386                  randconfig-006-20250617    gcc-12
i386                  randconfig-007-20250617    gcc-12
i386                  randconfig-011-20250617    clang-20
i386                  randconfig-012-20250617    clang-20
i386                  randconfig-013-20250617    clang-20
i386                  randconfig-014-20250617    clang-20
i386                  randconfig-015-20250617    clang-20
i386                  randconfig-016-20250617    clang-20
i386                  randconfig-017-20250617    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250617    clang-21
loongarch             randconfig-001-20250617    gcc-15.1.0
loongarch             randconfig-002-20250617    clang-21
loongarch             randconfig-002-20250617    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                            alldefconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250617    clang-21
nios2                 randconfig-001-20250617    gcc-10.5.0
nios2                 randconfig-002-20250617    clang-21
nios2                 randconfig-002-20250617    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250617    clang-21
parisc                randconfig-001-20250617    gcc-8.5.0
parisc                randconfig-002-20250617    clang-21
parisc                randconfig-002-20250617    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250617    clang-21
powerpc               randconfig-001-20250617    gcc-8.5.0
powerpc               randconfig-002-20250617    clang-16
powerpc               randconfig-002-20250617    clang-21
powerpc               randconfig-003-20250617    clang-21
powerpc               randconfig-003-20250617    gcc-12.4.0
powerpc                    sam440ep_defconfig    clang-21
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250617    clang-21
powerpc64             randconfig-001-20250617    gcc-14.3.0
powerpc64             randconfig-002-20250617    clang-21
powerpc64             randconfig-003-20250617    clang-21
powerpc64             randconfig-003-20250617    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250617    clang-21
riscv                 randconfig-001-20250617    gcc-12.4.0
riscv                 randconfig-002-20250617    gcc-10.5.0
riscv                 randconfig-002-20250617    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250617    clang-21
s390                  randconfig-001-20250617    gcc-12.4.0
s390                  randconfig-002-20250617    clang-20
s390                  randconfig-002-20250617    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250617    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-14.3.0
sh                           se7724_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250617    gcc-12.4.0
sparc                 randconfig-002-20250617    gcc-12.4.0
sparc                 randconfig-002-20250617    gcc-13.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250617    gcc-12.4.0
sparc64               randconfig-001-20250617    gcc-15.1.0
sparc64               randconfig-002-20250617    gcc-12.4.0
sparc64               randconfig-002-20250617    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250617    gcc-12
um                    randconfig-001-20250617    gcc-12.4.0
um                    randconfig-002-20250617    clang-21
um                    randconfig-002-20250617    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250617    clang-20
x86_64      buildonly-randconfig-001-20250617    gcc-12
x86_64      buildonly-randconfig-002-20250617    clang-20
x86_64      buildonly-randconfig-002-20250617    gcc-12
x86_64      buildonly-randconfig-003-20250617    gcc-11
x86_64      buildonly-randconfig-003-20250617    gcc-12
x86_64      buildonly-randconfig-004-20250617    gcc-12
x86_64      buildonly-randconfig-005-20250617    gcc-12
x86_64      buildonly-randconfig-006-20250617    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250617    gcc-12
x86_64                randconfig-002-20250617    gcc-12
x86_64                randconfig-003-20250617    gcc-12
x86_64                randconfig-004-20250617    gcc-12
x86_64                randconfig-005-20250617    gcc-12
x86_64                randconfig-006-20250617    gcc-12
x86_64                randconfig-007-20250617    gcc-12
x86_64                randconfig-008-20250617    gcc-12
x86_64                randconfig-071-20250617    clang-20
x86_64                randconfig-072-20250617    clang-20
x86_64                randconfig-073-20250617    clang-20
x86_64                randconfig-074-20250617    clang-20
x86_64                randconfig-075-20250617    clang-20
x86_64                randconfig-076-20250617    clang-20
x86_64                randconfig-077-20250617    clang-20
x86_64                randconfig-078-20250617    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250617    gcc-10.5.0
xtensa                randconfig-001-20250617    gcc-12.4.0
xtensa                randconfig-002-20250617    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
