Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCD9192584
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Sep 2024 17:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727715755; cv=none; b=W1qwt/FxtGrEasMd+3r1BK7s2PJ7YBrLq+wurUVdTsp/Bm66ry2qhh69f32JnkhS0IultOERvwK8mCx0Wi9+p35lmMx/yfAWXW5dpYN0j5KrvsiRst2OurRiDla4AlVXmAzgvCy4NOow864fBK3WJVcWkMopI/Zq3BSlJDndBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727715755; c=relaxed/simple;
	bh=HAElg3oVJvTuKG8ieqbpoSCTSX5MC+lN1kNVCEPC4EE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jeW1wXsejcSximDATcjT4JT+h1pUZOhgAmrDB8QEQDnmJanw9BsPH0s5TQdPSuOF2acnYZwrBWm5R3JcBQnDk1Jyc+ZA7+ly62KYF9k3y94a2tFwviqVTIKb6RapxWeeMSX1CcNLB9kl+A+xYwzGotoxt+tCLnWRTLmC3MCkOuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hw0QagWm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hw0QagWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727715753; x=1759251753;
  h=date:from:to:cc:subject:message-id;
  bh=HAElg3oVJvTuKG8ieqbpoSCTSX5MC+lN1kNVCEPC4EE=;
  b=Hw0QagWmP1Nbz7ejfbjXvtC0BRwVEIbhjNNa3UWgdhPGtSGMUzkP/mMM
   7ez2I71G39tMMoY7G1IVhdgXKWc+CLzIv/U0VarU3AO/6g4hteIMt+WiL
   walNRtmL0ZERkbvgoP6SriMC47hp+p7+icP/EOe75qIfeNZPkmO5oVeXI
   6Y50+8oz8u9GTHxB6W8YMzsRbdhCepaU8snUqhhgz2VU8GbBZ1rPaNvqQ
   dmH2Kw9rduBRgwApO6VX1nSGTcIS7nuGX+ZUkHmqGslN0LoTTOiCCLGii
   pxnF7DUW3PSBDBiZxPw2qnN7+1y6OTNQ2ySOHPgHcMy2/VS8MvF5za0ep
   Q==;
X-CSE-ConnectionGUID: jwxkCgjPQs2HQJMS73kbXQ==
X-CSE-MsgGUID: kIbfQnSNR0KjdMMWOfuI8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="49341611"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="49341611"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 10:02:27 -0700
X-CSE-ConnectionGUID: DMk8JvvbQY+jycaoUp5Yuw==
X-CSE-MsgGUID: RPZECZjHSd+Iiwm4998MBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="77436831"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2024 10:02:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svJmv-000PhR-2s;
	Mon, 30 Sep 2024 17:02:21 +0000
Date: Tue, 01 Oct 2024 01:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 f5002abdef344631064d13432915f65acb7e3eca
Message-ID: <202410010156.Y8aM8ekt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f5002abdef344631064d13432915f65acb7e3eca  hwmon: (adt7475) Fix memory leak in adt7475_fan_pwm_config()

elapsed time: 1069m

configs tested: 218
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    clang-20
arc                     haps_hs_smp_defconfig    gcc-14.1.0
arc                   randconfig-001-20240930    clang-15
arc                   randconfig-002-20240930    clang-15
arc                           tb10x_defconfig    clang-20
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          ep93xx_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.1.0
arm                         orion5x_defconfig    clang-20
arm                   randconfig-001-20240930    clang-15
arm                   randconfig-002-20240930    clang-15
arm                   randconfig-003-20240930    clang-15
arm                   randconfig-004-20240930    clang-15
arm                        realview_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240930    clang-15
arm64                 randconfig-002-20240930    clang-15
arm64                 randconfig-003-20240930    clang-15
arm64                 randconfig-004-20240930    clang-15
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240930    clang-15
csky                  randconfig-002-20240930    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240930    clang-15
hexagon               randconfig-002-20240930    clang-15
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240930    clang-18
i386        buildonly-randconfig-001-20240930    gcc-12
i386        buildonly-randconfig-002-20240930    clang-18
i386        buildonly-randconfig-003-20240930    clang-18
i386        buildonly-randconfig-004-20240930    clang-18
i386        buildonly-randconfig-004-20240930    gcc-12
i386        buildonly-randconfig-005-20240930    clang-18
i386        buildonly-randconfig-006-20240930    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240930    clang-18
i386                  randconfig-002-20240930    clang-18
i386                  randconfig-003-20240930    clang-18
i386                  randconfig-003-20240930    gcc-12
i386                  randconfig-004-20240930    clang-18
i386                  randconfig-005-20240930    clang-18
i386                  randconfig-006-20240930    clang-18
i386                  randconfig-011-20240930    clang-18
i386                  randconfig-012-20240930    clang-18
i386                  randconfig-013-20240930    clang-18
i386                  randconfig-013-20240930    gcc-12
i386                  randconfig-014-20240930    clang-18
i386                  randconfig-014-20240930    gcc-12
i386                  randconfig-015-20240930    clang-18
i386                  randconfig-016-20240930    clang-18
i386                  randconfig-016-20240930    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-20
loongarch             randconfig-001-20240930    clang-15
loongarch             randconfig-002-20240930    clang-15
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                            mac_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                       bmips_be_defconfig    gcc-14.1.0
mips                           ci20_defconfig    clang-20
mips                      fuloong2e_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                      pic32mzda_defconfig    gcc-14.1.0
mips                          rb532_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240930    clang-15
nios2                 randconfig-002-20240930    clang-15
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240930    clang-15
parisc                randconfig-002-20240930    clang-15
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc               randconfig-001-20240930    clang-15
powerpc               randconfig-002-20240930    clang-15
powerpc               randconfig-003-20240930    clang-15
powerpc64             randconfig-001-20240930    clang-15
powerpc64             randconfig-002-20240930    clang-15
powerpc64             randconfig-003-20240930    clang-15
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240930    clang-15
riscv                 randconfig-002-20240930    clang-15
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240930    clang-15
s390                  randconfig-002-20240930    clang-15
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.1.0
sh                            hp6xx_defconfig    clang-20
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                    randconfig-001-20240930    clang-15
sh                    randconfig-002-20240930    clang-15
sh                           se7619_defconfig    clang-20
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240930    clang-15
sparc64               randconfig-002-20240930    clang-15
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-20
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.1.0
um                    randconfig-001-20240930    clang-15
um                    randconfig-002-20240930    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240930    gcc-11
x86_64      buildonly-randconfig-002-20240930    gcc-11
x86_64      buildonly-randconfig-003-20240930    gcc-11
x86_64      buildonly-randconfig-004-20240930    gcc-11
x86_64      buildonly-randconfig-005-20240930    gcc-11
x86_64      buildonly-randconfig-006-20240930    gcc-11
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240930    gcc-11
x86_64                randconfig-002-20240930    gcc-11
x86_64                randconfig-003-20240930    gcc-11
x86_64                randconfig-004-20240930    gcc-11
x86_64                randconfig-005-20240930    gcc-11
x86_64                randconfig-006-20240930    gcc-11
x86_64                randconfig-011-20240930    gcc-11
x86_64                randconfig-012-20240930    gcc-11
x86_64                randconfig-013-20240930    gcc-11
x86_64                randconfig-014-20240930    gcc-11
x86_64                randconfig-015-20240930    gcc-11
x86_64                randconfig-016-20240930    gcc-11
x86_64                randconfig-071-20240930    gcc-11
x86_64                randconfig-072-20240930    gcc-11
x86_64                randconfig-073-20240930    gcc-11
x86_64                randconfig-074-20240930    gcc-11
x86_64                randconfig-075-20240930    gcc-11
x86_64                randconfig-076-20240930    gcc-11
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    gcc-14.1.0
xtensa                randconfig-001-20240930    clang-15
xtensa                randconfig-002-20240930    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
