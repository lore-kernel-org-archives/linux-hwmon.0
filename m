Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DBB224D7
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Sep 2024 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189966; cv=none; b=sm49FFSuM/nPtiGAU9HHeWBLdpwOu25aIMy6yW1Z91SHptzeVD5I/nMaa8TXfuXWbme8wZeJ3Ax9/M9CitUI2gijp7mUxmtDE9f1oEFMLtkS30TAHiUU+k5YkdSCLWVSxxBpaYJW2LBOgS4UOdCWpHUnz2l3eFGK6AOPuNFvKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189966; c=relaxed/simple;
	bh=yQGtpwjX3wvvsKmxcYbs/YYyKyAaoN/oixeMmMgQ15s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jR3d0kWj/qupkAVh6SNmY2IA3s4M/0FlE+5MFlDUPkEDZXTObi7mW0Sm9p9/Aq/wXu3BIkgyfownPwjUUTkX2iqL2S+KCxnTp6SdPMtrG48/ZRSnS+k2nvXaXLbXIGsfD+KsdhZYaFT0PLxUY0olUVhES6LX/OGMSIJHlfITS00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ys7QZxun; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys7QZxun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727189965; x=1758725965;
  h=date:from:to:cc:subject:message-id;
  bh=yQGtpwjX3wvvsKmxcYbs/YYyKyAaoN/oixeMmMgQ15s=;
  b=Ys7QZxunYZoBYeIInFJSeN1hbWDkgn7DM/UQ9lpUGXlsgnzCxK+sps4A
   c51fvpaC1V+khq8ZS6z3grH6jYjB9PoucMGuc1o9nF+ucLp3IcUpswq2O
   M6E3IgHA3li2BbdpaRMobrIxgqhBdau87dyh0fxRCNuXM+AjXs+2kenoL
   A6FqPGqzO44S1SwSXcJdTtZoOw1I/Fe/aoR6jnjd7YAvxcH4J7hA2fkPi
   SRjmInlV4SmWrvilE0y7OAVHWiDXvPUYwM79IMYAgQ/WYX782mFVvypJJ
   z+2+so8Wk2Mxlbc0UWrcHul7sh94biYczb+6oD26eIv9Z36Wm2t8a6e9Z
   Q==;
X-CSE-ConnectionGUID: aS6yNzSkRJqHA5uP91Pihw==
X-CSE-MsgGUID: vrtbMl7LT4+thmA06mveMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26286281"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="26286281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 07:59:25 -0700
X-CSE-ConnectionGUID: ZERaVEMOTbeZVgWDiv3RjQ==
X-CSE-MsgGUID: 9hgccTZXRoyP+DzrQGvjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="76392467"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 07:59:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st70a-000ITB-2D;
	Tue, 24 Sep 2024 14:59:20 +0000
Date: Tue, 24 Sep 2024 22:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 fdde020fb5e94f991726df84c8ca0efa5a135039
Message-ID: <202409242232.3PUZA7PV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: fdde020fb5e94f991726df84c8ca0efa5a135039  Merge branch 'fixes-v6.12' into testing

elapsed time: 727m

configs tested: 199
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                            hsdk_defconfig    clang-20
arc                   randconfig-001-20240924    gcc-14.1.0
arc                   randconfig-002-20240924    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    clang-20
arm                       imx_v6_v7_defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                        keystone_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                            qcom_defconfig    gcc-14.1.0
arm                   randconfig-001-20240924    gcc-14.1.0
arm                   randconfig-002-20240924    gcc-14.1.0
arm                   randconfig-003-20240924    gcc-14.1.0
arm                   randconfig-004-20240924    gcc-14.1.0
arm                           stm32_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240924    gcc-14.1.0
arm64                 randconfig-002-20240924    gcc-14.1.0
arm64                 randconfig-003-20240924    gcc-14.1.0
arm64                 randconfig-004-20240924    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240924    gcc-14.1.0
csky                  randconfig-002-20240924    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240924    gcc-14.1.0
hexagon               randconfig-002-20240924    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240924    clang-18
i386        buildonly-randconfig-001-20240924    gcc-12
i386        buildonly-randconfig-002-20240924    gcc-12
i386        buildonly-randconfig-003-20240924    clang-18
i386        buildonly-randconfig-003-20240924    gcc-12
i386        buildonly-randconfig-004-20240924    gcc-12
i386        buildonly-randconfig-005-20240924    gcc-12
i386        buildonly-randconfig-006-20240924    clang-18
i386        buildonly-randconfig-006-20240924    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240924    gcc-12
i386                  randconfig-002-20240924    gcc-12
i386                  randconfig-003-20240924    clang-18
i386                  randconfig-003-20240924    gcc-12
i386                  randconfig-004-20240924    gcc-12
i386                  randconfig-005-20240924    gcc-12
i386                  randconfig-006-20240924    clang-18
i386                  randconfig-006-20240924    gcc-12
i386                  randconfig-011-20240924    clang-18
i386                  randconfig-011-20240924    gcc-12
i386                  randconfig-012-20240924    clang-18
i386                  randconfig-012-20240924    gcc-12
i386                  randconfig-013-20240924    clang-18
i386                  randconfig-013-20240924    gcc-12
i386                  randconfig-014-20240924    clang-18
i386                  randconfig-014-20240924    gcc-12
i386                  randconfig-015-20240924    clang-18
i386                  randconfig-015-20240924    gcc-12
i386                  randconfig-016-20240924    clang-18
i386                  randconfig-016-20240924    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240924    gcc-14.1.0
loongarch             randconfig-002-20240924    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          multi_defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    clang-20
mips                     cu1830-neo_defconfig    clang-20
mips                     loongson1c_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240924    gcc-14.1.0
nios2                 randconfig-002-20240924    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20240924    gcc-14.1.0
parisc                randconfig-002-20240924    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     ep8248e_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.1.0
powerpc                        icon_defconfig    gcc-14.1.0
powerpc                   motionpro_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20240924    gcc-14.1.0
powerpc64             randconfig-002-20240924    gcc-14.1.0
powerpc64             randconfig-003-20240924    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-20
riscv                 randconfig-001-20240924    gcc-14.1.0
riscv                 randconfig-002-20240924    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240924    gcc-14.1.0
s390                  randconfig-002-20240924    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    clang-20
sh                         apsh4a3a_defconfig    clang-20
sh                         apsh4a3a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          polaris_defconfig    clang-20
sh                    randconfig-001-20240924    gcc-14.1.0
sh                    randconfig-002-20240924    gcc-14.1.0
sh                          rsk7264_defconfig    clang-20
sh                   rts7751r2dplus_defconfig    clang-20
sh                           se7722_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240924    gcc-14.1.0
sparc64               randconfig-002-20240924    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240924    gcc-14.1.0
um                    randconfig-002-20240924    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240924    clang-18
x86_64      buildonly-randconfig-002-20240924    clang-18
x86_64      buildonly-randconfig-003-20240924    clang-18
x86_64      buildonly-randconfig-004-20240924    clang-18
x86_64      buildonly-randconfig-005-20240924    clang-18
x86_64      buildonly-randconfig-006-20240924    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240924    clang-18
x86_64                randconfig-002-20240924    clang-18
x86_64                randconfig-003-20240924    clang-18
x86_64                randconfig-004-20240924    clang-18
x86_64                randconfig-005-20240924    clang-18
x86_64                randconfig-006-20240924    clang-18
x86_64                randconfig-011-20240924    clang-18
x86_64                randconfig-012-20240924    clang-18
x86_64                randconfig-013-20240924    clang-18
x86_64                randconfig-014-20240924    clang-18
x86_64                randconfig-015-20240924    clang-18
x86_64                randconfig-016-20240924    clang-18
x86_64                randconfig-071-20240924    clang-18
x86_64                randconfig-072-20240924    clang-18
x86_64                randconfig-073-20240924    clang-18
x86_64                randconfig-074-20240924    clang-18
x86_64                randconfig-075-20240924    clang-18
x86_64                randconfig-076-20240924    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240924    gcc-14.1.0
xtensa                randconfig-002-20240924    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
