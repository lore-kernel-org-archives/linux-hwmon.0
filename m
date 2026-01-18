Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796AF9C0
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Jan 2026 03:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768705302; cv=none; b=BdhDkK3B4l7VK4nR4213vOlz1L8MW96Iuc00lTnyee0vqxdswIbzEatudrGldvx144YuMOaxuzkBgiq8gcTdGML41FnCfvuthNc63Yol4amMw1I+wna4wbn/aCy2VXihSSsQ3VrGG8c/Ri79KWOZcPari3L0fqZ6/JJevUe2ZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768705302; c=relaxed/simple;
	bh=PB4Cx/Wz7A1B3eP0ICoxK8kXyCcgRVuJgDJIYfjmIlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PWXGjZO6C4ZR86rg/tdI9LA+Z1ZrJM3uVm4nfGBcz6Hoo2cpkDnJPZhAAIjl0gsM4qGUWrptOogeVxzF0bhURe2iNXYE/RUIVcPWiJGmg1O6saYv0lEJuJlkcjLPkW4Yo5R0fRf07ybACvYIir6+16O6HXBJ6pJVD+GwfuDpxIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEjIAK7G; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEjIAK7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768705300; x=1800241300;
  h=date:from:to:cc:subject:message-id;
  bh=PB4Cx/Wz7A1B3eP0ICoxK8kXyCcgRVuJgDJIYfjmIlA=;
  b=oEjIAK7GfqXt6J0PN02QQwzHCCuTRmywYl340D2Cf8IP/WlS1WnxbSI7
   k17GagCnDU2lP2P/nq8ttkzCOp8B2PyUDrWvmy3GLKMhNO8U1A/lXOzE/
   M3HsRfymWd2TlINqBneGo3yC4DTbbt3VNDIf6XY+i7IDfjW4CBrPw2hO0
   iqF1rZ2lyrZpei87A1NW35xOXjMMEJ456mxbc+PAM7qKlAiSFRjHz2xNL
   8j3Mati1wS7T+go72cgb+LDexj1jmNGA/WQwzpzhrbojZVORQ27mbT3jH
   uv9X3fcWeg496lXRegvCOSfjkusxBFbVS8OKyVYSIzJLLuDjlW1Cx4Wx+
   A==;
X-CSE-ConnectionGUID: iqqRBUX6RoCxM85yVIkh2w==
X-CSE-MsgGUID: U5nQPIKPSY+Ic4D0jBbuQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69699382"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="69699382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 19:01:39 -0800
X-CSE-ConnectionGUID: 1NGrCe7pQuyzAi0hytwZnw==
X-CSE-MsgGUID: 74HJOqQGQMGt5y4sFXQExA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="236248256"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jan 2026 19:01:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhJ2k-00000000Mam-4AsY;
	Sun, 18 Jan 2026 03:01:34 +0000
Date: Sun, 18 Jan 2026 11:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 21506a88d3d54243ee5e21cbbd4b0e0102cc9501
Message-ID: <202601181126.PkDqhBS3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 21506a88d3d54243ee5e21cbbd4b0e0102cc9501  hwmon: it87: add IT8613E configuration

elapsed time: 721m

configs tested: 250
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260118    gcc-15.2.0
arc                   randconfig-002-20260118    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         axm55xx_defconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                             pxa_defconfig    clang-22
arm                   randconfig-001-20260118    gcc-15.2.0
arm                   randconfig-002-20260118    gcc-15.2.0
arm                   randconfig-003-20260118    gcc-15.2.0
arm                   randconfig-004-20260118    gcc-15.2.0
arm                           sama5_defconfig    gcc-15.2.0
arm                         socfpga_defconfig    clang-22
arm                       spear13xx_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260117    gcc-15.2.0
arm64                 randconfig-001-20260118    clang-17
arm64                 randconfig-002-20260117    clang-22
arm64                 randconfig-002-20260118    clang-17
arm64                 randconfig-003-20260117    clang-18
arm64                 randconfig-003-20260118    clang-17
arm64                 randconfig-004-20260117    clang-22
arm64                 randconfig-004-20260118    clang-17
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260117    gcc-12.5.0
csky                  randconfig-001-20260118    clang-17
csky                  randconfig-002-20260117    gcc-15.2.0
csky                  randconfig-002-20260118    clang-17
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260118    clang-22
hexagon               randconfig-002-20260118    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260118    gcc-14
i386        buildonly-randconfig-002-20260118    gcc-14
i386        buildonly-randconfig-003-20260118    gcc-14
i386        buildonly-randconfig-004-20260118    gcc-14
i386        buildonly-randconfig-005-20260118    gcc-14
i386        buildonly-randconfig-006-20260118    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260117    gcc-13
i386                  randconfig-001-20260118    gcc-14
i386                  randconfig-002-20260117    gcc-14
i386                  randconfig-002-20260118    gcc-14
i386                  randconfig-003-20260117    clang-20
i386                  randconfig-003-20260118    gcc-14
i386                  randconfig-004-20260117    gcc-14
i386                  randconfig-004-20260118    clang-20
i386                  randconfig-004-20260118    gcc-14
i386                  randconfig-005-20260118    clang-20
i386                  randconfig-005-20260118    gcc-14
i386                  randconfig-006-20260118    gcc-14
i386                  randconfig-007-20260118    clang-20
i386                  randconfig-007-20260118    gcc-14
i386                  randconfig-011-20260118    clang-20
i386                  randconfig-012-20260118    clang-20
i386                  randconfig-013-20260118    clang-20
i386                  randconfig-014-20260118    clang-20
i386                  randconfig-015-20260118    clang-20
i386                  randconfig-016-20260118    clang-20
i386                  randconfig-017-20260118    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260118    clang-22
loongarch             randconfig-002-20260118    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    clang-22
mips                          eyeq6_defconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-22
mips                     loongson2k_defconfig    clang-22
nios2                         10m50_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260118    clang-22
nios2                 randconfig-002-20260118    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260117    gcc-12.5.0
parisc                randconfig-001-20260118    clang-22
parisc                randconfig-002-20260117    gcc-15.2.0
parisc                randconfig-002-20260118    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    clang-22
powerpc                   currituck_defconfig    clang-22
powerpc                   motionpro_defconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20260117    gcc-8.5.0
powerpc               randconfig-001-20260118    clang-22
powerpc               randconfig-002-20260117    clang-22
powerpc               randconfig-002-20260118    clang-22
powerpc                     tqm8540_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-001-20260118    clang-22
powerpc64             randconfig-002-20260117    gcc-8.5.0
powerpc64             randconfig-002-20260118    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260118    gcc-15.2.0
riscv                 randconfig-002-20260118    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260118    gcc-15.2.0
s390                  randconfig-002-20260118    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    clang-22
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260118    gcc-15.2.0
sh                    randconfig-002-20260118    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7722_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260118    gcc-12.5.0
sparc                 randconfig-002-20260118    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260118    gcc-12.5.0
sparc64               randconfig-002-20260118    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260118    gcc-12.5.0
um                    randconfig-002-20260118    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260118    gcc-14
x86_64      buildonly-randconfig-002-20260118    gcc-14
x86_64      buildonly-randconfig-003-20260118    gcc-14
x86_64      buildonly-randconfig-004-20260118    gcc-14
x86_64      buildonly-randconfig-005-20260118    gcc-14
x86_64      buildonly-randconfig-006-20260118    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260117    clang-20
x86_64                randconfig-001-20260118    gcc-14
x86_64                randconfig-002-20260117    clang-20
x86_64                randconfig-002-20260118    gcc-14
x86_64                randconfig-003-20260117    clang-20
x86_64                randconfig-003-20260118    gcc-14
x86_64                randconfig-004-20260117    clang-20
x86_64                randconfig-004-20260118    gcc-14
x86_64                randconfig-005-20260117    gcc-12
x86_64                randconfig-005-20260118    gcc-14
x86_64                randconfig-006-20260117    gcc-14
x86_64                randconfig-006-20260118    gcc-14
x86_64                randconfig-011-20260118    gcc-14
x86_64                randconfig-012-20260118    gcc-14
x86_64                randconfig-013-20260118    gcc-14
x86_64                randconfig-014-20260118    gcc-14
x86_64                randconfig-015-20260118    gcc-14
x86_64                randconfig-016-20260118    gcc-14
x86_64                randconfig-071-20260118    clang-20
x86_64                randconfig-072-20260118    clang-20
x86_64                randconfig-073-20260118    clang-20
x86_64                randconfig-074-20260118    clang-20
x86_64                randconfig-075-20260118    clang-20
x86_64                randconfig-076-20260118    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260118    gcc-12.5.0
xtensa                randconfig-002-20260118    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
